Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D669C6FA9D
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2560.1676489639217604368
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DeLdpj+U;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXwDU084063;
	Wed, 15 Feb 2023 13:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489638;
	bh=T44r4O7qnxPCdqQfFK/Md+DFm6Kl4OG9h/LZAJkewHE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DeLdpj+UAXyPM61Vj2kbDlPWeU7qWIlg8PtxCYTTGETMyx7WC81yR5SduhahM1TG5
	 NHOzJHflQoBnB6GRlFkGdCsh/5wSeV+AJpnxGMrsy/z9gGLQ9ZsJpwaZvwxMZL+Wx8
	 jfLRyj/xPIwf1bmOYT2OPunc7WwgeYmm0p9+zbSc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXwJn050856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:58 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:58 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6k014221;
	Wed, 15 Feb 2023 13:33:57 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 07/15] conf: machine: k3: Remove unneeded TI_SECURE_DEV_PKG_K3 assignments
Date: Wed, 15 Feb 2023 13:33:47 -0600
Message-ID: <20230215193355.9676-8-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15861

For K3 machines the SECDEV selection happens in the recipes that use it.
This assignment is therefor no longer needed. Remove it.

Suggested-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass | 4 ++--
 meta-ti-bsp/conf/machine/am335x-hs-evm.conf          | 2 --
 meta-ti-bsp/conf/machine/am437x-hs-evm.conf          | 2 --
 meta-ti-bsp/conf/machine/am57xx-hs-evm.conf          | 2 --
 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf   | 2 --
 meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf          | 2 --
 meta-ti-bsp/conf/machine/include/k3.inc              | 2 --
 meta-ti-bsp/conf/machine/include/k3r5.inc            | 2 --
 8 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
index 69fa0ed2..5e1fa56a 100644
--- a/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot uboot-sign-legacyhs
+inherit ti-secdev kernel-uboot uboot-sign-legacyhs
 
 FITIMAGE_HASH_ALGO ?= "sha1"
 FITIMAGE_PACK_TEE ?= "0"
@@ -51,7 +51,7 @@ python __anonymous () {
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 
 fitimage_ti_secure() {
-	if test -n "${TI_SECURE_DEV_PKG}"; then
+	if test -f "${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh"; then
 		export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh $1 $2
 	else
diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
index 670a584c..ca102961 100644
--- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
@@ -15,8 +15,6 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
-
 # FIT image for legacy secure devices
 KERNEL_CLASSES += " kernel-fitimage-legacyhs"
 KERNEL_IMAGETYPES += " fitImage"
diff --git a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
index bcea9acb..632b4995 100644
--- a/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-hs-evm.conf
@@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
-
 OPTEEMACHINE = "ti-am43xx"
 OPTEEFLAVOR = "am43xx"
 
diff --git a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
index 0f157829..4f36a847 100644
--- a/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-hs-evm.conf
@@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
-
 OPTEEMACHINE = "ti-am57xx"
 OPTEEFLAVOR = "am57xx"
 OPTEEPAGER = "y"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index 21b8702b..7c99b5d4 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -18,5 +18,3 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG_K3 = "none"
diff --git a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
index 02eaf9ee..8e57a154 100644
--- a/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf
@@ -11,8 +11,6 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
-
 OPTEEMACHINE = "ti-dra7xx"
 OPTEEFLAVOR = "dra7xx"
 OPTEEPAGER = "y"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index a34b67ff..3b59645b 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -48,5 +48,3 @@ MACHINE_FEATURES += "efi"
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 31646f5a..d000404e 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -22,5 +22,3 @@ UBOOT_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
 
 PACKAGECONFIG:pn-u-boot-ti-staging = ""
 PACKAGECONFIG:pn-u-boot-ti-mainline = ""
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.39.1


