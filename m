Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04268E0153B
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 07:14:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OEENl8022287
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:14:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OEEN6V014898
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 09:14:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 09:14:23 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OEEJEE011487;
	Tue, 24 Sep 2013 09:14:21 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 24 Sep 2013 09:57:01 -0500
Message-ID: <1380034621-4413-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] linux: Inherit new machine_kernel_pr class
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
X-List-Received-Date: Tue, 24 Sep 2013 14:14:25 -0000
Content-Type: text/plain

* MACHINE_KERNEL_PR was originally defined in the kernel class located in
  meta-oe which overrode the version of the class in oe-core.
* Some time ago kernel.bbclass was removed from meta-oe and a separate class
  machine_kernel_pr was created to add support for MACHINE_KERNEL_PR.
* Since this variable is used significantly in both meta-ti and meta-arago make
  sure all the kernel recipes directly or indirectly inherit this new class.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
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
index fd7b671..f832b54 100644
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
index 694a164..50253ea 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
 
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
-- 
1.7.0.4


