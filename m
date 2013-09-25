Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92114E01609
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 15:51:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7476A529E7; Wed, 25 Sep 2013 22:51:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925225155.7476A529E7@arago-project.org>
Date: Wed, 25 Sep 2013 22:51:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux: Inherit new machine_kernel_pr class
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
X-List-Received-Date: Wed, 25 Sep 2013 22:51:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1450f1938007bede786160c501c8fd268b661c5e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1450f1938007bede786160c501c8fd268b661c5e

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Tue Sep 24 09:57:01 2013 -0500

linux: Inherit new machine_kernel_pr class

* MACHINE_KERNEL_PR was originally defined in the kernel class located in
  meta-oe which overrode the version of the class in oe-core.
* Some time ago kernel.bbclass was removed from meta-oe and a separate class
  machine_kernel_pr was created to add support for MACHINE_KERNEL_PR.
* Since this variable is used significantly in both meta-ti and meta-arago make
  sure all the kernel recipes directly or indirectly inherit this new class.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-am335x-psp_3.2.bb |    2 +-
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 recipes-kernel/linux/linux.inc               |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index eaf788f..cf1b2dd 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "ti33x"
 
 DEFAULT_PREFERENCE = "-1"
 
-inherit kernel
+inherit kernel machine_kernel_pr
 require setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 5fd17f8..d7aebea 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
-inherit kernel
+inherit kernel machine_kernel_pr
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 833fb48..8e6d198 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
-inherit kernel
+inherit kernel machine_kernel_pr
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 778ea7f..b75e650 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Linux kernel for TI devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-inherit kernel
+inherit kernel machine_kernel_pr
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index ac51dae..e0d414c 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-inherit kernel siteinfo
+inherit kernel siteinfo machine_kernel_pr
 
 # Enable OABI compat for people stuck with obsolete userspace
 ARM_KEEP_OABI ?= "1"


