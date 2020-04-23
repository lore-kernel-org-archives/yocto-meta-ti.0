Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2262.1587683673561507355
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 16:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D16C840C18;
	Thu, 23 Apr 2020 23:14:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xpb3jntTs8PO; Thu, 23 Apr 2020 23:14:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE24240A6E;
	Thu, 23 Apr 2020 23:14:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0206B172A02;
	Thu, 23 Apr 2020 19:14:30 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] conf,recipes: add support for j7-hs-evm platform and j7 SoC family
Date: Thu, 23 Apr 2020 19:14:30 -0400
Message-Id: <1587683670-50888-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk.bbclass                             |  4 ++--
 conf/machine/include/j7.inc                        | 11 +++++++++
 conf/machine/j7-evm.conf                           | 11 +--------
 conf/machine/j7-hs-evm.conf                        | 22 ++++++++++++++++++
 recipes-bsp/board-rtos/board-rtos_git.bb           |  2 +-
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb |  2 +-
 recipes-bsp/fvid2/fvid2-rtos_git.bb                |  5 ++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  2 +-
 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb   | 26 +++++++++++-----------
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb              | 26 +++++++++++-----------
 .../ti-img-rogue-driver_1.10.5371573.bb            |  2 +-
 recipes-bsp/pru/pru-icss_git.bb                    |  8 +++----
 recipes-bsp/sciclient/sciclient-rtos_git.bb        |  8 +++++++
 .../ti-img-encode-decode_1.0.0.bb                  |  2 +-
 .../libgles/ti-img-rogue-umlibs_1.10.5371573.bb    |  2 +-
 recipes-kernel/jailhouse/jailhouse_git.bb          |  8 +++----
 recipes-kernel/linux/linux-ti-staging_5.4.bb       |  2 +-
 17 files changed, 87 insertions(+), 56 deletions(-)
 create mode 100644 conf/machine/include/j7.inc
 create mode 100644 conf/machine/j7-hs-evm.conf
 mode change 100755 => 100644 recipes-bsp/fvid2/fvid2-rtos_git.bb

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index a07fdbb..2571234 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -11,8 +11,8 @@ DEPENDS_remove_ti43x = "ti-cgt6x-native"
 DEPENDS_append_omapl1 = " ti-cgt-arm-native"
 DEPENDS_remove_am65xx = "gcc-arm-none-eabi-native ti-cgt6x-native"
 DEPENDS_append_am65xx = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native"
-DEPENDS_remove_j7-evm = "gcc-arm-none-eabi-native"
-DEPENDS_append_j7-evm = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
+DEPENDS_remove_j7 = "gcc-arm-none-eabi-native"
+DEPENDS_append_j7 = " ti-cgt-arm-native gcc-linaro-baremetal-aarch64-native ti-cgt7x-native"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
new file mode 100644
index 0000000..f6d9161
--- /dev/null
+++ b/conf/machine/include/j7.inc
@@ -0,0 +1,11 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append = ":j7"
+
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "j7"
+OPTEEOUTPUTMACHINE = "k3"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "j721e j7200"
+TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
+TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 9e91006..aedfc82 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J7 EVM
 #@DESCRIPTION: Machine configuration for the TI J7 EVM
 
-require conf/machine/include/k3.inc
+require conf/machine/include/j7.inc
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
@@ -16,12 +16,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-
-OPTEEMACHINE = "k3"
-OPTEEFLAVOR = "j7"
-OPTEEOUTPUTMACHINE = "k3"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "j721e j7200"
-TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
-TI_PDK_LIMIT_CORES = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mcu2_1 mcu3_0 mcu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
new file mode 100644
index 0000000..70e1475
--- /dev/null
+++ b/conf/machine/j7-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J7 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J7 HS EVM
+
+require conf/machine/j7-evm.conf
+
+UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
+
+UBOOT_ENTRYPOINT =       "0x80080000"
+UBOOT_LOADADDRESS =      "0x80080000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
+
+SPL_BINARY = "tispl.bin_HS"
+SPL_BINARYNAME = "tispl.bin"
+UBOOT_BINARY = "u-boot.img_HS"
+IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index dfbe20a..a6547d3 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -57,7 +57,7 @@ DEPENDS_append_dra7xx = " pm-lld-rtos \
 
 DEPENDS_append_am65xx = " sciclient-rtos \
 "
-DEPENDS_append_j7-evm = " udma-lld-rtos \
+DEPENDS_append_j7 = " udma-lld-rtos \
                           sciclient-rtos \
                           mmcsd-lld-rtos \
 "
diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 70c2867..6d857f7 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7-evm"
+COMPATIBLE_MACHINE = "j7"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-bsp/fvid2/fvid2-rtos_git.bb b/recipes-bsp/fvid2/fvid2-rtos_git.bb
old mode 100755
new mode 100644
index db1f9e1..6219f0b
--- a/recipes-bsp/fvid2/fvid2-rtos_git.bb
+++ b/recipes-bsp/fvid2/fvid2-rtos_git.bb
@@ -28,9 +28,8 @@ export PDK_FVID2_ROOT_PATH = "${FVID2_PACKAGE_BASE}/package/all/pdk_/packages"
 
 
 BOARD_PACKAGE = ""
-BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
-BOARD_PACKAGE_am65xx-hs-evm = "am65xx_evm"
-BOARD_PACKAGE_j7-evm = "j721e_evm"
+BOARD_PACKAGE_am65xx = "am65xx_evm"
+BOARD_PACKAGE_j7 = "j721e_evm"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "FVID2"
diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
index 1cd1c99..5a3c1d6 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -29,7 +29,7 @@ DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
 DEPENDS_append_k2g = " pruss-lld-rtos \
 "
 
-DEPENDS_append_j7-evm = " sciclient-rtos \
+DEPENDS_append_j7 = " sciclient-rtos \
 "
 
 # Build with make instead of XDC
diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index b9958f1..79e5bdb 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -16,7 +16,7 @@ LINUX_2_CORES_BAREMETAL_BIN_DIR = "${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_e
 
 DST_BIN_PATH = "${base_libdir}/firmware/pdk-ipc"
 
-TI_PDK_LIMIT_BOARDS_j7-evm = "j721e_evm"
+TI_PDK_LIMIT_BOARDS_j7 = "j721e_evm"
 
 do_configure[noexec] = "1"
 
@@ -62,7 +62,7 @@ do_install() {
     done
 }
 
