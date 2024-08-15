Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F669C52D7D
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 12:48:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.122417.1723726128381772589
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Aug 2024 05:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ci8P/9gh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47FCml5d047686;
	Thu, 15 Aug 2024 07:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723726127;
	bh=TRcbKkGc2+SSNJokI5AG1uRj2Q0QQLkiUo52MhnUsiM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ci8P/9ghYasJrhFMD/PAwroyTfsTUjcVqDtqbHUvSEdFdO6jwnZ3YlAMRtETYoXjo
	 HdNPOlqXLNeWRiCOKucCF7gBGooEJ2Wd9NU5k+thw0+DHWsRA2GwFnwaGZGq5UYaz/
	 fKJ2PvPEL0qzY02A1LrQPKlolV94Uep3buQiop10=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47FCmlWQ032749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Aug 2024 07:48:47 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Aug 2024 07:48:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Aug 2024 07:48:46 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47FCmlrg062621;
	Thu, 15 Aug 2024 07:48:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1seZuI-0007hJ-T7; Thu, 15 Aug 2024 07:48:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][RFC 2/2] conf: machine: Move to new UBOOT_FRAGMENTS
Date: Thu, 15 Aug 2024 07:48:46 -0500
Message-ID: <20240815124846.29535-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240815124846.29535-1-reatmon@ti.com>
References: <20240815124846.29535-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Aug 2024 12:48:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17941

Migrate the machine configs to use the new UBOOT_FRAGMENTS methodology.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf          | 9 ++-------
 meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf  | 8 ++++++++
 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf   | 2 --
 meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf | 4 ++--
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf      | 4 ++--
 meta-ti-bsp/conf/machine/beagleplay-k3r5.conf      | 6 +++---
 meta-ti-bsp/conf/machine/beagleplay.conf           | 6 +++---
 7 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 676e64a4..7aff3414 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -22,11 +22,6 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 
-# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
-# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
-# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
-# For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
-# Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
-UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
+UBOOT_FRAGMENTS:bsp-ti-6_1 = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
index 7d65e6af..6a8f2760 100644
--- a/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
@@ -18,3 +18,11 @@ UBOOT_CONFIG:bsp-ti-6_1 ??= "evm"
 UBOOT_CONFIG[sip] = "am62xsip_evm_r5_defconfig"
 UBOOT_CONFIG[lpsk] = "am62x_lpsk_r5_defconfig"
 UBOOT_CONFIG[evm] = "am62x_evm_r5_defconfig"
+
+UBOOT_FRAGMENTS_CONFIG_SIP = ""
+UBOOT_FRAGMENTS_CONFIG_SIP:bsp-ti-6_1 = "am62xsip_sk_r5"
+
+UBOOT_FRAGMENTS_CONFIG[sip] = "${UBOOT_FRAGMENTS_CONFIG_SIP}"
+UBOOT_FRAGMENTS_CONFIG[lpsk] = ""
+UBOOT_FRAGMENTS_CONFIG[evm] = ""
+
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index ab538ff3..990675be 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,5 +9,3 @@ UBOOT_CONFIG = "sip"
 UBOOT_CONFIG:bsp-ti-6_1 = ""
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
-
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
index d415a212..3361e85a 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
@@ -19,5 +19,5 @@ UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "j721e_beagleboneai64_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_r5.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_r5.config"
+UBOOT_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_r5.config"
+UBOOT_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 56e1ed4e..0eaae980 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -12,8 +12,8 @@ IMAGE_SR2_HS_SE_FILES:bsp-bb_org = ""
 UBOOT_MACHINE = "j721e_evm_a72_config"
 UBOOT_MACHINE:bsp-ti-6_6 = "j721e_beagleboneai64_a72_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_a72.config"
+UBOOT_FRAGMENTS:bsp-ti-6_1 = "j721e_beagleboneai64_a72.config"
+UBOOT_FRAGMENTS:bsp-bb_org = "j721e_beagleboneai64_a72.config"
 
 SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
index 338a6fbf..11fc6d29 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
@@ -11,6 +11,6 @@ SYSFW_SUFFIX = "gp"
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
+UBOOT_FRAGMENTS:bsp-bb_org = "am625_beagleplay_r5.config"
+UBOOT_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
+UBOOT_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index d420c6c7..883ef538 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -20,9 +20,9 @@ OPTEEMACHINE = "k3-am62x"
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
 
-UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
-UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
+UBOOT_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
+UBOOT_FRAGMENTS:bsp-bb_org = "am625_beagleplay_a53.config"
+UBOOT_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
 
 SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
 SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
-- 
2.17.1


