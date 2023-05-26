Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6049BC77B7C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 20:14:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3702.1685132057731858436
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 13:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WLBU+pC8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34QKEGZC093314;
	Fri, 26 May 2023 15:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685132056;
	bh=oHCquXJc3s4MEeHIxpnp0zYnrMfFbP1RqFnilpB0A2A=;
	h=From:To:CC:Subject:Date;
	b=WLBU+pC8ETOw7tMv/vybmuRydwH2PeVjnpthri0GoOlVL89bpZgK416Pn7PjB1YUx
	 yU3jWgVKdqKc4bzsF2AY+7aZknEihKUYS7P8P28GPM+QY6WGuO7DNYbsFDgdDowzOA
	 A5x3FN2IiHvmNtvmOv/HZ6c3for8fjGad/B8Y7mU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34QKEGjU009308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 15:14:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 15:14:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 15:14:16 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34QKEFNg058314;
	Fri, 26 May 2023 15:14:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/3] trusted-firmware-a: Do not sign TF-A image for K3
Date: Fri, 26 May 2023 15:14:12 -0500
Message-ID: <20230526201414.466752-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 20:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16610

U-Boot with binman will do the signing as these images are packaged.
Remove signing steps here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../trusted-firmware-a-ti.inc                 | 57 -------------------
 1 file changed, 57 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index c65ecd9c..cc99f50c 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -6,62 +6,5 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
-# Use TI SECDEV for signing
-inherit ti-secdev
-
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
-
-# Signing procedure for K3 HS devices
-tfa_sign_k3hs() {
-	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
-	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
-}
-
-do_compile:append:am65xx-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62xx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62xx-lp-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62axx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j784s4-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_install:append:k3() {
-    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
-        echo "Install bl31.bin.unsigned"
-        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
-        ${D}/firmware/bl31.bin.unsigned
-    else
-        echo "Install bl31.bin.unsigned"
-        install -m 0644 ${BUILD_DIR}/bl31.bin \
-        ${D}/firmware/bl31.bin.unsigned
-    fi
-}
-- 
2.39.2


