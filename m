Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 672C2E0129D
	for <meta-ti@yoctoproject.org>; Fri, 29 Mar 2013 10:35:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 68BFF52A51; Fri, 29 Mar 2013 17:35:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130329173547.68BFF52A51@arago-project.org>
Date: Fri, 29 Mar 2013 17:35:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux: Use setup-defconfig in kernel recipes
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
X-List-Received-Date: Fri, 29 Mar 2013 17:35:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ca0f68d71b08de156c4424324466aab0ebc7296f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ca0f68d71b08de156c4424324466aab0ebc7296f

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Mar 29 09:37:51 2013 -0500

linux: Use setup-defconfig in kernel recipes

* Now that the setup-defconfig.inc file has been moved to the
  meta-ti layer the kernel recipes should include this file.
* This makes way to clear this inclusion from the bbappend files
  in meta-arago

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-am335x_3.2.0-psp04.06.00.08.bb     |    3 ++-
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |    3 ++-
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb  |    3 ++-
 recipes-kernel/linux/linux_3.3.7.bb                |    3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb b/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb
index 49d6734..74394a6 100644
--- a/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb
+++ b/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE = "ti33x"
 DEFAULT_PREFERENCE = "-1"
 
 inherit kernel
+require setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
 DEPENDS += "am33x-cm3"
@@ -14,7 +15,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 BRANCH = "v3.2-staging"
 
diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index 9eacfc9..5d72af5 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -1,4 +1,5 @@
 require linux.inc
+require setup-defconfig.inc
 
 DESCRIPTION = "Linux kernel for OMAP3 EVM from PSP, based on linux-omap3 kernel"
 
@@ -8,7 +9,7 @@ SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
            file://defconfig"
diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 0b6c50d..e4a5451 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -5,8 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 require multi-kernel.inc
 require tipspkernel.inc
+require setup-defconfig.inc
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-kernel/linux/linux_3.3.7.bb
index 1928036..e38b6c2 100644
--- a/recipes-kernel/linux/linux_3.3.7.bb
+++ b/recipes-kernel/linux/linux_3.3.7.bb
@@ -9,12 +9,13 @@ DEFAULT_PREFERENCE = "-1"
 COMPATIBLE_MACHINE = "beagleboard"
 
 inherit kernel
+require setup-defconfig.inc
 
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see
 # conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 BRANCH = "linux-3.3.y"
 SRCREV = "v3.3.7"


