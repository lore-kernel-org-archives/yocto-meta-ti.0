Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB18AE0059A
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 25 Jan 2012 09:27:23 -0800 (PST)
Received: by werb10 with SMTP id b10so4642381wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 25 Jan 2012 09:27:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.131.131 with SMTP id m3mr3256418wei.47.1327512442226;
	Wed, 25 Jan 2012 09:27:22 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm1004733wib.3.2012.01.25.09.27.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 09:27:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed, 25 Jan 2012 18:27:17 +0100
Message-Id: <1327512438-16041-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQkn97AnZruCl6cffG2YCVnlDyPbPYKqWVkY9J0EYMQ+HL1RycqzuzvHmhRhKkwN2uyE2Gr0
Subject: [PATCH 1/2] linux-ti335x-psp 3.1: enable support for beaglebone cape EEPROM based detection
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
X-List-Received-Date: Wed, 25 Jan 2012 17:27:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...dd-support-for-7-LCD-cape-fix-DVI-entries.patch |  359 ++++++++++++++++++++
 ...033-beaglebone-update-DVI-cape-partnumber.patch |   26 ++
 ...really-enable-i2c2-pullups-fixes-timeouts.patch |   29 ++
 ...-beaglebone-add-structs-for-DVI-cape-LEDs.patch |  119 +++++++
 ...036-beaglebone-update-LCD-cape-partnumber.patch |   26 ++
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    9 +-
 6 files changed, 566 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0032-am335x-add-support-for-7-LCD-cape-fix-DVI-entries.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0033-beaglebone-update-DVI-cape-partnumber.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0036-beaglebone-update-LCD-cape-partnumber.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0032-am335x-add-support-for-7-LCD-cape-fix-DVI-entries.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0032-am335x-add-support-for-7-LCD-cape-fix-DVI-entries.patch
