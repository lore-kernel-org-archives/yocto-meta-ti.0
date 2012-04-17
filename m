Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B9E8E01411
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:07 -0700 (PDT)
Received: by werc1 with SMTP id c1so5374699wer.35
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=J0F9AWhs0YTKg29t+oxIkDmnKnZ8BrEf87o7WL+x5+c=;
	b=eJRz2N0Di7/Es1aCsPaN/i2nhG6PbVwJLXV5y5HxZKGwrsqJidgSvFNKWTc76U+ux8
	XraF1suUBZgKX7NIT5/SG4JikySzDQ0p7V6zd0muvzHec+T9zUUavwndZdoyWEsZRi6u
	7IhR386mvIasYvl9bOk7NUHMpAsYirC2U2buy3H7L9Xn+uLgUSyY51Z0eMcTwh7hYGqo
	4bH3vyB0Jf77NesUuliwCQqCtLa+wqq0SRKP2foC3bVLVzwhLEzdvidrqSe+G3W7mxsa
	Qw4C8Nq0leC6ML8A9HLuCa1nBfb2NJEgIHusr0rZIoyR20JEodOW1pccorNNsGdXd6xR
	rVxg==
Received: by 10.180.90.102 with SMTP id bv6mr6919729wib.6.1334666886491;
	Tue, 17 Apr 2012 05:48:06 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm26730406wix.8.2012.04.17.05.48.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:48:05 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:46 +0200
Message-Id: <1334666866-24955-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmZknpzb8agjLN5CrjC0LegroDAvmtyPe7XV3Tw03CLXE/FFCbnODZiem23odczuQyesK2e
Cc: denys@ti.com
Subject: [PATCH v2 7/7] linux-ti33x-psp 3.2: fix ehrPWM1 for beaglebone
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
X-List-Received-Date: Tue, 17 Apr 2012 12:48:07 -0000

This makes the backlight on teh 7" LCD cape work again. Also add a patch to print the hardware revision of the cape.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |   27 +++++++++++++++
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |   25 ++++++++++++++
 ...0029-beaglebone-also-report-cape-revision.patch |   36 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    5 ++-
 4 files changed, 92 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
new file mode 100644
index 0000000..59c1371
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
@@ -0,0 +1,27 @@
+From 22560ed5c9c2a4e693adf5981e47f3b5f363676d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 17 Apr 2012 11:25:00 +0200
+Subject: [PATCH 27/29] beaglebone: decrease PWM frequency to old value, LCD7
+ doesn't like it
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 74a7e91..b0ee67e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -136,7 +136,7 @@ static const struct display_panel disp_panel = {
+ /* LCD backlight platform Data */
+ #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
+ #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
+-#define AM335X_PWM_PERIOD_NANO_SECONDS        (5000 * 10)
++#define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 5)
+ 
+ #define PWM_DEVICE_ID   "ecap.0"
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
new file mode 100644
index 0000000..543c274
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
@@ -0,0 +1,25 @@
+From 2ade67b1a3c53567ea131902c3631f7d57b4332f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 17 Apr 2012 12:35:01 +0200
+Subject: [PATCH 28/29] beaglebone: fix ehrpwm backlight
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index b0ee67e..0d20bb1 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1434,6 +1434,7 @@ late_initcall(ecap0_init);
+ static void enable_ehrpwm1(int evm_id, int profile)
+ {
+ 	ehrpwm_backlight_enable = true;
++	am33xx_register_ehrpwm(1, &pwm_pdata[1]);
+ }
+ 
+ /* Setup pwm-backlight for bbtoys7lcd */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
new file mode 100644
index 0000000..de75a57
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
@@ -0,0 +1,36 @@
+From e6865fbe71c47846a528986effd6b21e4fe3f84b Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 17 Apr 2012 12:57:38 +0200
+Subject: [PATCH 29/29] beaglebone: also report cape revision
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 0d20bb1..bfcccd9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2097,6 +2097,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	int ret;
+ 	char tmp[32];
+ 	char name[32];
++	char version[4];
+ 	char manufacturer[32];
+ 
+ 	/* get cape specific data */
+@@ -2119,8 +2120,9 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 
+ 	pr_info("BeagleBone cape EEPROM: found eeprom at address 0x%x\n", capecount + 0x53);
+ 	snprintf(name, sizeof(cape_config.name) + 1, "%s", cape_config.name);
++	snprintf(version, sizeof(cape_config.version) + 1, "%s", cape_config.version);
+ 	snprintf(manufacturer, sizeof(cape_config.manufacturer) + 1, "%s", cape_config.manufacturer);
+-	pr_info("BeagleBone cape: %s %s\n", manufacturer, name);
++	pr_info("BeagleBone cape: %s %s, revision %s\n", manufacturer, name, version);
+ 	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
+ 	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 1dad0fb..d3a2f2e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -822,4 +822,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch \
 	file://beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch \
 	file://beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch \
+	file://beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch \
+	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
+	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
 "
-- 
1.7.2.5


