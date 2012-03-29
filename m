Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CE12E0059A
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 21:36:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 18340529E8; Thu, 29 Mar 2012 04:36:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120329043607.18340529E8@arago-project.org>
Date: Thu, 29 Mar 2012 04:36:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: fix get_kernelversion returns None for do_compileconfigs
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
X-List-Received-Date: Thu, 29 Mar 2012 04:36:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a0dc3b8afc592b39c7948783952cd371c693640f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a0dc3b8afc592b39c7948783952cd371c693640f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 29 00:25:14 2012 -0400

multi-kernel: fix get_kernelversion returns None for do_compileconfigs

The function get_kernelversion uses generated header files to extract the
version number. But those files are not available until do_compile, and
do_compileconfigs is injected before that, hence the version becomes None
and breaks in several places.

Introduce a new task do_preparekernel that calls "make prepare" in the
kernel tree to generate all the necessary files. It's also safer to call
do_configure early on.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omap-psp_2.6.32.bb |    4 +++-
 recipes-kernel/linux/multi-kernel.inc         |   11 +++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
index 212a6e3..61fc24f 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
@@ -1,5 +1,7 @@
 require multi-kernel.inc
 
+MULTI_CONFIG_BASE_SUFFIX = ""
+
 DESCRIPTION = "Linux kernel for OMAP processors"
 KERNEL_IMAGETYPE = "uImage"
 
@@ -9,7 +11,7 @@ COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am3
 SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;branch=master \
            file://0001-Revert-omap3-beagle-Fix-compile-time-errors.patch \
diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 5314454..056adb9 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -16,6 +16,14 @@ SRC_URI += " \
            file://configs "
 
 MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
+MODULES_IMAGE_BASE_NAME = "modules-${PV}-${PR}-${MACHINE}"
+
+do_preparekernel () {
+	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+	oe_runmake prepare CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+}
+
+addtask preparekernel after do_configure before do_compile
 
 do_compileconfigs () {
 
@@ -100,5 +108,4 @@ do_deploy_append () {
 }
 
 do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}:do_populate_sysroot"
-addtask compileconfigs after do_patch before do_configure
-
+addtask compileconfigs after do_preparekernel before do_compile


