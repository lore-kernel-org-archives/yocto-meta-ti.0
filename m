Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36091C35294
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11686.1651503085638653026
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7371440C81
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAAKCIuWTtu9 for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D86240C3A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 44510174920
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 11/26] machine: Add am62xx evm configuration
Date: Mon,  2 May 2022 14:51:05 +0000
Message-Id: <20220502145120.726632-12-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14656

From: Nishanth Menon <nm@ti.com>

Lets add the basic AM62xx-evm configuration.
- Add configurations.
- Add firmware overrides.
- Add u-boot overrides.
- Update TI_LINUX_FW_SRCREV and K3_IMAGE_GEN_SRCREV to appropriate SHAs.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf | 11 ++++++
 meta-ti-bsp/conf/machine/am62xx-evm.conf      | 11 ++++++
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 17 +++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  4 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 18 +++++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  7 ++++
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 38 ++++++++++++++++---
 7 files changed, 99 insertions(+), 7 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62xx.inc

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/am62xx-evm-k3r5.conf
new file mode 100644
index 00000000..724a8d4a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
new file mode 100644
index 00000000..0588d34c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX EVM
+
+require conf/machine/include/am62xx.inc
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am625-sk.dtb \
+"
+
+UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
new file mode 100644
index 00000000..f3bde639
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -0,0 +1,17 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append =3D ":am62xx"
+
+MACHINE_FEATURES +=3D "screen touchscreen"
+
+SERIAL_CONSOLES =3D "115200;ttyS2"
+SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+# AM62 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD =3D "lite"
+OPTEEMACHINE =3D "k3-am65x"
+OPTEEOUTPUTMACHINE =3D "k3"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index faf998dd..a00df108 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,12 +19,12 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.00"
=20
-TI_LINUX_FW_SRCREV ?=3D "0f4905088d24e474063f33777559149e11538be5"
+TI_LINUX_FW_SRCREV ?=3D "e13611ff1da6448d80279cc8c43b81cb2275cb0d"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "f1db75bdc506287a9d04b0afbbb3d853a0948179"
+K3_IMAGE_GEN_SRCREV ?=3D "b0386fe221fc9124fda0cd2efb03d62710b1d90f"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 33333e3c..530b25b8 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -6,6 +6,7 @@ DEPENDS:append:j7200-hs-evm-k3r5 =3D " virtual/bootloader=
"
 DEPENDS:append:j721s2-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-hs-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS:append:am62xx-evm-k3r5 =3D " virtual/bootloader"
=20
 CLEANBROKEN =3D "1"
 PR =3D "${INC_PR}.2"
@@ -29,6 +30,7 @@ SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "ti-fs-firmwar=
e"
 SYSFW_PREFIX:j7200-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "ti-fs-firmware"
+SYSFW_PREFIX:am62xx-evm-k3r5 =3D "ti-fs-firmware"
=20
 SYSFW_SUFFIX ?=3D "unknown"
=20
@@ -63,6 +65,7 @@ EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 =3D " SBL=3D"${ST=
AGING_DIR_HOST}/boot/u-boot-s
 EXTRA_OEMAKE:append:j721s2-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
+EXTRA_OEMAKE:append:am62xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
=20
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -170,4 +173,19 @@ do_deploy:am64xx-hs-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
=20
+do_install:am62xx-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy:am62xx-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 addtask deploy before do_build after do_compile
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index a5b24f49..c3c32f9c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -41,6 +41,7 @@ PACKAGECONFIG[dm] =3D "DM=3D${STAGING_DIR_HOST}${nonarc=
h_base_libdir}/firmware/pdk-i
=20
 PACKAGECONFIG:append:aarch64 =3D " atf optee"
 PACKAGECONFIG:append:j7 =3D " dm"
+PACKAGECONFIG:append:am62xx =3D " dm"
=20
 COMPATIBLE_MACHINE =3D "(ti-soc)"
