Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6B3BE00BEA; Tue, 20 Sep 2016 12:29:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5709FE00563
	for <meta-ti@yoctoproject.org>; Tue, 20 Sep 2016 12:29:24 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODT00C7JI4EWP20@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 20 Sep 2016 14:29:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=DyEEDHuMFfd_fjIP1G4A:9
Received: by 100.15.110.130 with SMTP id 14965767;
	Tue, 20 Sep 2016 19:29:02 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id BA1F4162145;	Tue, 20 Sep 2016 15:29:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Sep 2016 15:29:01 -0400
Message-id: <1474399741-28347-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] conf/machine,recipes: introduce k2e SOC family
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
X-List-Received-Date: Tue, 20 Sep 2016 19:29:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k2e.inc                             | 2 ++
 conf/machine/k2e-evm.conf                                | 2 +-
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb      | 3 +--
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb                | 2 +-
 recipes-bsp/cppi-lld/cppi-lld.inc                        | 2 +-
 recipes-bsp/dsptop/debugss-module-drv_git.bb             | 2 +-
 recipes-bsp/hplib/hplib.inc                              | 2 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc                    | 4 ++--
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb                | 2 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb               | 2 +-
 recipes-bsp/nwal-lld/nwal-lld.inc                        | 2 +-
 recipes-bsp/pa-lld/pa-lld.inc                            | 4 ++--
 recipes-bsp/pktlib/pktlib-rtos_git.bb                    | 2 +-
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb                | 2 +-
 recipes-bsp/qmss-lld/qmss-lld.inc                        | 2 +-
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb                    | 2 +-
 recipes-bsp/sa-lld/sa-lld-test_git.bb                    | 2 +-
 recipes-bsp/traceframework/traceframework.inc            | 2 +-
 recipes-kernel/linux/files/{k2e-evm => k2e}/cmem.dtsi    | 0
 recipes-kernel/linux/files/{k2e-evm => k2e}/k2e-uio.dtsi | 0
 recipes-kernel/linux/linux-ti-staging_4.4.bb             | 7 +++----
 recipes-kernel/linux/ti-uio.inc                          | 4 ++--
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb          | 2 +-
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb            | 4 ++--
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb            | 2 +-
 recipes-ti/ipc/ti-ipc.inc                                | 2 +-
 recipes-ti/ipc/ti-ipc_git.bb                             | 2 +-
 recipes-ti/mpm-transport/mpm-transport_git.bb            | 4 ++--
 recipes-ti/netapi/netapi.inc                             | 2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                | 2 +-
 30 files changed, 36 insertions(+), 36 deletions(-)
 create mode 100644 conf/machine/include/k2e.inc
 rename recipes-kernel/linux/files/{k2e-evm => k2e}/cmem.dtsi (100%)
 rename recipes-kernel/linux/files/{k2e-evm => k2e}/k2e-uio.dtsi (100%)

diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
new file mode 100644
index 0000000..ce3d9c8
--- /dev/null
+++ b/conf/machine/include/k2e.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/keystone.inc
+SOC_FAMILY_append = ":k2e"
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 9b54639..7dd616e 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: Keystone 2 K2E machine
 #@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
 
-require conf/machine/include/keystone.inc
+require conf/machine/include/k2e.inc
 
 MACHINE_FEATURES += "opencl"
 
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index d5fb83e..45a047d 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -15,8 +15,7 @@ LIMSOCS_ti43x = "am437x"
 LIMSOCS_omap-a15 = "am571x am572x"
 LIMSOCS_k2hk-evm = "k2h k2k"
 LIMSOCS_k2l-evm = "k2l"
-LIMSOCS_k2e-evm = "k2e"
-LIMSOCS_k2e-hs-evm = "k2e"
+LIMSOCS_k2e = "k2e"
 LIMSOCS_k2g-evm = "k2g"
 
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index 5c4e39b..9766b42 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -8,6 +8,6 @@ DEPENDS_append = " rm-lld-rtos \
 "
 
 XDCARGS_k2hk-evm = "k2h k2k"
-XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2g-evm = "k2g"
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index b1f3f41..eb1a5f1 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -22,6 +22,6 @@ INC_PR = "r1"
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 S = "${WORKDIR}/${CPPI_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 60d72d4..8f4bbf1 100644
--- a/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -14,7 +14,7 @@ inherit module
 PLATFORM = ""
 PLATFORM_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_keystone = "KEYSTONE_PLATFORM"
-PLATFORM_k2e-evm = "K2E_PLATFORM"
+PLATFORM_k2e = "K2E_PLATFORM"
 
 EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}' KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index fcc7191..0acdd8b 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -3,7 +3,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
 HPLIB_GIT_PROTOCOL = "git"
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index 9ab7339..cad19bc 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Hyperlink Low Level Driver"
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|k2e"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LLDNAME="hyplnk"
@@ -24,6 +24,6 @@ PV = "2.1.0.6"
 INC_PR = "r0"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 S = "${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index b29df8b..f4a6c5d 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -9,7 +9,7 @@ DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2g-evm  = "k2g"
 
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index ffa6af2..fa692be 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 81450ff..53f7313 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -23,6 +23,6 @@ S = "${BASEDIR}/ti/drv/nwal"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "yes no"
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 0b2a4cc..345de61 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -24,9 +24,9 @@ S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
-DEVICELIST_k2e-evm = "k2e"
+DEVICELIST_k2e = "k2e"
 
 LIBPA = "libpa"
 LIBPA_k2hk-evm = "libpa"
