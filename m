Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1192.1635795195349625575
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 73FA840C87
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZI91HYqrMl1 for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EDDE40C79
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 21FCE1746B2
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 09/22] ti-linux-fw: Support common inc for all firmware
Date: Mon,  1 Nov 2021 15:32:59 -0400
Message-Id: <1635795192-43144-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Change to support common INC for all firmware
This will help with:
1) Eliminating requirement to change multiple recipes for firmware
update
2) This will help support AUTOREV

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 11 +++---
 recipes-bsp/goodix-fw/goodix-fw_git.bb             | 11 +++---
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         | 12 ++-----
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb         | 12 ++-----
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 11 ++----
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 11 ++----
 recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb          | 10 ++----
 recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb         | 10 ++----
 recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb         | 10 ++----
 recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb             | 10 ++----
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb       | 11 +++---
 recipes-bsp/serdes-fw/serdes-fw_git.bb             | 10 +++---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 41 ++++++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb      |  2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc                | 32 -----------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb             |  4 +--
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb         |  2 +-
 17 files changed, 81 insertions(+), 129 deletions(-)
 create mode 100644 recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 delete mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw.inc

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index ccaa3e6..c975e8a 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -1,10 +1,12 @@
 SUMMARY = "Cadence MHDP DP bridge firmware"
 
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
 LICENSE = "BSD-3-Clause | Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
 
-PV = "1.2.17"
-PR = "r0"
+PV = "${CADENCE_MHDP_FW_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "j7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "7bad9a69a343e01056ece5ce6da4d4060c42f6bc"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 TARGET = "mhdp8546.bin"
 
diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw/goodix-fw_git.bb
index 5131f8d..1f1c2b8 100644
--- a/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "Goodix GT9271 config firmware"
 
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684daf27c852"
 
-PV = "1.0.0.0"
-PR = "r0"
+PV = "${GOODIX_FW_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f1a8d1d0131f83bd1a775cde7075eb67c070892c"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
 TARGET = "goodix_9271_cfg.bin"
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 20f0596..2a5bfb9 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "NETCP PA firmware for Keystone"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PV = "3.0.2.3"
-PR = "r1"
+PV = "${NETCP_PA_FW_VERSION}"
+PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "953ab647b0b6af411965242ecd919b1cb0e570d6"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 FWBASENAME = " \
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
index 9d1ffe3..ec3c30f 100644
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "NETCP SA firmware for Keystone"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PV = "1.0.0"
-PR = "r0"
+PV = "${NETCP_SA_FW_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = "sa_mci.fw"
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 6074674..e398cc8 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -1,9 +1,9 @@
 SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PV = "02.02.09.03"
+PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -11,11 +11,6 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f3d2c7cafc906adc9a2f4543aa2fee556483545d"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = " \
diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index f688fb7..804a563 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -1,9 +1,9 @@
 SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PV = "08.00.00.20"
+PV = "${PRUETH_FW_AM65X_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -11,11 +11,6 @@ COMPATIBLE_MACHINE = "am65xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "517b0cd8d8d80e91f1f7d80f035e6af041c39726"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = " \
diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index fc66dc6..4ca06be 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -1,9 +1,8 @@
 SUMMARY = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -11,11 +10,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "11fecaf08eeed27f2a834c9911edb8a5fb2a23b1"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = ""
diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 397af8f..618b1ad 100644
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -1,10 +1,9 @@
 SUMMARY = "PRU HSR firmware for AM335x/AM437x/AM57xx"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PE = "1"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = ""
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index cf22c0b..707640b 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -1,10 +1,9 @@
 SUMMARY = "PRU PRP firmware for AM335x/AM437x/AM57xx"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PE = "1"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +11,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = ""
diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index e610017..3ded0dc 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -1,9 +1,8 @@
 SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -11,11 +10,6 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "dccfb2328354be2933a5a179b528ec8a18b92d3a"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 
 TARGET = ""
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
index ac03048..6ab26e6 100644
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "QMSS PDSP firmware"
 
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "1.0.0.9"
-PR = "r1"
+PV = "${QMSS_PDSP_FW_VERSION}"
+PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
@@ -12,11 +14,6 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 ORIGIN = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin"
 TARGET = "ks2_qmss_pdsp_acc48.bin"
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
index 7d42494..6f79c64 100644
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
@@ -1,9 +1,12 @@
 DESCRIPTION = "SerDes firmware for Keystone PCIe and 1/10GigE"
 
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "3.3.0.2c"
+PV = "${SERDES_FW_VERSION}"
+PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
@@ -11,11 +14,6 @@ COMPATIBLE_MACHINE = "keystone"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "8d861bd8f8f792df60b6873989ff208766fbebae"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
 S = "${WORKDIR}/git"
 TARGET = "ks2_pcie_serdes.bin ks2_gbe_serdes.bin ks2_xgbe_serdes.bin"
 
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
new file mode 100644
index 0000000..8d827bd
--- /dev/null
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -0,0 +1,41 @@
+SUMMARY = "TI SCI firmware (SYSFW)"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "2021.05"
+INC_PR = "r1"
+
+# Firmware versions
+CORESDK_RTOS_VERSION = "08.00.00.32"
+SERDES_FW_VERSION = "3.3.0.2c"
+NETCP_SA_FW_VERSION = "1.0.0"
+NETCP_PA_FW_VERSION = "3.0.2.3"
+QMSS_PDSP_FW_VERSION = "1.0.0.9"
+PRUETH_FW_AM65X_VERSION = "08.00.00.20"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.03"
+GOODIX_FW_VERSION = "1.0.0.0"
+CADENCE_MHDP_FW_VERSION = "1.2.17"
+
+SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
+BRANCH ?= "ti-linux-firmware"
+SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
+SRCREV_FORMAT = "imggen"
+
+SRC_URI = " \
+	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+"
+
+# This is a protection in case the definition is not present in other distros.
+ARAGO_BRAND ?= ""
+
+# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
+# in K3-Imagegen
+SRC_URI += "\
+	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
+	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
+	', '', d)} \
+"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
index c8f830f..bab4acf 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
@@ -2,7 +2,7 @@
 # Let's take a page from gcc-source as a common recipe for all gcc stages,
 # but also to provide a single package for MAINMACHINE of all multiconfigs
 
-require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 SUMMARY += "- sources"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
deleted file mode 100644
index 9ce9f6c..0000000
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "TI SCI firmware (SYSFW)"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
-
-PV = "2021.05"
-INC_PR = "r0"
-# RTOS firmware version
-CORESDK_RTOS_VERSION = "08.00.00.32"
-
-SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
-BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
-SRCREV_FORMAT = "imggen"
-
-SRC_URI = " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
-"
-
-# This is a protection in case the definition is not present in other distros.
-ARAGO_BRAND ?= ""
-
-# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
-# in K3-Imagegen
-SRC_URI += "\
-	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
-	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
-	', '', d)} \
-"
-
-S = "${WORKDIR}/git"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1e1f457..a51f322 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,11 +1,11 @@
-require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS:append:j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
-PR = "r1"
+PR = "${INC_PR}.0"
 
 # Loaded by R5F core
 COMPATIBLE_MACHINE = "k3r5"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 186cb11..079be84 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,7 +19,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 
 FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
-require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 CORESDK_RTOS_VERSION ?= "08.00.00.26"
 PV = "${CORESDK_RTOS_VERSION}"
-- 
2.7.4

