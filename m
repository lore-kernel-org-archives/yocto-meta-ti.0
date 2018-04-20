Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BE32E00942; Fri, 20 Apr 2018 12:22:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32A9DE0073D
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2018 12:22:15 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 564A920BB9;
	Fri, 20 Apr 2018 19:22:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZCQvhngy8vib; Fri, 20 Apr 2018 19:22:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1DC5F2079D;
	Fri, 20 Apr 2018 19:22:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 92A121633B1;
	Fri, 20 Apr 2018 15:22:13 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Apr 2018 15:22:12 -0400
Message-Id: <1524252132-57153-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] conf, recipes: introduce k2l family and add support for k2l-hs-evm
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
X-List-Received-Date: Fri, 20 Apr 2018 19:22:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k2l.inc                             |  6 ++++++
 conf/machine/k2l-evm.conf                                |  6 +-----
 conf/machine/k2l-hs-evm.conf                             | 14 ++++++++++++++
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb                  |  2 +-
 recipes-bsp/cppi-lld/cppi-lld.inc                        |  2 +-
 recipes-bsp/dfe-lld/dfe-lld.inc                          |  2 +-
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb  |  4 ++--
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb                |  2 +-
 recipes-bsp/hplib/hplib.inc                              |  2 +-
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb           |  4 ++--
 recipes-bsp/iqn2-lld/iqn2-lld.inc                        |  2 +-
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb                |  2 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb               |  2 +-
 recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb                |  2 +-
 recipes-bsp/nwal-lld/nwal-lld.inc                        |  2 +-
 recipes-bsp/pa-lld/pa-lld.inc                            |  4 ++--
 recipes-bsp/qmss-lld/qmss-lld.inc                        |  2 +-
 recipes-bsp/sa-lld/sa-lld-test_git.bb                    |  2 +-
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb              |  2 +-
 recipes-bsp/traceframework/traceframework.inc            |  6 +++---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb          |  2 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb              |  7 +++----
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb                |  2 +-
 recipes-bsp/u-boot/u-boot-ti.inc                         |  3 +++
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb                  |  2 +-
 recipes-kernel/linux/files/{k2l-evm => k2l}/cmem.dtsi    |  0
 recipes-kernel/linux/files/{k2l-evm => k2l}/k2l-uio.dtsi |  0
 recipes-kernel/linux/linux-ti-staging_4.14.bb            |  2 +-
 recipes-kernel/linux/ti-uio.inc                          |  4 ++--
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb          |  2 +-
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb            |  2 +-
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb            |  2 +-
 recipes-ti/ipc/ti-ipc-common.inc                         |  2 +-
 recipes-ti/ipc/ti-ipc-rtos_git.bb                        |  4 ++--
 recipes-ti/ipc/ti-ipc_git.bb                             |  2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                |  2 +-
 36 files changed, 63 insertions(+), 45 deletions(-)
 create mode 100644 conf/machine/include/k2l.inc
 create mode 100644 conf/machine/k2l-hs-evm.conf
 rename recipes-kernel/linux/files/{k2l-evm => k2l}/cmem.dtsi (100%)
 rename recipes-kernel/linux/files/{k2l-evm => k2l}/k2l-uio.dtsi (100%)

diff --git a/conf/machine/include/k2l.inc b/conf/machine/include/k2l.inc
new file mode 100644
index 0000000..997bcbe
--- /dev/null
+++ b/conf/machine/include/k2l.inc
@@ -0,0 +1,6 @@
+require conf/machine/include/keystone.inc
+SOC_FAMILY_append = ":k2l"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "k2l"
+TI_PDK_LIMIT_BOARDS = "evmK2L"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 3cf1dab..c021161 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: Keystone 2 K2L machine
 #@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L EVM
 
-require conf/machine/include/keystone.inc
+require conf/machine/include/k2l.inc
 
 KERNEL_DEVICETREE = "keystone-k2l-evm.dtb"
 
@@ -30,7 +30,3 @@ MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
 # UBI: physical eraseblock size:   256 KiB
 # UBI: sub-page size:              4096
 UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "k2l"
