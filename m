Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72EB5E0137A
	for <meta-ti@yoctoproject.org>; Mon, 14 May 2012 07:34:47 -0700 (PDT)
Received: by wibhm6 with SMTP id hm6so1491038wib.5
	for <meta-ti@yoctoproject.org>; Mon, 14 May 2012 07:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=vdhggsMWm+yFjszLAzcQU0SJ2U5pKj0QYTlOlIAXEPU=;
	b=ez443HH+ZSJZmeRhLwrGZvzFucT+kQNUQlzRdBWKT+jL+Kv+TgB1x5eVqF1KGjbtIm
	xaSa+IMhchJYtDZ3OVveYor2YfQ6awQgN3hK+04NMZ9vHTU8Id3lIB7IWhRh9SHD0TTy
	qJQkhrRjka9M4nfkL4sn0Iobd5HUXejw2Y1xprl0vQer+vFLGRhcyuaKIr3NyDCpFToK
	uqS/ftMgrVO2apOphkFcNoXzHWy5tlu7c3+oEYL28JLR+/ddapYTJ0t23YV95hTkfCO5
	DJioBzznmc5djWrF6uJa3CmW2eOKxdzNQ+rIGsSbd2/fmwWHijMQA8UBuD/XI0UDHcXs
	GFYw==
Received: by 10.180.81.36 with SMTP id w4mr12967694wix.16.1337006086422;
	Mon, 14 May 2012 07:34:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j3sm55565054wiw.1.2012.05.14.07.34.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 07:34:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 14 May 2012 16:34:35 +0200
Message-Id: <1337006075-8118-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm/8bVqfio22VPzpG2LuYFdRpGsHVjDZ0ff+XxA/YRRl7fszoX4CEGyuUgKt3tuNWIRfY5W
Cc: denys@ti.com
Subject: [PATCH] linux-ti33x-psp 3.2: updates
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
X-List-Received-Date: Mon, 14 May 2012 14:34:48 -0000

* Fix LEDs on 3.5", 7" and DVI capes
* Add support for rev A2 DVI capes
* Minor warning fixes to the boardfile
* All PWMs are initialized, but not pinmuxed
* Debugfs output for mux direction has been fixed
* When no capes claim the SPI bus /dev/spidev2.0 will appear

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...glebone-add-support-for-DVI-rev.-A2-capes.patch |  242 ++++++++++++++++++++
 ...e-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch |  240 +++++++++++++++++++
 ...036-Beaglebone-Fixed-compiletime-warnings.patch |   48 ++++
 ...Added-missing-termination-record-to-bone_.patch |   26 +++
 ...xevm.c-Beaglebone-expose-all-pwms-through.patch |   58 +++++
 ...x-Fixed-debugfs-mux-output-always-reporti.patch |   99 ++++++++
 ...export-SPI2-as-spidev-when-no-capes-are-u.patch |   83 +++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    9 +-
 8 files changed, 804 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
