Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5048.1575947269832338534
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2019 19:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B85FE011C8; Mon,  9 Dec 2019 19:07:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B4C1E01126
	for <meta-ti@yoctoproject.org>; Mon,  9 Dec 2019 19:07:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF66F40BF3;
	Tue, 10 Dec 2019 03:07:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPbueoGbP2jT; Tue, 10 Dec 2019 03:07:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB4D7409DE;
	Tue, 10 Dec 2019 03:07:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6CDE9174348;
	Mon,  9 Dec 2019 22:07:46 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [thud/master][PATCH] prueth-fw,linux-ti-staging: allow packaging PRU ETH for GP and HS devices
Date: Mon,  9 Dec 2019 22:07:44 -0500
Message-Id: <1575947264-32270-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_git.bb        | 13 +++++++------
 recipes-kernel/linux/linux-ti-staging_4.19.bb |  7 ++++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 14518e1..f7718ad 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -12,25 +12,26 @@ TI_PDK_COMP = "ti.drv.icss_emac.firmware"
 
 B = "${S}/icss_dualemac"
 
-COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
+COMPATIBLE_MACHINE = "am57xx-evm|am57xx-hs-evm|ti43x|ti33x|k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "ti-cgt-pru-native"
 
 PRU_VERSION = ""
-PRU_VERSION_am335x-evm = "REV1"
-PRU_VERSION_am437x-evm = "REV1"
+PRU_VERSION_ti33x = "REV1"
+PRU_VERSION_ti43x = "REV1"
 PRU_VERSION_am57xx-evm = "REV2"
+PRU_VERSION_am57xx-hs-evm = "REV2"
 PRU_VERSION_k2g = "REV2"
 
 FW_PREFIX = ""
-FW_PREFIX_am335x-evm = "am335x"
-FW_PREFIX_am437x-evm = "am437x"
+FW_PREFIX_ti33x = "am335x"
+FW_PREFIX_ti43x = "am437x"
 FW_PREFIX_am57xx-evm = "am57xx"
+FW_PREFIX_am57xx-hs-evm = "am57xx"
 FW_PREFIX_k2g = "k2g"
 
-
 EXTRA_OEMAKE += "CL_PRU_INSTALL_PATH="${TI_CGT_PRU_INSTALL_DIR}" PRU_VERSION_LIST="${PRU_VERSION}""
 
 do_install() {
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 852bfa9..32d4b49 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -45,10 +45,11 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am437x-evm = " prueth-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am335x-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
-- 
2.7.4