-TI_PDK_LIMIT_BOARDS = "evmK2L"
diff --git a/conf/machine/k2l-hs-evm.conf b/conf/machine/k2l-hs-evm.conf
new file mode 100644
index 0000000..fe58b1d
--- /dev/null
+++ b/conf/machine/k2l-hs-evm.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2L HS EVM
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L HS EVM
+
+require conf/machine/k2l-evm.conf
+
+UBOOT_MACHINE = "k2l_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2l"
diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
index c6b5258..c3d49b3 100644
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c0287a39b8896"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|c667x-evm"
+COMPATIBLE_MACHINE = "k2hk|k2l|c667x-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BCP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/bcp-lld.git"
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index 4286007..29deaf2 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -21,7 +21,7 @@ INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 S = "${WORKDIR}/${CPPI_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/dfe-lld/dfe-lld.inc b/recipes-bsp/dfe-lld/dfe-lld.inc
index 92c6034..84e8509 100644
--- a/recipes-bsp/dfe-lld/dfe-lld.inc
+++ b/recipes-bsp/dfe-lld/dfe-lld.inc
@@ -17,6 +17,6 @@ SRCREV = "${DFE_LLD_SRCREV}"
 PV = "1.0.0.8"
 INC_PR = "r0"
 
-COMPATIBLE_MACHINE = "k2l-evm"
+COMPATIBLE_MACHINE = "k2l"
 
 S = "${WORKDIR}/${DFE_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
index 0855b83..507677c 100644
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://fault_mgmt.h;beginline=1;endline=41;md5=4be5df2b9c314da729e9e4f6cc0b2979"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FAULT_MANAGEMENT_GIT_URI = "git://git.ti.com/keystone-rtos/fault_mgmt.git"
@@ -30,7 +30,7 @@ DEPENDS_append_keystone = " qmss-lld-rtos \
                             pa-lld-rtos \
 "
 
-DEPENDS_append_k2hk-evm = " aif2-lld-rtos \
+DEPENDS_append_k2hk = " aif2-lld-rtos \
 "
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "Fault Management"
diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
index bc26b95..f82ee43 100644
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
+COMPATIBLE_MACHINE = "k2hk|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FFTC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/fftc-lld.git"
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index 8551710..dda4734 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -2,7 +2,7 @@ COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
index 81a6f5e..a295304 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
@@ -6,10 +6,10 @@ include icss-emac-lld.inc
 
 PR = "${INC_PR}.0"
 
-TARGET_NAME_am57xx-evm = "SOC_AM572x"
+TARGET_NAME_omap-a15 = "SOC_AM572x"
 TARGET_NAME_ti33x = "SOC_AM335x"
 TARGET_NAME_ti43x = "SOC_AM437x"
-TARGET_NAME_k2g-evm = "SOC_K2G"
+TARGET_NAME_k2g = "SOC_K2G"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
 
diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 1d99d41..0a65e4f 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -16,6 +16,6 @@ SRCREV = "${IQN2_LLD_SRCREV}"
 PV = "1.0.0.10"
 INC_PR = "r0"
 
-COMPATIBLE_MACHINE = "k2l-evm"
+COMPATIBLE_MACHINE = "k2l"
 
 S = "${WORKDIR}/${IQN2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 036f646..8a09524 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN}="uio-module-drv"
 
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2e = "k2e"
-DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2l = "k2l"
 DEVICELIST_k2g = "k2g"
 
 CHOICELIST = " yes \
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 492313e..40aa684 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -8,7 +8,7 @@ PR = "r1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
index 7fe5103..b5c4bf1 100644
--- a/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
+++ b/recipes-bsp/nwal-lld/nwal-lld-rtos_git.bb
@@ -13,7 +13,7 @@ DEPENDS_append = " cppi-lld-rtos \
                    sa-lld-rtos \
 "
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm|c667x-evm"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l|c667x-evm"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "NWAL LLD"
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index a5aefb4..ba87bf0 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -22,7 +22,7 @@ BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
 
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "yes no"
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index cab55da..4fa30d4 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -23,10 +23,10 @@ S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2l = "k2l"
 DEVICELIST_k2e = "k2e"
 
 LIBPA = "libpa"
 LIBPA_k2hk = "libpa"
 LIBPA_k2e = "libpa2"
