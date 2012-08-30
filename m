Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72596E0142A
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:09 -0700 (PDT)
Received: by eekd41 with SMTP id d41so650351eek.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=E3lPn63i3JV4A3yRwwVo1zboo6M+rLdZ+DwuXD12gcI=;
	b=G00d6BsUEjWQMpGg9viaq55+lJnfwvI3BjKmkJN8i7mNOCg2sar7eAK7w2jPmzL04+
	Lbsw1j3zCXBT6GL6lUjSqHOU6fI3slEi9Wc3HEfilEGU5Ps53Kz19k8hAwIzQB2QDSRi
	8BTPlasRHBLAL4xcPD4K+ZcCted7vAZvY7y0lPdTOspf+Y4BBsw24ZpPsSgVbRBmDLy1
	2w9pmtQPZTSn6zM3ZvFsnVY2tk5GKw0NafBD7rQfA+bVtXi8yg9F/2MRJdq/V9CaPV8S
	1Ba+yBeevVUZfcjyztNeVKnsqwstNmuI0Gw1eCw4FavathtMG3lRp9h/A7ILurFogOeL
	S9qA==
Received: by 10.14.177.193 with SMTP id d41mr5490376eem.19.1346316907851;
	Thu, 30 Aug 2012 01:55:07 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 45sm2937010eed.17.2012.08.30.01.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 01:55:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Aug 2012 10:54:54 +0200
Message-Id: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkGPE+AARvY+fKv+G7DFWcYt1DQqYKHFeYHwWxBSh0ETvHYAbKqhAbc3QtHzj81Vnf9bhn8
Subject: [PATCH 1/6] linux-ti33x-psp 3.2: LCD7 A3 support, eMMC cape support, camera cape improvements
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 08:55:10 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0081-beaglebone-add-support-for-LCD7-A3.patch  |  144 +++++++++
 ...one-add-rudimentary-support-for-eMMC-cape.patch |  111 +++++++
 ...bone-add-extra-partnumber-for-camera-cape.patch |   26 ++
 ...084-beaglebone-cssp_camera-driver-cleanup.patch |  324 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 +-
 5 files changed, 610 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0081-beaglebone-add-support-for-LCD7-A3.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0081-beaglebone-add-support-for-LCD7-A3.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0081-beaglebone-add-support-for-LCD7-A3.patch
