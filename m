Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FA2C64ED8
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2565.1676489639100255982
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tzdmv7SF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXv1M094836;
	Wed, 15 Feb 2023 13:33:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489637;
	bh=34X6KnruzJki9UUPFmvx+4WeUtx9b1bNMIpcTBd67a0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tzdmv7SFNgY9cXLM9lj40K5hNRcFEz45rd6VCM3NcCVP6Ze2LMSrnN7ESOoDYpcb5
	 V2y0TXmlUJzNqZV7KwQN3cVwH9U99NyuqStGcyDKIP6aZF0b0LPkGTQP+5rEXph+z8
	 vkA+g5rbeWVlrOO6zFcTibDHRHcow+R3dPNXKoCY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXvlB016202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:57 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:56 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6g014221;
	Wed, 15 Feb 2023 13:33:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 03/15] optee-os: Use new ti-secdev class to sign the images
Date: Wed, 15 Feb 2023 13:33:43 -0600
Message-ID: <20230215193355.9676-4-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15860

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../optee/optee-os_3.16%.bbappend             | 43 +++----------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 6913851b..1e0072ef 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -1,14 +1,13 @@
 PV:ti-soc = "3.19.0+git${SRCPV}"
 SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
 
+# Use TI SECDEV for signing
+inherit ti-secdev
+
 EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 
 EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
 
-do_compile:prepend:ti-soc() {
-    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-}
-
 do_compile:append:k3() {
     ( cd ${B}/core/; \
         cp tee-pager_v2.bin ${B}/bl32.bin; \
@@ -35,20 +34,6 @@ optee_sign_legacyhs() {
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
@@ -57,24 +42,10 @@ do_compile:append:dra7xx() {
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


