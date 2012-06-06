Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3289E00723
	for <meta-ti@yoctoproject.org>; Wed,  6 Jun 2012 08:07:41 -0700 (PDT)
Received: by eaab16 with SMTP id b16so2156657eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 06 Jun 2012 08:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ViE8jGH7q/1EthxfIbbXKJlLVm8doIzE7n+a13nlwAM=;
	b=Ahzlmo8g6VTLspnRvZCahdS9Q4r4IEdb83uFg3f88ihqLekjN4HTbC1F7CixLyqqjN
	JTDFuZIdV8SMCufnhdymTvXniWSX6F0KcFWlr5OiG1LCulUQf/rAgxLRxyhofhuJVnUE
	b4+nXB/BJbHR/uNR9ZWolz5Y2Z6/4rrL3iNWGK/pvhQ9VT/Ma8BYVAFd7cuwATd65NBt
	+LvtxdZcipkju3HkrxFgsrjiLEoPn+nGKJ7Z+9/O0eCp4iPLJriy9/2KSnHkXR+sNpi0
	PWuJk1TpL94UkW4DdfBNAfsMkQyU7wxQN9/AcM98O3AMbSym1dkQ7vNJZ1WT5MlWRTwT
	buxg==
Received: by 10.14.45.77 with SMTP id o53mr8643758eeb.36.1338995260069;
	Wed, 06 Jun 2012 08:07:40 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id n52sm327828eeh.9.2012.06.06.08.07.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:07:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Jun 2012 17:07:25 +0200
Message-Id: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQleVBK15TfUPsInpGcK9Ix80L1PPjwzByAHGeQdowa+3jqiE52a+s+Jd3cOT7hjeI4mNj3z
Cc: denys@ti.com
Subject: [PATCH 1/6] linux-ti33x-psp 3.2: switch ADC to 16x averaging, disable 275MHz, add 4.3" LCD support
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
X-List-Received-Date: Wed, 06 Jun 2012 15:07:42 -0000

* The switch to 16x averaging is done to combat the excessive noise in the signal. It's still *very* bad, but the TS cursor jitter has decreased a bit
* The OPP for 275MHz was disabled due to all the errata. Both the EMIF and MUSB don't seem to like that OPP.
* The resistive touch version of the 4.3" LCD cape is supported in 24 bit mode.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0065-ti_tscadc-switch-to-16x-averaging.patch   |   53 +++++++++++
 ...disable-OPP-for-275MHz-due-to-silicon-err.patch |   28 ++++++
 ...o-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch |   45 ++++++++++
 ...add-support-for-the-4.3-lcd-cape-with-res.patch |   94 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
