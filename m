Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C35EC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2559.1676489638645177596
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GVbyDC4A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXues097986;
	Wed, 15 Feb 2023 13:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489636;
	bh=f7Bvik0rr/P+RTaYYHGm+/sGQC5WeJ7AK5dcoou5408=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GVbyDC4A+aXEmW43kzhNyWB6ye7t5SQSeabFJz2/AfGWRnhLaVK6V856NlYq+j/xx
	 ck91LYWCDBLH4ZA8ME5Q5FFwhcnigE8UDBoy+9lWAmDtkMneeKgxJo7H+57NzS+9Ls
	 oqPCjkm7EEjouSr2yxAcxhtEcjRa0FFWn5nO71jU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXuta010977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:56 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6f014221;
	Wed, 15 Feb 2023 13:33:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 02/15] trusted-firmware-a: Use new ti-secdev class to sign the images
Date: Wed, 15 Feb 2023 13:33:42 -0600
Message-ID: <20230215193355.9676-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15855

Use the new ti-k3-secdev package to pull in the signing tools if they are
not provided by the environment. This allows us to use these tools
unconditionally. Remove the checks for the script and do the signing
for all K3 machines. The signature is automatically stripped from
the binaries on non-HS devices at boot time as needed so this change
is harmless for GP devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../trusted-firmware-a_%.bbappend             | 39 ++++---------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 5acc5c2e..be601e62 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -6,39 +6,14 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
+# Use TI SECDEV for signing
+inherit ti-secdev
+
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
-# Signing procedure for K3 HS devices
-tfa_sign_k3hs() {
-	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
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
+# Signing procedure for K3 devices
+do_compile:append:k3() {
+	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
+	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
 }
-- 
2.39.1


