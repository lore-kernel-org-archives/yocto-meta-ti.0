Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE65C678DD
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.64436.1674178854906447151
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C58A540CAA
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysWIZw20O_-J for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A6F2540C13
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BB3B4163702
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 3/7] conf: machine: Use new J7 SoC names over specific board names
Date: Fri, 20 Jan 2023 01:40:46 +0000
Message-Id: <20230120014050.1988728-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15604

From: Andrew Davis <afd@ti.com>

Now that we have SoC names, we can avoid adding features based on the
board name. We expect folks to create their own boards based on these
SoCs, and so using the TI made EVM board name everywhere adds extra churn
when adding a new board. Plus it is more correct for most of these
features as they depend on the SoC, not on the EVM board.

One other thing we do here is to not use the generic "j7" name,
the current and future J7 devices are far to feature diverse
to group at this level. Grouping like that will lead to the wrong
things getting enabled as new J7 SoCs are added.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  3 +-
 .../ti-img-encode-decode/vxd-dec-fw_git.bb    |  2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  5 ++-
 .../recipes-kernel/linux/kernel-rdepends.inc  |  2 +-
 .../linux/linux-ti-staging_5.10.bb            |  2 +-
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 39 +++++++++----------
 .../ti-rtos-bin/ti-rtos-metadata.bb           |  6 +--
 .../recipes-bsp/pru/pru-icss_git.bb           | 10 ++---
 8 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 0e8ed897..e7aa9ef4 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -27,8 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarc=
h_base_libdir}/firmware/cnm
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # Set up names for the firmwares
-ALTERNATIVE_${PN}:j7 =3D "\
-                    wave521c_codec_fw.bin"
+ALTERNATIVE_${PN} =3D "wave521c_codec_fw.bin"
=20
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cnm
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index 7727e9af..bd103198 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -9,7 +9,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j7"
+COMPATIBLE_MACHINE =3D "j721e"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index 5127e137..6f5b6313 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -32,7 +32,10 @@ PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${n=
onarch_base_libdir}/firmware/b
 PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/fi=
rmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
=20
 PACKAGECONFIG:append:aarch64 =3D " atf optee"
-PACKAGECONFIG:append:j7 =3D " dm"
+PACKAGECONFIG:append:j721e =3D " dm"
+PACKAGECONFIG:append:j7200 =3D " dm"
+PACKAGECONFIG:append:j721s2 =3D " dm"
+PACKAGECONFIG:append:j784s4 =3D " dm"
 PACKAGECONFIG:append:am62xx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 43cd31fe..54e6fdc6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -26,7 +26,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D =
" cadence-mhdp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cadence-mhdp-fw=
"
=20
 # Add run-time dependency for Video Decoding firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " vxd-dec-fw"
=20
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index bf230dbc..67b28b2a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -42,4 +42,4 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_cl=
ient_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: vi=
rtio_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: =
virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti=
_k3_dsp_remoteproc"
-KERNEL_MODULE_AUTOLOAD:append:j7 =3D " rpmsg_kdrv_switch"
+KERNEL_MODULE_AUTOLOAD:append:j721e =3D " rpmsg_kdrv_switch"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 0447bafe..9a6da088 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -13,13 +13,10 @@ inherit deploy
 inherit update-alternatives
=20
 PLAT_SFX =3D ""
-PLAT_SFX:j7 =3D "j721e"
-PLAT_SFX:j721e-hs-evm =3D "j721e"
-PLAT_SFX:j7200-evm =3D "j7200"
-PLAT_SFX:j7200-hs-evm =3D "j7200"
-PLAT_SFX:j721s2-evm =3D "j721s2"
-PLAT_SFX:j721s2-hs-evm =3D "j721s2"
-PLAT_SFX:j784s4-evm =3D "j784s4"
+PLAT_SFX:j721e =3D "j721e"
+PLAT_SFX:j7200 =3D "j7200"
+PLAT_SFX:j721s2 =3D "j721s2"
+PLAT_SFX:j784s4 =3D "j784s4"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
 PLAT_SFX:am62xx =3D "am62xx"
@@ -50,7 +47,7 @@ LEGACY_DM_FW_DIR  =3D "${D}${nonarch_base_libdir}/firmw=
are/pdk-ipc/"
=20
 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
=20
-# J7 HS support
+# J721e HS support
 do_install:prepend:j721e-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
@@ -81,7 +78,7 @@ do_install:prepend:j721e-hs-evm() {
         )
 }
=20
-# J7 HS support
+# J7200 HS support
 do_install:prepend:j7200-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
@@ -102,7 +99,7 @@ do_install:prepend:j7200-hs-evm() {
         )
 }