-LIBPA_k2e-evm = "libpa2"
+LIBPA_k2e = "libpa2"
 LIBPA_k2l-evm = "libpa2"
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
index 0471156..2618878 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -9,5 +9,5 @@ DEPENDS_append = " rm-lld-rtos \
 "
 
 XDCARGS_k2hk-evm = "k2h k2k"
-XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
index 4dbc591..43fd803 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -8,5 +8,5 @@ DEPENDS_append = " rm-lld-rtos"
 
 XDCARGS_k2hk-evm = "k2h k2k"
 XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2e = "k2e"
 XDCARGS_k2g-evm = "k2g"
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 65764b3..8cf74bd 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -22,6 +22,6 @@ INC_PR = "r0"
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
-DEVICELIST_k2e-evm = "k2e"
+DEVICELIST_k2e = "k2e"
 
 S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
index fed9445..0bf24e2 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -7,6 +7,6 @@ PR = "${INC_PR}.0"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 XDCARGS_k2hk-evm = "k2h k2k"
-XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2g-evm = "k2g"
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index eeab6ff..a123f88 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "no yes"
 
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
index a9a1a96..ec2128c 100644
--- a/recipes-bsp/traceframework/traceframework.inc
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -22,7 +22,7 @@ INC_PR = "r1"
 DEVICELIST = "k2k k2h k2e k2l"
 DEVICELIST_tci6614-evm = "c6614"
 DEVICELIST_k2hk-evm    = "k2k k2h"
-DEVICELIST_k2e-evm     = "k2e"
+DEVICELIST_k2e     = "k2e"
 DEVICELIST_k2l-evm     = "k2l"
 
 S = "${WORKDIR}/${TRACEFRAMEWORK_GIT_DESTSUFFIX}"
diff --git a/recipes-kernel/linux/files/k2e-evm/cmem.dtsi b/recipes-kernel/linux/files/k2e/cmem.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2e-evm/cmem.dtsi
rename to recipes-kernel/linux/files/k2e/cmem.dtsi
diff --git a/recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi b/recipes-kernel/linux/files/k2e/k2e-uio.dtsi
similarity index 100%
rename from recipes-kernel/linux/files/k2e-evm/k2e-uio.dtsi
rename to recipes-kernel/linux/files/k2e/k2e-uio.dtsi
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index fb83f6a..bb7cf97 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -39,7 +39,7 @@ RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
 
 # Add run-time dependency for NETCP PA firmware to the rootfs
 RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2e-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
@@ -66,8 +66,7 @@ KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
 KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2e-hs-evm = "${KERNEL_DEVICETREE_k2e-evm}"
+KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
@@ -81,7 +80,7 @@ SRCREV = "4fb4591a4ab1b3ef317fa87af3cd3c06f1a7284b"
 PV = "4.4.21+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index f038bc8..e7bb87a 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -1,14 +1,14 @@
 SRC_URI_append_keystone = " file://keystone-uio.dtsi"
 SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
-SRC_URI_append_k2e-evm = " file://k2e-uio.dtsi"
+SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
 
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
 DTSI_LIST_append_k2hk-evm = " k2hk-uio.dtsi"
 DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
-DTSI_LIST_append_k2e-evm = " k2e-uio.dtsi"
+DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
 KERNEL_DEVICETREE_append_am57xx-evm = "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-excl-uio.dtb", "", d)}"
 
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
index 199e84c..8a30859 100644
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://common_src/bench_common.h;beginline=1;endline=31;md5=a6ddfb26d2097041d513e3881f40e4e8"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
 
 IPC_TRANSPORT_COMMON_DESTSUFFIX = "git/c66/example"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
index 0631a92..beed33c 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://TransportQmss.xdc;beginline=1;endline=35;md5=ad783760d74a4cc5b8d4ad3d8a1f28a2"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
 
 DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
@@ -18,7 +18,7 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
 S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
 
 XDCARGS_k2hk-evm = "k2h k2k"
-XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
index bfedaf5..5a02456 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "ipc-transport-qmss ti-ipc"
 CHOICELIST = "yes no"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 DEVICELIST_k2l-evm  = "k2l"
 
 do_compile () {
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 1479fa6..c6c0965 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -26,7 +26,7 @@ PLATFORM_omap5-evm = "OMAP54XX"
 PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
-PLATFORM_k2e-evm = "66AK2E"
+PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g-evm = "66AK2G"
 
 ALT_PLATFORM_k2hk-evm = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index f98df66..4cbc022 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -16,7 +16,7 @@ DAEMON_omap5-evm = "lad_omap54xx_smp"
 DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
-DAEMON_k2e-evm = "lad_66ak2e"
+DAEMON_k2e = "lad_66ak2e"
 DAEMON_k2g-evm = "lad_66ak2g"
 
 inherit autotools-brokensep pkgconfig update-rc.d
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index bfbf85b..51b5e9e 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"
 DEPENDS_append_k2hk-evm = " hyplnk-lld srio-lld"
-DEPENDS_append_k2e-evm = " hyplnk-lld"
+DEPENDS_append_k2e = " hyplnk-lld"
 
 RDEPENDS_${PN} = "syslog-ng"
 
@@ -23,7 +23,7 @@ PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
-EXTRA_OEMAKE_append_k2e-evm += "HYPLNK_TRANSPORT=true"
+EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index 3490cb7..feb8646 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -25,7 +25,7 @@ INC_PR = "r0"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "yes no"
 
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 2984da3..d9a3c98 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a697230
 
 DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
 DEPENDS_append_k2hk-evm = " qmss-lld-rtos cppi-lld-rtos"
-DEPENDS_append_k2e-evm = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15"
-- 
2.7.4


