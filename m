Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1943FE0142A
	for <meta-ti@yoctoproject.org>; Thu,  7 Jun 2012 08:40:57 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so313432eek.35
	for <meta-ti@yoctoproject.org>; Thu, 07 Jun 2012 08:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=6C6M1mcvUyHc50BJSJI5g+uSOHwgmNILqSFG1qqy2UM=;
	b=ay8K93GW/F4IG0gJCaBIKNrTMDa4vKtz5O6UmPzG1ccJyCbMa88ajSuwaJgIAP4ake
	mJQgOydWd5tSqAA2705bM3+PvqZiEISOHpFtUXEfai8AK9J2F00aUegxEMR4AxijEWQ4
	GrgJBjb7B9CHmY5sa6G3ukTO78JsWU6mdF9cpCoqjuf6HG9V1XXMv0C8e83u2bOu1skp
	446+cRabc9Fw+WPrHkW1BXOt3bqvouB9LYfj0Rkp3qfbdKmVpmSjFXNDRErIPboWvXSe
	BOYsP79mhru5kh1q8spGKey2fjQDMbsGN3qPTRKQvsYxvxM3a2zCL8tRnBPrP/L0HING
	WAww==
Received: by 10.14.40.84 with SMTP id e60mr1414481eeb.75.1339083657363;
	Thu, 07 Jun 2012 08:40:57 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id n52sm12172901eeh.9.2012.06.07.08.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 08:40:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Jun 2012 17:40:41 +0200
Message-Id: <1339083645-18356-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
References: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmMlFteNIndRXwnuoXD2H10jSEu+rIR5ilrDzFDnFNQdwHK5f8qN1nLFdBlHKR9yH4wSHiE
Cc: denys@ti.com
Subject: [PATCHv2 3/7] linux-ti33x-psp 3.2: fix buttons on LCD capes
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
X-List-Received-Date: Thu, 07 Jun 2012 15:40:58 -0000

One patch to add button layout for the a1 revision of the 3.5" LCD cape and another patch to stop spidev from loading when SPI1_D1 is used as gpio

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...69-beaglebone-add-support-for-LCD3-rev-A1.patch |  132 ++++++++++++++++++++
 ...fix-buttons-spidev-clash-when-using-mcasp.patch |   52 ++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 +-
 3 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
new file mode 100644
index 0000000..d9bc2b5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
@@ -0,0 +1,132 @@
+From b61b89f98ac85ccd8d503a902bad208343ed0aba Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 4 Jun 2012 14:38:02 +0200
+Subject: [PATCH] beaglebone: add support for LCD3 rev A1
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   94 +++++++++++++++++++++++++++++----
+ 1 files changed, 83 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index bb6049a..51bfa8b 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1136,7 +1136,7 @@ static struct pinmux_config lcd3_keys_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
+-/* Configure GPIOs for lcd3 keys */
++/* Configure GPIOs for lcd3 rev A or earlier keys */
+ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_LEFT,
+@@ -1193,14 +1193,72 @@ static struct platform_device beaglebone_lcd3_keys = {
+ 	},
+ };
+ 
+-static void beaglebone_lcd3_keys_init(int evm_id, int profile)
+-{
+-	int err;
+-	setup_pin_mux(lcd3_keys_pin_mux);
+-	err = platform_device_register(&beaglebone_lcd3_keys);
+-	if (err)
+-		pr_err("failed to register gpio keys for LCD3 cape\n");
+-}
++/* pinmux for lcd3 A1 or newer keys */
++static struct pinmux_config lcd3a1_keys_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Left
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Right
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Up
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Down
++	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Enter
++	{NULL, 0},
++};
++
++/* Configure GPIOs for lcd3 rev A1 or newer keys */
++static struct gpio_keys_button lcd3a1_gpio_keys[] = {
++	{
++		.code                   = KEY_LEFT,
++		.gpio                   = GPIO_TO_PIN(1, 16),
++		.active_low             = true,
++		.desc                   = "left",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_RIGHT,
++		.gpio                   = GPIO_TO_PIN(1, 17),
++		.active_low             = true,
++		.desc                   = "right",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_UP,
++		.gpio                   = GPIO_TO_PIN(1, 19),
++		.active_low             = true,
++		.desc                   = "up",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_DOWN,
++		.gpio                   = GPIO_TO_PIN(3, 16),
++		.active_low             = true,
++		.desc                   = "down",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_ENTER,
++		.gpio                   = GPIO_TO_PIN(3, 19),
++		.active_low             = true,
++		.desc                   = "enter",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++};
++
++static struct gpio_keys_platform_data lcd3a1_gpio_key_info = {
++	.buttons        = lcd3a1_gpio_keys,
++	.nbuttons       = ARRAY_SIZE(lcd3a1_gpio_keys),
++};
++
++static struct platform_device lcd3a1_keys = {
++	.name   = "gpio-keys",
++	.id     = -1,
++	.dev    = {
++		.platform_data  = &lcd3a1_gpio_key_info,
++	},
++};
+ 
+ /*
+ * @evm_id - evm id which needs to be configured
+@@ -2691,8 +2749,22 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+-		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+-		beaglebone_lcd3_keys_init(0,0);
++		
++		if (!strncmp("00A0", cape_config.version, 4)) {
++			pr_info("BeagleBone cape: Registering gpio-keys for LCD3 rev A or earlier cape\n");
++			int err;
++			setup_pin_mux(lcd3_keys_pin_mux);
++			err = platform_device_register(&beaglebone_lcd3_keys);
++			if (err)
++				pr_err("failed to register gpio keys for LCD3 rev A or earlier cape\n");
++		} else {
++			pr_info("BeagleBone cape: Registering gpio-keys for LCD rev A1 or later cape\n");
++			int err;
++			setup_pin_mux(lcd3a1_keys_pin_mux);
++			err = platform_device_register(&lcd3a1_keys);
++			if (err)
++				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
++		}
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
new file mode 100644
index 0000000..ae277fa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
@@ -0,0 +1,52 @@
+From d99bad03ee2f3cc3d9a61879e53e4795a05eaed3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 6 Jun 2012 11:20:21 +0200
+Subject: [PATCH 70/70] beaglebone: fix buttons/spidev clash when using
+ mcasp0_axr0.gpio3_16
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 51bfa8b..7fd611f 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1051,12 +1051,11 @@ static void volume_keys_init(int evm_id, int profile)
+ 
+ /* pinmux for lcd7 keys */
+ static struct pinmux_config lcd7_keys_pin_mux[] = {
+-	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_ben1.gpio1_28",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //left
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //right
++	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //up
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //down
++	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //enter
+ 	{NULL, 0},
+ };
+ 
+@@ -2738,6 +2737,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+ 		beaglebone_lcd7_keys_init(0,0);
+ 		
++		beaglebone_spi1_free = 0;
+ 		// A1 or newer
+ 		beaglebone_leds_free = 0;
+ 		lcd7leds_init(0,0);
+@@ -2765,6 +2765,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			if (err)
+ 				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
+ 		}
++		beaglebone_spi1_free = 0;
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index e3a427b..f279b24 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1228,4 +1228,6 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch \
 	file://beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch \
 	file://beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch \
+	file://beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch \
+	file://beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
 "
-- 
1.7.10


