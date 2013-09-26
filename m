Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBA8FE01508
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 10:26:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7B231529E2; Thu, 26 Sep 2013 17:26:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130926172634.7B231529E2@arago-project.org>
Date: Thu, 26 Sep 2013 17:26:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "linux: Inherit new machine_kernel_pr class"
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
X-List-Received-Date: Thu, 26 Sep 2013 17:26:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 9e595df2976144c996ec3abc20db8f6dc08d7f0f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e595df2976144c996ec3abc20db8f6dc08d7f0f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep 26 12:32:16 2013 -0400

Revert "linux: Inherit new machine_kernel_pr class"

This adds a new mandatory dependency on meta-openembedded layer. While we are
still trying to resolve an existing optional dependency, not bring a new one.
The MACHINE_KERNEL_PR requirement will need to be handled differently.

This reverts commit 6c1ab34c88edc127ff2835d87b48f4b10fe8ba0b.

---

 recipes-kernel/linux/linux-am335x-psp_3.2.bb |    2 +-
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 recipes-kernel/linux/linux.inc               |    2 +-
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


