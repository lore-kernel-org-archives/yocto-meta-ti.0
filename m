Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CC3DE0159A
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 19:27:48 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTL00AOXYTHACQ0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Sep 2013 21:27:33 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DFD792004C; Mon,
	23 Sep 2013 22:27:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Sep 2013 22:27:08 -0400
Message-id: <1379989631-8098-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it
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
X-List-Received-Date: Tue, 24 Sep 2013 02:27:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-am335x-psp_3.2.bb      | 2 --
 recipes-kernel/linux/linux-davinci_git.bb         | 1 -
 recipes-kernel/linux/linux-mainline_3.2.bb        | 1 -
 recipes-kernel/linux/linux-omap-psp_2.6.32.bb     | 1 -
 recipes-kernel/linux/linux-omap_2.6.37.bb         | 1 -
 recipes-kernel/linux/linux-omap_2.6.39.bb         | 1 -
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 -
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb        | 1 -
 recipes-kernel/linux/linux-ti-staging_3.8.bb      | 1 -
 recipes-kernel/linux/linux-ti-staging_git.bb      | 1 -
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb       | 1 -
 recipes-kernel/linux/linux_3.0.bb                 | 1 -
 recipes-kernel/linux/linux_3.1.bb                 | 1 -
 recipes-kernel/linux/linux_3.3.7.bb               | 2 --
 14 files changed, 16 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index eaf788f..b5783eb 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -12,8 +12,6 @@ require setup-defconfig.inc
 # Stage the power management firmware before building the kernel
 DEPENDS += "am33x-cm3"
 
-KERNEL_IMAGETYPE = "uImage"
-
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
 MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
 
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
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 5fd17f8..09204a6 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -2,7 +2,6 @@ SECTION = "kernel"
 DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK product"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index fd7b671..f0659f2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -2,7 +2,6 @@ SECTION = "kernel"
 DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 
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
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 4200d03..a9f7ac2 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -1,7 +1,6 @@
 SECTION = "kernel"
 DESCRIPTION = "Linux kernel for TI33x EVM from PSP, based on am335x-kernel"
 LICENSE = "GPLv2"
-KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
 require tipspkernel.inc
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
-- 
1.8.3.2


