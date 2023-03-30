Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA1C77B6E
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:24:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39255.1680211482936443519
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fiYWUH6/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOef0029407;
	Thu, 30 Mar 2023 16:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680211481;
	bh=LXofhxJ2POTTwA8hz9Mqs6qCclWqY3hv7dlBW7X3HAU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fiYWUH6/Dx3wU/CjilZgfrGecTSeVWW9ZAdLETTWuUvkhz6LeZkJr/u5Pb7w/csAZ
	 X8n+XBLNfV2uXLIliEYuHCpB7ACOziq2oHhpuXWAAIaMIz4EnmbuLmNTNSTc1rI0Wd
	 biRe3ZlHsdvpwlD7Ngv3V2lSSFavt1hOLVVcJhqQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULOeKw112948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:24:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:24:40 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULOew7015954;
	Thu, 30 Mar 2023 16:24:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phzlA-00054V-HH; Thu, 30 Mar 2023 16:24:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 3/4] optee-os: Only sign files for platforms that support it
Date: Thu, 30 Mar 2023 16:24:39 -0500
Message-ID: <20230330212440.19437-4-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16260

We are seeing some testing issues where the new code that signs all of
the files at all times is causing issues.  So rollback the logic and
only sign for platforms that support it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../optee/optee-os_3.16%.bbappend             | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index a3fef348..e61ebcc7 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -9,6 +9,12 @@ EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') i
 EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
 
+do_compile:append:k3() {
+    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
+    cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
+    cp ${B}/core/tee.elf ${B}/bl32.elf
+}
+
 # Signing procedure for legacy HS devices
 optee_sign_legacyhs() {
     ( cd ${B}/core/; \
@@ -37,12 +43,48 @@ do_compile:append:dra7xx() {
 }
 
 # Signing procedure for K3 devices
-do_compile:append:k3() {
+optee_sign_k3hs() {
     ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
     cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin.unsigned
     cp ${B}/core/tee.elf ${B}/bl32.elf
 }
 
+do_compile:append:am65xx-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:am64xx-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:am62xx-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:am62xx-lp-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:am62axx-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:j721e-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:j7200-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:j721s2-hs-evm() {
+    optee_sign_k3hs
+}
+
+do_compile:append:j784s4-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install:append:ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-- 
2.17.1


