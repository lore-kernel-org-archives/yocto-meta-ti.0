Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0C0C3A5A1
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.938.1667602019864253516
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0760540DA4
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WME14_H7gos7 for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E7F1040D99
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D40EC1636A7
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 33/50] machine: Add j784s4-evm configuration.
Date: Fri,  4 Nov 2022 22:46:35 +0000
Message-Id: <20221104224653.1223044-34-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15304

From: Ryan Eatmon <reatmon@ti.com>

Adding support for j784s4-evm:
- Add configurations.
- Add firmware.
- Add u-boot.
- Add gpu support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 11 +++
 meta-ti-bsp/conf/machine/j784s4-evm.conf      | 24 ++++++
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb    |  2 +-
 .../cnm-wave-fw/cnm-wave-fw_git.bb            |  3 +-
 .../ti-img-rogue-driver_1.15.6133109.bb       |  6 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  1 +
 .../ti-img-rogue-umlibs_1.15.6133109.bb       |  5 +-
 .../recipes-kernel/linux/kernel-rdepends.inc  |  2 +
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 75 +++++++++++++++++++
 9 files changed, 123 insertions(+), 6 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-evm.conf

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/j784s4-evm-k3r5.conf
new file mode 100644
index 00000000..04feebc6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "j784s4"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
new file mode 100644
index 00000000..a8ad25f6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@NAME: J784S4 EVM
+#@DESCRIPTION: Machine configuration for the TI J784S4 EVM
+
+require conf/machine/include/j7.inc
+
+MACHINE_FEATURES +=3D "gpu"
+
+SERIAL_CONSOLES =3D "115200;ttyS10"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+TFA_K3_USART =3D "0x8"
+OPTEE_K3_USART =3D "0x8"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-j784s4-evm.dtb \
+"
+
+UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "j784s4"
+
diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index b066a676..5ae0cb7c 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721e|j721s2"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/met=
a-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 12d21335..72dcca00 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR =3D "${INC_PR}.1"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721s2"
+COMPATIBLE_MACHINE =3D "j721s2|j784s4"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -22,6 +22,7 @@ TARGET_WAVE521C =3D "wave521c_codec_fw.bin"
=20
 SOURCE_WAVE521C =3D "wave521c_codec_fw.bin"
 SOURCE_WAVE521C:j721s2 =3D "wave521c_j721s2_codec_fw.bin"
+SOURCE_WAVE521C:j784s4 =3D "wave521c_j721s2_codec_fw.bin"
=20
 ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}=
/firmware/${TARGET_WAVE521C}"
 ALTERNATIVE_TARGET[wave521c_codec_fw.bin] =3D "${nonarch_base_libdir}/fi=
rmware/cnm/${TARGET_WAVE521C}"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
index 95aa3299..00bc719a 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "j721e|j721s2|am62xx"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 DEPENDS =3D "virtual/kernel"
=20
@@ -27,13 +27,15 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
+SRCREV =3D "ea2ac3fda4ac442b639bc3a0b73e9c4feac2081a"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
 TARGET_PRODUCT:am62xx =3D "am62_linux"
 TARGET_BVNC:j721e =3D "22.104.208.318"
 TARGET_BVNC:j721s2 =3D "36.53.104.796"
+TARGET_BVNC:j784s4 =3D "36.53.104.796"
 TARGET_BVNC:am62xx =3D "33.15.11.3"
 PVR_BUILD =3D "release"
 PVR_WS =3D "wayland"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 2772ee22..ba74fd8c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -35,6 +35,7 @@ SYSFW_PREFIX:j7200-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
=20
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
5.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.15.6133109.bb
index 5d6e45b8..2abec024 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
@@ -8,17 +8,18 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "j721e|j721s2|am62xx"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx"
=20
 PR =3D "r2"
=20
 BRANCH =3D "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
=20
 SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "fba0c770b712640ab3761dbe8369d43f89f616ed"
+SRCREV =3D "4207c0ea429ec751b1ff5f831a84ceeb76ad578d"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
 TARGET_PRODUCT:am62xx =3D "am62_linux"
 PVR_BUILD ?=3D "release"
 PVR_WS =3D "wayland"
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 38289491..43cd31fe 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -23,12 +23,14 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D=
 " prueth-fw-am65x-sr2"
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " cadence-mhdp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cadence-mhdp-fw=
"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cadence-mhdp-fw=
"
=20
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
=20
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-wave-fw"
=20
 # Add run-time dependency for TIFS Low Power Module stub
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx =3D " tifs-lpm-stub"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 219b86dc..0447bafe 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,6 +19,7 @@ PLAT_SFX:j7200-evm =3D "j7200"
 PLAT_SFX:j7200-hs-evm =3D "j7200"
 PLAT_SFX:j721s2-evm =3D "j721s2"
 PLAT_SFX:j721s2-hs-evm =3D "j721s2"