new file mode 100644
index 0000000..07f7afc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0081-beaglebone-add-support-for-LCD7-A3.patch
@@ -0,0 +1,144 @@
+From 44bfbc3cbd6ddc95db9a886744582ffddb79fe47 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 24 Jul 2012 13:23:28 +0200
+Subject: [PATCH 81/84] beaglebone: add support for LCD7 A3
+
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   93 ++++++++++++++++++++++++++++++++-
+ 1 files changed, 92 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 82020fc..0c305b6 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -660,6 +660,12 @@ static struct pinmux_config bbtoys7a2_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for Beagleboardtoys 7" LCD cape */
++static struct pinmux_config bbtoys7a3_pin_mux[] = {
++	{"spi0_sclk.gpio0_2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
++	{"gpmc_a2.ehrpwm1A", OMAP_MUX_MODE6 | AM33XX_PIN_OUTPUT}, // Backlight
++	{NULL, 0},
++};
+ 
+ static struct pinmux_config w1_gpio_pin_mux[] = {
+ 	{"gpmc_ad3.gpio1_3",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+@@ -1164,6 +1170,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
+ 		pr_err("failed to register gpio keys for LCD7 cape\n");
+ }
+ 
++/* pinmux for lcd7 keys */
++static struct pinmux_config lcd7a3_keys_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //left
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //right
++	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //up
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //down
++	{"sdpi0_d0.gpio0_3",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //enter
++	{NULL, 0},
++};
++
++/* Configure GPIOs for lcd7 keys */
++static struct gpio_keys_button beaglebone_lcd7a3_gpio_keys[] = {
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
++		.gpio                   = GPIO_TO_PIN(0, 3),
++		.active_low             = true,
++		.desc                   = "enter",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++};
++
++static struct gpio_keys_platform_data beaglebone_lcd7a3_gpio_key_info = {
++	.buttons        = beaglebone_lcd7a3_gpio_keys,
++	.nbuttons       = ARRAY_SIZE(beaglebone_lcd7a3_gpio_keys),
++};
++
++static struct platform_device beaglebone_lcd7a3_keys = {
++	.name   = "gpio-keys",
++	.id     = -1,
++	.dev    = {
++		.platform_data  = &beaglebone_lcd7a3_gpio_key_info,
++	},
++};
++
++static void beaglebone_lcd7a3_keys_init(int evm_id, int profile)
++{
++	int err;
++	setup_pin_mux(lcd7a3_keys_pin_mux);
++	err = platform_device_register(&beaglebone_lcd7a3_keys);
++	if (err)
++		pr_err("failed to register gpio keys for LCD7 cape\n");
++}
++
+ /* pinmux for lcd3 keys */
+ static struct pinmux_config lcd3_keys_pin_mux[] = {
+ 	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+@@ -1719,6 +1801,7 @@ static void lcdc_init(int evm_id, int profile)
+ 
+ #define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
+ #define BEAGLEBONE_LCD7A2_AVDD_EN GPIO_TO_PIN(1, 31)
++#define BEAGLEBONE_LCD7A3_AVDD_EN GPIO_TO_PIN(0, 2)
+ 
+ static void bbtoys7lcd_init(int evm_id, int profile)
+ {
+@@ -2934,6 +3017,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			setup_pin_mux(bbtoys7a2_pin_mux);
+ 			gpio_request(BEAGLEBONE_LCD7A2_AVDD_EN, "BONE_LCD_AVDD_EN");
+ 			gpio_direction_output(BEAGLEBONE_LCD7A2_AVDD_EN, 1);
++		} else if(!strncmp("00A3", cape_config.version, 4)) {
++			setup_pin_mux(bbtoys7a3_pin_mux);
++			gpio_request(BEAGLEBONE_LCD7A3_AVDD_EN, "BONE_LCD_AVDD_EN");
++			gpio_direction_output(BEAGLEBONE_LCD7A3_AVDD_EN, 1);			
+ 		} else {
+ 			setup_pin_mux(bbtoys7_pin_mux);
+ 			gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
+@@ -2948,7 +3035,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		enable_ehrpwm1(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+ 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+-		beaglebone_lcd7_keys_init(0,0);
++		if (!strncmp("00A3", cape_config.version, 4)) {
++			beaglebone_lcd7a3_keys_init(0,0);
++		} else {
++			beaglebone_lcd7_keys_init(0,0);
++		}
+ 		
+ 		beaglebone_spi1_free = 0;
+ 		// A1 or newer
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch
new file mode 100644
index 0000000..737705c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch
@@ -0,0 +1,111 @@
+From 9fd45d5967c0e09c57e2cf41e4bf26dadf31eb16 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 26 Jul 2012 22:30:34 +0200
+Subject: [PATCH 82/84] beaglebone: add rudimentary support for eMMC cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++--------
+ 1 files changed, 31 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 0c305b6..579df6c 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -913,6 +913,7 @@ static struct pinmux_config mmc1_pin_mux[] = {
+ 	{"gpmc_csn2.mmc1_cmd",	OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLUP},
+ 	{"gpmc_csn0.gpio1_29",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+ 	{"gpmc_advn_ale.mmc1_sdcd", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++	{"uart1_rxd.mmc1_sdwp", OMAP_MUX_MODE1 | AM33XX_PIN_INPUT_PULLDOWN},
+ 	{NULL, 0},
+ };
+ 
+@@ -2627,6 +2628,28 @@ static void mcasp0_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++static void mmc0_init(int evm_id, int profile)
++{
++	setup_pin_mux(mmc0_pin_mux);
++
++	omap2_hsmmc_init(am335x_mmc);
++	return;
++}
++
++static void emmc_bone_init(int evm_id, int profile)
++{
++	printk("cape: emmc_bone_init\n");
++	setup_pin_mux(mmc1_pin_mux);
++	am335x_mmc[1].mmc = 2;
++	am335x_mmc[1].caps = MMC_CAP_4_BIT_DATA;
++	am335x_mmc[1].nonremovable = true;
++	am335x_mmc[1].gpio_cd = -EINVAL;
++	am335x_mmc[1].gpio_wp = -EINVAL;
++	am335x_mmc[1].ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34; /* 3V3 */
++	/* mmc will be initialized when mmc0_init is called */
++	return;
++}
++
+ static const char* cape_pins[] = {
+ /*
+   From SRM RevA5.0.1:
+@@ -2923,7 +2946,6 @@ static int bone_io_config_from_cape_eeprom( void)
+ 	RULER( NR_ITEMS( cape_config.muxdata));
+ 	return 0;
+ }
+-
+ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
+ {
+ 	int ret;
+@@ -3102,6 +3124,12 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		#endif
+ 		*/
+ 	}
++
++	if (!strncmp("BB-BONE-eMMC1-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing eMMC cape\n");
++		beaglebone_w1gpio_free = 0;
++		emmc_bone_init(0,0);
++	}
+ 	
+ 	if (!strncmp("BB-BONE-SERL-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing CAN cape\n");
+@@ -3147,6 +3175,7 @@ out:
+ 	beaglebone_cape_detected = false;
+ out2:
+ 	if (capecount > 3) {
++		mmc0_init(0,0);
+ 		if (beaglebone_tsadcpins_free == 1) {
+ 			pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+ 			bone_tsc_init(0,0);
+@@ -3338,14 +3367,6 @@ static void d_can_init(int evm_id, int profile)
+ 	}
+ }
+ 
+-static void mmc0_init(int evm_id, int profile)
+-{
+-	setup_pin_mux(mmc0_pin_mux);
+-
+-	omap2_hsmmc_init(am335x_mmc);
+-	return;
+-}
+-
+ static struct i2c_board_info tps65217_i2c_boardinfo[] = {
+ 	{
+ 		I2C_BOARD_INFO("tps65217", TPS65217_I2C_ID),
+@@ -3589,11 +3610,10 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ /* Beaglebone Rev A3 and after */
+ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{tps65217_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{NULL, 0, 0},
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch
new file mode 100644
index 0000000..152ac22
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch
@@ -0,0 +1,26 @@
+From b9d6ae7ba8604c3c8ce64c53073990a831611414 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 26 Jul 2012 22:31:30 +0200
+Subject: [PATCH 83/84] beaglebone: add extra partnumber for camera cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 579df6c..3b6f354 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -3158,7 +3158,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		tt3201_init(0,0);
+ 	}
+ 
+-	if (!strncmp("BB-BONE-CAM-01", cape_config.partnumber, 14)) {
++	if (!strncmp("BB-BONE-CAM-01", cape_config.partnumber, 14) || !strncmp("BB-BONE-CAM3-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: recognized Camera cape\n");
+ 		beaglebone_w1gpio_free = 0;
+ 		cssp_gpmc_init();
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch
new file mode 100644
index 0000000..5dc325d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch
@@ -0,0 +1,324 @@
+From b9f772af6c2b9116bad19371e4547af86b4ac18d Mon Sep 17 00:00:00 2001
+From: Dan Aizenstros <daizenstros@quicklogic.com>
+Date: Thu, 26 Jul 2012 21:57:12 -0400
+Subject: [PATCH 84/84] beaglebone: cssp_camera driver cleanup
+
+fix v4l2_buf.sequence to use frame count
+fix enum/g/s_input functions
+remove pointless g/s_std support
+change the driver to use dev_err and dev_info instead of printk
+
+Signed-off-by: Dan Aizenstros <daizenstros@quicklogic.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/media/video/cssp_camera/cssp_camera.c |   98 +++++++++++--------------
+ drivers/media/video/cssp_camera/cssp_camera.h |    7 +-
+ 2 files changed, 44 insertions(+), 61 deletions(-)
+
+diff --git a/drivers/media/video/cssp_camera/cssp_camera.c b/drivers/media/video/cssp_camera/cssp_camera.c
+index fca199b..4d86bf4 100644
+--- a/drivers/media/video/cssp_camera/cssp_camera.c
++++ b/drivers/media/video/cssp_camera/cssp_camera.c
+@@ -51,6 +51,7 @@
+ #define PCLK_POL		BIT(14) /* PCLK polarity (0 - rising edge, 1 - falling edge */
+ #define HS_EN			BIT(13) /* High speed bus (0 =< 50 MHz, 1 > 50 MHz) */
+ #define ENABLE			BIT(12)
++#define REV			0xFF	/* Chip Revision mask */
+ 
+ 
+ static struct cssp_cam_fmt formats[] = {
+@@ -123,7 +124,7 @@ static int reset_cssp(struct cssp_cam_dev *cam)
+ 
+ 	err = configure_gpio(cam->reset_pin, 0, "cssp_reset");
+ 	if (err) {
+-		printk(KERN_ERR "[%s]: failed to configure cssp reset pin\n", pdev->name);
++		dev_err(&pdev->dev, "failed to configure cssp reset pin\n");
+ 		return -1;
+ 	}
+ 
+@@ -190,7 +191,6 @@ static void dma_callback(unsigned lch, u16 ch_status, void *data)
+ 
+ 	if (ch_status == DMA_COMPLETE) {
+ 		struct vb2_buffer *vb = dev->current_vb;
+-		struct timeval ts;
+ 		struct edmacc_param dma_tr_params;
+ 
+ 		edma_read_slot(dev->dma_ch, &dma_tr_params);
+@@ -208,13 +208,10 @@ static void dma_callback(unsigned lch, u16 ch_status, void *data)
+ 		}
+ 
+ 		vb->v4l2_buf.field = dev->field;
+-		dev->field_count++;
+-		vb->v4l2_buf.sequence = dev->field_count >> 1;
+-		do_gettimeofday(&ts);
+-		vb->v4l2_buf.timestamp = ts;
++		vb->v4l2_buf.sequence = dev->frame_cnt++;
++		do_gettimeofday(&vb->v4l2_buf.timestamp);
+ 		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+ 		dev->current_vb = NULL;
+-		dev->frame_cnt++;
+ 
+ 		/* check if we have new buffer queued */
+ 		dequeue_buffer_for_dma(dev);
+@@ -237,16 +234,16 @@ static int configure_edma(struct cssp_cam_dev *cam)
+ 	pdev->dev.coherent_dma_mask = (u32)~0;
+ 
+ 	if (dma_set_mask(&pdev->dev, (u32)~0)) {
+-		printk(KERN_ERR "[%s]: failed setting mask for DMA\n", pdev->name);
++		dev_err(&pdev->dev, "failed setting mask for DMA\n");
+ 		return -1;
+ 	}
+ 
+ 	cam->dma_ch = edma_alloc_channel(dma_channel, dma_callback, cam, EVENTQ_0);
+ 	if (cam->dma_ch < 0) {
+-		printk(KERN_ERR "[%s]: allocating channel for DMA failed\n", pdev->name);
++		dev_err(&pdev->dev, "allocating channel for DMA failed\n");
+ 		return -EBUSY;
+ 	} else {
+-		printk(KERN_ERR "[%s]: allocating channel for DMA succeeded, chan=%d\n", pdev->name, cam->dma_ch);
++		dev_info(&pdev->dev, "allocating channel for DMA succeeded, chan=%d\n", cam->dma_ch);
+ 	}
+ 
+ 	cam->dma_tr_params.opt = TCINTEN | TCC(cam->dma_ch);
+@@ -273,7 +270,7 @@ static int configure_cssp(struct cssp_cam_dev *cam)
+ 
+ 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpmc_phys_mem_slot");
+ 	if (res == NULL) {
+-		printk(KERN_ERR "[%s]: failed to get gpmc_phys_mem_slot resource\n", pdev->name);
++		dev_err(&pdev->dev, "failed to get gpmc_phys_mem_slot resource\n");
+ 		return -ENODEV;
+ 	}
+ 
+@@ -289,15 +286,16 @@ static int configure_cssp(struct cssp_cam_dev *cam)
+ 
+ 	cam->reg_base_virt = (unsigned int)ioremap(cam->reg_base_phys, cam->reg_size);
+ 	if (cam->reg_base_virt == 0) {
+-		printk(KERN_ERR "[%s]: ioremap of registers region failed\n", pdev->name);
++		dev_err(&pdev->dev, "ioremap of registers region failed\n");
+ 		release_mem_region(cam->reg_base_phys, cam->reg_size);
+ 		return -ENOMEM;
+ 	}
+ 
+-	printk(KERN_INFO "[%s]: reg_base_virt = 0x%x\n", pdev->name, cam->reg_base_virt);
++	dev_info(&pdev->dev, "reg_base_virt = 0x%x\n", cam->reg_base_virt);
+ 
+ 	val = readw(cam->reg_base_virt + REG_MODE);
+-	printk(KERN_INFO "[%s]: reading register address=0x0 returns 0x%x\n", pdev->name, val);
++	cam->rev = val & REV;
++	dev_info(&pdev->dev, "CSSP Revision %c%d\n", 'A' + ((cam->rev & 0xf0) >> 4), cam->rev & 0x0f);
+ 
+ 	return 0;
+ }
+@@ -322,7 +320,7 @@ static int configure_camera_sensor(struct cssp_cam_dev *cam)
+ 
+ 	adapter	= i2c_get_adapter(((struct soc_camera_link *)(info->platform_data))->i2c_adapter_id);
+ 	if (!adapter) {
+-		printk(KERN_INFO "[%s]: failed to get adapter...\n", __func__);
++		dev_err(&cam->pdev->dev, "failed to get i2c adapter...\n");
+ 		return -ENODEV;
+ 	}
+ 
+@@ -333,7 +331,7 @@ static int configure_camera_sensor(struct cssp_cam_dev *cam)
+ 		return -ENODEV;
+ 	}
+ 
+-	printk(KERN_INFO "[%s]: client's name is: %s\n", __func__, client->name);
++	dev_info(&cam->pdev->dev, "client's name is: %s\n", client->name);
+ 
+ 	subdev = (struct v4l2_subdev *)i2c_get_clientdata(client);
+ 	if (subdev == NULL) {
+@@ -417,6 +415,8 @@ static int queue_setup(struct vb2_queue *vq, const struct v4l2_format *fmt,
+ 
+ 	alloc_ctxs[0] = dev->dma_cont_ctx;
+ 
++	dev->frame_cnt = 0;
++
+ 	dprintk(dev, 1, "%s, count=%d, size=%ld\n", __func__, *nbuffers, size);
+ 
+ 	return 0;
+@@ -659,6 +659,20 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
+ 	pix->bytesperline = (pix->width * fmt->depth) >> 3;
+ 	pix->sizeimage = pix->height * pix->bytesperline;
+ 
++	if ((pix->sizeimage % BYTES_PER_DMA_EVT) != 0)
++		return -EINVAL;
++
++	switch (mbus_fmt.field) {
++	case V4L2_FIELD_ANY:
++		pix->field = V4L2_FIELD_NONE;
++		break;
++	case V4L2_FIELD_NONE:
++		break;
++	default:
++		dev_err(&dev->pdev->dev, "Field type %d unsupported.\n", mbus_fmt.field);
++		return -EINVAL;
++	}
++
+ 	return 0;
+ }
+ 
+@@ -744,42 +758,29 @@ static int vidioc_log_status(struct file *file, void *priv)
+ 	return 0;
+ }
+ 
+-static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id *i)
+-{
+-	return 0;
+-}
+-
+-/* only one input in this sample driver */
+ static int vidioc_enum_input(struct file *file, void *priv,
+ 				struct v4l2_input *inp)
+ {
+-	return -EINVAL;
++	if (inp->index > 0)
++		return -EINVAL;
+ 
+ 	inp->type = V4L2_INPUT_TYPE_CAMERA;
+-	inp->std = V4L2_STD_525_60;
+ 	sprintf(inp->name, "Camera %u", inp->index);
++
+ 	return 0;
+ }
+ 
+ static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
+ {
+-	struct cssp_cam_dev *dev = video_drvdata(file);
+-
+-	*i = dev->input;
++	*i = 0;
+ 
+ 	return 0;
+ }
+ 
+ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
+ {
+-	struct cssp_cam_dev *dev = video_drvdata(file);
+-
+-	return -EINVAL;
+-
+-	if (i == dev->input)
+-		return 0;
+-
+-	dev->input = i;
++	if (i > 0)
++		return -EINVAL;
+ 
+ 	return 0;
+ }
+@@ -805,7 +806,6 @@ static const struct v4l2_ioctl_ops cssp_cam_ioctl_ops = {
+ 	.vidioc_querybuf		= vidioc_querybuf,
+ 	.vidioc_qbuf			= vidioc_qbuf,
+ 	.vidioc_dqbuf			= vidioc_dqbuf,
+-	.vidioc_s_std			= vidioc_s_std,
+ 	.vidioc_enum_input		= vidioc_enum_input,
+ 	.vidioc_g_input			= vidioc_g_input,
+ 	.vidioc_s_input			= vidioc_s_input,
+@@ -894,8 +894,6 @@ static struct video_device cssp_cam_template = {
+ 	.ioctl_ops	= &cssp_cam_ioctl_ops,
+ 	.minor		= -1,
+ 	.release	= video_device_release,
+-	.tvnorms	= V4L2_STD_525_60,
+-	.current_norm	= V4L2_STD_NTSC_M,
+ };
+ 
+ static int __init  video_probe(struct cssp_cam_dev *cam_dev)
+@@ -1006,12 +1004,12 @@ static int __init  cssp_cam_probe(struct platform_device *pdev)
+ 
+ 	cssp_cam_platform_data = (struct cssp_cam_platform_data *) pdev->dev.platform_data;
+ 	if (cssp_cam_platform_data == NULL) {
+-		printk(KERN_ERR "[%s]: missing platform data\n", pdev->name);
++		dev_err(&pdev->dev, "missing platform data\n");
+ 		return -ENODEV;
+ 	}
+ 
+ 	if (cssp_cam_platform_data->cam_i2c_board_info == NULL) {
+-		printk(KERN_ERR "[%s]: missing camera i2c board info\n", pdev->name);
++		dev_err(&pdev->dev, "missing camera i2c board info\n");
+ 		return -ENODEV;
+ 	}
+ 
+@@ -1027,7 +1025,7 @@ static int __init  cssp_cam_probe(struct platform_device *pdev)
+ 	cam_dev->camera_clk = clk_get(&pdev->dev, cssp_cam_platform_data->cam_clk_name);
+ 	if (IS_ERR(cam_dev->camera_clk)) {
+ 		ret = PTR_ERR(cam_dev->camera_clk);
+-		printk(KERN_ERR "[%s]: cannot clk_get %s\n", pdev->name, cssp_cam_platform_data->cam_clk_name);
++		dev_err(&pdev->dev, "cannot clk_get %s\n", cssp_cam_platform_data->cam_clk_name);
+ 		goto fail0;
+ 	}
+ 
+@@ -1043,7 +1041,7 @@ static int __init  cssp_cam_probe(struct platform_device *pdev)
+ 
+ 	ret = configure_camera_sensor(cam_dev);
+ 	if (ret) {
+-		printk(KERN_ERR "[%s]: camera sensor configuration failed\n", pdev->name);
++		dev_err(&pdev->dev, "camera sensor configuration failed\n");
+ 		goto fail3;
+ 	}
+ 
+@@ -1097,7 +1095,7 @@ static int cssp_cam_remove(struct platform_device *pdev)
+ 
+ 	kfree(cam);
+ 
+-	printk(KERN_INFO "[%s]: removed\n", pdev->name);
++	dev_info(&pdev->dev, "removed\n");
+ 
+ 	return 0;
+ }
+@@ -1112,20 +1110,8 @@ static struct platform_driver cssp_cam_driver = {
+ 	},
+ };
+ 
++module_platform_driver(cssp_cam_driver);
+ 
+-static int __init cssp_cam_init(void)
+-{
+-	return platform_driver_register(&cssp_cam_driver);
+-}
+-
+-static void __exit cssp_cam_exit(void)
+-{
+-	platform_driver_unregister(&cssp_cam_driver);
+-}
+-
+-
+-module_init(cssp_cam_init);
+-module_exit(cssp_cam_exit);
+ 
+ /*
+  * Macros sets license, author and description
+diff --git a/drivers/media/video/cssp_camera/cssp_camera.h b/drivers/media/video/cssp_camera/cssp_camera.h
+index 8eb5f83..3bb6ea4 100644
+--- a/drivers/media/video/cssp_camera/cssp_camera.h
++++ b/drivers/media/video/cssp_camera/cssp_camera.h
+@@ -111,9 +111,6 @@ struct cssp_cam_dev {
+ 	int				streaming_started;
+ 	struct vb2_buffer		*current_vb;
+ 
+-	/* Input Number */
+-	int				input;
+-
+ 	/* video capture */
+ 	struct cssp_cam_fmt		*fmt;
+ 	u32				width;
+@@ -123,8 +120,6 @@ struct cssp_cam_dev {
+ 	enum v4l2_colorspace		colorspace;
+ 	struct vb2_queue		vb_vidq;
+ 	enum v4l2_field			field;
+-	unsigned int			field_count;
+-
+ 
+ 	/* Camera Sensor */
+ 	struct i2c_board_info		*camera_board_info;
+@@ -142,6 +137,8 @@ struct cssp_cam_dev {
+ 	int				frame_cnt;
+ 
+ 	int				reset_pin;
++
++	int				rev;
+ };
+ 
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index c137e13..4c870bc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.23", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1640,4 +1640,8 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0078-beaglebone-error-handling-for-DMA-completion-in-cssp.patch \
 	file://beaglebone/0079-AM335X-errata-OPP50-on-MPU-domain-is-not-supported.patch \
 	file://beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch \
+	file://beaglebone/0081-beaglebone-add-support-for-LCD7-A3.patch \
+	file://beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch \
+	file://beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch \
+	file://beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch \
 "
-- 
1.7.10


