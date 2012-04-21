Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B17F1E013E8
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 17:06:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7149652A38; Sat, 21 Apr 2012 00:06:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120421000628.7149652A38@arago-project.org>
Date: Sat, 21 Apr 2012 00:06:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: fix VGA cape detection for beaglebone
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
X-List-Received-Date: Sat, 21 Apr 2012 00:06:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2585c8864b5ba85c9aa1fe81e21e771173125b97
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2585c8864b5ba85c9aa1fe81e21e771173125b97

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Apr 19 17:33:34 2012 +0200

linux-ti33x-psp 3.2: fix VGA cape detection for beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...don-t-compare-undefined-characters-it-mak.patch |   26 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
new file mode 100644
index 0000000..48e8c53
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
@@ -0,0 +1,26 @@
+From 6e14ab85bd71ec3831169d665c4e79f646a60df8 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 19 Apr 2012 07:55:55 +0200
+Subject: [PATCH 30/30] beaglebone: don't compare undefined characters, it makes strncomp fail
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index bfcccd9..08a0425 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2152,7 +2152,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_lcd3_keys_init(0,0);
+ 	}
+ 	
+-	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
++	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
+ 		pr_info("BeagleBone cape: initializing VGA cape\n");
+ 		dvi_init(0,0);
+ 	}
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index d3a2f2e..f560a1d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -825,4 +825,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
+	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
 "


