Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF80C7EE39
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:51 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22880.1750874811592787290
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BXGyzqaj;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6orv1524241;
	Wed, 25 Jun 2025 13:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874810;
	bh=/4wnw9kMGzQfx21h2GadIDEgbrxzKVXgMEOD0Jwl6Bw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BXGyzqajqzAjQVqPOyET/54xBMlz+Sj0hbsRjm2XhjbF+KFPdnt9x3x4v21YR7sVS
	 sH/yeBdA7uRW4y3ayh9VFGxCocPOcsxHkAznZfjqnOOfer43MgpIgyD4uEeaiEPdY6
	 YJ46tttkB01Dy5B7ET73DlHtb686DXLNiHJgH5cw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6o0H1487430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6oh73811408;
	Wed, 25 Jun 2025 13:06:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUWI-0004eM-AH; Wed, 25 Jun 2025 13:06:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/7] meta-ti/all: remove S in recipes that fetch from git via setting BB_GIT_DEFAULT_DESTSUFFIX
Date: Wed, 25 Jun 2025 13:06:46 -0500
Message-ID: <20250625180650.17820-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180650.17820-1-reatmon@ti.com>
References: <20250625180650.17820-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18678

Removing all the S = ${WORKDIR}/git assignments works because BB_GIT_DEFAULT_DESTSUFFIX
is set to match S from bitbake.conf (which itself is set to match typical tarball
releases).

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb        | 2 --
 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     | 2 --
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb        | 2 --
 .../powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb        | 2 --
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb  | 2 --
 .../recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb | 2 --
 .../recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb  | 2 --
 .../recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb  | 2 --
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc            | 2 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                   | 2 --
 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb             | 2 --
 .../recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb       | 2 --
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb              | 2 --
 meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 2 --
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb           | 2 --
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb           | 2 --
 .../powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb         | 3 +--
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb               | 2 --
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                          | 2 --
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb              | 2 --
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc                   | 2 --
 meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb              | 2 --
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                  | 2 --
 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb          | 2 --
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb            | 2 --
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                 | 2 --
 meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb   | 2 --
 .../cc33xx-target-scripts/cc33xx-target-scripts_git.bb         | 2 --
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb       | 2 --
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb               | 2 --
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb       | 2 --
 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb  | 1 -
 .../recipes-ti/beagleboard/beaglebone-getting-started.bb       | 2 --
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc                    | 2 --
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc           | 1 -
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc                  | 2 --
 meta-ti-extras/recipes-ti/swtools/swtools_git.bb               | 1 -
 37 files changed, 1 insertion(+), 71 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 099678b2..db080c62 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -11,8 +11,6 @@ BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 do_compile() {
 	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc -std=gnu11 ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS} ${DEBUG_PREFIX_MAP}"
 }
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 95ba1e2d..4e379c5d 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -13,8 +13,6 @@ SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
 
 SRC_URI = "git://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 CPSW9G_FW_DIR = "${S}/ethfw"
 CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server_pdk_mem_map_strip.xer5f"
 
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index dc55ef9b..0d39571b 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -17,8 +17,6 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 SRCREV = "c838bc06a163abad46dcc193c8fb9a4fb9e2e356"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
index 513429bd..ddb401a5 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -17,8 +17,6 @@ BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 8a4a04ae..f5cea270 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -17,8 +17,6 @@ BRANCH = "${PV}/mesa/k6.1"
 
 SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
 
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index 9a3b6bfd..e5cd0d49 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -18,6 +18,4 @@ SRCREV = "038d9263c67900ea4eff631820b088a3dc3a6ad5"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 29af4863..133876df 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -16,5 +16,3 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/viddec-test-app.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index b674c764..41b4d2e4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -16,5 +16,3 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/videnc-test-app.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 1c210471..7e76ded0 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -30,8 +30,6 @@ TI_LINUX_FW_GIT_BRANCH ?= "branch=${BRANCH}"
 
 SRC_URI = "${TI_LINUX_FW_GIT_URI};protocol=${TI_LINUX_FW_GIT_PROTOCOL};${TI_LINUX_FW_GIT_BRANCH}"
 
