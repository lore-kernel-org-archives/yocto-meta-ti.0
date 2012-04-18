Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D3C4E01416
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BC44552AA5; Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172030.BC44552AA5@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: fix ehrPWM1 for beaglebone
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
X-List-Received-Date: Wed, 18 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 933898d1a9d7c9805ea8c445bb2d8bbf54d49900
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=933898d1a9d7c9805ea8c445bb2d8bbf54d49900

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:46 2012 +0200

linux-ti33x-psp 3.2: fix ehrPWM1 for beaglebone

This makes the backlight on teh 7" LCD cape work again. Also add a patch to
print the hardware revision of the cape.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |   27 +++++++++++++++
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |   25 ++++++++++++++
 ...0029-beaglebone-also-report-cape-revision.patch |   36 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    5 ++-
 4 files changed, 92 insertions(+), 1 deletions(-)

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


