Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD8B2E01420
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:05 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so937547wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2qXXMykORhyG1xgWcGp1lUMkWfMMu2gL4sBTmLSF3Tc=;
	b=F1dDmegE+Ixj5n0mWukE2kFY41ss9HQKLGh0Lsz6bic4fN++lU/Y8hPGEf+5gJ6LkB
	A0LQIFGH0aY8kso8ZudtSZOuwI2mkcJfMroFrRmKY4tx7AIHHL1QQ+YxLrk7IzOAuhgB
	VXIDdfHR+FJ3vqLg4K5BcL2SF7YIeWxuZYv4ARmEnNtUYOZm28fgcVYNCmX8diugASrP
	SEGzrjgCWjLsvqrLF1/eeRrODqNUsExYIG8fPumf52vpCOxgBmXyOz53/U7BNoR9onDb
	OC6PtMyABtV2C5RZ/rVpZRsigHAn9xYdvBwNdvI71snsWduPG7ftGYXvRER1CfsenOHs
	NmUA==
Received: by 10.180.86.194 with SMTP id r2mr7550507wiz.15.1336640405097;
	Thu, 10 May 2012 02:00:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 6sm1966063wiz.1.2012.05.10.02.00.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:29 +0200
Message-Id: <1336640375-20418-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQloE8QPKeBDeLmuC9+sfR76W1pYOw7wMvOYuBtrtfBA/OUb77v/6N4+V5VNKhBs3ZUrKF1h
Cc: denys@ti.com
Subject: [PATCH v3 07/13] linux-ti335x-psp 3.2: add support for CAN, RS232 and Battery beaglebone capes
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
X-List-Received-Date: Thu, 10 May 2012 09:00:06 -0000

Also change defconfig to prepare for audio support and fix lcd35 pinmux

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0033-beaglebone-fix-3.5-cape-support.patch     |   73 +++++++++++++++++
 ...-connect-batterycape-GPIO-to-gpio-charger.patch |   84 ++++++++++++++++++++
 ...lebone-add-support-for-CAN-and-RS232-cape.patch |   67 ++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   21 +++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    5 +-
 5 files changed, 238 insertions(+), 12 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch
new file mode 100644
index 0000000..caee6fc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch
@@ -0,0 +1,73 @@
+From d698dff8ded6583a447d81362534bacf77b8cbe5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 19 Apr 2012 14:33:53 +0200
+Subject: [PATCH 33/35] beaglebone: fix 3.5" cape support
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
+ 1 files changed, 41 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 08a0425..7a4b766 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -597,6 +597,46 @@ static struct pinmux_config dvi_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for Beagleboardtoys 3.5" LCD cape */
++static struct pinmux_config bbtoys35_pin_mux[] = {
++	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data2.lcd_data2",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data3.lcd_data3",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data4.lcd_data4",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data5.lcd_data5",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data6.lcd_data6",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data7.lcd_data7",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data8.lcd_data8",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data9.lcd_data9",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data10.lcd_data10",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data11.lcd_data11",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data12.lcd_data12",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data13.lcd_data13",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data14.lcd_data14",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_data15.lcd_data15",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++		| AM33XX_PULL_DISA},
++	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{NULL, 0},
++};
+ /* Module pin mux for Beagleboardtoys 7" LCD cape */
+ static struct pinmux_config bbtoys7_pin_mux[] = {
+ 	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+@@ -1512,7 +1552,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+ 
+ static void bbtoys35lcd_init(int evm_id, int profile)
+ {
+-	setup_pin_mux(bbtoys7_pin_mux);
++	setup_pin_mux(bbtoys35_pin_mux);
+ 	
+ 	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
+ 	if (conf_disp_pll(16000000)) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
new file mode 100644
index 0000000..0a3c70a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
@@ -0,0 +1,84 @@
+From 759b49957081a1ccecf7302efc85c5141d00fe69 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Apr 2012 12:35:07 +0200
+Subject: [PATCH 34/35] beaglebone: connect batterycape GPIO to gpio-charger
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   46 ++++++++++++++++++++++++++++++++-
+ 1 files changed, 45 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 7a4b766..2bc9b14 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -133,6 +133,36 @@ static const struct display_panel disp_panel = {
+ 	COLOR_ACTIVE,
+ };
+ 
++
++#if defined(CONFIG_CHARGER_GPIO)
++
++#include <linux/power_supply.h>
++#include <linux/power/gpio-charger.h>
++
++/* charger */
++static char *beaglebone_batteries[] = {
++	"battery",
++};
++
++static struct gpio_charger_platform_data beaglebone_charger_pdata = {
++	.name = "battery-cape",
++	.type = POWER_SUPPLY_TYPE_BATTERY,
++	.gpio = GPIO_TO_PIN(1,16),
++	.gpio_active_low = 0,
++	.supplied_to = beaglebone_batteries,
++	.num_supplicants = ARRAY_SIZE(beaglebone_batteries),
++};
++
++static struct platform_device beaglebone_charger_device = {
++	.name = "gpio-charger",
++	.dev = {
++		.platform_data = &beaglebone_charger_pdata,
++	},
++};
++
++#endif /* gpio-charger */
++
++
+ /* LCD backlight platform Data */
+ #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
+ #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
+@@ -504,6 +534,13 @@ static struct pinmux_config haptics_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for battery cape */
++static struct pinmux_config batterycape_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{NULL, 0},
++};
++
++	
+ /* Module pin mux for LCDC */
+ static struct pinmux_config lcdc_pin_mux[] = {
+ 	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+@@ -2201,7 +2238,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing battery cape\n");
+ 		// gpio1_6, P9_15 lowbat output
+ 		// AIN4, P9_33 vbat
+-		//foo_init(0,0);
++		setup_pin_mux(batterycape_pin_mux);
++		#if defined(CONFIG_CHARGER_GPIO)
++			int err;
++			err = platform_device_register(&beaglebone_charger_device);
++			if (err)
++				pr_err("failed to register BeagleBone battery cape gpio\n");
++		
++		#endif
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch
new file mode 100644
index 0000000..caf5ad3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch
@@ -0,0 +1,67 @@
+From caa3254ea2054e6b5cf6a5c52002dfeba6aa3f4c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 4 May 2012 13:19:45 +0200
+Subject: [PATCH 35/35] beaglebone: add support for CAN and RS232 cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++-----
+ 1 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 2bc9b14..66d7613 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -951,6 +951,18 @@ static struct pinmux_config tt3201_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++static struct pinmux_config uart1dcan1_pin_mux[] = {
++	{"uart1_rxd.d_can1_tx", OMAP_MUX_MODE2 | AM33XX_PIN_OUTPUT },
++	{"uart1_txd.d_can1_rx", OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLUP },
++	{NULL, 0},
++};
++
++static struct pinmux_config uart1_pin_mux[] = {
++	{"uart1_txd.uart1_txd", OMAP_MUX_MODE0 | AM33XX_PULL_ENBL},
++	{"uart1_rxd.uart1_rxd", OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{NULL, 0},
++};
++
+ /* Module pin mux for uart2 */
+ static struct pinmux_config uart2_pin_mux[] = {
+ 	{"spi0_sclk.uart2_rxd", OMAP_MUX_MODE1 | AM33XX_SLEWCTRL_SLOW |
+@@ -2248,12 +2260,24 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		#endif
+ 	}
+ 	
+-	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
+-		pr_info("BeagleBone cape: initializing serial cape\n");
+-		// 01 -> CAN
+-		// 02 -> Profibus
+-		// 03 -> RS232
+-		// 04 -> RS485
++	if (!strncmp("BB-BONE-SERL-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing CAN cape\n");
++		setup_pin_mux(uart1dcan1_pin_mux);
++		am33xx_d_can_init(1);
++	}
++		if (!strncmp("BB-BONE-SERL-02", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: not initializing Profibus cape\n");
++		// gpio1_0
++		// gpio1_4
++		//foo_init(0,0);
++	}
++		if (!strncmp("BB-BONE-SERL-03", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing RS232 cape\n");
++		pr_info("BeagleBone cape: only uart1 is supported!\n");
++		setup_pin_mux(uart1_pin_mux);
++	}
++		if (!strncmp("BB-BONE-SERL-04", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: not initializing RS485 cape\n");
+ 		//foo_init(0,0);
+ 	}
+ 	
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 0912875..c5e447f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1657,7 +1657,7 @@ CONFIG_W1_SLAVE_BQ27000=m
 CONFIG_POWER_SUPPLY=y
 # CONFIG_POWER_SUPPLY_DEBUG is not set
 # CONFIG_PDA_POWER is not set
-# CONFIG_TEST_POWER is not set
+CONFIG_TEST_POWER=m
 # CONFIG_BATTERY_DS2760 is not set
 # CONFIG_BATTERY_DS2780 is not set
 # CONFIG_BATTERY_DS2782 is not set
@@ -1668,7 +1668,7 @@ CONFIG_POWER_SUPPLY=y
 # CONFIG_CHARGER_ISP1704 is not set
 # CONFIG_CHARGER_MAX8903 is not set
 # CONFIG_CHARGER_TWL4030 is not set
-# CONFIG_CHARGER_GPIO is not set
+CONFIG_CHARGER_GPIO=y
 CONFIG_HWMON=y
 CONFIG_HWMON_VID=m
 # CONFIG_HWMON_DEBUG_CHIP is not set
@@ -1858,19 +1858,19 @@ CONFIG_REGULATOR=y
 # CONFIG_REGULATOR_DEBUG is not set
 CONFIG_REGULATOR_DUMMY=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
-CONFIG_REGULATOR_USERSPACE_CONSUMER=y
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
 CONFIG_REGULATOR_GPIO=y
 # CONFIG_REGULATOR_BQ24022 is not set
 # CONFIG_REGULATOR_MAX1586 is not set
 # CONFIG_REGULATOR_MAX8649 is not set
 # CONFIG_REGULATOR_MAX8660 is not set
 # CONFIG_REGULATOR_MAX8952 is not set
-CONFIG_REGULATOR_TWL4030=y
+# CONFIG_REGULATOR_TWL4030 is not set
 # CONFIG_REGULATOR_LP3971 is not set
 # CONFIG_REGULATOR_LP3972 is not set
-CONFIG_REGULATOR_TPS65023=y
-CONFIG_REGULATOR_TPS6507X=y
+# CONFIG_REGULATOR_TPS65023 is not set
+# CONFIG_REGULATOR_TPS6507X is not set
 CONFIG_REGULATOR_TPS65217=y
 # CONFIG_REGULATOR_ISL6271A is not set
 # CONFIG_REGULATOR_AD5398 is not set
@@ -2452,12 +2452,12 @@ CONFIG_SND_USB_AUDIO=y
 CONFIG_SND_SOC=y
 # CONFIG_SND_SOC_CACHE_LZO is not set
 CONFIG_SND_AM33XX_SOC=y
-CONFIG_SND_DAVINCI_SOC_MCASP=m
-CONFIG_SND_AM335X_SOC_EVM=m
+CONFIG_SND_DAVINCI_SOC_MCASP=y
+CONFIG_SND_AM335X_SOC_EVM=y
 # CONFIG_SND_OMAP_SOC is not set
 CONFIG_SND_SOC_I2C_AND_SPI=y
 # CONFIG_SND_SOC_ALL_CODECS is not set
-CONFIG_SND_SOC_TLV320AIC3X=m
+CONFIG_SND_SOC_TLV320AIC3X=y
 # CONFIG_SOUND_PRIME is not set
 CONFIG_HID_SUPPORT=y
 CONFIG_HID=y
@@ -2764,7 +2764,6 @@ CONFIG_USB_G_WEBCAM=m
 CONFIG_USB_OTG_UTILS=y
 # CONFIG_USB_GPIO_VBUS is not set
 # CONFIG_USB_ULPI is not set
-# CONFIG_TWL4030_USB is not set
 # CONFIG_TWL6030_USB is not set
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_MMC=y
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 70dd7be..954e5ca 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "0d0567b6c1a61a374120b985559768077c511a6d"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -956,4 +956,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
 	file://beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch \
 	file://beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch \
+	file://beaglebone/0033-beaglebone-fix-3.5-cape-support.patch \
+	file://beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
+	file://beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
 "
-- 
1.7.10