-S = "${WORKDIR}/git"
-
 CLEANBROKEN = "1"
 
 # Make sure that lib/firmware, and all its contents are part of the package
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 3e1f6d91..660ac557 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -98,8 +98,6 @@ PKG:${PN} = "u-boot"
 PKG:${PN}-dev = "u-boot-dev"
 PKG:${PN}-dbg = "u-boot-dbg"
 
-S = "${WORKDIR}/git"
-
 # Support for secure devices - detailed info is in doc/README.ti-secure
 inherit ti-secdev
 
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 274cc735..d48adea5 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -16,8 +16,6 @@ BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 
 # The test application needs additional include headers from the kernel
diff --git a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
index 3aa69700..c7287e1f 100644
--- a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
@@ -23,8 +23,6 @@ SRCREV = "ef5aec48e589902839ebae7ad753c68cf498c15f"
 PV = "3.6.0"
 #PR = "r1"
 
-S = "${WORKDIR}/git"
-
 FW_PLAT = ""
 FW_PLAT:am62xx = "am62"
 FW_PLAT:am64xx = "am64"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 8691e523..ffc48d84 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -13,5 +13,3 @@ BRANCH ?= "master"
 SRCREV = "ea9938bf9cafd9c0cb05ef060a713ab4ac72270f"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 636ed359..bd7cf015 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -34,8 +34,6 @@ TARGET_PRODUCT = "jacinto6evm"
 
 PR = "r3"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir}"
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index cdf3cd83..2f160141 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,8 +23,6 @@ SRC_URI = " \
     file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
 "
 
-S = "${WORKDIR}/git"
-
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 1697dc80..e4f99d36 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -21,8 +21,6 @@ SRC_URI = " \
     file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
 "
 
-S = "${WORKDIR}/git"
-
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
index 57f48fec..949c2d5d 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
 HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
@@ -11,7 +11,6 @@ PR = "r4"
 BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
-S = "${WORKDIR}/git"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index b260abdf..84a9afcf 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -44,8 +44,6 @@ RDEPENDS:${PN} += "libdrm"
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
 
-S = "${WORKDIR}/git"
-
 EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
 
 do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index c6dfc517..375de8bf 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -17,5 +17,3 @@ SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};na
 SRCREV = "${TI_IPC_SRCREV}"
 
 CFLAGS += "-fcommon"
-
-S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 5dd3d6c7..8a78d9ac 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
 SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
 SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
 
-S = "${WORKDIR}/git"
-
 inherit cmake
 
 DEPENDS = "ti-rpmsg-char"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 4aa16b58..0350152d 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -12,6 +12,4 @@ SRCREV = "09b064c6663ed46e4a402291dd87c8fe96135bd7"
 
 PV = "0.6.9+git"
 
-S = "${WORKDIR}/git"
-
 COMPATIBLE_MACHINE = "^(k3)$"
diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
index 543868a4..bf8e0d00 100644
--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -20,8 +20,6 @@ GIT_SRCREV = "ed6951fd3877c6cac7f1237311f7278ac21634f3"
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
 SRCREV = "${GIT_SRCREV}"
 
