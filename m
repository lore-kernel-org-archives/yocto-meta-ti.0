Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE57C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:55:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.57365.1718632545613237657
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 06:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=peRPHuuL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HDtjt0036029
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718632545;
	bh=T80Nyz0RFPfCrb3NAAyanJkgk1kP2Gw//S1d4PZNgzQ=;
	h=From:To:CC:Subject:Date;
	b=peRPHuuLyqUeZZfXFpvoDRX9OaD9EUCsgiJqrQ/EUQRLEcXAusYwuUZdwMnmG8dQx
	 ayjp+R7g1SODy+pMbXXwNfrF1ZiMSucjMBe/Ioz/Zuf85EBy6urlrcaSZGt673U+e7
	 7fKYKcU/nmBF076z4tZhamtI0EMHRTqXzxRLw5FY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HDtjqL010561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:55:45 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 08:55:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 08:55:44 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HDthnr045869;
	Mon, 17 Jun 2024 08:55:44 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2] conf: machine: Update am62xxsip-evm for multi-BSP support
Date: Mon, 17 Jun 2024 19:25:32 +0530
Message-ID: <20240617135532.151410-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 13:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17753

Update am62xxsip-evm machine configuration to support
TI kernel 6.1 & ti-u-boot-2023.04

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v2: In commit message, s/ti-u-boot-2024.04/ti-u-boot-2023.04

 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb     | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc     | 6 ++++++
 4 files changed, 13 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index c35edc6e..55bc530b 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 38fe04c9..8104329e 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 1ad236ce..3453725e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -37,6 +37,7 @@ DM_FW_DIR = "ti-dm/${PLAT_SFX}"
 INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
 
 DM_FW_LIST = ""
 DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index bad8371f..0a52eded 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -37,6 +37,7 @@ DEPENDS:append:k3 = " ti-sci-fw"
 DEPENDS:append:k3r5 = " ti-sci-fw"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
 
 PLAT_SFX = ""
 PLAT_SFX:j721e = "j721e"
@@ -68,8 +69,13 @@ COMPATIBLE_MACHINE = "(ti-soc)"
 
 BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
 
+TI_DM="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE}"
+
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
 
+# Use TI_DM argument only for am62pxx which has two DM firmwares in ti-linux-firmware
+EXTRA_OEMAKE:append:am62pxx = " TI_DM=${TI_DM}"
+
 PROVIDES += "u-boot"
 PKG:${PN} = "u-boot"
 PKG:${PN}-dev = "u-boot-dev"
-- 
2.34.1


