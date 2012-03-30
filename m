Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61F97E0044D
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:33 -0700 (PDT)
Received: by wibhn6 with SMTP id hn6so749928wib.8
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=04YDaGRz28vUUGzPidXTTRlU/+MmhyH0FzQ5R42ooZI=;
	b=D7xLdcZCow/oUHCiC58vaNaQCoMwsC3Bb79A99DbRuJdZ2xeCixWidBK6Ufby4+C7A
	W4WWmahKX6vgkBG6VlGC9ExDglVWs4oV1BizZPJ4UVbnlX2CSbW2PzKyRz847s0Shsn9
	k3FXKHH68DfoitVC+HVhjt1SPtdh+p8L4YRG89rSs0igKYYKsfnxB8S0odLtOxFkoOf0
	HApTeL0Y3LjoIlDPlo00Wqx+Hb2P0X+xVxJuLXMOajR3pPDSRnLvFl2OLWHZYIu+ofxm
	JX4iP2nOlBYMbdymsgkYup5zN+ib00nbN61Y1ekWId1l7io1SLYBb+aHAsPXvxpdQ0cA
	32vQ==
MIME-Version: 1.0
Received: by 10.180.104.137 with SMTP id ge9mr783485wib.20.1333133912149;
	Fri, 30 Mar 2012 11:58:32 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm8515407wia.11.2012.03.30.11.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 11:58:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 30 Mar 2012 20:58:23 +0200
Message-Id: <1333133904-14404-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333133904-14404-1-git-send-email-koen@dominion.thruhere.net>
References: <1333133904-14404-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmwvdFeZOg6DyuCUJYsJa4EqB1H1HppqUz/DAOYXkZ3DVWaGv1hRNKyNF0wPSQmnIp7wySo
Cc: denys@ti.com
Subject: [PATCH 2/3] linux-ti33x-psp 3.2: improve cape support
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
X-List-Received-Date: Fri, 30 Mar 2012 18:58:33 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
https://github.com/angstrom-distribution/meta-ti/tree/pull20123003

 ...add-more-beagleboardtoys-cape-partnumbers.patch |   53 ++++++++
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |  129 ++++++++++++++++++++
 ...25-beaglebone-add-enter-key-for-lcd7-cape.patch |   40 ++++++
 .../0026-beaglebone-add-gpio-keys-for-lcd.patch    |  113 +++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 340 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
