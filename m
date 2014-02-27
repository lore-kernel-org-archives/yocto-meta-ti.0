Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E89BE00784
	for <meta-ti@yoctoproject.org>; Thu, 27 Feb 2014 11:22:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C888252A69; Thu, 27 Feb 2014 19:22:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140227192242.C888252A69@arago-project.org>
Date: Thu, 27 Feb 2014 19:22:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: rebase patch to disable SMP to apply cleanly
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
X-List-Received-Date: Thu, 27 Feb 2014 19:22:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3b596055fe6f5e6c7d4e885e114c121f1ecd0c42
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3b596055fe6f5e6c7d4e885e114c121f1ecd0c42

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 27 14:07:18 2014 -0500

linux-ti-staging: rebase patch to disable SMP to apply cleanly

No PR bump is needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...e-ARM-config-omap-Disable-SMP-for-AM335x.patch} |   10 +++++-----
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
similarity index 87%
rename from recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
rename to recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
index 8e016b4..a389e5c 100644
--- a/recipes-kernel/linux/linux-ti-staging/0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
+++ b/recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
@@ -1,7 +1,7 @@
-From 2f6cbe000b1d31c91eee0248f24b0c306aadeb63 Mon Sep 17 00:00:00 2001
+From bd9c0b09db8798815cb577f82beebf7e6c03edcd Mon Sep 17 00:00:00 2001
 From: Santosh Shilimkar <santosh.shilimkar@ti.com>
 Date: Thu, 13 Feb 2014 08:52:41 -0500
-Subject: [PATCH 2/2] Not-for-merge: ARM: config: omap: Disable SMP for AM335x
+Subject: [PATCH] Not-for-merge: ARM: config: omap: Disable SMP for AM335x
  build
 
 SMP and SMP_ON_UP introduces some extra barriers and code many fast paths
@@ -28,7 +28,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
-index a34b45a..bb6beb2 100644
+index ff579a7..25217e3 100644
 --- a/arch/arm/configs/omap2plus_defconfig
 +++ b/arch/arm/configs/omap2plus_defconfig
 @@ -36,8 +36,6 @@ CONFIG_OMAP4_ERRATA_I688=y
@@ -37,9 +37,9 @@ index a34b45a..bb6beb2 100644
  CONFIG_PCIE_DRA7XX=y
 -CONFIG_SMP=y
 -CONFIG_NR_CPUS=2
- CONFIG_PREEMPT_VOLUNTARY=y
  CONFIG_CMA=y
- CONFIG_ZBOOT_ROM_TEXT=0x0
+ CONFIG_PREEMPT_VOLUNTARY=y
+ CONFIG_LEDS=y
 -- 
 1.8.3.2
 
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 7982c0d..1b97ab2 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -48,5 +48,5 @@ SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;bra
           "
 
 # Disable SMP in defconfig on single-core platforms to reduce overhead
-SRC_URI_append_ti33x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-SRC_URI_append_ti43x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+SRC_URI_append_ti33x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
+SRC_URI_append_ti43x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"


