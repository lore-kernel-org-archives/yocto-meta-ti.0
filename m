Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FE8C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:38:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.606.1654533516545771954
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 09:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=er83BvAG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 256GcW7m103665;
	Mon, 6 Jun 2022 11:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654533512;
	bh=1/wRtb4Z8EX8D9tbStimQ+l1uPK+OL08i9BLRjHvywQ=;
	h=From:To:CC:Subject:Date;
	b=er83BvAG9f2lJNTRHSNOGFO/dQjBDngETS+AW2Rszfr0WXdlOyGXzKX41N5fmEmhn
	 1COJZQifU07bXMn0u2Qf1Wk22+7rEaeKUN28NzgbhPfcE/LnkXzVBktjXikuxQzGJa
	 2wbdWmuitVNSTs0xVEOMd9DVoLe2S0Nu/+jI8DUU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 256GcW3F065831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jun 2022 11:38:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Jun 2022 11:38:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Jun 2022 11:38:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 256GcVlv026934;
	Mon, 6 Jun 2022 11:38:31 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon <nm@ti.com>
Subject: [master PATCH V2] all: Stop using git://git.ti.com
Date: Mon, 6 Jun 2022 11:38:31 -0500
Message-ID: <20220606163831.10865-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:38:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14784

Stop using un-encrypted git:// protocol to access TI repositories.

This is inline with the same arguments as made by github in [1]

This patch was generated via the following script:
git grep "git://git.ti.com" .|cut -d ':' -f1|sort -u|xargs sed -i -e "s/git:\/\/git.ti.com/https:\/\/git.ti.com\/git/g"

Followed by manually editing the usage of protocol and https://

[1] https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
* Fixups for using protocol

V1: https://lore.kernel.org/yocto-meta-ti/20220524185719.GO9834@denix.org/T/#t

 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc                     | 2 +-
 .../recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        | 4 ++--
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb            | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb   | 2 +-
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb         | 2 +-
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb         | 2 +-
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb         | 2 +-
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 4 ++--
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend      | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc              | 4 ++--
 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc | 4 ++--
 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb        | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb         | 2 +-
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 2 +-
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb           | 2 +-
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb                 | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb  | 4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                     | 4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc              | 4 ++--
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb    | 4 ++--
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb             | 2 +-
 meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb     | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop.inc              | 2 +-
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb       | 2 +-
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb            | 2 +-
 .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 2 +-
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb  | 2 +-
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb          | 2 +-
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb  | 2 +-
 .../recipes-connectivity/wlconf/wlconf_8.7.3.bb           | 2 +-
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc         | 2 +-
 meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb         | 2 +-
 meta-ti-extras/recipes-ti/dsplib/dsplib.inc               | 4 ++--
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc             | 8 ++++----
 meta-ti-extras/recipes-ti/mathlib/mathlib.inc             | 4 ++--
 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb  | 6 +++---
 meta-ti-extras/recipes-ti/swtools/swtools_git.bb          | 4 ++--
 .../recipes-ti/uio-test-pruss/uio-test-pruss_git.bb       | 4 ++--
 41 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 004866773da0..691ff1560731 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -9,7 +9,7 @@ PR = "r0"
 SRCREV = "fb484c5e54f2e31cf0a338d2927a06a2870bcc2c"
 BRANCH ?= "ti-v4.1.y"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
index 99717f87653e..683e1763100d 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
@@ -9,7 +9,7 @@ SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
 
 PV = "4.20.00.01+git${SRCPV}"
 
-SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/ipc/ludev.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 COMPATIBLE_HOST ?= "null"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 371086c1653a..cf26eb2d56f9 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -9,11 +9,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit deploy
 inherit update-alternatives
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
 SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
 
-SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index f7771caf0502..a56810d476b9 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -15,7 +15,7 @@ BRANCH = "ti-${PV}-k5.10"
 
 SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/src"
 
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 2f4a73546bea..755489a1e34d 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
 BRANCH = "linuxws/dunfell/k5.10/${PV}"
 
 SRC_URI = " \
-    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
+    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH} \
     file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
     file://0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch \
 "
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 2ec2ffef56b6..c22e3096e9f1 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
 
 BRANCH = "ti-img-sgx/${PV}/k5.10"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 718fdbe12246..6837c7c2fc2a 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/viddec-test-app.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index 4dc81c54c6a1..31010844ef91 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/jacinto7_multimedia/videnc-test-app.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 47e76347d6a0..7ec7e2a44385 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -30,8 +30,8 @@ SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+	git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH} \
+	git://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=https;branch=master;destsuffix=imggen;name=imggen \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 45d564512176..6e0683a03a5b 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,7 +1,7 @@
 PV:k3 = "2.6"
 LIC_FILES_CHKSUM:k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH:k3 = "ti-atf"
