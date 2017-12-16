Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96483E00D19; Sat, 16 Dec 2017 10:06:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5650E00A49
	for <meta-ti@yoctoproject.org>; Sat, 16 Dec 2017 10:06:31 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 92D13209AE;
	Sat, 16 Dec 2017 18:06:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id CaXRWWTSes52; Sat, 16 Dec 2017 18:06:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5B933201FD;
	Sat, 16 Dec 2017 18:06:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DFB651631EF;
	Sat, 16 Dec 2017 13:06:26 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sat, 16 Dec 2017 13:06:15 -0500
Message-Id: <1513447575-21127-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: [morty][PATCH v3] ti-xdctools: extend to native and nativesdk
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Dec 2017 18:06:33 -0000

From: "Mertz, Timothy" <timothy.mertz@garmin.com>

ti-xdctools should be a native recipe as it more accurately reflects how
it is supposed to be used. In addition, this allows it to be built as
nativesdk and included in SDK image tools

Signed-off-by: "Mertz, Timothy" <timothy.mertz@garmin.com>
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v3 - fix ipumm-fw build by passing native sysroot of xdctools

 classes/ti-pdk.bbclass                                    | 2 +-
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb                    | 2 +-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb               | 2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb                      | 4 +++-
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb              | 2 +-
 recipes-ti/c6accel/ti-c6accel.inc                         | 2 +-
 recipes-ti/codec-engine/ti-codec-engine.inc               | 2 +-
 recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb  | 2 +-
 recipes-ti/devtools/ti-xdctools_3.50.03.33.bb             | 4 ++++
 recipes-ti/dmai/ti-dmai.inc                               | 2 +-
 recipes-ti/dsplink/ti-dsplink.inc                         | 2 +-
 recipes-ti/includes/ti-paths.inc                          | 2 +-
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb               | 2 +-
 recipes-ti/ipc/ti-ipc-examples_git.bb                     | 2 +-
 recipes-ti/ipc/ti-ipc-rtos_git.bb                         | 2 +-
 recipes-ti/local-power-manager/ti-local-power-manager.inc | 2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                 | 2 +-
 recipes-ti/syslink/ti-syslink.inc                         | 2 +-
 18 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index f876802..b84b161 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -3,7 +3,7 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit perlnative
 
-DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos"
+DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos"
 
 DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 2bada7b..2756c2d 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -17,7 +17,7 @@ require recipes-ti/includes/ti-paths.inc
 PR = "r4"
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
 
 export HWVERSION = "ES10"
 export BIOSTOOLSROOT = "${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 08ab4ec..f7bc0b1 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -3,7 +3,7 @@ require recipes-ti/includes/ti-paths.inc
 
 PR = "${INC_PR}.1"
 
-DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools-native gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 633cb13..7a06e43 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -28,7 +28,7 @@ require recipes-ti/includes/ti-paths.inc
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
 export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
@@ -43,6 +43,8 @@ export XDAISVERSION="ti-xdais-tree"
 export TMS470CGTOOLPATH="${M4_TOOLCHAIN_INSTALL_DIR}"
 export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
 
