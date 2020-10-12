Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.197.1602545490196524209
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 16:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 013A340C24;
	Mon, 12 Oct 2020 23:31:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-LSTj5lQHuk; Mon, 12 Oct 2020 23:31:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4EE540BD9;
	Mon, 12 Oct 2020 23:31:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 80887174296;
	Mon, 12 Oct 2020 19:31:26 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/3] linux-ti-staging: extract common rdepends, pass defconfig_builder.sh via variable
Date: Mon, 12 Oct 2020 19:31:17 -0400
Message-Id: <1602545479-715-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/kernel-rdepends.inc     | 40 +++++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 45 ++--------------------------
 recipes-kernel/linux/setup-defconfig.inc     |  2 +-
 3 files changed, 44 insertions(+), 43 deletions(-)
 create mode 100644 recipes-kernel/linux/kernel-rdepends.inc

diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
new file mode 100644
index 0000000..56dfe4b
--- /dev/null
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -0,0 +1,40 @@
+# Pull in the devicetree files into the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
+
+# Add run-time dependency for PM firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " amx3-cm3"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " amx3-cm3"
+
+# Add run-time dependency for VPE VPDMA firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " vpdma-fw"
+
+# Add run-time dependency for Goodix firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " goodix-fw"
+
+# Install boot-monitor skern file into /boot dir of rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " boot-monitor"
+
+# Install ti-sci-fw into /boot dir of rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " ti-sci-fw"
+
+# Add run-time dependency for SerDes firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " serdes-fw"
+
+# Add run-time dependency for QMSS PDSP firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " qmss-pdsp-fw"
+
+# Add run-time dependency for NETCP PA firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk = " netcp-pa-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
+
+# Add run-time dependency for PRU Ethernet firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
+
+# Add run-time dependency for Cadence MHDP firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 2b4557d..eaf4038 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -1,59 +1,20 @@
 SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
+SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 inherit kernel
 
+DEFCONFIG_BUILDER = "${S}/ti_config_fragments/defconfig_builder.sh"
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
 require recipes-kernel/linux/bundle-devicetree.inc
+require recipes-kernel/linux/kernel-rdepends.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
-# Pull in the devicetree files into the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base += "kernel-devicetree"
-
-# Add run-time dependency for PM firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " amx3-cm3"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " amx3-cm3"
-
-# Add run-time dependency for VPE VPDMA firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " vpdma-fw"
-
-# Add run-time dependency for Goodix firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_dra7xx = " goodix-fw"
-
-# Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " boot-monitor"
-
-# Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " ti-sci-fw"
-
-# Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " serdes-fw"
-
-# Add run-time dependency for QMSS PDSP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_keystone = " qmss-pdsp-fw"
-
-# Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2hk = " netcp-pa-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
-
-# Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
-
-# Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
-
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index dcf2ada..850a1dd 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -28,7 +28,7 @@ do_configure() {
     config=`cat ${B}/.config | grep use-tisdk-config | cut -d= -f2`
     if [ -n "$config" ]
     then
-        ${S}/ti_config_fragments/defconfig_builder.sh -w ${S} -t $config
+        ${DEFCONFIG_BUILDER} -w ${S} -t $config
         oe_runmake -C ${S} O=${B} "$config"_defconfig
     else
         # First, check if pointing to a combined config with config fragments
-- 
2.7.4