new file mode 100644
index 0000000..cd04c5e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
@@ -0,0 +1,242 @@
+From b97227a0f246edd115cba03d8509c2b7460a815b Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 19 Apr 2012 14:23:06 +0200
+Subject: [PATCH 34/40] beaglebone: add support for DVI rev. A2 capes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |  150 ++++++++-------------------------
+ 1 files changed, 35 insertions(+), 115 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 6e7b203..e02c0b6 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -545,38 +545,6 @@ static struct pinmux_config batterycape_pin_mux[] = {
+ 	
+ /* Module pin mux for LCDC */
+ static struct pinmux_config lcdc_pin_mux[] = {
+-	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data2.lcd_data2",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data3.lcd_data3",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data4.lcd_data4",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data5.lcd_data5",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data6.lcd_data6",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data7.lcd_data7",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data8.lcd_data8",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data9.lcd_data9",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data10.lcd_data10",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data11.lcd_data11",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data12.lcd_data12",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data13.lcd_data13",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data14.lcd_data14",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+-	{"lcd_data15.lcd_data15",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-						       | AM33XX_PULL_DISA},
+ 	{"gpmc_ad8.lcd_data16",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{"gpmc_ad9.lcd_data17",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{"gpmc_ad10.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+@@ -585,15 +553,11 @@ static struct pinmux_config lcdc_pin_mux[] = {
+ 	{"gpmc_ad13.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{"gpmc_ad14.lcd_data22",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{"gpmc_ad15.lcd_data23",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{NULL, 0},
+ };
+ 
+-/* Module pin mux for Beagleboardtoys DVI cape */
+-static struct pinmux_config dvi_pin_mux[] = {
++
++static struct pinmux_config lcdc16_pin_mux[] = {
+ 	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+         | AM33XX_PULL_DISA},
+ 	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+@@ -630,90 +594,31 @@ static struct pinmux_config dvi_pin_mux[] = {
+ 	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{NULL, 0},
++};
++
++
++/* Module pin mux for Beagleboardtoys DVI cape */
++static struct pinmux_config dvia1_pin_mux[] = {
+ 	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
+ 	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{"gpmc_ad7.gpmc_ad7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
+ 	{NULL, 0},
+ };
+ 
++static struct pinmux_config dvia2_pin_mux[] = {
++	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
++	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
++	{"gpmc_csn2.gpio1_31", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
++	{NULL, 0},
++};
++
+ /* Module pin mux for Beagleboardtoys 3.5" LCD cape */
+ static struct pinmux_config bbtoys35_pin_mux[] = {
+-	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data2.lcd_data2",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data3.lcd_data3",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data4.lcd_data4",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data5.lcd_data5",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data6.lcd_data6",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data7.lcd_data7",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data8.lcd_data8",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data9.lcd_data9",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data10.lcd_data10",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data11.lcd_data11",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data12.lcd_data12",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data13.lcd_data13",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data14.lcd_data14",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data15.lcd_data15",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{NULL, 0},
+ };
+ /* Module pin mux for Beagleboardtoys 7" LCD cape */
+ static struct pinmux_config bbtoys7_pin_mux[] = {
+-	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data2.lcd_data2",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data3.lcd_data3",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data4.lcd_data4",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data5.lcd_data5",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data6.lcd_data6",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data7.lcd_data7",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data8.lcd_data8",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data9.lcd_data9",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data10.lcd_data10",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data11.lcd_data11",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data12.lcd_data12",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data13.lcd_data13",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data14.lcd_data14",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_data15.lcd_data15",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
+-		| AM33XX_PULL_DISA},
+-	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"ecap0_in_pwm0_out.gpio0_7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
+ 	{"gpmc_a2.ehrpwm1A", OMAP_MUX_MODE6 | AM33XX_PIN_OUTPUT}, // Backlight
+ 	{NULL, 0},
+@@ -1567,6 +1472,7 @@ out:
+ static void lcdc_init(int evm_id, int profile)
+ {
+ 
++	setup_pin_mux(lcdc16_pin_mux);
+ 	setup_pin_mux(lcdc_pin_mux);
+ 
+ 	if (conf_disp_pll(300000000)) {
+@@ -1584,6 +1490,7 @@ static void lcdc_init(int evm_id, int profile)
+ 
+ static void bbtoys7lcd_init(int evm_id, int profile)
+ {
++	setup_pin_mux(lcdc16_pin_mux);
+ 	setup_pin_mux(bbtoys7_pin_mux);
+ 	gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
+ 	gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
+@@ -1603,6 +1510,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+ 
+ static void bbtoys35lcd_init(int evm_id, int profile)
+ {
++	setup_pin_mux(lcdc16_pin_mux);
+ 	setup_pin_mux(bbtoys35_pin_mux);
+ 	
+ 	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
+@@ -1618,13 +1526,12 @@ static void bbtoys35lcd_init(int evm_id, int profile)
+ 	return;
+ }
+ 
+-#define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
++#define BEAGLEBONEDVI_PDn_A1  GPIO_TO_PIN(1, 7)
++#define BEAGLEBONEDVI_PDn_A2  GPIO_TO_PIN(1, 31)
+ 
+ static void dvi_init(int evm_id, int profile)
+ {
+-    setup_pin_mux(dvi_pin_mux);
+-	gpio_request(BEAGLEBONEDVI_PDn, "DVI_PDn");
+-	gpio_direction_output(BEAGLEBONEDVI_PDn, 1);
++	setup_pin_mux(lcdc16_pin_mux);
+ 
+ 	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
+ 	if (conf_disp_pll(560000000)) {
+@@ -2218,8 +2125,21 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
+ 
+ 	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 15)) {
+-			pr_info("BeagleBone cape: initializing DVI cape\n");
++		pr_info("BeagleBone cape: initializing DVI cape\n");
++		
++		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
++			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
++			setup_pin_mux(dvia1_pin_mux);
++			gpio_request(BEAGLEBONEDVI_PDn_A1, "DVI_PDn");
++			gpio_direction_output(BEAGLEBONEDVI_PDn_A1, 1);
+ 			dvi_init(0,0);
++		} else {
++			pr_info("BeagleBone cape: DVI init for revision A2 or newer\n");
++			setup_pin_mux(dvia2_pin_mux);
++			gpio_request(BEAGLEBONEDVI_PDn_A2, "DVI_PDn");
++			gpio_direction_output(BEAGLEBONEDVI_PDn_A2, 1);
++			dvi_init(0,0);
++		}
+ 	}
+ 	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
new file mode 100644
index 0000000..f50bdf6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
@@ -0,0 +1,240 @@
+From 080d90fddb1c39a5197b56b3aab0a7701adced75 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 11 May 2012 13:08:24 +0200
+Subject: [PATCH 35/40] beaglebone: enable LEDs for DVI, LCD3 and LCD7 capes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |  140 ++++++++++++++++++++++++++++++--
+ 1 files changed, 131 insertions(+), 9 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index e02c0b6..8db33b9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -496,6 +496,7 @@ static bool beaglebone_cape_detected;
+ /* keep track of ADC pin usage */
+ static int capecount = 0;
+ static bool beaglebone_tsadcpins_free = 1;
++static bool beaglebone_leds_free = 1;
+ 
+ 
+ #define GP_EVM_REV_IS_1_0		0x1
+@@ -600,23 +601,26 @@ static struct pinmux_config lcdc16_pin_mux[] = {
+ 
+ /* Module pin mux for Beagleboardtoys DVI cape */
+ static struct pinmux_config dvia1_pin_mux[] = {
+-	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
+-	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
++	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{"gpmc_ad7.gpmc_ad7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
+ 	{NULL, 0},
+ };
+ 
+ static struct pinmux_config dvia2_pin_mux[] = {
+-	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
+-	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
++	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{"gpmc_csn2.gpio1_31", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
+ 	{NULL, 0},
+ };
+ 
+ /* Module pin mux for Beagleboardtoys 3.5" LCD cape */
+ static struct pinmux_config bbtoys35_pin_mux[] = {
++	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{NULL, 0},
+ };
++
+ /* Module pin mux for Beagleboardtoys 7" LCD cape */
+ static struct pinmux_config bbtoys7_pin_mux[] = {
+ 	{"ecap0_in_pwm0_out.gpio0_7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
+@@ -1018,6 +1022,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
+ 	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+ 	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+ 	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
++	{"gpmc_ben1.gpio1_28",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
+ 	{NULL, 0},
+ };
+ 
+@@ -1327,6 +1332,94 @@ static struct platform_device dvi_leds_gpio = {
+ 	},
+ };
+ 
++#define BEAGLEBONELCD3_USR0_LED  GPIO_TO_PIN(1, 18)
++#define BEAGLEBONELCD3_USR1_LED  GPIO_TO_PIN(1, 19)
++
++static struct gpio_led lcd3_gpio_leds[] = {
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
++	{
++		.name			= "lcd3::usr0",
++		.default_trigger	= "heartbeat",
++		.gpio			= BEAGLEBONELCD3_USR0_LED,
++	},
++	{
++		.name			= "lcd3::usr1",
++		.default_trigger	= "mmc0",
++		.gpio			= BEAGLEBONELCD3_USR1_LED,
++	},
++};
++
++static struct gpio_led_platform_data lcd3_gpio_led_info = {
++	.leds		= lcd3_gpio_leds,
++	.num_leds	= ARRAY_SIZE(lcd3_gpio_leds),
++};
++
++static struct platform_device lcd3_leds_gpio = {
++	.name	= "leds-gpio",
++	.id	= -1,
++	.dev	= {
++		.platform_data	= &lcd3_gpio_led_info,
++	},
++};
++
++#define BEAGLEBONELCD7_USR_LED  GPIO_TO_PIN(1, 28)
++
++static struct gpio_led lcd7_gpio_leds[] = {
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
++	{
++		.name			= "lcd7::usr",
++		.default_trigger	= "heartbeat",
++		.gpio			= BEAGLEBONELCD7_USR_LED,
++	},
++};
++
++static struct gpio_led_platform_data lcd7_gpio_led_info = {
++	.leds		= lcd7_gpio_leds,
++	.num_leds	= ARRAY_SIZE(lcd7_gpio_leds),
++};
++
++static struct platform_device lcd7_leds_gpio = {
++	.name	= "leds-gpio",
++	.id	= -1,
++	.dev	= {
++		.platform_data	= &lcd7_gpio_led_info,
++	},
++};
++
+ static struct pinmux_config bone_pin_mux[] = {
+ 	/* User LED gpios (gpio1_21 to gpio1_24) */
+     {"gpmc_a5.rgmii2_td0", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
+@@ -1595,6 +1688,22 @@ static void dvileds_init(int evm_id, int profile )
+ 		pr_err("failed to register BeagleBone DVI cape LEDS\n");
+ }
+ 
++static void lcd3leds_init(int evm_id, int profile )
++{
++	int err;
++	err = platform_device_register(&lcd3_leds_gpio);
++	if (err)
++		pr_err("failed to register BeagleBone LCD cape LEDs\n");
++}
++
++static void lcd7leds_init(int evm_id, int profile )
++{
++	int err;
++	err = platform_device_register(&lcd7_leds_gpio);
++	if (err)
++		pr_err("failed to register BeagleBone LCD cape LED\n");
++}
++
+ static void bonew1_gpio_init(int evm_id, int profile )
+ {
+ 	int err;
+@@ -2102,10 +2211,15 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
+ 	if (ret != sizeof(cape_config)) {
+ 		pr_warning("BeagleBone cape EEPROM: could not read eeprom at address 0x%x\n", capecount + 0x53);
+-		if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
+-			pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+-			bone_tsc_init(0,0);
+-			beaglebone_tsadcpins_free = 0;
++		if (capecount > 3) {
++			if (beaglebone_tsadcpins_free == 1) {
++				pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
++				bone_tsc_init(0,0);
++				beaglebone_tsadcpins_free = 0;
++			}
++			if (beaglebone_leds_free == 1) {
++				boneleds_init(0,0);
++			}
+ 		}
+ 		return;
+ 	}
+@@ -2127,6 +2241,9 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing DVI cape\n");
+ 		
++		beaglebone_leds_free = 0;
++		dvileds_init(0,0);
++		
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+ 			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
+ 			setup_pin_mux(dvia1_pin_mux);
+@@ -2151,6 +2268,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_tsadcpins_free = 0;
+ 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+ 		beaglebone_lcd7_keys_init(0,0);
++		
++		// A1 or newer
++		beaglebone_leds_free = 0;
++		lcd7leds_init(0,0);
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
+@@ -2161,6 +2282,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_tsadcpins_free = 0;
+ 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+ 		beaglebone_lcd3_keys_init(0,0);
++		beaglebone_leds_free = 0;
++		lcd3leds_init(0,0);
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
+@@ -2659,7 +2782,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{bonew1_gpio_init, DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
new file mode 100644
index 0000000..8e82e1f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
@@ -0,0 +1,48 @@
+From 8688e4d9d9bdf1a9ff34b77b9a5b5ac22ca1c548 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:06:24 +0200
+Subject: [PATCH 36/40] Beaglebone: Fixed compiletime warnings.
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 8db33b9..b48e0fd 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -41,6 +41,7 @@
+ #include <linux/opp.h>
+ #include <linux/w1-gpio.h>
+ #include <linux/can/platform/mcp251x.h>
++#include <linux/input/ti_tscadc.h>
+ 
+ /* LCD controller is similar to DA850 */
+ #include <video/da8xx-fb.h>
+@@ -300,7 +301,6 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
+ };
+ 
+ /* TSc controller */
+-#include <linux/input/ti_tscadc.h>
+ #include <linux/lis3lv02d.h>
+ 
+ /* TSc controller */
+@@ -2200,13 +2200,13 @@ static void tt3201_init(int evm_id, int profile)
+ }
+ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
+ {
+-	capecount++;
+ 	int ret;
+ 	char tmp[32];
+ 	char name[32];
+ 	char version[4];
+ 	char manufacturer[32];
+ 
++	capecount++;
+ 	/* get cape specific data */
+ 	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
+ 	if (ret != sizeof(cape_config)) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
new file mode 100644
index 0000000..dcef3aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
@@ -0,0 +1,26 @@
+From f1f19044cff0ac6a145c4f14782e4ddb78bb38cb Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:18:52 +0200
+Subject: [PATCH 37/40] Beaglebone: Added missing termination record to
+ bone_pin_mux data.
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index b48e0fd..7dbeac6 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1428,6 +1428,7 @@ static struct pinmux_config bone_pin_mux[] = {
+     {"gpmc_a8.rgmii2_rd3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
+     /* Grounding gpio1_6 (pin 3 Conn A) signals bone tester to start diag tests */
+     {"gpmc_ad6.gpio1_6", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++	{NULL, 0},
+ };
+ 
+ /* Module pin mux for eCAP0 */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
new file mode 100644
index 0000000..0607be3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
@@ -0,0 +1,58 @@
+From 557ed6bc4850bcb4610ff1b9e024a4fd13785c27 Mon Sep 17 00:00:00 2001
+From: Rob Kellett <r-kellett@ti.com>
+Date: Mon, 14 May 2012 09:35:35 +0100
+Subject: [PATCH 38/40] board-am335xevm.c: Beaglebone - expose all pwms
+ through sysfs
+
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   20 +++++++++++++++++++-
+ 1 files changed, 19 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 7dbeac6..c9ee0a2 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1509,6 +1509,16 @@ static struct pwmss_platform_data  pwm_pdata[3] = {
+ 	},
+ };
+ 
++static void register_all_pwms(void)
++{
++	am33xx_register_ehrpwm(0, &pwm_pdata[0]);
++	am33xx_register_ehrpwm(1, &pwm_pdata[1]);
++	am33xx_register_ehrpwm(2, &pwm_pdata[2]);
++	am33xx_register_ecap(0, &pwm_pdata[0]);
++	am33xx_register_ecap(1, &pwm_pdata[1]);
++	am33xx_register_ecap(2, &pwm_pdata[2]);
++}
++
+ static int __init ecap0_init(void)
+ {
+ 	int status = 0;
+@@ -1524,7 +1534,10 @@ late_initcall(ecap0_init);
+ static void enable_ehrpwm1(int evm_id, int profile)
+ {
+ 	ehrpwm_backlight_enable = true;
+-	am33xx_register_ehrpwm(1, &pwm_pdata[1]);
++	/*am33xx_register_ehrpwm(1, &pwm_pdata[1]);
++	 *TODO:no longer required as we are registering 
++	 *all pwms for the beaglebone
++	 */
+ }
+ 
+ /* Setup pwm-backlight for bbtoys7lcd */
+@@ -2883,6 +2896,11 @@ static void setup_beaglebone(void)
+ 
+ 	/* Fill up global evmid */
+ 	am33xx_evmid_fillup(BEAGLE_BONE_A3);
++
++	/*TODO:We are registering all pwms for the beaglebone here
++	 *this may effect power management in the future
++	 */
++	register_all_pwms();
+ }
+ 
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
new file mode 100644
index 0000000..7df5c20
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
@@ -0,0 +1,99 @@
+From b8241eee030b29f23a5792de1eec03830699ae98 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:09:57 +0200
+Subject: [PATCH 39/40] ARM: OMAP: Mux: Fixed debugfs mux output (always
+ reporting pins as output)
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/mux.c |   62 +++++++++++++++++++++++++++-----------------
+ 1 files changed, 38 insertions(+), 24 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux.c b/arch/arm/mach-omap2/mux.c
+index e1cc75d..5899266 100644
+--- a/arch/arm/mach-omap2/mux.c
++++ b/arch/arm/mach-omap2/mux.c
+@@ -522,41 +522,55 @@ static inline void omap_mux_decode(struct seq_file *s, u16 val)
+ 	i++;
+ 	flags[i] = mode;
+ 
+-	OMAP_MUX_TEST_FLAG(val, OMAP_PIN_OFF_WAKEUPENABLE);
+-	if (val & OMAP_OFF_EN) {
+-		if (!(val & OMAP_OFFOUT_EN)) {
+-			if (!(val & OMAP_OFF_PULL_UP)) {
+-				OMAP_MUX_TEST_FLAG(val,
+-					OMAP_PIN_OFF_INPUT_PULLDOWN);
++	if (cpu_is_am33xx()) {
++		if (val & AM33XX_INPUT_EN) {
++			if (val & AM33XX_PULL_DISA) {
++				flags[ ++i] = "OMAP_PIN_INPUT";
++			} else if (val & AM33XX_PULL_UP) {
++				flags[ ++i] = "OMAP_PIN_INPUT_PULLUP";
+ 			} else {
+-				OMAP_MUX_TEST_FLAG(val,
+-					OMAP_PIN_OFF_INPUT_PULLUP);
++				flags[ ++i] = "OMAP_PIN_INPUT_PULLDOWN";
+ 			}
+ 		} else {
+-			if (!(val & OMAP_OFFOUT_VAL)) {
+-				OMAP_MUX_TEST_FLAG(val,
+-					OMAP_PIN_OFF_OUTPUT_LOW);
++			flags[ ++i] = "OMAP_PIN_OUTPUT";
++		}
++	} else {
++		OMAP_MUX_TEST_FLAG(val, OMAP_PIN_OFF_WAKEUPENABLE);
++		if (val & OMAP_OFF_EN) {
++			if (!(val & OMAP_OFFOUT_EN)) {
++				if (!(val & OMAP_OFF_PULL_UP)) {
++					OMAP_MUX_TEST_FLAG(val,
++							OMAP_PIN_OFF_INPUT_PULLDOWN);
++				} else {
++					OMAP_MUX_TEST_FLAG(val,
++							OMAP_PIN_OFF_INPUT_PULLUP);
++				}
+ 			} else {
+-				OMAP_MUX_TEST_FLAG(val,
+-					OMAP_PIN_OFF_OUTPUT_HIGH);
++				if (!(val & OMAP_OFFOUT_VAL)) {
++					OMAP_MUX_TEST_FLAG(val,
++							OMAP_PIN_OFF_OUTPUT_LOW);
++				} else {
++					OMAP_MUX_TEST_FLAG(val,
++							OMAP_PIN_OFF_OUTPUT_HIGH);
++				}
+ 			}
+ 		}
+-	}
+ 
+-	if (val & OMAP_INPUT_EN) {
+-		if (val & OMAP_PULL_ENA) {
+-			if (!(val & OMAP_PULL_UP)) {
+-				OMAP_MUX_TEST_FLAG(val,
+-					OMAP_PIN_INPUT_PULLDOWN);
++		if (val & OMAP_INPUT_EN) {
++			if (val & OMAP_PULL_ENA) {
++				if (!(val & OMAP_PULL_UP)) {
++					OMAP_MUX_TEST_FLAG(val,
++							OMAP_PIN_INPUT_PULLDOWN);
++				} else {
++					OMAP_MUX_TEST_FLAG(val, OMAP_PIN_INPUT_PULLUP);
++				}
+ 			} else {
+-				OMAP_MUX_TEST_FLAG(val, OMAP_PIN_INPUT_PULLUP);
++				OMAP_MUX_TEST_FLAG(val, OMAP_PIN_INPUT);
+ 			}
+ 		} else {
+-			OMAP_MUX_TEST_FLAG(val, OMAP_PIN_INPUT);
++			i++;
++			flags[i] = "OMAP_PIN_OUTPUT";
+ 		}
+-	} else {
+-		i++;
+-		flags[i] = "OMAP_PIN_OUTPUT";
+ 	}
+ 
+ 	do {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
new file mode 100644
index 0000000..4a004d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
@@ -0,0 +1,83 @@
+From d4527038dac639f1066b529cbcc368de91d2f525 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 14 May 2012 14:23:45 +0200
+Subject: [PATCH 40/40] beaglebone: export SPI2 as spidev when no capes are
+ using SPI
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   25 +++++++++++++++++++++----
+ 1 files changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index c9ee0a2..a0fa53a 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -497,6 +497,7 @@ static bool beaglebone_cape_detected;
+ static int capecount = 0;
+ static bool beaglebone_tsadcpins_free = 1;
+ static bool beaglebone_leds_free = 1;
++static bool beaglebone_spi1_free = 1;
+ 
+ 
+ #define GP_EVM_REV_IS_1_0		0x1
+@@ -1897,6 +1898,16 @@ static struct spi_board_info am335x_spi1_slave_info[] = {
+ 	},
+ };
+ 
++static struct spi_board_info bone_spidev2_info[] = {
++	{
++		.modalias      = "spidev",
++		.irq           = -1,
++		.max_speed_hz  = 12000000,
++		.bus_num       = 2,
++		.chip_select   = 0,
++	},
++};
++
+ static struct gpmc_timings am335x_nand_timings = {
+ 	.sync_clk = 0,
+ 
+@@ -2199,8 +2210,9 @@ static struct spi_board_info tt3201_spi_info[] = {
+ 
+ static void tt3201_init(int evm_id, int profile)
+ {
+-	pr_info("TowerTech TT3201 CAN Cape\n");
+-
++	pr_info("TowerTech TT3201 CAN cape\n");
++	
++	beaglebone_spi1_free = 0;
+ 	setup_pin_mux(spi1_pin_mux);
+ 	setup_pin_mux(tt3201_pin_mux);
+ 
+@@ -2234,12 +2246,18 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			if (beaglebone_leds_free == 1) {
+ 				boneleds_init(0,0);
+ 			}
++			if(beaglebone_spi1_free == 1) {
++				beaglebone_spi1_free = 0;
++				pr_info("BeagleBone cape: exporting SPI pins as spidev\n");
++				setup_pin_mux(spi1_pin_mux);
++				spi_register_board_info(bone_spidev2_info, ARRAY_SIZE(bone_spidev2_info));
++			}
+ 		}
+ 		return;
+ 	}
+ 
+ 	if (cape_config.header != AM335X_EEPROM_HEADER) {
+-		pr_warning("BeagleBone Cape EEPROM: wrong header 0x%x, expected 0x%x\n",
++		pr_warning("BeagleBone cape EEPROM: wrong header 0x%x, expected 0x%x\n",
+ 			cape_config.header, AM335X_EEPROM_HEADER);
+ 		goto out;
+ 	}
+@@ -2630,7 +2648,6 @@ static void spi1_init(int evm_id, int profile)
+ 	return;
+ }
+ 
+-
+ static int beaglebone_phy_fixup(struct phy_device *phydev)
+ {
+ 	phydev->supported &= ~(SUPPORTED_100baseT_Half |
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 0f44a95..05772b4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -960,5 +960,12 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0031-beaglebone-fix-3.5-cape-support.patch \
 	file://beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
 	file://beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
+	file://beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch \
+	file://beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch \
+	file://beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch \
+	file://beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch \
+	file://beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch \
+	file://beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch \
+	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 "
-- 
1.7.10