new file mode 100644
index 0000000..eda9493
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0032-am335x-add-support-for-7-LCD-cape-fix-DVI-entries.patch
@@ -0,0 +1,359 @@
+From cdd84fe3886d332e9e706940af2516559da92349 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 5 Jan 2012 12:03:20 +0100
+Subject: [PATCH 32/35] am335x: add support for 7" LCD cape, fix DVI entries
+
+Using the EEPROMs!
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |  216 ++++++++++++++++++++++++++++++---
+ arch/arm/mach-omap2/mux33xx.c         |    2 +-
+ 2 files changed, 199 insertions(+), 19 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 116089f..6c19334 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -146,6 +146,36 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
+ 	.type			= "TFC_S9700RTWV35TR_01B",
+ };
+ 
++static const struct display_panel bbtoys7_panel = {
++	WVGA,
++	16,
++	16,
++	COLOR_ACTIVE,
++};
++
++static struct lcd_ctrl_config bbtoys7_cfg = {
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
++struct da8xx_lcdc_platform_data bbtoys7_pdata = {
++	.manu_name		= "ThreeFive",
++	.controller_data	= &bbtoys7_cfg,
++	.type			= "TFC_S9700RTWV35TR_01B",
++};
++
+ static const struct display_panel dvi_panel = {
+ 	WVGA,
+ 	16,
+@@ -345,9 +375,34 @@ struct am335x_evm_eeprom_config {
+ static struct am335x_evm_eeprom_config config;
+ static bool daughter_brd_detected;
+ 
++struct beaglebone_cape_eeprom_config {
++	u32	header;
++	char  format_revision[2];
++	char	name[32];
++	char	version[4];
++	char	manufacturer[16];
++	char	partnumber[16];
++	u16  numpins;
++	char	serial[12];
++	u8	muxdata[170];
++	u16  current_3v3;
++	u16  current_vdd5v;
++	u16  current_sys5v;
++	u16  dc;
++};
++
++static struct beaglebone_cape_eeprom_config cape_config;
++static bool beaglebone_cape_detected;
++
++/* keep track of ADC pin usage */
++static int capecount = 0;
++static bool beaglebone_tsadcpins_free = 1;
++
++
+ #define GP_EVM_REV_IS_1_0A		0x1
+ #define GP_EVM_REV_IS_1_1A		0x2
+ #define GP_EVM_REV_IS_UNKNOWN		0xFF
++#define GP_EVM_ACTUALLY_BEAGLEBONE  0xBB
+ static unsigned int gp_evm_revision = GP_EVM_REV_IS_UNKNOWN;
+ 
+ #define EEPROM_MAC_ADDRESS_OFFSET	60 /* 4+8+4+12+32 */
+@@ -422,7 +477,7 @@ static struct pinmux_config lcdc_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
+-/* Module pin mux for DVI board */
++/* Module pin mux for Beagleboardtoys DVI cape */
+ static struct pinmux_config dvi_pin_mux[] = {
+ 	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+         | AM33XX_PULL_DISA},
+@@ -459,13 +514,56 @@ static struct pinmux_config dvi_pin_mux[] = {
+ 	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT}, //DVIEN
++	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
+ 	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{"gpmc_ad7.gpmc_ad7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for Beagleboardtoys 7" LCD cape */
++static struct pinmux_config bbtoys7_pin_mux[] = {
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
++	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Backlight
++	{"ecap0_in_pwm0_out.gpio0_7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
++	{NULL, 0},
++};
++
+ static struct pinmux_config tsc_pin_mux[] = {
+ 	{"ain0.ain0",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+ 	{"ain1.ain1",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+@@ -771,16 +869,6 @@ static struct gpio_led gpio_leds[] = {
+ 		.name           = "beaglebone::usr3",
+ 		.gpio           = BEAGLEBONE_USR4_LED,
+ 	},
+-	{
+-		.name			= "dvi::usr0",
+-		.default_trigger	= "heartbeat",
+-		.gpio			= BEAGLEBONEDVI_USR0_LED,
+-	},
+-	{
+-		.name           = "dvi::usr1",
+-		.default_trigger	= "mmc0",
+-		.gpio           = BEAGLEBONEDVI_USR1_LED,
+-	},
+ };
+ 
+ static struct gpio_led_platform_data gpio_led_info = {
+@@ -905,6 +993,31 @@ static void lcdc_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++#define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
++#define BEAGLEBONE_LCD_BL GPIO_TO_PIN(1, 18)
++
++static void bbtoys7lcd_init(int evm_id, int profile)
++{
++	setup_pin_mux(bbtoys7_pin_mux);
++
++	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
++	if (conf_disp_pll(300000000)) {
++		pr_info("Failed to set pixclock to 300000000, not attempting to"
++				"register LCD cape\n");
++		return;
++	}
++	
++	if (am33xx_register_lcdc(&bbtoys7_pdata))
++		pr_info("Failed to register Beagleboardtoys 7\" LCD cape device\n");
++	
++	gpio_request(BEAGLEBONE_LCD_BL, "BONE_LCD_BL");
++	gpio_direction_output(BEAGLEBONE_LCD_BL, 1);
++	gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
++	gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
++
++	return;
++}
++
+ #define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
+ 
+ static void dvi_init(int evm_id, int profile)
+@@ -921,7 +1034,7 @@ static void dvi_init(int evm_id, int profile)
+ 	}
+ 	
+ 	if (am33xx_register_lcdc(&dvi_pdata))
+-		pr_info("Failed to register BeagleBoardToys DVI adapter\n");
++		pr_info("Failed to register BeagleBoardToys DVI cape\n");
+ 	return;
+ }
+ 
+@@ -932,10 +1045,15 @@ static void tsc_init(int evm_id, int profile)
+ 	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
+ 		am335x_touchscreen_data.analog_input = 1;
+ 		pr_info("TSC connected to beta GP EVM\n");
+-	} else {
++	}
++	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
+ 		am335x_touchscreen_data.analog_input = 0;
+ 		pr_info("TSC connected to alpha GP EVM\n");
+ 	}
++	if( gp_evm_revision == GP_EVM_ACTUALLY_BEAGLEBONE) {
++		am335x_touchscreen_data.analog_input = 1;
++		pr_info("TSC connected to BeagleBone\n");;	
++	}
+ 	setup_pin_mux(tsc_pin_mux);
+ 	err = platform_device_register(&tsc_device);
+ 	if (err)
+@@ -1148,11 +1266,76 @@ static struct i2c_board_info beaglebone_i2c_boardinfo2[] = {
+ 	},
+ };
+ 
++static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
++{
++	capecount++;
++	int ret;
++	char tmp[32];
++	char name[32];
++	char manufacturer[32];
++
++	/* get cape specific data */
++	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
++	if (ret != sizeof(cape_config)) {
++		pr_warning("BeagleBone cape EEPROM: could not read eeprom at address 0x%x\n", capecount + 0x53);
++		if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
++			pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
++			bone_tsc_init(0,0);
++			beaglebone_tsadcpins_free = 0;
++		}
++		return;
++	}
++
++	if (cape_config.header != AM335X_EEPROM_HEADER) {
++		pr_warning("BeagleBone Cape EEPROM: wrong header 0x%x, expected 0x%x\n",
++			cape_config.header, AM335X_EEPROM_HEADER);
++		goto out;
++	}
++
++	pr_info("BeagleBone cape EEPROM: found eeprom at address 0x%x\n", capecount + 0x53);
++	snprintf(name, sizeof(cape_config.name) + 1, "%s", cape_config.name);
++	snprintf(manufacturer, sizeof(cape_config.manufacturer) + 1, "%s", cape_config.manufacturer);
++	pr_info("BeagleBone cape: %s %s\n", manufacturer, name);
++	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
++	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
++
++	if (!strncmp("DVI01", cape_config.partnumber, 5)) {
++			pr_info("BeagleBone cape: initializing DVI cape\n");
++			dvi_init(0,0);
++	}
++	if (!strncmp("LCD01", cape_config.partnumber, 5)) {
++		pr_info("BeagleBone cape: initializing LCD cape\n");
++		bbtoys7lcd_init(0,0);
++		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
++		tsc_init(0,0);
++		beaglebone_tsadcpins_free = 0;
++	}
++	
++	
++	if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
++		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
++		bone_tsc_init(0,0);
++		beaglebone_tsadcpins_free = 0;
++	}
++	
++	return;
++out:
++	/*
++	 * If the EEPROM hasn't been programed or an incorrect header
++	 * or board name are read, assume this is an old beaglebone board
++	 * (< Rev A3)
++	 */
++	pr_err("Could not detect BeagleBone cape properly\n");
++	beaglebone_cape_detected = false;
++
++}
++
+ static struct at24_platform_data cape_eeprom_info = {
+         .byte_len       = (256*1024) / 8,
+         .page_size      = 64,
+         .flags          = AT24_FLAG_ADDR16,
+         .context        = (void *)NULL,
++		.setup		  = beaglebone_cape_setup,
+ };
+ 
+ static struct i2c_board_info __initdata cape_i2c_boardinfo[] = {
+@@ -1587,26 +1770,22 @@ static struct evm_dev_cfg ip_phn_evm_dev_cfg[] = {
+ /* Beaglebone < Rev A3 */
+ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{rmii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{dvi_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+ /* Beaglebone Rev A3 and after */
+ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{dvi_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -1689,6 +1868,7 @@ static void setup_beaglebone_old(void)
+ static void setup_beaglebone(void)
+ {
+ 	pr_info("The board is a AM335x Beaglebone.\n");
++	gp_evm_revision = GP_EVM_ACTUALLY_BEAGLEBONE;
+ 
+ 	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
+ 	am335x_mmc[0].gpio_wp = -EINVAL;
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 35986ca..da08e2e 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -85,7 +85,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		NULL, NULL, NULL, NULL),
+ 	_AM33XX_MUXENTRY(GPMC_A2, 0,
+ 		"gpmc_a2", "mii2_txd3", "rgmii2_td3", "mmc2_dat1",
+-		NULL, NULL, NULL, NULL),
++		NULL, NULL, NULL, "gpio1_18"),
+ 	_AM33XX_MUXENTRY(GPMC_A3, 0,
+ 		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
+ 		NULL, NULL, NULL, NULL),
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0033-beaglebone-update-DVI-cape-partnumber.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0033-beaglebone-update-DVI-cape-partnumber.patch
new file mode 100644
index 0000000..d69e1e5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0033-beaglebone-update-DVI-cape-partnumber.patch
@@ -0,0 +1,26 @@
+From 0ddfbfd5d5b6fdf84b9ea174e39b872cacaa8be5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Jan 2012 09:56:14 +0100
+Subject: [PATCH 33/35] beaglebone: update DVI cape partnumber
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 6c19334..7c91ff8 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1299,7 +1299,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
+ 	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
+ 
+-	if (!strncmp("DVI01", cape_config.partnumber, 5)) {
++	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 5)) {
+ 			pr_info("BeagleBone cape: initializing DVI cape\n");
+ 			dvi_init(0,0);
+ 	}
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch
new file mode 100644
index 0000000..018473d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch
@@ -0,0 +1,29 @@
+From d8bf8cea10710285b5bc1759162bd18c81d8ea3a Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Jan 2012 12:52:13 +0100
+Subject: [PATCH 34/35] beaglebone: really enable i2c2 pullups, fixes timeouts on boot ~4 seconds less wasted
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 7c91ff8..9556736 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -707,9 +707,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
+ 
+ static struct pinmux_config i2c2_pin_mux[] = {
+ 	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
+-					AM33XX_PULL_ENBL | AM33XX_INPUT_EN},
++					AM33XX_PIN_INPUT_PULLUP},
+ 	{"uart1_rtsn.i2c2_scl",   OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
+-					AM33XX_PULL_ENBL | AM33XX_INPUT_EN},
++					AM33XX_PIN_INPUT_PULLUP},
+ 	{NULL, 0},
+ };
+ 
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch
new file mode 100644
index 0000000..5d13ea9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch
@@ -0,0 +1,119 @@
+From f4d66b3ee9bbe36e17f9aaee2aedfa547e7bbb8c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Jan 2012 10:04:15 +0100
+Subject: [PATCH 35/35] beaglebone: add structs for DVI cape LEDs
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   67 +++++++++++++++++++++++++++++---
+ 1 files changed, 60 insertions(+), 7 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 9556736..1b398c7 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -847,10 +847,45 @@ static struct pinmux_config usb1_pin_mux[] = {
+ #define BEAGLEBONE_USR3_LED  GPIO_TO_PIN(1, 23)
+ #define BEAGLEBONE_USR4_LED  GPIO_TO_PIN(1, 24)
+ 
++static struct gpio_led bone_gpio_leds[] = {
++	{
++		.name			= "beaglebone::usr0",
++		.default_trigger	= "heartbeat",
++		.gpio			= BEAGLEBONE_USR1_LED,
++	},
++	{
++		.name			= "beaglebone::usr1",
++		.default_trigger	= "mmc0",
++		.gpio			= BEAGLEBONE_USR2_LED,
++	},
++	{
++		.name			= "beaglebone::usr2",
++		.gpio			= BEAGLEBONE_USR3_LED,
++	},
++	{
++		.name           = "beaglebone::usr3",
++		.gpio           = BEAGLEBONE_USR4_LED,
++	},
++};
++
++static struct gpio_led_platform_data bone_gpio_led_info = {
++	.leds		= bone_gpio_leds,
++	.num_leds	= ARRAY_SIZE(bone_gpio_leds),
++};
++
++static struct platform_device bone_leds_gpio = {
++	.name	= "leds-gpio",
++	.id	= -1,
++	.dev	= {
++		.platform_data	= &bone_gpio_led_info,
++	},
++};
++
++
+ #define BEAGLEBONEDVI_USR0_LED  GPIO_TO_PIN(1, 18)
+ #define BEAGLEBONEDVI_USR1_LED  GPIO_TO_PIN(1, 19)
+ 
+-static struct gpio_led gpio_leds[] = {
++static struct gpio_led dvi_gpio_leds[] = {
+ 	{
+ 		.name			= "beaglebone::usr0",
+ 		.default_trigger	= "heartbeat",
+@@ -869,18 +904,28 @@ static struct gpio_led gpio_leds[] = {
+ 		.name           = "beaglebone::usr3",
+ 		.gpio           = BEAGLEBONE_USR4_LED,
+ 	},
++	{
++		.name			= "dvi::usr0",
++		.default_trigger	= "heartbeat",
++		.gpio			= BEAGLEBONEDVI_USR0_LED,
++	},
++	{
++		.name			= "dvi::usr1",
++		.default_trigger	= "mmc0",
++		.gpio			= BEAGLEBONEDVI_USR1_LED,
++	},
+ };
+ 
+-static struct gpio_led_platform_data gpio_led_info = {
+-	.leds		= gpio_leds,
+-	.num_leds	= ARRAY_SIZE(gpio_leds),
++static struct gpio_led_platform_data dvi_gpio_led_info = {
++	.leds		= dvi_gpio_leds,
++	.num_leds	= ARRAY_SIZE(dvi_gpio_leds),
+ };
+ 
+-static struct platform_device leds_gpio = {
++static struct platform_device dvi_leds_gpio = {
+ 	.name	= "leds-gpio",
+ 	.id	= -1,
+ 	.dev	= {
+-		.platform_data	= &gpio_led_info,
++		.platform_data	= &dvi_gpio_led_info,
+ 	},
+ };
+ 
+@@ -1074,11 +1119,19 @@ static void boneleds_init(int evm_id, int profile )
+ {
+ 	int err;
+ 	setup_pin_mux(bone_pin_mux);
+-	err = platform_device_register(&leds_gpio);
++	err = platform_device_register(&bone_leds_gpio);
+ 	if (err)
+ 		pr_err("failed to register BeagleBone LEDS\n");
+ }
+ 
++static void dvileds_init(int evm_id, int profile )
++{
++	int err;
++	err = platform_device_register(&dvi_leds_gpio);
++	if (err)
++		pr_err("failed to register BeagleBone DVI cape LEDS\n");
++}
++
+ static void rgmii1_init(int evm_id, int profile)
+ {
+ 	setup_pin_mux(rgmii1_pin_mux);
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0036-beaglebone-update-LCD-cape-partnumber.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0036-beaglebone-update-LCD-cape-partnumber.patch
new file mode 100644
index 0000000..19fdd90
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0036-beaglebone-update-LCD-cape-partnumber.patch
@@ -0,0 +1,26 @@
+From 4089ed795fc26961e0e0ece07af2c628b96321de Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Jan 2012 17:18:43 +0100
+Subject: [PATCH 36/36] beaglebone: update LCD cape partnumber
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 1b398c7..6a0ace9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1356,7 +1356,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			pr_info("BeagleBone cape: initializing DVI cape\n");
+ 			dvi_init(0,0);
+ 	}
+-	if (!strncmp("LCD01", cape_config.partnumber, 5)) {
++	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 5)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+ 		bbtoys7lcd_init(0,0);
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index ef706cb..150a282 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "j+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -55,7 +55,12 @@ PATCHES_OVER_PSP = " \
 	file://adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch \
 	file://adc/0010-tscadc-switch-to-polling-instead-of-interrupts.patch \
 	file://st7735fb/0001-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
-    file://0031-am335x-evm-add-pdata-for-all-cape-EEPROM-permutation.patch \
+	file://0031-am335x-evm-add-pdata-for-all-cape-EEPROM-permutation.patch \
+	file://0032-am335x-add-support-for-7-LCD-cape-fix-DVI-entries.patch \
+	file://0033-beaglebone-update-DVI-cape-partnumber.patch \
+	file://0034-beaglebone-really-enable-i2c2-pullups-fixes-timeouts.patch \
+	file://0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch\
+	file://0036-beaglebone-update-LCD-cape-partnumber.patch \
 	"
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.2.5