-LIBPA_k2l-evm = "libpa2"
+LIBPA_k2l = "libpa2"
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index f2ef968..155062c 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -21,7 +21,7 @@ INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm = "k2l"
+DEVICELIST_k2l = "k2l"
 DEVICELIST_k2e = "k2e"
 
 S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 4fad211..bae64b1 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -9,7 +9,7 @@ PR = "${INC_PR}.1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICELIST_k2hk = "k2h k2k"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "no yes"
diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
index 106071d..5ec3851 100644
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca4ac6692961402beb7"
 
-COMPATIBLE_MACHINE = "k2hk|k2l-evm|c66x"
+COMPATIBLE_MACHINE = "k2hk|k2l|c66x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 TCP3D_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tcp3d-lld.git"
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
index 615355a..c5b8b06 100644
--- a/recipes-bsp/traceframework/traceframework.inc
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -20,8 +20,8 @@ PV = "01.01.01.08"
 INC_PR = "r1"
 
 DEVICELIST = "k2k k2h k2e k2l"
-DEVICELIST_k2hk    = "k2k k2h"
-DEVICELIST_k2e     = "k2e"
-DEVICELIST_k2l-evm     = "k2l"
+DEVICELIST_k2hk = "k2k k2h"
+DEVICELIST_k2e = "k2e"
+DEVICELIST_k2l = "k2l"
 
 S = "${WORKDIR}/${TRACEFRAMEWORK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
index 71bea18..137476e 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 
 DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index e792123..3321af4 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -18,14 +18,13 @@ DEPENDS_append_ti33x = " starterware-rtos emac-lld-rtos"
 DEPENDS_append_ti43x = " starterware-rtos emac-lld-rtos"
 DEPENDS_append_omap-a15 = " emac-lld-rtos"
 DEPENDS_append_keystone = " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2hk-evm = " pa-lld-rtos"
-DEPENDS_append_k2e-evm = " pa-lld-rtos"
-DEPENDS_append_k2l-evm = " pa-lld-rtos"
+DEPENDS_append_k2hk = " pa-lld-rtos"
+DEPENDS_append_k2e = " pa-lld-rtos"
+DEPENDS_append_k2l = " pa-lld-rtos"
 DEPENDS_append_k2g = " emac-lld-rtos"
 DEPENDS_append_c665x-evm = " emac-lld-rtos"
 DEPENDS_append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
 DEPENDS_append_omapl1 = " emac-lld-rtos"
-DEPENDS_append_dra7xx-evm = " emac-lld-rtos"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
index cae1b47..168c67e 100644
--- a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
+++ b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tsip.h;beginline=1;endline=32;md5=dab2257b0b8a3678c26915f6eb49b71e"
 
-COMPATIBLE_MACHINE = "k2e-evm|c667x-evm"
+COMPATIBLE_MACHINE = "k2e|c667x-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 TSIP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tsip-lld.git"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index a18706e..666d7ae 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -45,6 +45,7 @@ SPL_BINARY = "MLO"
 SPL_BINARY_k2e-hs-evm = ""
 SPL_BINARY_k2hk-hs-evm = ""
 SPL_BINARY_k2g-hs-evm = ""
+SPL_BINARY_k2l-hs-evm = ""
 SPL_BINARY_omapl138 = ""
 
 # SPL (Second Program Loader) to be loaded over UART
@@ -62,11 +63,13 @@ UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
 UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
 UBOOT_SPI_SPL_BINARY_k2hk-hs-evm = ""
 UBOOT_SPI_SPL_BINARY_k2g-hs-evm = ""
+UBOOT_SPI_SPL_BINARY_k2l-hs-evm = ""
 UBOOT_SPI_BINARY = "u-boot.img"
 UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
 UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
 UBOOT_SPI_GPH_BINARY_k2hk-hs-evm = ""
 UBOOT_SPI_GPH_BINARY_k2g-hs-evm = ""
