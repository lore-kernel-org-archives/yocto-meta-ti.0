Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C55F0E01645
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 09:37:18 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTQ00JEORHIHYT2@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Sep 2013 11:37:00 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 49AFB2008E; Thu,
	26 Sep 2013 12:36:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Sep 2013 12:36:52 -0400
Message-id: <1380213412-16982-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Revert "linux: Inherit new machine_kernel_pr class"
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
X-List-Received-Date: Thu, 26 Sep 2013 16:37:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

This adds a new mandatory dependency on meta-openembedded layer. While we are
still trying to resolve an existing optional dependency, not bring a new one.
The MACHINE_KERNEL_PR requirement will need to be handled differently.

This reverts commit 6c1ab34c88edc127ff2835d87b48f4b10fe8ba0b.
---
 recipes-kernel/linux/linux-am335x-psp_3.2.bb | 2 +-
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb   | 2 +-
 recipes-kernel/linux/linux-ti-staging_3.8.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb | 2 +-
 recipes-kernel/linux/linux.inc               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index cf1b2dd..eaf788f 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "ti33x"
 
 DEFAULT_PREFERENCE = "-1"
 
-inherit kernel machine_kernel_pr
+inherit kernel
 require setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index d7aebea..5fd17f8 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
-inherit kernel machine_kernel_pr
+inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 8e6d198..833fb48 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
-inherit kernel machine_kernel_pr
+inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index b75e650..778ea7f 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-inherit kernel machine_kernel_pr
+inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index e0d414c..ac51dae 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-inherit kernel siteinfo machine_kernel_pr
+inherit kernel siteinfo
 
 # Enable OABI compat for people stuck with obsolete userspace
 ARM_KEEP_OABI ?= "1"
-- 
1.8.3.2