=20
@@ -68,6 +69,7 @@ SPL_UART_BINARY:j7200-hs-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:j721s2-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-hs-evm-k3r5 =3D "u-boot-spl.bin"
+SPL_UART_BINARY:am62xx-evm-k3r5 =3D "u-boot-spl.bin"
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
@@ -293,4 +295,9 @@ do_deploy:append:am64xx-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
=20
+do_deploy:append:am62xx-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
+}
+
 TOOLCHAIN =3D "gcc"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/met=
a-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 03408528..f3912784 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,6 +19,7 @@ PLAT_SFX:j7200-hs-evm =3D "j7200"
 PLAT_SFX:j721s2-evm =3D "j721s2"
 PLAT_SFX:am65xx =3D "am65xx"
 PLAT_SFX:am64xx =3D "am64xx"
+PLAT_SFX:am62xx =3D "am62xx"
=20
 FILESEXTRAPATHS:prepend :=3D "${METATIBASE}/recipes-bsp/ti-sci-fw/files/=
:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -50,11 +51,11 @@ DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.=
xer5f"
=20
 # J7 HS support
 do_install:prepend:j721e-hs-evm() {
-	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
-	( cd ${RTOS_DM_FW_DIR}; \
-		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.uns=
igned ${DM_FIRMWARE}; \
-	)
+        export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM=
_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
 }
=20
 # J7 HS support
@@ -77,6 +78,13 @@ do_install:prepend:am64xx() {
         )
 }
=20
+# Update the am62xx ipc binaries to be consistent with other platforms
+do_install:prepend:am62xx() {
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_rel=
ease_strip.xer5f; \
+        )
+}
+
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, wi=
th softlinks up a level
 do_install() {
 	:
@@ -154,6 +162,13 @@ do_install:am64xx() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_re=
lease_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
=20
+do_install:am62xx() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_re=
lease_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_stri=
p.xer5f ${LEGACY_DM_FW_DIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am65xx =3D "\
                     am65x-mcu-r5f0_0-fw \
@@ -167,6 +182,10 @@ ALTERNATIVE:${PN}:am64xx =3D "\
                     am64-main-r5f1_1-fw \
                     am64-mcu-m4f0_0-fw \
                     "
+ALTERNATIVE:${PN}:am62xx =3D "\
+                    am62-mcu-m4f0_0-fw \
+                    am62-main-r5f0_0-fw \
+                    "
=20
 ALTERNATIVE:${PN}:j7 =3D "\
                     j7-mcu-r5f0_0-fw \
@@ -216,6 +235,9 @@ TARGET_MAIN_R5FSS1_0:am64xx =3D "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1:am64xx =3D "am64-main-r5f1_1-fw"
 TARGET_MCU_M4FSS0_0:am64xx =3D "am64-mcu-m4f0_0-fw"
=20
+TARGET_MAIN_R5FSS0_0:am62xx =3D "am62-main-r5f0_0-fw"
+TARGET_MCU_M4FSS0_0:am62xx =3D "am62-mcu-m4f0_0-fw"
+
 TARGET_MCU_R5FSS0_0:j7 =3D "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7 =3D "j7-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0:j7 =3D "j7-main-r5f0_0-fw"
@@ -254,6 +276,9 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] =3D "${non=
arch_base_libdir}/firmware/${
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/${TARGET_MCU_M4FSS0_0}"
=20
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/f=
irmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/fi=
rmware/${TARGET_MCU_M4FSS0_0}"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/fir=
mware/${TARGET_MAIN_R5FSS0_0}"
@@ -289,6 +314,9 @@ ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] =3D "${nonarc=
h_base_libdir}/firmware/pdk-i
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
=20
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firm=
ware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] =3D "${nonarch_base_libdir}/firmw=
are/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D "${nonarch_base_libdir}/firmwar=
e/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D "${nonarch_base_libdir}/firmwa=
re/ethfw/app_remoteswitchcfg_server_strip.xer5f"
--=20
2.25.1


