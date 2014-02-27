Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B602E007E1
	for <meta-ti@yoctoproject.org>; Thu, 27 Feb 2014 11:09:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1O00D77571JT50@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 27 Feb 2014 13:09:11 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 01B252009B; Thu,
	27 Feb 2014 14:09:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 27 Feb 2014 14:09:00 -0500
Message-id: <1393528140-5176-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: rebase patch to disable SMP to apply cleanly
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
X-List-Received-Date: Thu, 27 Feb 2014 19:09:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

No PR bump is needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch} | 10 +++++-----
 recipes-kernel/linux/linux-ti-staging_3.12.bb                  |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename recipes-kernel/linux/linux-ti-staging/{0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch => 0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch} (87%)

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
-- 
1.8.3.2


