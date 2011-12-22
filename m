Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07799E005A3
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 00:20:43 -0800 (PST)
Received: by wibhq2 with SMTP id hq2so3021047wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 00:20:42 -0800 (PST)
Received: by 10.180.96.72 with SMTP id dq8mr21183170wib.10.1324542042350;
	Thu, 22 Dec 2011 00:20:42 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fw16sm8775547wbb.13.2011.12.22.00.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 00:20:41 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 22 Dec 2011 09:20:26 +0100
Message-Id: <1324542026-29756-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux 3.0: update to 3.0.14
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
X-List-Received-Date: Thu, 22 Dec 2011 08:20:44 -0000

Also make oprofile a module to workaround an oprofile bug highlighted in 3.0.13

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../linux/linux-3.0/beagleboard/defconfig          |    4 ++--
 recipes-kernel/linux/linux_3.0.bb                  |    9 ++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 4530ae1..fc252ba 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r113"
+MACHINE_KERNEL_PR = "r114"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
index 0b150c5..5f2a7eb 100644
--- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Linux/arm 3.0.7 Kernel Configuration
+# Linux/arm 3.0.14 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -149,7 +149,7 @@ CONFIG_SLAB=y
 # CONFIG_SLUB is not set
 # CONFIG_SLOB is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
+CONFIG_OPROFILE=m
 CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
 CONFIG_HAVE_KPROBES=y
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 38b90e9..d72826b 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.12"
-# v3.0.12 tag
-SRCREV_pn-${PN} = "ac6766564c0305ca020fe747dfd7dbdf0881369d"
+PV = "3.0.14"
+# v3.0.14 tag
+SRCREV_pn-${PN} = "6636552f1dd0d2e2be2f87605ea2cd3aa4d2e5b6"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
@@ -194,7 +194,6 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch \
             file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.patch \
             file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.patch \
-            file://beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch \
             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
             \
-- 
1.7.2.5