-do_install_append_j7-evm() {
+do_install_append_j7() {
     #copy ipc_echo_testb binaries for J721
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_0_release.xer5f ${D}${DST_BIN_PATH}
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu1_1_release.xer5f ${D}${DST_BIN_PATH}
@@ -79,7 +79,7 @@ do_install_append_j7-evm() {
     install -m 0644 ${REMOTE_FWB_BIN_DIR}/$board/ipc_echo_testb_mcu3_1_release_strip.xer5f ${D}${DST_BIN_PATH}
 }
 
-do_install_append_am65xx-evm() {
+do_install_append_am65xx() {
     cp ${CP_ARGS} ${REMOTE_FW_DIR}/ex04_linux_baremetal_2core_echo_test/bin -d ${D}/ex04_linux_baremetal_2core_echo_test
 }
 
@@ -88,7 +88,7 @@ ALTERNATIVE_${PN}_am65xx = "\
                     am65x-mcu-r5f0_0-fw \
                     am65x-mcu-r5f0_1-fw \
                     "
-ALTERNATIVE_${PN}_j7-evm = "\
+ALTERNATIVE_${PN}_j7 = "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -105,15 +105,15 @@ ALTERNATIVE_${PN}_j7-evm = "\
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
 
-TARGET_MCU_R5FSS0_0_j7-evm = "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1_j7-evm = "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0_j7-evm = "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1_j7-evm = "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0_j7-evm = "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1_j7-evm = "j7-main-r5f1_1-fw"
-TARGET_C66_0_j7-evm = "j7-c66_0-fw"
-TARGET_C66_1_j7-evm = "j7-c66_1-fw"
-TARGET_C7X_j7-evm = "j7-c71_0-fw"
+TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7 = "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
+TARGET_C66_0_j7 = "j7-c66_0-fw"
+TARGET_C66_1_j7 = "j7-c66_1-fw"
+TARGET_C7X_j7 = "j7-c71_0-fw"
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
index df99276..1be2836 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -23,7 +23,7 @@ AM65X_R5_FW_DIR = "${S}/examples/echo_test/binaries/am65xx"
 J721E_R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries/j721e"
 
 PLATFORM_am65xx = "am65xx"
-PLATFORM_j7-evm = "j7-evm"
+PLATFORM_j7 = "j7-evm"
 
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
@@ -40,7 +40,7 @@ do_install_append_am65xx() {
     install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
 }
 
-do_install_append_j7-evm() {
+do_install_append_j7() {
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
     install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
@@ -78,7 +78,7 @@ ALTERNATIVE_${PN}_am65xx = "\
                     am65x-mcu-r5f0_0-fw \
                     am65x-mcu-r5f0_1-fw \
                     "
-ALTERNATIVE_${PN}_j7-evm = "\
+ALTERNATIVE_${PN}_j7 = "\
                     j7-mcu-r5f0_0-fw \
                     j7-mcu-r5f0_1-fw \
                     j7-main-r5f0_0-fw \
@@ -95,15 +95,15 @@ ALTERNATIVE_${PN}_j7-evm = "\
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
 
-TARGET_MCU_R5FSS0_0_j7-evm = "j7-mcu-r5f0_0-fw"
-TARGET_MCU_R5FSS0_1_j7-evm = "j7-mcu-r5f0_1-fw"
-TARGET_MAIN_R5FSS0_0_j7-evm = "j7-main-r5f0_0-fw"
-TARGET_MAIN_R5FSS0_1_j7-evm = "j7-main-r5f0_1-fw"
-TARGET_MAIN_R5FSS1_0_j7-evm = "j7-main-r5f1_0-fw"
-TARGET_MAIN_R5FSS1_1_j7-evm = "j7-main-r5f1_1-fw"
-TARGET_C66_0_j7-evm = "j7-c66_0-fw"
-TARGET_C66_1_j7-evm = "j7-c66_1-fw"
-TARGET_C7X_j7-evm = "j7-c71_0-fw"
+TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7 = "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
+TARGET_C66_0_j7 = "j7-c66_0-fw"
+TARGET_C66_1_j7 = "j7-c66_1-fw"
+TARGET_C7X_j7 = "j7-c71_0-fw"
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -148,7 +148,7 @@ do_deploy_am65xx() {
     install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
 }
 
-do_deploy_j7-evm() {
+do_deploy_j7() {
     install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
     install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
     install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index 460ff18..da4ec6e 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm"
+COMPATIBLE_MACHINE = "j7"
 
 DEPENDS = "virtual/kernel"
 
diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 88d28f3..7288851 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -42,7 +42,7 @@ PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
 PLATFORM_am65xx = "am65x"
-PLATFORM_j7-evm = "j721e"
+PLATFORM_j7 = "j721e"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -133,7 +133,7 @@ do_install_append_am65xx() {
     done
 }
 
-do_install_append_j7-evm() {
+do_install_append_j7() {
     for i in 0 1
     do
         install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
@@ -166,7 +166,7 @@ PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
-PRU_ICSS_ALTERNATIVES_j7-evm   = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
+PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
@@ -217,7 +217,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
 # Only Halt firmware images are supported for the Tx_PRU cores
-ALTERNATIVE_pru-icss-halt_append_j7-evm = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
+ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
 
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 392eb0c..7fbeb1e 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -99,6 +99,14 @@ do_compile_prepend_j7-evm() {
     cd -
 }
 
+do_compile_prepend_j7-hs-evm() {
+
+    cd ${SCICLIENT_ROOTPATH}/tools
+    # Create the .bin file for HS
+    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e-hs ${PDK_INSTALL_DIR}/packages
+    cd -
+}
+
 do_install() {
     cd ${SCICLIENT_ROOTPATH}
     install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index a1da958..0192717 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -7,7 +7,7 @@ inherit module
 MACHINE_KERNEL_PR_append = "g"
 PR = "${MACHINE_KERNEL_PR}"
 
-COMPATIBLE_MACHINE = "j7-evm"
+COMPATIBLE_MACHINE = "j7"
 
 SRCREV = "0eba3678300f649e49f03d92d1b624cf0e008008"
 
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index dba1701..2d5f036 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm"
+COMPATIBLE_MACHINE = "j7"
 
 PR = "r6"
 
diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 6f442fe..3ee24e5 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -46,22 +46,22 @@ JH_CELL_FILES_k3 ?= "k3-*.cell"
 
 JH_INMATE_DTB ?= ""
 JH_INMATE_DTB_am65xx ?= "inmate-k3-am654-idk.dtb"
-JH_INMATE_DTB_j7-evm ?= "inmate-k3-j721e-evm.dtb"
+JH_INMATE_DTB_j7 ?= "inmate-k3-j721e-evm.dtb"
 
 JH_LINUX_DEMO_CELL ?= ""
 JH_LINUX_DEMO_CELL_am65xx ?= "k3-am654-idk-linux-demo.cell"
-JH_LINUX_DEMO_CELL_j7-evm ?= "k3-j721e-evm-linux-demo.cell"
+JH_LINUX_DEMO_CELL_j7 ?= "k3-j721e-evm-linux-demo.cell"
 
 JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
-JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
+JH_SYSCONFIG_CELL_j7 ?= "k3-j721e-evm.cell"
 
 INITRAMFS_IMAGE ?= ""
 JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 
 JH_CMDLINE ?= ""
 JH_CMDLINE_am65xx ?= "console=ttyS1,115200n8"
-JH_CMDLINE_j7-evm ?= "console=ttyS3,115200n8"
+JH_CMDLINE_j7 ?= "console=ttyS3,115200n8"
 
 do_configure() {
 	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index abf990e..f468bef 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -52,7 +52,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-- 
2.7.4

