Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2A46E01401
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 09:06:56 -0700 (PDT)
Received: by wgbdq13 with SMTP id dq13so3389332wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 09:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=BRDB8aX/7PGy8obR4TSUljqJL37FcGwrUS0dlenSRVY=;
	b=TScwlSlNnQXJ3Os2vhKAZspKEaWBoMHMRpsc6rfmenP1JdoENj2m6UlGexUhXnZaD0
	yytthPc4Wwho2z1c/addyRqiWowXe66nf9jObKcq6zGKttf3mtwgEazzFq3Kke4c6Hvc
	qun7BxNfPIQ0+vcmjc+pkJ1927Stg5exCmp+jSl3rsYCrMvCltWsE2feZ1PG4SPOIyIZ
	59AWr7jZKgpBFKTddA9jFMD7gJG2GCJQVb7/jHdAlVfEtp7dm6JNiMMnEj8XPKeWgxzV
	jHJLILqoZQwM8P2TVAyRdL0z3YFLL0IDDmGedfqDYHztIKfNLRnSeq8QkxgRE6OxBk9Y
	fvHA==
Received: by 10.180.82.132 with SMTP id i4mr17096262wiy.12.1333987615820;
	Mon, 09 Apr 2012 09:06:55 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ea6sm31264041wib.5.2012.04.09.09.06.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 09:06:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  9 Apr 2012 18:06:43 +0200
Message-Id: <1333987604-1614-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
References: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQktmvvkzVjSpmPkpih9evgjjZFrhorkRJPNIm7G+znARJYQeUzbuNERRmEfuPDtiHrbLT5Z
Cc: denys@ti.com
Subject: [PATCH 4/5] linux-ti335x-psp 3.2: fix 3.5" cape support, turn on CONFIG_AUDIT
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
X-List-Received-Date: Mon, 09 Apr 2012 16:06:57 -0000

* bump MACHINE_KERNEL_PR for the CONFIG_AUDIT change

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...027-beaglebone-fix-direction-of-gpio-keys.patch |  107 +++++++++++++++++++
 .../0028-beaglebone-fix-3.5-lcd-cape-support.patch |  109 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +
 5 files changed, 223 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index df92c93..1ede65c 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r8"
