Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71AAC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:10:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.513.1675897833880795054
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fL12NY96;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NAWjn055073;
	Wed, 8 Feb 2023 17:10:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675897832;
	bh=t8NZCgsxAKlv0AqDGKXTxUkSMzji7b7SYbIj/bgAPNI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fL12NY96V5Tza4Pq6qBOK5WPHqaAoFbMWMEzDrF2BSc5hJm9gyhFUxQyKo7ex0VA9
	 zePrWOHAY7BoZMxnhUhmwn1FzBitG/9rnD73gM6mpERQeAYNebRzpjd/rArlxViddP
	 o0TLNzCkwD5FlIu7McjAV7AnI+9zJbAHFAUsRLKk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NAWe4030074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:10:32 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:10:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:10:32 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NAVKe043668;
	Wed, 8 Feb 2023 17:10:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/4] optee-os: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Date: Wed, 8 Feb 2023 17:10:29 -0600
Message-ID: <20230208231031.16363-2-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208231031.16363-1-afd@ti.com>
References: <20230208231031.16363-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15762

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../optee/optee-os_3.16%.bbappend             | 44 +++++--------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 6913851b..5a693247 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,6 +1,14 @@
 PV:ti-soc = "3.19.0+git${SRCPV}"
 SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
 
+# Use default package TI SECDEV is one is not provided
+DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+
+# set a default value for TI_K3_SECDEV_INSTALL_DIR
+export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
+include recipes-ti/includes/ti-paths.inc
+TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
@@ -35,20 +43,6 @@ optee_sign_legacyhs() {
     fi
 }
 
-# Signing procedure for K3 HS devices
-optee_sign_k3hs() {
-    ( cd ${B}/core/; \
-        if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
-            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee-pager_v2.bin tee-pager.bin.signed; \
-        else \
-            echo "Warning: TI_SECURE_DEV_PKG not set, OP-TEE not signed."; \
-            cp tee-pager_v2.bin tee-pager.bin.signed; \
-        fi; \
-        mv tee-pager.bin.signed ${B}/bl32.bin; \
-        cp tee.elf ${B}/bl32.elf; \
-    )
-}
-
 do_compile:append:ti43x() {
     optee_sign_legacyhs
 }
@@ -57,24 +51,10 @@ do_compile:append:dra7xx() {
     optee_sign_legacyhs
 }
 
-do_compile:append:am65xx-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-    optee_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-    optee_sign_k3hs
+# Signing procedure for K3 devices
+do_compile:append:k3() {
+    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
+    cp ${B}/core/tee.elf ${B}/bl32.elf
 }
 
 do_install:append:ti-soc() {
-- 
2.39.1