new file mode 100644
index 0000000..4c1fcfd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -0,0 +1,53 @@
+From a0bf4fec50d8a0690e6f4ded292d24fb00d9e01a Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 19 Mar 2012 12:01:35 +0100
+Subject: [PATCH 23/27] beaglebone: add more beagleboardtoys cape partnumbers
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   25 ++++++++++++++++++++++++-
+ 1 files changed, 24 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 36efca1..58a0e77 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1883,11 +1883,34 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_tsadcpins_free = 0;
+ 	}
+ 	
++	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing LCD cape\n");
++		bbtoys7lcd_init(0,0);
++		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
++		tsc_init(0,0);
++		beaglebone_tsadcpins_free = 0;
++	}
++	
++	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing VGA cape\n");
++		dvi_init(0,0);
++	}
++	
++	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing battery cape\n");
++		//foo_init(0,0);
++	}
++	
++	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
++		pr_info("BeagleBone cape: initializing serial cape\n");
++		//foo_init(0,0);
++	}
++	
+ 	if (!strncmp("TT3201-001", cape_config.partnumber, 10)) {
+ 		pr_info("BeagleBone cape: initializing CAN cape\n");
+ 		tt3201_init(0,0);
+ 	}
+-
++	
+ 	if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
+ 		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+ 		bone_tsc_init(0,0);
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
new file mode 100644
index 0000000..f5da1ed
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -0,0 +1,129 @@
+From 58f1b0546b2831d9ed15e8bf43f709085a60b2e9 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 19 Mar 2012 13:32:43 +0100
+Subject: [PATCH 24/27] beaglebone: add gpio-keys for lcd7, add notes for missing functionality for other capes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   79 +++++++++++++++++++++++++++++++++
+ 1 files changed, 79 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 58a0e77..7a2b851 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -980,6 +980,73 @@ static void volume_keys_init(int evm_id, int profile)
+ 		pr_err("failed to register matrix keypad (2x3) device\n");
+ }
+ 
++/* pinmux for lcd7 keys */
++static struct pinmux_config lcd7_keys_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{NULL, 0},
++};
++
++/* Configure GPIOs for lcd7 keys */
++static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
++	{
++		.code                   = KEY_LEFT,
++		.gpio                   = GPIO_TO_PIN(1, 16),
++		.active_low             = false,
++		.desc                   = "left",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_RIGHT,
++		.gpio                   = GPIO_TO_PIN(1, 17),
++		.active_low             = false,
++		.desc                   = "right",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_UP,
++		.gpio                   = GPIO_TO_PIN(1, 19),
++		.active_low             = false,
++		.desc                   = "up",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_DOWN,
++		.gpio                   = GPIO_TO_PIN(3, 16),
++		.active_low             = false,
++		.desc                   = "down",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++};
++
++static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
++	.buttons        = beaglebone_lcd7_gpio_keys,
++	.nbuttons       = ARRAY_SIZE(beaglebone_lcd7_gpio_keys),
++};
++
++static struct platform_device beaglebone_lcd7_keys = {
++	.name   = "gpio-keys",
++	.id     = -1,
++	.dev    = {
++		.platform_data  = &beaglebone_lcd7_gpio_key_info,
++	},
++};
++
++static void beaglebone_lcd7_keys_init(int evm_id, int profile)
++{
++	int err;
++	setup_pin_mux(lcd7_keys_pin_mux);
++	err = platform_device_register(&beaglebone_lcd7_keys);
++	if (err)
++		pr_err("failed to register gpio keys for LCD7 cape\n");
++}
++
+ /*
+ * @evm_id - evm id which needs to be configured
+ * @dev_cfg - single evm structure which includes
+@@ -1881,6 +1948,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: Registering PWM backlight for LCD cape\n");
+ 		enable_ehrpwm1(0,0);
+ 		beaglebone_tsadcpins_free = 0;
++		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
++		beaglebone_lcd7_keys_init(0,0);
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
+@@ -1889,6 +1958,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+ 		beaglebone_tsadcpins_free = 0;
++		// gpio1_16 -> button
++		// gpio1_17 -> button
++		// gpio3_19 -> button
++		// gpio1_28 -> button
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+@@ -1898,11 +1971,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	
+ 	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing battery cape\n");
++		// gpio1_6, P9_15 lowbat output
++		// AIN4, P9_33 vbat
+ 		//foo_init(0,0);
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
+ 		pr_info("BeagleBone cape: initializing serial cape\n");
++		// 01 -> CAN
++		// 02 -> Profibus
++		// 03 -> RS232
++		// 04 -> RS485
+ 		//foo_init(0,0);
+ 	}
+ 	
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch
new file mode 100644
index 0000000..7e93d61
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch
@@ -0,0 +1,40 @@
+From 18a371473e99ca637dafe68d9d77ebae4585b873 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 19 Mar 2012 14:26:37 +0100
+Subject: [PATCH 25/27] beaglebone: add enter key for lcd7 cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 7a2b851..ed2ff18 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -986,6 +986,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
+ 	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+ 	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+ 	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+ 	{NULL, 0},
+ };
+ 
+@@ -1023,6 +1024,14 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+ 		.type                   = EV_KEY,
+ 		.wakeup                 = 1,
+ 	},
++	{
++		.code                   = KEY_ENTER,
++		.gpio                   = GPIO_TO_PIN(3, 19),
++		.active_low             = false,
++		.desc                   = "enter",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
+ };
+ 
+ static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
new file mode 100644
index 0000000..2a36c19
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
@@ -0,0 +1,113 @@
+From ac98d63f016be414cbb91d283b0ef48f3c7c5b92 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 19 Mar 2012 15:15:06 +0100
+Subject: [PATCH 26/26] beaglebone: add gpio-keys for lcd
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   82 +++++++++++++++++++++++++++++++--
+ 1 files changed, 78 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index ed2ff18..badee96 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1056,6 +1056,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
+ 		pr_err("failed to register gpio keys for LCD7 cape\n");
+ }
+ 
++/* pinmux for lcd3 keys */
++static struct pinmux_config lcd3_keys_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_ben1.gpio1_28",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"ecap0_in_pwm0_out.gpio0_7",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{NULL, 0},
++};
++
++/* Configure GPIOs for lcd3 keys */
++static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
++	{
++		.code                   = KEY_LEFT,
++		.gpio                   = GPIO_TO_PIN(1, 16),
++		.active_low             = false,
++		.desc                   = "left",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_RIGHT,
++		.gpio                   = GPIO_TO_PIN(1, 17),
++		.active_low             = false,
++		.desc                   = "right",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_UP,
++		.gpio                   = GPIO_TO_PIN(3, 19),
++		.active_low             = false,
++		.desc                   = "up",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_DOWN,
++		.gpio                   = GPIO_TO_PIN(1, 28),
++		.active_low             = false,
++		.desc                   = "down",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_ENTER,
++		.gpio                   = GPIO_TO_PIN(0, 7),
++		.active_low             = false,
++		.desc                   = "down",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++};
++
++static struct gpio_keys_platform_data beaglebone_lcd3_gpio_key_info = {
++	.buttons        = beaglebone_lcd3_gpio_keys,
++	.nbuttons       = ARRAY_SIZE(beaglebone_lcd3_gpio_keys),
++};
++
++static struct platform_device beaglebone_lcd3_keys = {
++	.name   = "gpio-keys",
++	.id     = -1,
++	.dev    = {
++		.platform_data  = &beaglebone_lcd3_gpio_key_info,
++	},
++};
++
++static void beaglebone_lcd3_keys_init(int evm_id, int profile)
++{
++	int err;
++	setup_pin_mux(lcd3_keys_pin_mux);
++	err = platform_device_register(&beaglebone_lcd3_keys);
++	if (err)
++		pr_err("failed to register gpio keys for LCD3 cape\n");
++}
++
+ /*
+ * @evm_id - evm id which needs to be configured
+ * @dev_cfg - single evm structure which includes
+@@ -1967,10 +2043,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+-		// gpio1_16 -> button
+-		// gpio1_17 -> button
+-		// gpio3_19 -> button
+-		// gpio1_28 -> button
++		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
++		beaglebone_lcd3_keys_init(0,0);
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 0b54e26..e6277ce 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -667,4 +667,8 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
 	file://beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch \
 	file://beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch \
+	file://beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch \
+	file://beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch \
+	file://beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch \
+	file://beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch \
 "
-- 
1.7.2.5