+MACHINE_KERNEL_PR = "r9"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch
new file mode 100644
index 0000000..330078e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch
@@ -0,0 +1,107 @@
+From 06132a893d83cf2dc128ad9b37b56be6a6d4714c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 26 Mar 2012 20:28:56 +0200
+Subject: [PATCH 27/28] beaglebone: fix direction of gpio-keys
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 5318c41..fdeed59 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -995,7 +995,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_LEFT,
+ 		.gpio                   = GPIO_TO_PIN(1, 16),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "left",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1003,7 +1003,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_RIGHT,
+ 		.gpio                   = GPIO_TO_PIN(1, 17),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "right",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1011,7 +1011,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_UP,
+ 		.gpio                   = GPIO_TO_PIN(1, 19),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "up",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1019,7 +1019,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_DOWN,
+ 		.gpio                   = GPIO_TO_PIN(3, 16),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "down",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1027,7 +1027,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_ENTER,
+ 		.gpio                   = GPIO_TO_PIN(3, 19),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "enter",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1071,7 +1071,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_LEFT,
+ 		.gpio                   = GPIO_TO_PIN(1, 16),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "left",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1079,7 +1079,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_RIGHT,
+ 		.gpio                   = GPIO_TO_PIN(1, 17),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "right",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1087,7 +1087,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_UP,
+ 		.gpio                   = GPIO_TO_PIN(3, 19),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "up",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1095,7 +1095,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_DOWN,
+ 		.gpio                   = GPIO_TO_PIN(1, 28),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "down",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+@@ -1103,7 +1103,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_ENTER,
+ 		.gpio                   = GPIO_TO_PIN(0, 7),
+-		.active_low             = false,
++		.active_low             = true,
+ 		.desc                   = "down",
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch
new file mode 100644
index 0000000..22e8cdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch
@@ -0,0 +1,109 @@
+From ef33c4aefb684a67d1983803688a03826d33b80f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 29 Feb 2012 17:25:22 +0100
+Subject: [PATCH 28/28] beaglebone: fix 3.5" lcd cape support
+
+* proper timings
+* fix gpio conflict
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
+ drivers/video/da8xx-fb.c              |   14 +++++++++++
+ 2 files changed, 55 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index fdeed59..f9057cc 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -211,6 +211,29 @@ struct da8xx_lcdc_platform_data bbtoys7_pdata = {
+ 	.type			= "TFC_S9700RTWV35TR_01B",
+ };
+ 
++static struct lcd_ctrl_config bbtoys35_cfg = {
++	&bbtoys7_panel,
++	.ac_bias		= 255,
++	.ac_bias_intrpt		= 0,
++	.dma_burst_sz		= 16,
++	.bpp			= 16,
++	.fdd			= 0x80,
++	.tft_alt_mode		= 0,
++	.stn_565_mode		= 0,
++	.mono_8bit_mode		= 0,
++	.invert_line_clock	= 1,
++	.invert_frm_clock	= 1,
++	.sync_edge		= 0,
++	.sync_ctrl		= 1,
++	.raster_order		= 0,
++};
++
++struct da8xx_lcdc_platform_data bbtoys35_pdata = {
++	.manu_name		= "BBToys",
++	.controller_data	= &bbtoys35_cfg,
++	.type			= "CDTech_S035Q01",
++};
++
+ static const struct display_panel dvi_panel = {
+ 	WVGA,
+ 	16,
+@@ -1461,6 +1484,23 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++static void bbtoys35lcd_init(int evm_id, int profile)
++{
++	setup_pin_mux(bbtoys7_pin_mux);
++	
++	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
++	if (conf_disp_pll(16000000)) {
++		pr_info("Failed to set pixclock to 16000000, not attempting to"
++				"register LCD cape\n");
++		return;
++	}
++	
++	if (am33xx_register_lcdc(&bbtoys35_pdata))
++		pr_info("Failed to register Beagleboardtoys 3.5\" LCD cape device\n");
++	
++	return;
++}
++
+ #define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
+ 
+ static void dvi_init(int evm_id, int profile)
+@@ -2039,7 +2079,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	
+ 	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+-		bbtoys7lcd_init(0,0);
++		bbtoys35lcd_init(0,0);
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
+index dea8936..312c72c 100644
+--- a/drivers/video/da8xx-fb.c
++++ b/drivers/video/da8xx-fb.c
+@@ -285,6 +285,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+ 		.pxl_clk = 56000000,
+ 		.invert_pxl_clk = 0,
+ 	},
++	[4] = {
++		 /* CDTech S035Q01 */ 
++		.name = "CDTech_S035Q01",
++		.width = 320,
++		.height = 240,
++		.hfp = 58,
++		.hbp = 21,
++		.hsw = 47,
++		.vfp = 23,
++		.vbp = 11,
++		.vsw = 2,
++		.pxl_clk = 8000000,
++		.invert_pxl_clk = 0,
++	},	
+ };
+ 
+ /* Enable the Raster Engine of the LCD Controller */
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 782f52d..8a6b905 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.6 Kernel Configuration
+# Linux/arm 3.2.14 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -58,7 +58,7 @@ CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
-# CONFIG_AUDIT is not set
+CONFIG_AUDIT=y
 CONFIG_HAVE_GENERIC_HARDIRQS=y
 
 #
@@ -636,6 +636,7 @@ CONFIG_NETFILTER_XTABLES=m
 #
 # Xtables targets
 #
+CONFIG_NETFILTER_XT_TARGET_AUDIT=m
 # CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
 # CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
 # CONFIG_NETFILTER_XT_TARGET_LED is not set
@@ -2914,7 +2915,6 @@ CONFIG_PRISM2_USB=m
 # CONFIG_ASUS_OLED is not set
 # CONFIG_PANEL is not set
 CONFIG_R8712U=m
-CONFIG_R8712_AP=y
 CONFIG_RTS5139=m
 # CONFIG_RTS5139_DEBUG is not set
 # CONFIG_TRANZPORT is not set
@@ -3545,6 +3545,7 @@ CONFIG_CRC32=y
 CONFIG_CRC7=y
 CONFIG_LIBCRC32C=y
 # CONFIG_CRC8 is not set
+CONFIG_AUDIT_GENERIC=y
 CONFIG_ZLIB_INFLATE=y
 CONFIG_ZLIB_DEFLATE=y
 CONFIG_LZO_COMPRESS=y
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 9a5d31f..9375372 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -818,4 +818,6 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch \
 	file://beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch \
 	file://beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch \
+	file://beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch \
+	file://beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch \
 "
-- 
1.7.2.5


