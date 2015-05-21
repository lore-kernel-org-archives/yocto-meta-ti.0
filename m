Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EA0FE009A3; Wed, 20 May 2015 18:56:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3682E00956
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 18:56:49 -0700 (PDT)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOO002VVG243QC0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 20 May 2015 20:56:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=E6x6fhYN c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8 a=x5BwiFZGAAAA:8	a=qBMJpUiR7M7m-TdgUmYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 95266200F0;	Wed,
	20 May 2015 21:56:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 20 May 2015 21:56:22 -0400
Message-id: <1432173385-9193-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1432173385-9193-1-git-send-email-denis@denix.org>
References: <1432173385-9193-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] recipes: move SRCPV from PR to PV, so PRServ can package AUTOINC after patching
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
X-List-Received-Date: Thu, 21 May 2015 01:56:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb                 | 4 ++--
 recipes-bsp/cmem/cmem-mod_git.bb                             | 2 +-
 recipes-bsp/cmem/cmem.inc                                    | 2 ++
 recipes-bsp/cmem/cmem_git.bb                                 | 2 +-
 recipes-bsp/hplib/hplib-mod_git.bb                           | 2 +-
 recipes-bsp/hplib/hplib.inc                                  | 2 +-
 recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb             | 3 ++-
 recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb | 3 ++-
 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb                | 3 ++-
 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb                | 3 ++-
 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb                | 3 ++-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb           | 3 ++-
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb              | 4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb              | 4 ++--
 recipes-bsp/u-boot/u-boot_2014.07.bb                         | 2 --
 recipes-bsp/uio-module-drv/uio-module-drv_git.bb             | 4 ++--
 recipes-kernel/linux/linux-keystone-rt_3.10.bb               | 4 ++--
 recipes-kernel/linux/linux-keystone_3.10.bb                  | 4 ++--
 recipes-kernel/linux/linux-keystone_3.13.bb                  | 4 ++--
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb                   | 4 ++--
 recipes-kernel/linux/linux-ti-staging_3.12.bb                | 4 ++--
 recipes-kernel/linux/linux-ti-staging_3.14.bb                | 4 ++--
 recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb         | 4 ++--
 23 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 72dc924..678e99c 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -6,8 +6,8 @@ COMPATIBLE_MACHINE = "keystone"
 
 SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
 
-PV = "2.0"
-PR = "r2+gitr${SRCPV}"
+PV = "2.0+git${SRCPV}"
+PR = "r2"
 
 BRANCH = "master"
 
diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 0cc0b46..b36eb09 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index ff7a8a0..bbb86b0 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -7,6 +7,8 @@ BRANCH ?= "master"
 # This corresponds to version 4.10.00.01
 SRCREV = "0d2fac7187ca1f6af62a98dee5b3621908cf5831"
 
+PV = "4.10.00.01+git${SRCPV}"
+
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index 540c2f6..b30029d 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r1"
 
 PACKAGES =+ "${PN}-test"
 
diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
index acef1ce..6603a2e 100644
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ b/recipes-bsp/hplib/hplib-mod_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "hplib"
 include hplib.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 S ="${WORKDIR}/git/ti/runtime/hplib/module"
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index de5b2b7..b3a62b8 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -7,4 +7,4 @@ SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH
 
 # Below Commit ID corresponds to "DEV.HPLIB.01.01.00.05"
 SRCREV = "97c2ce177c78c0f7a861c8dc9ac10657d85eae36"
-PV = "01.01.00.05"
+PV = "01.01.00.05+git${SRCPV}"
diff --git a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
index 1a418d7..a837b35 100644
--- a/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes-bsp/pru/ti-pru-sw-edma-driver_1.00.00.bb
@@ -7,8 +7,9 @@ COMPATIBLE_MACHINE = "omapl138"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-MACHINE_KERNEL_PR_append = "b+svnr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+svn${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
diff --git a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
index ad1d5ef..43eed7d 100644
--- a/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
+++ b/recipes-bsp/ti-ocf-crypto-module/ti-ocf-crypto-module_1.0.bb
@@ -19,8 +19,9 @@ S = "${WORKDIR}/trunk"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b+svnr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
+PV_append = "+svn${SRCPV}"
 
 EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR}"
 
diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
index cb2e850..8f805bc 100644
--- a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
@@ -6,7 +6,8 @@ COMPATIBLE_MACHINE = "ti33x"
 
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r6+gitr${SRCPV}"
+PR = "r6"
+PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
index 07df497..3a22864 100644
--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
@@ -2,7 +2,8 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices supported by the GLSDK product"
 
-PR = "r1+gitr${SRCPV}"
+PR = "r1"
+PV_append = "+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index a464d14..80f4c34 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -4,7 +4,8 @@ DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
 
 COMPATIBLE_MACHINE = "keystone"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r5"
+PV_append = "+git${SRCPV}"
 
 # Tag "K2_UBOOT_2013_01_14.09"
 SRCREV = "f9bc365551ff8c685bf6134d795576713fec0917"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index ea72e4d..821e9ed 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -2,7 +2,8 @@ require u-boot-ti.inc
 
 DESCRIPTION = "u-boot bootloader for TI devices"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r5"
+PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index d954db4..de44faa 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-PV = "2013.10"
-PR = "r8+gitr${SRCPV}"
+PR = "r8"
+PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
index eff8680..09dfdfa 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
@@ -7,8 +7,8 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-PV = "2014.07"
-PR = "r12+gitr${SRCPV}"
+PR = "r12"
+PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
index 91406f9..6cd8acd 100644
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -11,8 +11,6 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-PV = "2014.07"
-
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index b7a26a1..b247527 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 BRANCH ?= "master"
 # This corresponds to version 01.00.02.01
 SRCREV = "c1988446e3364af4df7cd877e6536f0c6647d7bb"
-PV = "1.0.2.1"
+PV = "1.0.2.1+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git;protocol=git;branch=${BRANCH}"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 5560ad2..7ce45b5 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -21,7 +21,7 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 #This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
 SRCREV = "e2e31a1d996d2ed8dd06dab1221e159033432b72"
-PV = "3.10.61"
+PV = "3.10.61+git${SRCPV}"
 
 BRANCH = "v3.10.61/master-rt"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 005aff4..78d5a0e 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -10,7 +10,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
@@ -21,7 +21,7 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 #This commit corresponds to "K2_LINUX_03.10.61_15.02"
 SRCREV = "a17b4c3fd6c93f908daf032786f90c0321296957"
-PV = "3.10.61"
+PV = "3.10.61+git${SRCPV}"
 
 BRANCH = "v3.10.61/master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
diff --git a/recipes-kernel/linux/linux-keystone_3.13.bb b/recipes-kernel/linux/linux-keystone_3.13.bb
index 13ce73e..dc53e42 100644
--- a/recipes-kernel/linux/linux-keystone_3.13.bb
+++ b/recipes-kernel/linux/linux-keystone_3.13.bb
@@ -13,7 +13,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.13:"
 
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Only k2hk DTB is available in this version
@@ -22,7 +22,7 @@ KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 SRCREV = "11a8eaee39b68e6047f07382c251786b40bef165"
-PV = "3.13.0"
+PV = "3.13.0+git${SRCPV}"
 
 BRANCH = "v3.13/master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 17bee02..906da49 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -21,10 +21,10 @@ S = "${WORKDIR}/git"
 BRANCH ?= "p-ti-glsdk-3.8.y"
 
 SRCREV ?= "cc16f99176bf083829c028f9af5b8eb560debcc1"
-PV = "3.8.13"
+PV = "3.8.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.omapzoom.org/kernel/omap.git;protocol=git;branch=${BRANCH} \
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 358bd1b..dd68b8e 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,10 +40,10 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.12.y"
 
 SRCREV = "68f449afccf6d1fb6b38bddfc3a40d9e97b53bdf"
-PV = "3.12.30"
+PV = "3.12.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/baseport.cfg ${WORKDIR}/connectivity.cfg \
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 260ed9b..4600fcf 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -46,10 +46,10 @@ S = "${WORKDIR}/git"
 BRANCH = "ti-linux-3.14.y"
 
 SRCREV = "d0f5c460aac292d2942b23dd6199fe23021212ad"
-PV = "3.14.43"
+PV = "3.14.43+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
index 31c1223..cc36446 100644
--- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -36,10 +36,10 @@ S = "${WORKDIR}/git"
 BRANCH = "sitara-ti-linux-3.14.y"
 
 SRCREV = "2489c022b2932432606f897741a71b712e6dbe77"
-PV = "3.14.26"
+PV = "3.14.26+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "h"
 PR = "${MACHINE_KERNEL_PR}"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
-- 
2.2.0


