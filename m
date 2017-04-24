Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CABFDE00A9B; Mon, 24 Apr 2017 14:57:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30461E00867
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 14:57:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 60C0520B85;
	Mon, 24 Apr 2017 21:57:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UgWIe_psFzTw; Mon, 24 Apr 2017 21:57:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B48A20174;
	Mon, 24 Apr 2017 21:57:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C6442162473;
	Mon, 24 Apr 2017 17:57:01 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 24 Apr 2017 17:57:00 -0400
Message-Id: <1493071020-20134-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] conf/machine, recipes: introduce k2hk SOC family
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
X-List-Received-Date: Mon, 24 Apr 2017 21:57:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k2hk.inc                       | 2 ++
 conf/machine/k2hk-evm.conf                          | 2 +-
 recipes-bsp/aif2-lld/aif2-lld.inc                   | 2 +-
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 2 +-
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb           | 2 +-
 recipes-bsp/cppi-lld/cppi-lld.inc                   | 2 +-
 recipes-bsp/hplib/hplib.inc                         | 2 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc               | 4 ++--
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb           | 2 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb          | 4 ++--
 recipes-bsp/nwal-lld/nwal-lld.inc                   | 2 +-
 recipes-bsp/pa-lld/pa-lld.inc                       | 4 ++--
 recipes-bsp/pktlib/pktlib-rtos_git.bb               | 2 +-
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb           | 2 +-
 recipes-bsp/qmss-lld/qmss-lld.inc                   | 2 +-
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb               | 2 +-
 recipes-bsp/sa-lld/sa-lld-test_git.bb               | 2 +-
 recipes-bsp/srio-lld/srio-lld.inc                   | 2 +-
 recipes-bsp/traceframework/traceframework.inc       | 3 +--
 recipes-kernel/linux/linux-ti-staging_4.4.bb        | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.9.bb        | 2 +-
 recipes-kernel/linux/ti-uio.inc                     | 4 ++--
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb     | 2 +-
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb       | 4 ++--
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb       | 2 +-
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb       | 4 ++--
 recipes-ti/ipc/ipc-transport-srio.inc               | 2 +-
 recipes-ti/ipc/ti-ipc-common.inc                    | 4 ++--
 recipes-ti/ipc/ti-ipc_git.bb                        | 2 +-
 recipes-ti/mpm-transport/mpm-transport_git.bb       | 4 ++--
 recipes-ti/netapi/netapi.inc                        | 2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb           | 2 +-
 32 files changed, 42 insertions(+), 41 deletions(-)
 create mode 100644 conf/machine/include/k2hk.inc

diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc
new file mode 100644
index 0000000..4f30847
--- /dev/null
+++ b/conf/machine/include/k2hk.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/keystone.inc
+SOC_FAMILY_append = ":k2hk"
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index c58e0f1..6f1762d 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: Keystone 2 K2HK machine
 #@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK EVM
 
-require conf/machine/include/keystone.inc
+require conf/machine/include/k2hk.inc
 
 KERNEL_DEVICETREE = "keystone-k2hk-evm.dtb"
 
diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index ef92705..9b5f279 100644
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -17,6 +17,6 @@ SRCREV = "${AIF2_LLD_SRCREV}"
 PV = "1.2.0.1"
 INC_PR = "r0"
 
-COMPATIBLE_MACHINE = "k2hk-evm"
+COMPATIBLE_MACHINE = "k2hk"
 
 S = "${WORKDIR}/${AIF2_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 8c5f73d..ab848bd 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -13,7 +13,7 @@ XDCMAKE = "0"
 LIMSOCS_ti33x = "am335x"
 LIMSOCS_ti43x = "am437x"
 LIMSOCS_omap-a15 = "am571x am572x"
