Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBCAC3A5A3
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.195.1667598060905127062
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0834240DA1
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwcD-pgzkTZQ for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3F3340D99
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6FBFF16368B
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 18/47] all: Stop using git://git.ti.com
Date: Fri,  4 Nov 2022 21:40:26 +0000
Message-Id: <20221104214055.1221197-19-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15255

From: Ryan Eatmon <reatmon@ti.com>

Stop using un-encrypted git:// protocol to access TI repositories.

This is inline with the same arguments as made by github in
https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc                     | 2 +-
 .../recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        | 4 ++--
 .../gc320-drivers/ti-gc320-driver_5.0.11.p7.bb            | 2 +-
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb   | 2 +-
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb         | 2 +-
 .../ti-img-encode-decode/viddec-test-app_1.0.0.bb         | 2 +-
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb         | 2 +-
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc       | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc              | 4 ++--
 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc | 4 ++--
 meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb        | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb         | 2 +-
 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                     | 4 ++--
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc              | 4 ++--
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb    | 4 ++--
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb             | 2 +-
 meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb     | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/dsptop.inc              | 2 +-
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb       | 2 +-
 .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 2 +-
 meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb  | 2 +-
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb          | 4 ++--
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
 36 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/me=
ta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 00486677..691ff156 100644
--- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -9,7 +9,7 @@ PR =3D "r0"
 SRCREV =3D "fb484c5e54f2e31cf0a338d2927a06a2870bcc2c"
 BRANCH ?=3D "ti-v4.1.y"
=20
-SRC_URI =3D "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware=
.git;protocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firm=
ware.git;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-=
bsp/cmem/cmem.inc
index 99717f87..683e1763 100644
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
@@ -9,7 +9,7 @@ SRCREV =3D "86269258a48e0a9008dd9d5ebfae9da7ce843393"
=20
 PV =3D "4.20.00.01+git${SRCPV}"
