Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90B6C6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:10:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.500.1675897835217856533
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bLrvi6/4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NAWAU106603;
	Wed, 8 Feb 2023 17:10:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675897832;
	bh=5NPqTTZgls7JFRtbnAO3jkl5pYPlrosDoScjpSouqk8=;
	h=From:To:CC:Subject:Date;
	b=bLrvi6/4rl6GBoF/FGm87TCrDYqn7GH1vaU7x0/P8+MbxQ2vZCLnVImF7+LW+P+q4
	 eERM+7tqAgJhMNRhgjXC6iAb6VgG7iqd3qdbVC5uBi3KXKYZvsdgjytmdD+EuM3ZkK
	 RFcYGmMfkG9JaGPj+zap+sD8AFKGCXFX59YnONI0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NAWVX011874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:10:32 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:10:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:10:31 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NAVKd043668;
	Wed, 8 Feb 2023 17:10:31 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/4] trusted-firmware-a: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Date: Wed, 8 Feb 2023 17:10:28 -0600
Message-ID: <20230208231031.16363-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15765

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../trusted-firmware-a_%.bbappend             | 43 ++++++-------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 5acc5c2e..95f1d2d9 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -6,39 +6,20 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
+# Use default package TI SECDEV is one is not provided
+DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+
+# Set a default value for TI_K3_SECDEV_INSTALL_DIR
+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
+include recipes-ti/includes/ti-paths.inc
+TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
-# Signing procedure for K3 HS devices
-tfa_sign_k3hs() {
+# Signing procedure for K3 devices
+do_compile:append:k3() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-	( cd ${BUILD_DIR}; \
-		mv bl31.bin bl31.bin.unsigned; \
-		if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
-			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
-		else \
-			echo "Warning: TI_SECURE_DEV_PKG not set, TF-A not signed."; \
-			cp bl31.bin.unsigned bl31.bin; \
-		fi; \
-	)
-}
-
-do_compile:append:am65xx-hs-evm() {
-	tfa_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-	tfa_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-	tfa_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-	tfa_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-	tfa_sign_k3hs
+	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
+	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
 }
-- 
2.39.1