-LIMSOCS_k2hk-evm = "k2h k2k"
+LIMSOCS_k2hk = "k2h k2k"
 LIMSOCS_k2l-evm = "k2l"
 LIMSOCS_k2e = "k2e"
 LIMSOCS_k2g = "k2g"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index 115e9ae..ef1d959 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -7,7 +7,7 @@ DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
 "
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/cppi-lld/cppi-lld.inc b/recipes-bsp/cppi-lld/cppi-lld.inc
index eb1a5f1..4286007 100644
--- a/recipes-bsp/cppi-lld/cppi-lld.inc
+++ b/recipes-bsp/cppi-lld/cppi-lld.inc
@@ -20,7 +20,7 @@ PV = "02.01.00.12"
 INC_PR = "r1"
 
 DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index 0acdd8b..8551710 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -1,7 +1,7 @@
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index cad19bc..c0d8464 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Hyperlink Low Level Driver"
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2e"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LLDNAME="hyplnk"
@@ -23,7 +23,7 @@ SRCREV = "${HYPLNK_SRCREV}"
 PV = "2.1.0.6"
 INC_PR = "r0"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2e  = "k2e"
 
 S = "${WORKDIR}/${HYPLNK_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 0540d17..036f646 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2e = "k2e"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2g = "k2g"
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index fa692be..3b6e013 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -37,7 +37,7 @@ ks2_pa_post_pdsp0 \
 ks2_pa_post_pdsp1 \
 "
 
-FWBASENAME_k2hk-evm = " \
+FWBASENAME_k2hk = " \
 ks2_pa_pdsp0_classify1 \
 ks2_pa_pdsp1_classify1 \
 ks2_pa_pdsp2_classify1 \
diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 69e43d1..a5aefb4 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -21,7 +21,7 @@ INC_PR = "r0"
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 62d539b..28dfb9d 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -22,11 +22,11 @@ INC_PR = "r0"
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
 DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e = "k2e"
 
 LIBPA = "libpa"
-LIBPA_k2hk-evm = "libpa"
+LIBPA_k2hk = "libpa"
 LIBPA_k2e = "libpa2"
 LIBPA_k2l-evm = "libpa2"
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
index 2618878..e76b445 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -8,6 +8,6 @@ DEPENDS_append = " rm-lld-rtos \
                    cppi-lld-rtos \
 "
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
index de74d0b..dcfacfd 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 DEPENDS_append = " rm-lld-rtos"
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 8cf74bd..560f114 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -20,7 +20,7 @@ PV = "02.01.00.14B"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm = "k2l"
 DEVICELIST_k2e = "k2e"
 
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
index 50de457..c9364a3 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2g = "k2g"
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index a123f88..4fad211 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
diff --git a/recipes-bsp/srio-lld/srio-lld.inc b/recipes-bsp/srio-lld/srio-lld.inc
index 7ec2a35..f6fa214 100644
--- a/recipes-bsp/srio-lld/srio-lld.inc
+++ b/recipes-bsp/srio-lld/srio-lld.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/srio/srio_drv.h;beginline=1;endline=41;md5=469096088e072d883ff7eef301b34093"
 
-COMPATIBLE_MACHINE = "k2hk-evm"
+COMPATIBLE_MACHINE = "k2hk"
 
 SRIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/srio-lld.git"
 SRIO_LLD_GIT_PROTOCOL = "git"
diff --git a/recipes-bsp/traceframework/traceframework.inc b/recipes-bsp/traceframework/traceframework.inc
index ec2128c..615355a 100644
--- a/recipes-bsp/traceframework/traceframework.inc
+++ b/recipes-bsp/traceframework/traceframework.inc
@@ -20,8 +20,7 @@ PV = "01.01.01.08"
 INC_PR = "r1"
 
 DEVICELIST = "k2k k2h k2e k2l"
-DEVICELIST_tci6614-evm = "c6614"
-DEVICELIST_k2hk-evm    = "k2k k2h"
+DEVICELIST_k2hk    = "k2k k2h"
 DEVICELIST_k2e     = "k2e"
 DEVICELIST_k2l-evm     = "k2l"
 
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 64960e8..d553b13 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -39,7 +39,7 @@ RDEPENDS_kernel-base_append_keystone = " serdes-fw"
 RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
 
 # Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2hk = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
@@ -70,7 +70,7 @@ KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
 KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
 KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
-KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2hk = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 50e7824..ab5852b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -39,7 +39,7 @@ RDEPENDS_kernel-base_append_keystone = " serdes-fw"
 RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
 
 # Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
+RDEPENDS_kernel-base_append_k2hk = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
diff --git a/recipes-kernel/linux/ti-uio.inc b/recipes-kernel/linux/ti-uio.inc
index e7bb87a..4615373 100644
--- a/recipes-kernel/linux/ti-uio.inc
+++ b/recipes-kernel/linux/ti-uio.inc
@@ -1,12 +1,12 @@
 SRC_URI_append_keystone = " file://keystone-uio.dtsi"