+EXTRA_OEMAKE += "XDCDIST_TREE=${STAGING_DIR_NATIVE}/usr/share/ti/${XDCVERSION}"
+
 do_configure() {
     oe_runmake unconfig
     oe_runmake vayu_smp_config
diff --git a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index f4dc51d..79b584b 100644
--- a/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TI gdb-server to be used with c6xgdb."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=82c616b6c8f9c11c46feaaf8f9a11495"
 
-DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools"
+DEPENDS = "ti-xdais ti-framework-components ti-cgt6x-native ti-sysbios ti-xdctools-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-c6accel.inc
index 65990a8..7e7fb29 100644
--- a/recipes-ti/c6accel/ti-c6accel.inc
+++ b/recipes-ti/c6accel/ti-c6accel.inc
@@ -29,7 +29,7 @@ BINFILE="c6accel_${PV}_Linux-x86_Setup.bin"
 TI_BIN_UNPK_CMDS="Y:workdir"
 
 DEPENDS = "ti-codec-engine ti-xdais ti-dsplink ti-dspbios" 
-DEPENDS += "ti-edma3lld ti-cgt6x ti-xdctools ti-framework-components" 
+DEPENDS += "ti-edma3lld ti-cgt6x ti-xdctools-native ti-framework-components"
 DEPENDS += "ti-biosutils" 
 
 TIARGS = ' \
diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/codec-engine/ti-codec-engine.inc
index 15bd464..b4d366e 100644
--- a/recipes-ti/codec-engine/ti-codec-engine.inc
+++ b/recipes-ti/codec-engine/ti-codec-engine.inc
@@ -18,7 +18,7 @@ S = "${WORKDIR}/codec_engine_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
 
-DEPENDS = "ti-framework-components ti-xdais ti-xdctools ti-linuxutils"
+DEPENDS = "ti-framework-components ti-xdais ti-xdctools-native ti-linuxutils"
 DEPENDS_append_dm6446 	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
 DEPENDS_append_dm6467 	= " ti-dspbios ti-dsplink ti-cgt6x ti-biosutils ti-edma3lld"
 DEPENDS_append_omap3	= " ti-dspbios ti-dsplink ti-local-power-manager ti-cgt6x ti-biosutils ti-edma3lld"
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index 5c87b4c..e14f1c1 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -68,7 +68,7 @@ TI_BIN_UNPK_CMDS = "Y:workdir"
 
 S = "${CODEC_SUITE_NAME}"
 
-DEPENDS = "ti-cgt6x ti-xdctools ti-dspbios ti-codec-engine ti-linuxutils"
+DEPENDS = "ti-cgt6x ti-xdctools-native ti-dspbios ti-codec-engine ti-linuxutils"
 
 #generic codec
 DSPSUFFIX_omap3530 = "x64P"
diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
index 73ab3bd..6ab2b94 100644
--- a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
@@ -7,3 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endli
 
 SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
 SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
+
+FILES_${PN} += "${XDC_INSTALL_DIR_RECIPE}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index f81b4cf..5062118 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -29,7 +29,7 @@ SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;use
         file://arago-tdox \
 	"
 
-DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools"
+DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools-native"
 
 DEPENDS_append_dm6446 	= " ti-codecs-dm6446   ti-dspbios ti-cgt6x ti-linuxutils"
 DEPENDS_append_dm6467 	= " ti-codecs-dm6467   ti-dspbios ti-cgt6x ti-linuxutils"
diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index 78b53cf..e009615 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -30,7 +30,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${PV_DL_PATH}/dsplink_l
            file://ti-dsplink-examples-loadmodules.sh \
            file://ti-dsplink-examples-unloadmodules.sh "
 
-DEPENDS = "ti-dspbios ti-xdctools ti-cgt6x" 
+DEPENDS = "ti-dspbios ti-xdctools-native ti-cgt6x"
 DEPENDS += "virtual/kernel perl-native" 
 
 # SOC_FAMILY configuration
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index ebd4b8a..3745ec0 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -88,7 +88,7 @@ export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSBIOS_INSTALL_DIR_RECI
 export SYSLINK_INSTALL_DIR    = "${STAGING_DIR_TARGET}${SYSLINK_INSTALL_DIR_RECIPE}"
 export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
 export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
-export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
+export XDC_INSTALL_DIR        = "${STAGING_DIR_NATIVE}${XDC_INSTALL_DIR_RECIPE}"
 export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
index 2340206..545448c 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
 require ti-ipc-examples.inc
 
-DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos"
 
 do_compile_append() {
 
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 5482ce4..36df294 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running linux"
 require ti-ipc-examples.inc
 
-DEPENDS = "ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-xdctools-native ti-sysbios ti-ipc-rtos"
 
 do_compile_append() {
 
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index f4eefa8..4040c4d 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require ti-ipc.inc
 require ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
-DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
+DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
 
 PACKAGES =+ "${PN}-fw"
 FILES_${PN}-fw = "${base_libdir}/firmware/*"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 2f2b525..0e5d4f2 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -21,7 +21,7 @@ S = "${WORKDIR}/local_power_manager_linux_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/lpm/${PV}/exports/local_power_manager_linux_${PV}.tar.gz;name=lpmtarball"
 
-DEPENDS = "ti-dsplink ti-xdctools"
+DEPENDS = "ti-dsplink ti-xdctools-native"
 DEPENDS += "virtual/kernel"
 
 # SOC_FAMILY configuration
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf476..9747465 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -19,7 +19,7 @@ SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
+DEPENDS = "common-csl-ip-rtos ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
 DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index af5f896..5ff6af7 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -31,7 +31,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/sy
            file://syslink.pc \
           "
 
-DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc ti-cgt470"
+DEPENDS = "ti-sysbios ti-xdctools-native ti-cgt6x ti-ipc ti-cgt470"
 DEPENDS += "virtual/kernel" 
 
 #common frameq gateMP heapBufMP heapMemMP knlNotify listMP messageQ notify ringIO ringIO_gpp sharedRegion slaveLoader tilerDaemon
-- 
2.7.4


