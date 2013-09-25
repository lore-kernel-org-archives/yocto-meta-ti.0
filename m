Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFEAFE01625
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 13:57:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8346652A1C; Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925205738.8346652A1C@arago-project.org>
Date: Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it
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
X-List-Received-Date: Wed, 25 Sep 2013 20:57:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2173296d1204855427a55067b67d9908c43c0418
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2173296d1204855427a55067b67d9908c43c0418

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 23 21:04:06 2013 -0400

linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it

Some kernel versions (and corresponding u-boot) may still need to set uImage,
as preferred image type, since the machine config changes preference to zImage
for newer kernels - keep that for ti33x and omap-a15 stuck on 3.2 and 3.8.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-kernel/linux/linux-davinci_git.bb         |    1 -
 recipes-kernel/linux/linux-mainline_3.2.bb        |    1 -
 recipes-kernel/linux/linux-omap-psp_2.6.32.bb     |    1 -
 recipes-kernel/linux/linux-omap_2.6.37.bb         |    1 -
 recipes-kernel/linux/linux-omap_2.6.39.bb         |    1 -
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |    1 -
 recipes-kernel/linux/linux-ti-staging_git.bb      |    1 -
 recipes-kernel/linux/linux_3.0.bb                 |    1 -
 recipes-kernel/linux/linux_3.1.bb                 |    1 -
 recipes-kernel/linux/linux_3.3.7.bb               |    2 --
 10 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/linux/linux-davinci_git.bb
index e4b85d6..03eeb46 100644
--- a/recipes-kernel/linux/linux-davinci_git.bb
+++ b/recipes-kernel/linux/linux-davinci_git.bb
@@ -1,7 +1,6 @@
 require multi-kernel.inc
 
 DESCRIPTION = "Linux kernel for DaVinci processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "hawkboard"
 
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 7eafdfa..7b4a2a2 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -1,7 +1,6 @@
 require linux.inc
 
 DESCRIPTION = "Linux kernel for TI processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
index 61fc24f..9f7c472 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
@@ -3,7 +3,6 @@ require multi-kernel.inc
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 DESCRIPTION = "Linux kernel for OMAP processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
 
diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-kernel/linux/linux-omap_2.6.37.bb
index 62076fb..0a14cc8 100644
--- a/recipes-kernel/linux/linux-omap_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
@@ -1,7 +1,6 @@
 require multi-kernel.inc
 
 DESCRIPTION = "Linux kernel for OMAP processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard|overo|omap3evm|omap3-touchbook)"
 
diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb
index ae90ad2..430fa09 100644
--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
@@ -1,7 +1,6 @@
 require linux.inc
 
 DESCRIPTION = "Linux kernel for OMAP processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index e4a5451..a138fb6 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -1,7 +1,6 @@
 SECTION = "kernel"
 DESCRIPTION = "Linux kernel for OMAPL1 machines from PSP, based on linux-davinci kernel"
 LICENSE = "GPLv2"
-KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
 require tipspkernel.inc
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 694a164..d3d11d2 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -2,7 +2,6 @@ SECTION = "kernel"
 DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 522a87d..3aae2ca 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -1,7 +1,6 @@
 require linux.inc
 
 DESCRIPTION = "Linux kernel for TI processors"
-KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index d6ed98c..110d26c 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -3,7 +3,6 @@ require linux.inc
 COMPATIBLE_MACHINE = "beagleboard"
 
 DESCRIPTION = "Linux kernel for TI processors"
-KERNEL_IMAGETYPE = "uImage"
 
 DEFAULT_PREFERENCE = "-99"
 
diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-kernel/linux/linux_3.3.7.bb
index e38b6c2..aca5c53 100644
--- a/recipes-kernel/linux/linux_3.3.7.bb
+++ b/recipes-kernel/linux/linux_3.3.7.bb
@@ -11,8 +11,6 @@ COMPATIBLE_MACHINE = "beagleboard"
 inherit kernel
 require setup-defconfig.inc
 
-KERNEL_IMAGETYPE = "uImage"
-
 # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see
 # conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"