-SRC_URI:k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
+SRC_URI:k3 = "git://git.ti.com/git/atf/arm-trusted-firmware.git;protocol=https;branch=${BRANCH};name=tfa"
 SRCREV_tfa:k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index dddf628443e0..461f46fb398f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,8 +16,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 
 BRANCH ?= "master"
-UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
-UBOOT_GIT_PROTOCOL = "git"
+UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+UBOOT_GIT_PROTOCOL = "https"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
 PV:append = "+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 5b9ac50e8e30..a74b59bba2dd 100644
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -7,8 +7,8 @@ UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
 
 PV = "2.3.1.0+git${SRCPV}"
 
-UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
-UIO_MODULE_DRV_GIT_PROTOCOL = "git"
+UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/git/keystone-linux/uio-module-drv.git"
+UIO_MODULE_DRV_GIT_PROTOCOL = "https"
 SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UIO_MODULE_DRV_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 5ca6b62e7b67..7f4e8b77b801 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
-SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 3f542da4aa96..28add7fc1f2d 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "k3"
 BRANCH ?= "master"
 SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
 
-SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index ab72c1093738..807f421c6b27 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -13,7 +13,7 @@ CLEANBROKEN = "1"
 
 BRANCH = "ti-${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
 RRECOMMENDS:${PN} = "ti-gc320-driver"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 115344b1e7a6..c8b97efbdd77 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -14,7 +14,7 @@ PR = "r1"
 
 BRANCH = "linuxws/dunfell/k5.10/${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index d0edf1fe8e77..bd88d14d39a7 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -14,7 +14,7 @@ PR = "r37"
 
 BRANCH = "ti-img-sgx/dunfell/${PV}"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
 SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
 
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index af823b98bea5..2b783efe4071 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -32,7 +32,7 @@ KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += " \
     ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
-    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
+    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=https;name=ti-upstream-tools;destsuffix=ti-upstream-tools \
     file://defconfig \
 "
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index a0581cb4ace3..1016d597cd2d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -32,8 +32,8 @@ PV = "5.10.109+git${SRCPV}"
 MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 9b2d1be1de90..a051fbcae8bf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -28,8 +28,8 @@ PV = "5.4.106+git${SRCPV}"
 MACHINE_KERNEL_PR:append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
+KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index 3f6b7bce2d3e..44be246610a7 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -4,8 +4,8 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
-TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
-TI_IPC_GIT_PROTOCOL = "git"
+TI_IPC_GIT_URI = "git://git.ti.com/git/ipc/ipcdev.git"
+TI_IPC_GIT_PROTOCOL = "https"
 TI_IPC_GIT_BRANCH = "master"
 
 #Corresponds to 3.51.00.00A
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 10349b58c51d..c6645f3fe8bb 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -3,9 +3,9 @@ SUMMARY = "TI RPMsg Char Utility Library"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
 
-PROTOCOL = "git"
+PROTOCOL = "https"
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
+SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
 # Initial 0.4.1 release
 SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 67b1d2a9e31d..be1ff013839b 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -16,8 +16,8 @@ PLAT_SFX:am65xx = "/am65xx"
 PLAT_SFX:am64xx = "/am64x"
 
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
-TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
-TI_RTOS_METADATA_PROTOCOL ?= "git"
+TI_RTOS_METADATA_URI ?= "git://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
+TI_RTOS_METADATA_PROTOCOL ?= "https"
 TI_RTOS_METADATA_SRCREV ?= "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
index 28edf614a431..8fef493b2da5 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -8,7 +8,7 @@ CLEANBROKEN = "1"
 
 SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/ti-bt/service-packs.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index d9d4ef7ed2c5..f68e7966b2b5 100644
--- a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -8,7 +8,7 @@ inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
 
-SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/glsdk/dspdce.git;protocol=https"
 
 SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
 
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
index 31f775e27bc3..ec159c753948 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
@@ -3,6 +3,6 @@ SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
 PV = "1.4.0"
 INC_PR = "r2"
 
-SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sdo-emu/dsptop.git;protocol=https;branch=${BRANCH}"
 
 BRANCH = "master"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index e2302d580d2a..7a5b5306ffc4 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -11,7 +11,7 @@ REQUIRED_MACHINE_FEATURES = "mmip"
 
 RDEPENDS:${PN} = "libdce"
 
-SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/ivimm/ipumm.git;protocol=https"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
index cb2f8cc25bd7..8a2cfdc66128 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
 inherit update-alternatives
 
 BRANCH = "master"
-SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
 SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
 
 PV = "6.1.0"
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 09968993c557..dbae5a2109a3 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -3,7 +3,7 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
 
 SRC_URI = " \
-	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=https;branch=${BRANCH} \
 	file://0001-Add-Makefile-to-install-firmware-files.patch \
 "
 
diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index e5912e810b6c..2e528376fa43 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
 inherit update-rc.d
 
 SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