+PLAT_SFX:j784s4-evm =3D "j784s4"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
 PLAT_SFX:am62xx =3D "am62xx"
@@ -245,6 +246,26 @@ do_install:j721s2-hs-evm() {
     # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_stri=
p.xer5f ${LEGACY_ETH_FW_DIR}
 }
=20
+do_install:j784s4-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip=
.xe71 ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    install -d ${LEGACY_ETH_FW_DIR}
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.=
xer5f ${LEGACY_ETH_FW_DIR}
+}
+
 do_install:am65xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_stri=
p.xer5f ${LEGACY_IPC_FW_DIR}
@@ -370,6 +391,21 @@ ALTERNATIVE:${PN}:j721s2-hs-evm =3D "\
                     j721s2-c71_1-fw-sec \
                     "
=20
+ALTERNATIVE:${PN}:j784s4-evm =3D "\
+                    j784s4-mcu-r5f0_0-fw \
+                    j784s4-mcu-r5f0_1-fw \
+                    j784s4-main-r5f0_0-fw \
+                    j784s4-main-r5f0_1-fw \
+                    j784s4-main-r5f1_0-fw \
+                    j784s4-main-r5f1_1-fw \
+                    j784s4-main-r5f2_0-fw \
+                    j784s4-main-r5f2_1-fw \
+                    j784s4-c71_0-fw \
+                    j784s4-c71_1-fw \
+                    j784s4-c71_2-fw \
+                    j784s4-c71_3-fw \
+                    "
+
 # Set up link names for the firmwares
=20
 TARGET_MCU_R5FSS0_0:am65xx =3D "am65x-mcu-r5f0_0-fw"
@@ -440,6 +476,19 @@ TARGET_MAIN_R5FSS1_1_SIGNED:j721s2-hs-evm =3D "j721s=
2-main-r5f1_1-fw-sec"
 TARGET_C7X_0_SIGNED:j721s2-hs-evm =3D "j721s2-c71_0-fw-sec"
 TARGET_C7X_1_SIGNED:j721s2-hs-evm =3D "j721s2-c71_1-fw-sec"
=20
+TARGET_MCU_R5FSS0_0:j784s4-evm =3D "j784s4-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1:j784s4-evm =3D "j784s4-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0:j784s4-evm =3D "j784s4-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1:j784s4-evm =3D "j784s4-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0:j784s4-evm =3D "j784s4-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1:j784s4-evm =3D "j784s4-main-r5f1_1-fw"
+TARGET_MAIN_R5FSS2_0:j784s4-evm =3D "j784s4-main-r5f2_0-fw"
+TARGET_MAIN_R5FSS2_1:j784s4-evm =3D "j784s4-main-r5f2_1-fw"
+TARGET_C7X_0:j784s4-evm =3D "j784s4-c71_0-fw"
+TARGET_C7X_1:j784s4-evm =3D "j784s4-c71_1-fw"
+TARGET_C7X_2:j784s4-evm =3D "j784s4-c71_2-fw"
+TARGET_C7X_3:j784s4-evm =3D "j784s4-c71_3-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MCU_R5FSS0_1}"
=20
@@ -494,6 +543,19 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] =3D=
 "${base_libdir}/firmware/${TA
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] =3D "${base_libdir}/firmware/=
${TARGET_C7X_0_SIGNED}"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] =3D "${base_libdir}/firmware/=
${TARGET_C7X_1_SIGNED}"
=20
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware=
/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware=
/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS2_0}"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] =3D "${base_libdir}/firmwar=
e/${TARGET_MAIN_R5FSS2_1}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] =3D "${base_libdir}/firmware/${TA=
RGET_C7X_0}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] =3D "${base_libdir}/firmware/${TA=
RGET_C7X_1}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] =3D "${base_libdir}/firmware/${TA=
RGET_C7X_2}"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] =3D "${base_libdir}/firmware/${TA=
RGET_C7X_3}"
+
 # Create the firmware alternatives
=20
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
@@ -550,6 +612,19 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] =3D "$=
{base_libdir}/firmware/pdk-ipc
 ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] =3D "${base_libdir}/firmware/pdk=
-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
=20
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] =3D "${base_libdir}/firmware/pd=
k-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] =3D "${base_libdir}/firmware/pd=
k-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] =3D "${base_libdir}/firmware/p=
dk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c7x_1_release_strip.xe71"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c7x_2_release_strip.xe71"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c7x_3_release_strip.xe71"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw] =3D "${base_libdir}/firmware/pdk-ipc=
/ipc_echo_test_c7x_4_release_strip.xe71"
+
 ALTERNATIVE_PRIORITY =3D "10"
=20
 # make sure that lib/firmware, and all its contents are part of the pack=
age
--=20
2.25.1


