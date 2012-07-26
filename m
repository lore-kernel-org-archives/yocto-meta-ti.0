Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B679E013DB
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4FCF252A72; Thu, 26 Jul 2012 01:32:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013211.4FCF252A72@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: fix audio/spidev clash on beaglebone
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 24ba2ae0857e9a2cd0221e33aa6e7888328db817
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24ba2ae0857e9a2cd0221e33aa6e7888328db817

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Jun 26 09:47:54 2012 +0200

linux-ti33x-psp 3.2: fix audio/spidev clash on beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0072-beaglebone-fix-audio-spi-clash.patch      |   25 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
new file mode 100644
index 0000000..a916ad5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
@@ -0,0 +1,25 @@
+From 45ddec832968e3c1e31cf38a891372ba80027e2d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 26 Jun 2012 08:39:04 +0200
+Subject: [PATCH] beaglebone: fix audio/spi clash
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index f6559b6..d0681a2 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2910,6 +2910,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		
+ 		beaglebone_leds_free = 0;
+ 		dvileds_init(0,0);
++		beaglebone_spi1_free = 0;
+ 		mcasp0_init(0,0);
+ 	
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 645d4dc..ab42c44 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1536,4 +1536,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch \
 	file://beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
 	file://beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch \
+	file://beaglebone/0072-beaglebone-fix-audio-spi-clash.patch \
 "


