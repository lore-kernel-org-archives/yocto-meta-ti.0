Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D2A7E00B9E; Thu, 31 Mar 2016 08:54:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.11 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89D5CE00C80
	for <meta-ti@yoctoproject.org>; Thu, 31 Mar 2016 08:54:30 -0700 (PDT)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4W00HAFUTZLX90@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 31 Mar 2016 10:54:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=VwQbUJbxAAAA:8 a=x5BwiFZGAAAA:8
	a=eCVrVWrVAAaAOU3KLoAA:9
Received: by 100.15.86.14 with SMTP id 6e55de7f; Thu, 31 Mar 2016 15:54:09 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2F7A5161F58;	Thu,
	31 Mar 2016 11:53:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 31 Mar 2016 11:53:58 -0400
Message-id: <1459439638-23211-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459439638-23211-1-git-send-email-denis@denix.org>
References: <1459439638-23211-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux: remove old and outdated kernel recipes and configs
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
X-List-Received-Date: Thu, 31 Mar 2016 15:54:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-keystone-3.13/defconfig |   1 -
 recipes-kernel/linux/linux-keystone-rt/defconfig   |   1 -
 recipes-kernel/linux/linux-keystone-rt_3.10.bb     |  33 -----
 recipes-kernel/linux/linux-keystone/defconfig      |   1 -
 recipes-kernel/linux/linux-keystone_3.10.bb        |  33 -----
 recipes-kernel/linux/linux-keystone_3.13.bb        |  34 -----
 recipes-kernel/linux/linux-mainline/defconfig      |   1 -
 recipes-kernel/linux/linux-mainline_3.14.bb        |  41 ------
 recipes-kernel/linux/linux-ti-glsdk/defconfig      |   1 -
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |  32 -----
 .../linux/linux-ti-staging-3.14/configs/systest    |   1 -
 .../linux/linux-ti-staging-3.14/defconfig          |   1 -
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |  67 ----------
 recipes-kernel/linux/multi-kernel.inc              | 140 ---------------------
 .../linux/sitara-linux-ti-staging-3.14/defconfig   |   1 -
 .../linux/sitara-linux-ti-staging_3.14.bb          |  51 --------
 16 files changed, 439 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-keystone-3.13/defconfig
 delete mode 100644 recipes-kernel/linux/linux-keystone-rt/defconfig
 delete mode 100644 recipes-kernel/linux/linux-keystone-rt_3.10.bb
 delete mode 100644 recipes-kernel/linux/linux-keystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb
 delete mode 100644 recipes-kernel/linux/linux-keystone_3.13.bb
 delete mode 100644 recipes-kernel/linux/linux-mainline/defconfig
 delete mode 100644 recipes-kernel/linux/linux-mainline_3.14.bb
 delete mode 100644 recipes-kernel/linux/linux-ti-glsdk/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-glsdk_3.8.bb
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/configs/systest
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging_3.14.bb
 delete mode 100644 recipes-kernel/linux/multi-kernel.inc
 delete mode 100644 recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
 delete mode 100644 recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb

diff --git a/recipes-kernel/linux/linux-keystone-3.13/defconfig b/recipes-kernel/linux/linux-keystone-3.13/defconfig
deleted file mode 100644
index bcfc482..0000000
--- a/recipes-kernel/linux/linux-keystone-3.13/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=keystone_defconfig
diff --git a/recipes-kernel/linux/linux-keystone-rt/defconfig b/recipes-kernel/linux/linux-keystone-rt/defconfig
deleted file mode 100644
index 731bb00..0000000
--- a/recipes-kernel/linux/linux-keystone-rt/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=keystone2_fullrt_defconfig
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
deleted file mode 100644
index b914c52..0000000
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux RT kernel for TI Keystone devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-COMPATIBLE_MACHINE = "keystone"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-MACHINE_KERNEL_PR_append = "e"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
-KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-#This commit corresponds to "K2_RT_LINUX_03.10.72_15.08"
-SRCREV = "dfe5ac2e9d7dba93fad48ca761933503dbdecae2"
-PV = "3.10.72+git${SRCPV}"
-
-BRANCH = "v3.10.72/master-rt"
-SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
-           file://defconfig\
-           "
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_kernel-base = ""
diff --git a/recipes-kernel/linux/linux-keystone/defconfig b/recipes-kernel/linux/linux-keystone/defconfig
deleted file mode 100644
index 04e6b17..0000000
--- a/recipes-kernel/linux/linux-keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=keystone2_defconfig
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
deleted file mode 100644
index 85eecb6..0000000
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI Keystone devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-COMPATIBLE_MACHINE = "keystone"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-MACHINE_KERNEL_PR_append = "e"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
-KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-#This commit corresponds to "K2_LINUX_03.10.72_15.08"
-SRCREV = "ca334dedb5c234b1602d991d9b330360a5bc97ad"
-PV = "3.10.72+git${SRCPV}"
-
-BRANCH = "v3.10.72/master"
-SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
-           file://defconfig\
-           "
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_kernel-base = ""
diff --git a/recipes-kernel/linux/linux-keystone_3.13.bb b/recipes-kernel/linux/linux-keystone_3.13.bb
deleted file mode 100644
index dc53e42..0000000
--- a/recipes-kernel/linux/linux-keystone_3.13.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI Keystone devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-COMPATIBLE_MACHINE = "keystone"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.13:"
-
-MACHINE_KERNEL_PR_append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-
-# Only k2hk DTB is available in this version
-KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-SRCREV = "11a8eaee39b68e6047f07382c251786b40bef165"
-PV = "3.13.0+git${SRCPV}"
-
-BRANCH = "v3.13/master"
-SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
-           file://defconfig\
-           "
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_kernel-base = ""
diff --git a/recipes-kernel/linux/linux-mainline/defconfig b/recipes-kernel/linux/linux-mainline/defconfig
deleted file mode 100644
index 926b35a..0000000
--- a/recipes-kernel/linux/linux-mainline/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
deleted file mode 100644
index b1d4eec..0000000
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Mainline Linux kernel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
-KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
-KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "linux-3.14.y"
-
-# Corresponds to tag v3.14.43
-SRCREV = "13253707013a08ce5a279ebd029fa10230172458"
-PV = "3.14.43"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
-           file://defconfig \
-          "
diff --git a/recipes-kernel/linux/linux-ti-glsdk/defconfig b/recipes-kernel/linux/linux-ti-glsdk/defconfig
deleted file mode 100644
index 926b35a..0000000
--- a/recipes-kernel/linux/linux-ti-glsdk/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
deleted file mode 100644
index 906da49..0000000
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK product"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-KERNEL_IMAGETYPE = "uImage"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
-
-COMPATIBLE_MACHINE = "omap-a15"
-
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/git"
-
-BRANCH ?= "p-ti-glsdk-3.8.y"
-
-SRCREV ?= "cc16f99176bf083829c028f9af5b8eb560debcc1"
-PV = "3.8.13+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d"
-PR = "${MACHINE_KERNEL_PR}"
-
-SRC_URI = "git://git.omapzoom.org/kernel/omap.git;protocol=git;branch=${BRANCH} \
-           file://defconfig \
-          "
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest b/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest
deleted file mode 100644
index cfe4f99..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/defconfig b/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
deleted file mode 100644
index 990e7f7..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
deleted file mode 100644
index 54530e4..0000000
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/multi-kernel.inc
-require recipes-kernel/linux/cmem.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
-RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
-
-# Add a run-time dependency for the VPE VPDMA firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd10.dtb dra72-evm.dtb dra72-evm-lcd10.dtb"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-evm.dtb"
-KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
-KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
-KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "ti-linux-3.14.y"
-
-SRCREV = "e9cd4cc81906de385f1b04708860bb3142ea601a"
-PV = "3.14.49+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
-
-MULTI_CONFIG_BASE_SUFFIX = ""
-
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig \
-           "
diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
deleted file mode 100644
index 0b7de91..0000000
--- a/recipes-kernel/linux/multi-kernel.inc
+++ /dev/null
@@ -1,140 +0,0 @@
-# This .inc file allows building and deploying multiple sets of kernel + modules
-# with different defconfigs
-#
-# Note that this include will NOT stage anything nor create packages, since that
-# is virtually impossible. Userspace should be built against the 'regular' kernel
-#
-# The intended usecase is for machines that have mutually exclusive drivers due
-# to e.g. pinmuxing issues. For example the LogicPD omap-l138 experimenter board
-# can have multiple mutually exclusive expansion boards like lcd, ethernet,
-# sound, 20x2 character LCD, etc. To be able to easily test all of those you can
-# use this .inc
-#
-# The function get_kernelversion uses generated header files to extract the
-# version number. But those files are not available until do_compile, and
-# do_compileconfigs is injected before that, hence the version becomes None
-# and breaks in several places. Introduce a task do_preparekernel that calls
-# "make prepare" in the kernel tree to generate all the necessary files.
-
-inherit deploy
-
-SRC_URI += " \
-           file://configs "
-
-def get_git_revision(p):
-    import subprocess
-
-    try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
-    except OSError:
-        return None
-
-KERNEL_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
-
-MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
-
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
-MODULE_IMAGE_BASE_NAME = "modules-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
-CONFIG_IMAGE_BASE_NAME = "config-${KERNEL_VERSION}-${PKGR}-${MACHINE}-${DATETIME}"
-
-EXTRA_OEMAKE = "${PARALLEL_MAKE} "
-
-do_preparekernel () {
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-    oe_runmake prepare CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-}
-
-addtask preparekernel after do_configure before do_compile
-
-do_compileconfigs () {
-    # fixup for fetcher change
-    if [ -e ${WORKDIR}/configs/configs ] ; then
-        if [ -e ${WORKDIR}/configs/configs/empty ] ; then
-            mv ${WORKDIR}/configs/configs/empty ${WORKDIR}/configs/
-        fi
-        mv ${WORKDIR}/configs/configs/* ${WORKDIR}/configs/
-        rm -rf ${WORKDIR}/configs/configs
-    fi
-
-    # Compile and Install additional kernel configs if found
-    if [ -e ${WORKDIR}/configs/empty ] ; then
-        echo "No configs found in configs/ directory, skipping to regular build"
-    else
-        echo "Multiple configs found, building those first"
-
-        # Context Save the regular 'defconfig'
-        cp ${WORKDIR}/defconfig ${WORKDIR}/defconfig.save
-
-        for configname in ${WORKDIR}/configs/* ; do
-            # Copy in alternative config
-            cd ${B}
-            cp $configname ${WORKDIR}/defconfig
-
-            # Build and Install this alternative kernel
-            do_configure
-            echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${B}/.scmversion
-            echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${S}/.scmversion
-            do_compile
-            do_compile_kernelmodules
-            # Below lines are needed to satisfy do_install and it's cleanup code, which doesn't know about configname
-            install -d "${D}/lib/modules/${KERNEL_VERSION}"
-            touch "${D}/lib/modules/${KERNEL_VERSION}/build"
-            touch "${D}/lib/modules/${KERNEL_VERSION}/source"
-            install -d "${D}/lib/modules/${KERNEL_VERSION}/kernel"
-            do_install
-
-            # Remove unused symlinks specific to configname
-            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
-            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
-            # In case no modules were installed, remove empty dirs
-            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/kernel"
-            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)"
-            # Also remove default location for modules used by do_install if empty
-            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}"
-
-            # Drop the resulting images in the deploy dir
-            install -d ${DEPLOYDIR}
-            install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
-
-            if [ -d "${D}/lib" ]; then
-                tar --owner=root --group=root -cvzf ${DEPLOYDIR}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz -C ${D} lib
-            fi
-
-            # Install the final config alongside the images
-            cp .config ${DEPLOYDIR}/${CONFIG_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
-
-            # Create symlinks
-            cd ${DEPLOYDIR}
-            rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
-            ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
-            rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
-            ln -sf ${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
-            rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
-            ln -sf ${CONFIG_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
-        done
-
-        # Restore the regular 'defconfig'
-        cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
-        cd ${B}
-        do_configure
-    fi
-}
-
-# For reference, copy .config to deploy image
-do_deploy_append () {
-    install -d ${DEPLOYDIR}
-
-    # Drop the regular defconfig along side the others for consistency
-    cp ${B}/.config ${DEPLOYDIR}/${CONFIG_IMAGE_BASE_NAME}.config
-
-    # add symlink
-    cd ${DEPLOYDIR}
-    rm -f config-${MACHINE}.config
-    ln -s ${CONFIG_IMAGE_BASE_NAME}.config config-${MACHINE}.config
-
-    rm -f modules-${MACHINE}.tgz
-    ln -sf ${MODULE_IMAGE_BASE_NAME}.tgz modules-${MACHINE}.tgz
-}
-
-do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
-addtask compileconfigs after do_preparekernel before do_compile
diff --git a/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig b/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
deleted file mode 100644
index 98c4069..0000000
--- a/recipes-kernel/linux/sitara-linux-ti-staging-3.14/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=singlecore-omap2plus_defconfig
diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
deleted file mode 100644
index cc36446..0000000
--- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/multi-kernel.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
-RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
-
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "sitara-ti-linux-3.14.y"
-
-SRCREV = "2489c022b2932432606f897741a71b712e6dbe77"
-PV = "3.14.26+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "h"
-PR = "${MACHINE_KERNEL_PR}"
-
-MULTI_CONFIG_BASE_SUFFIX = ""
-
-KERNEL_GIT_URI = "git://git.ti.com/sitara-linux/sitara-linux.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig \
-           "
-- 
2.2.0


