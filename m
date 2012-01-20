Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83787E00B0A
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2012 04:50:00 -0800 (PST)
Received: by wibhr12 with SMTP id hr12so436594wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2012 04:49:59 -0800 (PST)
Received: by 10.180.8.103 with SMTP id q7mr28933553wia.1.1327063799244;
	Fri, 20 Jan 2012 04:49:59 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bu13sm8750332wib.6.2012.01.20.04.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 04:49:58 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 20 Jan 2012 13:49:52 +0100
Message-Id: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] u-boot 2011.12: fix L2 cache on non-omap4 platforms
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
X-List-Received-Date: Fri, 20 Jan 2012 12:50:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...7-disable-L2-cache-in-cleanup_before_linu.patch |   25 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.12.bb               |    7 ++++-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch b/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
new file mode 100644
index 0000000..ea94709
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
@@ -0,0 +1,25 @@
+From 9ac047a112d8c6fe25e71a78946dbe9d707abd98 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@opensdr.com>
+Date: Mon, 16 Jan 2012 09:45:11 -0500
+Subject: [PATCH] Revert "armv7: disable L2 cache in cleanup_before_linux()"
+
+This reverts commit dc7100f4080952798413fb63bb4134b22c57623a.
+---
+ arch/arm/cpu/armv7/cpu.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/cpu/armv7/cpu.c b/arch/arm/cpu/armv7/cpu.c
+index 662c496..091e3e0 100644
+--- a/arch/arm/cpu/armv7/cpu.c
++++ b/arch/arm/cpu/armv7/cpu.c
+@@ -65,7 +65,6 @@ int cleanup_before_linux(void)
+ 	 * dcache_disable() in turn flushes the d-cache and disables MMU
+ 	 */
+ 	dcache_disable();
+-	v7_outer_cache_disable();
+ 
+ 	/*
+ 	 * After D-cache is flushed and before it is disabled there may
+-- 
+1.7.6.5
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 7554bad..4e50edb 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,11 +6,15 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r2"
+PR = "r3"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
 
+# Non-omap4 platforms need outer cache turned on
+CACHEFIX = "file://2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
+CACHEFIX_omap4 = ""
+
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch \
            file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
@@ -19,6 +23,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0005-omap4-common-use-ext4-by-default.patch \
            file://2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
            file://0001-config-Always-use-GNU-ld.patch \
+           ${CACHEFIX} \
           "
 
 # v2011.12 tag
-- 
1.7.2.5


