Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 343CFE00307
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 30 Nov 2011 01:08:25 -0800 (PST)
Received: by eekc41 with SMTP id c41so232548eek.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 30 Nov 2011 01:08:25 -0800 (PST)
Received: by 10.14.10.20 with SMTP id 20mr158751eeu.79.1322644104821;
	Wed, 30 Nov 2011 01:08:24 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm4043157eec.10.2011.11.30.01.08.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 01:08:24 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed, 30 Nov 2011 10:08:18 +0100
Message-Id: <1322644098-9974-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux 3.0: fix regression introduced in 3.0.11
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
X-List-Received-Date: Wed, 30 Nov 2011 09:08:26 -0000

Upstream has been notified, so hopefully 3.0.13 will have this fix included

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-Fix-twl4030-dependencies-for-audio-codec.patch |   26 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch

diff --git a/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch b/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch
new file mode 100644
index 0000000..527b0f5
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch
@@ -0,0 +1,26 @@
+From 6d7bf5251219d2aa604ada2c955812b16ad5cff4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 30 Nov 2011 09:50:56 +0100
+Subject: [PATCH] Revert "mfd: Fix twl4030 dependencies for audio codec"
+
+This reverts commit 11b8fc6ae54bf18a48c94e181c37ca135b858b42.
+---
+ drivers/mfd/twl-core.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
+index f0dfca3..e659d4e 100644
+--- a/drivers/mfd/twl-core.c
++++ b/drivers/mfd/twl-core.c
+@@ -116,7 +116,7 @@
+ #define twl_has_watchdog()        false
+ #endif
+ 
+-#if defined(CONFIG_MFD_TWL4030_AUDIO) || defined(CONFIG_MFD_TWL4030_AUDIO_MODULE) ||\
++#if defined(CONFIG_TWL4030_CODEC) || defined(CONFIG_TWL4030_CODEC_MODULE) ||\
+ 	defined(CONFIG_SND_SOC_TWL6040) || defined(CONFIG_SND_SOC_TWL6040_MODULE)
+ #define twl_has_codec()	true
+ #else
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 5039b22..38b90e9 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.12"
 SRCREV_pn-${PN} = "ac6766564c0305ca020fe747dfd7dbdf0881369d"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
@@ -194,6 +194,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch \
             file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.patch \
             file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.patch \
+            file://beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch \
             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
             \
-- 
1.7.2.5