+UBOOT_SPI_GPH_BINARY_k2l-hs-evm = ""
 
 # SPI NOR Flash deployed images
 UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
index 5e23dbd..d4408ad 100644
--- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
+++ b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://WatchdogTimer.xdc;beginline=1;endline=31;md5=837fb176
 
 inherit ti-pdk
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
+COMPATIBLE_MACHINE = "k2hk|k2e|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 WATCHDOG_TIMER_GIT_URI = "git://git.ti.com/keystone-rtos/wdtimer.git"
diff --git a/recipes-kernel/linux/files/k2l-evm/cmem.dtsi b/recipes-kernel/linux/files/k2l/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2l-evm/cmem.dtsi
rename to recipes-kernel/linux/files/k2l/cmem.dtsi
diff --git a/recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi b/recipes-kernel/linux/files/k2l/k2l-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2l-evm/k2l-uio.dtsi
rename to recipes-kernel/linux/files/k2l/k2l-uio.dtsi
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index bce683f..7230bf4 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -40,7 +40,7 @@ RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
 # Add run-time dependency for NETCP PA firmware to the rootfs
 RDEPENDS_kernel-base_append_k2hk = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2l = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index 852c9ab..6fc397e 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -1,6 +1,6 @@
 SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
-SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
+SRC_URI_append_k2l = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_k2g = " file://keystone-k2g-pru-uio.dtsi"
 SRC_URI_append_dra7xx = " file://am57xx-pru-uio.dtsi \
@@ -12,7 +12,7 @@ SRC_URI_append_ti43x = " file://am437x-pru-uio.dtsi"
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
 DTSI_LIST_append_k2hk = " k2hk-uio.dtsi"
-DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
+DTSI_LIST_append_k2l = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
 do_setup_uio() {
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
index 3b44713..6fec0f0 100644
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://common_src/bench_common.h;beginline=1;endline=31;md5=a6ddfb26d2097041d513e3881f40e4e8"
 
-COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
 
 IPC_TRANSPORT_COMMON_DESTSUFFIX = "git/c66/example"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
index 5bb0bcf..6655ab7 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://TransportQmss.xdc;beginline=1;endline=35;md5=ad783760d74a4cc5b8d4ad3d8a1f28a2"
 
-COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
index dbf8f16..3561ef9 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -12,7 +12,7 @@ CHOICELIST = "yes no"
 
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2e  = "k2e"
-DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2l  = "k2l"
 
 do_compile () {
 #   Now build the test code
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index f5d2ebd..00e4e91 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -7,7 +7,7 @@ PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
 PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_k2hk = "TCI6638"
-PLATFORM_k2l-evm = "TCI6630"
+PLATFORM_k2l = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 4040c4d..53ab76d 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -74,12 +74,12 @@ do_install() {
 
 KFDSPNUM = "0"
 KFDSPNUM_k2hk = "8"
-KFDSPNUM_k2l-evm = "4"
+KFDSPNUM_k2l = "4"
 KFDSPNUM_keystone = "1"
 
 KFPLAT = ""
 KFPLAT_k2hk = "TCI6638K2K"
-KFPLAT_k2l-evm = "TCI6630K2L"
+KFPLAT_k2l = "TCI6630K2L"
 KFPLAT_k2e = "C66AK2E"
 KFPLAT_k2g = "TCI66AK2G02"
 
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 0c5088b..403649f 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -17,7 +17,7 @@ DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
 DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk = "lad_tci6638"
-DAEMON_k2l-evm = "lad_tci6630"
+DAEMON_k2l = "lad_tci6630"
 DAEMON_k2e = "lad_66ak2e"
 DAEMON_k2g = "lad_66ak2g"
 DAEMON_omapl138 = "lad_omapl138"
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index bd213b8..e9b14e5 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a697230
 DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
 DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2l = " qmss-lld-rtos cppi-lld-rtos"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