-SRC_URI_append_k2hk-evm = " file://k2hk-uio.dtsi"
+SRC_URI_append_k2hk = " file://k2hk-uio.dtsi"
 SRC_URI_append_k2l-evm = " file://k2l-uio.dtsi"
 SRC_URI_append_k2e = " file://k2e-uio.dtsi"
 SRC_URI_append_am57xx-evm = " file://am572x-pru-uio.dtsi"
 
 DTSI_LIST = ""
 DTSI_LIST_append_keystone = " keystone-uio.dtsi"
-DTSI_LIST_append_k2hk-evm = " k2hk-uio.dtsi"
+DTSI_LIST_append_k2hk = " k2hk-uio.dtsi"
 DTSI_LIST_append_k2l-evm = " k2l-uio.dtsi"
 DTSI_LIST_append_k2e = " k2e-uio.dtsi"
 
diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
index 8a30859..3b44713 100644
--- a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://common_src/bench_common.h;beginline=1;endline=31;md5=a6ddfb26d2097041d513e3881f40e4e8"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
 
 IPC_TRANSPORT_COMMON_DESTSUFFIX = "git/c66/example"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
index beed33c..2607a14 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://TransportQmss.xdc;beginline=1;endline=35;md5=ad783760d74a4cc5b8d4ad3d8a1f28a2"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e"
+COMPATIBLE_MACHINE = "k2hk|k2l-evm|k2e"
 
 DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
@@ -17,7 +17,7 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 XDCARGS_k2e = "k2e"
 XDCARGS_k2l-evm = "k2l"
 
diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
index 5a02456..dbf8f16 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "ipc-transport-qmss ti-ipc"
 
 CHOICELIST = "yes no"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2e  = "k2e"
 DEVICELIST_k2l-evm  = "k2l"
 
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
index 6ea3fb9..b95d646 100644
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://TransportSrio.xdc;beginline=1;endline=35;md5=4d466471e4b933a0cc353a46bb546fe7"
 
-COMPATIBLE_MACHINE = "k2hk-evm"
+COMPATIBLE_MACHINE = "k2hk"
 
 DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
@@ -18,7 +18,7 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
 
-XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2hk = "k2h k2k"
 
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
 XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index f73f0f7..6c47738 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -7,7 +7,7 @@ INC_PR_append = ".1"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
-COMPATIBLE_MACHINE = "k2hk-evm"
+COMPATIBLE_MACHINE = "k2hk"
 
 S = "${WORKDIR}/git/linux/srio"
 
diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index d0f3aa5..58daaae 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -6,10 +6,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PLATFORM = "UNKNOWN"
 PLATFORM_omap5-evm = "OMAP54XX"
 PLATFORM_dra7xx = "DRA7XX"
-PLATFORM_k2hk-evm = "TCI6638"
+PLATFORM_k2hk = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
 
-ALT_PLATFORM_k2hk-evm = "TCI6636"
+ALT_PLATFORM_k2hk = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index ce2eee0..0c5088b 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://tiipclad-daemon.sh \
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
 DAEMON_dra7xx = "lad_dra7xx"
-DAEMON_k2hk-evm = "lad_tci6638"
+DAEMON_k2hk = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e = "lad_66ak2e"
 DAEMON_k2g = "lad_66ak2g"
diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index bf02c0b..0e5930a 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"
-DEPENDS_append_k2hk-evm = " hyplnk-lld srio-lld"
+DEPENDS_append_k2hk = " hyplnk-lld srio-lld"
 DEPENDS_append_k2e = " hyplnk-lld"
 
 RDEPENDS_${PN} = "syslog-ng"
@@ -22,7 +22,7 @@ PV = "2.0.4.0"
 PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
-EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
+EXTRA_OEMAKE_append_k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
 EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
 INSANE_SKIP_${PN} += "ldflags"
 
diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index feb8646..83fb6aa 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -23,7 +23,7 @@ SRCREV = "${NETAPI_SRCREV}"
 PV = "01.01.00.07"
 INC_PR = "r0"
 
-DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 5bf902b..3ec3aff 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -20,7 +20,7 @@ SRCREV = "a9aae66f792e999dafbd2e0bd834f98122398c4c"
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
 DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
-DEPENDS_append_k2hk-evm = " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
 
-- 
2.7.4