=20
-SRC_URI =3D "git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BR=
ANCH}"
+SRC_URI =3D "git://git.ti.com/git/ipc/ludev.git;protocol=3Dhttps;branch=3D=
${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
 COMPATIBLE_HOST ?=3D "null"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b=
/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 371086c1..cf26eb2d 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -9,11 +9,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy
 inherit update-alternatives
=20
-PROTOCOL =3D "git"
+PROTOCOL =3D "https"
 BRANCH =3D "master"
 SRCREV =3D "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=3D${PROTOCOL}=
;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11=
.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
index f7771caf..a56810d4 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -15,7 +15,7 @@ BRANCH =3D "ti-${PV}-k5.10"
=20
 SRCREV =3D "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
=20
-SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3D=
https;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git/src"
=20
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
index 109a13d0..95aa3299 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -20,7 +20,7 @@ PROVIDES =3D "virtual/gpudriver"
 BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
=20
 SRC_URI =3D " \
-    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D${BRANCH}=
 \
+    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
     file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.pat=
ch \
     file://0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch \
 "
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.49=
48957.bb
index 2ec2ffef..c22e3096 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
@@ -20,7 +20,7 @@ PROVIDES =3D "virtual/gpudriver"
=20
 BRANCH =3D "ti-img-sgx/${PV}/k5.10"
=20
-SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=3D=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_=
1.0.0.bb
index ffc3f56e..29af4863 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.=
bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE =3D "CC=3D"${CC}""
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;pr=
otocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/jacinto7_multimedia/viddec-test-app.gi=
t;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app=
_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_=
1.0.0.bb
index 125a9250..b674c764 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.=
bb
@@ -15,6 +15,6 @@ EXTRA_OEMAKE =3D "CC=3D"${CC}""
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;pr=
otocol=3Dgit;branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/jacinto7_multimedia/videnc-test-app.gi=
t;protocol=3Dhttps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index be714b36..5d9e1979 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -32,8 +32,8 @@ SRCREV_FORMAT =3D "imggen"
 K3_IMAGE_GEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=3Dgi=
t;branch=3D${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=3Dgit;branch=3D=
${K3_IMAGE_GEN_BRANCH};destsuffix=3Dimggen;name=3Dimggen \
+	git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=3D=
https;branch=3D${BRANCH} \
+	git://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=3Dhttps;bra=
nch=3D${K3_IMAGE_GEN_BRANCH};destsuffix=3Dimggen;name=3Dimggen \
 "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 3696a483..c0f876e3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,8 +16,8 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D30503fd321432fc713238=
f582193b78e"
=20
 BRANCH ?=3D "master"
-UBOOT_GIT_URI =3D "git://git.ti.com/ti-u-boot/ti-u-boot.git"
-UBOOT_GIT_PROTOCOL =3D "git"
+UBOOT_GIT_URI =3D "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+UBOOT_GIT_PROTOCOL =3D "https"
 SRC_URI =3D "${UBOOT_GIT_URI};protocol=3D${UBOOT_GIT_PROTOCOL};branch=3D=
${BRANCH}"
=20
 PV:append =3D "+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/=
meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 5b9ac50e..a74b59bb 100644
--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -7,8 +7,8 @@ UIO_MODULE_DRV_SRCREV =3D "78c535afe8f8cc0b715500a63eab0b=
c3606c0579"
=20
 PV =3D "2.3.1.0+git${SRCPV}"
=20
-UIO_MODULE_DRV_GIT_URI =3D "git://git.ti.com/keystone-linux/uio-module-d=
rv.git"
-UIO_MODULE_DRV_GIT_PROTOCOL =3D "git"
+UIO_MODULE_DRV_GIT_URI =3D "git://git.ti.com/git/keystone-linux/uio-modu=
le-drv.git"
+UIO_MODULE_DRV_GIT_PROTOCOL =3D "https"
 SRC_URI =3D "${UIO_MODULE_DRV_GIT_URI};protocol=3D${UIO_MODULE_DRV_GIT_P=
ROTOCOL};branch=3D${BRANCH}"
=20
 SRCREV =3D "${UIO_MODULE_DRV_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti=
-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 5ca6b62e..7f4e8b77 100644
--- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -14,7 +14,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 SRCREV =3D "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?=3D "master"
=20
-SRC_URI =3D "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-=
bsp/recipes-devtools/k3conf/k3conf_git.bb
index 567e8d55..10e2631e 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE =3D "k3"
 BRANCH ?=3D "master"
 SRCREV =3D "48cb8e8d7dc962229a9f318cd512b4ddeec5cdc5"
=20
-SRC_URI =3D "git://git.ti.com/k3conf/k3conf.git;protocol=3Dgit;branch=3D=
${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.=
bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index ab72c109..807f421c 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -13,7 +13,7 @@ CLEANBROKEN =3D "1"
=20
 BRANCH =3D "ti-${PV}"
=20
-SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=3Dgit;=
branch=3D${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=3D=
https;branch=3D${BRANCH}"
 SRCREV =3D "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
=20
 RRECOMMENDS:${PN} =3D "ti-gc320-driver"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index af823b98..0fe54cda 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -29,10 +29,10 @@ MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 KERNEL_GIT_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git"
-KERNEL_GIT_PROTOCOL =3D "git"
+KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D " \
     ${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANC=
H};name=3Dlinux \
-    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=3D${TO=
OLS_BRANCH};protocol=3D${KERNEL_GIT_PROTOCOL};name=3Dti-upstream-tools;de=
stsuffix=3Dti-upstream-tools \
+    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=3D=
${TOOLS_BRANCH};protocol=3D${KERNEL_GIT_PROTOCOL};name=3Dti-upstream-tool=
s;destsuffix=3Dti-upstream-tools \
     file://defconfig \
 "
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index c23b4f18..84224c5c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -32,8 +32,8 @@ PV =3D "5.10.120+git${SRCPV}"
 MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
-KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
"
-KERNEL_GIT_PROTOCOL =3D "git"
+KERNEL_GIT_URI =3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel=
.git"
+KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
             file://defconfig"
=20
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-=
ti/ipc/ti-ipc.inc
index 3f6b7bce..44be2466 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -4,8 +4,8 @@ HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Categ=
ory:IPC"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endline=3D=
30;md5=3D7b327f9b710fd7c95e545b91cec79255"
=20
-TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
-TI_IPC_GIT_PROTOCOL =3D "git"
+TI_IPC_GIT_URI =3D "git://git.ti.com/git/ipc/ipcdev.git"
+TI_IPC_GIT_PROTOCOL =3D "https"
 TI_IPC_GIT_BRANCH =3D "master"
=20
 #Corresponds to 3.51.00.00A
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/r=
ecipes-ti/ipc/ti-rpmsg-char.inc
index 10349b58..c6645f3f 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -3,9 +3,9 @@ SUMMARY =3D "TI RPMsg Char Utility Library"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${S}/src/rpmsg_char.c;beginline=3D1;endline=
=3D31;md5=3D71987db43a2159cff5ea00505c6fce58"
=20
-PROTOCOL =3D "git"
+PROTOCOL =3D "https"
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=3D${PROTO=
COL};branch=3D${BRANCH};"
+SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D${P=
ROTOCOL};branch=3D${BRANCH};"
=20
 # Initial 0.4.1 release
 SRCREV =3D "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 67b1d2a9..be1ff013 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -16,8 +16,8 @@ PLAT_SFX:am65xx =3D "/am65xx"
 PLAT_SFX:am64xx =3D "/am64x"
=20
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
-TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/processor-sdk/coresdk_rtos_r=
eleases.git"
-TI_RTOS_METADATA_PROTOCOL ?=3D "git"
+TI_RTOS_METADATA_URI ?=3D "git://git.ti.com/git/processor-sdk/coresdk_rt=
os_releases.git"
+TI_RTOS_METADATA_PROTOCOL ?=3D "https"
 TI_RTOS_METADATA_SRCREV ?=3D "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
 TI_RTOS_METADATA_BRANCH ?=3D "master"
 TI_RTOS_METADATA_DIR ?=3D "${PLAT_SFX}"
diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extr=
as/recipes-bsp/bt-fw/bt-fw_git.bb
index 28edf614..8fef493b 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -8,7 +8,7 @@ CLEANBROKEN =3D "1"
=20
 SRCREV =3D "0ee619b598d023fffc77679f099bc2a4815510e4"
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/ti-bt/service-packs.git;branch=3D${BRANCH}=
"
+SRC_URI =3D "git://git.ti.com/git/ti-bt/service-packs.git;protocol=3Dhtt=
ps;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta=
-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index d9d4ef7e..491ee0f3 100644
--- a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -8,7 +8,7 @@ inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "dsp"
=20
-SRC_URI =3D "git://git.ti.com/glsdk/dspdce.git;protocol=3Dgit"
+SRC_URI =3D "git://git.ti.com/git/glsdk/dspdce.git;protocol=3Dhttps;bran=
ch=3Dmaster"
=20
 SRCREV =3D "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
=20
diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc b/meta-ti-extra=
s/recipes-bsp/dsptop/dsptop.inc
index 31f775e2..ec159c75 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
@@ -3,6 +3,6 @@ SRCREV =3D "816485e68430bbec643eac9498bfa5303eb2c2e1"
 PV =3D "1.4.0"
 INC_PR =3D "r2"
=20
-SRC_URI =3D "git://git.ti.com/sdo-emu/dsptop.git;protocol=3Dgit;branch=3D=
${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/sdo-emu/dsptop.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
=20
 BRANCH =3D "master"
diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-t=
i-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index e2302d58..8d066eb0 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -11,7 +11,7 @@ REQUIRED_MACHINE_FEATURES =3D "mmip"
=20
 RDEPENDS:${PN} =3D "libdce"
=20
-SRC_URI =3D "git://git.ti.com/ivimm/ipumm.git;protocol=3Dgit"
+SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps;branc=
h=3Dmaster"
=20
 SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
=20
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb=
 b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
index 09968993..dbae5a21 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
@@ -3,7 +3,7 @@ LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D4977a0fe767ee17765ae63c435a32=
a9e"
=20
 SRC_URI =3D " \
-	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=3Dgit;branch=3D${B=
RANCH} \
+	git://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
 	file://0001-Add-Makefile-to-install-firmware-files.patch \
 "
=20
diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/m=
eta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
index e5912e81..2e528376 100644
--- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
+++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
@@ -8,7 +8,7 @@ INITSCRIPT_PARAMS =3D "defaults 03"
 inherit update-rc.d
=20
 SRCREV =3D "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
-SRC_URI =3D "git://git.ti.com/ti-bt/uim.git;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://git.ti.com/git/ti-bt/uim.git;branch=3Dmaster;protocol=
=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx=
-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibra=
tor/wl18xx-calibrator_8.7.3.bb
index 1b9710af..1e9c445d 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibr=
ator_8.7.3.bb
@@ -7,8 +7,8 @@ RDEPENDS:${PN} =3D "wl18xx-fw"
=20
 #Tag: R8.7_SP3 (8.7.3)
 SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=3Dma=
ster \
-           file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-typ=
e-e.patch \ =20
+SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=3D=
master;protocol=3Dhttps \
+           file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-typ=
e-e.patch \
           "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl=
18xx-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx=
-target-scripts/wl18xx-target-scripts_8.7.3.bb
index e553ff49..84e8764f 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-ta=
rget-scripts_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-ta=
rget-scripts_8.7.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=
=3D21;md5=3Db8d6a0865f50159bf5c
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV =3D "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
 BRANCH =3D "sitara-scripts"
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;pro=
tocol=3Dgit;branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git=
;protocol=3Dhttps;branch=3D${BRANCH} \
 file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
 "
=20
diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b=
/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index a6f62239..a2a8b775 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D1;endline=
=3D21;md5=3Dadc05a1903d3f107f85
=20
 # Tag: R8.7_SP3 (8.7.3)
 SRCREV =3D "5048b59a444ac59ba7171d6e122d5a84581aebf2"
-SRC_URI =3D "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=3Dma=
ster"
+SRC_URI =3D "git://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git/wlconf"
=20
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-=
extras/recipes-devtools/gdbc6x/gdbc6x.inc
index eeb18fb1..54115f4e 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -4,6 +4,6 @@ SRCREV =3D "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
 PV =3D "1.1.0"
 INC_PR =3D "r7"
=20
-SRC_URI =3D "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=3Dgit;branch=3D=
${BRANCH}"
+SRC_URI =3D "git://git.ti.com/git/sdo-emu/gdbc6x.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
=20
 BRANCH =3D "master"
diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-=
extras/recipes-ti/ctoolslib/libaet_git.bb
index ece07183..400221f9 100644
--- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
+++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
@@ -7,7 +7,7 @@ PV =3D "4.19.0.0"
=20
 LIC_FILES_CHKSUM =3D "file://../ctoolslib_manifest.html;md5=3Db7dd369a2e=
07ef9a71795ee5a9bd01bd"
=20
-SRC_URI =3D "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=3Dgit;branc=
h=3Dopencl_aetlib_build"
+SRC_URI =3D "git://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=3Dhttps=
;branch=3Dopencl_aetlib_build"
 SRCREV =3D "de7954abab0f0caa8a2c7b53095c30226d901a31"
=20
 DEPENDS =3D "ti-cgt6x-native"
diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras=
/recipes-ti/dsplib/dsplib.inc
index 85d79ae3..6ebc3b34 100644
--- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
+++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
@@ -17,8 +17,8 @@ DEPENDS =3D "ti-cgt6x-native \
 S =3D "${WORKDIR}/git"
=20
 DSPLIB_GIT_BRANCH =3D "master"
-DSPLIB_GIT_PROTOCOL =3D "git"
-DSPLIB_GIT_URI =3D "git://git.ti.com/ep-processor-libraries/dsplib.git"
+DSPLIB_GIT_PROTOCOL =3D "https"
+DSPLIB_GIT_URI =3D "git://git.ti.com/git/ep-processor-libraries/dsplib.g=
it"
 DSPLIB_SRCREV =3D "0390b171042c602e07669fd28a371cc319b90161"
=20
 SRC_URI =3D "${DSPLIB_GIT_URI};protocol=3D${DSPLIB_GIT_PROTOCOL};branch=3D=
${DSPLIB_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extr=
as/recipes-ti/ipc/ti-ipc-rtos.inc
index 56667ad1..14ac7c77 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -1,8 +1,8 @@
 require recipes-ti/includes/ti-paths.inc
=20
-TI_IPC_EXAMPLES_GIT_URI =3D "git://git.ti.com/ipc/ipc-examples.git"
+TI_IPC_EXAMPLES_GIT_URI =3D "git://git.ti.com/git/ipc/ipc-examples.git"
 TI_IPC_EXAMPLES_DEST_SUFFIX =3D "git/ipc-examples"
-TI_IPC_EXAMPLES_GIT_PROTOCOL =3D "git"
+TI_IPC_EXAMPLES_GIT_PROTOCOL =3D "https"
 TI_IPC_EXAMPLES_GIT_BRANCH =3D "master"
 TI_IPC_EXAMPLES_NAME =3D "ipc-examples"
=20
@@ -12,9 +12,9 @@ protocol=3D${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
 branch=3D${TI_IPC_EXAMPLES_GIT_BRANCH};\
 name=3D${TI_IPC_EXAMPLES_NAME}"
=20
-TI_IPC_METADATA_GIT_URI =3D "git://git.ti.com/ipc/ipc-metadata.git"
+TI_IPC_METADATA_GIT_URI =3D "git://git.ti.com/git/ipc/ipc-metadata.git"
 TI_IPC_METADATA_DEST_SUFFIX =3D "git/ipc-metadata"
-TI_IPC_METADATA_GIT_PROTOCOL =3D "git"
+TI_IPC_METADATA_GIT_PROTOCOL =3D "https"
 TI_IPC_METADATA_GIT_BRANCH =3D "master"
 TI_IPC_METADATA_NAME =3D "ipc-metadata"
=20
diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extr=
as/recipes-ti/mathlib/mathlib.inc
index fe75c099..6ad073ec 100644
--- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
+++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
@@ -17,8 +17,8 @@ DEPENDS =3D "ti-cgt6x-native \
 S =3D "${WORKDIR}/git"
=20
 MATHLIB_GIT_BRANCH =3D "master"
-MATHLIB_GIT_PROTOCOL =3D "git"
-MATHLIB_GIT_URI =3D "git://git.ti.com/ep-processor-libraries/mathlib.git=
"
+MATHLIB_GIT_PROTOCOL =3D "https"
+MATHLIB_GIT_URI =3D "git://git.ti.com/git/ep-processor-libraries/mathlib=
.git"
 MATHLIB_SRCREV =3D "eadcc9547faf69789661b004bb0b5ef53bb69951"
=20
 SRC_URI =3D "${MATHLIB_GIT_URI};protocol=3D${MATHLIB_GIT_PROTOCOL};branc=
h=3D${MATHLIB_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/m=
eta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 7c4a3409..aa4bc6cd 100644
--- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "TI OpenMP RTOS"
-HOMEPAGE =3D "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
+HOMEPAGE =3D "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
 LICENSE =3D "BSD-3-Clause"
=20
 require recipes-ti/includes/ti-paths.inc
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES =3D "openmp"
 PV =3D "2_06_03_00"
 PR =3D "r0"
=20
-OPENMP_RTOS_GIT_URI =3D "git://git.ti.com/openmp/ti-openmp-dsp-runtime.g=
it"
-OPENMP_RTOS_GIT_PROTOCOL =3D "git"
+OPENMP_RTOS_GIT_URI =3D "git://git.ti.com/git/openmp/ti-openmp-dsp-runti=
me.git"
+OPENMP_RTOS_GIT_PROTOCOL =3D "https"
 OPENMP_RTOS_GIT_BRANCH =3D "master"
=20
 BRANCH =3D "${OPENMP_RTOS_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb b/meta-ti-e=
xtras/recipes-ti/swtools/swtools_git.bb
index a4cb1053..4bcd6754 100644
--- a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
+++ b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
@@ -15,8 +15,8 @@ PR =3D "r3"
 S =3D "${WORKDIR}/git"
=20
 SWTOOLS_GIT_BRANCH =3D "master"
-SWTOOLS_GIT_PROTOCOL =3D "git"
-SWTOOLS_GIT_URI =3D "git://git.ti.com/ep-processor-libraries/swtools.git=
"
+SWTOOLS_GIT_PROTOCOL =3D "https"
+SWTOOLS_GIT_URI =3D "git://git.ti.com/git/ep-processor-libraries/swtools=
.git"
 SWTOOLS_SRCREV =3D "7d1c85e686b1466cd2d535fc9cac5baf1aae24a4"
=20
 SRC_URI =3D "${SWTOOLS_GIT_URI};protocol=3D${SWTOOLS_GIT_PROTOCOL};branc=
h=3D${SWTOOLS_GIT_BRANCH}"
diff --git a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.=
bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index 59576daa..d9a420d8 100644
--- a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -10,8 +10,8 @@ DEPENDS =3D "ti-cgt-pru-native"
 BRANCH =3D "master"
 LIC_FILES_CHKSUM =3D "file://Makefile;startline=3D1;endline=3D31;md5=3D0=
ee4f2c42eb6b04e37859bb55a18b144"
=20
-UIO_TEST_PRUSS_GIT_URI =3D "git://git.ti.com/processor-sdk/uio-test-prus=
s.git"
-UIO_TEST_PRUSS_GIT_PROTOCOL =3D "git"
+UIO_TEST_PRUSS_GIT_URI =3D "git://git.ti.com/git/processor-sdk/uio-test-=
pruss.git"
+UIO_TEST_PRUSS_GIT_PROTOCOL =3D "https"
 SRC_URI =3D "${UIO_TEST_PRUSS_GIT_URI};protocol=3D${UIO_TEST_PRUSS_GIT_P=
ROTOCOL};branch=3D${BRANCH}"
=20
 # Corresponds to version 01.00.02.00
--=20
2.25.1