=20
-# J7 HS support
+# J721s2 HS support
 do_install:prepend:j721s2-hs-evm() {
         export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
@@ -149,7 +146,7 @@ do_install() {
 	:
 }
=20
-do_install:j7() {
+do_install:j721e() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
@@ -335,7 +332,7 @@ ALTERNATIVE:${PN}:j721e-hs-evm =3D "\
                     j7-c71_0-fw-sec \
                     "
=20
-ALTERNATIVE:${PN}:j7 =3D "\
+ALTERNATIVE:${PN}:j721e-evm =3D "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -420,15 +417,15 @@ TARGET_MCU_M4FSS0_0:am64xx =3D "am64-mcu-m4f0_0-fw"
 TARGET_MAIN_R5FSS0_0:am62xx =3D "am62-main-r5f0_0-fw"
 TARGET_MCU_M4FSS0_0:am62xx =3D "am62-mcu-m4f0_0-fw"
=20
-TARGET_MCU_R5FSS0_0:j7 =3D "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1:j7 =3D "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0:j7 =3D "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1:j7 =3D "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0:j7 =3D "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1:j7 =3D "j7-main-r5f1_1-fw"
-TARGET_C66_0:j7 =3D "j7-c66_0-fw"
-TARGET_C66_1:j7 =3D "j7-c66_1-fw"
-TARGET_C7X_0:j7 =3D "j7-c71_0-fw"
+TARGET_MCU_R5FSS0_0:j721e =3D "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1:j721e =3D "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0:j721e =3D "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1:j721e =3D "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0:j721e =3D "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1:j721e =3D "j7-main-r5f1_1-fw"
+TARGET_C66_0:j721e =3D "j7-c66_0-fw"
+TARGET_C66_1:j721e =3D "j7-c66_1-fw"
+TARGET_C7X_0:j721e =3D "j7-c71_0-fw"
=20
 TARGET_MAIN_R5FSS0_0_SIGNED:j721e-hs-evm =3D "j7-main-r5f0_0-fw-sec"
 TARGET_MAIN_R5FSS0_1_SIGNED:j721e-hs-evm =3D "j7-main-r5f0_1-fw-sec"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index be1ff013..ff715ce0 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -1,7 +1,7 @@
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
=20
-COMPATIBLE_MACHINE =3D "ti-soc"
+COMPATIBLE_MACHINE =3D "j721e|j7200|am65xx|am64xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -10,8 +10,8 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 inherit nopackages deploy
=20
 PLAT_SFX =3D ""
-PLAT_SFX:j7 =3D "/j721e"
-PLAT_SFX:j7200-evm =3D "/j7200"
+PLAT_SFX:j721e =3D "/j721e"
+PLAT_SFX:j7200 =3D "/j7200"
 PLAT_SFX:am65xx =3D "/am65xx"
 PLAT_SFX:am64xx =3D "/am64x"
=20
diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-ext=
ras/recipes-bsp/pru/pru-icss_git.bb
index cb2f8cc2..e3b5290a 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -15,7 +15,7 @@ PR =3D "r0"
=20
 require recipes-ti/includes/ti-paths.inc
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am62xx|am64xx|am65xx|j721e"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 PACKAGES:prepend =3D " \
@@ -43,7 +43,7 @@ PLATFORM:omap-a15 =3D "am572x"
 PLATFORM:am62xx =3D "am62x"
 PLATFORM:am64xx =3D "am64x"
 PLATFORM:am65xx =3D "am65x"
-PLATFORM:j7 =3D "j721e"
+PLATFORM:j721e =3D "j721e"
=20
 do_compile() {
     for dir in ${SUBDIRS}
@@ -155,7 +155,7 @@ do_install:append:am65xx() {
     done
 }
=20
-do_install:append:j7() {
+do_install:append:j721e() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PR=
U_Halt_${i}.out \
@@ -189,7 +189,7 @@ PRU_ICSS_ALTERNATIVES:omap-a15 =3D "am57xx-pru1_0-fw =
am57xx-pru1_1-fw am57xx-pru2_
 PRU_ICSS_ALTERNATIVES:am62xx   =3D "am62x-pru0-fw am62x-pru1-fw"
 PRU_ICSS_ALTERNATIVES:am64xx   =3D "am64x-pru0_0-fw am64x-pru0_1-fw am64=
x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-=
fw am64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES:am65xx   =3D "am65x-pru0_0-fw am65x-pru0_1-fw am65=
x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-=
fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-=
rtu2_1-fw"
-PRU_ICSS_ALTERNATIVES:j7       =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-=
fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
+PRU_ICSS_ALTERNATIVES:j721e    =3D "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-=
fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
=20
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/am335x-pru0-fw"
@@ -259,7 +259,7 @@ ALTERNATIVE:pru-icss-halt =3D "${PRU_ICSS_ALTERNATIVE=
S}"
 # Only Halt firmware images are supported for the Tx_PRU cores
 ALTERNATIVE:pru-icss-halt:append:am64xx =3D " am64x-txpru0_0-fw am64x-tx=
pru0_1-fw am64x-txpru1_0-fw am64x-txpru1_1-fw"
 ALTERNATIVE:pru-icss-halt:append:am65xx =3D " am65x-txpru0_0-fw am65x-tx=
pru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txp=
ru2_1-fw"
-ALTERNATIVE:pru-icss-halt:append:j7 =3D " j7-txpru0_0-fw j7-txpru0_1-fw =
j7-txpru1_0-fw j7-txpru1_1-fw"
+ALTERNATIVE:pru-icss-halt:append:j721e  =3D " j7-txpru0_0-fw j7-txpru0_1=
-fw j7-txpru1_0-fw j7-txpru1_1-fw"
=20
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] =3D "${nonarch_base_lib=
dir}/firmware/pru/PRU_Halt.out"
--=20
2.25.1


