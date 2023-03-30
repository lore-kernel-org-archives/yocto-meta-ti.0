Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FB3C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:24:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.39182.1680211482818647504
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZdMrpnLV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOeW4033951;
	Thu, 30 Mar 2023 16:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680211480;
	bh=Vyv2f0FGiQPHuVIAOcsClNwTcbOLx84/SrTktJuZ/vI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZdMrpnLVR1XKmhVUqk1lTtxbXI3ugir8XeQ5497xgsIOENCwr4eMncI5OKRuv2GJX
	 D75v4DShAKPccqAZD16I6REDF1kPTiiMnUUVcKzXoWyBvuFgd2unO2859bIaD4MS7T
	 tnhHLBIUcpaD1+65Vy4y324a9+if2Yby+UAO6EzY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULOeZS019259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:24:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:24:40 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOeux051350;
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phzlA-00054P-DO; Thu, 30 Mar 2023 16:24:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/4] trusted-firmware-a: Only sign files for platforms that support it
Date: Thu, 30 Mar 2023 16:24:38 -0500
Message-ID: <20230330212440.19437-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330212440.19437-1-reatmon@ti.com>
References: <20230330212440.19437-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16261

We are seeing some testing issues where the new code that signs all of
the files at all times is causing issues.  So rollback the logic and
only sign for platforms that support it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../trusted-firmware-a_%.bbappend             | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 9b8dd142..c65ecd9c 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -12,12 +12,48 @@ inherit ti-secdev
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
-# Signing procedure for K3 devices
-do_compile:append:k3() {
+# Signing procedure for K3 HS devices
+tfa_sign_k3hs() {
 	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
 	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
 }
 
+do_compile:append:am65xx-hs-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:am64xx-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:am62xx-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:am62xx-lp-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:am62axx-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:j721e-hs-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:j7200-hs-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:j721s2-hs-evm() {
+    tfa_sign_k3hs
+}
+
+do_compile:append:j784s4-hs-evm() {
+    tfa_sign_k3hs
+}
+
 do_install:append:k3() {
     if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
         echo "Install bl31.bin.unsigned"
-- 
2.17.1