-S = "${WORKDIR}/git"
-
 do_install() {
     CP_ARGS="-Prf --preserve=mode,links,timestamps --no-preserve=ownership"
     install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
index cb968f98..0d856362 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -10,8 +10,6 @@ SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/ti-bt/service-packs.git;protocol=https;branch=${BRANCH}"
 
-S = "${WORKDIR}/git"
-
 do_compile() {
     :
 }
diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
index 9f1de766..d5597ab9 100644
--- a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -9,8 +9,6 @@ PV = "1.7.0.120"
 
 CLEANBROKEN = "1"
 
-S = "${WORKDIR}/git"
-
 do_compile[no_exec] = "1"
 
 EXTRA_OEMAKE = "DEST_DIR=${D} BASE_LIB_DIR=${nonarch_base_libdir}"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 09926109..bfdf1ac5 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https;branch=master"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
-S = "${WORKDIR}/git"
-
 PV = "3.00.15.00"
 PR = "r7"
 
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index 24c3c8e6..73b582a2 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -29,8 +29,6 @@ RDEPENDS:${PN}:append = " \
 
 DEPENDS = "ti-cgt-pru-native"
 
-S = "${WORKDIR}/git"
-
 export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
 export PRU_SSP = "${S}"
 
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index d58c940f..3e61db88 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch
 SRCREV = "5ec05007f2662f460f881c5868311fd3ab7e6e71"
 BRANCH = "master"
 
-S = "${WORKDIR}/git"
-
 CLEANBROKEN = "1"
 
 do_compile() {
diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb
index 87f75653..e3fe6f80 100644
--- a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb
+++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=904443cf7fae5c09c3d5f83f8557c265"
 SRCREV = "4371c93ea01b339f6f73f77d6d6bfcc185def8c0"
 SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-target-scripts.git;protocol=https;branch=master"
 
-S = "${WORKDIR}/git"
-
 FILES:${PN} += "${datadir}/cc33xx/"
 
 do_install() {
diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index 81d0e24a..707f7c77 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -10,8 +10,6 @@ inherit update-rc.d
 SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
 SRC_URI = "git://git.ti.com/git/ti-bt/uim.git;branch=master;protocol=https"
 
-S = "${WORKDIR}/git"
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 uim ${D}${bindir}
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index f68fab7f..fac0524e 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -11,8 +11,6 @@ SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=master;pro
            file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch \
           "
 
-S = "${WORKDIR}/git"
-
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 EXTRA_OEMAKE = "CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3/ -DCONFIG_LIBNL32 " \
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
index b065d649..e3ea98aa 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
@@ -11,8 +11,6 @@ file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
 
 PR = "r1"
 
-S = "${WORKDIR}/git"
-
 FILES:${PN} += "${datadir}/wl18xx/"
 
 do_install() {
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index a31fe20d..2ae44086 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master
 
 SRCREV = "182aea18596eb2b3a82cffc536a6404f5000fb30"
 
-S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
 
 COMPATIBLE_HOST ?= "null"
diff --git a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
index 85ab861d..8ad75f26 100644
--- a/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
+++ b/meta-ti-extras/recipes-ti/beagleboard/beaglebone-getting-started.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6f02761e31334c48f7021fb94c89aaa"
 SRCREV = "05bedba192646152b7bc80b0accaea75aef864e5"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git;protocol=https;branch=master"
 
-S = "${WORKDIR}/git"
-
 do_install() {
 	install -d ${D}${datadir}/${PN}
 	cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/${PN}
diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
index cabd2a9d..566dab0a 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -13,8 +13,6 @@ DEPENDS = "ti-cgt6x-native \
            doxygen-native \
            swtools"
 
-S = "${WORKDIR}/git"
-
 DSPLIB_GIT_BRANCH = "master"
 DSPLIB_GIT_PROTOCOL = "https"
 DSPLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/dsplib.git"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index fd40d74d..e8374201 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -43,7 +43,6 @@ export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-S = "${WORKDIR}/git"
 B = "${S}"
 
 DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
index fb9de41d..ae70cc37 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -13,8 +13,6 @@ DEPENDS = "ti-cgt6x-native \
            doxygen-native \
            swtools"
 
-S = "${WORKDIR}/git"
-
 MATHLIB_GIT_BRANCH = "master"
 MATHLIB_GIT_PROTOCOL = "https"
 MATHLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/mathlib.git"
diff --git a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
index 4bcd6754..82de2040 100644
--- a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
+++ b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
@@ -12,7 +12,6 @@ DEPENDS = "ti-cgt6x-native \
 
 PV = "5_0_8"
 PR = "r3"
-S = "${WORKDIR}/git"
 
 SWTOOLS_GIT_BRANCH = "master"
 SWTOOLS_GIT_PROTOCOL = "https"
-- 
2.17.1