new file mode 100644
index 0000000..ae5a4f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
@@ -0,0 +1,53 @@
+From 979f76376236287b2e4d4b4505ed34b1f9c9d389 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 28 May 2012 09:56:45 +0200
+Subject: [PATCH 65/68] ti_tscadc: switch to 16x averaging
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 7df7bb2..ae6c4c4 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -161,7 +161,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+  	 * sample channel 1 (SEL_INP mux bits = 0)
+  	 */
+ 	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
+-		TSCADC_STEPCONFIG_4SAMPLES_AVG |
++		TSCADC_STEPCONFIG_16SAMPLES_AVG |
+ 		((channel-1) << 19);
+ 	
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+@@ -242,7 +242,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+ 
+ 	stepconfigx = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-			TSCADC_STEPCONFIG_4SAMPLES_AVG | TSCADC_STEPCONFIG_XPP;
++			TSCADC_STEPCONFIG_16SAMPLES_AVG | TSCADC_STEPCONFIG_XPP;
+ 
+ 	switch (ts_dev->wires) {
+ 	case 4:
+@@ -279,7 +279,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	}
+ 
+ 	stepconfigy = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-			TSCADC_STEPCONFIG_4SAMPLES_AVG | TSCADC_STEPCONFIG_YNN |
++			TSCADC_STEPCONFIG_16SAMPLES_AVG | TSCADC_STEPCONFIG_YNN |
+ 			TSCADC_STEPCONFIG_INM | TSCADC_STEPCONFIG_FIFO1;
+ 	switch (ts_dev->wires) {
+ 	case 4:
+@@ -324,7 +324,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 
+ 	 /* Configure to calculate pressure */
+ 	stepconfigz1 = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-				TSCADC_STEPCONFIG_4SAMPLES_AVG |
++				TSCADC_STEPCONFIG_16SAMPLES_AVG |
+ 				TSCADC_STEPCONFIG_XNP |
+ 				TSCADC_STEPCONFIG_YPN | TSCADC_STEPCONFIG_INM;
+ 	stepconfigz2 = stepconfigz1 | TSCADC_STEPCONFIG_Z1 |
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch
new file mode 100644
index 0000000..aae97bb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch
@@ -0,0 +1,28 @@
+From 954d199a0e9aaa4d7dbc7215cea0225cd3ffe186 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 28 May 2012 18:54:57 +0200
+Subject: [PATCH 66/68] beaglebone: disable OPP for 275MHz due to silicon
+ errata
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index da6020b..58c2754 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2975,6 +2975,9 @@ static void tps65217_init(int evm_id, int profile)
+ 		return;
+ 	}
+ 
++	pr_info("Disabling OPP for 275MHz due to silicon errata");
++	opp_disable(mpu_dev, 275000000);
++
+ 	if (!(val & TPS65217_STATUS_ACPWR)) {
+ 		/* If powered by USB then disable OPP120 and OPPTURBO */
+ 		pr_info("Maximum current provided by the USB port is 500mA"
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
new file mode 100644
index 0000000..27431b8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
@@ -0,0 +1,45 @@
+From 3f166417b837d6fb44e1003a2286876cb5c682b4 Mon Sep 17 00:00:00 2001
+From: "Patil, Rachna" <rachna@ti.com>
+Date: Thu, 26 Apr 2012 15:20:20 +0530
+Subject: [PATCH 67/68] video: da8xx-fb: Add Newhaven LCD Panel details
+
+This patch adds details for Newhaven display Panel.
+This panel is used on AM335x EVM-SK An upcoming TI EVM.
+
+Signed-off-by: Patil, Rachna <rachna@ti.com>
+
+Conflicts:
+
+	drivers/video/da8xx-fb.c
+---
+ drivers/video/da8xx-fb.c |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
+index 9aaca5d..010a8bc 100644
+--- a/drivers/video/da8xx-fb.c
++++ b/drivers/video/da8xx-fb.c
+@@ -301,6 +301,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+ 		.pxl_clk = 8000000,
+ 		.invert_pxl_clk = 0,
+ 	},	
++	/* Newhaven Display */
++	[5] = {
++		.name = "NHD-4.3-ATXI#-T-1",
++		.width = 480,
++		.height = 272,
++		.hfp = 8,
++		.hbp = 43,
++		.hsw = 4,
++		.vfp = 4,
++		.vbp = 12,
++		.vsw = 10,
++		.pxl_clk = 9000000,
++		.invert_pxl_clk = 0,
++	},
+ };
+ 
+ /* Enable the Raster Engine of the LCD Controller */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
new file mode 100644
index 0000000..6d2ab2a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
@@ -0,0 +1,94 @@
+From 6b69dbc7cee48dfa9ff281ae918cc468ed38a537 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 May 2012 14:12:44 +0200
+Subject: [PATCH 68/68] beaglebone: add support for the 4.3" lcd cape with
+ resistive touchscreen
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   48 +++++++++++++++++++++++++++-----
+ 1 files changed, 40 insertions(+), 8 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 58c2754..bb6049a 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -272,6 +272,12 @@ struct da8xx_lcdc_platform_data bbtoys35_pdata = {
+ 	.type			= "CDTech_S035Q01",
+ };
+ 
++struct da8xx_lcdc_platform_data bbtoys43_pdata = {
++	.manu_name		= "BBToys",
++	.controller_data	= &lcd_cfg,
++	.type			= "NHD-4.3-ATXI#-T-1",
++};
++
+ static const struct display_panel dvi_panel = {
+ 	WVGA,
+ 	16,
+@@ -562,14 +568,14 @@ static struct pinmux_config batterycape_pin_mux[] = {
+ 	
+ /* Module pin mux for LCDC */
+ static struct pinmux_config lcdc_pin_mux[] = {
+-	{"gpmc_ad8.lcd_data16",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad9.lcd_data17",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad10.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad11.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad12.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad13.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad14.lcd_data22",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad15.lcd_data23",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad8.lcd_data23",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad9.lcd_data22",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad10.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad11.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad12.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad13.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad14.lcd_data17",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad15.lcd_data16",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{NULL, 0},
+ };
+ 
+@@ -1659,6 +1665,24 @@ static void bbtoys35lcd_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++static void bbtoys43lcd_init(int evm_id, int profile)
++{
++	setup_pin_mux(lcdc16_pin_mux);
++	setup_pin_mux(lcdc_pin_mux);
++	
++	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
++	if (conf_disp_pll(18000000)) {
++		pr_info("Failed to set pixclock to 18000000, not attempting to"
++				"register LCD cape\n");
++		return;
++	}
++	
++	if (am33xx_register_lcdc(&bbtoys43_pdata))
++		pr_info("Failed to register Beagleboardtoys 4.3\" LCD cape device\n");
++	
++	return;
++}
++
+ #define BEAGLEBONEDVI_PDn_A1  GPIO_TO_PIN(1, 7)
+ #define BEAGLEBONEDVI_PDn_A2  GPIO_TO_PIN(1, 31)
+ 
+@@ -2672,6 +2696,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
++
++	if (!strncmp("BB-BONE-LCD4-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing LCD cape\n");
++		bbtoys43lcd_init(0,0);
++		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
++		tsc_init(0,0);
++		beaglebone_tsadcpins_free = 0;
++	}
+ 	
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
+ 		pr_info("BeagleBone cape: initializing VGA cape\n");
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index cd10044..46a6277 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1224,4 +1224,8 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch \
 	file://beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch \
 	file://beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch \
+	file://beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch \
+	file://beaglebone/0066-beaglebone-disable-OPP-for-275MHz-due-to-silicon-err.patch \
+	file://beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch \
+	file://beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch \
 "
-- 
1.7.10


