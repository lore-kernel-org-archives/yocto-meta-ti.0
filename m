Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DF15E013DA
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 23:22:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 365B852A65; Fri, 23 Mar 2012 06:22:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120323062218.365B852A65@arago-project.org>
Date: Fri, 23 Mar 2012 06:22:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-{ti33x, omapl138}: simplify and unify handling of "tipspkernel" feature
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 06:22:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 246cb75a970e9aab0a3974a55e72c6d90f1df151
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=246cb75a970e9aab0a3974a55e72c6d90f1df151

Author: Denys Dmytriyenko <denis@denix.org>
Date:   Thu Mar 22 23:28:35 2012 -0400

linux-{ti33x,omapl138}: simplify and unify handling of "tipspkernel" feature

And move it to a separate .inc for other kernels to use.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |    9 +--------
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb       |   11 ++---------
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb       |    8 +-------
 recipes-kernel/linux/tipspkernel.inc              |   17 +++++++++++++++++
 4 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 6326e7b..5441675 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
+require tipspkernel.inc
 
 S = "${WORKDIR}/git"
 
@@ -14,12 +15,6 @@ SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"
 
 COMPATIBLE_MACHINE = "(omapl138)"
 
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-CONFIGS_PSP = "${@base_set_filespath(["${THISDIR}/${PN}-${PV}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/${PN}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/files/tipspkernel"], d)}:"
-FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
-
 SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
 	file://defconfig"
 
@@ -32,5 +27,3 @@ PATCHES_OVER_PSP = " \
 	file://0006-Add-wlan-and-BT-config-switches.patch \
 	file://uio_pruss.patch \
 	"
-
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index 591731c..cc30bfb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
+require tipspkernel.inc
 
 S = "${WORKDIR}/git"
 
@@ -15,12 +16,6 @@ MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-CONFIGS_PSP = "${@base_set_filespath(["${THISDIR}/${PN}-${PV}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/${PN}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/files/tipspkernel"], d)}:"
-FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
-
 SRC_URI += "git://github.com/beagleboard/linux.git;branch=${BRANCH} \
 	file://defconfig"
 
@@ -61,10 +56,8 @@ PATCHES_OVER_PSP = " \
 	file://0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch \
 	file://0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch\
 	file://0036-beaglebone-update-LCD-cape-partnumber.patch \
-    file://0037-beaglebone-compare-complete-partnumber-not-the-first.patch \
+	file://0037-beaglebone-compare-complete-partnumber-not-the-first.patch \
 	file://0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
 	"
 
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
 SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 0476e54..c30d1be 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
+require tipspkernel.inc
 
 S = "${WORKDIR}/git"
 
@@ -15,16 +16,9 @@ MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-CONFIGS_PSP = "${@base_set_filespath(["${THISDIR}/${PN}-${PV}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/${PN}/tipspkernel"], d)}:\
-${@base_set_filespath(["${THISDIR}/files/tipspkernel"], d)}:"
-FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
-
 SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=http;branch=${BRANCH} \
 	file://defconfig"
 
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
 SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
 
 PATCHES_OVER_PSP = " \
diff --git a/recipes-kernel/linux/tipspkernel.inc b/recipes-kernel/linux/tipspkernel.inc
new file mode 100644
index 0000000..c23fa57
--- /dev/null
+++ b/recipes-kernel/linux/tipspkernel.inc
@@ -0,0 +1,17 @@
+# Include this file for kernel recipes that need to handle different defconfigs
+# and apply patches based on "tipspkernel" DISTRO_FEATURES
+
+# We don't want "tipspkernel" to be another OVERRIDE, but rather a new level of
+# FILESPATH with all the OVERRIDES applied to it
+CONFIGS_PSP = "${@base_set_filespath(["${FILE_DIRNAME}/${PF}/tipspkernel", "${FILE_DIRNAME}/${P}/tipspkernel", \
+"${FILE_DIRNAME}/${PN}/tipspkernel", "${FILE_DIRNAME}/${BP}/tipspkernel", "${FILE_DIRNAME}/${BPN}/tipspkernel", \
+"${FILE_DIRNAME}/files/tipspkernel", "${FILE_DIRNAME}/tipspkernel"], d)}:"
+
+# When "tipspkernel" is ENABLED, prepend additional set of directories to FILESPATH
+FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
+
+# When "tipspkernel" is NOT ENABLED, append additional list of PATCHES_OVER_PSP to SRC_URI
+SRC_URI_append = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
+
+# List additional patches to apply on top of PSP kernel, start with a space
+PATCHES_OVER_PSP = ""