-SRC_URI = "git://git.ti.com/ti-bt/uim.git;branch=master;protocol=https"
+SRC_URI = "git://git.ti.com/git/ti-bt/uim.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index 1b9710afc427..979ffbbf27d4 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "wl18xx-fw"
 
 #Tag: R8.7_SP3 (8.7.3)
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=master \
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;protocol=https;branch=master \
            file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch \  
           "
 
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
index e553ff49afc7..84e8764fe2aa 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
 BRANCH = "sitara-scripts"
-SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git;protocol=https;branch=${BRANCH} \
 file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
 "
 
diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index a6f62239f293..a8451c9b7ee7 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
 
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=master"
+SRC_URI = "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git/wlconf"
 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
index eeb18fb15dd3..54115f4e7f98 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -4,6 +4,6 @@ SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
 PV = "1.1.0"
 INC_PR = "r7"
 
-SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/sdo-emu/gdbc6x.git;protocol=https;branch=${BRANCH}"
 
 BRANCH = "master"
diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
index ece07183f62e..400221f97d2d 100644
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
@@ -7,7 +7,7 @@ PV = "4.19.0.0"
 
 LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
 
-SRC_URI = "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
+SRC_URI = "git://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=https;branch=opencl_aetlib_build"
 SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
 
 DEPENDS = "ti-cgt6x-native"
diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
index 85d79ae31cad..6ebc3b3436d8 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -17,8 +17,8 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 DSPLIB_GIT_BRANCH = "master"
-DSPLIB_GIT_PROTOCOL = "git"
-DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
+DSPLIB_GIT_PROTOCOL = "https"
+DSPLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/dsplib.git"
 DSPLIB_SRCREV = "0390b171042c602e07669fd28a371cc319b90161"
 
 SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
index 56667ad1fb3f..14ac7c77e527 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -1,8 +1,8 @@
 require recipes-ti/includes/ti-paths.inc
 
-TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
+TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/git/ipc/ipc-examples.git"
 TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
-TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
+TI_IPC_EXAMPLES_GIT_PROTOCOL = "https"
 TI_IPC_EXAMPLES_GIT_BRANCH = "master"
 TI_IPC_EXAMPLES_NAME = "ipc-examples"
 
@@ -12,9 +12,9 @@ protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
 branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
 name=${TI_IPC_EXAMPLES_NAME}"
 
-TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
+TI_IPC_METADATA_GIT_URI = "git://git.ti.com/git/ipc/ipc-metadata.git"
 TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
-TI_IPC_METADATA_GIT_PROTOCOL = "git"
+TI_IPC_METADATA_GIT_PROTOCOL = "https"
 TI_IPC_METADATA_GIT_BRANCH = "master"
 TI_IPC_METADATA_NAME = "ipc-metadata"
 
diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
index fe75c09943da..6ad073ecd4c5 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -17,8 +17,8 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 MATHLIB_GIT_BRANCH = "master"
-MATHLIB_GIT_PROTOCOL = "git"
-MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
+MATHLIB_GIT_PROTOCOL = "https"
+MATHLIB_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/mathlib.git"
 MATHLIB_SRCREV = "eadcc9547faf69789661b004bb0b5ef53bb69951"
 
 SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 7c4a3409d3cc..6bb6148f3f0c 100644
--- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI OpenMP RTOS"
-HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
+HOMEPAGE = "https://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
 LICENSE = "BSD-3-Clause"
 
 require recipes-ti/includes/ti-paths.inc
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "openmp"
 PV = "2_06_03_00"
 PR = "r0"
 
-OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
-OPENMP_RTOS_GIT_PROTOCOL = "git"
+OPENMP_RTOS_GIT_URI = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
+OPENMP_RTOS_GIT_PROTOCOL = "https"
 OPENMP_RTOS_GIT_BRANCH = "master"
 
 BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
index a4cb10530d60..4bcd6754759c 100644
--- a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
+++ b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
@@ -15,8 +15,8 @@ PR = "r3"
 S = "${WORKDIR}/git"
 
 SWTOOLS_GIT_BRANCH = "master"
-SWTOOLS_GIT_PROTOCOL = "git"
-SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
+SWTOOLS_GIT_PROTOCOL = "https"
+SWTOOLS_GIT_URI = "git://git.ti.com/git/ep-processor-libraries/swtools.git"
 SWTOOLS_SRCREV = "7d1c85e686b1466cd2d535fc9cac5baf1aae24a4"
 
 SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index 59576daa2ed9..d9a420d810d1 100644
--- a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "ti-cgt-pru-native"
 BRANCH = "master"
 LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
 
-UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
-UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
+UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/git/processor-sdk/uio-test-pruss.git"
+UIO_TEST_PRUSS_GIT_PROTOCOL = "https"
 SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
 
 # Corresponds to version 01.00.02.00
-- 
2.31.1


