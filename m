Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4856DE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Tue,  7 Feb 2012 03:14:24 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so5595130wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 07 Feb 2012 03:14:24 -0800 (PST)
Received: by 10.180.86.105 with SMTP id o9mr33522348wiz.4.1328613263938;
	Tue, 07 Feb 2012 03:14:23 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j16sm55648478wie.4.2012.02.07.03.14.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:14:22 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue,  7 Feb 2012 12:14:07 +0100
Message-Id: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [BeagleBone][PATCH 1/6] linux-ti335x-psp: add 3.2 based on 3.2-staging branch
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
X-List-Received-Date: Tue, 07 Feb 2012 11:14:27 -0000

runtime tested on beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...1-f_rndis-HACK-around-undefined-variables.patch |   31 +
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |   38 +
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |   30 +
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |   92 +
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |  548 ++
 .../0006-more-beaglebone-merges.patch              |  125 +
 .../0007-beaglebone-disable-tsadc.patch            |   31 +
 ...general-purpose-mode-untested-with-touchs.patch |  411 ++
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   44 +
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   26 +
 ...cadc-make-stepconfig-channel-configurable.patch |   46 +
 .../0012-tscadc-Trigger-through-sysfs.patch        |  147 +
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   34 +
 ...c-switch-to-polling-instead-of-interrupts.patch |   54 +
 .../0015-beaglebone-fix-ADC-init.patch             |   47 +
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig | 3566 ++++++++++
 .../beaglebone/logo_linux_clut224.ppm              | 7053 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   46 +
 18 files changed, 12369 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/logo_linux_clut224.ppm
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp_3.2.bb

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
new file mode 100644
index 0000000..73a61da
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -0,0 +1,31 @@
+From d26b2d246668587049b1362a42c9b829f2ca288a Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 7 Oct 2011 15:29:28 +0200
+Subject: [PATCH 01/16] f_rndis: HACK around undefined variables
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/usb/gadget/f_rndis.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_rndis.c b/drivers/usb/gadget/f_rndis.c
+index 6614490..d2f1b6f 100644
+--- a/drivers/usb/gadget/f_rndis.c
++++ b/drivers/usb/gadget/f_rndis.c
+@@ -767,11 +767,11 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
+ 
+ 	rndis_set_param_medium(rndis->config, NDIS_MEDIUM_802_3, 0);
+ 	rndis_set_host_mac(rndis->config, rndis->ethaddr);
+-
++/*
+ 	if (rndis_set_param_vendor(rndis->config, vendorID,
+ 				manufacturer))
+ 		goto fail;
+-
++*/
+ 	/* NOTE:  all that is done without knowing or caring about
+ 	 * the network link ... which is unavailable to this code
+ 	 * until we're activated via set_alt().
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
new file mode 100644
index 0000000..c3b3da8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -0,0 +1,38 @@
+From 0188ea8b0633815f9ed9a728a6a1a53d64c1093c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 3 Nov 2011 17:35:50 +0100
+Subject: [PATCH 02/16] da8xx-fb: add DVI support for beaglebone
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/video/da8xx-fb.c |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
+index 85eda33..dea8936 100644
+--- a/drivers/video/da8xx-fb.c
++++ b/drivers/video/da8xx-fb.c
+@@ -271,6 +271,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+ 		.pxl_clk = 30000000,
+ 		.invert_pxl_clk = 0,
+ 	},
++	[3] = {
++		 /* 1024 x 768 @ 60 Hz  Reduced blanking VESA CVT 0.79M3-R */ 
++		.name = "1024x768@60",
++		.width = 1024,
++		.height = 768,
++		.hfp = 48,
++		.hbp = 80,
++		.hsw = 32,
++		.vfp = 3,
++		.vbp = 15,
++		.vsw = 4,
++		.pxl_clk = 56000000,
++		.invert_pxl_clk = 0,
++	},
+ };
+ 
+ /* Enable the Raster Engine of the LCD Controller */
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
new file mode 100644
index 0000000..5d972f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
@@ -0,0 +1,30 @@
+From 11622554369db32c7c14572efb525ef5e418338d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 10:21:32 +0100
+Subject: [PATCH 03/16] arm:omap:mux33xx: Add i2c2 pin mux
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/mux33xx.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 81a657e..36bb10a 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -312,10 +312,10 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"uart0_txd", "spi1_cs1", "d_can0_rx", NULL,
+ 		NULL, NULL, NULL, "gpio1_11"),
+ 	_AM33XX_MUXENTRY(UART1_CTSN, 0,
+-		"uart1_ctsn", NULL, NULL, NULL,
++		"uart1_ctsn", NULL, "d_can0_tx", "i2c2_sda",
+ 		"spi1_cs0", NULL, NULL, "gpio0_12"),
+ 	_AM33XX_MUXENTRY(UART1_RTSN, 0,
+-		"uart1_rtsn", NULL, NULL, NULL,
++		"uart1_rtsn", NULL, "d_can0_rx", "i2c2_scl",
+ 		"spi1_cs1", NULL, NULL, "gpio0_13"),
+ 	_AM33XX_MUXENTRY(UART1_RXD, 0,
+ 		"uart1_rxd", "mmc1_sdwp", NULL, NULL,
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
new file mode 100644
index 0000000..836b4a7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
@@ -0,0 +1,92 @@
+From 4f823ac4857d0d48b53b7a8799a745f746bfda1a Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 16 Nov 2011 07:23:37 -0600
+Subject: [PATCH 04/16] omap:hwmod:33xx: Add support for third i2c bus
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c |   54 ++++++++++++++++++++++++++++
+ 1 files changed, 54 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 9b15ffe..f9b91fa 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -62,6 +62,7 @@ static struct omap_hwmod am33xx_gpio2_hwmod;
+ static struct omap_hwmod am33xx_gpio3_hwmod;
+ static struct omap_hwmod am33xx_i2c1_hwmod;
+ static struct omap_hwmod am33xx_i2c2_hwmod;
++static struct omap_hwmod am33xx_i2c3_hwmod;
+ static struct omap_hwmod am33xx_usbss_hwmod;
+ static struct omap_hwmod am33xx_mmc0_hwmod;
+ static struct omap_hwmod am33xx_mmc1_hwmod;
+@@ -1084,6 +1085,58 @@ static struct omap_hwmod am33xx_i2c2_hwmod = {
+ 	.class		= &i2c_class,
+ };
+ 
++/* i2c3 */
++/* l4 per -> i2c3 */
++static struct omap_hwmod_addr_space am33xx_i2c3_addr_space[] = {
++	{
++		.pa_start	= AM33XX_I2C2_BASE,
++		.pa_end		= AM33XX_I2C2_BASE + SZ_4K - 1,
++		.flags		= ADDR_TYPE_RT
++	},
++	{ }
++};
++
++static struct omap_hwmod_ocp_if am335_l4_per_i2c3 = {
++	.master		= &am33xx_l4per_hwmod,
++	.slave		= &am33xx_i2c3_hwmod,
++	.addr		= am33xx_i2c3_addr_space,
++	.user		= OCP_USER_MPU,
++};
++
++static struct omap_hwmod_irq_info i2c3_mpu_irqs[] = {
++	{ .irq = AM33XX_IRQ_MSHSI2COCP2 },
++	{ .irq = -1 }
++};
++
++static struct omap_hwmod_dma_info i2c3_edma_reqs[] = {
++	{ .name = "tx", .dma_req = 0, },
++	{ .name = "rx", .dma_req = 0, },
++	{ .dma_req = -1 }
++};
++
++static struct omap_hwmod_ocp_if *am33xx_i2c3_slaves[] = {
++	&am335_l4_per_i2c3,
++};
++
++static struct omap_hwmod am33xx_i2c3_hwmod = {
++	.name		= "i2c3",
++	.mpu_irqs	= i2c3_mpu_irqs,
++	.sdma_reqs	= i2c3_edma_reqs,
++	.main_clk	= "i2c3_fck",
++	.clkdm_name	= "l4ls_clkdm",
++	.prcm		= {
++		.omap4 = {
++			.clkctrl_offs	= AM33XX_CM_PER_I2C2_CLKCTRL_OFFSET,
++			.modulemode	= MODULEMODE_SWCTRL,
++		},
++	},
++	.flags		= HWMOD_16BIT_REG,
++	.dev_attr	= &i2c_dev_attr,
++	.slaves		= am33xx_i2c3_slaves,
++	.slaves_cnt	= ARRAY_SIZE(am33xx_i2c3_slaves),
++	.class		= &i2c_class,
++};
++
+ /* 'icss' class */
+ static struct omap_hwmod_class am33xx_icss_hwmod_class = {
+ 	.name = "icss",
+@@ -3001,6 +3054,7 @@ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
+ 	/* i2c class */
+ 	&am33xx_i2c1_hwmod,
+ 	&am33xx_i2c2_hwmod,
++	&am33xx_i2c3_hwmod,
+ 	/* icss class */
+ 	&am33xx_icss_hwmod,
+ 	/* ieee5000 class */
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
new file mode 100644
index 0000000..03b4c93
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -0,0 +1,548 @@
+From c240df1d9fd60f318e719d0e77bc5955fecbb64e Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 30 Jan 2012 21:30:09 +0100
+Subject: [PATCH 05/16] beaglebone: rebase everything onto 3.2  - WARNING
+ MEGAPATCH
+
+---
+ arch/arm/mach-omap2/board-am335xevm.c |  429 ++++++++++++++++++++++++++++++++-
+ 1 files changed, 427 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 4c09cc9..e0c20c5 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -19,6 +19,7 @@
+ #include <linux/i2c/at24.h>
+ #include <linux/phy.h>
+ #include <linux/gpio.h>
++#include <linux/leds.h>
+ #include <linux/spi/spi.h>
+ #include <linux/spi/flash.h>
+ #include <linux/gpio_keys.h>
+@@ -167,6 +168,66 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
+ 
+ #include "common.h"
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
++static const struct display_panel dvi_panel = {
++	WVGA,
++	16,
++	16,
++	COLOR_ACTIVE,
++};
++
++static struct lcd_ctrl_config dvi_cfg = {
++	&dvi_panel,
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
++struct da8xx_lcdc_platform_data dvi_pdata = {
++	.manu_name		= "BBToys",
++	.controller_data	= &dvi_cfg,
++	.type			= "1024x768@60",
++};
++
+ /* TSc controller */
+ #include <linux/input/ti_tscadc.h>
+ #include <linux/lis3lv02d.h>
+@@ -320,9 +381,34 @@ struct am335x_evm_eeprom_config {
+ static struct am335x_evm_eeprom_config config;
+ static bool daughter_brd_detected;
+ 
+-#define GP_EVM_REV_IS_1_0		0x1
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
++#define GP_EVM_REV_IS_1_0A		0x1
+ #define GP_EVM_REV_IS_1_1A		0x2
+ #define GP_EVM_REV_IS_UNKNOWN		0xFF
++#define GP_EVM_ACTUALLY_BEAGLEBONE  0xBB
+ static unsigned int gp_evm_revision = GP_EVM_REV_IS_UNKNOWN;
+ unsigned int gigabit_enable = 1;
+ 
+@@ -404,11 +490,102 @@ static struct pinmux_config lcdc_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for Beagleboardtoys DVI cape */
++static struct pinmux_config dvi_pin_mux[] = {
++	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data1.lcd_data1",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data2.lcd_data2",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data3.lcd_data3",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data4.lcd_data4",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data5.lcd_data5",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data6.lcd_data6",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data7.lcd_data7",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data8.lcd_data8",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data9.lcd_data9",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data10.lcd_data10",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data11.lcd_data11",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data12.lcd_data12",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data13.lcd_data13",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data14.lcd_data14",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_data15.lcd_data15",	OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
++        | AM33XX_PULL_DISA},
++	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
++	{"gpmc_a2.rgmii2_td3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
++	{"gpmc_a3.rgmii2_td2", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
++	{"gpmc_ad7.gpmc_ad7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // DVI PDn
++	{NULL, 0},
++};
++
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
+ 	{"ain2.ain2",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+ 	{"ain3.ain3",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
++	{"ain4.ain4",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
++	{"ain5.ain5",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
++	{"ain6.ain6",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
++	{"ain7.ain7",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+ 	{"vrefp.vrefp",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+ 	{"vrefn.vrefn",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
+ 	{NULL, 0},
+@@ -541,6 +718,14 @@ static struct pinmux_config i2c1_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++static struct pinmux_config i2c2_pin_mux[] = {
++	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
++					AM33XX_PIN_INPUT_PULLUP},
++	{"uart1_rtsn.i2c2_scl",   OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
++					AM33XX_PIN_INPUT_PULLUP},
++	{NULL, 0},
++};
++
+ /* Module pin mux for mcasp1 */
+ static struct pinmux_config mcasp1_pin_mux[] = {
+ 	{"mii1_crs.mcasp1_aclkx", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
+@@ -815,6 +1000,64 @@ static struct pinmux_config profibus_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++
++#define BEAGLEBONEDVI_USR0_LED  GPIO_TO_PIN(1, 18)
++#define BEAGLEBONEDVI_USR1_LED  GPIO_TO_PIN(1, 19)
++
++static struct gpio_led dvi_gpio_leds[] = {
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
++		.name			= "dvi::usr0",
++		.default_trigger	= "heartbeat",
++		.gpio			= BEAGLEBONEDVI_USR0_LED,
++	},
++	{
++		.name			= "dvi::usr1",
++		.default_trigger	= "mmc0",
++		.gpio			= BEAGLEBONEDVI_USR1_LED,
++	},
++};
++
++static struct gpio_led_platform_data dvi_gpio_led_info = {
++	.leds		= dvi_gpio_leds,
++	.num_leds	= ARRAY_SIZE(dvi_gpio_leds),
++};
++
++static struct platform_device dvi_leds_gpio = {
++	.name	= "leds-gpio",
++	.id	= -1,
++	.dev	= {
++		.platform_data	= &dvi_gpio_led_info,
++	},
++};
++
++static struct pinmux_config bone_pin_mux[] = {
++	/* User LED gpios (gpio1_21 to gpio1_24) */
++    {"gpmc_a5.rgmii2_td0", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++    {"gpmc_a6.rgmii2_tclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++    {"gpmc_a7.rgmii2_rclk", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++    {"gpmc_a8.rgmii2_rd3", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++    /* Grounding gpio1_6 (pin 3 Conn A) signals bone tester to start diag tests */
++    {"gpmc_ad6.gpio1_6", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++};
++
+ /* Module pin mux for eCAP0 */
+ static struct pinmux_config ecap0_pin_mux[] = {
+ 	{"ecap0_in_pwm0_out.ecap0_in_pwm0_out",
+@@ -924,6 +1167,51 @@ static void lcdc_init(int evm_id, int profile)
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
++#define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
++
++static void dvi_init(int evm_id, int profile)
++{
++    setup_pin_mux(dvi_pin_mux);
++	gpio_request(BEAGLEBONEDVI_PDn, "DVI_PDn");
++	gpio_direction_output(BEAGLEBONEDVI_PDn, 1);
++
++	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
++	if (conf_disp_pll(560000000)) {
++		pr_info("Failed to set pixclock to 56000000, not attempting to"
++				"register DVI adapter\n");
++		return;
++	}
++	
++	if (am33xx_register_lcdc(&dvi_pdata))
++		pr_info("Failed to register BeagleBoardToys DVI cape\n");
++	return;
++}
++
+ static void tsc_init(int evm_id, int profile)
+ {
+ 	int err;
+@@ -931,16 +1219,48 @@ static void tsc_init(int evm_id, int profile)
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
+ 		pr_err("failed to register touchscreen device\n");
+ }
+ 
++static void bone_tsc_init(int evm_id, int profile)
++{
++	int err;
++	setup_pin_mux(tsc_pin_mux);
++	err = platform_device_register(&bone_tsc_device);
++	if (err)
++		pr_err("failed to register touchscreen device\n");
++}
++
++
++static void boneleds_init(int evm_id, int profile )
++{
++	int err;
++	setup_pin_mux(bone_pin_mux);
++	err = platform_device_register(&bone_leds_gpio);
++	if (err)
++		pr_err("failed to register BeagleBone LEDS\n");
++}
++
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
+@@ -1350,6 +1670,106 @@ static void i2c1_init(int evm_id, int profile)
+ 	return;
+ }
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
++	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 5)) {
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
++static struct at24_platform_data cape_eeprom_info = {
++        .byte_len       = (256*1024) / 8,
++        .page_size      = 64,
++        .flags          = AT24_FLAG_ADDR16,
++        .context        = (void *)NULL,
++		.setup		  = beaglebone_cape_setup,
++};
++
++static struct i2c_board_info __initdata cape_i2c_boardinfo[] = {
++        {
++                I2C_BOARD_INFO("24c256", 0x54),
++                .platform_data  = &cape_eeprom_info,
++        },
++        {
++                I2C_BOARD_INFO("24c256", 0x55),
++                .platform_data  = &cape_eeprom_info,
++        },
++        {
++                I2C_BOARD_INFO("24c256", 0x56),
++                .platform_data  = &cape_eeprom_info,
++        },
++        {
++                I2C_BOARD_INFO("24c256", 0x57),
++                .platform_data  = &cape_eeprom_info,
++        },
++};
++
++static void i2c2_init(int evm_id, int profile)
++{
++        setup_pin_mux(i2c2_pin_mux);
++        omap_register_i2c_bus(3, 100, cape_i2c_boardinfo,
++                        ARRAY_SIZE(cape_i2c_boardinfo));
++        return;
++}
++
++
+ /* Setup McASP 1 */
+ static void mcasp1_init(int evm_id, int profile)
+ {
+@@ -1703,7 +2123,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{rmii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -1713,7 +2135,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -1800,6 +2224,7 @@ static void setup_beaglebone_old(void)
+ static void setup_beaglebone(void)
+ {
+ 	pr_info("The board is a AM335x Beaglebone.\n");
++	gp_evm_revision = GP_EVM_ACTUALLY_BEAGLEBONE;
+ 
+ 	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
+ 	am335x_mmc[0].gpio_wp = -EINVAL;
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
new file mode 100644
index 0000000..b72bb56
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
@@ -0,0 +1,125 @@
+From 873c06849ccdb685b5cab1e6e809eda260427d42 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 10:04:03 +0100
+Subject: [PATCH 06/16] more beaglebone merges
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   63 +++++++++++++++++++++++++++++++--
+ 1 files changed, 60 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index e0c20c5..177ab9e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -248,6 +248,11 @@ static struct resource tsc_resources[]  = {
+ static struct tsc_data am335x_touchscreen_data  = {
+ 	.wires  = 4,
+ 	.x_plate_resistance = 200,
++	.mode = TI_TSCADC_TSCMODE,
++};
++
++static struct tsc_data bone_touchscreen_data  = {
++	.mode = TI_TSCADC_GENMODE,
+ };
+ 
+ static struct platform_device tsc_device = {
+@@ -260,6 +265,16 @@ static struct platform_device tsc_device = {
+ 	.resource       = tsc_resources,
+ };
+ 
++static struct platform_device bone_tsc_device = {
++	.name   = "tsc",
++	.id     = -1,
++	.dev    = {
++			.platform_data  = &bone_touchscreen_data,
++	},
++	.num_resources  = ARRAY_SIZE(tsc_resources),
++	.resource       = tsc_resources,
++};
++
+ static u8 am335x_iis_serializer_direction1[] = {
+ 	INACTIVE_MODE,	INACTIVE_MODE,	TX_MODE,	RX_MODE,
+ 	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,
+@@ -404,7 +419,7 @@ static bool beaglebone_cape_detected;
+ static int capecount = 0;
+ static bool beaglebone_tsadcpins_free = 1;
+ 
+-
++#define GP_EVM_REV_IS_1_0		0x1
+ #define GP_EVM_REV_IS_1_0A		0x1
+ #define GP_EVM_REV_IS_1_1A		0x2
+ #define GP_EVM_REV_IS_UNKNOWN		0xFF
+@@ -1000,6 +1015,47 @@ static struct pinmux_config profibus_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* LEDS - gpio1_21 -> gpio1_24 */
++
++#define BEAGLEBONE_USR1_LED  GPIO_TO_PIN(1, 21)
++#define BEAGLEBONE_USR2_LED  GPIO_TO_PIN(1, 22)
++#define BEAGLEBONE_USR3_LED  GPIO_TO_PIN(1, 23)
++#define BEAGLEBONE_USR4_LED  GPIO_TO_PIN(1, 24)
++
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
+ 
+ #define BEAGLEBONEDVI_USR0_LED  GPIO_TO_PIN(1, 18)
+ #define BEAGLEBONEDVI_USR1_LED  GPIO_TO_PIN(1, 19)
+@@ -1703,11 +1759,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
+ 	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
+ 
+-	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 5)) {
++	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 15)) {
+ 			pr_info("BeagleBone cape: initializing DVI cape\n");
+ 			dvi_init(0,0);
+ 	}
+-	if (!strncmp("LCD01", cape_config.partnumber, 5)) {
++	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+ 		bbtoys7lcd_init(0,0);
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+@@ -2154,6 +2210,7 @@ static void setup_general_purpose_evm(void)
+ 	pr_info("The board is general purpose EVM in profile %d\n", prof_sel);
+ 
+ 	if (!strncmp("1.1A", config.version, 4)) {
++		pr_info("EVM version is %s\n", config.version);
+ 		gp_evm_revision = GP_EVM_REV_IS_1_1A;
+ 	} else if (!strncmp("1.0", config.version, 3)) {
+ 		gp_evm_revision = GP_EVM_REV_IS_1_0;
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
new file mode 100644
index 0000000..3d1a8ea
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
@@ -0,0 +1,31 @@
+From 6f50bf55f6182ecd09aac93d3b613a99159b606c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 10:09:06 +0100
+Subject: [PATCH 07/16] beaglebone: disable tsadc
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 177ab9e..87ccf14 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -248,11 +248,11 @@ static struct resource tsc_resources[]  = {
+ static struct tsc_data am335x_touchscreen_data  = {
+ 	.wires  = 4,
+ 	.x_plate_resistance = 200,
+-	.mode = TI_TSCADC_TSCMODE,
++//	.mode = TI_TSCADC_TSCMODE,
+ };
+ 
+ static struct tsc_data bone_touchscreen_data  = {
+-	.mode = TI_TSCADC_GENMODE,
++//	.mode = TI_TSCADC_GENMODE,
+ };
+ 
+ static struct platform_device tsc_device = {
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
new file mode 100644
index 0000000..5d5f95f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -0,0 +1,411 @@
+From 7cb067cd1bd237a7a9978747fc4f96fa90b5d146 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 30 Nov 2011 15:00:40 +0100
+Subject: [PATCH 08/16] tscadc: Add general purpose mode, untested with
+ touchscreen functionality
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+
+Conflicts:
+
+	drivers/input/touchscreen/ti_tscadc.c
+	[Fixed by Koen - needs review]
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +
+ arch/arm/mach-omap2/mux33xx.c         |   12 ++
+ arch/arm/mach-omap2/mux33xx.h         |    4 +
+ drivers/input/touchscreen/ti_tscadc.c |  209 +++++++++++++++++++++++++--------
+ include/linux/input/ti_tscadc.h       |    4 +
+ 5 files changed, 180 insertions(+), 51 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 87ccf14..c7bb091 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2182,6 +2182,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -2194,6 +2195,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 36bb10a..e4cd407 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -584,6 +584,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(AIN3, 0,
+ 		"ain3", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
++	_AM33XX_MUXENTRY(AIN4, 0,
++		"ain4", NULL, NULL, NULL,
++		NULL, NULL, NULL, NULL),
++	_AM33XX_MUXENTRY(AIN5, 0,
++		"ain5", NULL, NULL, NULL,
++		NULL, NULL, NULL, NULL),
++	_AM33XX_MUXENTRY(AIN6, 0,
++		"ain6", NULL, NULL, NULL,
++		NULL, NULL, NULL, NULL),
++	_AM33XX_MUXENTRY(AIN7, 0,
++		"ain7", NULL, NULL, NULL,
++		NULL, NULL, NULL, NULL),
+ 	_AM33XX_MUXENTRY(VREFP, 0,
+ 		"vrefp", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+diff --git a/arch/arm/mach-omap2/mux33xx.h b/arch/arm/mach-omap2/mux33xx.h
+index 70a3012..348c8e5 100644
+--- a/arch/arm/mach-omap2/mux33xx.h
++++ b/arch/arm/mach-omap2/mux33xx.h
+@@ -228,6 +228,10 @@
+ #define AM33XX_CONTROL_PADCONF_DDR_DQSN1_OFFSET			0x0AFC
+ #define AM33XX_CONTROL_PADCONF_DDR_VREF_OFFSET			0x0B00
+ #define AM33XX_CONTROL_PADCONF_DDR_VTP_OFFSET			0x0B04
++#define AM33XX_CONTROL_PADCONF_AIN7_OFFSET			0x0B10
++#define AM33XX_CONTROL_PADCONF_AIN6_OFFSET			0x0B14
++#define AM33XX_CONTROL_PADCONF_AIN5_OFFSET			0x0B18
++#define AM33XX_CONTROL_PADCONF_AIN4_OFFSET			0x0B1C
+ #define AM33XX_CONTROL_PADCONF_AIN3_OFFSET			0x0B20
+ #define AM33XX_CONTROL_PADCONF_AIN2_OFFSET			0x0B24
+ #define AM33XX_CONTROL_PADCONF_AIN1_OFFSET			0x0B28
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index e3b5775..699503d 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -27,6 +27,8 @@
+ #include <linux/input/ti_tscadc.h>
+ #include <linux/delay.h>
+ 
++/* Memory mapped registers here have incorrect offsets!
++ * Correct after referring TRM */
+ #define TSCADC_REG_IRQEOI		0x020
+ #define TSCADC_REG_RAWIRQSTATUS		0x024
+ #define TSCADC_REG_IRQSTATUS		0x028
+@@ -54,12 +56,18 @@
+ 
+ /*	Register Bitfields	*/
+ #define TSCADC_IRQWKUP_ENB		BIT(0)
+-#define TSCADC_STPENB_STEPENB		0x7FFF
++#define TSCADC_STPENB_STEPENB_TOUCHSCREEN	0x7FFF
++#define TSCADC_STPENB_STEPENB_GENERAL		0x0400
+ #define TSCADC_IRQENB_FIFO0THRES	BIT(2)
++#define TSCADC_IRQENB_FIFO0OVERRUN	BIT(3)
+ #define TSCADC_IRQENB_FIFO1THRES	BIT(5)
++#define TSCADC_IRQENB_EOS		BIT(1)
+ #define TSCADC_IRQENB_PENUP		BIT(9)
+-#define TSCADC_STEPCONFIG_MODE_HWSYNC	0x2
++#define TSCADC_STEPCONFIG_MODE_HWSYNC		0x2
++#define TSCADC_STEPCONFIG_MODE_SWCONT		0x1
++#define TSCADC_STEPCONFIG_MODE_SWONESHOT	0x0
+ #define TSCADC_STEPCONFIG_2SAMPLES_AVG	(1 << 4)
++#define TSCADC_STEPCONFIG_NO_AVG	0
+ #define TSCADC_STEPCONFIG_XPP		BIT(5)
+ #define TSCADC_STEPCONFIG_XNN		BIT(6)
+ #define TSCADC_STEPCONFIG_YPP		BIT(7)
+@@ -105,6 +113,7 @@ struct tscadc {
+ 	int			analog_input;
+ 	int			x_plate_resistance;
+ 	struct clk		*tsc_ick;
++	int mode;
+ 	int			irq;
+ 	void __iomem		*tsc_base;
+ };
+@@ -120,6 +129,86 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+ 	writel(val, tsc->tsc_base + reg);
+ }
+ 
++static void tsc_adc_step_config(struct tscadc *ts_dev)
++{
++	unsigned int	stepconfig = 0, delay = 0, chargeconfig = 0;
++
++	/*
++ 	 * Step Configuration
++ 	 * software-enabled continous mode
++ 	 * 2 sample averaging
++ 	 * sample channel 1 (SEL_INP mux bits = 0)
++ 	 */
++	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
++		TSCADC_STEPCONFIG_2SAMPLES_AVG |
++		(0x7 << 19);
++
++	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
++
++	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG(10), stepconfig);
++	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY(10), delay);
++
++	/* Get the ball rolling, this will trigger the FSM to step through
++ 	 * as soon as TSC_ADC_SS is turned on */
++	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
++}
++
++static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
++{
++	struct tscadc		*ts_dev = (struct tscadc *)dev;
++	struct input_dev	*input_dev = ts_dev->input;
++	unsigned int		status, irqclr = 0;
++	int			i;
++	int			fsm = 0, fifo0count = 0, fifo1count = 0;
++	unsigned int		read_sample = 0, ready1 = 0;
++	unsigned int		prev_val_x = ~0, prev_val_y = ~0;
++	unsigned int		prev_diff_x = ~0, prev_diff_y = ~0;
++	unsigned int		cur_diff_x = 0, cur_diff_y = 0;
++	unsigned int		val_x = 0, val_y = 0, diffx = 0, diffy = 0;
++
++	status = tscadc_readl(ts_dev, TSCADC_REG_IRQSTATUS);
++
++	printk("interrupt! status=%x\n", status);
++	// if (status & TSCADC_IRQENB_EOS) {
++	// 	irqclr |= TSCADC_IRQENB_EOS;
++	// }
++
++	if (status & TSCADC_IRQENB_FIFO0THRES) {
++		fifo1count = tscadc_readl(ts_dev, TSCADC_REG_FIFO0CNT);
++		printk("fifo 0 count = %d\n", fifo1count);
++	
++		for (i = 0; i < fifo1count; i++) {
++			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
++			printk("sample: %d: %x\n", i, read_sample);
++		}
++		irqclr |= TSCADC_IRQENB_FIFO0THRES;
++	}
++
++
++	if (status & TSCADC_IRQENB_FIFO1THRES) {
++		fifo1count = tscadc_readl(ts_dev, TSCADC_REG_FIFO1CNT);
++
++		for (i = 0; i < fifo1count; i++) {
++			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO1);
++			// read_sample = read_sample & 0xfff;
++			printk("sample: %d: %d\n", i, read_sample);
++			panic("sample read from fifo1!");
++		}
++		irqclr |= TSCADC_IRQENB_FIFO1THRES;
++	}
++
++	mdelay(500);
++
++	tscadc_writel(ts_dev, TSCADC_REG_IRQSTATUS, irqclr);
++
++	/* check pending interrupts */
++	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
++
++	/* Turn on Step 1 again */
++	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
++	return IRQ_HANDLED;
++}
++
+ static void tsc_step_config(struct tscadc *ts_dev)
+ {
+ 	unsigned int	stepconfigx = 0, stepconfigy = 0;
+@@ -224,7 +313,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG14, stepconfigz2);
+ 	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY14, delay);
+ 
+-	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB);
++	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_TOUCHSCREEN);
+ }
+ 
+ static void tsc_idle_config(struct tscadc *ts_config)
+@@ -242,7 +331,7 @@ static void tsc_idle_config(struct tscadc *ts_config)
+ 	tscadc_writel(ts_config, TSCADC_REG_IDLECONFIG, idleconfig);
+ }
+ 
+-static irqreturn_t tscadc_interrupt(int irq, void *dev)
++static irqreturn_t tsc_interrupt(int irq, void *dev)
+ {
+ 	struct tscadc		*ts_dev = (struct tscadc *)dev;
+ 	struct input_dev	*input_dev = ts_dev->input;
+@@ -362,7 +451,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+ 	/* check pending interrupts */
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
+ 
+-	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB);
++	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_TOUCHSCREEN);
+ 	return IRQ_HANDLED;
+ }
+ 
+@@ -400,13 +489,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 		return -ENODEV;
+ 	}
+ 
+-	input_dev = input_allocate_device();
+-	if (!input_dev) {
+-		dev_err(&pdev->dev, "failed to allocate input device.\n");
+-		err = -ENOMEM;
+-		goto err_free_mem;
++	if(pdata->mode == TI_TSCADC_TSCMODE) {
++		input_dev = input_allocate_device();
++		if (!input_dev) {
++			dev_err(&pdev->dev, "failed to allocate input device.\n");
++			err = -ENOMEM;
++			goto err_free_mem;
++		}
++		ts_dev->input = input_dev;
+ 	}
+-	ts_dev->input = input_dev;
+ 
+ 	res =  request_mem_region(res->start, resource_size(res), pdev->name);
+ 	if (!res) {
+@@ -422,8 +513,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 		goto err_release_mem;
+ 	}
+ 
+-	err = request_irq(ts_dev->irq, tscadc_interrupt, IRQF_DISABLED,
+-				pdev->dev.driver->name, ts_dev);
++	if(pdata->mode == TI_TSCADC_TSCMODE) {
++		err = request_irq(ts_dev->irq, tsc_interrupt, IRQF_DISABLED,
++					pdev->dev.driver->name, ts_dev);
++	}
++	else {
++		err = request_irq(ts_dev->irq, tsc_adc_interrupt, IRQF_DISABLED,
++					pdev->dev.driver->name, ts_dev);
++	}
++
+ 	if (err) {
+ 		dev_err(&pdev->dev, "failed to allocate irq.\n");
+ 		goto err_unmap_regs;
+@@ -443,11 +541,17 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 		goto err_free_irq;
+ 	}
+ 	clock_rate = clk_get_rate(clk);
++
++	/* clk_value of atleast 21MHz required
++ 	 * Clock verified on BeagleBone to be 24MHz */
++
++
+ 	clk_value = clock_rate / ADC_CLK;
+ 	if (clk_value < 7) {
+ 		dev_err(&pdev->dev, "clock input less than min clock requirement\n");
+ 		goto err_fail;
+ 	}
++
+ 	/* TSCADC_CLKDIV needs to be configured to the value minus 1 */
+ 	clk_value = clk_value - 1;
+ 	tscadc_writel(ts_dev, TSCADC_REG_CLKDIV, clk_value);
+@@ -458,57 +562,60 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 	ts_dev->wires = pdata->wires;
+ 	ts_dev->analog_input = pdata->analog_input;
+ 	ts_dev->x_plate_resistance = pdata->x_plate_resistance;
++	ts_dev->mode = pdata->mode;
+ 
+-	/* Set the control register bits */
++	/* Set the control register bits - 12.5.44 TRM */
+ 	ctrl = TSCADC_CNTRLREG_STEPCONFIGWRT |
+-			TSCADC_CNTRLREG_TSCENB |
+-			TSCADC_CNTRLREG_STEPID;
+-	switch (ts_dev->wires) {
+-	case 4:
+-		ctrl |= TSCADC_CNTRLREG_4WIRE;
+-		break;
+-	case 5:
+-		ctrl |= TSCADC_CNTRLREG_5WIRE;
+-		break;
+-	case 8:
+-		ctrl |= TSCADC_CNTRLREG_8WIRE;
+-		break;
++				TSCADC_CNTRLREG_STEPID;
++	if(pdata->mode == TI_TSCADC_TSCMODE) {
++		ctrl |= TSCADC_CNTRLREG_TSCENB;
++		switch (ts_dev->wires) {
++			case 4:
++				ctrl |= TSCADC_CNTRLREG_4WIRE;
++				break;
++			case 5:
++				ctrl |= TSCADC_CNTRLREG_5WIRE;
++				break;
++			case 8:
++				ctrl |= TSCADC_CNTRLREG_8WIRE;
++				break;
++		}
+ 	}
+ 	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);
+ 
+-	/* Set register bits for Idel Config Mode */
+-	tsc_idle_config(ts_dev);
+-
+-	/* IRQ Enable */
+-	irqenable = TSCADC_IRQENB_FIFO1THRES;
++	/* Touch screen / ADC configuration */
++	if(pdata->mode == TI_TSCADC_TSCMODE) {
++		tsc_idle_config(ts_dev);
++		tsc_step_config(ts_dev);
++		tscadc_writel(ts_dev, TSCADC_REG_FIFO1THR, 6);
++		irqenable = TSCADC_IRQENB_FIFO1THRES;
++		/* Touch screen also needs an input_dev */
++		input_dev->name = "ti-tsc-adcc";
++		input_dev->dev.parent = &pdev->dev;
++		input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
++		input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
++		input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, 0, 0);
++		input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
++		/* register to the input system */
++		err = input_register_device(input_dev);
++		if (err)
++			goto err_fail;
++	}
++	else {
++		tsc_adc_step_config(ts_dev);
++		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
++		irqenable = TSCADC_IRQENB_FIFO0THRES;
++	}
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
+ 
+-	tsc_step_config(ts_dev);
+-
+-	tscadc_writel(ts_dev, TSCADC_REG_FIFO1THR, 6);
+-
+ 	ctrl |= TSCADC_CNTRLREG_TSCSSENB;
+-	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);
+-
+-	input_dev->name = "ti-tsc-adcc";
+-	input_dev->dev.parent = &pdev->dev;
+-
+-	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
+-	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+-
+-	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, 0, 0);
+-	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
+-	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT, 0, 0);
+-
+-	/* register to the input system */
+-	err = input_register_device(input_dev);
+-	if (err)
+-		goto err_fail;
++	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);	/* Turn on TSC_ADC */
+ 
+ 	platform_set_drvdata(pdev, ts_dev);
+ 	return 0;
+ 
+ err_fail:
++	printk(KERN_ERR "Fatal error, shutting down TSC_ADC\n");
+ 	clk_disable(ts_dev->tsc_ick);
+ 	clk_put(ts_dev->tsc_ick);
+ err_free_irq:
+diff --git a/include/linux/input/ti_tscadc.h b/include/linux/input/ti_tscadc.h
+index 2c547bb..850cd4b 100644
+--- a/include/linux/input/ti_tscadc.h
++++ b/include/linux/input/ti_tscadc.h
+@@ -14,8 +14,12 @@
+  * @x_plate_resistance:	X plate resistance.
+  */
+ 
++#define TI_TSCADC_TSCMODE 0
++#define TI_TSCADC_GENMODE 1
++
+ struct tsc_data {
+ 	int wires;
+ 	int analog_input;
+ 	int x_plate_resistance;
++	int mode;
+ };
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
new file mode 100644
index 0000000..bae95a9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -0,0 +1,44 @@
+From f7330897eabdf0275cd51213fe1dc778e165d07c Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 30 Nov 2011 15:02:17 +0100
+Subject: [PATCH 09/16] tscadc: Add board file mfd support, fix warning
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+
+Conflicts:
+
+	arch/arm/mach-omap2/board-am335xevm.c
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ drivers/input/touchscreen/ti_tscadc.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index c7bb091..17705b3 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2182,7 +2182,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 699503d..f813564 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -462,7 +462,7 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ {
+ 	struct tscadc			*ts_dev;
+-	struct input_dev		*input_dev;
++	struct input_dev		*input_dev = NULL;
+ 	int				err;
+ 	int				clk_value;
+ 	int				clock_rate, irqenable, ctrl;
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
new file mode 100644
index 0000000..c78cb81
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -0,0 +1,26 @@
+From f02d01f3f7bafede91847480a72b50d8a8d45a6a Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 30 Nov 2011 15:03:59 +0100
+Subject: [PATCH 10/16] AM335X: init tsc bone style for new boards
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 17705b3..ac4f78f 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2195,7 +2195,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
new file mode 100644
index 0000000..64f5e37
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
@@ -0,0 +1,46 @@
+From 0524d48ca4e3178d89d940b38f1fa26cf448ebb8 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 18:18:04 -0600
+Subject: [PATCH 11/16] tscadc: make stepconfig channel-configurable
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index f813564..0b91bdc 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -129,7 +129,9 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+ 	writel(val, tsc->tsc_base + reg);
+ }
+ 
+-static void tsc_adc_step_config(struct tscadc *ts_dev)
++/* Configure ADC to sample on channel (1-8) */
++
++static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+ {
+ 	unsigned int	stepconfig = 0, delay = 0, chargeconfig = 0;
+ 
+@@ -141,7 +143,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev)
+  	 */
+ 	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
+ 		TSCADC_STEPCONFIG_2SAMPLES_AVG |
+-		(0x7 << 19);
++		((channel-1) << 19);
+ 
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+ 
+@@ -602,7 +604,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 			goto err_fail;
+ 	}
+ 	else {
+-		tsc_adc_step_config(ts_dev);
++		tsc_adc_step_config(ts_dev, 8);
+ 		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
+ 		irqenable = TSCADC_IRQENB_FIFO0THRES;
+ 	}
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
new file mode 100644
index 0000000..8375cf8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
@@ -0,0 +1,147 @@
+From 5b0c06b556db15cac8d14eb7e74307521481e185 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 20:55:25 -0600
+Subject: [PATCH 12/16] tscadc: Trigger through sysfs
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+
+Conflicts:
+
+	drivers/input/touchscreen/ti_tscadc.c
+---
+ drivers/input/touchscreen/ti_tscadc.c |   60 ++++++++++++++++++++++++++++++---
+ include/linux/input/ti_tscadc.h       |    1 +
+ 2 files changed, 56 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 0b91bdc..a74d9ba 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -26,6 +26,17 @@
+ #include <linux/io.h>
+ #include <linux/input/ti_tscadc.h>
+ #include <linux/delay.h>
++#include <linux/device.h>
++
++size_t do_adc_sample(struct kobject *, struct attribute *, char *);
++static DEVICE_ATTR(ain1, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain2, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain3, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain4, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain5, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain6, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain7, S_IRUGO, do_adc_sample, NULL);
++static DEVICE_ATTR(ain8, S_IRUGO, do_adc_sample, NULL);
+ 
+ /* Memory mapped registers here have incorrect offsets!
+  * Correct after referring TRM */
+@@ -144,12 +155,12 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+ 	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
+ 		TSCADC_STEPCONFIG_2SAMPLES_AVG |
+ 		((channel-1) << 19);
+-
++	
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+ 
+ 	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG(10), stepconfig);
+ 	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY(10), delay);
+-
++	
+ 	/* Get the ball rolling, this will trigger the FSM to step through
+  	 * as soon as TSC_ADC_SS is turned on */
+ 	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
+@@ -199,7 +210,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+ 		irqclr |= TSCADC_IRQENB_FIFO1THRES;
+ 	}
+ 
+-	mdelay(500);
++	// mdelay(500);
+ 
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQSTATUS, irqclr);
+ 
+@@ -207,7 +218,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
+ 
+ 	/* Turn on Step 1 again */
+-	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
++	// tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
+ 	return IRQ_HANDLED;
+ }
+ 
+@@ -461,6 +472,34 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+ * The functions for inserting/removing driver as a module.
+ */
+ 
++size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
++	struct platform_device *pdev;
++	struct device *dev;
++	struct tscadc *ts_dev;
++	int channel_num;
++
++	pdev = (struct platform_device *)container_of(kobj, struct device, kobj);
++	dev = &pdev->dev;
++
++	ts_dev = dev_get_drvdata(dev);
++
++	if(strncmp(attr->name, "ain", 3)) {
++		printk("Invalid ain num\n");
++		return -EINVAL;
++	}
++
++	channel_num = attr->name[3] - 0x30;
++	if(channel_num > 8 || channel_num < 1) {
++		printk("Invalid channel_num=%d\n", channel_num);
++		return -EINVAL;
++	}
++
++	tsc_adc_step_config(ts_dev, channel_num);
++
++	memcpy(buf, attr->name, strlen(attr->name)+1);
++	return strlen(attr->name);
++}
++
+ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ {
+ 	struct tscadc			*ts_dev;
+@@ -472,6 +511,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 	struct resource			*res;
+ 	struct clk			*clk;
+ 
++	printk("dev addr = %p\n", &pdev->dev);
++	printk("pdev addr = %p\n", pdev);
++
++	device_create_file(&pdev->dev, &dev_attr_ain1);
++	device_create_file(&pdev->dev, &dev_attr_ain2);
++	device_create_file(&pdev->dev, &dev_attr_ain3);
++	device_create_file(&pdev->dev, &dev_attr_ain4);
++	device_create_file(&pdev->dev, &dev_attr_ain5);
++	device_create_file(&pdev->dev, &dev_attr_ain6);
++	device_create_file(&pdev->dev, &dev_attr_ain7);
++	device_create_file(&pdev->dev, &dev_attr_ain8);
++
+ 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	if (!res) {
+ 		dev_err(&pdev->dev, "no memory resource defined.\n");
+@@ -604,7 +655,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 			goto err_fail;
+ 	}
+ 	else {
+-		tsc_adc_step_config(ts_dev, 8);
+ 		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
+ 		irqenable = TSCADC_IRQENB_FIFO0THRES;
+ 	}
+diff --git a/include/linux/input/ti_tscadc.h b/include/linux/input/ti_tscadc.h
+index 850cd4b..fc239c6 100644
+--- a/include/linux/input/ti_tscadc.h
++++ b/include/linux/input/ti_tscadc.h
+@@ -13,6 +13,7 @@
+  *			0.
+  * @x_plate_resistance:	X plate resistance.
+  */
++#include <linux/device.h>
+ 
+ #define TI_TSCADC_TSCMODE 0
+ #define TI_TSCADC_GENMODE 1
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
new file mode 100644
index 0000000..7c06c09
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -0,0 +1,34 @@
+From edb40d9ed626b634bfe71c39a02602e2ae871175 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 20:56:48 -0600
+Subject: [PATCH 13/16] meta-ti: Remove debug messages for meta-ti
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index a74d9ba..1f9cbf5 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -181,14 +181,14 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+ 
+ 	status = tscadc_readl(ts_dev, TSCADC_REG_IRQSTATUS);
+ 
+-	printk("interrupt! status=%x\n", status);
++	// printk("interrupt! status=%x\n", status);
+ 	// if (status & TSCADC_IRQENB_EOS) {
+ 	// 	irqclr |= TSCADC_IRQENB_EOS;
+ 	// }
+ 
+ 	if (status & TSCADC_IRQENB_FIFO0THRES) {
+ 		fifo1count = tscadc_readl(ts_dev, TSCADC_REG_FIFO0CNT);
+-		printk("fifo 0 count = %d\n", fifo1count);
++		// printk("fifo 0 count = %d\n", fifo1count);
+ 	
+ 		for (i = 0; i < fifo1count; i++) {
+ 			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
new file mode 100644
index 0000000..0df5346
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -0,0 +1,54 @@
+From f36d060e6965cdbf797308fb2d80a77c4bbaeac3 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Tue, 29 Nov 2011 09:44:22 -0600
+Subject: [PATCH 14/16] tscadc: switch to polling instead of interrupts
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |   16 ++++++++++++++--
+ 1 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 1f9cbf5..8e2a994 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -477,6 +477,8 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+ 	struct device *dev;
+ 	struct tscadc *ts_dev;
+ 	int channel_num;
++	int fifo0count = 0;
++	int read_sample = 0;
+ 
+ 	pdev = (struct platform_device *)container_of(kobj, struct device, kobj);
+ 	dev = &pdev->dev;
+@@ -496,7 +498,17 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+ 
+ 	tsc_adc_step_config(ts_dev, channel_num);
+ 
+-	memcpy(buf, attr->name, strlen(attr->name)+1);
++	do {
++		fifo0count = tscadc_readl(ts_dev, TSCADC_REG_FIFO0CNT);
++	}
++	while (!fifo0count);
++
++	while (fifo0count--) {
++			  read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0) & 0xfff;
++			  // printk("polling sample: %d: %x\n", fifo0count, read_sample);
++	}
++	sprintf(buf, "%d", read_sample);
++
+ 	return strlen(attr->name);
+ }
+ 
+@@ -656,7 +668,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 	}
+ 	else {
+ 		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
+-		irqenable = TSCADC_IRQENB_FIFO0THRES;
++		irqenable = 0; // TSCADC_IRQENB_FIFO0THRES;
+ 	}
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
+ 
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
new file mode 100644
index 0000000..2757844
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
@@ -0,0 +1,47 @@
+From 9289020d4d0f1dc6a973feca4b6465ee1dbcb1b7 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 14:50:55 +0100
+Subject: [PATCH 15/16] beaglebone: fix ADC init
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    6 ++----
+ 1 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index ac4f78f..177ab9e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -248,11 +248,11 @@ static struct resource tsc_resources[]  = {
+ static struct tsc_data am335x_touchscreen_data  = {
+ 	.wires  = 4,
+ 	.x_plate_resistance = 200,
+-//	.mode = TI_TSCADC_TSCMODE,
++	.mode = TI_TSCADC_TSCMODE,
+ };
+ 
+ static struct tsc_data bone_touchscreen_data  = {
+-//	.mode = TI_TSCADC_GENMODE,
++	.mode = TI_TSCADC_GENMODE,
+ };
+ 
+ static struct platform_device tsc_device = {
+@@ -2182,7 +2182,6 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -2195,7 +2194,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/configs/empty
new file mode 100644
index 0000000..e69de29
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
new file mode 100644
index 0000000..fc8d313
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -0,0 +1,3566 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/arm 3.2.0 Kernel Configuration
+#
+CONFIG_ARM=y
+CONFIG_HAVE_PWM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_HAVE_SCHED_CLOCK=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_USES_GETTIMEOFFSET is not set
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_KTIME_SCALAR=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_ARM_PATCH_PHYS_VIRT=y
+CONFIG_GENERIC_BUG=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+CONFIG_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+# CONFIG_KERNEL_GZIP is not set
+# CONFIG_KERNEL_LZMA is not set
+CONFIG_KERNEL_LZO=y
+CONFIG_DEFAULT_HOSTNAME="BeagleBone"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_FHANDLE=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_GENERIC_IRQ_CHIP=y
+CONFIG_IRQ_DOMAIN=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_CGROUPS=y
+# CONFIG_CGROUP_DEBUG is not set
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_PROC_PID_CPUSET=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_CGROUP_MEM_RES_CTLR=y
+CONFIG_CGROUP_MEM_RES_CTLR_SWAP=y
+CONFIG_CGROUP_MEM_RES_CTLR_SWAP_ENABLED=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_BLK_CGROUP=y
+# CONFIG_DEBUG_BLK_CGROUP is not set
+CONFIG_NAMESPACES=y
+CONFIG_UTS_NS=y
+CONFIG_IPC_NS=y
+CONFIG_USER_NS=y
+CONFIG_PID_NS=y
+CONFIG_NET_NS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_MM_OWNER=y
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_RD_XZ=y
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EXPERT=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_PERF_EVENTS=y
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_CLK=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+CONFIG_BLK_DEV_INTEGRITY=y
+CONFIG_BLK_DEV_THROTTLING=y
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+CONFIG_CFQ_GROUP_IOSCHED=y
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_HIGHBANK is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_PRIMA2 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_MXS is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LPC32XX is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_TEGRA is not set
+# CONFIG_ARCH_PICOXCELL is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P64X0 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_EXYNOS is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_TCC_926 is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+CONFIG_ARCH_OMAP=y
+# CONFIG_PLAT_SPEAR is not set
+# CONFIG_ARCH_VT8500 is not set
+# CONFIG_ARCH_ZYNQ is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+
+#
+# TI OMAP Common Features
+#
+# CONFIG_ARCH_OMAP1 is not set
+CONFIG_ARCH_OMAP2PLUS=y
+
+#
+# OMAP Feature Selections
+#
+# CONFIG_OMAP_SMARTREFLEX is not set
+# CONFIG_OMAP_RESET_CLOCKS is not set
+CONFIG_OMAP_MUX=y
+CONFIG_OMAP_MUX_DEBUG=y
+CONFIG_OMAP_MUX_WARNINGS=y
+CONFIG_OMAP_MCBSP=y
+CONFIG_OMAP_MBOX_FWK=y
+CONFIG_OMAP_MBOX_KFIFO_SIZE=256
+# CONFIG_OMAP_32K_TIMER is not set
+# CONFIG_OMAP3_L2_AUX_SECURE_SAVE_RESTORE is not set
+CONFIG_OMAP_DM_TIMER=y
+CONFIG_OMAP_PM_NOOP=y
+CONFIG_MACH_OMAP_GENERIC=y
+
+#
+# TI OMAP2/3/4 Specific Features
+#
+CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
+# CONFIG_ARCH_OMAP2 is not set
+CONFIG_ARCH_OMAP3=y
+# CONFIG_ARCH_OMAP4 is not set
+# CONFIG_SOC_OMAP3430 is not set
+CONFIG_SOC_OMAPTI81XX=y
+CONFIG_SOC_OMAPAM33XX=y
+CONFIG_OMAP_PACKAGE_CBB=y
+
+#
+# OMAP Board Type
+#
+CONFIG_MACH_OMAP3_BEAGLE=y
+# CONFIG_MACH_DEVKIT8000 is not set
+# CONFIG_MACH_OMAP_LDP is not set
+# CONFIG_MACH_OMAP3530_LV_SOM is not set
+# CONFIG_MACH_OMAP3_TORPEDO is not set
+# CONFIG_MACH_ENCORE is not set
+# CONFIG_MACH_OVERO is not set
+# CONFIG_MACH_OMAP3EVM is not set
+# CONFIG_MACH_OMAP3517EVM is not set
+# CONFIG_MACH_CRANEBOARD is not set
+# CONFIG_MACH_OMAP3_PANDORA is not set
+# CONFIG_MACH_OMAP3_TOUCHBOOK is not set
+# CONFIG_MACH_OMAP_3430SDP is not set
+# CONFIG_MACH_NOKIA_RM680 is not set
+# CONFIG_MACH_NOKIA_RX51 is not set
+# CONFIG_MACH_OMAP_ZOOM2 is not set
+# CONFIG_MACH_OMAP_ZOOM3 is not set
+# CONFIG_MACH_CM_T35 is not set
+# CONFIG_MACH_CM_T3517 is not set
+CONFIG_MACH_IGEP0020=y
+# CONFIG_MACH_IGEP0030 is not set
+# CONFIG_MACH_SBC3530 is not set
+# CONFIG_MACH_OMAP_3630SDP is not set
+CONFIG_MACH_TI8168EVM=y
+CONFIG_MACH_TI8148EVM=y
+CONFIG_MACH_AM335XEVM=y
+CONFIG_MACH_AM335XIAEVM=y
+# CONFIG_OMAP3_EMU is not set
+# CONFIG_OMAP3_SDRC_AC_TIMING is not set
+CONFIG_OMAP3_EDMA=y
+
+#
+# System MMU
+#
+
+#
+# Processor Type
+#
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_V7=y
+CONFIG_CPU_CACHE_V7=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V7=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_SWP_EMULATE is not set
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_ARM_L1_CACHE_SHIFT_6=y
+CONFIG_ARM_L1_CACHE_SHIFT=6
+CONFIG_ARM_DMA_MEM_BUFFERABLE=y
+CONFIG_MULTI_IRQ_HANDLER=y
+CONFIG_ARM_ERRATA_430973=y
+# CONFIG_ARM_ERRATA_458693 is not set
+# CONFIG_ARM_ERRATA_460075 is not set
+# CONFIG_ARM_ERRATA_720789 is not set
+# CONFIG_ARM_ERRATA_743622 is not set
+# CONFIG_ARM_ERRATA_751472 is not set
+# CONFIG_ARM_ERRATA_754322 is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_THUMB2_KERNEL=y
+CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y
+CONFIG_ARM_ASM_UNIFIED=y
+CONFIG_AEABI=y
+CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_HAVE_ARCH_PFN_VALID=y
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_COMPACTION is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_DEPRECATED_PARAM_STRUCT is not set
+
+#
+# Boot options
+#
+CONFIG_USE_OF=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+# CONFIG_ARM_APPENDED_DTB is not set
+CONFIG_CMDLINE=" debug "
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+# CONFIG_CMDLINE_EXTEND is not set
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+# CONFIG_CRASH_DUMP is not set
+CONFIG_AUTO_ZRELADDR=y
+
+#
+# CPU Power Management
+#
+
+#
+# CPU Frequency scaling
+#
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_STAT_DETAILS=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+
+#
+# ARM CPU frequency scaling drivers
+#
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+# CONFIG_SUSPEND is not set
+CONFIG_PM_RUNTIME=y
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+# CONFIG_PM_ADVANCED_DEBUG is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_HAS_OPP=y
+CONFIG_PM_OPP=y
+CONFIG_PM_CLK=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_ARM_CPU_SUSPEND=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=y
+CONFIG_XFRM_SUB_POLICY=y
+CONFIG_XFRM_MIGRATE=y
+CONFIG_XFRM_STATISTICS=y
+CONFIG_XFRM_IPCOMP=m
+CONFIG_NET_KEY=y
+CONFIG_NET_KEY_MIGRATE=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NET_IPIP=m
+CONFIG_NET_IPGRE_DEMUX=m
+CONFIG_NET_IPGRE=m
+# CONFIG_NET_IPGRE_BROADCAST is not set
+CONFIG_IP_MROUTE=y
+# CONFIG_IP_PIMSM_V1 is not set
+# CONFIG_IP_PIMSM_V2 is not set
+CONFIG_ARPD=y
+CONFIG_SYN_COOKIES=y
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_XFRM_TUNNEL=m
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+CONFIG_INET_LRO=m
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+CONFIG_TCP_CONG_ADVANCED=y
+CONFIG_TCP_CONG_BIC=m
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_TCP_CONG_WESTWOOD=m
+CONFIG_TCP_CONG_HTCP=m
+CONFIG_TCP_CONG_HSTCP=m
+CONFIG_TCP_CONG_HYBLA=m
+CONFIG_TCP_CONG_VEGAS=m
+CONFIG_TCP_CONG_SCALABLE=m
+CONFIG_TCP_CONG_LP=m
+CONFIG_TCP_CONG_VENO=m
+CONFIG_TCP_CONG_YEAH=m
+CONFIG_TCP_CONG_ILLINOIS=m
+CONFIG_DEFAULT_CUBIC=y
+# CONFIG_DEFAULT_RENO is not set
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+CONFIG_IPV6_PRIVACY=y
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
+CONFIG_IPV6_SIT=m
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
+CONFIG_IPV6_PIMSM_V2=y
+# CONFIG_NETLABEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+CONFIG_BRIDGE_NETFILTER=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+# CONFIG_NF_CONNTRACK is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_LED is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HL is not set
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV4 is not set
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+# CONFIG_IP_NF_MATCH_AH is not set
+# CONFIG_IP_NF_MATCH_ECN is not set
+# CONFIG_IP_NF_MATCH_TTL is not set
+# CONFIG_IP_NF_FILTER is not set
+# CONFIG_IP_NF_TARGET_LOG is not set
+# CONFIG_IP_NF_TARGET_ULOG is not set
+# CONFIG_IP_NF_MANGLE is not set
+# CONFIG_IP_NF_RAW is not set
+# CONFIG_IP_NF_SECURITY is not set
+CONFIG_IP_NF_ARPTABLES=m
+# CONFIG_IP_NF_ARPFILTER is not set
+# CONFIG_IP_NF_ARP_MANGLE is not set
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_BRIDGE_NF_EBTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+CONFIG_STP=m
+CONFIG_GARP=m
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_IGMP_SNOOPING=y
+# CONFIG_NET_DSA is not set
+CONFIG_VLAN_8021Q=m
+CONFIG_VLAN_8021Q_GVRP=y
+# CONFIG_DECNET is not set
+CONFIG_LLC=m
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+CONFIG_NET_SCHED=y
+
+#
+# Queueing/Scheduling
+#
+CONFIG_NET_SCH_CBQ=m
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_MULTIQ=m
+CONFIG_NET_SCH_RED=m
+# CONFIG_NET_SCH_SFB is not set
+# CONFIG_NET_SCH_SFQ is not set
+# CONFIG_NET_SCH_TEQL is not set
+# CONFIG_NET_SCH_TBF is not set
+# CONFIG_NET_SCH_GRED is not set
+# CONFIG_NET_SCH_DSMARK is not set
+# CONFIG_NET_SCH_NETEM is not set
+# CONFIG_NET_SCH_DRR is not set
+# CONFIG_NET_SCH_MQPRIO is not set
+# CONFIG_NET_SCH_CHOKE is not set
+# CONFIG_NET_SCH_QFQ is not set
+
+#
+# Classification
+#
+# CONFIG_NET_CLS_BASIC is not set
+# CONFIG_NET_CLS_TCINDEX is not set
+# CONFIG_NET_CLS_ROUTE4 is not set
+# CONFIG_NET_CLS_FW is not set
+# CONFIG_NET_CLS_U32 is not set
+# CONFIG_NET_CLS_RSVP is not set
+# CONFIG_NET_CLS_RSVP6 is not set
+# CONFIG_NET_CLS_FLOW is not set
+# CONFIG_NET_CLS_CGROUP is not set
+# CONFIG_NET_EMATCH is not set
+# CONFIG_NET_CLS_ACT is not set
+CONFIG_NET_SCH_FIFO=y
+# CONFIG_DCB is not set
+CONFIG_DNS_RESOLVER=y
+# CONFIG_BATMAN_ADV is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+CONFIG_CAN=m
+CONFIG_CAN_RAW=m
+CONFIG_CAN_BCM=m
+CONFIG_CAN_GW=m
+
+#
+# CAN Device Drivers
+#
+CONFIG_CAN_VCAN=m
+CONFIG_CAN_SLCAN=m
+CONFIG_CAN_DEV=m
+CONFIG_CAN_CALC_BITTIMING=y
+CONFIG_CAN_TI_HECC=m
+# CONFIG_CAN_MCP251X is not set
+# CONFIG_CAN_SJA1000 is not set
+# CONFIG_CAN_C_CAN is not set
+CONFIG_CAN_D_CAN=m
+CONFIG_CAN_D_CAN_PLATFORM=m
+
+#
+# CAN USB interfaces
+#
+CONFIG_CAN_EMS_USB=m
+CONFIG_CAN_ESD_USB2=m
+# CONFIG_CAN_SOFTING is not set
+# CONFIG_CAN_DEBUG_DEVICES is not set
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+# CONFIG_IRDA_CACHE_LAST_LSAP is not set
+# CONFIG_IRDA_FAST_RR is not set
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+CONFIG_IRTTY_SIR=m
+
+#
+# Dongle support
+#
+# CONFIG_DONGLE is not set
+CONFIG_KINGSUN_DONGLE=m
+CONFIG_KSDAZZLE_DONGLE=m
+CONFIG_KS959_DONGLE=m
+
+#
+# FIR device drivers
+#
+CONFIG_USB_IRDA=m
+CONFIG_SIGMATEL_FIR=m
+CONFIG_MCS_FIR=m
+CONFIG_BT=m
+CONFIG_BT_L2CAP=y
+CONFIG_BT_SCO=y
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_BNEP_MC_FILTER=y
+CONFIG_BT_BNEP_PROTO_FILTER=y
+CONFIG_BT_HIDP=m
+
+#
+# Bluetooth device drivers
+#
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIBTSDIO=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIBCM203X=m
+CONFIG_BT_HCIBPA10X=m
+CONFIG_BT_HCIBFUSB=m
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_BT_MRVL is not set
+# CONFIG_BT_ATH3K is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_FIB_RULES=y
+CONFIG_WIRELESS=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_WEXT_SPY=y
+CONFIG_WEXT_PRIV=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_CFG80211_DEFAULT_PS=y
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+# CONFIG_LIB80211_DEBUG is not set
+CONFIG_MAC80211=m
+CONFIG_MAC80211_HAS_RC=y
+CONFIG_MAC80211_RC_PID=y
+CONFIG_MAC80211_RC_MINSTREL=y
+CONFIG_MAC80211_RC_MINSTREL_HT=y
+CONFIG_MAC80211_RC_DEFAULT_PID=y
+# CONFIG_MAC80211_RC_DEFAULT_MINSTREL is not set
+CONFIG_MAC80211_RC_DEFAULT="pid"
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+CONFIG_WIMAX=m
+CONFIG_WIMAX_DEBUG_LEVEL=8
+CONFIG_RFKILL=m
+CONFIG_RFKILL_LEDS=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_REGULATOR=m
+CONFIG_RFKILL_GPIO=m
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+CONFIG_CEPH_LIB=m
+# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
+CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
+CONFIG_NFC=m
+CONFIG_NFC_NCI=m
+
+#
+# Near Field Communication (NFC) devices
+#
+CONFIG_PN544_NFC=m
+CONFIG_NFC_PN533=m
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=y
+CONFIG_REGMAP_SPI=y
+
+#
+# CBUS support
+#
+# CONFIG_CBUS is not set
+CONFIG_CONNECTOR=y
+CONFIG_PROC_EVENTS=y
+# CONFIG_MTD is not set
+CONFIG_DTC=y
+CONFIG_OF=y
+
+#
+# Device Tree and Open Firmware support
+#
+CONFIG_PROC_DEVICETREE=y
+CONFIG_OF_FLATTREE=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_OF_ADDRESS=y
+CONFIG_OF_IRQ=y
+CONFIG_OF_DEVICE=y
+CONFIG_OF_GPIO=y
+CONFIG_OF_I2C=y
+CONFIG_OF_NET=y
+CONFIG_OF_SPI=y
+CONFIG_OF_MDIO=y
+CONFIG_PARPORT=m
+# CONFIG_PARPORT_PC is not set
+# CONFIG_PARPORT_GSC is not set
+# CONFIG_PARPORT_AX88796 is not set
+CONFIG_PARPORT_1284=y
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+CONFIG_BLK_DEV_CRYPTOLOOP=m
+# CONFIG_BLK_DEV_DRBD is not set
+CONFIG_BLK_DEV_NBD=m
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=2
+CONFIG_BLK_DEV_RAM_SIZE=65536
+# CONFIG_BLK_DEV_XIP is not set
+CONFIG_CDROM_PKTCDVD=m
+CONFIG_CDROM_PKTCDVD_BUFFERS=8
+CONFIG_CDROM_PKTCDVD_WCACHE=y
+CONFIG_ATA_OVER_ETH=m
+# CONFIG_MG_DISK is not set
+# CONFIG_VIRTIO_BLK is not set
+# CONFIG_BLK_DEV_RBD is not set
+# CONFIG_SENSORS_LIS3LV02D is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_ATMEL_PWM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_APDS9802ALS is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_ISL29020 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_BH1780 is not set
+# CONFIG_SENSORS_BH1770 is not set
+# CONFIG_SENSORS_APDS990X is not set
+# CONFIG_HMC6352 is not set
+# CONFIG_DS1682 is not set
+# CONFIG_TI_DAC7512 is not set
+CONFIG_BMP085=m
+# CONFIG_USB_SWITCH_FSA9480 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_AT24=y
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
+CONFIG_EEPROM_93CX6=m
+# CONFIG_EEPROM_93XX46 is not set
+# CONFIG_IWMC3200TOP is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LIS3_I2C is not set
+
+#
+# Altera FPGA firmware download module
+#
+# CONFIG_ALTERA_STAPL is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+CONFIG_BLK_DEV_SR=y
+CONFIG_BLK_DEV_SR_VENDOR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_CHR_DEV_SCH=y
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_ISCSI_BOOT_SYSFS is not set
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_MD_LINEAR=m
+CONFIG_MD_RAID0=m
+CONFIG_MD_RAID1=m
+CONFIG_MD_RAID10=m
+CONFIG_MD_RAID456=m
+CONFIG_MD_MULTIPATH=m
+CONFIG_MD_FAULTY=m
+CONFIG_BLK_DEV_DM=m
+# CONFIG_DM_DEBUG is not set
+CONFIG_DM_CRYPT=m
+CONFIG_DM_SNAPSHOT=m
+# CONFIG_DM_THIN_PROVISIONING is not set
+CONFIG_DM_MIRROR=m
+CONFIG_DM_RAID=m
+CONFIG_DM_LOG_USERSPACE=m
+CONFIG_DM_ZERO=m
+CONFIG_DM_MULTIPATH=m
+CONFIG_DM_MULTIPATH_QL=m
+CONFIG_DM_MULTIPATH_ST=m
+# CONFIG_DM_DELAY is not set
+CONFIG_DM_UEVENT=y
+CONFIG_DM_FLAKEY=m
+# CONFIG_TARGET_CORE is not set
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+CONFIG_BONDING=m
+CONFIG_DUMMY=m
+CONFIG_EQUALIZER=m
+CONFIG_MII=y
+CONFIG_MACVLAN=m
+CONFIG_MACVTAP=m
+CONFIG_NETCONSOLE=m
+CONFIG_NETPOLL=y
+# CONFIG_NETPOLL_TRAP is not set
+CONFIG_NET_POLL_CONTROLLER=y
+CONFIG_TUN=m
+# CONFIG_VETH is not set
+# CONFIG_VIRTIO_NET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+CONFIG_NET_VENDOR_BROADCOM=y
+# CONFIG_B44 is not set
+CONFIG_NET_VENDOR_CHELSIO=y
+# CONFIG_DM9000 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_VENDOR_DLINK=y
+# CONFIG_DE600 is not set
+# CONFIG_DE620 is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+CONFIG_NET_VENDOR_NATSEMI=y
+CONFIG_NET_VENDOR_8390=y
+# CONFIG_AX88796 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+CONFIG_NET_VENDOR_SMSC=y
+CONFIG_SMC91X=y
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_SMSC911X_ARCH_HOOKS is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+CONFIG_NET_VENDOR_TI=y
+# CONFIG_TI_DAVINCI_EMAC is not set
+CONFIG_TI_DAVINCI_MDIO=y
+CONFIG_TI_DAVINCI_CPDMA=y
+CONFIG_TI_CPSW=y
+# CONFIG_TLK110_WORKAROUND is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+CONFIG_SMSC_PHY=y
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+# CONFIG_PLIP is not set
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_FILTER=y
+CONFIG_PPP_MPPE=m
+CONFIG_PPP_MULTILINK=y
+CONFIG_PPPOE=m
+CONFIG_PPTP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_SYNC_TTY=m
+CONFIG_SLIP=m
+CONFIG_SLHC=m
+# CONFIG_SLIP_COMPRESSED is not set
+CONFIG_SLIP_SMART=y
+# CONFIG_SLIP_MODE_SLIP6 is not set
+
+#
+# USB Network Adapters
+#
+CONFIG_USB_CATC=y
+CONFIG_USB_KAWETH=y
+CONFIG_USB_PEGASUS=y
+CONFIG_USB_RTL8150=y
+CONFIG_USB_USBNET=y
+CONFIG_USB_NET_AX8817X=y
+CONFIG_USB_NET_CDCETHER=y
+# CONFIG_USB_NET_CDC_EEM is not set
+CONFIG_USB_NET_CDC_NCM=y
+CONFIG_USB_NET_DM9601=y
+CONFIG_USB_NET_SMSC75XX=m
+CONFIG_USB_NET_SMSC95XX=m
+CONFIG_USB_NET_GL620A=m
+CONFIG_USB_NET_NET1080=m
+CONFIG_USB_NET_PLUSB=m
+CONFIG_USB_NET_MCS7830=m
+CONFIG_USB_NET_RNDIS_HOST=m
+CONFIG_USB_NET_CDC_SUBSET=y
+CONFIG_USB_ALI_M5632=y
+CONFIG_USB_AN2720=y
+CONFIG_USB_BELKIN=y
+CONFIG_USB_ARMLINUX=y
+CONFIG_USB_EPSON2888=y
+CONFIG_USB_KC2190=y
+CONFIG_USB_NET_ZAURUS=y
+CONFIG_USB_NET_CX82310_ETH=m
+CONFIG_USB_NET_KALMIA=m
+CONFIG_USB_HSO=m
+CONFIG_USB_NET_INT51X1=m
+CONFIG_USB_IPHETH=m
+CONFIG_USB_SIERRA_NET=m
+CONFIG_USB_VL600=m
+CONFIG_WLAN=y
+# CONFIG_LIBERTAS_THINFIRM is not set
+CONFIG_AT76C50X_USB=m
+CONFIG_USB_ZD1201=m
+CONFIG_USB_NET_RNDIS_WLAN=m
+CONFIG_RTL8187=m
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+CONFIG_BRCMUTIL=m
+CONFIG_BRCMFMAC=m
+# CONFIG_BRCMDBG is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_IWM is not set
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+CONFIG_LIBERTAS_SDIO=m
+# CONFIG_LIBERTAS_SPI is not set
+CONFIG_LIBERTAS_DEBUG=y
+# CONFIG_LIBERTAS_MESH is not set
+CONFIG_P54_COMMON=m
+CONFIG_P54_USB=m
+# CONFIG_P54_SPI is not set
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT33XX=y
+CONFIG_RT2800USB_RT35XX=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_UNKNOWN=y
+CONFIG_RT2800_LIB=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2X00_LIB_CRYPTO=y
+CONFIG_RT2X00_LIB_LEDS=y
+# CONFIG_RT2X00_DEBUG is not set
+CONFIG_RTL8192CU=m
+CONFIG_RTLWIFI=m
+CONFIG_RTL8192C_COMMON=m
+# CONFIG_WL1251 is not set
+CONFIG_WL12XX_MENU=m
+CONFIG_WL12XX=m
+CONFIG_WL12XX_SPI=m
+CONFIG_WL12XX_SDIO=m
+# CONFIG_WL12XX_SDIO_TEST is not set
+CONFIG_WL12XX_PLATFORM_DATA=y
+CONFIG_ZD1211RW=m
+# CONFIG_ZD1211RW_DEBUG is not set
+# CONFIG_MWIFIEX is not set
+
+#
+# WiMAX Wireless Broadband devices
+#
+CONFIG_WIMAX_I2400M=m
+CONFIG_WIMAX_I2400M_USB=m
+# CONFIG_WIMAX_I2400M_SDIO is not set
+CONFIG_WIMAX_I2400M_DEBUG_LEVEL=8
+# CONFIG_WAN is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+CONFIG_INPUT_FF_MEMLESS=m
+CONFIG_INPUT_POLLDEV=m
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+CONFIG_INPUT_JOYDEV=m
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ADP5589 is not set
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_QT1070 is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_MCS is not set
+# CONFIG_KEYBOARD_MPR121 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+CONFIG_KEYBOARD_TWL4030=y
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=y
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
+# CONFIG_TOUCHSCREEN_BU21013 is not set
+# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MAX11801 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+CONFIG_TOUCHSCREEN_TI_TSCADC=y
+CONFIG_TOUCHSCREEN_USB_COMPOSITE=m
+CONFIG_TOUCHSCREEN_USB_EGALAX=y
+CONFIG_TOUCHSCREEN_USB_PANJIT=y
+CONFIG_TOUCHSCREEN_USB_3M=y
+CONFIG_TOUCHSCREEN_USB_ITM=y
+CONFIG_TOUCHSCREEN_USB_ETURBO=y
+CONFIG_TOUCHSCREEN_USB_GUNZE=y
+CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
+CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
+CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
+CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
+CONFIG_TOUCHSCREEN_USB_GOTOP=y
+CONFIG_TOUCHSCREEN_USB_JASTEC=y
+CONFIG_TOUCHSCREEN_USB_E2I=y
+CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
+CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
+CONFIG_TOUCHSCREEN_USB_NEXIO=y
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+CONFIG_TOUCHSCREEN_TSC_SERIO=m
+CONFIG_TOUCHSCREEN_TSC2005=m
+CONFIG_TOUCHSCREEN_TSC2007=m
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_TOUCHSCREEN_ST1232 is not set
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AD714X=m
+CONFIG_INPUT_AD714X_I2C=m
+CONFIG_INPUT_AD714X_SPI=m
+CONFIG_INPUT_BMA150=m
+CONFIG_INPUT_MMA8450=m
+CONFIG_INPUT_MPU3050=m
+CONFIG_INPUT_ATI_REMOTE2=m
+CONFIG_INPUT_KEYSPAN_REMOTE=m
+CONFIG_INPUT_KXTJ9=m
+# CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
+CONFIG_INPUT_POWERMATE=m
+CONFIG_INPUT_YEALINK=m
+CONFIG_INPUT_CM109=m
+CONFIG_INPUT_TWL4030_PWRBUTTON=y
+CONFIG_INPUT_TWL4030_VIBRA=m
+CONFIG_INPUT_TWL6040_VIBRA=m
+CONFIG_INPUT_UINPUT=m
+CONFIG_INPUT_PCF8574=m
+# CONFIG_INPUT_PWM_BEEPER is not set
+CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
+CONFIG_INPUT_ADXL34X=m
+CONFIG_INPUT_ADXL34X_I2C=m
+CONFIG_INPUT_ADXL34X_SPI=m
+CONFIG_INPUT_CMA3000=m
+CONFIG_INPUT_CMA3000_I2C=m
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+# CONFIG_SERIO_PARKBD is not set
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_SERIO_PS2MULT is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+# CONFIG_SERIAL_8250_DW is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_OF_PLATFORM is not set
+CONFIG_SERIAL_OMAP=y
+CONFIG_SERIAL_OMAP_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_TTY_PRINTK is not set
+CONFIG_PRINTER=m
+# CONFIG_LP_CONSOLE is not set
+# CONFIG_PPDEV is not set
+# CONFIG_HVC_DCC is not set
+# CONFIG_VIRTIO_CONSOLE is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_HW_RANDOM_VIRTIO is not set
+# CONFIG_R3964 is not set
+CONFIG_RAW_DRIVER=m
+CONFIG_MAX_RAW_DEVS=256
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_MUX is not set
+CONFIG_I2C_HELPER_AUTO=y
+CONFIG_I2C_ALGOBIT=m
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_OMAP=y
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_PXA_PCI is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_DIOLAN_U2C is not set
+# CONFIG_I2C_PARPORT is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+CONFIG_SPI_BITBANG=m
+# CONFIG_SPI_BUTTERFLY is not set
+CONFIG_SPI_GPIO=m
+# CONFIG_SPI_LM70_LLP is not set
+# CONFIG_SPI_OC_TINY is not set
+CONFIG_SPI_OMAP24XX=y
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+CONFIG_SPI_SPIDEV=m
+# CONFIG_SPI_TLE62X0 is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_IT8761E is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_SX150X is not set
+CONFIG_GPIO_TWL4030=y
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+CONFIG_GENERIC_PWM=y
+CONFIG_DAVINCI_EHRPWM=y
+CONFIG_ECAP_PWM=y
+CONFIG_W1=y
+CONFIG_W1_CON=y
+
+#
+# 1-wire Bus Masters
+#
+# CONFIG_W1_MASTER_DS2490 is not set
+# CONFIG_W1_MASTER_DS2482 is not set
+# CONFIG_W1_MASTER_DS1WM is not set
+# CONFIG_W1_MASTER_GPIO is not set
+# CONFIG_HDQ_MASTER_OMAP is not set
+
+#
+# 1-wire Slaves
+#
+# CONFIG_W1_SLAVE_THERM is not set
+# CONFIG_W1_SLAVE_SMEM is not set
+# CONFIG_W1_SLAVE_DS2408 is not set
+# CONFIG_W1_SLAVE_DS2423 is not set
+# CONFIG_W1_SLAVE_DS2431 is not set
+# CONFIG_W1_SLAVE_DS2433 is not set
+# CONFIG_W1_SLAVE_DS2760 is not set
+# CONFIG_W1_SLAVE_DS2780 is not set
+# CONFIG_W1_SLAVE_BQ27000 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2780 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ20Z75 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+# CONFIG_BATTERY_MAX17042 is not set
+# CONFIG_CHARGER_ISP1704 is not set
+# CONFIG_CHARGER_MAX8903 is not set
+# CONFIG_CHARGER_TWL4030 is not set
+# CONFIG_CHARGER_GPIO is not set
+CONFIG_HWMON=y
+CONFIG_HWMON_VID=m
+# CONFIG_HWMON_DEBUG_CHIP is not set
+
+#
+# Native drivers
+#
+CONFIG_SENSORS_AD7314=m
+CONFIG_SENSORS_AD7414=m
+CONFIG_SENSORS_AD7418=m
+CONFIG_SENSORS_ADCXX=m
+CONFIG_SENSORS_ADM1021=m
+CONFIG_SENSORS_ADM1025=m
+CONFIG_SENSORS_ADM1026=m
+CONFIG_SENSORS_ADM1029=m
+CONFIG_SENSORS_ADM1031=m
+CONFIG_SENSORS_ADM9240=m
+CONFIG_SENSORS_ADT7411=m
+CONFIG_SENSORS_ADT7462=m
+CONFIG_SENSORS_ADT7470=m
+CONFIG_SENSORS_ADT7475=m
+CONFIG_SENSORS_ASC7621=m
+CONFIG_SENSORS_ATXP1=m
+CONFIG_SENSORS_DS620=m
+CONFIG_SENSORS_DS1621=m
+CONFIG_SENSORS_F71805F=m
+CONFIG_SENSORS_F71882FG=m
+CONFIG_SENSORS_F75375S=m
+CONFIG_SENSORS_G760A=m
+CONFIG_SENSORS_GL518SM=m
+CONFIG_SENSORS_GL520SM=m
+CONFIG_SENSORS_GPIO_FAN=m
+CONFIG_SENSORS_IT87=m
+CONFIG_SENSORS_JC42=m
+CONFIG_SENSORS_LINEAGE=m
+CONFIG_SENSORS_LM63=m
+CONFIG_SENSORS_LM70=m
+CONFIG_SENSORS_LM73=m
+CONFIG_SENSORS_LM75=m
+CONFIG_SENSORS_LM77=m
+CONFIG_SENSORS_LM78=m
+CONFIG_SENSORS_LM80=m
+CONFIG_SENSORS_LM83=m
+CONFIG_SENSORS_LM85=m
+CONFIG_SENSORS_LM87=m
+CONFIG_SENSORS_LM90=m
+CONFIG_SENSORS_LM92=m
+CONFIG_SENSORS_LM93=m
+CONFIG_SENSORS_LTC4151=m
+CONFIG_SENSORS_LTC4215=m
+CONFIG_SENSORS_LTC4245=m
+CONFIG_SENSORS_LTC4261=m
+CONFIG_SENSORS_LM95241=m
+CONFIG_SENSORS_LM95245=m
+CONFIG_SENSORS_MAX1111=m
+CONFIG_SENSORS_MAX16065=m
+CONFIG_SENSORS_MAX1619=m
+CONFIG_SENSORS_MAX1668=m
+CONFIG_SENSORS_MAX6639=m
+CONFIG_SENSORS_MAX6642=m
+CONFIG_SENSORS_MAX6650=m
+CONFIG_SENSORS_NTC_THERMISTOR=m
+CONFIG_SENSORS_PC87360=m
+CONFIG_SENSORS_PC87427=m
+CONFIG_SENSORS_PCF8591=m
+CONFIG_PMBUS=m
+CONFIG_SENSORS_PMBUS=m
+# CONFIG_SENSORS_ADM1275 is not set
+# CONFIG_SENSORS_LM25066 is not set
+CONFIG_SENSORS_LTC2978=m
+# CONFIG_SENSORS_MAX16064 is not set
+# CONFIG_SENSORS_MAX34440 is not set
+# CONFIG_SENSORS_MAX8688 is not set
+# CONFIG_SENSORS_UCD9000 is not set
+# CONFIG_SENSORS_UCD9200 is not set
+CONFIG_SENSORS_ZL6100=m
+CONFIG_SENSORS_SHT15=m
+CONFIG_SENSORS_SHT21=m
+CONFIG_SENSORS_SMM665=m
+CONFIG_SENSORS_DME1737=m
+CONFIG_SENSORS_EMC1403=m
+CONFIG_SENSORS_EMC2103=m
+CONFIG_SENSORS_EMC6W201=m
+CONFIG_SENSORS_SMSC47M1=m
+CONFIG_SENSORS_SMSC47M192=m
+CONFIG_SENSORS_SMSC47B397=m
+CONFIG_SENSORS_SCH56XX_COMMON=m
+CONFIG_SENSORS_SCH5627=m
+CONFIG_SENSORS_SCH5636=m
+CONFIG_SENSORS_ADS1015=m
+CONFIG_SENSORS_ADS7828=m
+CONFIG_SENSORS_ADS7871=m
+CONFIG_SENSORS_AMC6821=m
+CONFIG_SENSORS_THMC50=m
+CONFIG_SENSORS_TMP102=m
+CONFIG_SENSORS_TMP401=m
+CONFIG_SENSORS_TMP421=m
+CONFIG_SENSORS_VT1211=m
+CONFIG_SENSORS_W83781D=m
+CONFIG_SENSORS_W83791D=m
+CONFIG_SENSORS_W83792D=m
+CONFIG_SENSORS_W83793=m
+CONFIG_SENSORS_W83795=m
+# CONFIG_SENSORS_W83795_FANCTRL is not set
+CONFIG_SENSORS_W83L785TS=m
+CONFIG_SENSORS_W83L786NG=m
+CONFIG_SENSORS_W83627HF=m
+CONFIG_SENSORS_W83627EHF=m
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_CORE is not set
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_DW_WATCHDOG is not set
+CONFIG_OMAP_WATCHDOG=y
+CONFIG_TWL4030_WATCHDOG=y
+# CONFIG_MAX63XX_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_88PM860X is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_TPS6105X is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TPS6507X is not set
+CONFIG_MFD_TPS65217=y
+# CONFIG_MFD_TPS6586X is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_I2C is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+CONFIG_TWL4030_CORE=y
+# CONFIG_TWL4030_MADC is not set
+CONFIG_TWL4030_POWER=y
+CONFIG_MFD_TWL4030_AUDIO=y
+# CONFIG_TWL6030_PWM is not set
+CONFIG_TWL6040_CORE=y
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TC3589X is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_PMIC_ADP5520 is not set
+# CONFIG_MFD_MAX8925 is not set
+# CONFIG_MFD_MAX8997 is not set
+# CONFIG_MFD_MAX8998 is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X_I2C is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_WM8994 is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_WL1273_CORE is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+CONFIG_REGULATOR_DUMMY=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
+CONFIG_REGULATOR_USERSPACE_CONSUMER=y
+CONFIG_REGULATOR_GPIO=y
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_MAX8649 is not set
+# CONFIG_REGULATOR_MAX8660 is not set
+# CONFIG_REGULATOR_MAX8952 is not set
+CONFIG_REGULATOR_TWL4030=y
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_REGULATOR_LP3972 is not set
+CONFIG_REGULATOR_TPS65023=y
+CONFIG_REGULATOR_TPS6507X=y
+CONFIG_REGULATOR_TPS65217=y
+# CONFIG_REGULATOR_ISL6271A is not set
+# CONFIG_REGULATOR_AD5398 is not set
+# CONFIG_REGULATOR_TPS6524X is not set
+CONFIG_MEDIA_SUPPORT=y
+
+#
+# Multimedia core support
+#
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
+CONFIG_DVB_CORE=m
+CONFIG_DVB_NET=y
+CONFIG_VIDEO_MEDIA=m
+
+#
+# Multimedia drivers
+#
+CONFIG_RC_CORE=y
+CONFIG_LIRC=y
+CONFIG_RC_MAP=y
+CONFIG_IR_NEC_DECODER=y
+CONFIG_IR_RC5_DECODER=y
+CONFIG_IR_RC6_DECODER=y
+CONFIG_IR_JVC_DECODER=y
+CONFIG_IR_SONY_DECODER=y
+CONFIG_IR_RC5_SZ_DECODER=y
+CONFIG_IR_MCE_KBD_DECODER=y
+CONFIG_IR_LIRC_CODEC=y
+CONFIG_RC_ATI_REMOTE=m
+# CONFIG_IR_IMON is not set
+# CONFIG_IR_MCEUSB is not set
+# CONFIG_IR_REDRAT3 is not set
+# CONFIG_IR_STREAMZAP is not set
+# CONFIG_RC_LOOPBACK is not set
+CONFIG_MEDIA_ATTACH=y
+CONFIG_MEDIA_TUNER=m
+CONFIG_MEDIA_TUNER_CUSTOMISE=y
+
+#
+# Customize TV tuners
+#
+CONFIG_MEDIA_TUNER_SIMPLE=m
+CONFIG_MEDIA_TUNER_TDA8290=m
+CONFIG_MEDIA_TUNER_TDA827X=m
+CONFIG_MEDIA_TUNER_TDA18271=m
+CONFIG_MEDIA_TUNER_TDA9887=m
+CONFIG_MEDIA_TUNER_TEA5761=m
+CONFIG_MEDIA_TUNER_TEA5767=m
+CONFIG_MEDIA_TUNER_MT20XX=m
+CONFIG_MEDIA_TUNER_MT2060=m
+CONFIG_MEDIA_TUNER_MT2266=m
+CONFIG_MEDIA_TUNER_MT2131=m
+CONFIG_MEDIA_TUNER_QT1010=m
+CONFIG_MEDIA_TUNER_XC2028=m
+CONFIG_MEDIA_TUNER_XC5000=m
+CONFIG_MEDIA_TUNER_XC4000=m
+CONFIG_MEDIA_TUNER_MXL5005S=m
+CONFIG_MEDIA_TUNER_MXL5007T=m
+CONFIG_MEDIA_TUNER_MC44S803=m
+CONFIG_MEDIA_TUNER_MAX2165=m
+CONFIG_MEDIA_TUNER_TDA18218=m
+CONFIG_MEDIA_TUNER_TDA18212=m
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEOBUF_GEN=m
+CONFIG_VIDEOBUF_VMALLOC=m
+CONFIG_VIDEOBUF_DVB=m
+CONFIG_VIDEO_TVEEPROM=m
+CONFIG_VIDEO_TUNER=m
+CONFIG_VIDEOBUF2_CORE=m
+CONFIG_VIDEOBUF2_MEMOPS=m
+CONFIG_VIDEOBUF2_VMALLOC=m
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
+CONFIG_VIDEO_IR_I2C=y
+
+#
+# Encoders, decoders, sensors and other helper chips
+#
+
+#
+# Audio decoders, processors and mixers
+#
+# CONFIG_VIDEO_TVAUDIO is not set
+# CONFIG_VIDEO_TDA7432 is not set
+# CONFIG_VIDEO_TDA9840 is not set
+# CONFIG_VIDEO_TEA6415C is not set
+# CONFIG_VIDEO_TEA6420 is not set
+CONFIG_VIDEO_MSP3400=m
+# CONFIG_VIDEO_CS5345 is not set
+CONFIG_VIDEO_CS53L32A=m
+# CONFIG_VIDEO_TLV320AIC23B is not set
+CONFIG_VIDEO_WM8775=m
+# CONFIG_VIDEO_WM8739 is not set
+# CONFIG_VIDEO_VP27SMPX is not set
+
+#
+# RDS decoders
+#
+# CONFIG_VIDEO_SAA6588 is not set
+
+#
+# Video decoders
+#
+# CONFIG_VIDEO_ADV7180 is not set
+# CONFIG_VIDEO_BT819 is not set
+# CONFIG_VIDEO_BT856 is not set
+# CONFIG_VIDEO_BT866 is not set
+# CONFIG_VIDEO_KS0127 is not set
+# CONFIG_VIDEO_SAA7110 is not set
+CONFIG_VIDEO_SAA711X=m
+# CONFIG_VIDEO_SAA7191 is not set
+# CONFIG_VIDEO_TVP514X is not set
+# CONFIG_VIDEO_TVP5150 is not set
+# CONFIG_VIDEO_TVP7002 is not set
+# CONFIG_VIDEO_VPX3220 is not set
+
+#
+# Video and audio decoders
+#
+# CONFIG_VIDEO_SAA717X is not set
+CONFIG_VIDEO_CX25840=m
+
+#
+# MPEG video encoders
+#
+CONFIG_VIDEO_CX2341X=m
+
+#
+# Video encoders
+#
+# CONFIG_VIDEO_SAA7127 is not set
+# CONFIG_VIDEO_SAA7185 is not set
+# CONFIG_VIDEO_ADV7170 is not set
+# CONFIG_VIDEO_ADV7175 is not set
+# CONFIG_VIDEO_ADV7343 is not set
+# CONFIG_VIDEO_AK881X is not set
+
+#
+# Camera sensor devices
+#
+# CONFIG_VIDEO_OV7670 is not set
+# CONFIG_VIDEO_MT9V011 is not set
+# CONFIG_VIDEO_TCM825X is not set
+# CONFIG_VIDEO_SR030PC30 is not set
+
+#
+# Flash devices
+#
+# CONFIG_VIDEO_ADP1653 is not set
+
+#
+# Video improvement chips
+#
+# CONFIG_VIDEO_UPD64031A is not set
+# CONFIG_VIDEO_UPD64083 is not set
+
+#
+# Miscelaneous helper chips
+#
+# CONFIG_VIDEO_THS7303 is not set
+# CONFIG_VIDEO_M52790 is not set
+CONFIG_VIDEO_VIVI=m
+# CONFIG_VIDEO_VPFE_CAPTURE is not set
+# CONFIG_VIDEO_OMAP2_VOUT is not set
+# CONFIG_VIDEO_BWQCAM is not set
+# CONFIG_VIDEO_CQCAM is not set
+# CONFIG_VIDEO_W9966 is not set
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_AU0828 is not set
+# CONFIG_SOC_CAMERA is not set
+CONFIG_V4L_USB_DRIVERS=y
+CONFIG_USB_VIDEO_CLASS=y
+CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
+CONFIG_USB_GSPCA=m
+CONFIG_USB_M5602=m
+CONFIG_USB_STV06XX=m
+CONFIG_USB_GL860=m
+CONFIG_USB_GSPCA_BENQ=m
+CONFIG_USB_GSPCA_CONEX=m
+CONFIG_USB_GSPCA_CPIA1=m
+CONFIG_USB_GSPCA_ETOMS=m
+CONFIG_USB_GSPCA_FINEPIX=m
+CONFIG_USB_GSPCA_JEILINJ=m
+CONFIG_USB_GSPCA_KINECT=m
+CONFIG_USB_GSPCA_KONICA=m
+CONFIG_USB_GSPCA_MARS=m
+CONFIG_USB_GSPCA_MR97310A=m
+CONFIG_USB_GSPCA_NW80X=m
+CONFIG_USB_GSPCA_OV519=m
+CONFIG_USB_GSPCA_OV534=m
+CONFIG_USB_GSPCA_OV534_9=m
+CONFIG_USB_GSPCA_PAC207=m
+CONFIG_USB_GSPCA_PAC7302=m
+CONFIG_USB_GSPCA_PAC7311=m
+CONFIG_USB_GSPCA_SE401=m
+CONFIG_USB_GSPCA_SN9C2028=m
+CONFIG_USB_GSPCA_SN9C20X=m
+CONFIG_USB_GSPCA_SONIXB=m
+CONFIG_USB_GSPCA_SONIXJ=m
+CONFIG_USB_GSPCA_SPCA500=m
+CONFIG_USB_GSPCA_SPCA501=m
+CONFIG_USB_GSPCA_SPCA505=m
+CONFIG_USB_GSPCA_SPCA506=m
+CONFIG_USB_GSPCA_SPCA508=m
+CONFIG_USB_GSPCA_SPCA561=m
+CONFIG_USB_GSPCA_SPCA1528=m
+CONFIG_USB_GSPCA_SQ905=m
+CONFIG_USB_GSPCA_SQ905C=m
+CONFIG_USB_GSPCA_SQ930X=m
+CONFIG_USB_GSPCA_STK014=m
+CONFIG_USB_GSPCA_STV0680=m
+CONFIG_USB_GSPCA_SUNPLUS=m
+CONFIG_USB_GSPCA_T613=m
+CONFIG_USB_GSPCA_TOPRO=m
+CONFIG_USB_GSPCA_TV8532=m
+CONFIG_USB_GSPCA_VC032X=m
+CONFIG_USB_GSPCA_VICAM=m
+CONFIG_USB_GSPCA_XIRLINK_CIT=m
+CONFIG_USB_GSPCA_ZC3XX=m
+CONFIG_VIDEO_PVRUSB2=m
+CONFIG_VIDEO_PVRUSB2_SYSFS=y
+CONFIG_VIDEO_PVRUSB2_DVB=y
+# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
+CONFIG_VIDEO_HDPVR=m
+CONFIG_VIDEO_EM28XX=m
+CONFIG_VIDEO_EM28XX_ALSA=m
+CONFIG_VIDEO_EM28XX_DVB=m
+CONFIG_VIDEO_EM28XX_RC=y
+CONFIG_VIDEO_TLG2300=m
+CONFIG_VIDEO_CX231XX=m
+CONFIG_VIDEO_CX231XX_RC=y
+CONFIG_VIDEO_CX231XX_ALSA=m
+CONFIG_VIDEO_CX231XX_DVB=m
+# CONFIG_VIDEO_TM6000 is not set
+CONFIG_VIDEO_USBVISION=m
+CONFIG_USB_ET61X251=m
+CONFIG_USB_SN9C102=m
+CONFIG_USB_PWC=m
+# CONFIG_USB_PWC_DEBUG is not set
+CONFIG_USB_PWC_INPUT_EVDEV=y
+CONFIG_USB_ZR364XX=m
+CONFIG_USB_STKWEBCAM=m
+CONFIG_USB_S2255=m
+# CONFIG_V4L_MEM2MEM_DRIVERS is not set
+CONFIG_RADIO_ADAPTERS=y
+# CONFIG_I2C_SI4713 is not set
+# CONFIG_RADIO_SI4713 is not set
+# CONFIG_USB_DSBR is not set
+# CONFIG_RADIO_SI470X is not set
+# CONFIG_USB_MR800 is not set
+# CONFIG_RADIO_TEA5764 is not set
+# CONFIG_RADIO_SAA7706H is not set
+# CONFIG_RADIO_TEF6862 is not set
+# CONFIG_RADIO_WL1273 is not set
+
+#
+# Texas Instruments WL128x FM driver (ST based)
+#
+# CONFIG_RADIO_WL128X is not set
+CONFIG_DVB_MAX_ADAPTERS=8
+# CONFIG_DVB_DYNAMIC_MINORS is not set
+CONFIG_DVB_CAPTURE_DRIVERS=y
+# CONFIG_TTPCI_EEPROM is not set
+
+#
+# Supported USB Adapters
+#
+# CONFIG_DVB_USB is not set
+# CONFIG_SMS_SIANO_MDTV is not set
+
+#
+# Supported FlexCopII (B2C2) Adapters
+#
+# CONFIG_DVB_B2C2_FLEXCOP is not set
+
+#
+# Supported DVB Frontends
+#
+CONFIG_DVB_FE_CUSTOMISE=y
+
+#
+# Customise DVB Frontends
+#
+
+#
+# Multistandard (satellite) frontends
+#
+CONFIG_DVB_STB0899=m
+CONFIG_DVB_STB6100=m
+CONFIG_DVB_STV090x=m
+CONFIG_DVB_STV6110x=m
+
+#
+# Multistandard (cable + terrestrial) frontends
+#
+CONFIG_DVB_DRXK=m
+CONFIG_DVB_TDA18271C2DD=m
+
+#
+# DVB-S (satellite) frontends
+#
+CONFIG_DVB_CX24110=m
+CONFIG_DVB_CX24123=m
+CONFIG_DVB_MT312=m
+CONFIG_DVB_ZL10036=m
+CONFIG_DVB_ZL10039=m
+CONFIG_DVB_S5H1420=m
+CONFIG_DVB_STV0288=m
+CONFIG_DVB_STB6000=m
+CONFIG_DVB_STV0299=m
+CONFIG_DVB_STV6110=m
+CONFIG_DVB_STV0900=m
+CONFIG_DVB_TDA8083=m
+CONFIG_DVB_TDA10086=m
+CONFIG_DVB_TDA8261=m
+CONFIG_DVB_VES1X93=m
+CONFIG_DVB_TUNER_ITD1000=m
+CONFIG_DVB_TUNER_CX24113=m
+CONFIG_DVB_TDA826X=m
+CONFIG_DVB_TUA6100=m
+CONFIG_DVB_CX24116=m
+CONFIG_DVB_SI21XX=m
+CONFIG_DVB_DS3000=m
+CONFIG_DVB_MB86A16=m
+CONFIG_DVB_TDA10071=m
+
+#
+# DVB-T (terrestrial) frontends
+#
+CONFIG_DVB_SP8870=m
+CONFIG_DVB_SP887X=m
+CONFIG_DVB_CX22700=m
+CONFIG_DVB_CX22702=m
+CONFIG_DVB_S5H1432=m
+CONFIG_DVB_DRXD=m
+CONFIG_DVB_L64781=m
+CONFIG_DVB_TDA1004X=m
+CONFIG_DVB_NXT6000=m
+CONFIG_DVB_MT352=m
+CONFIG_DVB_ZL10353=m
+CONFIG_DVB_DIB3000MB=m
+CONFIG_DVB_DIB3000MC=m
+CONFIG_DVB_DIB7000M=m
+CONFIG_DVB_DIB7000P=m
+CONFIG_DVB_DIB9000=m
+CONFIG_DVB_TDA10048=m
+CONFIG_DVB_AF9013=m
+CONFIG_DVB_EC100=m
+CONFIG_DVB_STV0367=m
+CONFIG_DVB_CXD2820R=m
+
+#
+# DVB-C (cable) frontends
+#
+CONFIG_DVB_VES1820=m
+CONFIG_DVB_TDA10021=m
+CONFIG_DVB_TDA10023=m
+CONFIG_DVB_STV0297=m
+
+#
+# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
+#
+CONFIG_DVB_NXT200X=m
+CONFIG_DVB_OR51211=m
+CONFIG_DVB_OR51132=m
+CONFIG_DVB_BCM3510=m
+CONFIG_DVB_LGDT330X=m
+CONFIG_DVB_LGDT3305=m
+CONFIG_DVB_S5H1409=m
+CONFIG_DVB_AU8522=m
+CONFIG_DVB_S5H1411=m
+
+#
+# ISDB-T (terrestrial) frontends
+#
+CONFIG_DVB_S921=m
+CONFIG_DVB_DIB8000=m
+CONFIG_DVB_MB86A20S=m
+
+#
+# Digital terrestrial only tuners/PLL
+#
+CONFIG_DVB_PLL=m
+CONFIG_DVB_TUNER_DIB0070=m
+CONFIG_DVB_TUNER_DIB0090=m
+
+#
+# SEC control devices for DVB-S
+#
+CONFIG_DVB_LNBP21=m
+CONFIG_DVB_LNBP22=m
+CONFIG_DVB_ISL6405=m
+CONFIG_DVB_ISL6421=m
+CONFIG_DVB_ISL6423=m
+CONFIG_DVB_A8293=m
+CONFIG_DVB_LGS8GL5=m
+CONFIG_DVB_LGS8GXX=m
+CONFIG_DVB_ATBM8830=m
+CONFIG_DVB_TDA665x=m
+CONFIG_DVB_IX2505V=m
+CONFIG_DVB_IT913X_FE=m
+
+#
+# Tools to develop new frontends
+#
+# CONFIG_DVB_DUMMY_FE is not set
+
+#
+# Graphics support
+#
+CONFIG_DRM=m
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+CONFIG_FB_SYS_FILLRECT=m
+CONFIG_FB_SYS_COPYAREA=m
+CONFIG_FB_SYS_IMAGEBLIT=m
+CONFIG_FB_FOREIGN_ENDIAN=y
+CONFIG_FB_BOTH_ENDIAN=y
+# CONFIG_FB_BIG_ENDIAN is not set
+# CONFIG_FB_LITTLE_ENDIAN is not set
+CONFIG_FB_SYS_FOPS=m
+# CONFIG_FB_WMT_GE_ROPS is not set
+CONFIG_FB_DEFERRED_IO=y
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_TILEBLITTING=y
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_UVESA is not set
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_TMIO is not set
+CONFIG_FB_SMSCUFX=m
+CONFIG_FB_UDL=m
+CONFIG_FB_DA8XX=y
+CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=4
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+CONFIG_OMAP2_VRAM=y
+CONFIG_OMAP2_VRFB=y
+CONFIG_OMAP2_DSS=m
+CONFIG_OMAP2_VRAM_SIZE=0
+CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
+# CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS is not set
+CONFIG_OMAP2_DSS_DPI=y
+CONFIG_OMAP2_DSS_RFBI=y
+CONFIG_OMAP2_DSS_VENC=y
+CONFIG_OMAP2_DSS_SDI=y
+CONFIG_OMAP2_DSS_DSI=y
+# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0
+CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y
+CONFIG_FB_OMAP2=m
+CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
+CONFIG_FB_OMAP2_NUM_FBS=3
+
+#
+# OMAP2/3 Display Device Drivers
+#
+CONFIG_PANEL_GENERIC_DPI=m
+CONFIG_PANEL_DVI=m
+# CONFIG_PANEL_LGPHILIPS_LB035Q02 is not set
+CONFIG_PANEL_SHARP_LS037V7DW01=m
+CONFIG_PANEL_NEC_NL8048HL11_01B=m
+CONFIG_PANEL_PICODLP=m
+CONFIG_PANEL_TAAL=m
+CONFIG_PANEL_TPO_TD043MTEA1=m
+CONFIG_PANEL_ACX565AKM=m
+CONFIG_PANEL_N8X0=m
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+CONFIG_LCD_PLATFORM=y
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
+# CONFIG_LCD_AMS369FG06 is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+CONFIG_BACKLIGHT_PWM=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
+# CONFIG_BACKLIGHT_ADP8870 is not set
+# CONFIG_BACKLIGHT_TLC59108 is not set
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=y
+
+#
+# Display hardware drivers
+#
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+# CONFIG_SOUND_OSS_CORE is not set
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_HWDEP=y
+CONFIG_SND_RAWMIDI=y
+CONFIG_SND_JACK=y
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_DUMMY=m
+# CONFIG_SND_MIXER_OSS is not set
+# CONFIG_SND_PCM_OSS is not set
+# CONFIG_SND_SEQUENCER_OSS is not set
+CONFIG_SND_HRTIMER=m
+CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_RAWMIDI_SEQ=m
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_MTS64 is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_PORTMAN2X4 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+CONFIG_SND_USB_AUDIO=y
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_USB_6FIRE is not set
+CONFIG_SND_SOC=y
+# CONFIG_SND_SOC_CACHE_LZO is not set
+CONFIG_SND_AM33XX_SOC=y
+CONFIG_SND_DAVINCI_SOC_MCASP=m
+CONFIG_SND_AM335X_SOC_EVM=m
+# CONFIG_SND_OMAP_SOC is not set
+CONFIG_SND_SOC_I2C_AND_SPI=y
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_TLV320AIC3X=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_ACRUX is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EMS_FF is not set
+# CONFIG_HID_ELECOM is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_HOLTEK is not set
+# CONFIG_HID_KEYTOUCH is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_UCLOGIC is not set
+# CONFIG_HID_WALTOP is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LCPOWER is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MAGICMOUSE is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_MULTITOUCH is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_ORTEK is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_PICOLCD is not set
+# CONFIG_HID_PRIMAX is not set
+# CONFIG_HID_QUANTA is not set
+# CONFIG_HID_ROCCAT is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SPEEDLINK is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_WACOM is not set
+# CONFIG_HID_WIIMOTE is not set
+# CONFIG_HID_ZEROPLUS is not set
+# CONFIG_HID_ZYDACRON is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_COMMON=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+# CONFIG_USB_ARCH_HAS_XHCI is not set
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_DWC3 is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_EHCI_HCD is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_U132_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+CONFIG_USB_MUSB_HDRC=y
+
+#
+# Platform Glue Layer
+#
+# CONFIG_USB_MUSB_TUSB6010_GLUE is not set
+# CONFIG_USB_MUSB_OMAP2PLUS_GLUE is not set
+# CONFIG_USB_MUSB_AM35X_GLUE is not set
+CONFIG_USB_MUSB_TI81XX_GLUE=y
+# CONFIG_USB_MUSB_DAVINCI is not set
+# CONFIG_USB_MUSB_DA8XX is not set
+# CONFIG_USB_MUSB_TUSB6010 is not set
+# CONFIG_USB_MUSB_OMAP2PLUS is not set
+# CONFIG_USB_MUSB_AM35X is not set
+CONFIG_USB_MUSB_TI81XX=y
+# CONFIG_USB_MUSB_BLACKFIN is not set
+# CONFIG_USB_MUSB_UX500 is not set
+CONFIG_USB_TI_CPPI41_DMA_HW=y
+# CONFIG_MUSB_PIO_ONLY is not set
+# CONFIG_USB_INVENTRA_DMA is not set
+# CONFIG_USB_TI_CPPI_DMA is not set
+CONFIG_USB_TI_CPPI41_DMA=y
+# CONFIG_USB_TUSB_OMAP_DMA is not set
+# CONFIG_USB_UX500_DMA is not set
+# CONFIG_USB_RENESAS_USBHS is not set
+
+#
+# USB Device Class drivers
+#
+CONFIG_USB_ACM=y
+CONFIG_USB_PRINTER=y
+CONFIG_USB_WDM=y
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_REALTEK is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_STORAGE_ENE_UB6250 is not set
+CONFIG_USB_UAS=y
+CONFIG_USB_LIBUSUAL=y
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_USS720 is not set
+CONFIG_USB_SERIAL=m
+CONFIG_USB_EZUSB=y
+# CONFIG_USB_SERIAL_GENERIC is not set
+CONFIG_USB_SERIAL_AIRCABLE=m
+CONFIG_USB_SERIAL_ARK3116=m
+CONFIG_USB_SERIAL_BELKIN=m
+CONFIG_USB_SERIAL_CH341=m
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
+CONFIG_USB_SERIAL_CP210X=m
+CONFIG_USB_SERIAL_CYPRESS_M8=m
+CONFIG_USB_SERIAL_EMPEG=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_FUNSOFT=m
+CONFIG_USB_SERIAL_VISOR=m
+CONFIG_USB_SERIAL_IPAQ=m
+CONFIG_USB_SERIAL_IR=m
+CONFIG_USB_SERIAL_EDGEPORT=m
+CONFIG_USB_SERIAL_EDGEPORT_TI=m
+CONFIG_USB_SERIAL_GARMIN=m
+CONFIG_USB_SERIAL_IPW=m
+CONFIG_USB_SERIAL_IUU=m
+CONFIG_USB_SERIAL_KEYSPAN_PDA=m
+CONFIG_USB_SERIAL_KEYSPAN=m
+# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
+CONFIG_USB_SERIAL_KLSI=m
+CONFIG_USB_SERIAL_KOBIL_SCT=m
+CONFIG_USB_SERIAL_MCT_U232=m
+CONFIG_USB_SERIAL_MOS7720=m
+# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
+CONFIG_USB_SERIAL_MOS7840=m
+CONFIG_USB_SERIAL_MOTOROLA=m
+CONFIG_USB_SERIAL_NAVMAN=m
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_SERIAL_OTI6858=m
+CONFIG_USB_SERIAL_QCAUX=m
+CONFIG_USB_SERIAL_QUALCOMM=m
+CONFIG_USB_SERIAL_SPCP8X5=m
+CONFIG_USB_SERIAL_HP4X=m
+CONFIG_USB_SERIAL_SAFE=m
+# CONFIG_USB_SERIAL_SAFE_PADDED is not set
+CONFIG_USB_SERIAL_SIEMENS_MPI=m
+CONFIG_USB_SERIAL_SIERRAWIRELESS=m
+# CONFIG_USB_SERIAL_SYMBOL is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+CONFIG_USB_SERIAL_WWAN=m
+# CONFIG_USB_SERIAL_OPTION is not set
+# CONFIG_USB_SERIAL_OMNINET is not set
+CONFIG_USB_SERIAL_OPTICON=m
+CONFIG_USB_SERIAL_VIVOPAY_SERIAL=m
+CONFIG_USB_SERIAL_ZIO=m
+CONFIG_USB_SERIAL_SSU100=m
+CONFIG_USB_SERIAL_DEBUG=m
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_LED=m
+CONFIG_USB_CYPRESS_CY7C63=m
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_IDMOUSE=m
+CONFIG_USB_FTDI_ELAN=m
+CONFIG_USB_APPLEDISPLAY=m
+CONFIG_USB_SISUSBVGA=m
+CONFIG_USB_SISUSBVGA_CON=y
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+CONFIG_USB_TEST=m
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_YUREX is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+# CONFIG_USB_FUSB300 is not set
+# CONFIG_USB_OMAP is not set
+# CONFIG_USB_R8A66597 is not set
+CONFIG_USB_GADGET_MUSB_HDRC=y
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_ZERO=m
+CONFIG_USB_AUDIO=m
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+CONFIG_USB_G_NCM=m
+CONFIG_USB_GADGETFS=m
+CONFIG_USB_FUNCTIONFS=m
+# CONFIG_USB_FUNCTIONFS_ETH is not set
+CONFIG_USB_FUNCTIONFS_RNDIS=y
+# CONFIG_USB_FUNCTIONFS_GENERIC is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_MASS_STORAGE=m
+CONFIG_USB_G_SERIAL=m
+CONFIG_USB_MIDI_GADGET=m
+CONFIG_USB_G_PRINTER=m
+CONFIG_USB_CDC_COMPOSITE=m
+# CONFIG_USB_G_ACM_MS is not set
+CONFIG_USB_G_MULTI=m
+CONFIG_USB_G_MULTI_RNDIS=y
+# CONFIG_USB_G_MULTI_CDC is not set
+CONFIG_USB_G_HID=m
+CONFIG_USB_G_DBGP=m
+CONFIG_USB_G_DBGP_PRINTK=y
+# CONFIG_USB_G_DBGP_SERIAL is not set
+CONFIG_USB_G_WEBCAM=m
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_TWL4030_USB is not set
+# CONFIG_TWL6030_USB is not set
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
+# CONFIG_MMC_CLKGATE is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+CONFIG_SDIO_UART=y
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_PXAV3 is not set
+# CONFIG_MMC_SDHCI_PXAV2 is not set
+# CONFIG_MMC_OMAP is not set
+CONFIG_MMC_OMAP_HS=y
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_PWM is not set
+CONFIG_LEDS_REGULATOR=y
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_RENESAS_TPU is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_DS3232 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_ISL12022 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_BQ32K is not set
+CONFIG_RTC_DRV_TWL4030=y
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+# CONFIG_RTC_DRV_EM3027 is not set
+# CONFIG_RTC_DRV_RV3029C2 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T93 is not set
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_OMAP=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+CONFIG_VIRTIO=m
+CONFIG_VIRTIO_RING=m
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_BALLOON is not set
+CONFIG_VIRTIO_MMIO=m
+CONFIG_STAGING=y
+# CONFIG_USBIP_CORE is not set
+CONFIG_W35UND=m
+CONFIG_PRISM2_USB=m
+# CONFIG_ECHO is not set
+# CONFIG_ASUS_OLED is not set
+# CONFIG_PANEL is not set
+CONFIG_R8712U=m
+CONFIG_R8712_AP=y
+CONFIG_RTS5139=m
+# CONFIG_RTS5139_DEBUG is not set
+# CONFIG_TRANZPORT is not set
+# CONFIG_POHMELFS is not set
+# CONFIG_LINE6_USB is not set
+CONFIG_USB_SERIAL_QUATECH2=m
+CONFIG_USB_SERIAL_QUATECH_USB2=m
+# CONFIG_VT6656 is not set
+CONFIG_IIO=y
+CONFIG_IIO_BUFFER=y
+CONFIG_IIO_SW_RING=y
+CONFIG_IIO_KFIFO_BUF=y
+CONFIG_IIO_TRIGGER=y
+CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
+
+#
+# Accelerometers
+#
+# CONFIG_ADIS16201 is not set
+# CONFIG_ADIS16203 is not set
+# CONFIG_ADIS16204 is not set
+# CONFIG_ADIS16209 is not set
+# CONFIG_ADIS16220 is not set
+# CONFIG_ADIS16240 is not set
+# CONFIG_KXSD9 is not set
+# CONFIG_LIS3L02DQ is not set
+# CONFIG_SCA3000 is not set
+
+#
+# Analog to digital converters
+#
+# CONFIG_AD7291 is not set
+# CONFIG_AD7298 is not set
+# CONFIG_AD7606 is not set
+# CONFIG_AD799X is not set
+# CONFIG_AD7476 is not set
+# CONFIG_AD7887 is not set
+# CONFIG_AD7780 is not set
+# CONFIG_AD7793 is not set
+# CONFIG_AD7816 is not set
+CONFIG_AD7192=m
+# CONFIG_ADT7310 is not set
+# CONFIG_ADT7410 is not set
+CONFIG_AD7280=m
+# CONFIG_MAX1363 is not set
+
+#
+# Analog digital bi-direction converters
+#
+# CONFIG_ADT7316 is not set
+
+#
+# Capacitance to digital converters
+#
+# CONFIG_AD7150 is not set
+# CONFIG_AD7152 is not set
+CONFIG_AD7746=m
+
+#
+# Digital to analog converters
+#
+CONFIG_AD5064=m
+CONFIG_AD5360=m
+# CONFIG_AD5624R_SPI is not set
+# CONFIG_AD5446 is not set
+# CONFIG_AD5504 is not set
+# CONFIG_AD5791 is not set
+# CONFIG_AD5686 is not set
+# CONFIG_MAX517 is not set
+
+#
+# Direct Digital Synthesis
+#
+# CONFIG_AD5930 is not set
+# CONFIG_AD9832 is not set
+# CONFIG_AD9834 is not set
+# CONFIG_AD9850 is not set
+# CONFIG_AD9852 is not set
+# CONFIG_AD9910 is not set
+# CONFIG_AD9951 is not set
+
+#
+# Digital gyroscope sensors
+#
+# CONFIG_ADIS16060 is not set
+# CONFIG_ADIS16080 is not set
+# CONFIG_ADIS16130 is not set
+# CONFIG_ADIS16260 is not set
+# CONFIG_ADXRS450 is not set
+
+#
+# Network Analyzer, Impedance Converters
+#
+CONFIG_AD5933=m
+
+#
+# Inertial measurement units
+#
+# CONFIG_ADIS16400 is not set
+
+#
+# Light sensors
+#
+# CONFIG_SENSORS_ISL29018 is not set
+# CONFIG_SENSORS_TSL2563 is not set
+# CONFIG_TSL2583 is not set
+
+#
+# Magnetometer sensors
+#
+# CONFIG_SENSORS_AK8975 is not set
+# CONFIG_SENSORS_HMC5843 is not set
+
+#
+# Active energy metering IC
+#
+# CONFIG_ADE7753 is not set
+# CONFIG_ADE7754 is not set
+# CONFIG_ADE7758 is not set
+# CONFIG_ADE7759 is not set
+# CONFIG_ADE7854 is not set
+
+#
+# Resolver to digital converters
+#
+# CONFIG_AD2S90 is not set
+CONFIG_AD2S1200=m
+# CONFIG_AD2S1210 is not set
+
+#
+# Triggers - standalone
+#
+# CONFIG_IIO_PERIODIC_RTC_TRIGGER is not set
+# CONFIG_IIO_GPIO_TRIGGER is not set
+# CONFIG_IIO_SYSFS_TRIGGER is not set
+CONFIG_IIO_DUMMY_EVGEN=m
+CONFIG_IIO_SIMPLE_DUMMY=m
+CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
+CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
+# CONFIG_XVMALLOC is not set
+# CONFIG_ZRAM is not set
+# CONFIG_FB_SM7XX is not set
+# CONFIG_TIDSPBRIDGE is not set
+CONFIG_USB_ENESTORAGE=m
+# CONFIG_BCM_WIMAX is not set
+# CONFIG_FT1000 is not set
+
+#
+# Speakup console speech
+#
+# CONFIG_SPEAKUP is not set
+# CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
+# CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
+# CONFIG_STAGING_MEDIA is not set
+CONFIG_CLKDEV_LOOKUP=y
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_CLKSRC_MMIO=y
+CONFIG_IOMMU_API=y
+CONFIG_IOMMU_SUPPORT=y
+CONFIG_OMAP_IOMMU=y
+CONFIG_OMAP_IOVMM=y
+CONFIG_OMAP_IOMMU_DEBUG=y
+# CONFIG_VIRT_DRIVERS is not set
+CONFIG_PM_DEVFREQ=y
+
+#
+# DEVFREQ Governors
+#
+# CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
+# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
+# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
+CONFIG_DEVFREQ_GOV_USERSPACE=y
+
+#
+# DEVFREQ Drivers
+#
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=m
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
+# CONFIG_EXT3_FS_XATTR is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_XATTR=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+CONFIG_REISERFS_FS=m
+# CONFIG_REISERFS_CHECK is not set
+# CONFIG_REISERFS_PROC_INFO is not set
+# CONFIG_REISERFS_FS_XATTR is not set
+CONFIG_JFS_FS=m
+# CONFIG_JFS_POSIX_ACL is not set
+# CONFIG_JFS_SECURITY is not set
+# CONFIG_JFS_DEBUG is not set
+# CONFIG_JFS_STATISTICS is not set
+CONFIG_XFS_FS=m
+# CONFIG_XFS_QUOTA is not set
+# CONFIG_XFS_POSIX_ACL is not set
+# CONFIG_XFS_RT is not set
+# CONFIG_XFS_DEBUG is not set
+CONFIG_GFS2_FS=m
+# CONFIG_GFS2_FS_LOCKING_DLM is not set
+CONFIG_BTRFS_FS=m
+# CONFIG_BTRFS_FS_POSIX_ACL is not set
+CONFIG_NILFS2_FS=m
+CONFIG_FS_POSIX_ACL=y
+CONFIG_EXPORTFS=y
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+CONFIG_FANOTIFY=y
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
+CONFIG_QUOTA=y
+# CONFIG_QUOTA_NETLINK_INTERFACE is not set
+CONFIG_PRINT_QUOTA_WARNING=y
+# CONFIG_QUOTA_DEBUG is not set
+CONFIG_QUOTA_TREE=m
+# CONFIG_QFMT_V1 is not set
+CONFIG_QFMT_V2=m
+CONFIG_QUOTACTL=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_CUSE=m
+CONFIG_GENERIC_ACL=y
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+CONFIG_ISO9660_FS=m
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_UDF_FS=m
+CONFIG_UDF_NLS=y
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=m
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFS_USE_LEGACY_DNS is not set
+CONFIG_NFS_USE_KERNEL_DNS=y
+# CONFIG_NFS_USE_NEW_IDMAPPER is not set
+CONFIG_NFSD=m
+CONFIG_NFSD_V3=y
+# CONFIG_NFSD_V3_ACL is not set
+CONFIG_NFSD_V4=y
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_ACL_SUPPORT=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+# CONFIG_CEPH_FS is not set
+CONFIG_CIFS=m
+CONFIG_CIFS_STATS=y
+# CONFIG_CIFS_STATS2 is not set
+CONFIG_CIFS_WEAK_PW_HASH=y
+# CONFIG_CIFS_UPCALL is not set
+CONFIG_CIFS_XATTR=y
+CONFIG_CIFS_POSIX=y
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_DFS_UPCALL is not set
+# CONFIG_CIFS_ACL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+CONFIG_MAC_PARTITION=y
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=y
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
+CONFIG_SCHED_DEBUG=y
+CONFIG_SCHEDSTATS=y
+CONFIG_TIMER_STATS=y
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_LKDTM is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_ASYNC_RAID6_TEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_LL_UART_NONE=y
+# CONFIG_DEBUG_ICEDCC is not set
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_JTAG_ENABLE=y
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_ENCRYPTED_KEYS is not set
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+CONFIG_SECURITY=y
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_NETWORK is not set
+# CONFIG_SECURITY_PATH is not set
+# CONFIG_SECURITY_TOMOYO is not set
+# CONFIG_SECURITY_APPARMOR is not set
+# CONFIG_IMA is not set
+# CONFIG_EVM is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_XOR_BLOCKS=m
+CONFIG_ASYNC_CORE=m
+CONFIG_ASYNC_MEMCPY=m
+CONFIG_ASYNC_XOR=m
+CONFIG_ASYNC_PQ=m
+CONFIG_ASYNC_RAID6_RECOV=m
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_USER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=m
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=m
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=m
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+CONFIG_CRYPTO_MD4=m
+CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MICHAEL_MIC=y
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=m
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=m
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=m
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=m
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_CRYPTO_DEV_OMAP_SHAM is not set
+# CONFIG_CRYPTO_DEV_OMAP_AES is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_RAID6_PQ=m
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+CONFIG_CRC_T10DIF=y
+CONFIG_CRC_ITU_T=y
+CONFIG_CRC32=y
+CONFIG_CRC7=y
+CONFIG_LIBCRC32C=y
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_XZ_DEC=y
+CONFIG_XZ_DEC_X86=y
+CONFIG_XZ_DEC_POWERPC=y
+CONFIG_XZ_DEC_IA64=y
+CONFIG_XZ_DEC_ARM=y
+CONFIG_XZ_DEC_ARMTHUMB=y
+CONFIG_XZ_DEC_SPARC=y
+CONFIG_XZ_DEC_BCJ=y
+# CONFIG_XZ_DEC_TEST is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_XZ=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_GENERIC_ALLOCATOR=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_AVERAGE=y
+# CONFIG_CORDIC is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/logo_linux_clut224.ppm b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/logo_linux_clut224.ppm
new file mode 100644
index 0000000..404cc6c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/logo_linux_clut224.ppm
@@ -0,0 +1,7053 @@
+P3
+597 94
+255
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 255 255 255 254 254 255 254 250 255 254 250 255 255 254 255 255 255 253 254 255 251 
+255 254 255 255 254 255 254 251 249 254 252 250 254 255 251 254 252 250 254 254 254 255 253 254 
+254 255 251 224 220 212 187 189 188 187 189 188 187 189 188 187 189 188 187 189 188 187 189 188 
+253 252 247 253 253 255 254 255 251 255 255 255 253 253 255 254 255 251 249 252 246 255 255 253 
+253 255 254 255 254 255 254 252 251 253 252 247 253 255 254 253 255 254 251 251 251 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 254 254 254 254 255 255 254 255 255 255 255 253 254 254 253 254 254 253 255 255 253 
+253 255 254 187 189 188 113 113 120 97 100 105 53 60 64 97 100 105 113 113 120 172 178 183 
+255 255 255 253 252 247 255 254 255 255 255 255 253 253 253 254 254 254 255 255 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 
+254 251 249 254 255 255 249 254 246 254 255 255 172 178 183 140 141 138 110 110 107 59 64 62 
+81 77 81 104 112 110 178 172 162 241 240 247 254 255 251 253 255 254 248 251 253 254 251 249 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 254 254 254 255 255 255 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 
+253 255 254 230 230 230 178 172 162 110 110 107 88 95 83 60 64 65 104 112 110 125 131 132 
+202 204 206 255 255 255 254 255 251 255 253 254 254 250 255 248 254 252 255 255 255 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 252 247 254 255 251 249 254 246 254 255 251 254 255 251 254 254 253 254 254 254 254 251 252 
+254 255 251 253 252 247 255 255 253 253 253 255 219 227 224 145 151 154 97 100 105 48 49 51 
+0 1 1 4 2 1 0 1 1 4 1 5 0 3 1 4 1 5 4 1 5 4 2 1 
+0 3 1 21 19 24 59 60 62 104 112 110 172 178 183 253 253 255 255 255 255 254 255 251 
+254 251 252 253 252 247 249 252 251 253 253 255 255 255 253 251 251 251 253 253 255 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 254 255 255 255 255 253 255 255 253 254 255 255 202 204 206 
+71 81 83 57 60 56 59 59 56 59 64 62 54 64 59 56 64 62 56 64 62 54 67 66 
+81 77 81 202 204 206 251 251 251 252 252 252 253 253 253 255 255 253 254 252 251 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+254 255 251 254 255 255 224 220 212 88 95 83 62 65 65 56 64 62 53 63 60 58 65 69 
+58 67 65 53 60 64 57 60 56 71 72 69 187 189 188 252 252 252 254 255 251 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 252 252 252 255 255 255 253 253 253 254 254 254 254 255 255 249 252 251 
+156 160 157 60 60 63 62 61 67 58 59 68 57 60 56 53 64 53 58 62 65 58 62 65 
+58 59 68 110 110 107 242 238 229 254 255 255 253 255 254 251 251 251 254 251 252 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 255 255 255 254 255 255 250 250 247 249 252 246 254 255 251 254 255 251 254 254 254 
+254 255 255 219 227 224 110 110 107 21 19 24 0 0 0 0 0 0 0 3 1 0 3 1 
+6 9 5 4 1 5 4 2 1 4 1 5 0 3 1 48 49 51 97 100 105 21 19 24 
+4 1 5 0 1 1 0 0 0 0 3 1 0 3 1 0 0 0 81 77 81 178 172 162 
+255 254 255 251 251 251 253 252 247 253 253 253 254 250 255 255 253 254 254 255 251 249 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 254 255 255 187 189 188 58 64 64 
+58 65 69 57 58 61 62 65 65 58 62 65 58 62 63 62 66 62 62 65 65 58 62 65 
+58 65 69 57 63 63 187 189 188 254 255 255 255 254 255 254 255 251 254 255 251 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 
+249 254 254 224 220 212 71 72 69 58 62 63 58 65 69 58 64 64 59 64 62 62 61 67 
+59 59 56 62 61 67 58 64 64 56 66 64 57 58 61 172 178 183 254 255 251 250 252 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 252 252 252 254 254 254 252 252 252 254 255 255 140 141 138 
+60 61 69 62 61 67 58 66 61 53 63 60 56 66 64 54 67 66 62 61 67 59 60 62 
+51 61 71 59 60 64 97 100 105 241 240 247 248 254 252 255 253 254 255 255 253 248 254 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 253 254 251 252 254 251 254 253 253 255 255 255 253 254 252 251 255 255 253 178 172 162 
+62 70 69 0 0 0 4 2 1 0 1 1 0 1 1 71 72 69 109 102 83 142 120 69 
+148 133 63 165 143 59 169 141 58 166 134 56 169 138 59 182 158 106 254 252 244 249 254 254 
+168 136 64 142 120 69 109 102 83 102 79 82 0 1 1 0 3 1 0 3 1 4 2 1 
+21 19 24 125 131 132 241 240 247 255 254 255 254 255 251 254 252 244 253 252 247 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 255 255 255 254 252 250 254 254 253 254 255 255 230 230 230 68 69 75 60 64 65 
+58 62 65 71 68 65 94 90 61 113 104 59 147 124 59 128 113 57 97 78 60 62 66 62 
+58 62 65 58 62 65 62 70 69 230 230 230 253 253 255 254 255 251 253 252 247 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 254 254 254 254 254 254 254 254 254 254 254 254 254 254 254 
+241 240 247 81 77 81 59 64 62 58 65 69 59 59 56 97 78 60 128 113 57 147 124 59 
+128 99 63 101 91 62 71 68 65 54 64 59 54 67 66 60 64 65 202 206 211 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 253 253 253 252 252 252 255 255 255 254 255 255 160 163 161 57 63 61 
+58 62 63 57 60 56 62 70 69 142 101 66 174 105 47 185 105 60 155 104 59 85 80 60 
+62 66 56 54 67 66 59 64 62 110 110 107 249 254 246 254 250 255 254 251 249 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+249 254 254 248 254 252 255 255 253 255 255 253 250 250 247 172 178 183 21 19 24 0 0 0 
+0 1 1 4 1 5 21 19 24 109 102 83 148 133 63 164 144 50 166 144 56 169 141 58 
+169 138 59 173 138 52 169 144 61 168 136 64 173 142 59 169 141 58 178 172 162 250 252 254 
+169 144 61 166 144 56 169 141 58 173 145 52 165 143 59 142 120 69 94 90 61 4 1 5 
+0 3 1 4 2 1 21 19 24 172 178 183 249 254 254 253 255 254 250 252 254 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 252 252 252 255 255 253 255 255 253 254 255 255 125 131 132 60 64 65 57 63 63 
+62 66 62 128 113 57 161 125 43 162 125 53 156 125 56 150 128 52 158 134 59 142 101 66 
+71 65 56 58 65 69 54 64 59 125 131 132 255 254 255 253 252 247 254 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 
+160 163 161 57 63 63 51 61 71 62 66 62 128 113 57 148 133 63 161 124 50 161 124 50 
+155 128 52 155 126 57 147 124 59 72 76 65 53 64 53 58 65 69 81 77 81 254 250 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 241 240 247 68 69 75 60 64 65 
+53 67 71 112 79 60 200 101 40 210 105 40 213 100 46 212 104 43 211 99 45 208 103 45 
+128 93 57 59 64 62 58 62 63 62 65 65 172 178 183 255 255 255 255 255 255 255 253 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+249 252 254 254 255 255 254 255 251 202 204 206 62 70 69 4 1 5 0 1 1 0 3 1 
+62 66 56 137 137 94 158 134 59 173 142 59 166 134 56 169 144 61 169 141 58 169 141 58 
+173 145 52 169 138 59 165 143 59 166 144 56 173 138 52 173 142 59 169 144 61 242 238 229 
+214 206 175 165 143 59 173 142 59 169 144 61 169 144 61 168 131 61 169 141 58 158 134 59 
+109 102 83 4 2 1 4 1 5 0 0 0 88 95 83 241 240 247 255 255 253 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 255 255 253 255 255 253 255 255 255 241 240 247 57 63 63 59 64 62 59 59 56 
+128 99 63 157 124 59 161 124 50 158 127 55 152 124 51 154 129 46 157 126 52 158 124 54 
+113 104 59 66 60 61 56 64 62 58 64 64 241 240 247 254 255 251 253 253 255 254 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 
+81 77 81 54 64 59 58 66 61 110 92 61 152 127 56 157 124 59 157 124 59 155 127 54 
+152 124 51 161 124 50 156 124 53 142 120 69 69 60 69 54 64 59 58 68 63 224 220 212 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 172 178 183 60 64 65 57 63 61 
+62 66 62 198 102 49 213 105 50 213 100 46 213 105 50 208 103 45 217 98 38 213 100 46 
+210 105 51 112 79 60 56 64 62 53 63 60 125 131 132 253 255 254 253 255 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 252 250 254 255 251 125 131 132 0 0 0 4 1 5 0 1 1 21 19 24 109 102 83 
+169 138 59 169 138 59 169 144 61 169 138 59 169 138 59 173 142 59 169 141 58 166 144 56 
+173 142 59 169 141 58 165 143 59 165 143 59 166 144 56 169 141 58 169 144 61 182 158 106 
+255 253 254 182 158 106 166 134 56 169 144 61 173 142 59 173 138 52 173 145 52 165 143 59 
+166 144 56 148 133 63 101 91 62 4 1 5 4 2 1 48 49 51 219 227 224 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 254 252 251 255 255 253 255 255 255 187 189 188 58 64 64 59 59 56 72 73 56 
+155 127 54 152 124 51 162 125 53 152 124 51 158 127 55 156 124 53 156 124 53 158 132 49 
+148 133 63 71 65 56 56 66 64 57 58 61 202 204 206 254 255 251 250 252 254 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 219 227 224 
+60 61 69 58 67 65 59 59 56 147 124 59 161 125 43 157 126 52 150 128 52 155 126 57 
+157 124 59 158 124 56 166 129 59 152 124 51 85 80 60 59 64 62 56 66 64 156 160 157 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 252 252 252 251 251 251 255 255 255 255 255 255 125 131 132 58 62 63 62 65 65 
+112 79 60 213 105 46 208 103 45 207 105 48 209 99 39 210 105 40 217 104 40 210 102 46 
+216 99 44 185 105 60 56 64 62 54 64 59 58 65 69 253 255 254 249 254 254 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+202 206 211 48 49 51 0 3 1 0 3 1 0 0 0 109 102 83 148 133 63 173 138 52 
+169 141 58 169 141 58 173 142 59 169 141 58 169 141 58 169 141 58 169 138 59 173 142 59 
+166 144 56 169 138 59 173 138 52 169 141 58 168 136 64 173 138 52 168 136 64 166 144 56 
+224 220 212 242 238 229 165 143 59 173 145 52 168 136 64 166 144 56 165 143 59 169 138 59 
+169 138 59 166 144 56 165 143 59 142 120 69 21 19 24 0 1 1 21 19 24 202 204 206 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 255 254 255 255 253 255 255 253 254 255 255 152 161 158 60 64 65 59 59 56 88 95 83 
+155 127 54 159 126 56 156 124 53 155 128 52 155 127 54 157 124 59 158 124 54 157 126 52 
+152 124 44 101 91 62 57 63 63 59 64 62 154 157 157 254 255 251 254 255 255 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 187 189 188 
+59 64 62 53 63 60 81 77 81 155 128 52 162 124 55 157 127 54 152 124 51 162 125 53 
+158 126 53 158 127 55 154 129 46 150 126 55 110 92 61 59 64 62 58 62 65 125 131 132 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 254 255 255 254 254 254 255 255 255 254 254 254 110 110 107 58 62 63 57 63 63 
+155 104 59 211 104 39 210 99 44 207 105 48 217 104 40 207 99 38 207 105 48 210 105 51 
+209 105 45 211 99 45 71 68 65 59 60 62 53 60 64 219 227 224 254 255 251 254 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 
+254 255 251 254 255 255 254 255 251 254 252 250 254 255 251 254 255 251 254 255 251 172 178 183 
+6 9 5 0 0 0 4 1 5 4 2 1 137 137 94 165 143 59 169 141 58 169 141 58 
+168 136 64 165 143 59 169 141 58 169 141 58 169 141 58 169 141 58 166 144 56 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+182 158 106 254 255 255 178 172 162 166 144 56 166 144 56 173 138 52 166 144 56 169 138 59 
+169 141 58 165 143 59 169 138 59 173 142 59 158 134 59 85 80 60 4 1 5 6 9 5 
+202 206 211 252 252 252 255 255 255 249 254 246 253 255 254 254 255 251 251 251 251 254 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 57 58 61 101 91 62 158 124 54 158 127 55 158 127 55 156 126 54 158 125 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+198 102 49 198 102 49 210 102 46 212 101 45 211 99 45 210 102 46 210 102 46 208 103 45 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 
+250 252 254 254 255 251 250 252 246 255 254 255 219 227 224 125 131 132 21 19 24 0 3 1 
+0 0 0 4 1 5 0 1 1 4 2 1 48 49 51 109 102 83 164 144 50 173 142 59 
+173 145 52 173 142 59 166 144 56 169 138 59 169 141 58 169 141 58 169 138 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 214 206 175 253 252 247 169 144 61 173 142 59 169 138 59 166 144 56 169 141 58 
+169 138 59 169 141 58 169 141 58 165 143 59 165 143 59 166 144 56 109 102 83 0 1 1 
+21 19 24 230 230 230 250 252 246 255 255 253 253 253 255 253 253 255 254 255 251 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 62 63 101 91 62 158 124 56 156 126 54 158 127 55 156 126 54 159 126 56 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+207 105 48 207 105 48 211 102 45 212 104 43 211 99 45 211 102 45 211 102 45 211 102 45 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 252 252 252 252 252 252 
+252 252 252 254 252 244 219 227 224 97 100 105 0 3 1 4 1 5 4 2 1 4 1 5 
+48 49 51 81 77 81 48 49 51 4 1 5 0 3 1 0 0 0 62 66 56 142 120 69 
+166 134 56 173 142 59 173 142 59 173 138 52 168 136 64 169 141 58 173 142 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 144 61 253 255 254 214 206 175 169 138 59 169 144 61 166 134 56 166 144 56 
+173 142 59 169 138 59 166 144 56 165 143 59 173 142 59 173 138 52 164 144 50 109 102 83 
+4 1 5 48 49 51 241 240 247 255 255 253 252 252 252 254 255 255 255 255 253 249 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 62 63 101 91 62 159 126 56 156 126 54 158 126 53 156 126 54 159 126 56 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+210 102 46 211 102 45 212 104 43 210 99 44 211 99 45 211 102 45 212 104 43 212 104 43 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 253 253 253 253 253 253 252 252 252 255 255 255 
+255 254 255 110 110 107 0 0 0 4 1 5 0 0 0 62 66 62 128 100 96 159 134 56 
+173 138 52 169 144 61 164 144 50 166 134 56 142 120 69 62 61 67 4 1 5 0 3 1 
+109 102 83 165 143 59 173 142 59 169 138 59 166 144 56 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+173 138 52 169 141 58 214 206 175 255 255 253 182 158 106 169 141 58 169 141 58 169 144 61 
+166 134 56 169 141 58 173 145 52 169 138 59 173 142 59 173 142 59 169 141 58 165 143 59 
+94 90 61 0 1 1 97 100 105 253 253 255 255 255 253 255 254 255 249 254 246 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 62 63 101 91 62 159 126 56 156 126 54 158 126 53 156 126 54 159 126 56 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+212 101 45 211 99 45 210 99 44 212 101 45 211 102 45 211 102 45 211 102 45 209 99 39 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 230 230 230 
+48 49 51 4 1 5 4 2 1 4 1 5 109 102 83 165 143 59 164 144 50 165 143 59 
+169 144 61 168 136 64 173 142 59 166 144 56 169 141 58 169 144 61 109 102 83 4 2 1 
+0 0 0 109 102 83 165 143 59 173 142 59 169 141 58 169 144 61 164 144 50 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+168 136 64 169 141 58 169 144 61 242 238 229 242 238 229 168 136 64 169 144 61 166 134 56 
+169 144 61 169 144 61 169 141 58 173 145 52 169 138 59 165 143 59 169 144 61 173 138 52 
+168 136 64 71 65 56 0 3 1 172 178 183 254 251 252 253 252 247 254 255 251 248 251 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 62 63 101 91 62 158 124 56 156 126 54 158 126 53 156 126 54 158 125 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+212 101 45 211 99 45 212 101 45 210 102 46 210 102 46 210 102 46 211 102 45 212 104 43 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 62 65 65 
+0 0 0 0 1 1 0 0 0 142 120 69 169 144 61 173 138 52 169 144 61 168 136 64 
+173 145 52 169 141 58 169 138 59 169 138 59 173 138 52 169 138 59 169 138 59 142 120 69 
+0 0 0 4 1 5 142 120 69 164 144 50 173 142 59 169 144 61 165 143 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 166 134 56 169 144 61 178 172 162 254 251 249 178 172 162 169 144 61 166 144 56 
+169 138 59 169 141 58 166 144 56 169 138 59 166 144 56 169 144 61 169 141 58 169 141 58 
+173 142 59 148 133 63 0 3 1 21 19 24 242 238 229 254 252 244 254 254 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 62 63 101 91 62 158 124 56 156 126 54 158 126 53 156 126 54 158 125 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+210 102 46 210 102 46 211 102 45 210 102 46 210 102 46 207 105 48 210 102 46 211 102 45 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 254 254 254 254 254 254 254 254 254 125 131 132 0 1 1 
+4 1 5 4 2 1 128 100 96 165 143 59 173 142 59 168 136 64 173 145 52 166 144 56 
+168 136 64 169 141 58 168 136 64 169 144 61 173 142 59 169 138 59 168 136 64 169 141 58 
+142 120 69 4 2 1 48 49 51 165 143 59 169 138 59 169 138 59 169 144 61 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 173 142 59 169 141 58 169 144 61 250 247 249 254 255 251 158 134 59 173 142 59 
+169 144 61 173 138 52 173 142 59 169 144 61 169 141 58 169 138 59 169 141 58 166 144 56 
+169 138 59 164 144 50 109 102 83 4 2 1 110 110 107 253 252 247 255 253 254 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 64 64 101 91 62 158 124 56 156 126 54 158 126 53 156 126 54 158 125 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+210 102 46 210 102 46 212 101 45 211 102 45 210 102 46 210 102 46 211 102 45 212 101 45 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 219 227 224 21 19 24 0 0 0 
+0 1 1 101 91 62 165 143 59 173 145 52 168 136 64 166 144 56 173 145 52 169 138 59 
+173 142 59 165 143 59 166 144 56 169 141 58 166 134 56 164 144 50 173 145 52 169 141 58 
+169 144 61 88 95 83 0 3 1 128 100 96 173 138 52 169 138 59 169 144 61 166 144 56 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 144 61 173 138 52 168 136 64 178 172 162 253 255 254 224 220 212 173 142 59 
+173 138 52 173 142 59 169 138 59 169 141 58 169 141 58 169 141 58 169 138 59 166 144 56 
+169 141 58 169 144 61 168 136 64 4 2 1 4 1 5 230 230 230 253 252 247 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 64 64 58 62 65 156 160 157 254 255 255 255 253 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 156 160 157 
+58 64 64 58 64 64 101 91 62 158 124 56 156 124 53 158 126 53 156 126 54 158 125 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+210 102 46 210 102 46 212 104 43 212 104 43 212 101 45 211 102 45 212 101 45 211 99 45 
+211 102 45 212 101 45 85 80 60 58 62 63 53 60 64 202 204 206 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 252 247 249 254 254 254 255 251 255 254 255 254 255 255 97 100 105 4 2 1 4 1 5 
+4 1 5 148 133 63 169 141 58 169 138 59 166 144 56 165 143 59 166 134 56 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 138 59 48 49 51 81 77 81 169 141 58 169 141 58 173 138 52 169 141 58 
+169 144 61 164 144 50 169 141 58 165 143 59 165 143 59 169 144 61 169 138 59 169 141 58 
+173 142 59 169 138 59 166 144 56 164 144 50 169 144 61 242 238 229 254 255 255 182 158 106 
+168 136 64 173 138 52 169 144 61 169 144 61 168 136 64 166 144 56 169 144 61 169 141 58 
+169 141 58 164 144 50 165 143 59 109 102 83 4 1 5 88 95 83 253 255 254 255 253 254 
+255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 62 65 58 62 65 152 161 158 253 253 253 254 252 251 254 255 255 
+255 255 255 252 252 252 254 254 254 255 255 255 253 255 254 254 255 255 253 255 254 253 255 254 
+254 254 254 255 255 255 252 252 252 254 254 254 252 252 252 255 255 255 254 255 255 253 253 253 
+254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 254 254 254 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 253 253 255 254 254 255 
+254 254 253 255 255 253 255 255 255 252 252 252 254 254 254 255 255 255 251 251 251 255 255 253 
+252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 254 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 253 255 254 253 255 254 249 254 254 
+255 255 253 255 255 253 254 254 253 252 252 252 253 253 253 255 255 255 255 255 255 253 253 255 
+255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 255 255 255 
+254 254 254 254 254 254 254 254 254 254 255 255 254 254 254 255 255 255 253 253 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+253 253 253 255 255 255 252 252 252 253 253 253 255 255 255 254 254 254 254 254 254 254 254 254 
+254 255 255 254 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 253 254 255 255 253 254 255 251 255 255 253 255 255 253 251 251 251 255 255 253 254 255 251 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 254 254 254 
+253 255 254 254 255 255 255 255 255 252 252 252 255 255 255 253 253 253 253 253 253 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 
+255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+254 252 251 255 255 253 255 255 253 251 251 251 255 255 253 255 255 253 253 252 247 254 255 251 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+209 105 45 210 102 46 85 80 60 58 62 63 57 63 63 202 204 206 254 254 254 253 255 254 
+254 252 250 255 255 253 255 255 255 253 255 254 250 252 254 254 255 255 253 253 253 255 255 255 
+253 253 253 254 255 255 253 253 255 250 252 254 254 255 255 255 255 255 254 252 251 255 255 253 
+255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+254 252 251 254 252 250 255 255 253 255 255 255 254 255 255 253 253 253 255 255 255 255 254 255 
+255 254 255 254 251 252 254 251 249 255 255 253 251 251 251 255 255 253 249 252 251 255 255 253 
+254 255 255 254 255 255 254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 
+253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 251 251 251 255 255 255 252 252 252 252 252 252 255 255 255 255 255 255 
+253 253 253 255 255 255 253 253 255 253 253 253 255 255 253 255 255 253 252 252 252 253 255 254 
+254 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 253 255 254 254 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 254 254 254 
+255 253 254 255 255 253 254 255 251 254 255 251 248 254 252 249 252 251 254 255 255 254 251 252 
+252 252 252 254 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 253 253 255 254 255 251 253 253 255 219 227 224 0 3 1 4 1 5 0 1 1 
+101 91 62 165 143 59 169 138 59 169 138 59 166 144 56 169 141 58 173 142 59 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 141 58 109 102 83 4 2 1 158 134 59 169 141 58 169 141 58 169 141 58 
+168 136 64 173 142 59 173 142 59 169 141 58 169 138 59 169 138 59 173 138 52 169 138 59 
+165 143 59 173 142 59 168 136 64 173 142 59 169 138 59 178 172 162 253 253 255 255 255 255 
+169 144 61 169 144 61 169 138 59 169 138 59 166 144 56 166 144 56 169 138 59 166 144 56 
+166 144 56 148 133 63 128 113 57 109 102 83 4 1 5 4 2 1 224 220 212 255 255 255 
+255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 101 91 62 58 65 69 58 62 65 152 161 158 255 255 255 255 255 253 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 255 255 253 255 255 253 251 251 251 
+255 255 253 251 251 251 255 255 253 255 255 253 254 254 253 255 255 255 253 253 253 252 252 252 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 252 252 252 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 
+253 255 254 253 253 253 254 255 255 252 252 252 252 252 252 253 255 254 253 255 254 255 255 253 
+255 255 253 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 251 251 251 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 251 251 251 
+255 255 255 251 251 251 255 255 255 255 255 255 254 254 253 255 255 253 250 250 247 251 251 251 
+253 253 253 255 255 255 252 252 252 255 255 255 255 255 255 251 251 251 251 251 251 255 255 255 
+255 255 255 254 254 254 254 254 254 253 253 253 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 252 252 252 255 255 255 254 254 254 251 251 251 255 255 255 255 253 254 
+254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 255 255 255 251 251 251 253 253 253 255 255 255 255 255 255 
+252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 252 252 252 253 253 253 
+253 255 254 253 253 253 252 252 252 253 255 254 254 255 255 253 253 255 253 253 255 253 253 253 
+255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 253 253 253 255 255 255 253 253 253 
+253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 
+253 253 253 254 254 254 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 252 252 252 252 252 252 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 
+252 252 252 253 253 253 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 253 253 253 
+254 254 254 253 253 253 253 255 254 254 255 255 253 253 255 253 253 255 253 255 254 253 255 254 
+254 254 254 253 253 253 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+209 105 45 210 99 44 85 80 60 58 64 64 53 60 64 202 204 206 255 255 255 253 255 254 
+254 255 255 254 255 255 253 253 253 253 255 254 254 255 255 253 255 254 255 255 253 252 252 252 
+255 255 253 251 251 251 255 255 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 253 253 253 
+253 255 254 254 255 255 253 255 254 253 255 254 249 252 251 253 255 254 249 252 251 254 254 254 
+253 255 254 253 255 254 254 255 255 254 255 255 253 255 254 253 253 255 255 255 255 253 253 255 
+253 255 254 253 253 253 255 255 255 255 255 255 252 252 252 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 252 252 252 
+255 255 255 253 253 253 254 254 254 255 255 255 251 251 251 254 254 254 254 254 254 255 254 255 
+254 254 254 253 253 253 254 254 254 251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 252 252 252 255 254 255 254 251 254 255 254 255 251 251 251 255 254 255 255 254 255 
+253 253 253 254 254 254 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 252 252 252 
+254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 
+251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 252 252 252 
+255 255 255 255 253 254 255 254 255 255 254 255 253 253 255 255 255 255 254 254 255 255 253 254 
+254 255 255 254 254 254 255 255 255 255 255 255 253 253 253 254 254 254 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 251 251 251 255 255 255 254 255 251 88 95 83 0 3 1 0 3 1 4 2 1 
+168 136 64 164 144 50 173 142 59 173 142 59 169 141 58 169 141 58 166 144 56 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 141 58 142 120 69 0 0 0 142 120 69 173 138 52 173 142 59 169 141 58 
+169 138 59 173 138 52 173 138 52 169 141 58 169 138 59 173 142 59 164 144 50 169 144 61 
+164 144 50 173 142 59 169 138 59 169 141 58 173 142 59 169 144 61 250 247 249 249 254 254 
+241 240 247 165 143 59 173 138 52 173 145 52 166 144 56 169 141 58 173 142 59 158 134 59 
+109 102 83 68 69 75 4 1 5 0 3 1 0 0 0 4 1 5 97 100 105 253 255 254 
+255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 94 90 61 58 62 65 57 61 64 156 160 157 253 253 253 255 253 254 254 255 255 
+253 253 253 255 255 255 253 253 253 255 254 255 255 255 253 254 252 251 255 255 253 254 255 251 
+254 255 251 254 252 251 254 252 251 254 252 251 254 254 253 252 252 252 252 252 252 255 255 255 
+251 251 251 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 254 255 255 254 255 255 254 255 251 252 252 252 255 255 253 249 252 251 
+255 255 255 254 254 254 252 252 252 255 255 255 250 250 247 253 253 253 255 255 255 254 254 254 
+251 251 251 253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+253 253 253 254 254 254 252 252 252 255 254 255 254 252 250 255 255 253 254 255 251 254 255 251 
+252 252 252 255 255 255 253 253 253 252 252 252 255 255 255 255 255 255 255 255 255 254 254 254 
+254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 254 251 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 254 254 254 251 251 251 255 255 255 255 255 255 251 251 251 
+255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 
+253 253 253 255 255 253 255 255 253 253 255 254 250 252 254 255 255 255 254 254 255 255 255 255 
+253 253 253 255 255 255 252 252 252 253 253 253 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 253 253 253 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 251 251 251 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 254 254 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 252 252 252 253 253 253 254 254 254 252 252 252 255 255 255 
+255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 254 254 254 252 252 252 
+254 254 254 255 255 255 255 255 255 255 255 255 250 252 254 254 255 255 253 253 255 249 254 254 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 213 105 50 85 80 60 58 62 63 58 65 69 202 204 206 253 253 253 253 253 253 
+253 255 254 253 253 253 254 255 255 253 253 253 254 252 251 254 254 253 251 251 251 254 254 253 
+255 255 253 255 255 253 255 255 253 254 252 250 255 255 253 254 254 254 255 255 255 253 253 255 
+255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 251 251 251 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 251 251 251 251 251 251 255 255 255 254 254 254 255 255 255 
+248 254 253 249 254 254 254 255 255 254 255 255 249 254 254 253 255 254 255 255 253 251 251 251 
+252 252 252 252 252 252 254 254 254 254 254 254 255 254 255 254 251 252 255 255 255 254 254 254 
+255 255 255 253 253 253 253 253 253 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 
+252 252 252 255 255 255 255 255 255 253 253 253 252 252 252 255 255 255 255 253 254 250 247 249 
+255 255 255 255 255 255 255 255 255 252 252 252 254 254 254 254 254 254 254 254 254 255 255 255 
+254 255 251 249 252 251 248 251 253 254 255 255 249 252 251 253 253 253 255 255 255 254 251 254 
+255 255 255 251 251 251 255 255 255 255 255 255 254 251 252 254 254 254 253 253 253 255 255 255 
+255 255 255 252 252 252 254 254 254 251 251 251 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 251 251 251 254 254 254 252 252 252 255 255 255 
+254 255 255 252 252 252 249 252 251 254 255 255 253 255 254 253 255 254 254 255 255 254 255 255 
+249 254 254 252 252 252 255 255 253 255 253 254 255 255 255 253 253 255 252 252 252 255 255 253 
+252 252 252 255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 255 255 250 252 254 242 238 229 21 19 24 4 1 5 0 3 1 109 102 83 
+169 141 58 173 145 52 169 138 59 169 141 58 169 141 58 169 138 59 166 144 56 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 134 56 173 142 59 169 144 61 0 3 1 88 95 83 166 134 56 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 166 144 56 166 144 56 169 138 59 169 138 59 169 141 58 
+169 144 61 165 143 59 169 144 61 166 144 56 164 134 50 173 145 52 178 172 162 255 253 254 
+253 255 254 224 220 212 165 143 59 168 136 64 165 143 59 169 141 58 166 134 56 109 102 83 
+140 141 138 255 255 255 172 178 183 0 0 0 6 9 5 4 1 5 4 2 1 219 227 224 
+253 253 253 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 101 91 62 62 65 65 58 62 65 156 160 157 255 255 255 254 251 252 252 252 252 
+253 253 253 255 255 255 251 251 251 254 254 254 253 253 253 254 254 254 255 255 255 255 255 255 
+254 255 255 252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 252 251 
+255 255 255 253 253 253 254 254 254 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 251 251 251 255 255 255 255 255 255 255 255 255 253 253 253 252 252 252 254 254 254 
+255 254 255 250 247 249 255 253 254 255 254 255 251 251 251 255 254 255 254 251 252 255 254 255 
+253 253 255 254 254 255 255 255 255 254 254 253 255 255 253 254 254 253 251 251 251 255 254 255 
+255 255 255 252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 253 253 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 251 251 251 255 255 253 255 255 253 
+254 255 255 249 252 251 254 255 255 254 254 254 253 253 253 254 254 254 255 255 255 255 255 255 
+255 255 255 254 254 254 252 252 252 252 252 252 254 254 254 254 254 254 254 254 254 255 255 255 
+253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 254 254 254 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 
+255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 
+255 254 255 255 255 255 254 254 254 255 255 255 251 251 251 254 254 254 254 254 254 252 252 252 
+255 255 253 251 251 251 253 252 247 254 255 251 255 255 253 255 255 253 250 250 247 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 252 252 252 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 252 252 252 255 255 255 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 253 254 252 250 254 251 249 255 255 253 254 252 251 255 255 253 250 250 247 255 255 253 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 210 102 46 85 80 60 58 64 64 58 62 65 202 204 206 254 254 254 255 255 255 
+253 253 253 255 254 255 255 253 254 255 255 253 254 251 249 255 253 254 255 254 255 255 254 255 
+253 253 253 254 255 255 254 252 251 255 255 253 254 252 251 255 254 255 253 253 253 255 255 255 
+251 251 251 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 
+255 255 255 255 254 255 254 251 252 255 254 255 255 255 255 253 253 253 251 251 251 255 255 253 
+254 252 251 255 255 253 254 252 251 254 252 251 254 252 250 254 254 253 254 255 251 253 252 247 
+255 255 255 253 253 253 255 255 255 254 254 254 251 251 251 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 253 253 253 
+254 254 254 254 254 254 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 255 254 255 
+251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 
+253 252 247 254 255 251 255 255 253 253 253 253 252 252 252 255 255 253 249 252 251 255 255 253 
+251 251 251 255 255 255 253 253 253 253 253 253 254 254 254 255 255 255 254 254 254 254 254 254 
+255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 
+255 255 255 252 252 252 255 255 255 254 254 254 254 254 254 254 254 254 254 255 255 253 253 253 
+248 254 252 255 255 253 254 254 253 255 255 253 255 255 255 253 255 254 255 255 253 253 252 247 
+255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 250 252 254 253 255 254 125 131 132 4 1 5 0 3 1 0 1 1 148 133 63 
+173 142 59 169 141 58 165 143 59 166 144 56 169 141 58 169 144 61 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 166 134 56 173 142 59 88 95 83 0 1 1 168 136 64 169 141 58 169 138 59 
+173 145 52 168 136 64 142 120 69 88 95 83 21 19 24 0 0 0 6 9 5 21 19 24 
+109 102 83 142 120 69 159 134 56 169 144 61 169 144 61 173 142 59 173 142 59 241 240 247 
+255 253 254 254 255 255 224 220 212 169 144 61 169 141 58 169 141 58 169 144 61 21 19 24 
+113 113 120 241 240 247 140 141 138 0 0 0 0 0 0 4 2 1 4 2 1 97 100 105 
+255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 101 91 62 58 62 63 58 62 65 154 157 157 255 255 255 255 254 255 253 255 254 
+254 254 253 250 250 247 254 255 255 254 255 255 253 253 255 202 206 211 202 204 206 202 206 211 
+202 206 211 202 206 211 241 240 247 254 255 255 253 253 255 255 255 255 252 252 252 255 255 253 
+253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 250 247 249 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 253 255 255 255 255 255 255 250 252 254 230 230 230 202 206 211 202 204 206 202 204 206 
+202 206 211 224 220 212 253 255 254 253 253 253 253 253 253 255 255 255 253 253 253 255 255 255 
+254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 
+254 254 253 255 255 255 252 252 252 254 255 255 241 240 247 202 206 211 202 206 211 202 204 206 
+202 204 206 230 230 230 253 253 255 254 255 255 250 252 254 255 255 255 252 252 252 253 253 253 
+253 255 254 252 252 252 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 254 255 255 
+255 255 255 255 255 255 254 255 255 253 253 253 253 255 254 255 255 255 255 255 255 251 251 251 
+254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 252 252 252 
+255 254 255 255 255 255 254 254 254 254 255 255 253 255 254 253 255 254 254 255 255 254 254 254 
+202 204 206 202 206 211 202 204 206 202 204 206 219 227 224 251 251 251 255 255 253 254 255 251 
+254 255 255 253 253 253 253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 253 255 254 
+255 255 255 255 255 255 254 254 254 252 252 252 254 254 254 255 255 255 252 252 252 254 255 255 
+255 255 255 253 253 253 254 254 254 254 254 254 253 253 253 255 255 255 255 255 255 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 
+253 253 253 255 255 255 254 254 254 255 255 255 253 255 254 254 255 255 254 255 255 230 230 230 
+202 204 206 202 204 206 202 206 211 202 206 211 224 220 212 254 254 253 255 255 253 250 250 247 
+252 252 252 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 210 102 46 84 69 58 58 62 63 56 66 64 202 204 206 255 255 255 253 253 253 
+255 255 253 254 252 251 254 252 251 255 255 253 255 255 255 241 240 247 202 204 206 202 204 206 
+202 206 211 202 204 206 219 227 224 252 252 252 253 255 254 255 255 255 254 254 254 251 251 251 
+255 255 255 255 255 255 255 255 255 251 251 251 254 254 254 255 255 255 252 252 252 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 252 252 252 252 252 252 255 255 255 
+254 251 249 254 252 251 255 253 254 255 254 255 253 253 255 253 253 255 202 204 206 202 204 206 
+202 204 206 202 204 206 202 204 206 241 240 247 254 255 255 252 252 252 253 252 247 254 255 251 
+252 252 252 254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 253 253 253 255 255 255 251 251 251 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 253 253 253 253 253 253 253 253 253 255 255 255 251 251 251 254 254 254 
+254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 254 254 254 
+255 255 253 255 254 255 213 212 223 202 206 211 202 204 206 202 206 211 202 204 206 219 227 224 
+253 255 254 253 255 254 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 
+253 253 253 251 251 251 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 251 251 251 253 253 253 
+251 251 251 255 255 255 252 252 252 253 253 253 255 255 255 254 254 254 252 252 252 255 255 255 
+241 240 247 202 204 206 202 204 206 202 204 206 202 206 211 202 204 206 255 254 255 255 254 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 253 255 254 241 240 247 21 19 24 4 1 5 0 3 1 109 102 83 165 143 59 
+169 138 59 165 143 59 169 144 61 169 141 58 169 141 58 169 138 59 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 144 61 169 138 59 109 102 83 4 1 5 142 120 69 164 134 50 169 144 61 
+165 143 59 109 102 83 4 1 5 224 220 212 241 240 247 113 113 120 4 1 5 4 2 1 
+0 3 1 6 9 5 142 120 69 168 136 64 166 144 56 173 138 52 173 138 52 214 206 175 
+253 252 247 254 250 255 254 255 251 242 238 229 169 144 61 173 138 52 169 138 59 110 92 61 
+0 0 0 0 0 0 4 1 5 4 1 5 0 0 0 4 1 5 4 1 5 6 9 5 
+242 238 229 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 124 51 101 91 62 58 64 64 58 62 65 156 160 157 255 255 255 255 254 255 253 255 254 
+230 230 230 187 189 188 113 113 120 81 77 81 60 64 65 58 64 64 57 63 63 57 63 63 
+59 60 64 62 65 65 59 60 64 68 69 75 110 110 107 156 160 157 219 227 224 254 255 251 
+254 255 255 254 255 255 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 251 251 251 255 255 255 255 255 255 255 255 255 253 253 253 254 255 255 241 240 247 
+172 178 183 125 131 132 97 100 105 58 67 65 58 64 64 57 63 63 58 64 64 60 64 65 
+59 60 62 59 64 62 62 65 65 88 95 83 113 113 120 160 163 161 230 230 230 253 253 253 
+254 255 255 254 255 255 253 253 253 254 254 254 254 254 254 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 253 255 254 253 253 253 254 255 255 
+224 220 212 160 163 161 110 110 107 68 69 75 62 65 65 57 63 63 57 63 61 59 64 62 
+59 60 62 62 65 65 58 62 63 97 100 105 145 151 154 213 212 223 254 255 255 254 255 255 
+253 253 253 255 255 255 252 252 252 255 255 255 253 253 253 253 255 254 253 253 255 172 178 183 
+145 151 154 110 110 107 110 110 107 113 113 120 172 178 183 230 230 230 254 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 255 255 255 
+252 252 252 254 254 254 253 255 254 230 230 230 172 178 183 113 113 120 88 95 83 60 60 63 
+58 65 69 53 60 64 58 64 64 62 65 65 53 60 64 58 62 65 97 100 105 140 141 138 
+202 206 211 254 255 255 254 255 255 255 255 255 251 251 251 255 255 255 252 252 252 254 255 255 
+254 255 255 241 240 247 187 189 188 145 151 154 110 110 107 110 110 107 140 141 138 160 163 161 
+230 230 230 254 255 255 254 255 255 255 255 255 254 254 254 251 251 251 252 252 252 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 
+254 255 255 254 255 255 241 240 247 187 189 188 140 141 138 97 100 105 57 63 61 59 64 62 
+57 63 63 56 66 64 58 62 65 57 61 64 58 62 65 58 62 63 68 69 75 125 131 132 
+172 178 183 219 227 224 253 253 253 253 253 253 253 255 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 46 212 101 45 85 80 60 58 62 63 56 66 64 202 204 206 253 253 253 254 255 255 
+253 255 254 213 212 223 156 160 157 104 112 110 57 63 61 57 63 61 60 64 65 60 64 65 
+58 62 63 58 64 64 58 62 63 58 64 64 81 77 81 113 113 120 187 189 188 241 240 247 
+254 255 255 252 252 252 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 252 252 252 254 255 255 250 250 247 
+255 255 253 219 227 224 156 160 157 104 112 110 62 70 69 56 66 64 58 64 64 62 65 65 
+56 66 64 57 63 63 56 66 64 57 63 63 56 66 64 104 112 110 145 151 154 187 189 188 
+254 255 255 254 255 255 254 255 255 252 252 252 252 252 252 252 252 252 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 254 255 255 213 212 223 
+156 160 157 110 110 107 110 110 107 104 112 110 156 160 157 224 220 212 254 255 255 254 255 255 
+255 255 255 251 251 251 255 255 255 254 255 255 254 255 255 230 230 230 172 178 183 125 131 132 
+71 81 83 58 62 65 60 61 69 57 61 64 58 64 64 57 63 63 56 66 64 53 60 64 
+60 64 65 81 77 81 125 131 132 178 172 162 230 230 230 249 252 251 254 254 254 253 253 253 
+255 255 255 253 253 253 252 252 252 254 254 254 253 253 253 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 252 252 252 253 253 253 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 187 189 188 145 151 154 110 110 107 57 58 61 
+58 62 65 62 61 67 58 62 63 57 63 61 62 70 69 58 65 69 53 60 64 68 69 75 
+104 112 110 160 163 161 213 212 223 253 255 254 254 255 255 254 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 251 160 163 161 0 0 0 4 1 5 4 2 1 148 133 63 173 142 59 
+173 142 59 169 144 61 169 144 61 166 134 56 173 142 59 169 144 61 165 143 59 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 144 61 148 133 63 4 2 1 109 102 83 169 144 61 169 141 58 
+148 133 63 4 1 5 4 1 5 242 238 229 254 254 255 172 178 183 4 1 5 0 0 0 
+4 2 1 4 1 5 4 1 5 151 135 59 169 141 58 169 144 61 169 138 59 169 144 61 
+253 253 255 254 252 244 254 255 255 253 253 255 255 255 253 182 158 106 169 138 59 168 136 64 
+85 80 60 4 2 1 4 1 5 0 3 1 0 3 1 0 3 1 6 9 5 0 1 1 
+140 141 138 254 254 254 253 253 253 253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 127 54 101 91 62 60 64 65 53 60 64 156 160 157 252 252 252 202 206 211 113 113 120 
+57 63 61 59 64 62 58 62 63 62 65 65 57 58 61 59 64 62 57 63 61 62 66 56 
+59 64 62 59 59 56 59 64 62 58 64 64 60 64 65 57 58 61 58 62 63 97 100 105 
+172 178 183 254 255 255 254 255 255 253 253 253 253 253 253 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 253 253 253 254 255 255 253 255 254 187 189 188 113 113 120 58 64 64 
+60 64 65 58 64 64 53 63 60 56 64 62 60 64 65 57 60 56 58 66 61 59 59 56 
+62 66 56 57 60 56 57 58 61 53 63 60 60 64 65 58 64 64 62 65 65 97 100 105 
+172 178 183 253 253 253 254 255 255 253 253 253 255 255 255 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 250 247 249 254 255 255 253 255 254 187 189 188 97 100 105 
+60 64 65 58 62 63 58 64 64 58 62 63 57 63 61 59 64 62 57 63 61 59 59 56 
+59 64 62 57 58 61 59 64 62 60 64 65 57 58 61 58 62 63 81 77 81 172 178 183 
+254 255 255 251 251 251 252 252 252 255 255 255 254 254 254 187 189 188 71 81 83 57 63 63 
+58 62 63 62 65 65 58 62 63 58 62 63 60 64 65 58 62 63 125 131 132 241 240 247 
+252 252 252 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 202 204 206 125 131 132 58 62 63 57 63 61 62 65 65 57 58 61 60 64 65 
+57 63 61 57 63 61 57 58 61 57 63 61 60 64 65 58 62 65 58 62 65 60 64 65 
+57 63 61 81 77 81 172 178 183 254 254 254 255 255 255 252 252 252 255 255 255 254 255 255 
+172 178 183 68 69 75 58 62 63 58 62 63 58 64 64 57 58 61 58 62 63 58 62 63 
+58 62 63 145 151 154 253 253 255 254 255 255 255 255 255 255 255 255 255 255 255 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 
+202 206 211 125 131 132 60 64 65 58 62 63 58 62 63 57 63 61 62 65 65 57 63 63 
+57 63 61 57 60 56 57 63 61 62 65 65 57 63 61 57 63 63 58 62 65 57 61 64 
+57 58 61 57 58 61 88 95 83 172 178 183 241 240 247 254 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 212 101 45 84 69 58 62 65 65 53 60 64 202 206 211 254 255 255 172 178 183 
+88 95 83 58 64 64 53 63 60 62 70 69 57 63 63 59 64 62 59 59 56 59 59 56 
+66 60 61 59 59 56 62 66 62 60 64 65 57 63 63 57 63 63 62 65 65 57 58 61 
+113 113 120 202 204 206 252 252 252 255 255 255 253 253 253 255 255 255 254 254 254 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 252 252 252 255 255 255 255 255 255 254 255 255 241 240 247 156 160 157 
+88 95 83 57 60 56 57 63 63 56 64 62 56 66 64 59 64 62 57 60 56 59 60 62 
+59 59 56 62 66 62 57 63 61 58 64 64 53 60 64 58 62 65 60 64 65 57 61 64 
+62 70 69 140 141 138 213 212 223 253 255 254 255 255 255 252 252 252 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 252 252 252 255 255 255 254 254 254 213 212 223 104 112 110 58 62 63 
+57 58 61 62 65 65 58 62 63 58 62 63 58 64 64 60 64 65 104 112 110 230 230 230 
+251 251 251 255 255 255 254 255 255 213 212 223 125 131 132 60 64 65 57 58 61 57 58 61 
+54 67 66 58 65 69 57 63 61 59 64 62 62 66 62 57 60 56 57 60 56 62 65 65 
+58 62 63 62 65 65 57 58 61 57 58 61 62 65 65 104 112 110 202 206 211 253 253 253 
+251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 
+254 255 255 224 220 212 125 131 132 68 69 75 58 64 64 62 65 65 58 62 63 62 65 65 
+57 63 63 57 63 61 59 59 56 62 66 56 57 60 56 56 64 62 53 60 64 58 65 69 
+62 65 65 57 58 61 62 65 65 88 95 83 156 160 157 241 240 247 254 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 254 252 244 21 19 24 4 1 5 0 3 1 109 102 83 169 141 58 169 138 59 
+173 145 52 166 144 56 169 138 59 173 142 59 173 142 59 166 144 56 169 144 61 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 164 144 50 169 144 61 169 141 58 21 19 24 62 65 65 169 138 59 169 141 58 
+109 102 83 4 2 1 0 3 1 71 72 69 125 131 132 0 0 0 0 0 0 0 0 0 
+0 1 1 4 1 5 0 0 0 109 102 83 169 144 61 173 138 52 165 143 59 173 142 59 
+224 220 212 254 252 250 249 252 254 254 254 254 254 254 255 249 254 246 242 238 229 182 158 106 
+169 144 61 109 102 83 88 95 83 81 77 81 109 102 83 128 100 96 109 102 83 4 2 1 
+21 19 24 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 126 53 101 91 62 60 64 65 58 62 65 125 131 132 110 110 107 59 60 62 58 64 64 
+60 64 65 57 63 63 58 64 64 57 63 61 59 64 62 71 68 65 72 76 65 72 76 65 
+72 76 65 71 72 69 57 60 56 57 63 61 57 63 63 58 62 63 62 65 65 57 58 61 
+59 64 62 81 77 81 187 189 188 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 254 254 254 187 189 188 88 95 83 58 62 63 62 65 65 58 62 63 
+60 60 63 62 65 65 57 58 61 59 64 62 62 66 62 72 76 65 72 76 65 72 76 65 
+71 72 69 62 70 65 57 63 61 58 65 69 53 60 64 60 64 65 57 63 63 59 64 62 
+59 64 62 81 77 81 172 178 183 255 255 255 251 251 251 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 254 255 255 172 178 183 81 77 81 59 64 62 57 63 61 
+58 62 65 58 62 65 57 63 63 59 64 62 57 63 61 71 72 69 72 76 65 72 76 65 
+71 72 69 62 65 65 57 63 61 58 64 64 60 64 65 58 62 63 60 64 65 59 64 62 
+97 100 105 219 227 224 255 255 255 254 254 254 125 131 132 58 64 64 57 63 61 58 64 64 
+58 64 64 60 64 65 57 63 63 58 64 64 57 63 63 58 64 64 58 64 64 97 100 105 
+241 240 247 251 251 251 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 
+252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 202 204 206 
+110 110 107 62 65 65 58 64 64 57 63 63 57 63 63 58 64 64 57 63 63 58 62 65 
+71 68 65 72 76 65 72 76 65 71 72 69 71 72 69 59 60 62 59 64 62 59 64 62 
+60 64 65 57 63 63 58 64 64 97 100 105 213 212 223 255 255 255 255 255 255 125 131 132 
+58 62 63 58 64 64 58 64 64 57 63 63 57 63 63 58 64 64 57 63 63 58 64 64 
+60 64 65 58 62 63 97 100 105 241 240 247 254 254 254 254 254 254 254 254 253 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 202 206 211 110 110 107 
+58 62 63 58 64 64 58 62 63 60 64 65 57 63 63 60 64 65 53 63 60 56 66 64 
+72 76 65 85 80 60 72 76 65 71 72 69 71 68 65 57 63 61 59 64 62 58 64 64 
+58 64 64 60 64 65 58 62 63 57 58 61 71 72 69 154 157 157 241 240 247 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 212 101 45 85 80 60 57 58 61 58 65 69 140 141 138 81 77 81 59 64 62 
+58 62 65 58 62 65 57 61 64 58 62 65 60 60 63 59 59 56 71 72 69 85 80 60 
+85 80 60 85 80 60 71 68 65 57 63 61 58 64 64 56 66 64 57 63 61 58 64 64 
+57 63 61 59 64 62 110 110 107 230 230 230 254 254 254 255 255 255 254 254 254 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 251 251 251 241 240 247 156 160 157 71 72 69 59 64 62 
+57 61 64 62 70 69 57 61 64 57 63 63 60 64 65 57 60 56 71 72 69 81 77 81 
+97 78 60 84 69 58 81 77 81 62 66 56 57 60 56 60 64 65 57 63 63 60 64 65 
+60 64 65 57 58 61 58 62 63 110 110 107 213 212 223 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 213 212 223 68 69 75 58 64 64 58 64 64 
+58 64 64 57 63 63 57 63 63 58 64 64 58 64 64 57 63 63 57 58 61 71 81 83 
+219 227 224 252 252 252 145 151 154 59 64 62 57 63 61 58 64 64 60 64 65 60 64 65 
+59 64 62 59 59 56 71 68 65 84 69 58 85 80 60 85 80 60 84 69 58 71 65 56 
+58 62 65 57 63 63 58 64 64 60 64 65 57 63 63 58 62 63 59 60 62 110 110 107 
+219 227 224 253 253 253 254 254 254 254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 254 254 254 253 253 253 219 227 224 
+104 112 110 59 64 62 57 63 63 57 63 61 58 64 64 57 63 63 56 66 64 53 60 64 
+59 59 56 81 77 81 84 69 58 85 80 60 85 80 60 71 68 65 62 66 56 57 60 56 
+57 63 63 58 64 64 53 63 60 57 63 63 58 64 64 71 72 69 156 160 157 241 240 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 253 253 253 255 255 255 253 253 253 
+255 253 254 187 189 188 4 2 1 0 0 0 48 49 51 168 136 64 173 142 59 169 144 61 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+165 143 59 173 142 59 173 138 52 173 138 52 88 95 83 0 0 0 148 133 63 173 142 59 
+137 137 94 4 2 1 0 1 1 0 1 1 4 1 5 4 1 5 6 9 5 0 3 1 
+4 1 5 0 3 1 4 2 1 142 120 69 165 143 59 168 136 64 166 144 56 166 144 56 
+214 206 175 255 254 255 249 254 254 253 252 247 255 255 253 254 255 251 255 255 253 255 254 255 
+242 238 229 178 172 162 165 143 59 166 144 56 173 142 59 169 138 59 148 133 63 4 1 5 
+0 0 0 110 110 107 219 227 224 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 101 91 62 59 64 62 59 64 62 57 58 61 58 62 65 56 66 64 56 64 62 
+58 62 65 72 76 65 94 90 61 128 113 57 148 133 63 156 125 56 158 125 54 159 126 56 
+158 125 54 156 128 53 152 127 56 128 113 57 110 92 61 85 80 60 62 66 62 53 60 64 
+53 64 53 58 64 64 62 61 67 113 113 120 241 240 247 255 253 254 254 252 250 249 254 254 
+255 255 255 253 253 253 253 255 254 254 255 255 253 253 253 255 255 255 255 255 255 255 253 254 
+253 252 247 255 254 255 255 254 255 254 255 251 253 255 254 253 255 254 249 254 246 255 255 253 
+253 255 254 230 230 230 110 110 107 59 64 62 56 64 62 56 64 62 57 63 63 58 65 69 
+72 76 65 94 90 61 128 113 57 149 124 53 156 128 53 157 126 52 157 127 54 152 127 56 
+156 126 54 155 128 52 149 124 55 128 113 57 101 91 62 72 73 56 62 65 65 59 60 70 
+50 65 64 58 65 69 57 63 63 97 100 105 202 206 211 254 255 251 253 253 255 254 255 251 
+253 253 253 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 
+255 254 255 253 253 255 241 240 247 104 112 110 57 63 63 62 61 67 60 60 63 54 67 66 
+59 60 62 85 80 60 110 92 61 128 113 57 152 127 56 158 126 53 161 124 50 161 124 50 
+161 124 50 156 124 53 147 124 59 113 104 59 85 80 60 62 65 65 53 60 64 58 65 69 
+59 64 62 68 69 75 187 189 188 178 172 162 59 59 56 57 63 61 59 60 62 62 70 69 
+101 91 62 113 104 59 128 113 57 101 91 62 85 80 60 57 63 61 54 67 66 62 61 67 
+140 141 138 253 253 255 254 254 254 255 254 255 255 255 255 254 254 254 254 254 254 254 254 254 
+254 255 251 249 254 254 248 254 253 250 252 254 255 254 255 254 255 251 140 141 138 58 66 61 
+53 60 64 62 65 65 59 59 56 60 60 63 71 72 69 101 91 62 128 113 57 158 125 54 
+157 124 59 155 126 57 155 128 52 155 128 52 156 128 53 147 124 59 128 99 63 97 78 60 
+60 64 65 54 67 66 54 64 59 59 60 64 60 64 65 172 178 183 172 178 183 58 62 65 
+54 64 59 58 62 65 71 68 65 94 90 61 128 99 63 128 113 57 101 91 62 62 70 65 
+60 60 63 58 65 69 53 60 64 113 113 120 254 255 251 253 253 255 254 254 254 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 253 249 252 254 254 255 251 254 255 251 241 240 247 125 131 132 54 64 59 62 65 65 
+53 60 64 58 62 65 57 60 56 71 65 56 94 90 61 113 104 59 147 124 59 158 127 55 
+158 125 54 158 124 56 158 124 56 158 125 54 158 127 55 147 124 59 128 113 57 110 92 61 
+85 80 60 62 61 67 57 61 64 59 64 62 57 63 61 58 62 65 68 69 75 187 189 188 
+254 255 251 254 254 255 253 253 255 255 255 255 255 255 253 254 255 255 254 254 254 255 255 253 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 217 104 40 84 69 58 57 60 56 62 61 67 56 64 62 50 65 64 62 61 67 
+57 63 61 62 66 62 84 69 58 128 93 57 174 105 47 207 105 48 211 99 45 209 105 45 
+211 102 45 212 101 45 213 100 46 210 105 51 155 104 59 112 79 60 71 68 65 58 59 68 
+57 61 64 56 66 64 57 63 63 68 69 75 178 172 162 255 255 255 250 252 254 254 255 251 
+253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 253 253 253 255 253 254 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 
+252 252 252 254 255 255 255 255 253 187 189 188 71 81 83 58 62 65 57 60 70 60 64 65 
+56 64 62 66 60 61 97 78 60 128 93 57 174 105 47 210 99 44 213 103 41 207 105 38 
+210 105 51 210 102 46 212 101 45 210 102 46 185 105 60 142 101 66 112 79 60 71 68 65 
+58 65 69 53 60 64 60 64 65 66 60 61 62 66 56 145 151 154 241 240 247 254 251 249 
+253 255 254 254 255 251 253 255 254 254 255 255 254 254 253 254 254 253 253 253 255 248 254 252 
+248 254 252 255 255 253 249 254 246 230 230 230 81 77 81 53 60 64 62 66 56 57 60 56 
+112 79 60 142 101 66 155 104 59 128 93 57 97 78 60 53 63 60 54 67 66 58 65 69 
+71 81 83 97 100 105 57 60 56 60 60 63 58 65 69 54 67 66 84 69 58 128 93 57 
+174 105 47 198 102 49 219 98 50 211 99 45 208 103 45 210 99 51 213 100 46 210 105 40 
+210 102 46 174 105 47 112 79 60 71 72 69 59 60 62 57 60 56 58 66 61 57 63 61 
+62 61 67 156 160 157 253 252 247 253 255 254 253 253 255 253 255 254 254 255 251 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 
+253 252 247 255 255 255 249 252 254 253 252 247 254 255 251 241 240 247 145 151 154 53 64 53 
+53 63 60 57 63 61 57 63 61 53 60 64 62 61 67 97 78 60 155 104 59 174 105 47 
+213 100 46 211 102 45 212 104 43 209 99 39 207 105 38 210 105 51 198 102 49 174 105 47 
+128 93 57 97 78 60 59 64 62 57 61 64 58 62 65 58 62 65 57 63 63 68 69 75 
+172 178 183 249 254 254 255 255 255 254 251 249 253 252 247 253 255 254 254 255 255 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 
+255 255 255 81 77 81 0 0 0 0 0 0 109 102 83 165 143 59 166 134 56 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 169 138 59 169 141 58 173 142 59 109 102 83 0 3 1 128 99 63 173 142 59 
+166 144 56 81 77 81 4 1 5 0 3 1 0 1 1 0 0 0 4 1 5 4 2 1 
+0 1 1 4 1 5 71 68 65 158 134 59 173 142 59 173 142 59 173 145 52 169 141 58 
+178 172 162 254 251 252 253 255 254 254 255 251 254 251 252 254 254 253 255 255 253 253 253 255 
+248 254 253 255 254 255 254 251 254 242 238 229 178 172 162 182 158 106 137 137 94 71 68 65 
+0 1 1 0 0 0 0 0 0 60 60 63 172 178 183 253 253 253 252 252 252 255 255 255 
+252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 128 53 101 91 62 62 61 67 58 65 69 56 64 62 58 67 65 59 60 62 97 78 60 
+128 113 57 157 124 59 158 134 59 157 126 52 161 124 50 157 126 52 158 127 55 152 124 51 
+158 125 54 159 126 56 159 126 56 158 124 56 155 128 52 151 135 59 142 120 69 101 91 62 
+71 68 65 58 62 65 53 60 64 57 63 61 97 100 105 224 220 212 249 254 246 254 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 
+254 255 251 253 253 255 254 255 251 254 255 251 251 251 251 253 253 255 255 255 253 253 253 255 
+172 178 183 71 72 69 58 65 69 58 62 63 60 64 65 58 62 65 94 90 61 128 113 57 
+150 126 55 155 127 54 156 126 54 159 126 56 158 124 54 157 124 59 156 125 56 158 124 54 
+158 126 53 156 124 53 157 124 59 156 124 53 154 129 46 151 135 55 128 113 57 85 80 60 
+71 68 65 57 60 56 62 61 67 58 65 54 56 64 62 154 157 157 255 254 255 253 255 254 
+255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 254 254 254 253 253 253 253 253 253 251 251 251 255 255 255 254 254 254 255 255 255 
+255 255 253 202 204 206 71 72 69 53 60 64 62 65 65 59 64 62 62 66 56 101 91 62 
+147 124 59 155 126 57 156 125 56 161 124 50 158 126 53 158 126 53 156 125 56 157 124 59 
+155 126 57 155 126 57 157 124 59 159 126 56 156 126 54 128 113 57 94 90 61 58 62 63 
+54 64 59 57 60 70 57 63 61 71 72 69 62 61 67 57 60 70 84 69 58 149 124 53 
+155 128 52 161 124 50 157 124 59 155 128 52 152 127 56 101 91 62 59 60 64 58 66 61 
+60 64 65 230 230 230 254 254 254 251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 
+253 253 253 255 255 253 253 253 255 254 255 251 241 240 247 97 100 105 62 65 65 51 61 71 
+50 65 64 57 61 64 94 90 61 142 120 69 152 127 56 155 127 54 157 124 59 155 126 57 
+161 124 50 158 127 55 156 125 56 156 124 53 158 124 53 158 127 55 152 127 56 150 126 55 
+149 124 53 101 91 62 58 65 69 53 63 60 62 61 67 57 63 61 71 72 69 58 62 65 
+62 65 65 85 80 60 142 120 69 157 124 59 156 125 56 158 132 49 156 125 56 152 127 56 
+97 78 60 60 61 69 58 67 65 59 64 62 202 204 206 251 251 251 255 255 255 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 254 254 254 255 255 255 224 220 212 81 77 81 57 63 61 62 70 69 53 60 64 
+58 62 65 85 80 60 128 99 63 155 126 57 157 126 52 156 128 53 158 134 59 149 124 53 
+155 128 52 155 128 52 155 128 52 157 126 52 158 125 54 158 125 54 156 126 54 155 127 54 
+157 124 59 128 113 57 101 91 62 62 66 62 58 59 68 58 62 65 54 64 59 59 64 62 
+125 131 132 241 240 247 254 255 251 254 255 251 253 253 255 255 255 255 254 255 251 254 254 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 210 99 51 85 80 60 66 60 61 53 60 64 58 62 65 62 70 69 71 65 56 
+128 93 57 185 105 60 217 105 50 212 104 43 207 99 38 213 100 46 217 105 50 213 100 46 
+207 99 48 208 103 45 207 105 38 207 99 38 213 103 41 217 105 50 198 102 49 174 105 47 
+85 80 60 59 59 56 57 63 63 62 66 62 57 58 61 125 131 132 253 255 254 253 253 253 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 242 238 229 113 113 120 62 66 56 57 58 61 59 59 56 62 66 56 71 68 65 
+128 93 57 185 105 60 217 105 50 213 103 41 207 105 38 213 100 52 213 100 46 209 105 45 
+213 103 41 208 103 45 208 103 45 210 99 44 212 104 43 212 101 45 213 100 46 212 101 45 
+155 104 59 97 78 60 57 58 63 53 67 71 58 59 64 60 60 63 88 95 83 219 227 224 
+255 254 255 254 251 249 255 255 253 254 255 251 253 252 247 253 255 254 249 254 254 254 255 251 
+254 255 251 248 251 253 254 255 251 125 131 132 59 59 56 53 64 53 62 66 62 155 104 59 
+213 105 50 209 99 39 208 103 45 213 105 46 213 103 41 155 104 59 71 65 56 58 59 68 
+62 65 65 53 60 64 62 61 67 59 64 62 84 69 58 155 104 59 211 102 45 207 99 48 
+200 101 40 213 105 46 217 104 40 211 104 39 212 104 43 212 101 45 213 100 46 213 100 46 
+212 98 39 213 105 46 213 103 41 211 104 39 174 105 47 112 79 60 62 61 67 60 61 69 
+54 67 66 57 63 61 125 131 132 241 240 247 254 251 249 254 252 251 253 255 254 249 254 254 
+252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 253 253 253 255 255 255 
+255 254 255 249 254 246 255 255 253 254 250 255 219 227 224 71 81 83 62 66 62 62 61 67 
+58 59 68 58 65 69 85 80 60 155 104 59 210 102 46 217 105 50 213 100 46 213 100 46 
+213 103 41 211 102 45 211 102 45 210 102 46 210 102 46 216 99 44 213 100 46 207 99 38 
+207 99 48 213 103 41 198 102 49 128 93 57 71 68 65 59 60 64 62 61 67 54 64 59 
+62 66 56 113 113 120 241 240 247 253 253 253 255 254 255 255 255 255 248 254 252 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 
+219 227 224 0 0 0 4 2 1 0 1 1 168 136 64 165 143 59 169 144 61 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 138 59 173 142 59 148 133 63 0 3 1 85 80 60 166 144 56 
+173 138 52 151 135 59 81 77 81 4 1 5 0 0 0 4 1 5 4 2 1 4 1 5 
+4 2 1 102 79 82 165 143 59 166 144 56 169 141 58 169 138 59 173 142 59 173 138 52 
+178 172 162 254 255 251 252 252 252 255 255 255 255 254 255 254 255 255 248 254 252 254 255 251 
+255 254 255 254 250 255 254 254 254 248 254 252 248 251 253 255 253 254 254 252 244 248 254 253 
+202 204 206 125 131 132 4 2 1 0 0 0 0 0 0 21 19 24 154 157 157 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 110 92 61 58 59 64 50 65 62 54 64 59 71 65 56 128 99 63 152 127 56 
+156 124 53 158 127 55 156 124 53 158 124 53 159 126 56 158 127 55 156 126 54 156 128 53 
+156 128 53 155 128 52 157 126 52 158 124 53 158 124 53 161 124 50 157 126 52 157 126 52 
+128 113 57 71 72 69 62 65 65 54 64 59 57 63 63 71 72 69 219 227 224 254 255 251 
+254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 
+254 255 255 253 255 254 254 255 251 253 252 247 250 247 249 255 254 255 254 252 251 145 151 154 
+62 65 65 53 63 60 62 66 56 58 62 65 81 77 81 142 120 69 152 124 51 157 124 59 
+159 126 56 157 127 54 152 124 51 158 127 55 155 127 54 158 127 55 156 124 53 158 127 55 
+161 124 50 161 124 50 159 126 56 157 124 59 157 124 59 158 125 54 156 128 53 155 128 52 
+147 124 59 97 78 60 60 61 69 58 64 64 59 59 56 59 64 62 104 112 110 241 240 247 
+255 255 255 252 252 252 253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 
+187 189 188 57 60 56 62 70 69 59 60 64 60 64 65 72 73 56 142 120 69 152 127 56 
+156 124 53 159 126 56 158 124 53 158 124 53 159 126 56 158 124 56 158 127 55 155 126 57 
+161 125 43 157 126 52 156 125 56 156 124 53 158 126 53 159 134 56 147 124 59 128 113 57 
+71 65 56 54 64 59 58 66 61 66 60 61 56 66 64 62 66 62 149 124 53 162 124 55 
+158 124 53 162 124 55 162 125 53 158 124 54 161 125 43 147 124 59 71 68 65 53 63 60 
+53 63 60 160 163 161 255 255 255 255 255 255 250 247 249 255 255 255 255 255 255 253 253 253 
+253 255 254 255 255 253 254 251 249 213 212 223 71 72 69 59 64 62 58 59 64 59 60 70 
+84 69 58 113 104 59 150 128 52 157 126 52 156 126 54 154 129 46 152 124 44 162 124 55 
+157 126 52 156 124 53 157 124 59 159 126 56 162 125 53 161 124 50 157 126 52 158 132 49 
+162 124 52 157 124 59 128 113 57 71 68 65 57 60 56 58 65 69 60 64 65 59 64 62 
+62 66 62 142 120 69 156 128 53 158 124 56 156 128 53 152 124 51 159 126 56 161 124 50 
+152 127 56 84 69 58 57 63 61 57 60 56 125 131 132 254 255 251 255 254 255 152 161 158 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 254 254 255 255 255 254 254 254 254 254 254 251 251 251 255 255 255 252 252 252 254 254 254 
+254 251 249 254 255 251 172 178 183 62 66 62 57 60 56 59 60 70 59 59 56 85 80 60 
+128 113 57 147 124 59 159 126 56 156 124 53 161 124 50 156 124 53 156 124 53 162 125 53 
+157 124 59 156 126 54 156 124 53 158 126 53 159 126 56 158 124 56 158 126 53 155 128 52 
+161 124 50 162 125 53 158 126 53 149 124 53 101 91 62 62 65 65 62 61 67 58 62 65 
+58 62 63 97 100 105 230 230 230 255 255 253 254 255 251 253 252 247 253 253 253 254 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+216 99 44 207 99 48 85 80 60 50 65 64 62 66 62 60 60 63 97 78 60 198 102 49 
+216 99 44 212 104 43 213 100 46 216 99 44 212 101 45 210 102 46 210 102 46 208 103 45 
+209 105 45 208 103 45 211 102 45 210 99 44 212 101 45 210 99 44 211 102 45 211 99 45 
+210 99 44 155 104 59 71 68 65 62 61 67 57 58 61 57 60 70 97 100 105 241 240 247 
+251 251 251 255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 251 251 251 
+230 230 230 97 100 105 58 65 69 57 61 64 62 66 56 56 66 64 128 93 57 209 105 45 
+213 103 41 213 103 41 216 99 44 211 102 45 211 102 45 213 100 46 213 100 46 207 99 48 
+213 100 46 213 100 46 213 105 50 213 100 46 211 99 45 209 99 39 207 105 38 207 105 38 
+211 99 45 210 105 51 155 104 59 84 69 58 54 67 66 57 63 61 53 60 64 68 69 75 
+172 178 183 255 255 253 254 255 255 254 252 250 254 252 244 255 255 253 249 254 254 254 251 249 
+254 252 250 254 254 255 219 227 224 57 63 61 58 68 63 54 64 59 155 104 59 213 100 52 
+212 104 43 213 103 41 213 100 46 209 105 45 210 99 44 210 105 51 112 79 60 59 60 64 
+58 62 65 62 66 56 58 66 61 97 78 60 198 102 49 217 104 40 209 99 39 212 104 43 
+213 100 46 210 102 46 207 99 48 210 102 46 210 99 44 211 104 39 212 101 45 213 100 46 
+210 105 51 211 99 45 212 101 45 207 99 48 216 99 44 213 103 41 155 104 59 84 69 58 
+58 65 69 53 60 64 60 60 63 110 110 107 255 254 255 253 252 247 251 251 251 249 254 254 
+255 255 255 254 254 254 253 253 253 254 254 254 251 251 251 254 254 254 255 255 255 254 254 254 
+250 252 254 251 251 251 253 253 255 172 178 183 81 77 81 57 60 70 54 64 59 53 60 64 
+85 80 60 155 104 59 207 99 48 210 99 44 208 103 45 212 104 43 213 100 46 210 99 51 
+207 105 48 210 102 46 212 101 45 210 102 46 211 99 45 211 99 45 210 102 46 210 102 46 
+213 105 50 209 99 39 209 99 39 213 103 41 207 105 48 112 79 60 62 70 65 66 60 61 
+59 64 62 57 63 61 71 81 83 213 212 223 253 252 247 249 254 254 254 250 255 254 251 249 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 253 253 253 
+125 131 132 4 2 1 4 1 5 109 102 83 173 145 52 166 144 56 169 144 61 173 138 52 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+173 142 59 169 141 58 169 138 59 173 142 59 166 134 56 62 66 62 4 1 5 168 136 64 
+173 142 59 169 141 58 164 144 50 142 120 69 109 102 83 85 80 60 85 80 60 88 95 83 
+128 100 96 166 144 56 168 136 64 173 142 59 169 141 58 169 141 58 169 144 61 169 138 59 
+178 172 162 254 255 251 254 254 253 254 251 252 253 253 255 255 255 253 253 255 254 252 252 252 
+254 255 255 255 254 255 250 250 247 249 254 246 253 255 254 252 252 252 251 251 251 249 254 254 
+253 253 253 255 255 255 230 230 230 140 141 138 48 49 51 0 0 0 0 0 0 21 19 24 
+160 163 161 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 128 52 101 91 62 57 63 61 53 63 60 85 80 60 148 133 63 158 126 53 154 129 46 
+156 128 53 156 128 53 152 124 51 157 127 54 157 124 59 157 124 59 156 124 53 156 124 53 
+157 124 59 156 128 53 155 128 52 156 125 56 157 124 59 158 127 55 156 124 53 158 127 55 
+158 132 49 152 127 56 110 92 61 66 60 61 57 63 61 57 61 64 81 77 81 224 220 212 
+252 252 252 252 252 252 255 255 255 254 254 254 251 251 251 255 255 255 255 255 255 253 253 253 
+255 255 255 252 252 252 254 255 255 253 253 255 255 254 255 251 251 251 125 131 132 56 64 62 
+50 65 62 58 64 64 66 60 61 128 99 63 157 126 52 158 125 54 162 124 55 155 128 52 
+156 124 53 157 126 52 158 126 53 158 125 54 158 124 56 158 125 54 158 126 53 155 128 52 
+157 124 59 157 126 52 156 129 45 155 128 52 155 126 57 156 126 54 156 124 53 162 124 52 
+156 129 45 157 124 59 113 104 59 71 72 69 58 65 69 58 62 65 58 64 64 88 95 83 
+241 240 247 255 255 255 252 252 252 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 
+254 254 254 252 252 252 254 254 254 253 253 253 253 253 253 254 254 254 255 255 255 187 189 188 
+58 66 61 57 60 70 58 62 65 62 66 62 113 104 59 156 124 53 158 127 55 155 128 52 
+155 128 52 156 128 53 155 127 54 155 127 54 158 127 55 156 126 54 156 126 54 155 128 52 
+155 126 57 158 127 55 158 127 55 155 128 52 155 128 52 155 127 54 156 124 53 162 124 52 
+147 124 59 71 72 69 53 63 60 62 65 65 53 63 60 110 92 61 162 124 55 157 126 52 
+158 134 59 155 128 52 155 126 57 157 124 59 161 124 50 156 125 56 101 91 62 58 65 69 
+60 64 65 125 131 132 255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 253 255 254 224 220 212 68 69 75 57 63 61 58 65 69 66 60 61 101 91 62 
+156 129 45 159 126 56 157 124 59 155 128 52 158 127 55 157 124 59 156 125 56 156 128 53 
+158 127 55 156 125 56 152 127 56 155 127 54 157 127 54 158 125 54 157 124 59 157 124 59 
+152 124 51 158 124 53 166 129 59 148 128 46 71 68 65 58 65 69 59 60 62 57 63 61 
+110 92 61 150 128 52 157 124 59 157 124 59 156 129 45 156 125 56 166 129 59 157 124 59 
+161 124 50 128 113 57 60 60 63 58 65 69 59 64 62 255 255 255 255 253 254 152 161 158 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 252 252 252 
+254 255 251 172 178 183 56 66 64 57 63 61 58 65 54 58 62 65 110 92 61 157 124 59 
+156 124 53 159 126 56 158 127 55 156 124 53 156 125 56 157 124 59 158 124 56 158 125 54 
+158 125 54 158 125 54 156 126 54 155 127 54 156 126 54 158 127 55 159 126 56 155 126 57 
+155 128 52 157 124 59 152 124 51 156 125 56 162 124 55 149 124 53 84 69 58 62 61 67 
+57 60 70 57 63 61 68 69 75 219 227 224 253 252 247 254 255 251 255 255 255 249 252 251 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+212 104 43 213 105 46 84 69 58 66 60 61 59 64 62 128 93 57 210 105 51 211 104 39 
+211 104 39 208 103 45 213 100 52 213 100 46 210 105 40 209 105 45 213 105 46 212 104 43 
+213 103 41 209 99 39 212 101 45 213 105 50 210 105 51 207 105 48 210 105 51 213 100 52 
+213 105 46 208 103 45 198 102 49 97 78 60 58 65 69 56 64 62 58 66 61 113 113 120 
+255 255 255 252 252 252 255 255 255 254 254 254 255 255 255 254 254 254 252 252 252 254 255 255 
+252 252 252 252 252 252 255 255 255 251 251 251 255 255 255 252 252 252 254 254 254 219 227 224 
+71 72 69 62 66 62 58 62 65 58 65 69 97 78 60 198 102 49 208 103 45 212 101 45 
+212 104 43 210 99 44 213 100 46 210 102 46 207 105 38 207 105 38 209 105 45 210 102 46 
+207 99 48 210 105 51 213 105 50 213 105 50 217 105 50 217 105 50 213 100 46 210 99 51 
+212 98 39 210 105 40 210 99 44 210 102 46 128 93 57 57 63 63 66 60 61 58 66 61 
+62 66 56 172 178 183 249 254 254 253 255 254 254 251 249 254 251 249 253 255 254 253 255 254 
+254 254 253 253 253 255 172 178 183 62 66 56 58 65 69 84 69 58 207 99 38 212 101 45 
+213 103 41 207 105 38 200 101 40 213 100 46 210 105 51 207 99 38 174 105 47 59 60 64 
+58 66 61 57 63 63 112 79 60 213 105 50 213 105 46 207 105 38 210 105 40 213 100 52 
+216 99 44 213 100 46 212 101 45 217 105 50 212 101 45 208 103 45 209 105 45 209 105 45 
+207 105 48 210 102 46 210 99 51 210 105 51 208 103 45 212 104 43 209 105 45 200 101 40 
+112 79 60 66 60 61 58 66 61 58 62 65 125 131 132 253 255 254 249 254 246 255 254 255 
+253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 252 252 252 250 247 249 254 254 254 
+255 255 253 253 255 254 172 178 183 57 63 61 59 59 56 58 68 63 53 63 60 128 93 57 
+212 98 39 219 98 50 217 105 50 212 104 43 209 105 45 208 103 45 211 99 45 217 104 40 
+208 103 45 216 99 44 213 103 41 211 104 39 217 104 40 212 104 43 208 103 45 212 101 45 
+216 99 44 210 99 51 217 105 50 207 99 38 211 104 39 217 105 50 185 105 60 84 69 58 
+54 67 66 62 65 65 59 60 62 71 72 69 224 220 212 249 254 246 255 255 253 254 250 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 252 252 252 255 255 255 254 254 254 255 255 255 255 255 255 
+21 19 24 0 0 0 4 1 5 148 133 63 166 144 56 169 141 58 169 144 61 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 138 59 173 142 59 109 102 83 4 1 5 142 120 69 
+166 144 56 166 144 56 173 142 59 169 141 58 169 141 58 168 136 64 168 136 64 169 144 61 
+166 144 56 173 142 59 173 138 52 169 138 59 169 141 58 166 144 56 166 144 56 168 136 64 
+224 220 212 253 253 253 255 255 253 255 253 254 255 253 254 254 255 251 253 253 255 255 254 255 
+248 254 253 254 255 255 254 255 251 253 252 247 255 254 255 255 253 254 255 253 254 253 252 247 
+253 253 253 255 255 255 252 252 252 255 255 255 241 240 247 145 151 154 48 49 51 0 1 1 
+0 0 0 21 19 24 172 178 183 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 124 59 101 91 62 58 62 65 101 91 62 159 126 56 156 124 53 156 124 53 157 124 59 
+156 124 53 159 126 56 158 126 53 158 126 53 152 124 51 158 124 56 158 124 54 159 126 56 
+157 124 59 158 124 56 159 126 56 159 126 56 152 124 44 156 129 45 159 126 56 157 124 59 
+158 124 54 162 125 53 156 128 53 113 104 59 66 60 61 62 61 67 57 60 56 97 100 105 
+241 240 247 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 253 254 255 255 253 253 255 254 254 254 125 131 132 53 60 64 58 65 69 
+58 65 69 72 73 56 147 124 59 161 124 50 161 124 50 152 124 51 158 134 59 158 125 54 
+157 124 59 159 126 56 159 126 56 158 126 53 158 125 54 156 126 54 156 128 53 155 128 52 
+156 128 53 155 128 52 159 126 56 159 126 56 156 124 53 155 128 52 159 134 56 156 126 54 
+157 124 59 162 125 53 161 124 50 149 124 53 81 77 81 58 62 65 59 59 56 58 65 54 
+97 100 105 241 240 247 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 252 252 252 253 253 253 253 253 253 255 255 255 254 254 254 187 189 188 57 58 61 
+58 62 65 57 58 61 62 66 56 128 113 57 156 124 53 166 129 59 158 124 53 155 128 52 
+158 124 53 158 126 53 157 126 52 156 124 53 156 126 54 156 126 54 157 127 54 158 126 53 
+152 127 56 155 128 52 158 124 53 158 126 53 158 126 53 155 127 54 156 128 53 156 128 53 
+156 124 53 147 124 59 62 66 56 50 65 64 58 64 64 128 113 57 152 124 51 157 124 59 
+152 124 44 155 128 52 156 126 54 157 126 52 161 125 43 159 126 56 128 113 57 60 64 65 
+60 64 65 104 112 110 255 255 255 254 254 254 255 255 255 254 254 254 251 251 251 254 254 254 
+255 255 255 241 240 247 97 100 105 57 63 61 57 60 70 62 61 67 110 92 61 152 127 56 
+158 127 55 152 124 51 158 124 56 157 124 59 158 124 56 158 127 55 162 125 53 152 124 44 
+156 126 54 155 127 54 155 127 54 155 127 54 155 127 54 156 126 54 158 127 55 158 127 55 
+159 126 56 148 128 46 155 126 57 162 124 55 147 124 59 62 61 67 56 64 62 56 64 62 
+147 124 59 156 124 53 162 125 53 159 126 56 156 124 53 159 126 56 161 124 50 154 129 46 
+162 124 52 150 128 52 62 65 65 58 65 69 59 59 56 219 227 224 254 252 250 160 163 161 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 
+172 178 183 58 64 64 54 64 59 60 64 65 69 60 69 128 113 57 152 127 56 159 126 56 
+155 126 57 156 125 56 159 126 56 159 126 56 156 124 53 157 127 54 158 127 55 152 124 51 
+158 127 55 158 127 55 155 126 57 156 125 56 156 125 56 158 125 54 158 125 54 157 126 52 
+158 124 56 155 128 52 157 124 59 162 124 55 158 124 54 159 126 56 150 126 55 101 91 62 
+62 65 65 59 64 62 57 60 56 68 69 75 213 212 223 254 255 251 254 255 251 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+209 105 45 213 100 46 84 69 58 71 72 69 174 105 47 212 101 45 207 99 38 210 105 51 
+210 99 51 216 99 44 211 104 39 209 99 39 217 105 50 216 99 44 212 104 43 208 103 45 
+213 100 46 213 100 46 211 99 45 208 103 45 209 99 39 216 99 44 217 104 40 207 99 38 
+210 99 51 209 105 45 209 99 39 213 103 41 97 78 60 58 62 63 60 61 69 59 59 56 
+125 131 132 255 255 255 251 251 251 253 253 253 252 252 252 253 253 253 255 255 255 252 252 252 
+255 255 255 255 255 255 253 253 253 253 253 253 253 253 253 254 254 254 219 227 224 71 72 69 
+50 65 62 62 65 65 58 65 54 112 79 60 212 101 45 219 98 50 216 99 44 208 103 45 
+207 99 48 217 105 50 213 103 41 207 99 38 213 103 41 216 99 44 212 101 45 200 101 40 
+213 103 41 211 102 45 208 103 45 208 103 45 208 103 45 213 103 41 213 103 41 212 98 39 
+211 102 45 210 105 51 208 103 45 209 105 45 216 99 44 174 105 47 62 66 62 58 64 64 
+57 61 64 60 60 63 172 178 183 249 254 254 249 254 254 255 255 253 248 254 252 249 254 254 
+255 254 255 249 254 254 140 141 138 58 62 65 62 61 67 128 93 57 217 104 40 211 102 45 
+213 105 50 217 104 40 213 100 52 207 99 48 213 105 46 208 103 45 207 99 48 57 63 61 
+57 60 56 102 79 82 213 100 52 213 100 46 210 99 51 209 99 39 213 103 41 219 98 50 
+208 103 45 210 99 44 209 99 39 208 103 45 208 103 45 210 102 46 209 105 45 208 103 45 
+207 99 38 217 104 40 216 99 44 212 98 39 213 103 41 210 102 46 210 99 44 213 103 41 
+210 105 51 97 78 60 57 58 61 58 65 69 56 66 64 187 189 188 255 253 254 254 254 253 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+254 255 251 172 178 183 57 60 70 58 62 65 58 66 61 62 65 65 185 105 60 210 99 51 
+212 104 43 207 105 38 207 105 38 211 102 45 216 99 44 217 104 40 210 105 40 207 105 38 
+208 103 45 213 100 46 208 103 45 200 101 40 208 103 45 208 103 45 210 102 46 216 99 44 
+217 105 50 207 105 48 207 99 48 211 99 45 213 103 41 211 102 45 211 102 45 212 101 45 
+112 79 60 62 66 62 60 61 69 57 60 56 71 81 83 213 212 223 254 255 251 254 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 251 251 251 172 178 183 
+0 3 1 0 0 0 109 102 83 169 141 58 169 144 61 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 134 56 169 144 61 169 141 58 169 138 59 173 142 59 142 120 69 4 1 5 109 102 83 
+173 142 59 168 136 64 169 138 59 173 142 59 169 138 59 173 142 59 169 141 58 166 144 56 
+169 138 59 169 141 58 169 141 58 169 141 58 165 143 59 166 134 56 173 142 59 169 144 61 
+254 252 250 254 255 255 251 251 251 254 251 252 255 255 253 254 255 251 253 253 255 255 254 255 
+254 255 251 254 251 252 255 253 254 255 254 255 250 252 254 249 254 246 253 252 247 254 255 251 
+255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 242 238 229 140 141 138 
+48 49 51 0 0 0 0 0 0 62 65 65 219 227 224 251 251 251 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 101 91 62 113 104 59 155 128 52 162 124 52 166 129 59 157 124 59 155 128 52 
+168 131 61 157 124 59 158 124 54 159 126 56 159 126 56 159 126 56 157 126 52 158 127 55 
+158 127 55 155 128 52 156 126 54 157 124 59 159 126 56 158 126 53 157 126 52 156 124 53 
+159 126 56 157 126 52 157 124 59 155 128 52 113 104 59 62 61 67 54 67 66 58 68 63 
+113 113 120 253 255 254 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 253 253 253 
+254 255 251 254 255 251 251 251 251 254 255 251 154 157 157 58 65 69 59 60 70 62 61 67 
+97 78 60 147 124 59 159 134 56 152 124 51 155 126 57 152 127 56 159 126 56 156 124 53 
+156 124 53 156 126 54 154 129 46 155 128 52 155 128 52 155 126 57 156 125 56 157 124 59 
+157 124 59 156 124 53 155 128 52 159 126 56 159 126 56 158 125 54 156 124 53 155 126 57 
+158 125 54 155 126 57 156 124 53 162 124 55 154 129 46 85 80 60 59 60 70 58 65 69 
+60 64 65 97 100 105 254 255 255 255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 
+251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 213 212 223 68 69 75 62 65 65 
+57 63 63 62 66 62 142 101 66 158 124 56 158 127 55 157 126 52 156 124 53 159 126 56 
+157 124 59 157 124 59 157 124 59 159 126 56 158 127 55 158 125 54 159 126 56 158 124 54 
+158 124 53 158 126 53 157 127 54 158 127 55 158 125 54 158 124 54 156 125 56 156 125 56 
+157 124 59 161 124 50 113 104 59 60 64 65 62 66 62 147 124 59 156 124 53 157 124 59 
+157 124 59 157 124 59 161 124 50 158 127 55 155 126 57 158 132 49 128 113 57 59 60 64 
+57 63 61 110 110 107 253 253 253 254 254 254 253 253 253 253 255 254 255 255 255 251 251 251 
+253 255 254 110 110 107 57 58 61 58 65 69 62 61 67 113 104 59 155 128 52 158 126 53 
+150 126 55 155 126 57 158 125 54 157 126 52 158 127 55 155 128 52 152 124 51 159 126 56 
+158 124 53 158 125 54 159 126 56 158 125 54 158 125 54 158 126 53 158 126 53 157 126 52 
+157 124 59 156 128 53 152 124 51 159 126 56 158 125 54 110 92 61 57 63 63 62 70 69 
+150 128 52 158 134 59 156 124 53 155 127 54 158 134 59 157 124 59 157 124 59 156 124 53 
+166 129 59 157 127 54 72 76 65 56 66 64 59 64 62 202 204 206 255 255 253 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 253 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 254 255 255 172 178 183 
+58 62 65 53 63 60 58 65 69 84 69 58 149 124 53 157 124 59 157 126 52 156 129 45 
+156 124 53 158 127 55 155 128 52 154 129 46 156 128 53 155 127 54 156 124 53 157 124 59 
+162 124 55 158 124 53 157 126 52 158 126 53 159 126 56 159 126 56 158 124 54 158 125 54 
+152 127 56 156 124 53 158 125 54 156 124 53 157 126 52 152 124 51 155 126 57 159 126 56 
+113 104 59 66 60 61 60 61 69 57 63 61 71 72 69 241 240 247 254 255 251 253 253 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 104 39 208 103 45 112 79 60 174 105 47 217 104 40 210 102 46 213 100 46 216 99 44 
+216 99 44 208 103 45 209 105 45 210 105 51 213 100 52 207 99 48 210 102 46 217 105 50 
+210 102 46 210 102 46 208 103 45 213 105 46 210 99 44 212 101 45 210 102 46 210 105 51 
+209 99 39 219 98 50 219 98 50 213 100 52 213 100 46 101 91 62 59 59 56 62 65 65 
+60 64 65 187 189 188 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 255 255 
+255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 241 240 247 97 100 105 58 62 63 
+62 65 65 57 58 61 142 101 66 207 105 38 213 100 46 213 105 50 209 105 45 212 101 45 
+208 103 45 211 102 45 210 105 51 207 105 48 207 105 48 210 102 46 213 100 46 217 105 50 
+209 99 39 212 104 43 212 101 45 213 100 46 213 100 46 213 100 46 210 102 46 210 102 46 
+208 103 45 213 103 41 213 100 46 212 101 45 209 99 39 212 98 39 185 105 60 71 72 69 
+51 61 71 58 65 69 59 64 62 202 204 206 254 255 255 250 250 247 254 255 251 255 255 253 
+254 255 251 253 255 254 104 112 110 57 63 63 62 66 62 140 101 45 210 102 46 211 102 45 
+213 100 52 207 105 38 209 99 39 216 99 44 217 105 50 207 105 48 216 99 44 72 76 65 
+71 68 65 200 101 40 207 105 38 208 103 45 217 104 40 213 105 46 213 100 52 211 102 45 
+210 99 51 213 100 46 211 102 45 208 103 45 208 103 45 210 102 46 216 99 44 216 99 44 
+213 105 50 207 99 48 208 103 45 213 103 41 210 99 44 210 99 51 210 105 51 211 99 45 
+208 103 45 216 99 44 85 80 60 56 66 64 53 63 60 71 72 69 242 238 229 254 255 255 
+254 254 254 251 251 251 255 255 255 255 255 255 251 251 251 253 253 253 253 253 253 253 253 253 
+202 204 206 57 60 56 58 65 69 62 66 62 72 76 65 174 105 47 211 99 45 213 103 41 
+217 105 50 208 103 45 208 103 45 213 105 46 213 100 46 208 103 45 210 102 46 213 100 46 
+213 100 46 212 101 45 212 101 45 213 100 46 213 100 46 210 102 46 209 105 45 212 101 45 
+209 105 45 212 104 43 210 105 40 213 105 46 213 100 46 210 99 51 208 103 45 210 105 40 
+207 105 48 128 93 57 62 65 65 53 67 71 57 61 64 68 69 75 230 230 230 249 254 246 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 81 77 81 
+0 1 1 4 2 1 148 133 63 169 138 59 166 144 56 169 144 61 169 141 58 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 144 61 166 134 56 173 138 52 169 141 58 169 141 58 168 136 64 4 2 1 48 49 51 
+166 144 56 173 142 59 169 141 58 165 143 59 165 143 59 169 141 58 169 141 58 173 145 52 
+169 144 61 166 134 56 166 144 56 165 143 59 168 136 64 173 145 52 166 144 56 178 172 162 
+254 254 254 253 255 254 255 255 253 254 251 254 254 251 252 254 255 251 254 255 255 254 252 251 
+253 252 247 251 251 251 254 255 251 254 255 251 253 252 247 254 255 251 254 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 
+241 240 247 145 151 154 4 2 1 0 0 0 0 1 1 125 131 132 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 127 56 154 129 46 156 126 54 159 126 56 157 126 52 152 124 51 158 134 59 156 124 53 
+152 124 51 155 128 52 158 132 49 155 128 52 152 124 51 156 126 54 158 126 53 158 126 53 
+152 124 51 156 128 53 157 127 54 156 125 56 156 124 53 155 128 52 156 126 54 157 124 59 
+157 126 52 155 128 52 157 124 59 157 124 59 150 126 55 110 92 61 58 59 64 56 66 64 
+57 63 61 187 189 188 254 255 255 253 253 253 254 254 254 255 255 255 252 252 252 255 255 255 
+254 255 251 254 252 250 255 254 255 187 189 188 54 64 59 58 65 69 66 60 61 85 80 60 
+159 126 56 148 133 63 152 127 56 155 127 54 156 125 56 158 127 55 152 124 51 159 126 56 
+159 126 56 156 124 53 158 125 54 159 126 56 159 126 56 158 124 53 161 124 50 161 124 50 
+156 124 53 158 127 55 155 128 52 152 124 51 158 127 55 162 125 53 158 124 53 158 124 56 
+158 127 55 152 124 44 155 126 57 157 127 54 162 124 52 158 127 55 85 80 60 57 63 63 
+57 63 63 57 63 63 125 131 132 249 252 251 255 255 255 251 251 251 253 253 253 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 254 255 255 97 100 105 60 64 65 57 63 63 
+62 65 65 142 101 66 157 126 52 152 124 44 158 127 55 155 126 57 158 127 55 158 125 54 
+155 128 52 155 128 52 152 124 51 155 128 52 156 124 53 156 124 53 159 126 56 157 124 59 
+158 127 55 156 126 54 156 125 56 157 124 59 157 124 59 157 124 59 159 126 56 155 128 52 
+157 126 52 155 127 54 150 126 55 101 91 62 62 65 65 156 125 56 161 125 43 156 124 53 
+156 125 56 158 127 55 156 124 53 154 129 46 158 134 59 149 124 53 128 113 57 57 61 64 
+62 65 65 104 112 110 254 254 254 255 255 255 252 252 252 253 253 253 253 253 253 255 255 255 
+178 172 162 57 61 64 58 64 64 59 60 62 110 92 61 155 128 52 161 125 43 157 124 59 
+162 125 53 158 126 53 154 129 46 154 129 46 156 126 54 159 126 56 157 124 59 152 127 56 
+158 124 56 158 125 54 158 124 53 158 124 53 156 124 53 159 126 56 157 124 59 157 124 59 
+152 124 51 157 124 59 157 124 59 152 124 51 155 128 52 150 128 52 84 69 58 85 80 60 
+155 127 54 157 126 52 157 124 59 157 124 59 154 129 46 156 124 53 158 124 56 159 126 56 
+152 124 51 158 127 55 72 76 65 58 68 63 57 63 61 202 206 211 254 252 251 154 157 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 253 254 254 254 253 253 253 255 255 255 254 254 254 254 255 255 224 220 212 71 72 69 
+57 63 61 58 66 61 71 68 65 147 124 59 162 125 53 161 124 50 155 128 52 156 126 54 
+156 128 53 156 126 54 158 124 54 157 124 59 159 126 56 156 126 54 156 126 54 158 126 53 
+157 124 59 156 125 56 155 127 54 155 128 52 152 124 51 152 124 51 156 124 53 159 126 56 
+157 126 52 158 127 55 155 128 52 158 126 53 159 126 56 159 126 56 156 124 53 154 129 46 
+150 128 52 113 104 59 59 59 56 59 64 62 62 66 62 97 100 105 255 255 253 255 255 255 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 104 39 213 100 46 213 103 41 211 99 45 213 100 46 207 99 48 212 104 43 207 99 38 
+212 101 45 208 103 45 208 103 45 212 98 39 211 102 45 210 105 51 213 100 46 212 98 39 
+213 100 46 208 103 45 208 103 45 211 102 45 211 99 45 213 105 46 210 102 46 210 99 44 
+207 105 38 213 105 46 210 99 44 207 105 48 210 102 46 210 102 46 85 80 60 59 60 62 
+62 65 65 62 70 69 241 240 247 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 253 253 253 253 255 254 104 112 110 58 64 64 58 64 64 
+60 60 63 142 101 66 212 104 43 216 99 44 210 105 51 207 105 38 212 104 43 213 100 46 
+213 100 46 210 99 44 212 104 43 216 99 44 210 99 44 209 105 45 213 105 46 212 98 39 
+210 102 46 210 102 46 208 103 45 208 103 45 208 103 45 211 104 39 211 102 45 209 105 45 
+211 102 45 216 99 44 210 102 46 209 105 45 210 105 40 209 105 45 207 99 48 207 99 48 
+71 65 56 58 67 65 53 60 64 71 72 69 230 230 230 255 255 255 255 253 254 255 255 253 
+253 252 247 255 254 255 104 112 110 57 60 56 56 66 64 155 104 59 217 105 50 208 103 45 
+208 103 45 209 105 45 213 100 46 210 105 40 209 99 39 217 104 40 213 100 52 97 78 60 
+155 104 59 208 103 45 217 104 40 212 104 43 207 105 38 213 100 46 212 98 39 213 100 46 
+216 99 44 213 105 50 208 103 45 210 102 46 217 105 50 212 101 45 212 101 45 213 100 46 
+212 98 39 213 103 41 213 100 46 210 102 46 208 103 45 211 102 45 213 105 46 217 105 50 
+209 105 45 217 98 38 198 102 49 62 66 62 58 62 65 58 65 69 156 160 157 253 255 254 
+255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 230 230 230 
+68 69 75 56 64 62 57 60 56 71 65 56 198 102 49 216 99 44 207 105 38 207 105 48 
+210 99 44 212 101 45 213 100 46 211 102 45 213 105 50 213 105 50 211 102 45 211 104 39 
+216 99 44 208 103 45 208 103 45 213 105 50 210 102 46 208 103 45 212 104 43 211 104 39 
+213 100 52 216 99 44 211 99 45 210 105 51 209 99 39 213 103 41 213 100 46 209 105 45 
+216 99 44 216 99 44 128 93 57 60 64 65 60 61 69 59 64 62 97 100 105 241 240 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 252 252 252 241 240 247 0 0 0 
+4 1 5 88 95 83 164 144 50 169 144 61 173 142 59 169 141 58 169 144 61 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 173 142 59 173 142 59 169 141 58 164 144 50 169 141 58 88 95 83 4 1 5 
+148 133 63 164 144 50 169 138 59 173 142 59 166 144 56 169 138 59 169 141 58 169 138 59 
+169 141 58 173 138 52 165 143 59 169 144 61 168 136 64 173 138 52 169 144 61 241 240 247 
+255 255 253 252 252 252 254 255 251 255 254 255 254 254 255 254 255 251 253 255 254 254 255 251 
+253 253 253 254 254 255 255 253 254 255 255 253 254 255 251 250 252 246 254 255 255 254 255 251 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 253 253 253 230 230 230 97 100 105 0 0 0 0 0 0 62 65 65 219 227 224 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 53 157 124 59 158 125 54 158 124 53 157 124 59 155 128 52 152 124 44 159 126 56 
+158 127 55 156 124 53 158 127 55 156 124 53 158 124 56 157 124 59 156 125 56 156 124 53 
+157 124 59 156 124 53 161 124 50 159 126 56 158 126 53 157 126 52 155 128 52 155 128 52 
+158 127 55 158 124 56 156 124 53 156 124 53 161 124 50 155 126 57 85 80 60 58 65 69 
+57 63 61 71 72 69 241 240 247 254 255 255 255 255 255 254 254 254 255 255 255 253 253 253 
+254 255 255 255 254 255 241 240 247 68 69 75 58 62 65 57 60 70 84 69 58 147 124 59 
+154 129 46 157 126 52 156 124 53 159 126 56 161 124 50 158 125 54 159 126 56 155 126 57 
+155 126 57 152 124 51 159 126 56 158 124 54 157 124 59 128 113 57 128 113 57 113 104 59 
+128 113 57 147 124 59 156 125 56 159 126 56 158 124 56 156 124 53 155 128 52 158 126 53 
+158 124 56 155 128 52 154 129 46 158 124 56 157 124 59 152 124 44 151 135 55 97 78 60 
+56 64 62 56 64 62 60 64 65 187 189 188 255 255 255 255 255 255 255 255 255 253 253 253 
+255 255 255 253 253 253 255 255 255 255 255 255 156 160 157 57 58 61 56 66 64 53 63 60 
+128 99 63 150 126 55 156 129 45 159 126 56 157 124 59 158 127 55 154 129 46 158 127 55 
+158 126 53 156 124 53 156 124 53 159 126 56 159 126 56 156 126 54 158 127 55 155 128 52 
+155 127 54 156 126 54 158 127 55 156 128 53 154 129 46 154 129 46 157 126 52 162 125 53 
+161 124 50 157 124 59 159 126 56 148 128 46 81 77 81 158 125 54 152 127 56 156 126 54 
+156 128 53 152 124 51 156 129 45 157 124 59 157 124 59 161 124 50 128 99 63 59 64 62 
+58 64 64 104 112 110 254 254 254 255 255 255 254 254 254 254 255 255 255 255 255 230 230 230 
+71 72 69 58 65 69 57 60 70 94 90 61 152 127 56 158 124 54 157 124 59 155 128 52 
+156 124 53 158 124 56 157 124 59 157 124 59 158 125 54 157 126 52 157 126 52 155 128 52 
+155 127 54 156 126 54 159 126 56 159 126 56 156 126 54 156 124 53 156 126 54 156 128 53 
+155 128 52 151 135 55 152 124 51 162 124 55 162 125 53 155 126 57 128 113 57 110 92 61 
+156 124 53 157 124 59 158 132 49 155 128 52 156 128 53 157 126 52 157 124 59 155 128 52 
+155 128 52 155 128 52 81 77 81 58 66 61 57 60 56 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 255 255 97 100 105 59 64 62 
+57 60 70 71 65 56 142 120 69 155 127 54 156 126 54 158 127 55 156 125 56 158 124 56 
+155 128 52 156 126 54 158 125 54 158 125 54 158 127 55 155 127 54 156 126 54 156 126 54 
+128 113 57 128 113 57 128 99 63 128 113 57 147 124 59 156 125 56 158 127 55 156 124 53 
+162 124 55 158 124 56 155 126 57 155 128 52 152 124 44 159 126 56 158 124 56 158 127 55 
+162 124 55 150 128 52 113 104 59 59 60 64 57 60 70 58 64 64 145 151 154 253 252 247 
+255 255 255 254 255 255 253 255 254 255 253 254 255 255 255 57 63 63 58 64 64 60 60 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 100 52 208 103 45 207 105 38 213 100 52 208 103 45 209 99 39 210 105 51 210 102 46 
+210 102 46 211 102 45 212 101 45 213 100 46 213 100 46 208 103 45 208 103 45 213 100 52 
+212 101 45 212 101 45 213 100 46 210 102 46 208 103 45 210 99 44 212 104 43 212 104 43 
+219 98 50 210 99 44 213 103 41 211 99 45 216 99 44 211 104 39 198 102 49 71 68 65 
+57 63 63 62 65 65 125 131 132 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 172 178 183 58 62 63 56 66 64 56 66 64 
+128 93 57 207 105 48 213 103 41 208 103 45 212 101 45 213 100 46 208 103 45 212 101 45 
+208 103 45 212 101 45 213 100 46 212 101 45 209 105 45 208 103 45 210 99 44 213 100 52 
+211 104 39 211 102 45 210 102 46 213 100 46 213 100 46 213 100 46 211 102 45 208 103 45 
+209 105 45 213 103 41 213 103 41 210 102 46 210 99 51 213 100 46 213 103 41 210 99 44 
+174 105 47 71 65 56 51 61 71 62 65 65 110 110 107 249 254 254 253 253 255 253 253 255 
+255 255 255 253 253 253 104 112 110 62 66 62 58 62 65 155 104 59 210 99 44 211 104 39 
+213 105 46 210 99 44 213 100 52 207 105 48 213 100 46 213 103 41 207 99 48 200 101 40 
+217 104 40 210 99 51 216 99 44 209 105 45 210 105 51 216 99 44 213 100 52 174 105 47 
+174 105 47 155 104 59 155 104 59 198 102 49 210 102 46 212 104 43 209 105 45 210 102 46 
+211 102 45 208 103 45 208 103 45 213 100 46 216 99 44 213 103 41 208 103 45 208 103 45 
+216 99 44 212 104 43 208 103 45 128 93 57 53 67 71 57 63 61 71 72 69 241 240 247 
+255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 254 254 254 110 110 107 
+59 64 62 50 65 64 71 68 65 174 105 47 210 102 46 213 100 46 217 104 40 213 100 46 
+211 102 45 213 105 46 211 99 45 210 99 44 212 104 43 213 103 41 209 99 39 213 105 50 
+207 105 48 174 105 47 155 104 59 155 104 59 155 104 59 174 105 47 207 99 48 212 104 43 
+213 103 41 210 105 51 208 103 45 209 99 39 213 105 50 210 102 46 209 99 39 211 102 45 
+210 102 46 209 105 45 210 102 46 128 93 57 62 66 62 53 60 64 58 66 61 145 151 154 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 254 255 255 253 253 255 252 252 252 253 253 253 254 250 255 140 141 138 0 0 0 
+4 1 5 148 133 63 169 141 58 169 141 58 169 144 61 169 138 59 173 145 52 165 143 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 144 61 169 141 58 166 144 56 169 144 61 169 138 59 142 120 69 0 3 1 
+109 102 83 173 142 59 165 143 59 169 141 58 166 144 56 169 141 58 169 138 59 169 141 58 
+173 142 59 169 141 58 164 134 50 165 143 59 173 142 59 166 144 56 214 206 175 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 251 251 251 255 255 255 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 187 189 188 21 19 24 4 2 1 6 9 5 
+172 178 183 255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 
+252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+252 252 252 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 152 124 44 159 126 56 156 125 56 156 129 45 155 128 52 156 128 53 162 124 55 
+161 124 50 159 126 56 155 127 54 150 126 55 128 113 57 128 99 63 128 113 57 154 129 46 
+155 127 54 157 124 59 156 126 54 157 127 54 156 124 53 159 126 56 158 124 54 158 127 55 
+156 126 54 159 126 56 156 128 53 155 128 52 156 125 56 161 124 50 147 124 59 66 60 61 
+54 67 66 60 64 65 152 161 158 249 254 246 255 254 255 250 252 246 255 255 255 254 255 251 
+253 252 247 253 253 255 113 113 120 58 65 69 58 66 61 62 66 56 149 124 53 158 125 54 
+157 124 59 157 127 54 156 124 53 155 127 54 155 126 57 158 124 56 166 129 59 161 125 43 
+159 126 56 147 124 59 110 92 61 72 76 65 59 60 64 59 64 62 56 64 62 54 67 66 
+59 59 56 60 64 65 62 70 69 94 90 61 149 124 53 161 124 50 158 124 53 155 126 57 
+158 124 56 155 127 54 159 126 56 158 124 54 156 128 53 154 129 46 159 126 56 158 124 56 
+84 69 58 56 64 62 53 60 64 81 77 81 241 240 247 248 254 252 254 250 255 253 253 253 
+253 253 255 254 255 255 253 253 255 230 230 230 56 66 64 62 61 67 56 66 64 110 92 61 
+156 126 54 155 126 57 154 129 46 161 124 50 166 129 59 158 124 53 159 126 56 154 129 46 
+154 129 46 158 127 55 156 124 53 155 127 54 155 128 52 155 126 57 157 124 59 149 124 53 
+128 99 63 128 113 57 147 124 59 152 124 51 156 128 53 157 127 54 156 124 53 158 126 53 
+152 127 56 161 124 50 156 124 53 158 127 55 156 125 56 158 127 55 157 124 59 155 128 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 104 112 110 253 255 254 250 252 254 255 255 255 255 255 253 252 252 252 104 112 110 
+66 60 61 53 64 53 71 72 69 157 124 59 158 124 53 150 128 52 162 125 53 155 126 57 
+155 128 52 162 124 52 158 125 54 155 128 52 156 126 54 157 124 59 162 125 53 156 129 45 
+161 125 43 157 127 54 148 133 63 128 113 57 128 99 63 128 113 57 155 126 57 155 127 54 
+162 124 55 156 129 45 157 124 59 157 124 59 155 128 52 152 124 51 155 128 52 158 124 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 251 251 251 255 255 253 253 252 247 255 254 255 156 160 157 62 61 67 54 64 59 
+57 61 64 128 113 57 158 124 56 155 127 54 156 125 56 157 124 59 152 124 44 157 124 59 
+156 124 53 159 126 56 157 124 59 157 126 52 158 124 56 110 92 61 72 76 65 62 66 56 
+60 61 69 58 62 63 60 64 65 57 61 64 59 60 64 62 66 62 94 90 61 113 104 59 
+155 128 52 159 126 56 162 124 55 156 124 53 158 127 55 158 125 54 156 124 53 157 124 59 
+158 127 55 150 128 52 161 124 50 97 78 60 57 61 64 54 64 59 58 62 63 202 206 211 
+252 252 252 255 255 255 253 253 253 254 254 254 254 255 255 57 63 61 58 64 64 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 100 46 213 105 50 209 105 45 207 99 38 216 99 44 213 103 41 210 102 46 210 105 51 
+213 100 46 210 102 46 211 102 45 212 98 39 198 102 49 155 104 59 155 104 59 198 102 49 
+208 103 45 209 105 45 212 98 39 213 105 46 198 102 49 207 105 48 217 98 38 210 102 46 
+209 105 45 211 102 45 210 102 46 210 99 44 213 100 46 217 105 50 198 102 49 174 105 47 
+56 66 64 60 60 63 58 65 69 202 204 206 253 255 254 254 251 249 249 254 254 254 255 255 
+254 255 251 254 250 255 255 254 255 230 230 230 72 76 65 62 61 67 50 65 64 112 79 60 
+208 103 45 213 100 52 210 99 44 213 105 50 209 99 39 209 105 45 213 100 52 211 104 39 
+216 99 44 208 103 45 208 103 45 213 100 46 212 104 43 217 104 40 207 99 48 174 105 47 
+155 104 59 174 105 47 210 105 51 216 99 44 208 103 45 213 100 46 216 99 44 209 105 45 
+213 100 46 210 105 51 211 104 39 210 99 44 213 105 50 207 105 48 213 100 46 207 105 38 
+212 104 43 140 101 45 62 61 67 57 63 61 50 65 62 172 178 183 254 251 252 255 255 253 
+254 255 255 254 251 252 104 112 110 60 64 65 58 62 63 155 104 59 213 105 50 211 102 45 
+213 100 46 210 102 46 209 105 45 213 105 46 213 100 46 212 101 45 212 101 45 211 102 45 
+209 105 45 211 99 45 216 99 44 213 105 46 155 104 59 112 79 60 69 60 69 58 62 65 
+58 62 65 57 63 61 59 64 62 58 65 69 62 65 65 112 79 60 185 105 60 216 99 44 
+217 98 38 213 105 50 200 101 40 213 100 46 213 100 46 211 104 39 211 104 39 213 100 52 
+210 102 46 207 99 38 213 100 46 210 102 46 71 68 65 58 66 61 57 60 70 187 189 188 
+255 255 253 255 255 253 249 254 254 253 255 254 255 254 255 253 255 254 178 172 162 62 61 67 
+60 64 65 57 63 61 155 104 59 211 99 45 210 102 46 208 103 45 217 105 50 209 99 39 
+213 100 52 209 99 39 208 103 45 210 102 46 217 104 40 210 105 51 128 93 57 97 78 60 
+60 64 65 57 61 64 62 61 67 57 61 64 58 64 64 57 63 61 71 65 56 102 79 82 
+155 104 59 213 105 50 217 104 40 207 105 38 210 105 40 219 98 50 212 101 45 209 105 45 
+216 99 44 208 103 45 207 105 48 217 98 38 112 79 60 54 64 59 53 60 64 66 60 61 
+202 204 206 254 255 251 254 255 255 254 255 255 253 253 253 
+253 253 253 249 252 251 254 255 255 254 255 251 254 254 254 255 254 255 21 19 24 0 1 1 
+68 58 52 165 143 59 173 142 59 169 138 59 166 144 56 166 134 56 173 142 59 169 144 61 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 138 59 169 141 58 169 144 61 169 141 58 173 142 59 148 133 63 4 1 5 
+72 76 65 166 144 56 169 144 61 169 141 58 168 136 64 166 134 56 169 141 58 169 141 58 
+169 141 58 166 144 56 169 144 61 173 138 52 166 144 56 178 172 162 254 252 250 253 252 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+252 252 252 253 253 253 254 254 254 254 254 254 255 255 255 241 240 247 97 100 105 4 2 1 
+0 0 0 125 131 132 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 251 251 251 
+255 255 255 252 252 252 254 254 254 252 252 252 253 253 253 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 158 134 59 158 124 53 159 126 56 157 124 59 159 126 56 156 124 53 150 128 52 
+142 120 69 101 91 62 69 60 69 62 61 67 58 62 63 58 62 65 58 65 69 53 60 64 
+72 73 56 110 92 61 155 127 54 158 127 55 157 124 59 159 134 56 152 124 51 156 125 56 
+157 127 54 158 124 54 158 127 55 154 129 46 157 124 59 162 124 55 150 126 55 110 92 61 
+57 58 61 59 64 62 68 69 75 250 247 249 254 251 252 255 255 255 253 253 253 254 254 253 
+254 255 251 202 206 211 62 65 65 58 62 63 57 63 63 113 104 59 152 127 56 159 126 56 
+155 128 52 157 124 59 159 126 56 156 129 45 155 127 54 158 127 55 158 124 54 148 133 63 
+113 104 59 71 65 56 62 65 65 57 63 61 59 64 62 60 61 69 60 61 69 58 65 54 
+57 63 61 58 62 65 58 65 54 58 65 54 59 60 64 101 91 62 147 124 59 158 125 54 
+158 124 53 156 129 45 157 124 59 157 124 59 158 132 49 159 126 56 156 126 54 158 124 54 
+142 120 69 62 65 65 53 63 60 58 65 69 125 131 132 254 255 251 249 254 246 255 254 255 
+254 255 251 254 255 255 254 255 251 125 131 132 59 60 64 57 63 61 71 65 56 148 133 63 
+155 128 52 157 124 59 156 128 53 158 126 53 156 124 53 156 126 54 157 124 59 156 124 53 
+157 124 59 152 124 51 159 126 56 155 128 52 128 99 63 85 80 60 62 66 56 62 61 67 
+58 62 63 57 63 61 57 63 61 62 65 65 97 78 60 128 113 57 155 126 57 158 127 55 
+161 124 50 156 124 53 159 126 56 156 124 53 156 126 54 158 124 53 155 127 54 157 127 54 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 253 253 255 255 255 255 253 253 253 252 252 252 202 204 206 59 64 62 
+66 60 61 58 65 69 113 104 59 157 124 59 156 124 53 157 126 52 155 128 52 158 124 56 
+156 125 56 166 129 59 161 124 50 152 124 51 157 124 59 161 125 43 149 124 53 142 120 69 
+109 102 83 72 76 65 59 59 56 57 63 61 62 65 65 59 60 64 59 59 56 72 76 65 
+113 104 59 155 126 57 158 125 54 159 126 56 155 127 54 158 134 59 157 124 59 158 127 55 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 254 255 251 254 255 255 253 252 247 230 230 230 71 72 69 59 64 62 60 64 65 
+101 91 62 149 124 55 158 126 53 157 127 54 158 124 56 158 124 54 154 129 46 157 127 54 
+158 127 55 152 127 56 152 124 44 128 113 57 72 73 56 53 64 53 66 60 61 57 63 63 
+53 63 60 57 63 61 58 65 54 56 66 64 58 65 69 57 58 63 60 60 63 59 59 56 
+84 69 58 147 124 59 162 125 53 155 126 57 155 128 52 157 126 52 157 127 54 152 124 51 
+158 125 54 157 126 52 152 127 56 142 120 69 72 76 65 59 64 62 54 64 59 97 100 105 
+255 255 255 252 252 252 251 251 251 255 255 255 254 255 255 57 63 61 60 64 65 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+212 104 43 207 105 38 212 101 45 209 105 45 213 105 46 210 99 44 213 105 50 212 98 39 
+207 99 38 155 104 59 97 78 60 62 66 62 57 60 56 56 64 62 56 66 64 59 59 56 
+71 68 65 97 78 60 174 105 47 216 99 44 213 103 41 210 99 44 213 100 52 207 99 38 
+212 104 43 212 101 45 210 102 46 213 105 50 208 103 45 211 102 45 210 105 51 198 102 49 
+97 78 60 60 61 69 56 66 64 104 112 110 251 251 251 254 252 251 254 255 255 254 255 255 
+248 254 252 255 255 255 253 252 247 113 113 120 58 62 65 53 63 60 72 76 65 185 105 60 
+209 105 45 211 102 45 213 100 46 209 99 39 213 103 41 213 100 52 207 99 48 213 105 46 
+212 104 43 213 103 41 213 105 46 198 102 49 128 93 57 84 69 58 60 64 65 57 60 70 
+53 63 60 58 66 61 53 64 53 62 70 65 112 79 60 185 105 60 212 98 39 213 105 50 
+213 103 41 207 105 38 210 102 46 213 100 52 212 104 43 219 98 50 209 105 45 213 105 46 
+213 105 50 198 102 49 112 79 60 57 60 56 62 65 65 68 69 75 241 240 247 252 252 252 
+253 253 255 254 251 252 104 112 110 57 58 61 62 65 65 155 104 59 210 102 46 211 102 45 
+212 101 45 211 102 45 211 102 45 210 99 44 210 102 46 210 102 46 210 102 46 211 102 45 
+212 104 43 207 99 48 217 105 50 112 79 60 62 66 56 54 64 59 58 62 65 53 64 53 
+53 63 60 62 61 67 58 64 64 50 65 64 54 67 66 58 62 65 68 58 52 110 92 61 
+213 100 52 208 103 45 217 104 40 213 103 41 210 99 51 212 104 43 208 103 45 213 103 41 
+212 104 43 210 102 46 212 101 45 211 99 45 112 79 60 54 67 66 57 58 63 113 113 120 
+255 255 255 251 251 251 248 254 252 254 255 255 255 253 254 241 240 247 71 72 69 58 62 65 
+50 65 64 112 79 60 210 105 51 211 99 45 210 105 51 217 105 50 200 101 40 212 104 43 
+208 103 45 212 101 45 219 98 50 211 102 45 174 105 47 84 69 58 60 60 63 62 66 62 
+56 64 62 60 64 65 58 64 64 53 63 60 56 64 62 56 64 62 59 59 56 66 60 61 
+62 65 65 81 77 81 185 105 60 210 105 40 211 99 45 211 104 39 217 104 40 209 99 39 
+209 105 45 210 105 51 209 99 39 210 105 51 210 99 51 71 72 69 58 64 64 54 64 59 
+81 77 81 253 255 254 254 254 254 253 253 253 255 255 255 
+255 255 255 253 253 253 254 252 251 255 255 255 252 252 252 187 189 188 0 1 1 0 1 1 
+142 120 69 169 144 61 173 138 52 169 138 59 169 141 58 169 138 59 169 141 58 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 138 59 173 142 59 168 136 64 173 138 52 169 144 61 68 58 52 
+0 3 1 151 135 59 169 138 59 173 142 59 168 136 64 169 144 61 173 138 52 169 141 58 
+166 144 56 169 144 61 169 138 59 169 138 59 182 158 106 250 252 254 254 255 251 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 254 254 254 253 253 253 254 254 254 251 251 251 255 255 255 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 254 254 254 202 204 206 113 113 120 0 0 0 4 2 1 
+4 2 1 4 2 1 21 19 24 97 100 105 187 189 188 255 255 255 254 254 254 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 126 53 157 124 59 159 126 56 158 126 53 157 124 59 158 125 54 147 124 59 94 90 61 
+58 65 54 58 64 64 58 65 69 56 64 62 54 64 59 57 63 63 57 61 64 59 64 62 
+54 64 59 62 65 65 71 68 65 128 113 57 154 129 46 158 124 56 159 126 56 150 128 52 
+155 127 54 156 125 56 159 126 56 155 128 52 159 126 56 162 124 55 158 126 53 147 124 59 
+71 65 56 56 66 64 57 63 61 154 157 157 255 255 255 254 254 254 255 255 253 255 255 253 
+253 253 255 97 100 105 59 64 62 58 62 65 85 80 60 158 127 55 155 126 57 157 126 52 
+156 128 53 158 126 53 158 125 54 158 127 55 154 129 46 155 126 57 152 127 56 94 90 61 
+62 65 65 57 63 61 53 63 60 58 65 69 58 65 69 81 77 81 110 110 107 104 112 110 
+97 100 105 62 65 65 59 60 70 58 65 69 56 66 64 57 60 70 84 69 58 147 124 59 
+162 125 53 152 124 51 159 126 56 158 127 55 158 124 53 156 124 53 155 128 52 159 126 56 
+156 124 53 110 92 61 58 62 65 57 63 61 62 66 62 202 204 206 248 254 252 255 255 255 
+254 255 251 255 255 255 230 230 230 62 65 65 57 58 61 56 66 64 128 113 57 152 124 51 
+155 128 52 158 124 56 159 126 56 156 126 54 152 124 51 157 127 54 157 124 59 156 124 53 
+152 124 51 158 127 55 142 120 69 81 77 81 62 61 67 62 65 65 53 60 64 50 65 64 
+59 64 62 58 64 64 59 64 62 58 66 61 56 66 64 60 64 65 85 80 60 142 120 69 
+162 124 55 158 127 55 156 124 53 156 124 53 156 128 53 158 124 53 155 127 54 159 126 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 63 104 112 110 252 252 252 255 255 255 253 253 253 254 255 255 104 112 110 58 64 64 
+57 61 64 72 76 65 152 124 51 158 127 55 155 127 54 158 124 53 155 128 52 158 124 56 
+157 126 52 152 124 51 157 124 59 155 126 57 155 128 52 155 128 52 101 91 62 62 66 62 
+59 60 62 62 65 65 59 64 62 58 64 64 57 63 61 58 64 64 62 65 65 58 62 65 
+58 65 54 71 68 65 128 113 57 156 124 53 156 124 53 158 124 56 152 127 56 157 126 52 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 254 255 253 255 254 252 252 252 254 255 251 125 131 132 56 66 64 58 65 69 71 68 65 
+147 124 59 159 134 56 152 124 51 158 127 55 157 126 52 156 124 53 158 127 55 155 128 52 
+157 126 52 156 125 56 113 104 59 54 64 59 57 60 70 57 60 70 58 65 69 58 62 65 
+81 77 81 104 112 110 110 110 107 104 112 110 56 64 62 58 62 65 57 60 70 57 60 70 
+58 67 65 69 60 69 128 113 57 159 126 56 148 128 46 158 132 49 162 124 55 155 128 52 
+156 124 53 159 126 56 150 126 55 158 127 55 128 99 63 58 62 63 53 64 53 62 61 67 
+187 189 188 254 254 254 255 255 255 255 255 255 249 252 251 59 64 62 57 63 63 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 105 40 209 99 39 213 103 41 210 105 51 207 99 48 212 104 43 216 99 44 174 105 47 
+102 79 82 66 60 61 57 60 70 60 64 65 59 64 62 58 62 65 58 62 65 59 59 56 
+59 64 62 58 65 69 58 65 69 97 78 60 198 102 49 217 105 50 210 105 51 213 103 41 
+212 101 45 211 99 45 210 99 44 217 105 50 209 99 39 207 99 38 211 102 45 213 100 46 
+155 104 59 58 65 69 57 61 64 60 64 65 230 230 230 249 254 254 255 254 255 249 252 251 
+254 255 255 254 251 252 202 204 206 58 67 65 58 65 69 59 60 62 155 104 59 216 99 44 
+208 103 45 210 99 44 216 99 44 209 99 39 210 105 51 213 100 46 213 103 41 207 99 48 
+211 99 45 212 101 45 140 101 45 71 68 65 62 61 67 59 64 62 53 67 71 59 60 62 
+58 64 64 60 61 69 62 61 67 62 66 56 57 60 56 58 66 61 112 79 60 198 102 49 
+212 98 39 216 99 44 217 105 50 208 103 45 213 100 46 213 103 41 207 99 38 210 102 46 
+210 99 44 217 105 50 198 102 49 71 65 56 62 61 67 62 66 56 125 131 132 254 255 255 
+254 255 255 255 254 255 104 112 110 57 58 61 60 64 65 155 104 59 211 99 45 213 105 46 
+211 102 45 212 101 45 212 104 43 210 99 44 210 102 46 210 105 51 210 102 46 211 102 45 
+212 104 43 212 101 45 84 69 58 58 65 69 57 60 56 54 67 66 66 60 61 68 69 75 
+104 112 110 97 100 105 110 110 107 60 60 63 57 60 70 54 67 66 58 67 65 56 66 64 
+112 79 60 208 103 45 212 98 39 213 100 46 213 105 46 209 99 39 213 105 50 211 102 45 
+209 99 39 213 100 52 208 103 45 210 102 46 174 105 47 54 67 66 58 59 64 62 65 65 
+255 255 255 254 255 251 254 254 253 255 255 255 255 255 253 140 141 138 62 65 65 53 60 64 
+62 66 56 198 102 49 217 105 50 209 99 39 213 103 41 207 99 48 217 98 38 209 105 45 
+211 102 45 216 99 44 212 101 45 128 93 57 53 67 71 58 68 63 58 65 69 50 65 64 
+57 60 56 71 72 69 104 112 110 104 112 110 104 112 110 53 63 60 53 63 60 58 64 64 
+58 62 65 53 60 64 62 65 65 174 105 47 216 99 44 207 105 48 213 105 50 210 105 51 
+210 99 44 211 102 45 211 102 45 208 103 45 213 103 41 155 104 59 54 67 66 59 59 56 
+57 63 63 160 163 161 255 253 254 255 254 255 255 255 253 
+249 252 251 255 255 255 254 255 251 252 252 252 255 255 253 97 100 105 0 1 1 48 49 51 
+168 136 64 173 138 52 173 142 59 169 141 58 169 141 58 169 138 59 173 142 59 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 138 59 166 144 56 169 144 61 173 138 52 164 144 50 109 102 83 
+0 3 1 142 120 69 169 138 59 166 144 56 169 141 58 166 144 56 169 141 58 169 141 58 
+165 143 59 169 141 58 169 138 59 182 158 106 255 255 253 253 252 247 253 253 255 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 
+251 251 251 255 255 255 202 206 211 97 100 105 0 0 0 4 2 1 4 2 1 0 0 0 
+0 0 0 4 2 1 0 0 0 0 1 1 4 2 1 62 65 65 219 227 224 255 255 255 
+255 255 255 255 255 255 219 227 224 125 131 132 62 65 65 21 19 24 0 0 0 21 19 24 
+57 58 61 140 141 138 219 227 224 254 254 254 252 252 252 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 166 129 59 156 126 54 158 127 55 162 125 53 147 124 59 72 76 65 60 60 63 
+53 63 60 58 62 65 58 64 64 57 60 56 97 100 105 104 112 110 68 69 75 57 63 61 
+57 63 63 56 64 62 54 67 66 62 66 56 113 104 59 168 131 61 161 124 50 155 126 57 
+155 127 54 156 124 53 159 126 56 152 124 51 158 127 55 162 124 55 158 124 53 158 132 49 
+110 92 61 58 62 65 59 64 62 88 95 83 253 253 255 251 251 251 249 252 251 255 254 255 
+187 189 188 57 61 64 57 63 61 59 60 64 142 120 69 157 126 52 156 124 53 156 128 53 
+149 124 53 159 126 56 162 124 52 157 124 59 158 127 55 150 126 55 94 90 61 60 60 63 
+57 58 61 62 65 65 71 72 69 154 157 157 230 230 230 254 255 251 250 250 247 253 255 254 
+248 254 252 241 240 247 187 189 188 97 100 105 62 61 67 57 60 56 62 66 56 71 68 65 
+142 120 69 158 124 54 157 126 52 155 128 52 157 124 59 158 124 54 159 134 56 156 124 53 
+157 124 59 155 128 52 72 76 65 58 65 54 57 60 56 110 110 107 254 255 255 254 255 251 
+254 254 254 255 253 254 125 131 132 59 59 56 62 66 62 72 76 65 158 132 49 159 126 56 
+156 126 54 158 125 54 159 126 56 156 126 54 155 128 52 158 127 55 156 125 56 157 126 52 
+157 124 59 128 113 57 71 65 56 53 60 64 56 66 64 57 60 56 62 65 65 57 63 61 
+110 110 107 110 110 107 57 63 61 53 60 64 60 61 69 62 65 65 59 60 62 68 69 75 
+128 99 63 152 124 44 159 126 56 159 126 56 152 124 44 158 127 55 159 126 56 155 127 54 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 63 104 112 110 254 252 251 254 252 250 255 255 255 230 230 230 58 62 65 60 64 65 
+58 65 69 128 99 63 161 124 50 157 126 52 156 124 53 158 125 54 159 126 56 158 126 53 
+158 125 54 158 124 56 156 128 53 158 124 56 147 124 59 85 80 60 66 60 61 57 60 70 
+57 60 70 56 64 62 57 63 61 97 100 105 104 112 110 62 70 69 56 64 62 58 65 69 
+58 62 65 51 61 71 59 64 62 128 99 63 161 124 50 159 134 56 155 127 54 152 124 51 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 253 255 254 254 255 251 230 230 230 58 65 54 56 64 62 51 61 71 113 104 59 
+158 124 53 159 126 56 152 124 51 156 128 53 157 126 52 156 125 56 157 124 59 156 124 53 
+162 125 53 110 92 61 58 65 69 50 65 64 57 60 56 62 61 67 140 141 138 224 220 212 
+255 255 255 250 247 249 254 251 254 255 255 255 255 255 253 187 189 188 104 112 110 58 62 63 
+58 62 65 53 64 53 69 60 69 128 113 57 155 126 57 152 124 51 162 125 53 152 127 56 
+158 125 54 157 126 52 156 128 53 156 124 53 161 124 50 94 90 61 58 62 63 62 65 65 
+81 77 81 254 255 255 251 251 251 254 254 254 254 255 255 60 60 63 58 62 63 60 64 65 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 100 52 209 99 39 212 101 45 211 99 45 217 105 50 210 99 51 174 105 47 71 65 56 
+54 64 59 59 64 62 59 64 62 59 59 56 59 64 62 104 112 110 104 112 110 58 65 54 
+66 60 61 54 67 66 56 64 62 58 65 69 66 60 61 174 105 47 211 102 45 211 102 45 
+212 104 43 208 103 45 210 99 44 217 105 50 216 99 44 212 104 43 212 104 43 211 99 45 
+210 102 46 85 80 60 62 65 65 57 58 61 125 131 132 253 255 254 254 251 252 254 255 251 
+249 254 254 254 252 251 104 112 110 57 60 56 56 66 64 97 78 60 211 104 39 212 101 45 
+210 99 44 210 102 46 211 104 39 211 102 45 210 102 46 217 104 40 212 104 43 212 101 45 
+208 103 45 112 79 60 56 66 64 57 63 61 57 60 56 58 62 65 57 60 56 71 72 69 
+110 110 107 97 100 105 56 64 62 56 66 64 62 61 67 57 58 63 59 64 62 84 69 58 
+185 105 60 208 103 45 209 99 39 212 101 45 210 102 46 207 105 38 207 105 48 213 100 46 
+213 105 46 213 103 41 207 99 38 142 101 66 57 61 64 53 63 60 66 60 61 241 240 247 
+248 251 253 254 251 252 104 112 110 60 64 65 58 62 63 155 104 59 211 99 45 211 102 45 
+208 103 45 212 101 45 213 100 46 211 102 45 209 105 45 210 102 46 211 99 45 212 101 45 
+213 105 46 110 92 61 58 62 65 62 61 67 58 68 63 110 110 107 187 189 188 255 253 254 
+254 254 253 253 255 254 255 255 255 255 255 253 172 178 183 97 100 105 57 58 61 56 66 64 
+53 63 60 112 79 60 213 105 46 216 99 44 207 105 38 212 104 43 210 105 51 212 98 39 
+213 105 46 213 100 46 208 103 45 210 105 51 208 103 45 62 66 62 62 65 65 59 60 62 
+202 204 206 248 254 252 254 255 251 255 254 255 241 240 247 57 63 61 60 64 65 58 62 63 
+140 101 45 213 100 46 212 104 43 209 105 45 212 98 39 212 104 43 213 100 46 212 101 45 
+210 102 46 210 102 46 128 93 57 62 65 65 58 59 64 58 62 65 57 60 56 140 141 138 
+224 220 212 251 251 251 255 255 253 254 252 250 254 255 255 253 255 254 202 204 206 113 113 120 
+62 66 56 59 59 56 62 61 67 69 60 69 174 105 47 209 105 45 212 104 43 216 99 44 
+212 101 45 219 98 50 208 103 45 213 103 41 208 103 45 210 105 40 112 79 60 62 61 67 
+56 66 64 68 69 75 241 240 247 254 251 252 254 255 251 
+253 255 254 255 254 255 254 255 251 254 254 255 242 238 229 0 3 1 0 0 0 109 102 83 
+169 141 58 169 141 58 169 138 59 169 141 58 169 141 58 169 144 61 173 142 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 173 138 52 169 144 61 173 142 59 166 144 56 148 133 63 
+0 1 1 88 95 83 173 142 59 164 134 50 173 145 52 169 144 61 169 144 61 169 141 58 
+169 144 61 173 142 59 182 158 106 254 254 254 248 254 252 254 255 251 254 254 254 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 
+255 255 255 213 212 223 48 49 51 6 9 5 0 0 0 0 1 1 0 0 0 4 2 1 
+0 0 0 0 0 0 4 1 5 0 1 1 4 2 1 0 0 0 6 9 5 202 206 211 
+255 255 255 140 141 138 0 1 1 0 0 0 97 100 105 125 131 132 140 141 138 97 100 105 
+71 72 69 0 0 0 0 0 0 156 160 157 255 255 255 254 254 254 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 132 49 152 124 51 157 127 54 156 124 53 148 128 46 71 72 69 53 60 64 60 64 65 
+62 65 65 81 77 81 187 189 188 241 240 247 250 252 254 253 255 254 248 254 252 230 230 230 
+156 160 157 59 60 64 60 64 65 53 63 60 59 64 62 113 104 59 155 128 52 162 124 55 
+156 126 54 158 125 54 159 126 56 156 125 56 156 128 53 158 126 53 158 125 54 157 126 52 
+147 124 59 68 69 75 57 63 61 57 60 56 187 189 188 254 255 251 248 254 252 253 253 255 
+110 110 107 53 63 60 58 65 69 94 90 61 161 125 43 159 126 56 156 125 56 157 127 54 
+159 134 56 157 124 59 157 124 59 152 124 51 156 126 54 128 99 63 58 62 65 58 62 63 
+62 65 65 97 100 105 241 240 247 255 255 253 253 252 247 254 254 254 250 252 254 254 255 251 
+254 255 251 255 254 255 254 254 255 254 255 251 156 160 157 62 65 65 57 58 61 60 64 65 
+85 80 60 155 126 57 162 125 53 155 127 54 155 128 52 156 125 56 157 127 54 158 125 54 
+157 124 59 161 125 43 113 104 59 56 64 62 58 62 65 56 64 62 230 230 230 254 252 251 
+254 254 255 241 240 247 71 72 69 58 62 65 54 64 59 113 104 59 156 124 53 156 124 53 
+155 127 54 158 125 54 158 125 54 155 127 54 157 127 54 158 125 54 161 124 50 158 132 49 
+128 113 57 71 68 65 57 63 63 58 65 69 59 64 62 140 141 138 213 212 223 253 255 254 
+249 254 254 253 255 254 253 255 254 202 204 206 113 113 120 58 64 64 58 62 65 53 63 60 
+71 65 56 142 120 69 154 129 46 158 124 54 158 127 55 149 124 55 159 126 56 155 128 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 61 64 110 110 107 255 255 253 255 255 253 253 253 253 145 151 154 58 64 64 57 63 63 
+72 76 65 159 126 56 162 124 55 158 126 53 156 124 53 156 128 53 162 124 55 152 124 51 
+158 127 55 158 124 54 157 124 59 155 127 54 97 78 60 53 60 64 58 65 69 59 64 62 
+88 95 83 187 189 188 241 240 247 254 251 249 254 255 251 255 254 255 230 230 230 160 163 161 
+71 72 69 60 64 65 53 67 71 57 58 61 113 104 59 154 129 46 157 124 59 155 126 57 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 253 249 252 251 254 255 251 145 151 154 57 63 61 58 62 65 72 76 65 155 126 57 
+158 124 56 157 124 59 156 126 54 158 127 55 156 126 54 156 125 56 158 124 56 162 124 55 
+128 113 57 59 60 62 58 59 68 62 66 56 88 95 83 224 220 212 254 251 252 253 252 247 
+253 252 247 254 255 251 255 253 254 255 253 254 254 251 249 254 255 251 251 251 251 202 204 206 
+68 69 75 58 66 61 53 64 53 71 68 65 147 124 59 159 126 56 155 128 52 159 126 56 
+155 126 57 161 124 50 158 124 56 159 126 56 152 124 44 142 120 69 62 61 67 57 63 61 
+59 64 62 187 189 188 255 255 255 254 254 254 252 252 252 62 65 65 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+216 99 44 210 105 51 211 102 45 213 105 46 212 101 45 174 105 47 62 70 69 53 60 64 
+56 64 62 60 64 65 125 131 132 224 220 212 255 254 255 255 254 255 253 253 255 249 254 254 
+202 204 206 110 110 107 57 63 61 57 60 56 56 66 64 71 68 65 174 105 47 210 102 46 
+216 99 44 209 105 45 208 103 45 210 99 44 216 99 44 212 101 45 213 105 50 211 102 45 
+216 99 44 155 104 59 59 64 62 59 60 64 68 69 75 254 255 255 254 254 253 251 251 251 
+255 255 255 230 230 230 60 64 65 58 62 65 60 64 65 155 104 59 208 103 45 210 102 46 
+216 99 44 208 103 45 210 105 51 210 102 46 212 98 39 216 99 44 207 99 48 210 102 46 
+112 79 60 59 64 62 50 65 64 54 64 59 71 81 83 154 157 157 230 230 230 253 253 255 
+253 255 254 254 252 250 255 255 253 172 178 183 88 95 83 58 66 61 54 64 59 60 61 69 
+72 73 56 210 99 51 210 105 51 207 105 48 213 103 41 216 99 44 216 99 44 211 99 45 
+209 99 39 211 102 45 210 105 51 210 102 46 71 72 69 58 64 64 66 60 61 156 160 157 
+254 255 255 254 251 252 104 112 110 60 64 65 58 62 63 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 213 100 46 211 102 45 208 103 45 213 103 41 213 103 41 212 104 43 
+155 104 59 58 66 61 53 60 64 53 63 60 140 141 138 254 255 255 249 254 246 254 254 253 
+254 255 251 254 251 252 253 255 254 248 254 252 255 255 253 254 255 255 125 131 132 58 62 63 
+62 61 67 50 65 64 185 105 60 208 103 45 210 105 51 213 100 46 209 105 45 213 103 41 
+208 103 45 212 98 39 210 99 44 209 105 45 213 103 41 84 69 58 53 63 60 58 62 65 
+187 189 188 253 255 254 254 252 250 250 252 254 160 163 161 53 63 60 53 60 64 84 69 58 
+210 105 51 210 105 40 210 102 46 207 105 48 211 104 39 219 98 50 210 105 40 211 99 45 
+210 105 40 185 105 60 62 65 65 58 65 54 58 65 54 68 69 75 213 212 223 255 255 253 
+255 255 255 255 255 255 255 253 254 254 252 251 255 255 253 254 251 252 253 253 253 255 255 255 
+187 189 188 71 72 69 62 61 67 53 67 71 62 66 56 198 102 49 198 102 49 217 98 38 
+209 105 45 213 100 46 211 99 45 216 99 44 216 99 44 207 105 38 198 102 49 71 68 65 
+54 67 66 57 63 63 187 189 188 255 255 255 253 255 254 
+255 255 253 253 253 255 253 252 247 255 255 255 125 131 132 0 3 1 4 2 1 142 120 69 
+169 141 58 169 141 58 169 138 59 169 144 61 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 144 61 169 141 58 169 141 58 169 141 58 169 138 59 173 142 59 169 144 61 
+71 68 65 4 2 1 165 143 59 173 142 59 169 141 58 166 134 56 165 143 59 169 141 58 
+168 136 64 169 144 61 250 247 249 248 254 252 255 255 253 254 254 254 254 251 252 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 251 251 251 255 255 255 
+213 212 223 21 19 24 0 1 1 0 0 0 0 1 1 0 0 0 4 2 1 71 72 69 
+140 141 138 172 178 183 202 204 206 202 204 206 140 141 138 48 49 51 0 1 1 21 19 24 
+160 163 161 0 1 1 145 151 154 241 240 247 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 202 204 206 88 95 83 0 0 0 172 178 183 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 124 44 157 124 59 158 127 55 158 132 49 97 78 60 54 67 66 58 65 69 53 64 53 
+154 157 157 253 255 254 253 252 247 254 255 251 254 252 251 254 250 255 254 250 255 255 253 254 
+254 255 251 224 220 212 97 100 105 60 64 65 54 67 66 58 65 54 128 113 57 162 124 55 
+158 127 55 157 126 52 157 126 52 158 127 55 155 127 54 152 124 44 157 124 59 157 124 59 
+154 129 46 85 80 60 59 60 64 59 64 62 125 131 132 254 255 251 255 255 253 230 230 230 
+57 60 56 59 64 62 53 67 71 147 124 59 162 125 53 155 127 54 155 126 57 158 125 54 
+152 124 44 157 124 59 155 128 52 158 127 55 149 124 53 66 60 61 58 66 61 58 62 65 
+97 100 105 241 240 247 255 255 253 254 254 255 254 254 255 254 255 251 254 255 251 254 255 255 
+254 254 254 254 254 253 254 254 253 254 255 255 253 255 254 187 189 188 58 67 65 53 63 60 
+59 64 62 113 104 59 158 125 54 152 124 51 158 127 55 158 127 55 156 124 53 158 124 53 
+152 127 56 157 126 52 159 126 56 71 72 69 58 62 65 53 63 60 140 141 138 255 254 255 
+255 255 253 172 178 183 58 65 69 58 65 69 68 69 75 155 127 54 159 126 56 158 127 55 
+156 125 56 158 126 53 158 126 53 155 128 52 159 126 56 162 125 53 157 126 52 147 124 59 
+62 65 65 62 66 62 58 59 64 71 72 69 202 206 211 253 253 255 254 255 251 249 254 254 
+254 255 251 255 253 254 254 250 255 255 254 255 249 254 254 172 178 183 58 65 69 58 59 68 
+50 65 64 84 69 58 155 128 52 157 124 59 156 124 53 157 124 59 155 128 52 158 127 55 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 65 110 110 107 255 255 253 255 255 253 253 253 255 81 77 81 57 60 56 62 66 62 
+113 104 59 159 126 56 161 124 50 157 124 59 158 124 56 158 126 53 158 127 55 158 125 54 
+154 129 46 162 125 53 159 126 56 101 91 62 56 66 64 58 67 65 54 64 59 125 131 132 
+241 240 247 255 255 255 253 253 253 255 253 254 254 251 252 255 255 255 251 251 251 254 255 251 
+230 230 230 97 100 105 59 59 56 53 67 71 62 65 65 128 113 57 152 124 51 159 126 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 252 250 255 255 255 253 255 254 71 72 69 57 61 64 59 60 64 113 104 59 161 125 43 
+157 127 54 155 128 52 158 125 54 158 125 54 158 127 55 158 126 53 161 124 50 155 126 57 
+62 70 65 62 66 56 62 65 65 81 77 81 242 238 229 255 255 253 255 254 255 253 252 247 
+253 255 254 254 255 251 254 254 254 251 251 251 255 255 253 252 252 252 252 252 252 253 253 255 
+219 227 224 60 60 63 58 62 65 54 64 59 101 91 62 155 127 54 155 128 52 158 126 53 
+155 127 54 158 127 55 158 124 54 156 128 53 158 127 55 154 129 46 85 80 60 59 64 62 
+59 64 62 104 112 110 254 255 255 253 253 253 255 255 255 62 65 65 57 58 61 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+207 105 38 210 105 51 211 104 39 207 105 48 200 101 40 62 65 65 57 60 56 53 67 71 
+68 69 75 202 204 206 254 252 250 255 255 253 248 254 252 253 255 254 254 254 253 254 255 251 
+254 255 251 255 255 255 172 178 183 54 64 59 62 65 65 53 60 64 71 68 65 212 104 43 
+216 99 44 211 102 45 208 103 45 208 103 45 210 102 46 210 99 44 210 102 46 210 102 46 
+209 99 39 210 105 51 71 65 56 58 62 65 57 61 64 187 189 188 255 255 253 255 255 255 
+255 255 253 140 141 138 53 60 64 57 63 61 81 77 81 213 105 50 217 105 50 208 103 45 
+213 100 46 210 102 46 210 102 46 217 105 50 207 99 48 212 98 39 217 105 50 142 101 66 
+58 62 63 58 65 54 59 64 62 97 100 105 241 240 247 254 255 255 253 255 254 249 254 246 
+254 255 251 253 252 247 252 252 252 249 254 254 248 254 253 156 160 157 59 60 62 53 60 64 
+58 66 61 97 78 60 211 99 45 210 105 51 210 99 44 211 99 45 213 105 46 208 103 45 
+217 105 50 213 100 52 210 102 46 216 99 44 128 93 57 57 58 61 53 67 71 88 95 83 
+248 251 253 255 254 255 104 112 110 58 62 63 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 211 99 45 213 100 46 209 105 45 213 103 41 216 99 44 213 100 46 208 103 45 
+97 78 60 62 65 65 53 67 71 110 110 107 253 255 254 249 252 246 255 254 255 249 254 246 
+253 253 255 254 252 251 254 255 251 254 255 255 254 252 250 254 255 251 254 255 251 97 100 105 
+59 60 64 58 65 54 112 79 60 212 104 43 213 105 50 211 99 45 211 104 39 210 105 51 
+208 103 45 213 103 41 210 105 51 213 105 46 212 104 43 128 93 57 53 63 60 58 64 64 
+154 157 157 253 255 254 254 251 249 254 255 255 71 81 83 56 66 64 66 60 61 142 101 66 
+217 98 38 209 105 45 207 105 38 213 100 46 210 99 51 207 99 38 217 105 50 209 105 45 
+210 102 46 97 78 60 59 60 62 58 65 69 68 69 75 213 212 223 255 255 253 253 252 247 
+253 255 254 249 254 254 254 255 255 255 255 255 255 255 253 255 255 253 254 254 253 255 255 253 
+254 251 252 219 227 224 71 81 83 57 60 56 62 65 65 112 79 60 207 105 48 210 99 44 
+209 99 39 210 99 44 213 100 52 217 98 38 207 99 38 213 105 46 212 101 45 112 79 60 
+59 64 62 59 64 62 81 77 81 249 254 254 253 255 254 
+249 254 246 255 254 255 253 252 247 254 255 255 21 19 24 0 1 1 71 65 56 168 136 64 
+169 141 58 169 141 58 169 141 58 169 144 61 169 141 58 166 144 56 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 144 61 166 134 56 173 142 59 169 141 58 169 138 59 169 138 59 166 144 56 
+109 102 83 4 2 1 142 120 69 169 138 59 169 144 61 169 144 61 169 144 61 173 138 52 
+169 141 58 178 172 162 249 254 254 254 255 251 250 247 249 255 255 255 255 254 255 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 252 252 252 255 255 255 255 255 255 254 254 254 254 254 254 213 212 223 
+48 49 51 4 2 1 0 0 0 0 1 1 4 1 5 113 113 120 202 206 211 255 255 255 
+253 253 253 254 254 254 255 255 255 255 255 255 219 227 224 48 49 51 4 2 1 0 0 0 
+21 19 24 97 100 105 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 255 255 255 
+254 254 254 255 255 255 219 227 224 0 0 0 21 19 24 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 124 59 158 132 49 157 124 59 128 113 57 62 66 56 50 65 64 57 63 61 172 178 183 
+255 255 253 254 255 251 254 255 255 254 255 255 253 255 254 249 252 251 255 255 253 249 252 251 
+254 252 250 255 255 255 241 240 247 68 69 75 57 63 63 58 65 69 84 69 58 150 128 52 
+159 126 56 156 125 56 154 129 46 158 127 55 158 124 56 157 126 52 158 127 55 155 126 57 
+156 129 45 128 99 63 59 60 64 56 64 62 71 72 69 255 255 255 254 255 251 172 178 183 
+60 60 63 58 64 64 72 73 56 158 127 55 157 124 59 155 128 52 152 127 56 158 125 54 
+156 128 53 157 124 59 158 132 49 158 127 55 97 78 60 62 65 65 59 64 62 68 69 75 
+241 240 247 254 255 251 254 255 251 254 255 251 251 251 251 254 255 255 255 255 255 255 253 254 
+253 255 254 251 251 251 255 255 255 255 254 255 254 255 251 249 254 254 113 113 120 56 64 62 
+56 66 64 71 68 65 147 124 59 161 124 50 157 124 59 154 129 46 152 124 51 159 126 56 
+155 127 54 155 128 52 156 124 53 110 92 61 62 66 56 53 60 64 71 72 69 254 254 255 
+255 254 255 113 113 120 58 65 69 59 64 62 101 91 62 158 127 55 152 124 44 156 125 56 
+156 126 54 158 126 53 158 127 55 155 128 52 157 124 59 162 125 53 149 124 55 101 91 62 
+59 64 62 53 64 53 58 66 61 219 227 224 253 253 255 253 255 254 253 253 255 254 251 249 
+255 255 253 251 251 251 249 252 251 253 253 255 255 255 253 254 251 249 172 178 183 62 61 67 
+58 65 69 53 60 64 113 104 59 155 126 57 158 125 54 159 126 56 152 124 51 159 126 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 65 110 110 107 255 255 253 253 253 253 219 227 224 57 63 63 62 70 65 62 66 56 
+155 126 57 157 124 59 157 126 52 157 124 59 159 126 56 161 124 50 155 128 52 159 126 56 
+159 126 56 152 124 44 147 124 59 59 59 56 53 67 71 57 58 61 125 131 132 253 255 254 
+255 255 255 254 255 251 254 255 251 255 255 255 248 251 253 254 255 251 254 255 251 255 255 255 
+253 253 255 250 247 249 71 81 83 58 66 61 53 60 64 72 76 65 158 134 59 161 124 50 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 253 250 252 254 187 189 188 57 63 61 60 61 69 66 60 61 150 126 55 161 124 50 
+156 126 54 154 129 46 156 126 54 156 125 56 158 127 55 161 124 50 157 127 54 113 104 59 
+58 65 69 58 66 61 58 64 64 213 212 223 254 255 255 251 251 251 254 255 251 250 252 254 
+253 255 254 253 253 255 255 255 255 249 252 251 251 251 251 249 254 254 254 255 255 254 255 255 
+254 255 255 160 163 161 59 60 64 58 62 65 62 66 56 142 120 69 162 125 53 155 126 57 
+158 127 55 152 124 51 159 126 56 150 126 55 166 129 59 156 129 45 142 120 69 57 60 56 
+57 63 61 59 64 62 230 230 230 255 255 255 254 254 254 62 65 65 58 62 63 60 64 65 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+209 105 45 207 99 38 213 103 41 208 103 45 110 92 61 58 62 65 54 64 59 68 69 75 
+219 227 224 250 252 254 253 255 254 254 254 253 254 255 251 254 255 251 249 254 254 249 254 254 
+254 255 251 249 254 254 255 255 253 172 178 183 53 63 60 60 64 65 66 60 61 112 79 60 
+210 102 46 210 102 46 211 102 45 209 105 45 213 105 50 210 102 46 212 101 45 210 102 46 
+209 105 45 216 99 44 112 79 60 53 60 64 62 65 65 125 131 132 253 255 254 253 253 253 
+248 254 252 88 95 83 62 61 67 58 65 54 142 101 66 210 99 44 217 98 38 208 103 45 
+208 103 45 213 100 46 212 98 39 217 105 50 198 102 49 211 104 39 198 102 49 71 68 65 
+60 61 69 58 62 65 97 100 105 241 240 247 254 250 255 255 253 254 250 250 247 255 255 253 
+255 253 254 254 255 255 254 252 251 254 255 251 254 255 251 251 251 251 178 172 162 59 60 62 
+57 63 61 51 61 71 174 105 47 208 103 45 217 105 50 208 103 45 208 103 45 207 105 48 
+210 102 46 212 98 39 211 102 45 213 105 50 198 102 49 62 65 65 59 64 62 59 64 62 
+187 189 188 254 251 252 104 112 110 58 62 63 60 64 65 155 104 59 213 105 50 211 102 45 
+213 105 46 212 101 45 212 101 45 209 105 45 210 99 44 217 105 50 210 105 51 198 102 49 
+53 60 64 57 61 64 57 63 61 202 204 206 253 252 247 254 250 255 255 253 254 252 252 252 
+255 255 255 253 255 254 253 253 253 254 255 251 249 254 246 249 252 251 254 255 251 187 189 188 
+62 66 56 51 61 71 71 68 65 213 103 41 207 99 38 213 105 46 210 102 46 211 99 45 
+211 102 45 212 101 45 208 103 45 212 98 39 210 99 44 128 93 57 58 62 65 59 64 62 
+156 160 157 253 255 254 254 251 249 219 227 224 57 63 61 53 63 60 71 65 56 185 105 60 
+212 101 45 209 105 45 217 104 40 216 99 44 207 99 48 213 105 50 209 99 39 209 105 45 
+142 101 66 58 65 54 53 67 71 58 64 64 202 204 206 254 255 251 254 255 255 254 255 251 
+254 255 255 253 253 253 254 255 255 254 255 255 253 253 253 254 254 254 252 252 252 254 255 251 
+253 255 254 250 250 247 178 172 162 57 61 64 62 61 67 58 65 54 185 105 60 213 105 46 
+213 103 41 210 99 51 207 105 38 217 105 50 213 105 46 207 99 38 212 101 45 185 105 60 
+59 59 56 59 64 62 62 66 62 213 212 223 254 255 255 
+254 255 251 255 254 255 248 254 252 156 160 157 4 2 1 0 1 1 109 102 83 173 145 52 
+169 141 58 169 144 61 166 144 56 166 144 56 173 142 59 169 141 58 166 144 56 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+173 138 52 169 144 61 168 136 64 173 142 59 164 144 50 169 141 58 173 138 52 169 141 58 
+137 137 94 0 0 0 109 102 83 173 142 59 169 141 58 169 141 58 166 144 56 173 142 59 
+169 144 61 255 254 255 249 254 246 249 254 246 255 255 255 254 251 252 254 255 251 249 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 252 252 252 253 253 253 255 255 255 241 240 247 71 72 69 
+0 1 1 0 0 0 0 0 0 88 95 83 213 212 223 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 253 253 253 219 227 224 88 95 83 0 0 0 0 0 0 4 2 1 
+0 1 1 145 151 154 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+253 253 253 254 254 254 253 253 253 97 100 105 0 0 0 219 227 224 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 127 56 161 125 43 152 127 56 85 80 60 56 64 62 60 64 65 104 112 110 255 254 255 
+254 255 251 255 255 253 254 254 255 253 253 255 255 255 255 255 255 253 249 252 251 255 255 253 
+254 250 255 248 254 252 253 255 254 202 206 211 57 60 56 53 60 64 60 60 63 128 113 57 
+158 125 54 155 126 57 154 129 46 156 126 54 157 124 59 162 125 53 156 124 53 155 128 52 
+158 124 53 152 127 56 62 70 69 56 66 64 59 59 56 213 212 223 254 255 251 97 100 105 
+62 61 67 53 60 64 113 104 59 157 124 59 159 126 56 154 129 46 157 127 54 158 124 53 
+158 125 54 152 127 56 162 124 52 149 124 55 71 68 65 53 60 64 58 62 65 187 189 188 
+253 253 255 255 254 255 254 251 252 254 252 251 255 255 253 253 253 255 253 253 255 255 254 255 
+254 251 249 255 254 255 254 255 255 254 252 244 253 252 247 255 254 255 230 230 230 57 60 56 
+56 66 64 57 63 61 128 113 57 162 125 53 162 124 55 156 128 53 155 127 54 158 124 54 
+159 126 56 156 124 53 155 128 52 157 124 59 71 65 56 56 66 64 57 63 61 202 206 211 
+254 250 255 72 76 65 53 64 53 59 60 64 128 113 57 159 126 56 157 126 52 158 124 56 
+157 127 54 156 124 53 158 127 55 150 128 52 157 124 59 162 125 53 147 124 59 59 60 64 
+58 64 64 62 61 67 172 178 183 255 255 255 254 252 244 254 252 244 254 252 251 249 254 254 
+248 254 253 253 255 254 255 255 253 255 255 253 253 253 253 253 255 254 249 254 254 140 141 138 
+57 58 61 58 65 69 62 65 65 150 128 52 162 124 52 155 128 52 155 127 54 158 124 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 65 110 110 107 254 252 251 254 255 255 154 157 157 57 63 63 59 59 56 81 77 81 
+161 124 50 156 126 54 150 128 52 152 124 51 161 124 50 158 126 53 155 127 54 158 125 54 
+157 124 59 155 126 57 94 90 61 58 62 65 58 62 63 88 95 83 241 240 247 248 254 252 
+255 255 253 255 255 255 254 255 255 253 255 254 248 254 252 253 255 254 254 255 255 254 254 253 
+254 254 253 253 255 254 224 220 212 59 59 56 58 62 65 59 64 62 113 104 59 162 125 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 254 255 254 255 255 125 131 132 57 61 64 58 62 65 94 90 61 158 127 55 158 124 56 
+157 124 59 158 132 49 158 127 55 152 124 51 156 126 54 162 125 53 147 124 59 72 76 65 
+59 60 62 58 62 65 125 131 132 255 254 255 253 255 254 254 255 251 255 255 253 254 251 249 
+253 252 247 254 255 251 254 255 251 255 255 253 255 255 255 254 255 255 255 255 255 254 255 251 
+253 252 247 254 255 255 81 77 81 56 64 62 62 61 67 110 92 61 155 127 54 156 126 54 
+156 124 53 158 126 53 150 128 52 157 124 59 158 127 55 162 124 52 152 127 56 72 76 65 
+57 63 61 57 63 61 178 172 162 254 254 254 255 255 255 57 58 61 60 64 65 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+212 101 45 213 100 52 213 105 46 198 102 49 56 66 64 62 65 65 60 60 63 172 178 183 
+254 251 249 254 255 251 248 254 252 254 255 255 252 252 252 254 255 251 253 252 247 254 255 251 
+253 253 255 255 254 255 249 254 254 253 252 247 145 151 154 58 65 69 58 65 54 62 65 65 
+200 101 40 210 102 46 216 99 44 216 99 44 210 99 44 212 101 45 212 101 45 213 105 46 
+213 100 46 207 105 48 155 104 59 56 66 64 53 63 60 81 77 81 254 255 255 254 255 255 
+224 220 212 60 61 69 53 63 60 62 70 65 212 98 39 209 105 45 213 103 41 207 105 48 
+211 102 45 210 105 51 216 99 44 207 105 38 213 103 41 213 100 46 128 93 57 54 67 66 
+59 64 62 71 72 69 230 230 230 254 255 251 254 255 251 253 252 247 249 254 246 254 250 255 
+254 255 251 255 255 255 254 252 250 254 255 251 251 251 251 255 254 255 253 253 255 104 112 110 
+57 60 70 62 66 62 71 65 56 209 105 45 211 104 39 207 105 48 212 101 45 216 99 44 
+208 103 45 213 105 46 209 99 39 211 102 45 211 99 45 112 79 60 62 61 67 59 64 62 
+145 151 154 254 251 252 104 112 110 62 65 65 58 62 63 155 104 59 210 102 46 211 102 45 
+212 104 43 211 99 45 211 102 45 208 103 45 208 103 45 217 105 50 210 105 51 174 105 47 
+56 66 64 58 65 54 88 95 83 249 254 254 249 252 251 254 255 251 253 253 255 255 254 255 
+255 255 253 254 255 251 255 255 253 253 253 255 255 254 255 255 254 255 252 252 252 255 254 255 
+68 69 75 62 61 67 53 67 71 155 104 59 217 105 50 211 102 45 208 103 45 213 103 41 
+212 101 45 213 100 46 207 105 48 216 99 44 210 102 46 112 79 60 62 61 67 57 60 56 
+154 157 157 253 255 254 254 255 251 140 141 138 57 63 61 60 64 65 97 78 60 216 99 44 
+212 101 45 210 105 51 209 99 39 216 99 44 212 104 43 208 103 45 210 105 51 216 99 44 
+85 80 60 58 65 54 56 66 64 125 131 132 255 255 253 254 254 255 249 254 246 253 255 254 
+255 255 253 254 252 251 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 253 
+254 251 252 254 255 251 254 255 251 88 95 83 50 65 64 69 60 69 112 79 60 210 99 44 
+213 100 46 208 103 45 210 105 40 207 105 38 207 99 48 217 105 50 208 103 45 209 105 45 
+81 77 81 66 60 61 57 60 56 156 160 157 254 254 255 
+253 252 247 255 255 255 254 252 250 57 58 61 4 1 5 0 0 0 148 133 63 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 21 19 24 71 68 65 166 144 56 169 141 58 169 141 58 166 144 56 169 141 58 
+178 172 162 254 252 244 255 255 255 255 255 255 254 254 253 253 252 247 255 255 253 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 254 254 254 145 151 154 0 1 1 
+0 1 1 0 1 1 125 131 132 254 254 255 255 255 255 252 252 252 255 255 255 255 255 255 
+253 253 253 255 255 255 187 189 188 48 49 51 0 1 1 0 0 0 4 2 1 0 0 0 
+0 1 1 202 204 206 253 253 255 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 
+254 254 254 241 240 247 255 255 255 160 163 161 0 0 0 145 151 154 254 254 254 254 254 254 
+255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 127 54 159 126 56 128 113 57 57 63 63 60 60 63 57 63 63 230 230 230 253 252 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 251 252 255 255 255 254 254 254 254 255 255 140 141 138 57 63 61 59 64 62 71 72 69 
+157 127 54 158 124 53 159 126 56 156 129 45 157 124 59 156 126 54 162 125 53 157 127 54 
+158 127 55 156 125 56 85 80 60 62 61 67 53 63 60 178 172 162 241 240 247 57 61 64 
+53 60 64 66 60 61 149 124 55 152 124 51 157 124 59 155 127 54 158 127 55 158 124 54 
+157 124 59 162 124 52 157 127 54 113 104 59 58 62 65 62 66 56 68 69 75 255 253 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 253 253 253 254 255 255 252 252 252 253 255 254 254 255 255 254 255 255 125 131 132 
+57 60 70 62 65 65 85 80 60 161 124 50 156 124 53 155 128 52 150 128 52 158 124 56 
+159 126 56 154 129 46 155 126 57 156 129 45 97 78 60 57 63 63 59 64 62 156 160 157 
+202 206 211 56 64 62 60 60 63 66 60 61 158 124 54 158 127 55 156 124 53 158 127 55 
+157 127 54 158 125 54 158 124 54 159 126 56 157 126 52 155 128 52 94 90 61 62 65 65 
+58 62 63 81 77 81 254 255 255 254 254 254 251 251 251 255 255 255 255 255 255 253 253 253 
+254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 241 240 247 
+71 72 69 59 64 62 58 62 65 113 104 59 157 124 59 156 129 45 158 127 55 157 124 59 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 64 64 104 112 110 255 255 253 253 253 255 104 112 110 58 62 65 60 61 69 113 104 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 142 120 69 62 61 67 54 64 59 59 64 62 202 204 206 254 254 254 253 252 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 254 255 253 252 247 125 131 132 60 60 63 58 65 69 72 76 65 152 124 51 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 251 255 255 253 88 95 83 54 64 59 53 67 71 140 101 45 157 124 59 156 125 56 
+156 128 53 156 124 53 155 126 57 157 124 59 152 124 51 158 132 49 142 120 69 56 64 62 
+57 63 61 59 64 62 230 230 230 254 255 251 255 255 253 249 252 251 255 255 253 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 253 254 160 163 161 59 64 62 58 66 61 72 76 65 157 126 52 158 127 55 
+158 124 56 158 127 55 152 124 44 158 124 56 157 124 59 157 126 52 152 127 56 110 92 61 
+57 63 61 62 65 65 113 113 120 255 255 253 255 255 255 57 63 61 57 60 56 62 61 67 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 217 104 40 209 99 39 112 79 60 56 66 64 62 61 67 110 110 107 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 255 255 255 254 254 254 252 252 252 241 240 247 71 72 69 58 64 64 56 64 62 
+128 93 57 213 105 50 210 102 46 211 104 39 212 101 45 212 98 39 209 105 45 209 105 45 
+210 102 46 213 100 52 211 104 39 59 60 62 56 66 64 58 62 65 230 230 230 254 255 255 
+152 161 158 57 63 61 60 60 63 97 78 60 207 105 48 212 104 43 212 101 45 212 104 43 
+213 103 41 213 100 46 216 99 44 210 105 40 217 105 50 210 105 51 71 68 65 60 60 63 
+57 63 61 156 160 157 254 254 254 255 255 255 255 253 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 230 230 230 
+50 65 64 58 59 64 58 67 65 155 104 59 209 105 45 213 100 46 210 99 44 212 104 43 
+207 99 48 211 104 39 211 102 45 208 103 45 219 98 50 140 101 45 54 67 66 60 64 65 
+97 100 105 255 255 255 104 112 110 62 65 65 60 60 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 61 125 131 132 254 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+104 112 110 60 60 63 59 60 62 128 99 63 216 99 44 210 99 44 212 101 45 208 103 45 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 254 255 251 255 255 253 97 100 105 62 61 67 53 67 71 140 101 45 213 100 46 
+213 103 41 210 99 51 210 102 46 212 101 45 219 98 50 207 105 38 211 104 39 198 102 49 
+56 64 62 57 63 61 57 58 61 224 220 212 253 253 253 254 255 251 255 255 253 254 255 251 
+255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 
+255 255 255 250 252 246 255 255 255 187 189 188 57 63 63 57 63 61 71 68 65 210 99 44 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+142 101 66 57 63 61 57 63 61 104 112 110 249 254 254 
+255 255 253 251 251 251 187 189 188 6 9 5 0 0 0 62 66 56 169 144 61 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 144 61 109 102 83 0 1 1 148 133 63 169 141 58 169 138 59 169 141 58 169 141 58 
+224 220 212 254 255 251 251 251 251 253 253 255 254 254 253 254 255 251 255 255 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 252 252 252 253 253 253 255 255 255 71 68 65 0 0 0 
+0 1 1 71 72 69 241 240 247 254 254 254 255 255 255 251 251 251 253 253 253 241 240 247 
+172 178 183 97 100 105 4 1 5 0 0 0 0 1 1 0 1 1 0 1 1 0 0 0 
+4 1 5 202 204 206 255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 
+251 251 251 241 240 247 251 251 251 230 230 230 0 1 1 21 19 24 255 255 255 255 255 255 
+252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 124 51 159 126 56 97 78 60 59 64 62 62 61 67 125 131 132 249 254 254 254 254 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 253 253 253 253 253 253 254 255 255 230 230 230 59 64 62 59 64 62 57 60 56 
+142 120 69 156 124 53 158 127 55 157 126 52 157 124 59 156 126 54 162 125 53 156 126 54 
+156 124 53 158 124 56 101 91 62 58 62 65 53 63 60 140 141 138 187 189 188 60 64 65 
+56 66 64 72 76 65 157 124 59 155 128 52 159 126 56 156 126 54 156 126 54 158 125 54 
+155 127 54 157 126 52 154 129 46 101 91 62 53 60 64 58 65 54 113 113 120 202 204 206 
+202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 
+202 204 206 202 204 206 202 204 206 202 206 211 202 204 206 202 204 206 202 204 206 156 160 157 
+53 63 60 59 64 62 72 76 65 155 128 52 158 127 55 157 126 52 155 127 54 162 124 55 
+159 126 56 155 127 54 157 127 54 158 127 55 113 104 59 58 65 69 57 63 61 104 112 110 
+160 163 161 53 63 60 62 65 65 85 80 60 159 126 56 155 127 54 158 127 55 156 124 53 
+156 126 54 158 124 54 158 125 54 159 126 56 152 124 51 155 126 57 72 76 65 57 63 61 
+60 64 65 187 189 188 253 253 255 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 
+140 141 138 62 65 65 54 64 59 85 80 60 162 124 55 154 129 46 156 124 53 157 124 59 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 255 255 253 253 253 255 59 64 62 53 60 64 62 65 65 142 120 69 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 110 92 61 57 61 64 60 64 65 97 100 105 254 252 251 254 255 255 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+249 252 246 254 250 255 254 255 251 230 230 230 60 60 63 58 65 69 59 59 56 147 124 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 253 230 230 230 59 60 64 57 63 61 58 62 65 147 124 59 158 125 54 156 126 54 
+156 126 54 157 126 52 158 134 59 156 125 56 156 124 53 156 124 53 128 99 63 60 61 69 
+59 60 62 88 95 83 202 204 206 202 206 211 202 204 206 202 206 211 202 204 206 202 206 211 
+202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 
+202 206 211 202 204 206 187 189 188 57 58 63 58 65 69 60 60 63 155 126 57 155 128 52 
+158 124 56 158 127 55 155 128 52 158 127 55 158 124 54 157 126 52 156 128 53 128 113 57 
+57 63 61 58 62 65 71 72 69 251 251 251 255 255 255 53 63 60 58 66 61 59 60 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 209 99 39 210 105 51 84 69 58 58 64 64 57 58 63 187 189 188 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 254 254 254 253 253 253 255 255 255 255 255 255 156 160 157 58 64 64 60 64 65 
+97 78 60 207 99 48 212 104 43 209 105 45 213 105 50 211 102 45 213 105 50 211 99 45 
+213 105 46 211 99 45 212 104 43 85 80 60 53 63 60 60 64 65 187 189 188 254 255 255 
+104 112 110 59 64 62 60 64 65 128 93 57 207 105 48 212 104 43 213 105 46 212 104 43 
+208 103 45 213 105 50 217 105 50 208 103 45 207 99 38 155 104 59 57 63 61 60 64 65 
+71 72 69 241 240 247 255 255 255 255 255 255 254 251 252 252 252 252 255 255 255 255 255 255 
+253 253 253 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 252 252 252 
+125 131 132 58 62 65 59 60 64 97 78 60 212 98 39 213 105 50 217 105 50 208 103 45 
+213 105 50 209 99 39 209 105 45 211 102 45 213 100 46 185 105 60 59 64 62 58 62 63 
+60 64 65 241 240 247 104 112 110 58 62 63 60 64 65 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 60 64 65 154 157 157 254 255 255 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+154 157 157 62 65 65 57 63 61 128 93 57 217 105 50 209 105 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+160 163 161 249 254 254 241 240 247 60 60 63 60 60 63 56 66 64 198 102 49 210 99 44 
+210 99 44 208 103 45 211 102 45 213 100 46 213 100 46 210 105 40 211 102 45 155 104 59 
+58 65 69 58 62 63 88 95 83 202 204 206 202 206 211 202 206 211 202 204 206 202 204 206 
+202 206 211 202 206 211 202 206 211 202 206 211 202 206 211 202 206 211 202 206 211 202 206 211 
+202 206 211 202 204 206 202 206 211 202 204 206 58 65 69 58 64 64 60 60 63 198 102 49 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+185 105 60 60 64 65 57 60 56 62 66 62 253 255 254 
+255 255 253 254 252 251 97 100 105 0 1 1 0 1 1 109 102 83 169 144 61 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 142 120 69 4 1 5 128 100 96 173 142 59 173 142 59 169 138 59 169 144 61 
+254 252 250 255 255 253 250 252 254 253 253 255 254 254 254 255 255 253 255 255 253 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 0 1 1 4 2 1 
+0 0 0 97 100 105 202 204 206 202 204 206 156 160 157 140 141 138 97 100 105 0 1 1 
+0 0 0 4 2 1 0 0 0 4 2 1 4 2 1 4 2 1 0 0 0 6 9 5 
+0 1 1 202 204 206 255 255 255 252 252 252 251 251 251 254 254 254 255 255 255 255 255 255 
+241 240 247 224 220 212 255 255 255 255 255 255 125 131 132 0 1 1 154 157 157 255 255 255 
+255 255 255 251 251 251 254 254 254 255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 156 125 56 71 68 65 56 66 64 58 59 68 187 189 188 255 255 253 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 254 254 254 253 253 253 97 100 105 57 63 61 59 64 62 
+110 92 61 155 127 54 158 127 55 158 125 54 157 124 59 156 126 54 159 126 56 155 127 54 
+158 127 55 156 124 53 128 113 57 57 61 64 62 65 65 104 112 110 156 160 157 57 63 63 
+56 66 64 94 90 61 158 127 55 155 128 52 158 125 54 156 126 54 156 124 53 159 126 56 
+155 126 57 156 126 54 154 129 46 81 77 81 51 61 71 56 66 64 60 64 65 57 58 61 
+59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 
+57 63 61 62 65 65 53 63 60 59 64 62 56 66 64 56 64 62 56 64 62 56 64 62 
+59 64 62 62 61 67 59 64 62 156 124 53 159 126 56 158 124 53 156 125 56 158 124 53 
+158 126 53 156 124 53 156 124 53 158 124 54 128 113 57 60 60 63 59 60 62 62 65 65 
+140 141 138 53 63 60 60 60 63 101 91 62 157 126 52 152 124 51 158 127 55 158 127 55 
+156 126 54 158 124 54 159 126 56 157 126 52 155 127 54 128 113 57 59 59 56 57 63 61 
+62 70 69 253 253 255 254 255 255 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+230 230 230 59 64 62 56 66 64 60 60 63 155 126 57 156 125 56 159 126 56 158 125 54 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 104 112 110 251 251 251 219 227 224 57 63 61 58 64 64 62 66 56 147 124 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 72 76 65 62 65 65 58 62 63 172 178 183 254 252 250 253 255 254 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 254 250 255 254 254 254 254 255 255 88 95 83 58 62 65 62 65 65 113 104 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+249 252 251 187 189 188 62 61 67 59 64 62 72 76 65 155 126 57 158 126 53 156 124 53 
+157 127 54 161 124 50 158 125 54 155 127 54 159 126 56 162 125 53 101 91 62 57 60 56 
+58 62 65 53 60 64 60 64 65 59 60 64 62 61 67 59 60 64 60 64 65 62 70 69 
+59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 
+58 62 65 62 65 65 56 64 62 59 64 62 53 63 60 60 61 69 128 113 57 158 124 56 
+158 124 56 156 126 54 155 128 52 157 127 54 156 124 53 157 126 52 156 128 53 147 124 59 
+59 64 62 57 61 64 57 63 61 230 230 230 253 253 255 57 60 56 58 68 63 58 62 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 208 103 45 174 105 47 58 65 54 58 64 64 58 62 65 251 251 251 249 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 255 255 255 254 254 254 255 255 255 255 255 255 230 230 230 60 64 65 57 63 63 
+57 63 61 198 102 49 213 103 41 209 105 45 210 99 51 208 103 45 213 100 46 216 99 44 
+207 99 38 217 105 50 213 103 41 97 78 60 60 64 65 57 60 56 160 163 161 254 255 251 
+71 72 69 57 63 61 57 58 61 185 105 60 211 102 45 212 101 45 211 104 39 212 101 45 
+209 105 45 211 99 45 213 100 46 208 103 45 210 105 51 112 79 60 56 64 62 53 60 64 
+125 131 132 254 255 255 253 253 253 255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 
+187 189 188 53 63 60 62 61 67 71 72 69 213 105 46 210 99 44 211 99 45 210 105 51 
+216 99 44 208 103 45 209 105 45 212 101 45 210 99 44 217 105 50 71 68 65 58 64 64 
+60 64 65 202 204 206 104 112 110 58 62 63 57 58 61 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+53 63 60 57 63 63 160 163 161 253 255 254 254 254 254 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+160 163 161 53 63 60 62 66 62 112 79 60 210 102 46 208 103 45 211 102 45 208 103 45 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+160 163 161 250 252 254 202 206 211 66 60 61 58 62 63 72 76 65 211 102 45 213 105 50 
+212 104 43 208 103 45 208 103 45 209 105 45 207 105 48 207 99 38 217 105 50 128 99 63 
+53 60 64 58 65 69 58 62 63 58 62 63 60 60 63 60 64 65 57 58 61 62 65 65 
+60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 
+58 62 65 62 66 62 57 63 61 57 60 56 56 66 64 53 63 60 59 64 62 155 104 59 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 68 69 75 53 60 64 60 60 63 202 204 206 
+254 251 252 242 238 229 6 9 5 4 2 1 4 1 5 142 120 69 164 144 50 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 168 136 64 48 49 51 85 80 60 166 134 56 173 138 52 169 141 58 182 158 106 
+255 254 255 253 253 253 255 255 253 254 255 255 254 254 254 254 254 255 255 255 255 254 254 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 251 251 251 255 255 255 253 253 253 48 49 51 0 0 0 
+4 2 1 0 0 0 4 1 5 0 0 0 0 1 1 0 1 1 4 1 5 0 1 1 
+4 2 1 0 1 1 0 1 1 4 2 1 0 0 0 0 0 0 4 2 1 0 0 0 
+4 2 1 202 204 206 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 
+250 247 249 224 220 212 250 247 249 251 251 251 230 230 230 21 19 24 21 19 24 242 238 229 
+250 247 249 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 149 124 55 57 63 63 53 63 60 58 59 68 241 240 247 254 255 251 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 254 254 254 255 255 255 255 255 255 254 255 255 160 163 161 58 64 64 57 58 61 
+85 80 60 150 128 52 155 128 52 158 127 55 158 124 56 156 126 54 159 126 56 155 127 54 
+156 124 53 158 127 55 147 124 59 57 61 64 59 60 64 57 63 63 110 110 107 57 63 63 
+59 64 62 110 92 61 158 127 55 155 128 52 158 125 54 158 126 53 152 124 51 159 126 56 
+156 124 53 156 126 54 155 128 52 71 68 65 58 65 69 57 60 56 57 58 61 56 66 64 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 
+58 62 65 58 62 65 58 62 65 57 61 64 58 62 65 60 64 65 57 61 64 58 62 65 
+56 64 62 54 67 66 54 64 59 128 113 57 157 124 59 158 127 55 158 126 53 158 125 54 
+158 127 55 156 124 53 158 125 54 157 124 59 150 128 52 59 64 62 60 64 65 57 63 61 
+104 112 110 57 63 61 60 64 65 113 104 59 158 126 53 159 134 56 158 125 54 156 125 56 
+156 126 54 159 126 56 156 126 54 152 124 44 158 127 55 110 92 61 58 62 65 56 64 62 
+125 131 132 254 255 255 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 
+254 255 255 81 77 81 58 65 69 62 61 67 128 113 57 158 127 55 156 124 53 157 126 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 104 112 110 255 255 255 202 204 206 57 60 56 59 64 62 85 80 60 157 124 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 124 59 60 64 65 58 62 63 60 64 65 230 230 230 255 255 253 248 254 252 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 252 247 253 253 255 254 254 255 255 255 255 156 160 157 56 64 62 58 62 65 85 80 60 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 255 160 163 161 59 60 64 57 63 61 94 90 61 156 128 53 161 124 50 156 124 53 
+157 124 59 159 126 56 161 124 50 155 128 52 156 125 56 155 126 57 85 80 60 58 65 69 
+56 64 62 56 66 64 53 63 60 56 66 64 57 63 63 57 63 63 53 63 60 56 64 62 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 
+54 64 59 59 64 62 53 63 60 62 61 67 60 64 65 53 63 60 113 104 59 158 132 49 
+158 125 54 156 124 53 156 126 54 156 126 54 156 125 56 158 125 54 156 126 54 156 128 53 
+72 76 65 57 63 63 58 64 64 202 204 206 253 253 255 62 70 69 56 64 62 58 62 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 46 210 99 44 142 101 66 56 66 64 57 61 64 110 110 107 255 255 253 254 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 97 100 105 60 64 65 
+50 65 64 155 104 59 210 105 40 208 103 45 213 100 46 208 103 45 210 102 46 216 99 44 
+213 105 46 211 99 45 209 99 39 128 93 57 58 62 63 59 64 62 125 131 132 241 240 247 
+59 64 62 57 63 61 62 65 65 198 102 49 211 99 45 213 105 46 207 99 38 213 100 46 
+213 100 46 211 99 45 213 100 46 213 103 41 213 100 52 84 69 58 58 62 65 58 62 65 
+187 189 188 252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 254 254 254 
+253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 
+254 255 251 59 64 62 58 62 65 51 61 71 174 105 47 216 99 44 208 103 45 210 102 46 
+212 98 39 210 102 46 211 102 45 210 99 51 211 102 45 216 99 44 97 78 60 60 64 65 
+58 62 63 154 157 157 104 112 110 58 62 63 62 70 69 155 104 59 211 99 45 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+154 157 157 58 62 63 59 64 62 112 79 60 210 102 46 209 105 45 213 105 50 210 99 44 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 253 255 172 178 183 59 59 56 53 60 64 101 91 62 217 98 38 210 99 44 
+212 101 45 212 104 43 213 100 46 212 98 39 210 99 51 213 105 50 207 105 48 97 78 60 
+56 66 64 53 63 60 58 64 64 60 64 65 57 63 63 60 64 65 56 64 62 56 64 62 
+58 64 64 58 64 64 58 64 64 58 64 64 58 64 64 58 64 64 58 64 64 58 64 64 
+58 62 65 57 63 61 58 62 65 62 65 65 58 65 69 58 65 69 58 65 69 128 93 57 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+217 98 38 84 69 58 60 64 65 58 64 64 202 204 206 
+255 253 254 160 163 161 4 1 5 0 0 0 4 1 5 148 133 63 169 138 59 173 142 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 173 142 59 85 80 60 4 1 5 158 134 59 169 141 58 165 143 59 178 172 162 
+254 254 255 254 255 251 254 255 251 254 255 251 255 255 255 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 254 254 254 125 131 132 0 0 0 
+0 1 1 0 0 0 0 1 1 4 2 1 0 0 0 0 0 0 0 1 1 6 9 5 
+0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 4 1 5 0 0 0 
+21 19 24 255 255 255 255 255 255 253 253 253 252 252 252 255 255 255 252 252 252 255 255 255 
+253 253 253 224 220 212 219 227 224 255 255 255 255 255 255 145 151 154 0 0 0 125 131 132 
+255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 128 93 57 53 63 60 60 64 65 97 100 105 255 255 253 254 251 249 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 252 252 252 251 251 251 254 255 255 202 206 211 58 62 63 58 62 63 
+71 68 65 155 128 52 157 126 52 157 124 59 158 124 53 158 126 53 159 126 56 155 127 54 
+159 126 56 158 127 55 156 128 53 62 65 65 62 61 67 58 62 65 104 112 110 60 64 65 
+58 62 63 128 113 57 156 126 54 156 124 53 156 126 54 159 126 56 156 124 53 158 127 55 
+157 127 54 152 127 56 155 126 57 84 69 58 72 73 56 85 80 60 71 72 69 72 76 65 
+72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 
+72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 
+85 80 60 85 80 60 85 80 60 128 113 57 157 124 59 152 124 44 154 129 46 157 127 54 
+157 127 54 156 124 53 159 126 56 159 126 56 158 132 49 71 68 65 62 61 67 59 64 62 
+81 77 81 59 64 62 58 62 63 128 113 57 152 124 44 155 128 52 156 124 53 156 125 56 
+156 124 53 159 126 56 152 124 51 158 126 53 155 128 52 97 78 60 58 65 69 56 66 64 
+154 157 157 253 255 254 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 253 253 253 
+254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 125 131 132 53 60 64 58 62 65 101 91 62 156 124 53 159 126 56 156 128 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 254 254 255 156 160 157 62 65 65 57 58 61 94 90 61 156 124 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+128 113 57 54 67 66 58 62 65 88 95 83 254 255 251 255 254 255 248 254 252 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 254 255 253 253 253 255 255 255 202 204 206 57 63 61 58 62 65 72 76 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 251 125 131 132 62 61 67 59 64 62 101 91 62 152 124 44 157 126 52 159 126 56 
+158 127 55 158 125 54 156 124 53 155 128 52 159 126 56 155 127 54 94 90 61 72 73 56 
+72 76 65 72 76 65 72 76 65 72 76 65 72 73 56 72 76 65 85 80 60 72 76 65 
+72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 
+72 73 56 72 76 65 72 76 65 72 76 65 85 80 60 72 76 65 113 104 59 155 126 57 
+159 126 56 158 126 53 158 127 55 156 126 54 158 127 55 157 124 59 158 124 54 157 126 52 
+85 80 60 62 66 62 62 65 65 187 189 188 253 253 253 58 62 63 57 63 61 58 65 69 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 213 100 46 112 79 60 58 65 69 53 60 64 156 160 157 249 252 251 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 140 141 138 58 64 64 
+58 62 65 112 79 60 208 103 45 213 103 41 213 105 46 210 102 46 208 103 45 211 102 45 
+211 102 45 210 99 44 212 104 43 155 104 59 59 60 64 60 64 65 110 110 107 202 204 206 
+57 63 63 60 64 65 71 72 69 217 104 40 210 99 44 210 102 46 208 103 45 210 102 46 
+216 99 44 211 102 45 211 102 45 213 103 41 210 99 51 58 64 64 57 58 61 60 64 65 
+241 240 247 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 253 110 110 107 58 67 65 54 67 66 142 101 66 212 98 39 208 103 45 212 101 45 
+207 105 38 213 100 52 216 99 44 210 99 51 213 105 46 212 98 39 128 93 57 53 63 60 
+58 62 63 156 160 157 104 112 110 58 64 64 57 58 61 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 60 64 65 154 157 157 254 255 255 253 253 253 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+160 163 161 62 65 65 53 63 60 128 93 57 210 102 46 208 103 45 213 100 46 212 101 45 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 255 254 255 154 157 157 58 66 61 58 65 69 112 79 60 213 103 41 213 105 50 
+211 102 45 213 100 46 217 105 50 212 98 39 213 100 46 213 105 50 200 101 40 128 93 57 
+84 69 58 85 80 60 84 69 58 85 80 60 84 69 58 85 80 60 85 80 60 85 80 60 
+85 80 60 85 80 60 85 80 60 85 80 60 85 80 60 85 80 60 85 80 60 85 80 60 
+97 78 60 84 69 58 97 78 60 97 78 60 84 69 58 85 80 60 85 80 60 142 101 66 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 46 112 79 60 53 63 60 54 67 66 154 157 157 
+255 254 255 81 77 81 0 1 1 0 0 0 71 68 65 169 144 61 169 138 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+168 136 64 173 142 59 109 102 83 4 1 5 142 120 69 169 138 59 169 138 59 224 220 212 
+254 254 253 254 255 251 253 252 247 253 252 247 255 255 253 255 255 255 255 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 254 254 254 253 253 253 253 253 253 241 240 247 48 49 51 
+0 0 0 0 1 1 0 0 0 4 2 1 0 0 0 0 1 1 6 9 5 0 0 0 
+4 1 5 0 0 0 0 0 0 4 2 1 4 2 1 4 1 5 0 1 1 0 0 0 
+213 212 223 253 253 253 252 252 252 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 
+255 255 255 219 227 224 224 220 212 242 238 229 252 252 252 241 240 247 71 72 69 4 2 1 
+219 227 224 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 56 128 99 63 53 64 53 57 61 64 110 110 107 255 255 255 255 253 254 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 254 255 255 57 60 56 58 64 64 
+62 61 67 155 128 52 161 124 50 156 125 56 161 124 50 157 126 52 158 127 55 155 127 54 
+158 124 53 156 126 54 152 124 51 71 68 65 62 61 67 53 60 64 62 70 65 60 64 65 
+58 62 65 147 124 59 158 127 55 156 125 56 156 126 54 158 125 54 156 125 56 156 126 54 
+162 125 53 159 126 56 161 125 43 158 134 59 155 126 57 155 128 52 157 127 54 156 129 45 
+155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 
+158 124 53 158 125 54 158 124 53 159 126 56 156 124 53 158 124 53 158 125 54 159 126 56 
+158 124 54 156 124 53 150 126 55 162 125 53 166 129 59 156 129 45 155 127 54 155 126 57 
+156 124 53 156 126 54 158 124 56 152 124 51 155 128 52 72 76 65 62 61 67 57 63 61 
+58 62 63 62 66 62 58 62 65 157 124 59 158 127 55 155 128 52 159 126 56 156 124 53 
+156 126 54 156 124 53 158 127 55 158 126 53 155 128 52 85 80 60 58 62 65 56 66 64 
+202 206 211 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 156 160 157 59 64 62 58 62 65 101 91 62 159 126 56 158 126 53 152 124 51 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+60 64 65 104 112 110 255 254 255 154 157 157 58 62 63 62 61 67 101 91 62 159 126 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+128 99 63 53 63 60 58 62 65 110 110 107 253 252 247 255 254 255 248 254 252 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 255 255 255 255 255 254 254 254 241 240 247 62 66 62 60 64 65 57 58 61 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 251 104 112 110 59 64 62 57 63 61 128 99 63 158 126 53 159 126 56 152 124 51 
+156 129 45 158 127 55 166 129 59 156 124 53 158 124 53 161 125 43 155 126 57 152 127 56 
+156 125 56 156 125 56 156 124 53 158 127 55 159 126 56 156 124 53 158 127 55 156 125 56 
+155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 
+158 127 55 157 124 59 152 124 51 155 128 52 152 124 51 152 127 56 158 134 59 161 124 50 
+158 125 54 158 126 53 158 127 55 156 125 56 156 124 53 157 124 59 157 124 59 158 127 55 
+101 91 62 62 66 56 57 58 61 156 160 157 255 255 253 62 65 65 58 64 64 58 62 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 99 44 217 105 50 84 69 58 57 61 64 58 65 69 187 189 188 255 255 253 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 255 255 255 255 255 254 254 254 254 254 254 187 189 188 57 63 61 
+59 59 56 85 80 60 209 105 45 210 99 44 212 101 45 212 101 45 207 105 38 210 102 46 
+210 99 44 213 105 50 210 99 44 174 105 47 62 61 67 58 62 63 104 112 110 202 206 211 
+60 64 65 58 62 65 84 69 58 217 104 40 212 101 45 210 99 44 213 105 50 210 102 46 
+213 100 46 208 103 45 208 103 45 212 104 43 185 105 60 54 67 66 57 58 61 71 81 83 
+255 255 255 251 251 251 251 251 251 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 253 253 253 255 255 255 
+254 255 255 140 141 138 62 66 62 53 63 60 128 93 57 212 104 43 213 105 46 217 105 50 
+209 105 45 210 102 46 213 103 41 210 105 51 212 101 45 207 105 38 142 101 66 56 66 64 
+60 64 65 110 110 107 104 112 110 62 65 65 58 62 63 155 104 59 210 102 46 210 99 44 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+53 63 60 58 64 64 154 157 157 254 255 255 254 254 254 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+154 157 157 58 62 63 59 64 62 112 79 60 213 100 46 208 103 45 211 99 45 213 105 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 251 251 251 113 113 120 58 68 63 58 65 69 142 101 66 207 105 38 211 99 45 
+213 105 50 210 99 44 207 105 48 209 105 45 210 102 46 207 99 48 213 103 41 210 105 51 
+210 99 44 211 102 45 213 105 46 212 104 43 213 105 46 210 99 44 210 99 44 213 105 46 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 211 102 45 208 103 45 208 103 45 209 105 45 209 105 45 212 101 45 217 98 38 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 99 51 128 93 57 57 63 63 53 67 71 160 163 161 
+255 255 255 0 0 0 0 1 1 4 2 1 94 90 61 164 134 50 173 142 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 144 61 169 138 59 142 120 69 4 1 5 88 95 83 169 141 58 169 144 61 202 204 206 
+254 252 251 255 255 253 252 252 252 255 255 253 255 255 253 254 254 253 254 254 253 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 187 189 188 
+4 2 1 0 0 0 4 2 1 0 0 0 0 0 0 0 1 1 0 0 0 4 2 1 
+0 1 1 0 0 0 4 2 1 0 0 0 0 0 0 0 0 0 0 0 0 4 1 5 
+255 255 255 253 253 253 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 252 252 252 
+253 253 253 230 230 230 224 220 212 213 212 223 254 254 254 255 255 255 172 178 183 0 0 0 
+88 95 83 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 125 56 110 92 61 57 63 61 58 65 69 145 151 154 254 255 255 255 253 254 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 254 254 254 255 255 255 255 255 255 251 251 251 253 255 254 62 65 65 57 63 63 
+58 62 65 156 128 53 162 124 52 156 125 56 158 126 53 156 124 53 156 126 54 156 126 54 
+156 124 53 156 126 54 159 126 56 72 76 65 59 60 64 60 61 69 54 64 59 58 59 64 
+58 62 65 156 124 53 157 127 54 156 125 56 156 128 53 158 124 53 158 127 55 156 126 54 
+155 128 52 150 128 52 155 128 52 156 124 53 155 127 54 158 124 56 152 124 51 159 126 56 
+155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 
+157 126 52 158 126 53 157 126 52 157 126 52 157 126 52 157 126 52 157 126 52 157 126 52 
+159 126 56 157 127 54 155 126 57 158 125 54 158 124 54 152 124 51 156 124 53 155 127 54 
+156 125 56 157 127 54 158 125 54 149 124 55 158 126 53 71 72 69 60 64 65 59 64 62 
+58 64 64 59 64 62 53 60 64 158 127 55 158 127 55 152 124 51 158 124 56 158 127 55 
+156 126 54 156 124 53 158 127 55 156 124 53 156 128 53 72 76 65 59 64 62 57 63 63 
+202 204 206 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 
+253 255 254 172 178 183 59 64 62 58 65 69 72 73 56 158 124 56 152 124 51 158 127 55 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+62 65 65 97 100 105 254 254 255 160 163 161 57 58 61 62 61 67 94 90 61 158 127 55 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+101 91 62 62 61 67 53 63 60 145 151 154 255 255 255 254 251 252 254 255 251 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 255 255 253 253 253 253 255 255 255 253 255 254 59 64 62 57 63 61 58 65 69 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 252 251 104 112 110 58 66 61 56 66 64 128 99 63 157 126 52 156 125 56 156 128 53 
+157 126 52 157 124 59 155 126 57 157 126 52 159 126 56 158 124 53 162 124 55 158 124 54 
+158 127 55 156 124 53 166 129 59 152 124 51 156 124 53 159 126 56 156 124 53 158 127 55 
+155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 155 128 52 
+158 127 55 158 124 56 158 127 55 158 134 59 158 124 56 157 126 52 150 126 55 155 128 52 
+156 125 56 157 126 52 158 125 54 157 124 59 156 124 53 156 124 53 158 127 55 158 125 54 
+94 90 61 59 64 62 58 65 69 156 160 157 253 253 253 58 62 65 60 64 65 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 50 209 99 39 85 80 60 59 60 62 58 62 65 202 204 206 255 255 253 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 254 255 255 255 255 255 253 253 253 255 255 255 202 204 206 62 65 65 
+59 60 62 85 80 60 212 104 43 210 102 46 211 99 45 212 101 45 209 99 39 210 102 46 
+212 104 43 209 105 45 211 99 45 198 102 49 62 61 67 57 60 56 60 64 65 187 189 188 
+59 64 62 58 62 63 97 78 60 209 105 45 210 102 46 210 99 44 211 102 45 210 102 46 
+212 101 45 209 105 45 210 102 46 208 103 45 174 105 47 57 61 64 56 66 64 110 110 107 
+251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 254 254 254 
+254 254 254 252 252 252 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 
+254 252 251 160 163 161 59 59 56 56 64 62 128 99 63 209 99 39 211 99 45 211 102 45 
+213 105 50 211 102 45 209 99 39 210 102 46 210 99 44 209 105 45 155 104 59 56 66 64 
+53 63 60 113 113 120 104 112 110 57 58 61 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 64 62 58 64 64 156 160 157 253 255 254 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+160 163 161 58 64 64 62 65 65 112 79 60 212 101 45 213 105 46 213 100 46 211 99 45 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 252 252 252 110 110 107 53 63 60 58 59 64 155 104 59 207 105 48 211 102 45 
+213 100 46 208 103 45 213 100 46 208 103 45 212 101 45 213 105 50 209 105 45 210 102 46 
+212 101 45 217 105 50 211 99 45 213 100 46 212 98 39 217 105 50 213 100 46 213 100 46 
+213 100 46 213 100 46 213 100 46 213 100 46 213 100 46 213 100 46 213 100 46 213 100 46 
+212 104 43 213 100 46 208 103 45 211 102 45 209 99 39 209 99 39 217 104 40 213 105 50 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 102 46 110 92 61 54 64 59 53 63 60 156 160 157 
+187 189 188 0 0 0 4 1 5 4 1 5 109 102 83 173 142 59 169 141 58 165 143 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 166 144 56 142 120 69 0 0 0 71 72 69 169 141 58 169 138 59 202 204 206 
+255 255 253 255 255 255 254 255 255 255 255 255 254 252 251 254 255 251 254 252 251 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 
+172 178 183 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
+0 0 0 0 0 0 4 2 1 0 0 0 4 2 1 0 1 1 71 72 69 0 0 0 
+255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 
+255 255 255 251 251 251 219 227 224 224 220 212 230 230 230 255 255 255 254 254 254 71 72 69 
+0 1 1 219 227 224 255 255 255 254 254 254 251 251 251 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 94 90 61 60 61 69 56 66 64 154 157 157 253 255 254 251 251 251 254 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 253 255 255 255 253 253 253 59 64 62 60 64 65 
+58 64 64 156 126 54 162 124 55 156 125 56 158 127 55 158 124 56 156 126 54 156 125 56 
+158 127 55 156 124 53 157 124 59 85 80 60 58 64 64 62 61 67 54 64 59 62 61 67 
+58 62 65 157 126 52 156 128 53 156 125 56 156 128 53 156 124 53 158 127 55 155 128 52 
+162 125 53 155 126 57 155 127 54 161 124 50 159 126 56 158 124 56 155 128 52 162 124 55 
+156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 
+159 126 56 156 125 56 159 126 56 158 127 55 156 125 56 156 125 56 159 126 56 156 124 53 
+158 126 53 158 124 53 156 126 54 158 125 54 159 126 56 155 127 54 157 124 59 161 124 50 
+156 125 56 156 126 54 156 129 45 155 126 57 158 127 55 62 66 62 57 63 61 58 64 64 
+58 62 63 57 63 61 58 65 69 161 124 50 156 125 56 158 127 55 156 124 53 158 127 55 
+155 128 52 166 129 59 152 124 51 159 126 56 155 128 52 71 72 69 59 59 56 58 62 65 
+202 204 206 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 255 254 202 204 206 62 65 65 58 62 65 72 76 65 158 125 54 157 124 59 152 127 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 254 254 254 156 160 157 60 64 65 62 61 67 94 90 61 157 127 54 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+101 91 62 62 61 67 54 64 59 154 157 157 254 250 255 255 253 254 253 253 253 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 255 254 254 254 255 255 255 253 253 255 253 255 254 60 60 63 57 63 61 58 62 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 254 255 104 112 110 58 65 54 53 63 60 128 113 57 158 126 53 158 127 55 154 129 46 
+162 125 53 157 124 59 150 126 55 158 132 49 155 128 52 152 127 56 162 124 52 155 127 54 
+156 126 54 156 126 54 156 124 53 158 127 55 156 126 54 156 126 54 158 127 55 152 124 51 
+156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 156 125 56 
+152 124 51 159 126 56 155 128 52 155 127 54 157 124 59 162 124 52 156 125 56 156 128 53 
+157 124 59 155 128 52 156 124 53 159 126 56 155 128 52 156 129 45 158 127 55 156 125 56 
+85 80 60 59 60 64 57 60 70 172 178 183 254 255 255 58 62 65 56 64 62 57 63 61 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 102 46 209 99 39 85 80 60 62 65 65 57 61 64 202 206 211 255 253 254 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 255 254 255 255 255 254 254 254 254 254 254 202 204 206 58 62 63 
+57 63 63 85 80 60 211 104 39 210 105 51 213 100 46 211 102 45 210 99 44 213 100 46 
+212 104 43 207 99 38 212 104 43 207 105 48 59 60 62 58 66 61 58 64 64 156 160 157 
+53 63 60 62 65 65 112 79 60 207 105 48 210 99 44 213 105 50 211 99 45 210 99 44 
+212 101 45 211 102 45 216 99 44 217 105 50 155 104 59 62 65 65 53 63 60 110 110 107 
+255 255 255 251 251 251 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 254 254 254 252 252 252 255 255 255 254 254 254 255 255 255 
+254 255 251 154 157 157 62 66 56 58 65 69 112 79 60 212 104 43 210 102 46 211 102 45 
+213 100 46 209 105 45 213 103 41 213 105 50 211 102 45 208 103 45 174 105 47 57 63 63 
+60 64 65 110 110 107 104 112 110 58 64 64 58 64 64 155 104 59 210 99 44 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 58 64 64 156 160 157 254 255 255 253 253 253 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+154 157 157 57 63 63 57 63 61 128 93 57 211 99 45 208 103 45 213 105 46 211 102 45 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 255 254 113 113 120 58 62 65 62 61 67 174 105 47 210 102 46 210 99 44 
+213 100 46 208 103 45 216 99 44 213 105 50 209 99 39 211 104 39 208 103 45 212 101 45 
+209 105 45 208 103 45 209 105 45 208 103 45 208 103 45 208 103 45 213 105 50 210 99 44 
+208 103 45 208 103 45 208 103 45 208 103 45 208 103 45 208 103 45 208 103 45 208 103 45 
+211 102 45 213 100 46 209 105 45 213 105 50 211 102 45 209 105 45 217 98 38 207 105 48 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+216 99 44 97 78 60 58 65 69 57 63 61 156 160 157 
+187 189 188 0 0 0 4 1 5 0 3 1 109 102 83 169 141 58 169 138 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 173 142 59 169 141 58 166 144 56 169 141 58 169 144 61 169 141 58 169 138 59 
+152 127 56 165 143 59 158 134 59 4 1 5 4 2 1 169 141 58 169 138 59 202 204 206 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 252 252 252 255 255 255 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 202 204 206 71 72 69 4 2 1 0 0 0 4 2 1 0 0 0 0 1 1 
+0 1 1 4 1 5 0 0 0 0 1 1 125 131 132 230 230 230 160 163 161 0 1 1 
+254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 252 252 252 253 253 253 255 255 255 
+254 254 254 255 255 255 241 240 247 213 212 223 224 220 212 252 252 252 253 253 253 160 163 161 
+0 1 1 140 141 138 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 124 53 101 91 62 62 66 62 57 63 61 125 131 132 254 254 255 253 255 254 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 254 254 253 254 255 255 253 253 255 254 254 254 254 254 255 62 65 65 58 62 65 
+56 64 62 162 125 53 156 124 53 158 132 49 158 124 56 152 124 51 157 126 52 159 126 56 
+158 127 55 159 126 56 150 126 55 72 76 65 62 65 65 59 64 62 57 58 61 58 66 61 
+57 63 63 157 127 54 158 127 55 158 125 54 155 128 52 158 125 54 159 126 56 156 124 53 
+155 128 52 152 124 51 158 124 53 155 128 52 158 124 53 152 127 56 159 126 56 158 124 56 
+158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 
+158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 
+158 127 55 156 124 53 158 127 55 159 126 56 158 125 54 158 125 54 158 125 54 158 125 54 
+156 129 45 159 126 56 159 126 56 158 126 53 142 120 69 71 65 56 57 60 70 54 64 59 
+57 63 63 57 63 61 58 62 65 161 124 50 158 124 53 156 128 53 152 124 51 158 127 55 
+158 124 53 156 128 53 156 125 56 158 124 53 159 126 56 72 76 65 58 65 69 62 66 56 
+202 206 211 252 252 252 254 254 254 255 255 255 251 251 251 253 253 253 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+253 253 255 202 204 206 62 70 65 53 60 64 72 76 65 162 125 53 156 124 53 155 128 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 60 56 104 112 110 255 255 253 156 160 157 57 60 56 58 59 68 101 91 62 158 125 54 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+101 91 62 59 64 62 57 61 64 145 151 154 249 254 254 253 252 247 255 254 255 253 252 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 255 255 253 255 255 253 249 254 254 255 255 255 62 65 65 59 64 62 57 61 64 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 251 104 112 110 57 61 64 57 63 61 128 113 57 157 126 52 158 127 55 156 126 54 
+157 124 59 156 129 45 157 126 52 158 124 56 156 126 54 152 124 51 159 126 56 161 125 43 
+156 126 54 156 126 54 158 127 55 156 126 54 156 126 54 156 124 53 156 124 53 156 124 53 
+158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 158 125 54 
+158 125 54 159 126 56 158 125 54 156 124 53 158 125 54 159 126 56 158 125 54 158 125 54 
+158 124 56 158 127 55 155 128 52 152 124 51 159 126 56 158 124 54 158 124 54 156 128 53 
+62 65 65 58 62 63 60 64 65 202 206 211 253 253 253 59 64 62 60 64 65 57 63 61 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 216 99 44 81 77 81 50 65 64 60 61 69 202 204 206 254 255 251 254 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 202 204 206 62 65 65 
+54 67 66 85 80 60 211 99 45 213 103 41 209 105 45 210 105 40 211 102 45 211 102 45 
+211 102 45 213 105 50 212 101 45 210 99 44 60 64 65 57 63 61 57 63 61 178 172 162 
+60 60 63 58 66 61 97 78 60 208 103 45 213 100 46 213 103 41 207 99 48 213 103 41 
+208 103 45 216 99 44 211 99 45 207 105 38 155 104 59 53 63 60 60 60 63 104 112 110 
+253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 
+253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 
+254 251 252 156 160 157 58 59 68 57 58 61 128 93 57 212 101 45 212 101 45 208 103 45 
+209 105 45 216 99 44 207 105 48 212 101 45 209 99 39 211 99 45 155 104 59 59 64 62 
+60 64 65 110 110 107 104 112 110 57 58 61 58 64 64 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 254 255 251 104 112 110 57 61 64 58 66 61 155 104 59 219 98 50 207 105 38 
+212 101 45 209 105 45 210 102 46 211 99 45 212 104 43 209 105 45 207 105 38 217 104 40 
+207 105 48 210 105 40 211 99 45 213 100 52 213 105 46 211 104 39 212 101 45 212 101 45 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 102 46 213 105 46 209 105 45 207 99 38 212 104 43 212 104 43 208 103 45 208 103 45 
+211 99 45 71 68 65 58 65 54 62 66 56 202 206 211 
+187 189 188 0 1 1 0 1 1 0 0 0 142 120 69 169 141 58 173 142 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 168 136 64 155 126 57 
+147 124 59 169 144 61 169 138 59 0 3 1 0 1 1 148 133 63 169 141 58 214 206 175 
+254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 251 251 251 254 254 254 
+254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 252 252 252 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 187 189 188 125 131 132 97 100 105 48 49 51 71 72 69 
+97 100 105 140 141 138 178 172 162 241 240 247 255 255 255 255 255 255 160 163 161 0 1 1 
+253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 
+253 253 253 255 255 255 255 255 255 241 240 247 213 212 223 242 238 229 253 253 253 213 212 223 
+0 1 1 81 77 81 254 254 254 254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 127 54 128 99 63 57 58 61 59 64 62 104 112 110 253 253 255 248 254 252 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 252 252 252 254 255 255 253 253 253 255 255 255 254 254 254 57 58 61 60 64 65 
+58 64 64 159 126 56 156 125 56 155 128 52 158 124 56 155 127 54 158 126 53 156 125 56 
+156 124 53 158 124 54 155 128 52 72 76 65 60 60 63 57 63 63 62 65 65 58 62 63 
+58 64 64 149 124 55 159 126 56 158 126 53 156 128 53 159 126 56 159 126 56 157 127 54 
+158 125 54 159 126 56 161 124 50 152 127 56 157 124 59 155 127 54 157 126 52 157 126 52 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 156 124 53 158 127 55 158 127 55 156 124 53 156 126 54 158 127 55 158 127 55 
+150 126 55 152 127 56 150 128 52 142 120 69 85 80 60 58 59 64 53 60 64 97 100 105 
+60 64 65 57 63 61 58 62 65 156 126 54 158 126 53 155 128 52 158 125 54 156 124 53 
+158 126 53 156 126 54 155 126 57 159 126 56 161 124 50 72 76 65 58 62 65 58 64 64 
+202 204 206 255 255 255 254 254 254 250 247 249 255 255 255 255 255 255 253 253 253 253 253 253 
+255 255 255 253 253 253 253 253 253 255 255 255 253 253 253 254 254 254 252 252 252 255 255 255 
+253 253 253 160 163 161 57 58 61 56 64 62 102 79 82 158 126 53 156 124 53 157 127 54 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 255 253 254 160 163 161 59 64 62 58 59 68 94 90 61 158 125 54 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+113 104 59 58 62 63 56 66 64 110 110 107 253 255 254 255 255 253 255 255 253 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 254 252 251 254 252 251 253 255 254 255 255 255 59 60 62 53 63 60 58 65 69 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 253 104 112 110 62 61 67 59 64 62 128 99 63 158 126 53 152 124 51 158 127 55 
+158 127 55 157 126 52 157 126 52 157 124 59 158 126 53 156 128 53 152 127 56 150 128 52 
+158 125 54 159 126 56 156 124 53 158 125 54 158 125 54 159 126 56 156 124 53 159 126 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 152 124 51 152 124 51 158 127 55 158 127 55 158 127 55 156 126 54 156 124 53 
+152 124 51 156 124 53 157 127 54 159 126 56 159 126 56 154 129 46 148 133 63 97 78 60 
+57 63 63 60 64 65 68 69 75 249 252 251 254 255 255 62 65 65 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 46 212 101 45 97 78 60 57 60 56 62 65 65 178 172 162 252 252 252 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 202 206 211 57 63 61 
+59 59 56 85 80 60 210 102 46 212 98 39 208 103 45 212 104 43 210 102 46 213 105 50 
+212 104 43 210 102 46 210 99 44 207 105 48 58 62 65 57 63 61 57 60 56 202 206 211 
+59 60 64 56 66 64 97 78 60 210 99 44 210 102 46 213 103 41 210 102 46 211 102 45 
+211 102 45 211 102 45 210 102 46 213 103 41 174 105 47 58 64 64 59 60 62 81 77 81 
+255 255 255 251 251 251 255 255 255 252 252 252 252 252 252 255 255 255 253 253 253 253 253 253 
+255 255 255 251 251 251 254 254 254 255 255 255 252 252 252 254 254 254 254 254 254 255 255 255 
+254 254 254 152 161 158 53 60 64 56 64 62 128 93 57 210 105 51 210 99 44 213 105 46 
+210 102 46 212 98 39 210 102 46 213 103 41 213 105 46 213 100 46 155 104 59 60 60 63 
+57 63 63 110 110 107 104 112 110 62 65 65 60 64 65 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 255 255 253 110 110 107 54 67 66 57 60 56 155 104 59 210 99 44 213 105 46 
+212 101 45 211 102 45 209 105 45 212 101 45 213 100 46 211 99 45 213 100 46 210 105 51 
+210 99 44 211 104 39 212 104 43 210 105 51 209 99 39 209 99 39 213 105 50 210 102 46 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+209 105 45 207 99 38 212 104 43 212 104 43 216 99 44 216 99 44 213 100 46 213 105 50 
+128 93 57 58 65 69 57 58 61 62 65 65 241 240 247 
+187 189 188 4 1 5 4 1 5 0 0 0 142 120 69 173 142 59 169 138 59 166 144 56 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 138 59 169 141 58 169 141 58 169 141 58 158 134 59 147 124 59 
+149 124 53 169 138 59 169 141 58 21 19 24 0 3 1 148 133 63 164 144 50 178 172 162 
+253 253 253 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 252 252 252 254 254 254 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 253 253 253 160 163 161 0 1 1 
+241 240 247 254 254 254 255 255 255 252 252 252 255 255 255 251 251 251 252 252 252 255 255 255 
+254 254 254 255 255 255 252 252 252 254 254 254 255 255 255 241 240 247 255 255 255 254 254 254 
+0 1 1 62 65 65 252 252 252 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 126 52 128 113 57 58 62 65 57 63 63 88 95 83 255 254 255 254 255 251 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 253 254 252 251 255 255 253 230 230 230 57 58 61 56 64 62 
+62 66 62 157 124 59 158 127 55 155 128 52 157 124 59 157 124 59 158 125 54 156 125 56 
+159 126 56 158 127 55 158 126 53 71 72 69 62 65 65 56 66 64 71 81 83 58 62 65 
+57 63 63 128 113 57 156 124 53 161 124 50 155 127 54 156 124 53 158 125 54 156 126 54 
+158 124 53 158 125 54 159 126 56 110 92 61 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 85 80 60 66 60 61 62 65 65 53 64 53 56 64 62 202 204 206 
+58 62 63 57 63 63 60 64 65 147 124 59 158 127 55 155 127 54 158 127 55 158 127 55 
+156 128 53 158 124 56 152 127 56 158 125 54 156 129 45 85 80 60 60 60 63 58 65 69 
+172 178 183 255 255 255 252 252 252 255 255 255 253 253 253 251 251 251 255 255 255 255 255 255 
+251 251 251 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 253 253 253 254 254 254 
+255 255 253 145 151 154 58 62 65 56 64 62 110 92 61 157 126 52 157 126 52 159 126 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 60 62 113 113 120 254 251 254 154 157 157 57 63 63 60 61 69 94 90 61 159 126 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+128 113 57 58 65 69 53 63 60 97 100 105 254 255 255 254 252 251 250 250 247 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 252 247 255 255 253 255 255 253 254 255 251 242 238 229 57 63 61 56 66 64 59 64 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 255 104 112 110 59 60 64 57 63 61 128 99 63 156 124 53 158 125 54 159 126 56 
+158 124 56 158 127 55 156 126 54 158 124 56 156 124 53 158 127 55 128 99 63 101 91 62 
+101 91 62 101 91 62 101 91 62 94 90 61 101 91 62 94 90 61 101 91 62 94 90 61 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 85 80 60 71 68 65 56 64 62 
+62 65 65 58 64 64 156 160 157 255 255 255 253 255 254 57 58 61 58 64 64 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 213 105 50 110 92 61 59 59 56 57 63 61 140 141 138 253 253 255 255 255 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 255 255 255 252 252 252 254 254 254 254 255 255 156 160 157 58 62 63 
+62 66 56 112 79 60 210 105 51 211 99 45 210 102 46 210 99 44 210 102 46 212 101 45 
+207 99 38 213 105 50 209 99 39 174 105 47 62 65 65 57 63 61 81 77 81 202 206 211 
+60 64 65 54 64 59 71 72 69 217 98 38 208 103 45 211 102 45 210 102 46 210 102 46 
+213 105 50 210 102 46 217 105 50 207 105 38 210 105 51 53 63 60 59 64 62 62 66 62 
+255 255 255 253 253 253 251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+254 254 254 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 252 252 252 
+249 254 254 113 113 120 56 64 62 58 68 63 128 93 57 208 103 45 213 105 46 207 99 38 
+213 100 52 211 102 45 213 105 50 211 104 39 213 100 46 207 99 48 128 93 57 57 58 61 
+60 64 65 125 131 132 97 100 105 62 65 65 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 252 252 252 125 131 132 50 65 64 62 66 62 128 93 57 208 103 45 210 102 46 
+211 102 45 211 99 45 208 103 45 217 105 50 213 100 46 213 100 46 210 99 51 174 105 47 
+128 93 57 128 93 57 112 79 60 128 93 57 112 79 60 128 93 57 112 79 60 112 79 60 
+112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 
+112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 
+128 93 57 112 79 60 128 93 57 112 79 60 112 79 60 110 92 61 97 78 60 84 69 58 
+54 67 66 58 65 69 57 63 61 145 151 154 248 254 253 
+187 189 188 0 1 1 4 1 5 0 0 0 142 120 69 173 138 52 169 138 59 169 144 61 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 159 134 56 149 124 55 147 124 59 
+142 120 69 166 144 56 169 138 59 85 80 60 0 1 1 128 100 96 169 144 61 178 172 162 
+254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 
+254 254 254 251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 252 252 252 
+255 255 255 250 247 249 255 255 255 253 253 253 254 254 254 255 255 255 160 163 161 0 1 1 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 251 251 251 
+255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 202 206 211 
+0 0 0 81 77 81 255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 157 124 59 57 63 61 58 65 69 57 58 61 241 240 247 254 255 251 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 253 254 252 251 254 254 254 187 189 188 60 64 65 56 64 62 
+72 76 65 156 125 56 158 127 55 155 128 52 162 124 55 157 124 59 156 124 53 156 126 54 
+156 124 53 152 124 51 152 124 51 62 65 65 62 65 65 58 67 65 97 100 105 62 61 67 
+58 64 64 113 104 59 156 125 56 157 126 52 155 127 54 158 124 56 158 125 54 156 126 54 
+158 127 55 156 124 53 152 127 56 85 80 60 53 63 60 56 64 62 60 64 65 53 60 64 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 
+59 60 64 62 61 67 59 60 64 57 61 64 58 62 65 58 62 65 58 62 65 58 62 65 
+58 64 64 53 63 60 54 67 66 58 65 69 53 60 64 58 66 61 125 131 132 255 253 254 
+104 112 110 58 64 64 58 62 63 128 113 57 157 126 52 155 127 54 157 126 52 152 124 51 
+156 128 53 159 126 56 152 127 56 156 124 53 155 128 52 94 90 61 60 61 69 54 67 66 
+145 151 154 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 254 254 254 255 255 255 
+251 251 251 110 110 107 57 61 64 58 65 69 128 93 57 155 127 54 156 124 53 159 126 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+62 65 65 104 112 110 255 254 255 156 160 157 60 64 65 58 62 65 94 90 61 156 124 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+149 124 55 53 60 64 56 66 64 59 60 62 253 253 255 254 252 251 254 255 251 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 253 254 254 254 253 252 252 252 202 204 206 56 64 62 58 65 69 72 76 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 255 145 151 154 62 61 67 57 63 61 101 91 62 156 125 56 159 126 56 156 124 53 
+158 125 54 155 126 57 155 128 52 158 124 56 158 126 53 155 127 54 110 92 61 62 61 67 
+58 62 65 58 62 65 58 65 69 53 60 64 58 62 65 58 62 65 60 64 65 60 64 65 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 
+58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 58 62 65 60 64 65 
+58 59 64 60 64 65 56 64 62 56 64 62 58 65 69 58 65 69 53 63 60 56 66 64 
+58 62 63 97 100 105 253 253 253 255 255 255 253 253 253 60 64 65 58 62 63 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 99 44 210 102 46 155 104 59 60 64 65 59 64 62 104 112 110 255 255 255 250 250 247 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 113 113 120 60 64 65 
+58 62 65 128 93 57 207 99 48 210 102 46 213 100 46 208 103 45 212 101 45 213 105 50 
+213 105 46 210 99 44 213 105 46 155 104 59 53 63 60 59 64 62 104 112 110 219 227 224 
+58 64 64 56 64 62 71 68 65 216 99 44 209 105 45 212 101 45 212 101 45 210 102 46 
+208 103 45 213 105 50 211 99 45 208 103 45 217 105 50 71 68 65 56 66 64 59 64 62 
+202 204 206 251 251 251 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 81 77 81 58 65 69 53 60 64 174 105 47 210 102 46 216 99 44 212 101 45 
+208 103 45 211 99 45 213 100 52 212 98 39 210 102 46 213 105 50 112 79 60 62 65 65 
+57 63 63 160 163 161 104 112 110 58 64 64 57 58 61 155 104 59 210 102 46 210 99 44 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 255 254 160 163 161 54 67 66 57 60 56 128 99 63 209 99 39 213 105 46 
+209 105 45 213 100 46 209 99 39 216 99 44 210 102 46 212 104 43 198 102 49 128 93 57 
+54 67 66 59 64 62 59 64 62 53 63 60 53 63 60 58 65 69 57 61 64 56 66 64 
+56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 
+56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 56 64 62 
+56 64 62 56 66 64 57 60 56 59 64 62 59 60 62 60 60 63 58 65 69 58 65 69 
+58 62 65 62 66 62 97 100 105 241 240 247 255 254 255 
+187 189 188 0 1 1 4 1 5 0 0 0 142 120 69 173 138 52 169 138 59 166 144 56 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 159 134 56 149 124 55 147 124 59 147 124 59 
+152 127 56 166 144 56 173 142 59 94 90 61 4 1 5 142 120 69 165 143 59 182 158 106 
+160 163 161 113 113 120 97 100 105 97 100 105 97 100 105 113 113 120 172 178 183 241 240 247 
+255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 253 255 255 255 252 252 252 113 113 120 0 1 1 
+255 255 255 253 253 253 254 254 254 254 254 254 254 254 254 255 255 255 202 204 206 160 163 161 
+213 212 223 255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 97 100 105 
+4 2 1 156 160 157 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 126 57 156 124 53 72 73 56 53 60 64 60 64 65 187 189 188 254 255 251 249 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 254 252 251 254 254 253 255 255 255 254 255 255 125 131 132 58 62 65 60 64 65 
+101 91 62 156 125 56 158 127 55 155 128 52 158 124 56 158 124 56 156 124 53 156 128 53 
+156 124 53 158 127 55 155 126 57 58 62 63 57 60 56 56 66 64 113 113 120 62 61 67 
+58 64 64 101 91 62 157 124 59 157 126 52 156 125 56 159 126 56 159 126 56 156 126 54 
+155 127 54 152 124 44 154 129 46 101 91 62 56 66 64 57 63 61 59 60 62 62 70 65 
+59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 
+59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 
+57 63 61 57 63 61 57 63 61 59 64 62 59 64 62 57 63 61 59 64 62 57 58 61 
+56 66 64 54 67 66 54 64 59 58 65 54 71 72 69 160 163 161 253 255 254 254 251 252 
+113 113 120 56 64 62 58 64 64 110 92 61 156 126 54 158 127 55 158 126 53 158 127 55 
+158 126 53 157 127 54 158 124 56 156 126 54 155 127 54 128 113 57 57 60 70 56 64 62 
+88 95 83 253 255 254 253 255 254 255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 
+254 254 254 251 251 251 252 252 252 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 
+241 240 247 62 65 65 53 60 64 62 65 65 149 124 53 155 126 57 155 127 54 158 124 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 97 100 105 255 253 254 202 206 211 57 63 63 62 70 69 72 73 56 158 127 55 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 62 65 65 53 60 64 60 60 63 187 189 188 251 251 251 254 255 251 253 253 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 254 255 252 252 252 255 255 255 140 141 138 56 64 62 58 62 65 94 90 61 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 255 154 157 157 62 65 65 58 66 61 85 80 60 157 124 59 152 124 51 166 129 59 
+162 125 53 152 124 51 155 128 52 159 126 56 159 126 56 152 124 44 113 104 59 53 63 60 
+59 64 62 59 60 62 59 64 62 62 65 65 59 64 62 59 60 62 59 64 62 57 58 61 
+59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 59 64 62 
+59 64 62 59 64 62 57 63 61 57 63 61 62 65 65 59 64 62 57 63 61 59 64 62 
+60 60 63 62 66 62 57 60 56 53 60 64 57 61 64 58 65 54 59 59 56 62 61 67 
+145 151 154 241 240 247 255 255 255 255 255 255 254 254 254 62 65 65 58 62 63 60 64 65 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 105 50 210 102 46 198 102 49 58 65 69 60 64 65 57 58 61 241 240 247 255 253 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 254 254 254 255 255 255 253 253 253 255 255 255 254 255 255 68 69 75 58 62 63 
+51 61 71 174 105 47 208 103 45 210 102 46 216 99 44 208 103 45 212 101 45 210 102 46 
+211 102 45 213 100 46 208 103 45 128 93 57 58 67 65 60 60 63 113 113 120 254 254 255 
+59 64 62 57 63 61 62 61 67 198 102 49 210 105 40 213 100 46 212 98 39 210 102 46 
+210 102 46 208 103 45 212 101 45 211 99 45 209 99 39 97 78 60 60 64 65 56 66 64 
+156 160 157 254 255 255 252 252 252 251 251 251 254 254 254 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 251 251 251 
+230 230 230 59 59 56 53 60 64 59 60 64 207 105 48 210 102 46 213 100 46 217 105 50 
+213 103 41 213 105 50 210 105 51 210 99 44 207 105 38 219 98 50 84 69 58 57 61 64 
+58 62 63 187 189 188 104 112 110 57 58 61 62 70 69 155 104 59 211 99 45 213 105 46 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 249 254 254 172 178 183 59 60 62 57 60 56 97 78 60 213 103 41 209 99 39 
+208 103 45 217 105 50 210 99 44 213 103 41 208 103 45 207 105 38 208 103 45 155 104 59 
+56 66 64 58 62 63 62 65 65 62 65 65 57 58 61 62 65 65 59 60 62 57 63 61 
+60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 
+60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 60 64 65 
+59 60 64 62 65 65 59 64 62 62 65 65 62 65 65 57 58 61 56 66 64 53 60 64 
+59 59 56 145 151 154 241 240 247 254 255 251 255 255 253 
+242 238 229 0 3 1 4 1 5 0 0 0 109 102 83 169 141 58 169 141 58 166 144 56 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 159 134 56 150 126 55 147 124 59 147 124 59 147 124 59 
+155 126 57 168 136 64 169 141 58 88 95 83 0 1 1 109 102 83 102 79 82 4 2 1 
+0 1 1 88 95 83 97 100 105 110 110 107 97 100 105 21 19 24 4 1 5 81 77 81 
+253 253 253 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 251 251 251 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 
+252 252 252 254 254 254 255 255 255 250 247 249 252 252 252 255 255 255 88 95 83 97 100 105 
+254 254 254 255 255 255 255 255 255 255 255 255 178 172 162 71 72 69 0 0 0 0 1 1 
+0 0 0 71 72 69 125 131 132 202 204 206 202 204 206 187 189 188 97 100 105 0 0 0 
+60 60 63 253 253 253 255 255 255 251 251 251 255 255 255 255 255 255 254 254 254 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 124 51 162 125 53 101 91 62 56 64 62 58 65 69 113 113 120 250 250 247 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 253 253 253 253 241 240 247 71 81 83 60 64 65 57 60 56 
+128 113 57 158 127 55 157 126 52 155 128 52 158 127 55 158 124 56 156 124 53 156 128 53 
+158 127 55 157 126 52 128 113 57 57 61 64 62 66 62 97 100 105 160 163 161 58 62 63 
+59 64 62 85 80 60 157 124 59 155 128 52 156 125 56 158 124 56 158 125 54 155 127 54 
+158 124 56 157 126 52 157 126 52 128 99 63 58 62 65 58 62 65 62 61 67 154 157 157 
+156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 
+156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 
+152 161 158 152 161 158 154 157 157 156 160 157 156 160 157 154 157 157 154 157 157 156 160 157 
+156 160 157 156 160 157 160 163 161 213 212 223 255 253 254 254 255 251 253 253 255 255 254 255 
+154 157 157 56 66 64 57 63 61 101 91 62 156 126 54 152 124 51 158 127 55 152 124 51 
+156 125 56 155 128 52 159 126 56 158 127 55 152 124 51 152 127 56 62 66 62 57 60 56 
+57 58 61 219 227 224 253 255 254 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 250 247 249 255 255 255 
+172 178 183 57 60 56 58 65 69 71 65 56 154 129 46 155 126 57 155 127 54 158 126 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 63 104 112 110 255 255 253 202 204 206 57 63 61 56 66 64 71 68 65 149 124 55 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 124 53 85 80 60 58 65 69 58 64 64 140 141 138 253 255 254 249 252 251 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 252 251 255 254 255 255 255 253 255 255 255 88 95 83 58 62 65 57 58 61 113 104 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 255 202 206 211 62 65 65 57 60 56 72 76 65 157 124 59 162 125 53 152 124 51 
+158 125 54 155 127 54 156 128 53 157 126 52 158 127 55 157 126 52 142 120 69 58 64 64 
+57 63 63 58 64 64 145 151 154 156 160 157 156 160 157 154 157 157 160 163 161 154 157 157 
+156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 
+156 160 157 156 160 157 154 157 157 156 160 157 156 160 157 154 157 157 154 157 157 156 160 157 
+160 163 161 154 157 157 160 163 161 160 163 161 154 157 157 154 157 157 202 204 206 241 240 247 
+254 255 255 249 252 251 255 255 255 255 255 255 254 254 254 59 60 62 58 62 63 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+212 101 45 210 99 44 213 105 50 84 69 58 53 60 64 62 65 65 172 178 183 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 187 189 188 58 62 63 60 64 65 
+71 68 65 200 101 40 213 105 46 209 105 45 217 98 38 208 103 45 209 99 39 210 99 44 
+210 99 44 213 100 46 209 105 45 97 78 60 53 63 60 59 60 62 156 160 157 254 254 254 
+81 77 81 57 63 61 62 61 67 155 104 59 208 103 45 213 100 46 216 99 44 211 102 45 
+213 105 46 208 103 45 217 105 50 208 103 45 216 99 44 142 101 66 59 59 56 58 65 69 
+81 77 81 253 255 254 252 252 252 255 255 255 254 254 254 252 252 252 253 253 253 255 255 255 
+253 253 253 255 255 255 253 253 253 253 253 253 254 254 254 255 255 255 253 253 253 255 255 255 
+156 160 157 59 64 62 58 65 69 97 78 60 212 98 39 209 105 45 207 99 48 208 103 45 
+209 99 39 210 99 44 211 99 45 210 102 46 208 103 45 213 100 52 71 68 65 62 61 67 
+58 64 64 202 204 206 104 112 110 62 65 65 57 58 61 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+160 163 161 254 255 255 202 204 206 60 60 63 59 64 62 71 68 65 210 105 51 213 103 41 
+211 102 45 219 98 50 211 102 45 211 102 45 209 105 45 211 104 39 216 99 44 198 102 49 
+57 63 61 58 65 69 58 59 68 140 141 138 160 163 161 154 157 157 156 160 157 156 160 157 
+156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 
+156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 156 160 157 
+160 163 161 154 157 157 156 160 157 154 157 157 154 157 157 156 160 157 156 160 157 187 189 188 
+249 252 246 249 254 254 254 251 252 254 255 251 253 255 254 
+253 253 253 0 3 1 0 1 1 0 3 1 109 102 83 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 144 61 158 134 59 152 127 56 147 124 59 147 124 59 147 124 59 147 124 59 
+158 134 59 169 144 61 166 144 56 81 77 81 4 1 5 0 3 1 88 95 83 172 178 183 
+241 240 247 253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 140 141 138 0 0 0 
+125 131 132 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 251 251 251 254 254 254 
+255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 48 49 51 125 131 132 
+254 254 254 241 240 247 154 157 157 71 72 69 0 0 0 0 0 0 97 100 105 187 189 188 
+140 141 138 48 49 51 4 2 1 0 0 0 0 0 0 4 2 1 0 0 0 81 77 81 
+241 240 247 253 253 253 253 253 253 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 127 55 152 124 44 147 124 59 57 60 56 58 65 69 59 64 62 230 230 230 248 254 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 253 250 252 246 254 255 255 156 160 157 58 62 63 59 59 56 71 68 65 
+155 126 57 161 124 50 158 124 53 156 125 56 156 126 54 158 125 54 155 127 54 158 125 54 
+152 124 51 159 126 56 101 91 62 60 61 69 57 60 56 125 131 132 202 204 206 56 66 64 
+59 64 62 71 68 65 157 124 59 155 128 52 157 124 59 159 126 56 158 125 54 158 127 55 
+157 124 59 159 126 56 156 124 53 147 124 59 57 60 56 53 63 60 59 64 62 202 204 206 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 255 254 254 255 255 255 255 251 251 251 255 255 255 252 252 252 202 206 211 
+202 204 206 224 220 212 254 255 251 255 253 254 254 250 255 249 252 251 254 255 251 250 252 254 
+187 189 188 56 64 62 59 64 62 72 76 65 157 127 54 158 124 54 158 127 55 156 126 54 
+155 126 57 161 124 50 157 124 59 156 128 53 155 126 57 159 126 56 94 90 61 57 63 61 
+60 64 65 125 131 132 254 255 255 254 254 254 255 255 255 253 253 253 252 252 252 255 255 255 
+253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 253 253 253 253 253 253 
+88 95 83 58 66 61 54 67 66 101 91 62 155 128 52 158 127 55 156 126 54 156 124 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+53 60 64 104 112 110 255 255 253 255 255 253 60 64 65 53 63 60 62 65 65 147 124 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 128 53 128 99 63 57 63 61 59 64 62 68 69 75 241 240 247 253 253 255 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 253 253 255 254 255 251 187 189 188 62 65 65 53 60 64 71 65 56 149 124 55 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 253 241 240 247 60 60 63 60 64 65 53 63 60 147 124 59 158 126 53 156 124 53 
+157 124 59 155 127 54 158 126 53 157 126 52 157 124 59 162 124 55 157 124 59 71 68 65 
+58 62 65 57 61 64 187 189 188 249 254 254 254 255 255 254 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 255 255 255 255 255 255 255 253 253 255 255 255 255 255 255 255 253 253 255 
+254 255 251 255 255 255 202 204 206 202 204 206 213 212 223 254 255 251 254 252 244 254 255 251 
+254 255 255 255 255 255 254 254 254 251 251 251 255 255 255 59 60 62 62 65 65 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 210 102 46 212 98 39 128 93 57 56 66 64 59 60 62 81 77 81 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 254 254 254 254 255 255 110 110 107 62 65 65 57 63 61 
+128 93 57 213 103 41 211 102 45 208 103 45 216 99 44 209 105 45 213 105 46 212 101 45 
+208 103 45 213 100 46 207 105 48 81 77 81 53 63 60 62 65 65 187 189 188 254 255 255 
+125 131 132 59 64 62 58 62 65 112 79 60 211 102 45 213 100 46 213 100 46 210 99 44 
+208 103 45 216 99 44 210 99 44 213 105 50 210 102 46 198 102 49 68 58 52 62 61 67 
+59 64 62 202 204 206 255 255 255 254 254 254 251 251 251 255 255 255 254 254 254 252 252 252 
+254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 241 240 247 
+71 72 69 56 66 64 56 64 62 140 101 45 216 99 44 209 105 45 207 99 48 213 105 50 
+213 105 46 213 105 46 211 102 45 213 105 50 213 105 46 174 105 47 58 67 65 60 60 63 
+58 62 63 255 255 255 104 112 110 60 64 65 60 64 65 155 104 59 213 105 50 210 99 44 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 251 251 251 254 255 255 59 64 62 57 63 63 62 65 65 185 105 60 209 99 39 
+216 99 44 211 99 45 208 103 45 210 102 46 213 105 46 212 104 43 216 99 44 213 100 52 
+84 69 58 66 60 61 54 67 66 154 157 157 255 254 255 254 254 254 254 255 251 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 255 249 254 254 219 227 224 202 204 206 202 204 206 254 251 252 255 255 253 
+253 255 254 250 252 254 255 254 255 253 252 247 248 254 252 
+255 253 254 59 59 56 4 1 5 0 3 1 81 77 81 169 144 61 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 159 134 56 149 124 55 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 
+166 134 56 166 144 56 169 144 61 21 19 24 0 0 0 160 163 161 253 253 255 253 255 254 
+255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 97 100 105 
+0 1 1 178 172 162 253 253 253 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 241 240 247 4 1 5 145 151 154 
+145 151 154 48 49 51 4 2 1 6 9 5 110 110 107 219 227 224 253 253 253 255 255 255 
+255 255 255 254 254 254 219 227 224 156 160 157 125 131 132 125 131 132 202 206 211 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 157 127 54 161 124 50 72 76 65 57 63 63 57 63 61 110 110 107 254 255 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 251 249 255 255 253 241 240 247 68 69 75 57 63 61 62 66 56 88 95 83 
+158 127 55 161 124 50 158 124 56 155 126 57 156 126 54 156 124 53 155 127 54 158 124 56 
+155 126 57 162 124 55 72 73 56 60 61 69 56 66 64 172 178 183 250 247 249 53 60 64 
+56 64 62 59 60 62 149 124 53 152 124 44 157 124 59 156 125 56 152 124 51 157 127 54 
+156 126 54 155 128 52 158 126 53 152 124 51 81 77 81 60 64 65 60 60 63 110 110 107 
+255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 
+255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 
+255 253 254 255 254 255 253 253 253 253 255 254 202 206 211 113 113 120 59 64 62 57 63 61 
+60 61 69 56 64 62 71 81 83 187 189 188 253 255 254 253 255 254 253 253 253 254 255 251 
+230 230 230 56 64 62 59 64 62 59 59 56 155 127 54 159 126 56 157 126 52 156 126 54 
+155 126 57 162 125 53 156 125 56 152 124 44 166 129 59 156 124 53 113 104 59 58 62 65 
+58 64 64 58 64 64 202 204 206 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 187 189 188 
+59 60 64 53 64 53 58 65 69 142 120 69 158 124 56 161 124 50 159 126 56 156 124 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 65 69 104 112 110 254 251 249 255 255 255 97 100 105 58 65 69 62 61 67 128 113 57 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 129 45 157 124 59 71 68 65 57 60 56 60 60 63 140 141 138 255 254 255 254 252 250 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 252 247 255 255 255 250 252 246 81 77 81 60 64 65 58 62 65 94 90 61 155 128 52 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+252 252 252 255 255 255 81 77 81 57 63 63 58 65 69 128 93 57 158 126 53 155 126 57 
+157 124 59 154 129 46 158 126 53 158 126 53 157 124 59 161 124 50 161 125 43 101 91 62 
+58 62 63 57 63 61 71 72 69 241 240 247 254 254 254 255 255 253 255 255 253 254 252 251 
+255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 255 255 253 
+255 255 253 251 251 251 255 255 253 255 255 253 251 251 251 255 255 253 251 251 251 230 230 230 
+125 131 132 71 72 69 62 66 62 53 63 60 57 63 63 68 69 75 160 163 161 255 254 255 
+253 255 254 255 255 255 255 255 255 255 255 255 254 254 254 60 64 65 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 99 44 210 102 46 213 100 46 185 105 60 57 63 61 62 66 56 58 64 64 160 163 161 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 187 189 188 60 64 65 53 63 60 60 64 65 
+174 105 47 216 99 44 211 102 45 208 103 45 213 105 50 209 99 39 213 105 50 212 101 45 
+209 105 45 211 99 45 200 101 40 58 59 64 54 67 66 57 60 56 241 240 247 253 255 254 
+172 178 183 62 65 65 53 60 64 84 69 58 213 105 50 211 99 45 210 105 51 210 99 44 
+211 99 45 209 105 45 216 99 44 212 98 39 210 105 51 211 104 39 97 78 60 62 61 67 
+57 63 61 97 100 105 253 253 253 253 253 253 255 254 255 255 255 255 253 253 253 255 255 255 
+255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 154 157 157 
+59 60 62 54 67 66 62 65 65 198 102 49 213 100 52 209 99 39 213 100 46 213 103 41 
+210 99 51 217 98 38 208 103 45 213 100 46 216 99 44 128 93 57 53 63 60 58 64 64 
+104 112 110 251 251 251 104 112 110 59 60 62 58 64 64 155 104 59 210 102 46 213 105 46 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 255 255 253 254 252 251 97 100 105 58 65 69 62 61 67 140 101 45 213 105 50 
+213 103 41 208 103 45 210 105 51 213 105 50 211 99 45 210 102 46 207 105 48 208 103 45 
+128 99 63 66 60 61 50 65 64 71 72 69 241 240 247 255 255 253 254 255 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+230 230 230 145 151 154 68 69 75 58 62 65 58 62 65 60 64 65 68 69 75 154 157 157 
+241 240 247 255 255 253 249 254 246 249 254 254 253 253 255 
+254 254 254 58 62 63 4 2 1 4 1 5 0 3 1 168 136 64 168 136 64 169 141 58 
+169 141 58 169 141 58 168 136 64 169 141 58 173 142 59 169 144 61 169 138 59 166 144 56 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+158 134 59 147 124 59 147 124 59 149 124 55 147 124 59 147 124 59 155 126 57 149 124 55 
+166 144 56 166 144 56 148 133 63 4 2 1 178 172 162 253 255 254 249 254 246 255 254 255 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 241 240 247 
+88 95 83 21 19 24 187 189 188 252 252 252 255 255 255 251 251 251 255 255 255 255 255 253 
+255 255 255 254 254 254 255 255 255 254 252 251 255 255 253 254 252 251 255 255 255 255 255 255 
+254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 125 131 132 0 0 0 0 0 0 
+0 0 0 21 19 24 125 131 132 241 240 247 251 251 251 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 161 124 50 155 126 57 128 113 57 60 60 63 62 66 56 59 60 70 178 172 162 
+253 253 253 254 255 255 255 255 255 254 254 254 255 255 255 253 253 255 248 251 253 254 255 255 
+253 255 254 254 250 255 254 255 251 110 110 107 58 62 65 50 65 62 62 66 56 147 124 59 
+161 124 50 155 126 57 155 126 57 159 126 56 162 124 55 156 125 56 154 129 46 158 125 54 
+158 125 54 147 124 59 57 63 61 58 67 65 62 61 67 219 227 224 255 254 255 97 100 105 
+58 62 65 57 63 63 110 92 61 152 127 56 155 128 52 158 125 54 157 126 52 158 127 55 
+156 128 53 152 124 51 157 126 52 156 124 53 128 99 63 62 66 56 57 60 56 60 64 65 
+156 160 157 254 254 253 255 255 255 255 255 255 254 254 255 255 255 255 254 254 253 255 255 253 
+253 253 255 254 255 255 253 253 255 254 255 255 249 252 251 254 255 255 255 255 255 253 253 255 
+254 255 251 255 255 255 230 230 230 110 110 107 58 66 61 54 64 59 57 63 61 58 62 65 
+54 64 59 59 60 70 66 60 61 56 66 64 125 131 132 250 252 246 254 250 255 249 254 246 
+254 255 255 81 77 81 59 64 62 57 60 70 128 99 63 152 127 56 156 129 45 158 124 56 
+158 125 54 157 124 59 156 124 53 159 126 56 157 124 59 158 132 49 150 126 55 84 69 58 
+59 64 62 57 63 61 88 95 83 241 240 247 255 255 253 254 255 251 254 254 253 252 252 252 
+254 251 252 255 255 255 254 255 255 254 254 255 255 254 255 254 252 251 219 227 224 71 72 69 
+57 63 63 56 64 62 97 78 60 157 124 59 161 124 50 155 127 54 155 128 52 157 127 54 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+60 64 65 110 110 107 255 255 253 254 255 255 125 131 132 57 63 61 59 59 56 88 95 83 
+161 124 50 155 126 57 156 126 54 161 124 50 155 127 54 154 129 46 156 125 56 158 127 55 
+156 125 56 156 128 53 110 92 61 59 59 56 57 60 70 58 65 69 202 204 206 255 254 255 
+253 253 253 254 255 255 254 254 254 255 253 254 255 254 255 254 254 254 255 255 255 254 255 255 
+255 255 253 253 253 253 125 131 132 54 64 59 53 63 60 62 65 65 128 113 57 158 125 54 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 255 251 253 253 255 145 151 154 59 64 62 57 60 70 94 90 61 154 129 46 157 124 59 
+158 125 54 155 126 57 152 124 51 166 129 59 157 124 59 152 124 51 156 128 53 157 124 59 
+62 65 65 62 66 56 62 61 67 113 113 120 253 255 254 253 255 254 254 254 253 254 255 251 
+254 255 251 255 255 253 254 254 254 253 253 255 254 255 255 255 255 255 255 255 253 254 255 251 
+255 255 255 255 255 253 255 255 253 255 255 255 253 253 255 241 240 247 140 141 138 57 60 56 
+58 62 65 59 64 62 57 61 64 60 64 65 57 61 64 57 60 56 59 64 62 97 100 105 
+241 240 247 254 255 255 253 253 253 253 253 253 255 255 255 59 60 62 58 64 64 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 105 40 210 99 44 213 100 46 211 104 39 97 78 60 59 60 70 59 59 56 71 81 83 
+224 220 212 253 255 254 249 254 254 255 255 253 255 253 254 253 255 254 249 254 254 254 251 249 
+253 255 254 254 255 251 250 252 254 219 227 224 81 77 81 58 62 65 57 58 61 97 78 60 
+212 101 45 210 99 51 207 105 38 210 99 44 213 100 46 207 105 48 207 105 48 210 102 46 
+208 103 45 210 105 51 128 93 57 58 65 69 57 60 56 97 100 105 253 255 254 254 251 249 
+230 230 230 57 63 61 58 59 68 58 66 61 185 105 60 207 99 48 213 105 46 213 103 41 
+209 105 45 210 99 51 209 105 45 216 99 44 208 103 45 212 104 43 185 105 60 53 64 53 
+53 63 60 56 66 64 125 131 132 255 254 255 253 253 255 248 254 252 248 254 252 254 251 254 
+254 255 251 254 255 251 249 254 254 253 255 254 253 252 247 254 255 255 202 206 211 62 61 67 
+59 60 64 66 60 61 112 79 60 217 105 50 213 103 41 210 105 51 208 103 45 212 104 43 
+208 103 45 212 101 45 211 99 45 207 105 38 213 103 41 97 78 60 59 60 64 59 64 62 
+172 178 183 255 254 255 104 112 110 57 63 61 58 62 63 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 253 255 254 252 250 152 161 158 62 66 56 56 66 64 97 78 60 213 103 41 
+210 99 44 210 105 51 209 99 39 211 104 39 210 105 51 209 99 39 209 105 45 213 105 50 
+198 102 49 71 68 65 58 62 63 58 59 68 110 110 107 249 254 246 255 254 255 254 255 255 
+253 255 254 249 254 254 253 255 254 251 251 251 254 255 251 254 255 251 255 255 253 255 255 255 
+255 253 254 254 254 254 249 254 246 254 252 244 254 255 251 253 253 255 241 240 247 145 151 154 
+58 62 63 58 66 61 60 64 65 58 59 68 56 66 64 59 64 62 66 60 61 50 65 64 
+97 100 105 241 240 247 255 253 254 254 255 251 253 255 254 
+253 253 253 125 131 132 0 3 1 4 1 5 0 1 1 142 120 69 173 145 52 169 144 61 
+169 141 58 166 144 56 166 144 56 169 141 58 164 134 50 173 145 52 169 144 61 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 138 59 
+169 141 58 169 141 58 169 141 58 166 144 56 169 141 58 169 144 61 169 138 59 156 128 53 
+149 124 55 149 124 55 147 124 59 147 124 59 149 124 55 147 124 59 147 124 59 158 134 59 
+173 142 59 169 141 58 109 102 83 81 77 81 254 255 251 255 254 255 254 255 251 252 252 252 
+255 255 255 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+213 212 223 48 49 51 0 1 1 140 141 138 252 252 252 255 255 255 253 253 253 255 255 255 
+252 252 252 255 255 255 251 251 251 255 255 255 255 255 253 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 253 253 253 253 253 253 255 255 255 255 255 255 251 251 251 
+254 254 254 252 252 252 255 255 255 255 255 255 255 255 255 21 19 24 0 0 0 21 19 24 
+160 163 161 254 254 254 255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+155 127 54 159 126 56 155 128 52 152 124 51 85 80 60 53 60 64 57 63 61 56 66 64 
+187 189 188 254 254 253 255 255 253 254 255 251 254 255 251 253 252 247 255 253 254 254 250 255 
+252 252 252 249 254 254 140 141 138 59 64 62 53 63 60 69 60 69 128 93 57 158 124 54 
+159 126 56 156 124 53 158 134 59 158 124 54 152 124 51 155 127 54 157 124 59 157 126 52 
+157 126 52 110 92 61 59 64 62 58 62 65 97 100 105 253 255 254 251 251 251 172 178 183 
+57 63 61 58 66 61 72 76 65 152 127 56 156 124 53 159 126 56 157 124 59 156 126 54 
+159 126 56 156 125 56 156 125 56 158 126 53 152 127 56 94 90 61 68 69 75 56 66 64 
+58 65 69 152 161 158 251 251 251 254 255 251 254 255 251 252 252 252 253 253 255 253 255 254 
+254 255 251 254 252 251 255 255 255 254 254 255 255 255 255 255 255 253 250 250 247 255 255 253 
+241 240 247 125 131 132 62 66 62 57 61 64 62 61 67 62 61 67 62 61 67 71 72 69 
+71 68 65 62 65 65 54 64 59 54 64 59 58 68 63 125 131 132 254 255 255 254 255 251 
+254 254 254 145 151 154 58 64 64 58 62 65 85 80 60 157 127 54 155 128 52 157 124 59 
+157 126 52 156 125 56 156 128 53 158 126 53 158 124 56 156 129 45 156 128 53 128 99 63 
+57 60 70 54 64 59 58 65 54 88 95 83 241 240 247 254 252 251 254 255 251 254 255 251 
+254 255 255 254 254 255 253 252 247 254 255 251 255 255 255 213 212 223 97 100 105 57 63 61 
+58 65 69 66 60 61 147 124 59 159 126 56 156 124 53 156 128 53 158 127 55 156 124 53 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 65 110 110 107 254 252 251 254 255 255 172 178 183 58 64 64 59 59 56 72 76 65 
+157 126 52 158 134 59 152 124 51 159 126 56 157 127 54 156 125 56 155 128 52 156 126 54 
+157 127 54 162 124 55 156 125 56 72 76 65 58 65 69 57 63 61 71 72 69 202 204 206 
+255 254 255 254 252 250 254 255 251 253 252 247 249 254 246 253 252 247 254 252 251 255 254 255 
+254 254 255 145 151 154 57 63 61 56 66 64 62 65 65 101 91 62 158 134 59 161 124 50 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 253 254 254 255 251 187 189 188 57 60 56 58 65 69 62 66 56 147 124 59 161 124 50 
+156 124 53 157 124 59 156 128 53 152 124 44 158 125 54 155 126 57 155 127 54 157 126 52 
+109 102 83 66 60 61 58 59 64 58 65 69 125 131 132 241 240 247 253 253 255 254 254 254 
+255 254 255 254 254 255 254 252 251 255 255 253 254 255 251 255 255 253 253 253 255 253 253 255 
+249 254 254 249 254 254 255 254 255 241 240 247 156 160 157 68 69 75 58 62 65 62 65 65 
+58 62 63 62 61 67 62 66 62 71 72 69 62 66 62 57 60 70 58 65 69 57 60 70 
+97 100 105 254 255 255 252 252 252 255 255 255 253 253 253 62 65 65 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 209 105 45 210 105 51 213 105 50 198 102 49 62 66 56 62 65 65 53 64 53 
+71 72 69 213 212 223 255 254 255 251 251 251 254 255 251 254 252 250 254 251 249 254 252 250 
+255 253 254 248 254 252 219 227 224 97 100 105 57 60 56 58 65 69 72 73 56 198 102 49 
+212 104 43 210 102 46 209 99 39 219 98 50 213 105 50 210 105 40 212 101 45 212 98 39 
+211 104 39 213 105 46 97 78 60 53 60 64 56 64 62 178 172 162 253 252 247 255 254 255 
+255 255 253 97 100 105 54 67 66 62 66 56 128 93 57 216 99 44 208 103 45 211 102 45 
+213 103 41 210 99 44 210 105 40 213 103 41 210 102 46 212 98 39 210 99 51 128 93 57 
+58 65 69 57 58 61 54 64 59 125 131 132 254 254 254 253 252 247 255 255 253 255 253 254 
+254 251 249 254 250 255 255 255 253 253 252 247 254 255 255 224 220 212 72 76 65 56 66 64 
+54 67 66 72 76 65 210 105 51 212 101 45 208 103 45 208 103 45 213 100 46 216 99 44 
+212 101 45 212 98 39 213 105 50 208 103 45 174 105 47 59 60 64 59 64 62 58 64 64 
+230 230 230 255 253 254 104 112 110 59 64 62 62 65 65 155 104 59 210 102 46 213 105 46 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 253 253 255 254 252 251 219 227 224 59 60 62 57 63 63 66 60 61 174 105 47 
+212 104 43 200 101 40 217 98 38 207 99 48 210 102 46 213 105 46 213 100 46 207 105 38 
+209 105 45 155 104 59 54 67 66 62 66 56 57 58 61 113 113 120 242 238 229 253 252 247 
+254 252 251 255 253 254 253 253 255 255 255 255 253 253 253 254 254 254 253 255 254 253 255 254 
+255 255 253 254 251 252 255 254 255 254 250 255 253 253 255 156 160 157 71 72 69 54 64 59 
+57 63 63 58 62 65 50 65 64 71 68 65 71 68 65 54 64 59 62 66 62 66 60 61 
+54 67 66 97 100 105 241 240 247 249 252 251 253 255 254 
+253 253 255 178 172 162 0 3 1 0 1 1 4 1 5 62 66 62 169 144 61 166 144 56 
+169 141 58 169 144 61 166 144 56 173 142 59 169 144 61 166 144 56 169 141 58 169 138 59 
+169 141 58 169 141 58 169 138 59 169 138 59 169 141 58 169 141 58 169 138 59 169 138 59 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 158 134 59 152 127 56 149 124 55 
+147 124 59 147 124 59 147 124 59 147 124 59 149 124 55 147 124 59 147 124 59 165 143 59 
+169 141 58 173 138 52 59 59 56 97 100 105 255 255 255 254 252 251 254 255 255 255 255 253 
+252 252 252 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 
+251 251 251 241 240 247 88 95 83 0 0 0 71 72 69 213 212 223 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+252 252 252 253 253 253 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 140 141 138 4 1 5 71 72 69 254 254 254 
+253 253 253 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+152 127 56 156 126 54 156 124 53 156 128 53 149 124 55 71 72 69 53 67 71 54 64 59 
+57 61 64 140 141 138 230 230 230 255 255 253 251 251 251 249 254 246 254 255 251 249 254 246 
+202 204 206 97 100 105 62 61 67 57 60 56 50 65 62 94 90 61 159 126 56 158 124 53 
+158 124 56 156 128 53 152 124 44 158 125 54 158 127 55 152 124 51 155 127 54 157 124 59 
+155 126 57 71 68 65 59 64 62 58 65 69 160 163 161 252 252 252 253 255 254 230 230 230 
+58 66 61 58 59 68 56 64 62 128 113 57 159 126 56 157 126 52 157 124 59 157 126 52 
+158 125 54 157 124 59 158 127 55 159 126 56 152 124 44 149 124 55 84 69 58 58 62 65 
+57 61 64 58 62 65 104 112 110 202 204 206 253 252 247 254 255 251 253 255 254 249 252 251 
+252 252 252 255 255 255 255 255 253 253 252 247 250 252 246 254 255 251 230 230 230 140 141 138 
+71 72 69 58 62 65 59 59 56 57 60 56 50 65 64 72 76 65 128 113 57 161 124 50 
+150 126 55 110 92 61 71 65 56 69 60 69 53 64 53 59 59 56 202 204 206 253 253 253 
+254 250 255 202 204 206 57 63 63 57 63 63 62 66 62 147 124 59 158 127 55 155 126 57 
+157 126 52 156 125 56 157 127 54 157 126 52 162 124 55 162 124 55 157 126 52 155 126 57 
+113 104 59 66 60 61 58 59 68 56 64 62 68 69 75 187 189 188 253 252 247 254 254 255 
+250 252 254 254 254 253 255 254 255 252 252 252 160 163 161 72 76 65 57 61 64 62 61 67 
+60 60 63 128 99 63 152 124 44 156 128 53 156 128 53 156 125 56 156 124 53 158 127 55 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+58 62 65 110 110 107 254 254 254 253 253 253 230 230 230 57 61 64 57 63 61 57 63 61 
+147 124 59 157 124 59 156 128 53 157 124 59 158 125 54 158 124 56 158 127 55 156 126 54 
+158 124 54 152 124 44 166 129 59 147 124 59 57 63 61 58 65 69 59 59 56 58 64 64 
+156 160 157 241 240 247 255 254 255 255 254 255 253 253 255 254 255 255 254 255 255 202 204 206 
+104 112 110 57 60 56 58 65 54 58 62 65 71 72 69 152 127 56 161 124 50 162 125 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+253 253 255 254 255 251 255 254 255 81 77 81 57 63 63 62 61 67 101 91 62 156 129 45 
+159 126 56 155 128 52 155 128 52 155 128 52 158 127 55 156 124 53 158 127 55 157 126 52 
+152 124 51 94 90 61 53 63 60 57 60 56 57 63 61 81 77 81 187 189 188 254 255 255 
+253 255 254 253 255 254 253 253 253 253 253 253 249 252 251 255 255 253 253 255 254 253 255 254 
+254 255 255 241 240 247 160 163 161 68 69 75 60 61 69 59 59 56 62 66 56 50 65 62 
+71 72 69 110 92 61 158 132 49 156 126 54 113 104 59 72 76 65 53 60 64 58 65 54 
+59 64 62 160 163 161 253 253 253 253 253 253 253 253 253 59 60 62 58 64 64 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+216 99 44 213 105 50 210 99 44 207 105 38 212 98 39 155 104 59 58 64 64 54 67 66 
+58 64 64 68 69 75 160 163 161 254 255 251 254 252 251 253 253 255 253 255 254 253 255 254 
+254 255 251 172 178 183 68 69 75 58 66 61 58 62 65 53 63 60 142 101 66 213 103 41 
+210 99 44 208 103 45 212 98 39 213 100 52 210 99 44 212 98 39 212 101 45 211 102 45 
+212 98 39 185 105 60 57 63 61 57 63 63 54 67 66 242 238 229 254 255 251 254 255 255 
+255 253 254 172 178 183 54 64 59 57 63 61 72 73 56 210 105 51 208 103 45 209 105 45 
+212 101 45 208 103 45 209 105 45 216 99 44 210 102 46 209 99 39 216 99 44 198 102 49 
+84 69 58 62 66 56 58 65 69 57 58 61 110 110 107 202 204 206 253 253 255 253 255 254 
+255 254 255 254 255 251 253 252 247 241 240 247 160 163 161 60 64 65 57 63 61 56 66 64 
+71 68 65 174 105 47 213 103 41 216 99 44 211 104 39 212 101 45 210 102 46 216 99 44 
+213 100 46 210 102 46 210 102 46 213 105 46 128 93 57 59 64 62 56 66 64 104 112 110 
+255 255 255 251 251 251 104 112 110 57 63 61 58 64 64 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 253 255 254 254 255 251 253 253 253 81 77 81 58 62 65 60 64 65 128 93 57 
+211 102 45 213 105 46 210 102 46 211 99 45 210 102 46 213 105 50 209 99 39 208 103 45 
+212 98 39 216 99 44 97 78 60 50 65 62 59 59 56 51 61 71 71 81 83 172 178 183 
+254 255 251 248 254 252 253 255 254 248 254 252 253 255 254 252 252 252 253 253 255 250 252 254 
+253 255 254 250 252 246 242 238 229 172 178 183 88 95 83 58 62 63 59 64 62 58 65 69 
+62 61 67 71 68 65 155 104 59 210 102 46 213 105 46 155 104 59 72 76 65 62 61 67 
+56 66 64 62 65 65 154 157 157 253 255 254 249 254 254 
+255 254 255 242 238 229 4 1 5 4 2 1 0 1 1 0 1 1 142 120 69 164 144 50 
+169 138 59 173 142 59 169 141 58 169 138 59 169 144 61 164 144 50 169 141 58 169 138 59 
+169 141 58 169 141 58 169 138 59 169 138 59 169 141 58 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 168 136 64 158 134 59 149 124 55 147 124 59 147 124 59 
+149 124 55 147 124 59 147 124 59 147 124 59 147 124 59 149 124 55 159 134 56 169 144 61 
+169 138 59 169 144 61 21 19 24 88 95 83 249 254 254 254 255 255 253 253 253 255 254 255 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 252 252 252 253 253 253 255 255 255 
+255 255 255 251 251 251 241 240 247 140 141 138 0 0 0 0 1 1 113 113 120 230 230 230 
+251 251 251 255 255 255 254 254 254 252 252 252 255 255 255 252 252 252 254 254 254 255 255 255 
+255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 241 240 247 88 95 83 0 0 0 219 227 224 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 126 53 155 127 54 157 124 59 150 128 52 158 124 56 128 113 57 71 68 65 58 62 63 
+60 64 65 58 62 63 60 60 63 97 100 105 145 151 154 160 163 161 125 131 132 81 77 81 
+62 61 67 57 61 64 56 66 64 53 67 71 85 80 60 152 127 56 156 124 53 150 128 52 
+158 124 54 158 126 53 152 124 51 159 126 56 156 126 54 154 129 46 158 127 55 158 124 53 
+113 104 59 58 65 69 59 64 62 57 61 64 230 230 230 254 251 252 248 254 252 253 253 255 
+113 113 120 58 65 69 53 60 64 84 69 58 159 126 56 158 125 54 158 124 54 158 126 53 
+156 125 56 157 126 52 159 126 56 152 124 51 159 126 56 159 126 56 147 124 59 72 73 56 
+60 60 63 59 64 62 57 63 61 54 64 59 97 100 105 160 163 161 202 204 206 230 230 230 
+254 255 251 255 255 253 254 252 251 202 206 211 172 178 183 113 113 120 58 65 69 53 60 64 
+57 63 63 57 60 56 62 70 69 72 76 65 128 113 57 156 125 56 158 127 55 158 124 56 
+161 125 43 158 127 55 150 126 55 66 60 61 58 62 63 58 65 69 113 113 120 253 255 254 
+254 254 255 254 255 251 71 81 83 59 60 64 57 63 61 101 91 62 161 124 50 157 126 52 
+158 124 54 156 125 56 158 127 55 156 124 53 159 126 56 159 126 56 156 124 53 157 126 52 
+155 128 52 110 92 61 62 65 65 58 65 69 53 64 53 62 66 62 68 69 75 110 110 107 
+152 161 158 156 160 157 113 113 120 68 69 75 57 60 70 54 67 66 58 66 61 58 62 65 
+110 92 61 156 128 53 162 124 55 155 127 54 157 127 54 156 124 53 156 126 54 157 126 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+60 64 65 97 100 105 255 255 255 252 252 252 254 255 255 97 100 105 57 61 64 57 63 63 
+110 92 61 155 128 52 159 126 56 152 124 51 158 127 55 156 124 53 157 124 59 157 126 52 
+157 127 54 159 126 56 157 126 52 149 124 55 128 113 57 62 66 62 50 65 64 58 62 65 
+57 63 61 57 63 61 104 112 110 145 151 154 152 161 158 140 141 138 81 77 81 57 58 61 
+57 63 61 54 67 66 58 64 64 71 68 65 147 124 59 156 128 53 157 124 59 156 124 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 254 254 253 255 254 255 253 254 156 160 157 60 64 65 58 64 64 71 68 65 148 133 63 
+161 124 50 159 126 56 155 126 57 156 125 56 159 126 56 157 126 52 156 124 53 157 124 59 
+159 126 56 152 124 51 97 78 60 54 67 66 58 68 63 59 64 62 58 65 54 81 77 81 
+140 141 138 187 189 188 230 230 230 255 253 254 255 254 255 254 254 253 224 220 212 172 178 183 
+113 113 120 57 63 61 58 66 61 57 63 61 57 60 56 60 64 65 71 65 56 110 92 61 
+158 124 56 157 124 59 158 126 53 158 124 53 159 126 56 150 126 55 85 80 60 58 66 61 
+60 64 65 81 77 81 253 255 254 255 255 255 254 254 254 59 64 62 62 70 69 57 63 61 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+212 104 43 212 104 43 213 105 50 217 104 40 210 105 51 212 104 43 142 101 66 57 63 63 
+58 65 54 60 64 65 58 62 63 71 72 69 110 110 107 156 160 157 154 157 157 113 113 120 
+68 69 75 59 59 56 58 65 54 57 63 61 58 64 64 142 101 66 200 101 40 216 99 44 
+211 99 45 209 105 45 208 103 45 210 102 46 212 101 45 217 105 50 207 99 48 207 105 48 
+217 105 50 112 79 60 54 64 59 62 66 62 104 112 110 253 253 255 254 254 253 254 255 251 
+254 255 255 241 240 247 71 72 69 58 64 64 57 60 56 142 101 66 217 98 38 208 103 45 
+211 102 45 209 105 45 213 105 50 213 100 46 210 102 46 208 103 45 208 103 45 217 104 40 
+198 102 49 84 69 58 58 62 65 66 60 61 59 60 62 58 62 65 97 100 105 125 131 132 
+152 161 158 140 141 138 113 113 120 53 63 60 54 67 66 58 62 65 62 61 67 62 70 69 
+155 104 59 213 100 46 208 103 45 212 104 43 210 99 44 216 99 44 210 102 46 207 105 38 
+208 103 45 213 103 41 208 103 45 210 99 51 59 64 62 62 65 65 62 66 56 187 189 188 
+253 253 255 255 253 254 104 112 110 59 64 62 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 255 254 253 252 247 254 252 251 178 172 162 60 64 65 53 60 64 71 65 56 
+198 102 49 208 103 45 213 105 46 210 102 46 211 104 39 208 103 45 216 99 44 210 102 46 
+213 105 46 213 100 46 213 100 46 97 78 60 57 63 61 59 60 64 60 61 69 56 64 62 
+81 77 81 145 151 154 187 189 188 219 227 224 250 250 247 254 255 251 254 255 251 224 220 212 
+172 178 183 140 141 138 71 72 69 62 65 65 57 63 61 57 60 56 59 64 62 66 60 61 
+142 101 66 211 104 39 208 103 45 210 105 51 209 105 45 213 105 50 212 101 45 97 78 60 
+59 60 62 57 60 56 71 72 69 253 255 254 253 255 254 
+253 253 255 249 254 254 97 100 105 0 0 0 4 1 5 0 0 0 21 19 24 168 136 64 
+169 141 58 166 134 56 173 145 52 169 138 59 169 138 59 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 138 59 169 141 58 169 141 58 166 144 56 169 141 58 169 141 58 
+169 141 58 169 138 59 158 134 59 155 126 57 147 124 59 147 124 59 147 124 59 147 124 59 
+147 124 59 147 124 59 149 124 53 147 124 59 147 124 59 158 127 55 169 141 58 169 138 59 
+173 142 59 142 120 69 0 3 1 71 72 69 249 254 254 253 255 254 250 247 249 230 230 230 
+230 230 230 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 252 252 252 255 255 255 
+252 252 252 255 255 255 254 254 254 255 255 255 230 230 230 97 100 105 0 1 1 0 1 1 
+110 110 107 219 227 224 253 253 253 255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 
+252 252 252 253 253 253 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 
+253 253 253 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 253 253 253 
+253 253 253 255 255 255 255 255 255 125 131 132 0 0 0 125 131 132 254 254 254 255 255 255 
+254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 53 158 127 55 157 124 59 161 124 50 162 125 53 155 126 57 149 124 55 85 80 60 
+57 63 61 57 63 61 54 64 59 56 64 62 60 64 65 57 61 64 62 61 67 60 64 65 
+58 65 69 62 61 67 57 63 61 94 90 61 158 127 55 162 124 55 158 127 55 155 128 52 
+156 126 54 158 124 56 158 124 56 158 124 56 156 129 45 157 126 52 157 124 59 155 127 54 
+72 73 56 62 65 65 57 63 61 125 131 132 254 254 255 255 254 255 248 254 252 255 255 255 
+202 206 211 57 58 61 62 70 69 57 60 56 128 99 63 161 124 50 157 126 52 157 126 52 
+154 129 46 158 127 55 158 124 54 157 124 59 159 126 56 152 124 44 155 126 57 147 124 59 
+94 90 61 62 66 56 62 61 67 57 60 70 60 64 65 57 60 56 59 64 62 58 59 64 
+57 60 70 57 61 64 62 65 65 57 60 56 57 63 61 62 65 65 57 60 56 62 65 65 
+60 64 65 71 68 65 110 92 61 156 125 56 158 126 53 159 126 56 156 124 53 155 126 57 
+154 129 46 155 126 57 158 127 55 101 91 62 60 64 65 54 67 66 62 61 67 249 254 254 
+254 255 251 255 255 255 178 172 162 60 60 63 59 60 64 71 72 69 157 124 59 161 125 43 
+158 124 56 159 126 56 158 127 55 156 125 56 156 124 53 158 125 54 158 124 54 156 126 54 
+157 124 59 152 127 56 110 92 61 66 60 61 56 66 64 53 64 53 58 66 61 58 62 65 
+58 65 69 57 63 61 58 64 64 56 66 64 56 66 64 58 62 65 71 65 56 113 104 59 
+152 127 56 159 126 56 166 129 59 152 124 51 159 126 56 158 124 53 159 126 56 157 126 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+60 64 65 104 112 110 255 255 253 255 255 253 255 255 255 172 178 183 53 63 60 56 66 64 
+71 68 65 151 135 55 156 124 53 155 128 52 156 128 53 155 126 57 155 128 52 162 124 55 
+149 124 53 158 124 53 155 126 57 166 129 59 155 126 57 128 113 57 72 76 65 62 66 62 
+57 63 61 62 65 65 59 64 62 59 60 62 62 66 62 57 60 56 57 63 61 56 66 64 
+60 61 69 62 65 65 85 80 60 147 124 59 155 128 52 155 128 52 155 128 52 155 126 57 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 255 253 250 252 254 254 255 251 241 240 247 68 69 75 58 66 61 58 65 69 110 92 61 
+158 132 49 157 124 59 157 124 59 157 126 52 157 124 59 157 124 59 156 124 53 158 127 55 
+156 126 54 158 124 54 158 127 55 110 92 61 59 64 62 54 64 59 68 69 75 53 60 64 
+58 62 65 60 64 65 57 63 61 57 63 61 57 60 56 59 64 62 58 62 63 58 62 65 
+56 66 64 58 62 63 57 63 61 54 67 66 62 66 62 101 91 62 157 124 59 162 124 55 
+162 124 55 159 126 56 162 124 52 162 125 53 156 124 53 155 128 52 128 99 63 58 59 64 
+57 63 63 60 64 65 213 212 223 253 253 253 254 254 254 59 60 62 58 62 63 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 102 46 211 104 39 210 99 51 207 99 48 213 100 52 210 105 40 213 105 46 155 104 59 
+66 60 61 58 62 65 53 67 71 58 65 69 57 63 61 53 63 60 56 66 64 62 65 65 
+59 64 62 58 62 65 57 60 70 62 70 69 155 104 59 208 103 45 213 105 50 213 100 46 
+213 100 46 213 100 46 208 103 45 208 103 45 213 105 46 213 105 50 207 99 38 213 103 41 
+185 105 60 57 60 70 60 64 65 57 63 63 187 189 188 255 255 253 254 255 255 252 252 252 
+254 255 251 248 254 252 160 163 161 59 59 56 58 65 69 62 65 65 209 99 39 213 105 46 
+211 102 45 212 101 45 213 100 46 207 99 48 211 102 45 213 105 46 208 103 45 211 102 45 
+213 105 50 198 102 49 97 78 60 54 67 66 59 60 62 56 66 64 59 64 62 59 64 62 
+53 67 71 59 64 62 57 63 61 62 66 62 62 66 56 56 66 64 84 69 58 174 105 47 
+217 104 40 210 99 51 217 105 50 207 99 48 209 105 45 211 102 45 210 102 46 210 105 40 
+208 103 45 209 99 39 212 104 43 112 79 60 62 61 67 57 63 61 81 77 81 249 254 254 
+253 253 255 255 254 255 104 112 110 62 65 65 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 253 255 254 253 252 247 255 255 253 241 240 247 71 72 69 62 70 69 53 60 64 
+128 93 57 217 104 40 208 103 45 211 102 45 217 104 40 213 103 41 210 99 44 213 100 46 
+210 102 46 207 99 38 217 104 40 209 105 45 128 93 57 62 70 69 53 60 64 62 65 65 
+62 61 67 62 61 67 58 62 63 60 64 65 62 66 62 57 58 61 57 61 64 53 60 64 
+57 63 61 57 63 63 58 62 65 57 58 61 54 67 66 62 65 65 128 93 57 198 102 49 
+210 99 51 217 104 40 208 103 45 213 103 41 209 99 39 212 101 45 219 98 50 174 105 47 
+59 64 62 62 65 65 59 64 62 202 204 206 255 255 255 
+254 252 251 254 251 252 187 189 188 4 1 5 0 1 1 4 1 5 4 1 5 84 69 58 
+158 134 59 166 144 56 166 144 56 173 145 52 169 141 58 168 136 64 166 144 56 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+159 134 56 159 134 56 149 124 55 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 
+147 124 59 147 124 59 147 124 59 147 124 59 158 134 59 173 142 59 169 141 58 166 144 56 
+168 136 64 88 95 83 21 19 24 4 1 5 213 212 223 250 252 246 250 250 247 213 212 223 
+224 220 212 224 220 212 230 230 230 255 255 255 255 255 255 251 251 251 255 255 255 254 254 254 
+255 255 255 254 254 254 251 251 251 251 251 251 255 255 255 253 253 253 202 204 206 97 100 105 
+0 1 1 0 0 0 81 77 81 178 172 162 253 253 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 241 240 247 113 113 120 4 2 1 48 49 51 255 255 255 253 253 253 251 251 251 
+255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 156 126 54 162 125 53 156 129 45 154 129 46 157 126 52 157 124 59 147 124 59 
+109 102 83 85 80 60 62 65 65 53 60 64 54 67 66 54 64 59 57 63 61 60 64 65 
+59 59 56 94 90 61 149 124 53 158 127 55 162 124 55 158 124 54 157 124 59 161 124 50 
+156 125 56 158 127 55 157 124 59 156 124 53 166 129 59 158 124 53 155 128 52 128 99 63 
+58 64 64 59 59 56 58 67 65 230 230 230 255 254 255 250 247 249 254 255 251 253 253 253 
+255 255 253 104 112 110 57 60 56 60 64 65 72 73 56 157 124 59 155 128 52 158 125 54 
+158 127 55 158 126 53 158 124 56 155 128 52 154 129 46 158 124 56 159 126 56 161 125 43 
+157 127 54 128 99 63 85 80 60 60 61 69 50 65 64 50 65 62 56 64 62 60 64 65 
+58 64 64 58 67 65 53 64 53 53 63 60 56 64 62 57 63 63 59 64 62 71 72 69 
+113 104 59 152 127 56 156 128 53 156 124 53 156 124 53 158 134 59 155 126 57 158 125 54 
+157 124 59 166 129 59 156 124 53 147 124 59 57 60 70 53 60 64 58 66 61 230 230 230 
+254 255 251 248 254 252 250 247 249 68 69 75 62 61 67 56 64 62 101 91 62 158 127 55 
+158 125 54 158 126 53 156 124 53 158 127 55 155 128 52 154 129 46 157 127 54 157 124 59 
+152 124 51 162 124 55 161 124 50 147 124 59 101 91 62 62 65 65 59 64 62 62 66 56 
+60 60 63 57 60 56 62 66 56 57 63 61 71 68 65 101 91 62 149 124 55 157 126 52 
+161 125 43 157 124 59 152 124 51 156 125 56 162 125 53 158 124 54 157 124 59 158 127 55 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 104 112 110 254 255 251 254 254 253 255 255 253 241 240 247 71 81 83 57 63 63 
+58 62 65 113 104 59 155 128 52 158 126 53 156 126 54 155 127 54 154 129 46 158 124 56 
+162 124 55 156 128 53 162 124 55 152 124 51 155 127 54 156 126 54 157 124 59 113 104 59 
+71 72 69 57 63 61 59 64 62 56 66 64 56 66 64 56 66 64 58 64 64 58 62 65 
+85 80 60 128 113 57 155 128 52 159 126 56 158 124 53 158 124 53 159 126 56 155 128 52 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 251 252 254 255 251 255 255 253 254 255 251 154 157 157 59 64 62 53 60 64 71 65 56 
+142 120 69 156 128 53 161 125 43 159 126 56 159 126 56 157 124 59 159 126 56 152 124 44 
+157 126 52 158 127 55 155 127 54 156 126 54 142 120 69 94 90 61 56 64 62 59 60 62 
+58 62 65 58 62 65 57 61 64 58 65 69 57 61 64 60 61 69 58 62 65 58 65 69 
+58 65 54 58 62 63 71 68 65 110 92 61 147 124 59 154 129 46 156 126 54 156 124 53 
+155 126 57 150 128 52 156 128 53 162 125 53 158 124 56 162 124 55 150 128 52 71 65 56 
+57 63 63 58 62 63 202 206 211 255 255 255 253 253 253 62 65 65 60 64 65 57 63 63 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+211 102 45 213 105 50 217 104 40 211 104 39 217 105 50 209 99 39 212 98 39 217 98 38 
+198 102 49 128 93 57 71 68 65 60 61 69 62 61 67 57 63 61 59 64 62 59 60 62 
+54 64 59 69 60 69 128 93 57 200 101 40 213 105 50 208 103 45 212 98 39 213 105 50 
+212 104 43 216 99 44 210 102 46 209 99 39 208 103 45 208 103 45 212 98 39 213 105 46 
+97 78 60 58 65 69 57 58 61 88 95 83 254 254 254 255 255 253 253 253 255 254 255 251 
+254 255 251 252 252 252 241 240 247 68 69 75 50 65 64 58 64 64 128 93 57 211 99 45 
+212 104 43 216 99 44 212 101 45 208 103 45 210 105 40 217 104 40 212 101 45 212 101 45 
+216 99 44 216 99 44 207 105 38 155 104 59 97 78 60 66 60 61 53 60 64 57 63 63 
+59 59 56 58 62 63 62 61 67 53 60 64 71 72 69 142 101 66 213 105 46 207 105 48 
+207 99 38 217 104 40 207 99 48 211 102 45 212 104 43 207 99 48 213 105 50 216 99 44 
+211 99 45 216 99 44 174 105 47 54 64 59 60 60 63 53 64 53 187 189 188 255 255 253 
+255 255 255 251 251 251 104 112 110 59 64 62 58 62 63 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 249 254 254 255 255 253 254 254 253 253 255 254 154 157 157 57 58 61 58 65 69 
+58 65 69 185 105 60 213 103 41 208 103 45 219 98 50 216 99 44 200 101 40 212 101 45 
+210 102 46 210 105 51 207 105 48 216 99 44 212 101 45 198 102 49 112 79 60 66 60 61 
+57 63 61 56 66 64 60 64 65 57 61 64 60 60 63 60 60 63 62 65 65 60 60 63 
+60 64 65 57 60 56 60 64 65 71 68 65 128 93 57 198 102 49 217 104 40 213 100 52 
+212 104 43 209 99 39 210 99 51 211 102 45 212 104 43 210 99 51 212 104 43 207 105 48 
+71 68 65 59 64 62 58 64 64 178 172 162 252 252 252 
+254 255 251 254 252 251 249 252 251 97 100 105 4 2 1 4 1 5 0 0 0 4 1 5 
+97 78 60 151 135 55 165 143 59 168 136 64 169 141 58 166 144 56 173 145 52 168 136 64 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 168 136 64 158 134 59 
+152 127 56 149 124 55 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 
+149 124 55 147 124 59 148 133 63 158 134 59 173 138 52 173 142 59 169 144 61 165 143 59 
+142 120 69 4 2 1 137 137 94 68 58 52 125 131 132 254 255 251 253 252 247 219 227 224 
+219 227 224 213 212 223 213 212 223 219 227 224 251 251 251 255 255 255 254 254 254 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 
+230 230 230 113 113 120 48 49 51 4 1 5 6 9 5 97 100 105 187 189 188 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 253 253 253 
+254 254 254 255 255 255 255 255 255 253 253 253 252 252 252 255 255 255 255 255 255 254 254 254 
+202 204 206 71 72 69 0 0 0 48 49 51 241 240 247 253 253 253 253 253 253 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 124 59 155 128 52 157 124 59 152 127 56 155 128 52 162 124 55 154 129 46 162 125 53 
+157 124 59 149 124 55 147 124 59 128 113 57 101 91 62 101 91 62 110 92 61 113 104 59 
+147 124 59 152 127 56 156 125 56 162 125 53 157 124 59 156 124 53 155 127 54 156 128 53 
+158 124 56 157 126 52 158 127 55 158 127 55 156 124 53 157 124 59 147 124 59 66 60 61 
+60 61 69 62 66 62 125 131 132 254 252 251 253 253 255 253 255 254 254 255 251 254 254 255 
+249 252 251 219 227 224 59 64 62 60 61 69 53 64 53 101 91 62 152 127 56 156 125 56 
+156 124 53 157 124 59 156 129 45 158 127 55 157 124 59 155 128 52 159 126 56 161 124 50 
+156 124 53 156 128 53 155 128 52 128 113 57 113 104 59 85 80 60 72 76 65 57 63 61 
+58 64 64 57 63 63 59 64 62 71 68 65 85 80 60 110 92 61 142 120 69 155 128 52 
+158 127 55 156 125 56 158 124 54 162 124 55 155 126 57 152 124 51 158 127 55 152 124 44 
+162 124 55 156 124 53 162 125 53 155 128 52 62 66 62 56 66 64 59 60 64 230 230 230 
+255 255 253 254 255 251 250 247 249 154 157 157 59 64 62 57 63 61 71 68 65 142 120 69 
+157 127 54 158 126 53 157 126 52 158 127 55 156 126 54 156 128 53 155 128 52 158 124 54 
+158 126 53 155 128 52 155 126 57 156 125 56 152 124 51 152 124 51 142 120 69 110 92 61 
+94 90 61 101 91 62 110 92 61 128 113 57 152 127 56 155 126 57 152 124 51 156 129 45 
+159 126 56 152 124 51 158 134 59 159 126 56 154 129 46 155 126 57 158 124 56 157 126 52 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+59 64 62 104 112 110 254 255 255 253 253 253 255 255 253 254 254 253 154 157 157 59 64 62 
+60 64 65 71 68 65 147 124 59 156 124 53 158 124 56 155 128 52 156 128 53 156 124 53 
+159 126 56 161 124 50 155 128 52 158 127 55 155 128 52 162 125 53 158 126 53 155 127 54 
+156 125 56 142 120 69 113 104 59 101 91 62 94 90 61 101 91 62 128 113 57 149 124 55 
+148 133 63 156 129 45 162 124 55 159 126 56 157 124 59 161 124 50 157 124 59 152 124 51 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+254 251 252 254 255 255 248 254 252 255 254 255 241 240 247 68 69 75 59 64 62 58 65 69 
+85 80 60 148 133 63 162 125 53 158 124 56 158 127 55 152 124 51 158 124 56 157 126 52 
+166 129 59 157 124 59 156 124 53 161 125 43 156 124 53 155 126 57 147 124 59 113 104 59 
+85 80 60 72 76 65 62 66 62 59 64 62 57 58 61 59 59 56 62 66 56 72 76 65 
+94 90 61 128 113 57 157 124 59 158 125 54 157 124 59 157 124 59 158 127 55 150 128 52 
+158 125 54 152 124 51 156 125 56 152 124 51 152 127 56 159 126 56 152 124 51 84 69 58 
+56 66 64 57 63 63 202 206 211 253 253 253 253 253 253 59 64 62 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+210 102 46 207 99 38 216 99 44 212 98 39 207 99 38 213 100 52 213 100 46 208 103 45 
+212 104 43 212 104 43 207 105 48 174 105 47 142 101 66 112 79 60 112 79 60 142 101 66 
+174 105 47 210 102 46 217 105 50 207 105 38 208 103 45 210 105 51 216 99 44 210 105 51 
+208 103 45 216 99 44 213 105 46 213 103 41 208 103 45 208 103 45 213 105 46 155 104 59 
+62 61 67 57 60 56 62 65 65 187 189 188 254 254 255 255 255 255 255 254 255 254 255 251 
+254 252 250 253 255 254 254 255 251 152 161 158 53 63 60 66 60 61 53 60 64 155 104 59 
+208 103 45 216 99 44 212 104 43 207 105 38 209 105 45 216 99 44 216 99 44 210 102 46 
+213 105 46 211 102 45 211 99 45 209 105 45 208 103 45 198 102 49 155 104 59 128 93 57 
+128 93 57 112 79 60 142 101 66 174 105 47 209 99 39 217 104 40 210 99 44 216 99 44 
+213 105 46 208 103 45 213 105 46 207 105 38 210 99 51 210 102 46 213 105 50 211 99 45 
+210 105 51 198 102 49 71 68 65 59 59 56 54 67 66 97 100 105 249 254 246 254 251 252 
+255 255 255 251 251 251 104 112 110 59 64 62 58 62 63 155 104 59 213 105 50 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+156 160 157 249 252 251 253 253 255 255 254 255 254 255 251 253 255 254 88 95 83 57 63 63 
+59 64 62 71 72 69 207 105 48 210 99 51 210 99 44 212 104 43 213 105 46 208 103 45 
+211 102 45 207 99 48 213 100 46 213 105 46 210 99 44 208 103 45 213 105 46 198 102 49 
+142 101 66 112 79 60 85 80 60 57 63 61 54 67 66 50 65 64 57 60 56 62 66 56 
+85 80 60 128 93 57 174 105 47 210 105 51 209 99 39 207 105 48 207 105 48 209 99 39 
+210 105 40 208 103 45 211 104 39 210 102 46 208 103 45 207 105 38 209 105 45 208 103 45 
+81 77 81 59 59 56 57 58 61 187 189 188 255 254 255 
+255 255 253 254 251 252 255 253 254 242 238 229 48 49 51 0 1 1 0 3 1 0 1 1 
+4 1 5 85 80 60 158 134 59 173 145 52 168 136 64 169 141 58 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 159 134 56 152 127 56 147 124 59 
+147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 147 124 59 
+158 134 59 159 134 56 166 144 56 169 144 61 169 141 58 164 144 50 168 136 64 142 120 69 
+4 1 5 109 102 83 173 138 52 109 102 83 48 49 51 241 240 247 254 252 251 254 250 255 
+219 227 224 213 212 223 219 227 224 224 220 212 219 227 224 251 251 251 255 255 255 253 253 253 
+254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 
+254 254 254 255 255 255 241 240 247 172 178 183 113 113 120 0 1 1 0 1 1 4 2 1 
+71 72 69 125 131 132 202 204 206 241 240 247 254 254 254 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 241 240 247 178 172 162 97 100 105 
+0 1 1 0 0 0 125 131 132 255 255 255 255 255 255 255 255 255 254 254 254 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 253 152 161 158 60 64 65 57 63 61 101 91 62 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+157 124 59 154 129 46 110 92 61 156 125 56 158 127 55 157 124 59 155 126 57 157 126 52 
+155 128 52 159 126 56 158 124 56 158 124 53 161 124 50 161 124 50 158 127 55 159 126 56 
+158 127 55 156 124 53 158 127 55 156 124 53 156 128 53 155 127 54 155 128 52 158 124 54 
+158 125 54 158 125 54 155 128 52 157 124 59 161 125 43 156 124 53 85 80 60 56 66 64 
+62 61 67 71 81 83 230 230 230 255 253 254 253 253 253 254 255 251 250 252 246 255 254 255 
+255 255 253 254 255 251 160 163 161 51 61 71 54 64 59 59 64 62 128 99 63 155 128 52 
+159 126 56 155 128 52 156 125 56 159 126 56 158 124 54 155 127 54 155 128 52 157 124 59 
+156 126 54 156 126 54 158 125 54 159 126 56 156 125 56 157 124 59 159 126 56 156 124 53 
+158 124 56 156 126 54 155 128 52 155 128 52 155 126 57 156 125 56 158 125 54 162 125 53 
+158 125 54 158 126 53 156 126 54 155 127 54 158 126 53 158 126 53 156 124 53 157 124 59 
+155 128 52 156 128 53 158 124 56 110 92 61 59 64 62 57 63 61 68 69 75 254 255 251 
+254 252 244 254 250 255 253 255 254 249 254 246 71 81 83 62 61 67 53 64 53 85 80 60 
+155 127 54 158 127 55 158 125 54 158 127 55 157 124 59 157 124 59 156 124 53 159 126 56 
+155 127 54 156 125 56 158 124 54 152 124 51 157 126 52 158 127 55 156 125 56 156 128 53 
+161 124 50 157 126 52 156 124 53 156 126 54 159 126 56 161 124 50 159 126 56 157 124 59 
+156 126 54 155 126 57 158 124 54 158 126 53 147 124 59 155 128 52 161 124 50 158 124 56 
+155 127 54 158 124 56 155 127 54 158 125 54 156 125 56 155 128 52 128 113 57 58 62 65 
+57 63 61 104 112 110 253 255 254 254 255 255 254 254 254 254 254 253 250 247 249 71 72 69 
+57 63 61 57 63 61 110 92 61 157 126 52 162 124 55 156 124 53 157 126 52 157 127 54 
+148 128 46 159 126 56 157 124 59 150 128 52 155 127 54 161 124 50 158 125 54 155 126 57 
+161 124 50 157 126 52 158 126 53 158 127 55 158 127 55 158 127 55 156 125 56 156 125 56 
+162 124 55 158 126 53 155 128 52 156 124 53 156 126 54 157 124 59 154 129 46 159 126 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 126 54 158 126 53 72 76 65 58 62 63 57 63 63 202 206 211 255 253 254 156 160 157 
+58 62 63 58 64 64 101 91 62 155 126 57 158 125 54 156 126 54 156 124 53 156 126 54 
+158 125 54 156 126 54 156 125 56 155 127 54 128 113 57 58 62 65 58 62 65 104 112 110 
+255 254 255 253 253 255 249 254 246 254 250 255 255 255 255 187 189 188 66 60 61 50 65 64 
+56 66 64 101 91 62 157 124 59 159 126 56 156 125 56 158 127 55 157 126 52 157 124 59 
+156 124 53 161 125 43 161 125 43 157 124 59 157 124 59 154 129 46 159 126 56 162 124 55 
+161 124 50 158 126 53 156 124 53 156 125 56 155 126 57 158 127 55 159 126 56 158 125 54 
+158 125 54 158 126 53 155 128 52 155 128 52 157 126 52 158 127 55 156 124 53 162 125 53 
+157 124 59 158 132 49 158 124 54 159 126 56 156 128 53 154 129 46 128 113 57 54 64 59 
+53 63 60 60 64 65 230 230 230 254 254 254 255 255 255 59 64 62 58 62 63 58 64 64 
+211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+213 100 46 207 105 48 210 105 40 142 101 66 213 100 46 208 103 45 210 102 46 208 103 45 
+213 100 46 210 102 46 213 105 50 209 99 39 210 105 40 209 105 45 209 105 45 213 103 41 
+211 102 45 213 100 52 200 101 40 210 102 46 213 100 46 209 99 39 212 101 45 207 105 38 
+208 103 45 212 101 45 208 103 45 217 98 38 210 99 51 213 105 50 198 102 49 62 66 62 
+56 64 62 56 66 64 110 110 107 255 255 255 254 255 251 251 251 251 255 254 255 248 254 252 
+255 255 255 248 254 253 254 254 254 254 255 251 88 95 83 62 61 67 54 64 59 84 69 58 
+198 102 49 213 100 52 211 102 45 208 103 45 213 105 50 211 99 45 212 104 43 207 105 48 
+208 103 45 210 102 46 212 104 43 213 100 46 208 103 45 210 105 51 213 100 46 209 99 39 
+211 99 45 213 103 41 208 103 45 211 102 45 216 99 44 213 100 46 213 105 50 208 103 45 
+210 99 51 213 100 46 207 105 38 213 100 46 211 102 45 210 105 51 208 103 45 217 104 40 
+212 98 39 112 79 60 59 64 62 59 60 64 53 60 64 202 204 206 255 254 255 253 255 254 
+254 254 255 255 254 255 104 112 110 57 63 61 58 64 64 155 104 59 210 102 46 211 102 45 
+208 103 45 212 101 45 211 102 45 212 101 45 211 102 45 211 102 45 212 101 45 112 79 60 
+56 66 64 57 63 63 156 160 157 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 58 62 65 57 63 63 112 79 60 212 101 45 208 103 45 212 101 45 210 102 46 
+212 101 45 208 103 45 212 101 45 211 102 45 211 102 45 112 79 60 58 62 65 57 63 61 
+154 157 157 253 255 254 253 253 255 254 250 255 250 250 247 253 255 254 202 206 211 57 63 61 
+57 60 56 60 60 63 112 79 60 213 103 41 211 102 45 208 103 45 210 102 46 210 102 46 
+211 104 39 213 105 46 208 103 45 211 99 45 209 105 45 207 105 48 210 99 44 217 105 50 
+216 99 44 217 105 50 210 99 44 213 100 46 212 101 45 211 99 45 213 105 50 210 99 44 
+210 99 44 209 105 45 209 99 39 212 104 43 217 105 50 213 100 46 213 100 46 213 105 46 
+208 103 45 212 104 43 219 98 50 211 99 45 207 105 48 219 98 50 213 100 46 198 102 49 
+59 59 56 57 63 61 56 66 64 219 227 224 255 254 255 
+255 255 255 255 255 255 253 253 253 254 254 254 241 240 247 48 49 51 0 0 0 0 0 0 
+0 1 1 4 1 5 21 19 24 142 120 69 165 143 59 173 138 52 173 142 59 169 141 58 
+166 144 56 169 144 61 169 141 58 169 141 58 157 127 54 147 124 59 147 124 59 149 124 55 
+147 124 59 147 124 59 149 124 55 149 124 53 155 126 57 159 126 56 166 134 56 169 141 58 
+166 144 56 169 144 61 169 141 58 173 142 59 169 141 58 168 136 64 110 92 61 4 1 5 
+84 69 58 165 143 59 166 144 56 168 136 64 21 19 24 145 151 154 255 255 255 253 255 254 
+241 240 247 213 212 223 219 227 224 224 220 212 224 220 212 219 227 224 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 
+254 252 251 255 254 255 251 251 251 254 255 251 253 253 255 241 240 247 187 189 188 160 163 161 
+88 95 83 0 0 0 4 2 1 0 1 1 0 0 0 71 72 69 71 72 69 71 72 69 
+110 110 107 145 151 154 145 151 154 113 113 120 81 77 81 0 0 0 0 1 1 0 0 0 
+97 100 105 219 227 224 255 255 255 253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 255 254 255 251 253 255 254 253 253 255 154 157 157 57 60 70 57 63 61 101 91 62 
+162 124 55 161 124 50 157 126 52 156 124 53 156 124 53 155 128 52 155 128 52 157 124 59 
+161 124 50 152 127 56 62 61 67 113 104 59 162 125 53 152 127 56 157 124 59 162 125 53 
+158 125 54 156 126 54 156 128 53 155 128 52 156 128 53 156 124 53 158 127 55 162 125 53 
+159 126 56 152 124 51 158 127 55 158 127 55 158 125 54 158 124 53 159 126 56 157 126 52 
+157 124 59 156 124 53 158 127 55 155 128 52 155 126 57 110 92 61 57 63 61 56 66 64 
+59 64 62 178 172 162 253 253 253 255 255 255 253 253 253 252 252 252 255 255 255 255 255 255 
+254 255 251 255 254 255 255 254 255 97 100 105 54 67 66 57 60 70 71 65 56 128 113 57 
+155 128 52 156 126 54 158 127 55 152 124 51 155 128 52 156 126 54 158 127 55 156 125 56 
+156 126 54 156 124 53 155 127 54 155 127 54 155 126 57 155 127 54 155 128 52 155 128 52 
+155 128 52 155 127 54 155 126 57 155 126 57 155 127 54 155 128 52 155 128 52 155 128 52 
+158 126 53 158 125 54 157 127 54 157 126 52 161 124 50 161 124 50 157 126 52 157 124 59 
+162 124 55 155 127 54 128 113 57 66 60 61 58 65 69 56 64 62 125 131 132 254 250 255 
+254 254 254 255 255 255 254 254 254 253 253 253 202 204 206 58 64 64 53 63 60 56 66 64 
+97 78 60 152 127 56 156 129 45 158 124 53 156 124 53 155 128 52 159 126 56 162 124 52 
+156 124 53 156 125 56 157 124 59 155 126 57 155 127 54 155 127 54 155 127 54 155 127 54 
+158 125 54 156 126 54 157 127 54 155 126 57 155 126 57 155 126 57 159 126 56 161 124 50 
+152 127 56 158 125 54 156 128 53 128 113 57 85 80 60 161 124 50 159 126 56 155 126 57 
+155 128 52 155 128 52 158 124 56 159 126 56 156 126 54 158 126 53 128 113 57 60 64 65 
+62 65 65 110 110 107 253 253 253 255 254 255 254 254 254 253 253 253 253 255 254 156 160 157 
+60 60 63 58 65 69 62 66 56 128 113 57 157 124 59 159 126 56 157 126 52 156 125 56 
+156 126 54 158 127 55 156 124 53 157 127 54 158 127 55 152 124 51 156 125 56 157 124 59 
+158 127 55 157 126 52 158 127 55 158 125 54 158 127 55 156 124 53 161 124 50 161 125 43 
+162 124 55 158 127 55 156 125 56 156 126 54 155 126 57 155 128 52 158 125 54 156 124 53 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 56 158 127 55 72 76 65 60 64 65 57 63 63 202 204 206 254 255 255 154 157 157 
+62 65 65 58 62 65 94 90 61 155 126 57 157 124 59 154 129 46 155 127 54 152 124 51 
+157 124 59 152 124 51 162 125 53 161 124 50 128 99 63 59 59 56 58 62 65 104 112 110 
+255 255 255 255 255 255 255 255 255 254 254 254 253 253 253 254 255 255 125 131 132 59 64 62 
+54 67 66 62 66 56 113 104 59 155 126 57 158 124 54 159 126 56 158 125 54 156 124 53 
+155 126 57 158 124 56 162 124 55 159 126 56 157 127 54 155 128 52 155 128 52 155 127 54 
+156 126 54 156 126 54 158 127 55 158 126 53 158 127 55 156 126 54 156 126 54 158 127 55 
+155 128 52 157 127 54 157 126 52 158 126 53 157 126 52 158 126 53 158 125 54 158 124 56 
+158 127 55 156 124 53 159 126 56 157 126 52 156 125 56 147 124 59 72 73 56 51 61 71 
+62 65 65 110 110 107 254 255 255 253 253 253 254 255 255 59 64 62 58 62 63 60 64 65 
+211 102 45 208 103 45 219 98 50 216 99 44 209 105 45 209 105 45 208 103 45 210 105 40 
+211 104 39 213 100 52 174 105 47 62 70 65 198 102 49 209 105 45 210 102 46 213 100 46 
+208 103 45 212 101 45 217 98 38 217 98 38 213 105 46 207 99 48 210 102 46 213 103 41 
+210 102 46 212 101 45 213 105 46 212 101 45 210 102 46 210 102 46 213 105 50 210 102 46 
+208 103 45 217 104 40 210 99 44 210 105 51 217 98 38 207 99 48 84 69 58 56 66 64 
+60 64 65 68 69 75 230 230 230 255 255 255 255 255 255 252 252 252 255 255 255 254 254 254 
+254 254 254 255 255 255 253 253 253 255 255 255 213 212 223 58 62 63 56 66 64 53 63 60 
+97 78 60 213 100 52 217 98 38 209 105 45 210 102 46 207 99 38 213 105 46 210 99 44 
+213 100 52 211 99 45 210 102 46 208 103 45 210 102 46 208 103 45 208 103 45 208 103 45 
+210 102 46 211 102 45 211 99 45 212 101 45 210 102 46 208 103 45 210 99 44 213 103 41 
+210 102 46 210 102 46 210 105 51 208 103 45 211 102 45 219 98 50 210 99 44 213 103 41 
+142 101 66 68 58 52 50 65 64 58 65 69 154 157 157 248 254 252 249 254 246 255 253 254 
+253 252 247 249 254 254 110 110 107 56 66 64 66 60 61 155 104 59 212 104 43 208 103 45 
+211 104 39 210 105 51 213 100 52 210 105 40 216 99 44 213 100 46 213 100 46 128 93 57 
+58 62 65 58 62 63 156 160 157 255 255 255 253 253 253 255 255 255 254 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+156 160 157 59 60 64 53 67 71 128 93 57 209 105 45 208 103 45 212 104 43 216 99 44 
+217 104 40 213 100 52 207 99 48 210 105 40 213 103 41 112 79 60 58 66 61 59 64 62 
+156 160 157 253 253 253 253 255 254 254 254 254 255 255 255 255 255 255 255 255 255 140 141 138 
+60 60 63 54 67 66 58 65 54 142 101 66 213 100 52 212 98 39 207 105 38 208 103 45 
+208 103 45 211 102 45 212 101 45 213 105 50 207 99 38 212 104 43 212 104 43 211 102 45 
+213 100 46 211 99 45 210 102 46 208 103 45 208 103 45 211 99 45 213 100 46 216 99 44 
+210 102 46 213 100 46 211 99 45 208 103 45 211 102 45 213 100 46 213 105 50 208 103 45 
+210 105 51 210 99 44 216 99 44 212 101 45 211 99 45 217 104 40 198 102 49 84 69 58 
+57 63 63 58 64 64 81 77 81 254 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 242 238 229 48 49 51 0 0 0 
+4 1 5 0 0 0 0 1 1 4 1 5 102 79 82 142 120 69 165 143 59 169 141 58 
+169 141 58 168 136 64 169 144 61 164 144 50 169 141 58 169 144 61 159 134 56 158 134 59 
+155 126 57 168 136 64 168 136 64 169 144 61 169 141 58 169 141 58 166 144 56 166 144 56 
+173 142 59 164 144 50 166 144 56 166 144 56 142 120 69 72 76 65 0 3 1 81 77 81 
+165 143 59 165 143 59 173 142 59 166 144 56 109 102 83 48 49 51 219 227 224 255 254 255 
+252 252 252 230 230 230 213 212 223 213 212 223 213 212 223 219 227 224 241 240 247 255 255 255 
+253 253 253 255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 252 252 252 254 254 254 
+253 252 247 253 255 254 254 255 255 249 254 246 230 230 230 219 227 224 219 227 224 254 254 253 
+254 254 255 230 230 230 160 163 161 4 2 1 4 2 1 6 9 5 0 0 0 4 1 5 
+0 1 1 0 1 1 0 1 1 0 0 0 0 0 0 81 77 81 154 157 157 241 240 247 
+253 253 253 255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 251 248 251 253 255 255 255 156 160 157 53 60 64 59 64 62 101 91 62 
+156 126 54 158 127 55 159 126 56 158 124 54 158 124 56 166 129 59 156 124 53 161 125 43 
+152 127 56 147 124 59 59 59 56 68 69 75 147 124 59 158 126 53 156 128 53 152 124 51 
+156 126 54 158 127 55 156 124 53 159 126 56 158 124 54 156 126 54 156 126 54 155 127 54 
+161 124 50 159 126 56 155 126 57 155 126 57 150 126 55 155 126 57 155 126 57 155 126 57 
+161 124 50 158 134 59 152 124 51 158 132 49 113 104 59 59 64 62 62 65 65 57 60 56 
+125 131 132 253 255 254 254 255 255 254 254 254 252 252 252 255 255 255 255 255 255 253 253 253 
+254 255 251 253 253 255 255 254 255 230 230 230 62 70 65 58 65 69 59 60 62 68 58 52 
+140 101 45 152 127 56 152 124 51 158 127 55 156 124 53 155 126 57 155 126 57 158 127 55 
+157 126 52 158 126 53 158 127 55 159 126 56 158 124 56 158 124 54 158 124 54 158 125 54 
+159 126 56 159 126 56 158 124 54 158 124 56 156 124 53 159 126 56 158 124 56 157 124 59 
+157 124 59 158 124 53 162 124 55 157 124 59 156 128 53 155 126 57 155 126 57 156 124 53 
+155 128 52 128 113 57 62 66 62 58 65 69 59 60 64 68 69 75 242 238 229 253 255 254 
+255 255 255 251 251 251 255 255 255 252 252 252 253 255 254 140 141 138 58 64 64 60 64 65 
+54 64 59 110 92 61 152 124 51 162 125 53 157 124 59 155 126 57 154 129 46 158 127 55 
+159 126 56 158 126 53 157 126 52 157 126 52 158 125 54 158 124 56 158 125 54 158 124 53 
+157 127 54 155 128 52 155 128 52 158 126 53 158 126 53 157 126 52 157 126 52 158 126 53 
+159 126 56 162 124 55 128 113 57 58 65 54 62 66 62 157 124 59 158 125 54 156 129 45 
+162 124 55 155 128 52 156 128 53 152 127 56 157 124 59 159 126 56 128 113 57 50 65 62 
+53 63 60 110 110 107 255 255 255 255 253 254 252 252 252 254 254 254 254 255 255 254 254 254 
+97 100 105 58 59 64 57 60 56 71 72 69 147 124 59 161 125 43 159 126 56 158 127 55 
+157 124 59 157 124 59 155 126 57 156 126 54 156 124 53 159 126 56 158 127 55 152 124 44 
+152 124 44 155 128 52 157 127 54 155 128 52 155 128 52 155 127 54 159 126 56 157 124 59 
+156 124 53 158 124 54 157 126 52 158 125 54 157 124 59 101 91 62 72 76 65 84 69 58 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 157 127 54 72 76 65 58 62 63 60 64 65 202 204 206 251 251 251 156 160 157 
+58 64 64 54 64 59 101 91 62 158 124 56 161 124 50 158 124 56 157 124 59 159 126 56 
+152 124 44 158 125 54 158 124 53 157 124 59 128 113 57 58 62 63 54 67 66 110 110 107 
+255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 249 252 251 241 240 247 97 100 105 
+62 61 67 57 63 61 62 61 67 110 92 61 159 134 56 158 126 53 152 124 44 159 126 56 
+157 126 52 155 128 52 154 129 46 155 128 52 158 124 56 157 124 59 162 124 55 161 124 50 
+158 127 55 156 126 54 156 126 54 152 124 51 156 124 53 152 124 51 156 126 54 156 126 54 
+155 126 57 157 124 59 157 124 59 157 124 59 159 126 56 156 124 53 155 128 52 152 124 51 
+157 124 59 158 125 54 161 124 50 159 126 56 147 124 59 71 68 65 57 63 61 58 62 65 
+59 64 62 202 206 211 253 253 253 253 253 253 254 255 255 57 58 61 62 65 65 57 63 63 
+198 102 49 207 105 48 208 103 45 216 99 44 208 103 45 217 105 50 212 98 39 213 100 52 
+210 99 51 212 98 39 128 93 57 62 61 67 97 78 60 217 104 40 209 105 45 208 103 45 
+213 100 46 212 101 45 209 105 45 207 105 48 208 103 45 211 104 39 217 104 40 210 99 44 
+213 105 46 208 103 45 209 99 39 211 104 39 212 104 43 209 99 39 213 103 41 217 105 50 
+217 105 50 207 99 38 212 104 43 207 99 38 211 102 45 112 79 60 59 60 62 57 63 63 
+60 64 65 187 189 188 253 253 255 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+253 253 253 255 255 255 251 251 251 252 252 252 254 255 255 172 178 183 57 63 61 62 65 65 
+53 64 53 97 78 60 217 104 40 212 98 39 209 105 45 213 100 46 211 99 45 213 105 50 
+208 103 45 212 104 43 212 104 43 217 105 50 213 100 46 213 100 46 213 103 41 213 103 41 
+208 103 45 211 102 45 210 102 46 211 99 45 212 101 45 212 104 43 212 101 45 211 99 45 
+210 102 46 216 99 44 208 103 45 210 105 51 217 105 50 212 98 39 209 105 45 128 93 57 
+68 58 52 58 66 61 53 60 64 110 110 107 255 254 255 254 255 251 253 255 254 255 253 254 
+253 253 253 254 254 255 110 110 107 54 67 66 58 65 69 174 105 47 213 103 41 207 105 48 
+211 99 45 212 104 43 207 99 38 213 105 50 213 100 52 211 104 39 198 102 49 112 79 60 
+58 64 64 60 64 65 154 157 157 255 255 255 252 252 252 253 253 253 255 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+152 161 158 62 65 65 60 64 65 112 79 60 217 105 50 208 103 45 210 102 46 216 99 44 
+209 105 45 210 99 51 217 104 40 213 105 50 211 102 45 128 99 63 58 65 69 53 60 64 
+156 160 157 254 255 255 253 255 254 251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 
+97 100 105 57 61 64 59 64 62 57 63 61 128 93 57 213 105 46 219 98 50 212 98 39 
+213 103 41 210 102 46 210 102 46 208 103 45 213 105 50 213 105 46 209 105 45 213 100 46 
+208 103 45 208 103 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 211 102 45 
+208 103 45 208 103 45 208 103 45 213 100 46 213 100 46 211 99 45 213 103 41 211 104 39 
+211 104 39 213 105 50 209 105 45 207 99 48 212 104 43 198 102 49 72 76 65 60 64 65 
+57 63 63 58 62 63 202 204 206 255 255 255 253 253 253 
+255 255 255 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 241 240 247 48 49 51 
+0 0 0 4 1 5 4 1 5 0 3 1 0 3 1 0 0 0 94 90 61 142 120 69 
+166 144 56 169 144 61 169 141 58 166 144 56 173 142 59 166 134 56 169 141 58 169 141 58 
+169 141 58 169 141 58 169 141 58 166 144 56 166 144 56 169 141 58 169 141 58 169 144 61 
+173 138 52 173 138 52 148 133 63 109 102 83 0 1 1 4 2 1 109 102 83 165 143 59 
+169 138 59 166 144 56 173 142 59 169 141 58 168 136 64 21 19 24 125 131 132 253 253 255 
+255 255 255 250 247 249 219 227 224 224 220 212 224 220 212 224 220 212 230 230 230 255 255 255 
+255 255 255 254 254 254 254 254 254 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 
+254 255 255 250 252 254 230 230 230 224 220 212 219 227 224 241 240 247 254 250 255 254 252 250 
+241 240 247 145 151 154 21 19 24 0 0 0 4 2 1 0 0 0 6 9 5 0 0 0 
+48 49 51 81 77 81 125 131 132 187 189 188 255 255 255 253 253 253 252 252 252 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 252 252 252 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 252 247 253 255 254 252 252 252 156 160 157 58 65 69 57 63 63 94 90 61 
+157 124 59 152 124 44 158 126 53 155 126 57 155 128 52 154 129 46 157 126 52 162 124 55 
+155 126 57 110 92 61 57 63 61 54 64 59 101 91 62 155 128 52 158 125 54 157 127 54 
+162 124 55 162 124 55 158 124 53 159 126 56 158 127 55 158 127 55 155 126 57 155 126 57 
+156 124 53 156 128 53 155 128 52 156 128 53 158 126 53 158 126 53 157 126 52 159 134 56 
+156 129 45 161 124 50 158 126 53 113 104 59 58 62 63 56 66 64 57 60 56 97 100 105 
+241 240 247 254 255 255 253 253 253 255 255 255 253 253 253 254 254 254 253 253 253 255 255 255 
+253 252 247 255 255 255 255 253 254 254 255 251 224 220 212 71 72 69 57 61 64 58 65 69 
+62 65 65 113 104 59 158 127 55 152 124 44 166 129 59 158 124 54 152 124 51 158 127 55 
+157 124 59 156 125 56 155 128 52 155 128 52 155 127 54 158 127 55 158 124 56 158 124 56 
+152 124 51 155 128 52 155 128 52 156 128 53 152 124 51 156 124 53 155 128 52 156 128 53 
+161 125 43 155 127 54 152 127 56 155 128 52 156 124 53 152 127 56 155 126 57 161 124 50 
+113 104 59 62 66 56 58 62 65 54 67 66 60 64 65 187 189 188 248 254 252 249 254 246 
+254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 254 255 255 104 112 110 57 58 61 
+58 65 69 56 64 62 113 104 59 152 124 44 157 124 59 157 124 59 159 126 56 152 124 51 
+156 124 53 156 126 54 156 128 53 156 128 53 155 128 52 156 124 53 156 124 53 158 124 56 
+157 124 59 158 124 56 156 126 54 156 126 54 156 124 53 159 126 56 158 127 55 155 128 52 
+161 124 50 147 124 59 62 66 62 58 67 65 59 60 64 128 113 57 158 124 53 157 127 54 
+159 126 56 157 127 54 154 129 46 155 126 57 157 124 59 161 124 50 128 113 57 62 61 67 
+60 64 65 110 110 107 253 253 253 255 254 255 253 253 253 255 255 255 251 251 251 251 251 251 
+219 227 224 62 65 65 57 63 63 53 63 60 71 72 69 149 124 55 161 124 50 155 127 54 
+156 128 53 152 124 51 162 125 53 161 124 50 152 124 51 152 127 56 156 128 53 159 126 56 
+157 124 59 156 125 56 156 125 56 155 126 57 155 126 57 155 127 54 155 128 52 156 128 53 
+158 132 49 155 128 52 152 124 51 157 124 59 128 99 63 62 66 56 51 61 71 56 66 64 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+156 124 53 156 128 53 72 76 65 59 64 62 60 64 65 202 204 206 255 255 255 187 189 188 
+59 64 62 58 66 61 71 72 69 148 128 46 161 124 50 166 129 59 159 126 56 152 124 51 
+158 127 55 152 124 44 161 124 50 157 124 59 110 92 61 53 63 60 50 65 64 113 113 120 
+255 255 255 254 254 254 255 255 255 252 252 252 254 254 254 255 255 255 253 255 254 241 240 247 
+68 69 75 58 59 64 58 66 61 58 59 64 101 91 62 155 127 54 159 126 56 155 128 52 
+156 128 53 162 125 53 162 125 53 158 125 54 152 127 56 155 126 57 156 126 54 162 124 52 
+158 126 53 158 126 53 158 127 55 158 127 55 158 127 55 158 127 55 158 127 55 157 126 52 
+162 124 55 158 124 54 156 125 56 152 124 51 152 124 51 152 124 51 155 126 57 155 126 57 
+158 132 49 159 126 56 156 125 56 128 113 57 71 68 65 58 65 54 57 60 70 58 62 65 
+156 160 157 254 255 255 255 255 255 253 253 253 253 255 254 97 100 105 57 58 61 57 63 63 
+155 104 59 207 99 48 217 104 40 208 103 45 219 98 50 207 99 38 209 105 45 213 105 50 
+217 98 38 212 104 43 85 80 60 50 65 64 60 61 69 155 104 59 213 105 50 210 99 51 
+213 105 50 207 105 48 207 105 48 213 105 50 210 102 46 210 102 46 210 105 51 210 105 51 
+211 99 45 217 105 50 213 105 50 207 99 48 208 103 45 208 103 45 208 103 45 207 99 38 
+211 102 45 213 100 52 210 105 51 216 99 44 112 79 60 53 63 60 59 64 62 58 64 64 
+125 131 132 253 253 255 255 255 255 251 251 251 254 254 254 254 254 254 255 255 255 254 254 254 
+255 255 255 251 251 251 255 255 255 253 253 253 253 253 253 254 255 255 125 131 132 58 62 63 
+62 66 56 54 67 66 84 69 58 198 102 49 210 99 51 210 99 44 213 103 41 210 99 44 
+213 100 46 211 102 45 209 99 39 213 103 41 208 103 45 213 105 50 210 102 46 210 105 51 
+213 100 46 210 102 46 209 105 45 209 105 45 212 104 43 210 99 44 210 99 44 208 103 45 
+213 103 41 209 99 39 217 105 50 210 99 44 211 99 45 211 102 45 128 93 57 54 67 66 
+54 67 66 56 64 62 97 100 105 241 240 247 254 251 249 249 252 251 254 255 255 248 251 253 
+253 253 255 254 255 251 140 141 138 59 60 62 54 67 66 110 92 61 213 100 52 212 104 43 
+213 100 52 207 105 38 211 99 45 209 99 39 219 98 50 208 103 45 212 98 39 97 78 60 
+57 63 63 57 58 61 178 172 162 254 254 254 255 255 255 255 255 255 253 253 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+154 157 157 58 65 69 62 66 62 112 79 60 208 103 45 213 100 52 210 102 46 213 103 41 
+213 105 50 210 102 46 210 102 46 213 103 41 208 103 45 112 79 60 57 58 61 58 67 65 
+156 160 157 253 253 253 253 253 253 255 255 255 253 253 253 255 255 255 252 252 252 253 253 253 
+241 240 247 97 100 105 58 65 69 57 60 56 50 65 64 112 79 60 213 100 46 211 102 45 
+213 100 46 211 102 45 213 103 41 212 98 39 213 103 41 207 99 48 210 105 51 211 104 39 
+208 103 45 211 102 45 212 101 45 211 99 45 210 99 44 211 102 45 209 105 45 208 103 45 
+210 99 44 210 102 46 209 105 45 211 99 45 208 103 45 207 105 48 209 105 45 211 99 45 
+210 105 51 212 98 39 210 99 44 209 105 45 174 105 47 72 73 56 58 62 65 58 62 65 
+58 64 64 145 151 154 253 255 254 255 255 255 254 254 254 
+255 255 255 251 251 251 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 
+113 113 120 0 1 1 0 0 0 4 1 5 4 1 5 0 3 1 0 3 1 0 1 1 
+48 49 51 109 102 83 142 120 69 165 143 59 173 142 59 173 142 59 169 141 58 169 144 61 
+173 138 52 169 141 58 169 138 59 169 141 58 173 145 52 169 141 58 168 136 64 148 133 63 
+109 102 83 81 77 81 0 0 0 0 1 1 88 95 83 148 133 63 169 141 58 166 144 56 
+169 141 58 169 141 58 164 144 50 164 134 50 173 138 52 109 102 83 4 1 5 219 227 224 
+253 253 253 255 255 255 230 230 230 213 212 223 224 220 212 213 212 223 230 230 230 254 254 254 
+252 252 252 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 251 251 251 
+241 240 247 224 220 212 219 227 224 230 230 230 255 255 255 254 250 255 254 255 251 187 189 188 
+71 72 69 0 0 0 6 9 5 71 72 69 125 131 132 187 189 188 202 204 206 255 255 255 
+254 254 254 255 255 255 255 255 255 252 252 252 251 251 251 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 253 252 247 254 255 255 255 255 253 172 178 183 56 66 64 58 65 69 72 73 56 
+156 124 53 155 126 57 155 128 52 155 128 52 157 124 59 158 124 53 154 129 46 150 126 55 
+161 124 50 85 80 60 58 66 61 53 63 60 57 60 70 113 104 59 155 126 57 161 124 50 
+148 128 46 154 129 46 155 128 52 156 124 53 158 125 54 158 124 54 159 126 56 159 126 56 
+158 124 54 158 124 53 158 125 54 157 124 59 157 124 59 158 124 53 155 128 52 152 124 51 
+150 126 55 158 127 55 110 92 61 58 62 65 56 64 62 58 62 65 68 69 75 224 220 212 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 
+255 255 253 254 254 254 253 253 255 253 253 255 255 255 253 224 220 212 71 72 69 54 67 66 
+57 61 64 58 62 63 94 90 61 147 124 59 161 125 43 162 124 55 157 124 59 157 126 52 
+155 128 52 156 128 53 158 126 53 162 125 53 158 124 53 158 124 53 157 127 54 156 128 53 
+158 127 55 157 124 59 157 124 59 158 124 56 162 125 53 156 129 45 158 125 54 157 124 59 
+147 124 59 152 124 51 161 124 50 162 124 55 162 124 55 159 126 56 128 113 57 85 80 60 
+57 60 56 62 61 67 56 64 62 53 64 53 172 178 183 253 253 255 255 254 255 255 255 255 
+253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 251 251 251 241 240 247 97 100 105 
+57 63 61 59 60 64 58 62 65 94 90 61 155 128 52 162 124 52 157 124 59 156 128 53 
+156 128 53 156 126 54 158 124 53 162 124 55 162 124 55 157 124 59 156 126 54 155 128 52 
+156 128 53 152 124 51 158 124 53 159 126 56 159 134 56 156 128 53 156 124 53 158 124 54 
+149 124 53 72 73 56 62 70 69 53 60 64 62 65 65 97 78 60 155 127 54 158 126 53 
+156 124 53 161 124 50 161 125 43 158 124 54 152 124 51 155 126 57 110 92 61 58 62 65 
+57 58 61 125 131 132 255 255 255 254 251 252 252 252 252 253 253 253 255 255 255 255 255 255 
+253 253 255 172 178 183 58 62 65 59 64 62 53 64 53 81 77 81 142 120 69 155 126 57 
+157 127 54 152 124 51 155 127 54 155 126 57 155 126 57 158 127 55 157 126 52 156 124 53 
+156 124 53 158 125 54 159 126 56 159 126 56 156 124 53 159 126 56 159 126 56 157 124 59 
+157 124 59 155 126 57 152 127 56 128 113 57 71 68 65 58 59 68 62 65 65 54 64 59 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 125 54 155 127 54 72 76 65 59 64 62 60 64 65 202 204 206 250 247 249 213 212 223 
+60 61 69 53 63 60 66 60 61 151 135 55 156 124 53 158 125 54 152 124 51 158 132 49 
+152 124 51 157 124 59 159 126 56 155 126 57 97 78 60 60 64 65 56 64 62 154 157 157 
+254 254 254 255 255 255 253 253 253 252 252 252 255 255 255 252 252 252 253 253 253 254 254 254 
+224 220 212 71 72 69 56 66 64 57 63 61 62 61 67 84 69 58 128 113 57 157 124 59 
+155 126 57 156 125 56 156 124 53 157 126 52 157 126 52 157 126 52 155 127 54 155 128 52 
+162 125 53 158 124 53 158 125 54 158 124 56 158 124 54 158 125 54 159 126 56 158 125 54 
+158 126 53 158 127 55 156 124 53 158 127 55 157 126 52 158 126 53 157 126 52 152 124 51 
+155 127 54 147 124 59 101 91 62 57 60 56 56 66 64 58 64 64 59 64 62 125 131 132 
+255 255 255 255 255 255 254 254 254 255 255 255 254 255 255 113 113 120 58 62 63 60 64 65 
+128 93 57 213 105 50 211 104 39 198 102 49 208 103 45 207 105 38 213 105 50 209 99 39 
+210 102 46 198 102 49 54 64 59 57 63 61 54 64 59 68 69 75 174 105 47 217 104 40 
+209 99 39 213 105 46 212 101 45 216 99 44 211 99 45 210 102 46 211 102 45 213 103 41 
+208 103 45 211 102 45 212 101 45 212 104 43 212 104 43 216 99 44 213 100 46 210 105 51 
+210 99 44 208 103 45 200 101 40 84 69 58 59 60 64 58 65 69 53 60 64 113 113 120 
+255 255 255 252 252 252 254 254 254 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 253 255 254 125 131 132 
+62 61 67 59 60 64 57 60 56 71 68 65 174 105 47 213 105 46 211 99 45 209 105 45 
+208 103 45 209 105 45 213 105 50 208 103 45 210 102 46 210 99 44 212 101 45 212 98 39 
+210 105 40 210 105 40 211 99 45 211 99 45 213 100 46 213 105 50 210 102 46 210 102 46 
+211 99 45 210 105 51 200 101 40 217 104 40 200 101 40 97 78 60 58 62 63 62 61 67 
+58 65 69 97 100 105 241 240 247 254 254 253 253 255 254 253 255 254 253 253 255 255 254 255 
+249 254 246 249 254 254 156 160 157 60 60 63 60 64 65 97 78 60 210 102 46 207 99 48 
+213 103 41 207 105 38 213 100 52 207 105 48 210 102 46 213 103 41 217 105 50 62 66 62 
+60 64 65 58 62 63 202 204 206 252 252 252 252 252 252 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+187 189 188 57 60 56 59 60 62 71 68 65 207 105 38 213 100 46 210 105 51 210 102 46 
+210 99 44 217 104 40 209 99 39 207 105 38 213 103 41 71 72 69 62 61 67 54 64 59 
+187 189 188 255 255 255 254 254 254 253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 
+255 253 254 241 240 247 97 100 105 59 60 70 60 60 63 62 66 56 84 69 58 185 105 60 
+208 103 45 213 105 50 217 98 38 217 104 40 208 103 45 210 105 51 212 104 43 213 100 46 
+212 104 43 211 102 45 211 102 45 210 102 46 210 102 46 208 103 45 208 103 45 208 103 45 
+212 104 43 211 102 45 210 102 46 213 105 50 210 102 46 208 103 45 208 103 45 213 100 52 
+212 98 39 217 105 50 198 102 49 128 93 57 57 58 61 58 62 65 62 65 65 53 63 60 
+125 131 132 252 252 252 255 255 255 254 254 254 255 255 255 
+254 254 254 255 255 255 255 255 255 252 252 252 253 253 253 253 253 253 251 251 251 255 255 255 
+255 255 253 172 178 183 48 49 51 0 1 1 0 1 1 4 2 1 0 3 1 0 3 1 
+4 2 1 4 1 5 4 1 5 4 2 1 81 77 81 109 102 83 109 102 83 109 102 83 
+109 102 83 109 102 83 109 102 83 94 90 61 81 77 81 71 68 65 0 0 0 0 0 0 
+0 3 1 21 19 24 109 102 83 148 133 63 169 141 58 169 141 58 166 144 56 169 144 61 
+164 144 50 168 136 64 169 144 61 169 141 58 166 144 56 168 136 64 21 19 24 125 131 132 
+253 253 253 255 255 255 241 240 247 224 220 212 224 220 212 213 212 223 219 227 224 254 254 254 
+255 255 255 254 254 254 251 251 251 255 255 255 255 255 255 253 253 253 230 230 230 219 227 224 
+224 220 212 224 220 212 250 247 249 249 254 254 253 255 254 230 230 230 88 95 83 0 1 1 
+4 2 1 113 113 120 230 230 230 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 
+254 254 254 253 253 253 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 251 251 251 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 249 252 251 253 255 254 254 254 254 230 230 230 53 60 64 57 58 63 57 63 61 
+128 99 63 155 126 57 157 126 52 159 126 56 159 126 56 152 124 44 158 127 55 158 124 56 
+147 124 59 53 60 64 58 65 69 62 65 65 54 64 59 62 61 67 110 92 61 152 127 56 
+159 126 56 158 127 55 155 126 57 152 127 56 155 126 57 155 127 54 158 127 55 156 124 53 
+155 128 52 152 124 51 156 128 53 154 129 46 155 128 52 157 124 59 158 134 59 155 128 52 
+142 120 69 85 80 60 59 64 62 59 60 64 58 62 65 62 70 69 213 212 223 254 255 251 
+255 255 255 252 252 252 252 252 252 252 252 252 253 253 253 255 255 255 252 252 252 255 255 255 
+255 253 254 254 254 253 254 255 255 254 255 255 254 254 255 254 252 251 224 220 212 71 72 69 
+57 63 61 57 60 56 62 61 67 71 72 69 110 92 61 151 135 55 152 124 44 159 126 56 
+158 124 56 158 124 56 156 126 54 156 126 54 156 126 54 158 127 55 156 126 54 156 124 53 
+152 124 51 152 124 51 156 125 56 158 124 56 159 126 56 158 124 54 158 126 53 158 126 53 
+158 124 53 159 126 56 158 124 53 161 124 50 142 120 69 94 90 61 59 60 70 62 65 65 
+58 65 69 62 66 62 68 69 75 202 204 206 254 255 255 253 255 254 255 255 253 254 252 251 
+255 255 255 252 252 252 255 255 255 251 251 251 254 254 254 255 255 255 255 255 255 241 240 247 
+97 100 105 59 64 62 59 60 70 62 61 67 72 73 56 128 113 57 158 127 55 156 124 53 
+158 126 53 157 124 59 157 124 59 156 125 56 156 124 53 155 128 52 156 126 54 156 125 56 
+152 124 51 155 126 57 157 124 59 158 124 56 158 124 53 159 126 56 147 124 59 128 113 57 
+62 65 65 60 60 63 59 64 62 57 60 56 59 64 62 62 65 65 158 125 54 155 126 57 
+157 124 59 152 124 51 158 134 59 155 126 57 161 125 43 157 124 59 84 69 58 54 67 66 
+59 64 62 160 163 161 251 251 251 254 254 254 255 255 255 254 254 254 253 253 253 253 253 253 
+254 255 251 254 254 255 145 151 154 57 63 61 62 61 67 56 64 62 66 60 61 113 104 59 
+155 128 52 158 134 59 157 124 59 161 124 50 158 126 53 158 124 56 157 124 59 158 127 55 
+155 128 52 154 129 46 152 124 44 156 128 53 156 125 56 159 126 56 155 128 52 152 124 44 
+162 124 55 158 127 55 113 104 59 62 66 62 59 59 56 57 63 63 56 66 64 58 62 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 155 127 54 72 76 65 58 62 63 57 63 63 202 204 206 255 254 255 254 255 255 
+68 69 75 58 66 61 59 60 64 109 102 83 155 128 52 159 126 56 156 125 56 152 124 51 
+157 124 59 158 127 55 155 127 54 149 124 53 69 60 69 56 66 64 53 60 64 219 227 224 
+255 255 255 255 255 255 252 252 252 255 255 255 251 251 251 255 255 255 255 255 255 254 254 254 
+254 255 251 241 240 247 88 95 83 58 66 61 53 63 60 58 62 65 71 68 65 101 91 62 
+155 128 52 156 128 53 155 126 57 155 126 57 156 125 56 156 125 56 159 126 56 158 127 55 
+157 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 155 127 54 
+156 124 53 157 127 54 158 126 53 158 127 55 152 124 51 156 125 56 149 124 55 157 124 59 
+110 92 61 71 68 65 56 64 62 58 65 69 59 64 62 58 62 65 178 172 162 254 255 251 
+251 251 251 254 254 254 255 255 255 255 255 255 252 252 252 172 178 183 58 62 63 57 63 63 
+71 65 56 198 102 49 213 103 41 210 102 46 217 105 50 207 99 48 212 104 43 212 98 39 
+211 102 45 112 79 60 59 64 62 53 63 60 58 66 61 60 60 63 62 66 62 174 105 47 
+213 100 46 213 105 50 208 103 45 208 103 45 211 104 39 212 104 43 209 99 39 211 102 45 
+217 104 40 207 105 38 208 103 45 212 101 45 212 98 39 208 103 45 209 105 45 210 99 44 
+213 103 41 155 104 59 62 66 62 57 63 61 56 66 64 62 65 65 113 113 120 241 240 247 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 253 253 253 254 254 254 
+255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 255 255 255 
+125 131 132 53 64 53 58 65 69 53 63 60 58 67 65 128 93 57 210 99 51 198 102 49 
+211 99 45 213 100 46 213 100 46 211 99 45 210 102 46 208 103 45 210 105 51 208 103 45 
+213 100 52 211 99 45 213 103 41 212 104 43 212 101 45 210 99 44 209 99 39 211 104 39 
+213 105 46 213 103 41 200 101 40 155 104 59 68 69 75 62 65 65 58 62 63 58 65 54 
+97 100 105 250 247 249 255 255 253 248 254 252 248 251 253 250 252 254 255 255 255 251 251 251 
+255 254 255 248 254 252 219 227 224 62 61 67 53 64 53 59 64 62 198 102 49 213 100 46 
+211 102 45 211 102 45 207 105 38 208 103 45 211 99 45 213 105 46 128 93 57 58 62 65 
+58 62 63 68 69 75 254 255 255 251 251 251 255 255 255 254 254 254 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+241 240 247 53 63 60 59 60 70 60 64 65 174 105 47 213 105 46 210 99 44 213 100 46 
+212 104 43 208 103 45 207 105 48 217 105 50 155 104 59 58 59 68 66 60 61 57 63 61 
+230 230 230 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 251 251 251 254 254 254 
+254 255 255 254 251 249 250 247 249 97 100 105 58 62 63 58 62 63 62 66 56 62 66 56 
+128 93 57 185 105 60 212 101 45 210 99 44 211 99 45 217 104 40 209 99 39 217 105 50 
+213 100 46 213 100 46 213 100 46 213 105 46 212 101 45 212 101 45 213 100 46 213 100 46 
+213 100 46 213 100 46 212 104 43 209 105 45 213 100 46 213 100 46 213 103 41 210 105 40 
+198 102 49 112 79 60 62 70 69 58 59 68 62 61 67 60 60 63 50 65 64 152 161 158 
+255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 
+255 255 255 255 255 255 252 252 252 252 252 252 255 255 255 253 253 253 255 255 255 253 253 253 
+250 247 249 254 255 251 230 230 230 125 131 132 21 19 24 4 1 5 4 1 5 4 1 5 
+0 3 1 0 3 1 0 3 1 0 1 1 4 1 5 0 3 1 0 3 1 0 3 1 
+4 1 5 0 1 1 4 2 1 4 1 5 4 1 5 48 49 51 88 95 83 109 102 83 
+142 120 69 166 144 56 166 144 56 166 134 56 173 138 52 173 142 59 169 141 58 173 138 52 
+169 141 58 169 138 59 166 134 56 168 136 64 173 145 52 169 138 59 128 100 96 4 1 5 
+230 230 230 255 255 255 254 254 254 219 227 224 224 220 212 224 220 212 219 227 224 255 255 255 
+254 254 254 252 252 252 255 255 255 254 254 254 241 240 247 219 227 224 224 220 212 213 212 223 
+230 230 230 254 250 255 249 254 246 249 254 254 145 151 154 21 19 24 6 9 5 6 9 5 
+0 0 0 172 178 183 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 252 252 252 
+255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 
+252 252 252 255 255 255 255 255 255 251 251 251 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 253 255 254 253 253 255 255 254 255 254 255 255 125 131 132 59 60 64 58 64 64 
+71 65 56 142 120 69 158 132 49 152 124 51 159 126 56 156 126 54 156 125 56 149 124 53 
+72 76 65 56 64 62 58 59 64 59 64 62 60 64 65 58 62 65 62 66 62 85 80 60 
+149 124 55 149 124 55 156 124 53 158 126 53 161 124 50 161 124 50 158 125 54 158 125 54 
+157 124 59 155 126 57 158 127 55 162 124 55 152 124 51 159 134 56 142 120 69 110 92 61 
+66 60 61 57 63 61 58 65 69 57 63 61 97 100 105 230 230 230 254 255 251 253 252 247 
+255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 251 251 251 255 255 255 
+255 253 254 254 255 251 253 252 247 254 255 251 253 255 254 255 255 255 254 251 252 241 240 247 
+104 112 110 62 61 67 60 64 65 60 60 63 57 58 61 71 68 65 110 92 61 147 124 59 
+155 128 52 156 128 53 156 128 53 155 127 54 155 126 57 156 125 56 158 125 54 158 124 53 
+158 127 55 158 127 55 156 129 45 157 126 52 156 124 53 157 124 59 158 127 55 155 126 57 
+155 128 52 149 124 53 113 104 59 72 76 65 56 66 64 54 64 59 57 63 61 58 62 65 
+62 66 62 113 113 120 250 247 249 253 253 255 250 250 247 254 251 249 254 255 255 254 255 251 
+255 255 255 254 254 254 252 252 252 255 255 255 254 254 254 255 255 255 255 255 255 252 252 252 
+241 240 247 110 110 107 58 64 64 58 62 65 62 66 56 58 65 69 85 80 60 142 120 69 
+156 129 45 155 128 52 155 127 54 155 127 54 155 127 54 156 128 53 161 124 50 161 124 50 
+161 124 50 162 124 55 158 124 53 161 125 43 156 129 45 147 124 59 101 91 62 58 59 64 
+57 60 70 56 66 64 62 61 67 72 76 65 58 65 69 57 63 61 101 91 62 158 127 55 
+156 128 53 156 129 45 152 124 51 156 125 56 158 127 55 128 99 63 66 60 61 53 63 60 
+59 64 62 219 227 224 253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 255 253 254 
+254 252 251 255 255 253 254 255 251 160 163 161 59 60 70 57 63 61 57 60 56 62 61 67 
+85 80 60 128 113 57 157 127 54 161 124 50 161 124 50 157 126 52 155 128 52 156 124 53 
+157 124 59 159 126 56 156 126 54 158 125 54 158 124 54 159 126 56 157 124 59 155 126 57 
+149 124 53 97 78 60 58 62 65 62 65 65 59 59 56 58 65 69 62 70 69 59 59 56 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+159 126 56 155 128 52 72 76 65 57 63 63 58 65 69 202 204 206 251 251 251 253 255 254 
+154 157 157 60 64 65 58 62 65 62 66 56 128 113 57 155 127 54 156 124 53 166 129 59 
+162 125 53 152 124 51 147 124 59 84 69 58 57 61 64 50 65 64 88 95 83 254 251 252 
+255 255 255 254 254 254 255 255 255 252 252 252 254 254 254 254 254 254 253 253 253 255 255 255 
+249 254 254 254 255 251 250 247 249 125 131 132 56 66 64 57 63 61 62 61 67 57 60 56 
+71 68 65 110 92 61 147 124 59 161 124 50 161 125 43 157 126 52 158 124 56 158 124 56 
+156 124 53 156 126 54 157 126 52 158 127 55 158 127 55 158 127 55 156 124 53 158 127 55 
+155 126 57 156 126 54 158 126 53 159 126 56 157 124 59 128 99 63 85 80 60 57 60 56 
+57 60 70 54 64 59 56 64 62 60 64 65 97 100 105 224 220 212 254 255 255 254 252 251 
+255 255 255 251 251 251 252 252 252 255 255 255 254 254 254 241 240 247 71 81 83 60 64 65 
+57 60 70 97 78 60 213 105 46 212 98 39 211 99 45 217 104 40 207 99 48 213 105 46 
+174 105 47 62 70 65 62 61 67 60 60 63 60 64 65 58 65 69 59 64 62 56 66 64 
+128 93 57 185 105 60 217 104 40 212 98 39 211 102 45 213 105 46 213 100 46 207 99 48 
+198 102 49 211 99 45 216 99 44 216 99 44 216 99 44 217 105 50 198 102 49 174 105 47 
+97 78 60 53 64 53 62 61 67 57 63 61 60 60 63 140 141 138 254 255 251 254 251 249 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 252 252 252 
+255 255 255 187 189 188 62 61 67 59 64 62 53 64 53 53 63 60 62 66 56 128 93 57 
+207 99 48 210 105 51 211 99 45 212 104 43 213 103 41 211 102 45 212 101 45 213 100 46 
+213 105 50 210 102 46 210 99 44 208 103 45 210 105 51 210 105 51 213 100 46 216 99 44 
+210 99 44 155 104 59 97 78 60 51 61 71 58 64 64 54 67 66 57 63 61 125 131 132 
+241 240 247 253 252 247 252 252 252 254 255 255 255 254 255 255 254 255 254 251 252 254 252 251 
+253 253 255 253 253 255 252 252 252 97 100 105 54 67 66 54 64 59 84 69 58 198 102 49 
+213 100 52 212 98 39 210 105 40 210 99 44 217 104 40 174 105 47 71 65 56 58 65 69 
+60 64 65 125 131 132 253 253 253 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+248 251 253 140 141 138 57 58 61 62 61 67 62 70 69 174 105 47 210 99 44 213 100 46 
+213 100 52 212 101 45 207 105 48 200 101 40 84 69 58 56 66 64 58 62 65 110 110 107 
+255 255 255 251 251 251 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 
+249 254 254 253 253 253 249 254 246 253 252 247 145 151 154 53 60 64 58 66 61 58 62 65 
+59 59 56 62 66 62 112 79 60 185 105 60 213 105 50 207 99 48 213 100 46 207 105 38 
+213 105 50 210 102 46 208 103 45 208 103 45 209 99 39 208 103 45 211 102 45 210 102 46 
+208 103 45 209 105 45 208 103 45 212 98 39 217 98 38 207 99 48 155 104 59 112 79 60 
+57 60 56 58 68 63 59 59 56 56 64 62 56 64 62 97 100 105 224 220 212 255 255 253 
+253 253 253 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 
+254 255 251 253 253 255 254 252 251 254 255 251 230 230 230 145 151 154 48 49 51 0 1 1 
+4 1 5 4 2 1 4 2 1 0 0 0 4 1 5 88 95 83 109 102 83 109 102 83 
+109 102 83 142 120 69 142 120 69 148 133 63 165 143 59 164 144 50 166 144 56 166 134 56 
+166 144 56 168 136 64 173 138 52 169 144 61 165 143 59 166 144 56 169 144 61 165 143 59 
+169 141 58 169 138 59 173 145 52 168 136 64 166 134 56 169 144 61 165 143 59 21 19 24 
+145 151 154 254 254 254 255 255 255 230 230 230 224 220 212 213 212 223 224 220 212 255 255 255 
+255 255 255 255 255 255 252 252 252 251 251 251 219 227 224 213 212 223 219 227 224 230 230 230 
+249 254 254 253 253 253 213 212 223 88 95 83 0 1 1 21 19 24 142 120 69 109 102 83 
+0 0 0 110 110 107 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 255 255 253 
+255 255 255 254 254 254 252 252 252 252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 255 255 255 252 252 252 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 255 254 253 253 255 254 251 254 253 255 254 213 212 223 59 59 56 58 65 69 
+57 63 61 71 68 65 101 91 62 147 124 59 156 125 56 147 124 59 113 104 59 71 68 65 
+54 64 59 57 63 63 62 65 65 154 157 157 97 100 105 58 62 65 53 64 53 58 65 69 
+57 63 61 94 90 61 128 113 57 149 124 53 161 125 43 161 125 43 156 125 56 148 133 63 
+155 126 57 155 127 54 155 128 52 152 127 56 128 99 63 97 78 60 62 61 67 53 63 60 
+54 67 66 58 59 68 59 64 62 125 131 132 241 240 247 253 253 255 249 254 254 254 255 251 
+255 255 255 254 254 254 253 253 253 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+254 255 255 255 255 253 253 252 247 254 255 251 251 251 251 254 254 255 253 253 255 255 255 255 
+253 252 247 156 160 157 68 69 75 60 61 69 60 64 65 60 60 63 62 61 67 60 61 69 
+97 78 60 110 92 61 142 120 69 157 124 59 159 126 56 156 126 54 155 126 57 152 127 56 
+152 124 51 157 124 59 155 126 57 158 127 55 158 132 49 149 124 53 128 113 57 110 92 61 
+85 80 60 66 60 61 53 63 60 59 64 62 57 58 61 57 63 61 58 66 61 81 77 81 
+202 206 211 254 255 251 248 254 252 253 252 247 254 255 251 250 252 254 254 252 251 255 255 253 
+255 255 255 255 255 255 252 252 252 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 
+254 255 251 248 254 252 160 163 161 58 66 61 53 60 64 62 65 65 62 61 67 59 64 62 
+85 80 60 113 104 59 147 124 59 158 127 55 159 126 56 158 124 56 155 126 57 150 128 52 
+148 128 46 155 128 52 158 127 55 142 120 69 101 91 62 62 66 56 53 63 60 58 65 69 
+57 58 61 58 66 61 172 178 183 154 157 157 62 66 56 54 67 66 66 60 61 97 78 60 
+128 113 57 158 134 59 157 124 59 128 113 57 101 91 62 62 65 65 51 61 71 60 64 65 
+104 112 110 254 255 255 255 255 255 252 252 252 255 255 255 253 253 253 254 254 254 255 253 254 
+255 254 255 253 255 254 254 255 251 255 255 255 172 178 183 68 69 75 62 61 67 54 67 66 
+57 60 70 62 70 69 85 80 60 113 104 59 149 124 53 156 128 53 155 126 57 155 126 57 
+161 124 50 157 124 59 155 126 57 152 124 51 156 129 45 155 126 57 128 99 63 97 78 60 
+66 60 61 54 67 66 53 67 71 59 64 62 68 69 75 57 63 63 58 59 64 60 64 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 56 155 127 54 72 76 65 58 62 65 53 60 64 202 206 211 254 251 252 255 255 253 
+241 240 247 71 72 69 53 63 60 58 67 65 71 68 65 101 91 62 128 113 57 150 126 55 
+128 113 57 110 92 61 71 65 56 58 59 68 54 64 59 54 64 59 187 189 188 254 255 251 
+255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 253 253 253 
+255 255 253 254 255 251 248 251 253 253 253 255 202 204 206 68 69 75 58 66 61 58 62 65 
+58 62 65 57 60 70 58 65 69 85 80 60 113 104 59 147 124 59 156 125 56 158 125 54 
+152 124 51 158 127 55 157 126 52 156 124 53 161 124 50 158 127 55 156 124 53 155 126 57 
+156 125 56 128 113 57 110 92 61 85 80 60 62 66 62 57 63 61 58 64 64 58 62 65 
+50 65 62 62 66 62 81 77 81 172 178 183 254 255 255 255 254 255 253 252 247 254 255 255 
+253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 156 160 157 58 62 63 
+60 64 65 57 60 56 71 68 65 155 104 59 198 102 49 210 105 51 174 105 47 112 79 60 
+62 66 62 54 67 66 57 63 61 68 69 75 178 172 162 58 62 65 59 64 62 57 58 61 
+59 64 62 71 72 69 112 79 60 174 105 47 209 105 45 210 102 46 210 102 46 216 99 44 
+216 99 44 209 105 45 210 102 46 213 100 52 185 105 60 128 93 57 84 69 58 57 63 63 
+62 61 67 58 65 69 54 64 59 71 72 69 172 178 183 253 255 254 252 252 252 253 253 255 
+252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 
+255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 
+249 254 246 253 253 255 219 227 224 97 100 105 53 63 60 58 67 65 58 62 65 57 63 63 
+57 63 61 97 78 60 155 104 59 198 102 49 209 99 39 212 98 39 213 100 46 211 99 45 
+207 99 38 209 105 45 209 105 45 212 98 39 217 98 38 207 105 48 155 104 59 112 79 60 
+71 72 69 69 60 69 57 61 64 59 64 62 62 66 62 71 72 69 172 178 183 254 255 251 
+254 255 251 253 255 254 254 255 255 254 254 254 254 251 252 254 251 252 255 255 255 255 255 255 
+248 254 252 254 255 251 253 255 254 202 204 206 57 60 70 53 64 53 58 65 69 72 73 56 
+142 101 66 198 102 49 210 99 51 185 105 60 112 79 60 62 66 56 62 61 67 57 58 61 
+71 72 69 241 240 247 255 255 255 255 255 255 251 251 251 255 255 255 254 254 254 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 252 251 230 230 230 71 81 83 66 60 61 51 61 71 62 66 62 112 79 60 198 102 49 
+211 99 45 185 105 60 142 101 66 62 66 62 59 59 56 56 64 62 58 65 69 213 212 223 
+255 255 255 253 253 253 251 251 251 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 
+254 254 254 249 254 254 253 255 254 253 255 254 248 254 252 187 189 188 88 95 83 60 60 63 
+58 64 64 66 60 61 57 63 63 53 60 64 97 78 60 128 93 57 174 105 47 210 105 51 
+207 105 48 210 105 51 210 102 46 216 99 44 212 101 45 216 99 44 210 102 46 210 102 46 
+217 105 50 207 99 48 174 105 47 128 93 57 97 78 60 71 65 56 57 63 61 56 66 64 
+59 64 62 57 58 61 56 66 64 72 76 65 178 172 162 253 253 255 254 255 251 255 253 254 
+255 255 255 253 253 253 254 254 254 254 254 254 250 247 249 
+253 253 253 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 255 255 255 
+254 255 251 254 255 251 255 253 254 255 255 255 249 254 246 249 254 246 254 255 251 242 238 229 
+187 189 188 125 131 132 4 1 5 4 1 5 4 2 1 142 120 69 169 144 61 173 138 52 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+169 138 59 169 141 58 166 144 56 173 145 52 169 141 58 169 144 61 166 144 56 173 142 59 
+169 141 58 165 143 59 169 141 58 164 144 50 169 144 61 169 144 61 178 172 162 113 113 120 
+71 72 69 255 255 255 254 254 254 241 240 247 219 227 224 213 212 223 219 227 224 255 255 255 
+253 253 253 255 255 255 255 255 255 241 240 247 224 220 212 224 220 212 241 240 247 255 255 255 
+254 255 251 172 178 183 0 0 0 0 1 1 88 95 83 165 143 59 165 143 59 142 120 69 
+0 0 0 48 49 51 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 253 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 253 255 254 255 255 255 255 254 255 253 255 254 254 255 251 187 189 188 53 63 60 
+54 67 66 58 62 65 62 61 67 59 60 64 57 60 56 60 64 65 58 62 65 59 64 62 
+60 60 63 57 60 70 140 141 138 254 255 251 241 240 247 113 113 120 62 66 62 57 61 64 
+56 64 62 53 60 64 58 62 65 62 65 65 81 77 81 94 90 61 101 91 62 101 91 62 
+101 91 62 94 90 61 72 76 65 57 61 64 58 62 65 56 64 62 57 63 61 58 64 64 
+57 60 56 88 95 83 187 189 188 253 253 255 254 255 251 254 254 255 255 254 255 249 254 246 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 254 254 254 
+248 254 252 254 255 255 253 253 255 255 253 254 255 255 253 253 255 254 253 255 254 249 254 246 
+255 255 255 253 255 254 230 230 230 125 131 132 59 64 62 58 66 61 57 60 56 59 64 62 
+57 63 63 56 64 62 59 64 62 62 66 56 72 76 65 94 90 61 101 91 62 101 91 62 
+101 91 62 101 91 62 101 91 62 85 80 60 71 68 65 62 65 65 60 64 65 53 60 64 
+54 67 66 53 63 60 62 65 65 59 60 62 57 63 61 110 110 107 172 178 183 253 255 254 
+253 255 254 253 255 254 254 255 251 254 255 255 253 253 255 253 252 247 254 255 251 255 255 255 
+253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 
+255 253 254 253 253 255 253 255 254 224 220 212 110 110 107 58 62 65 56 64 62 57 63 63 
+54 64 59 58 65 69 58 62 65 62 66 62 85 80 60 94 90 61 110 92 61 101 91 62 
+101 91 62 85 80 60 62 66 62 58 62 65 58 62 65 58 62 65 58 64 64 57 63 61 
+88 95 83 213 212 223 255 255 253 254 255 255 97 100 105 59 59 56 58 65 69 50 65 62 
+57 63 63 62 66 62 57 58 61 57 63 61 60 60 63 58 65 69 54 64 59 68 69 75 
+219 227 224 254 255 255 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 255 254 255 
+249 254 254 255 255 253 255 255 255 255 255 253 253 253 253 230 230 230 104 112 110 59 60 62 
+57 63 63 57 60 56 62 66 56 57 61 64 58 62 65 71 72 69 85 80 60 101 91 62 
+101 91 62 101 91 62 94 90 61 85 80 60 72 76 65 62 61 67 56 64 62 54 67 66 
+57 63 61 59 64 62 57 63 61 97 100 105 224 220 212 59 64 62 53 63 60 60 64 65 
+156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 156 126 54 
+158 124 56 152 124 51 62 66 56 56 66 64 58 65 69 230 230 230 255 255 255 251 251 251 
+249 254 254 224 220 212 68 69 75 58 62 65 60 61 69 57 61 64 58 66 61 57 63 61 
+57 63 61 59 60 70 53 63 60 53 63 60 62 65 65 145 151 154 255 254 255 254 255 251 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 
+248 254 252 253 253 253 255 255 253 254 255 251 254 255 251 241 240 247 154 157 157 68 69 75 
+58 64 64 57 60 56 59 59 56 58 64 64 58 62 65 58 62 65 71 68 65 72 76 65 
+85 80 60 101 91 62 101 91 62 101 91 62 101 91 62 101 91 62 85 80 60 84 69 58 
+58 64 64 58 62 65 57 61 64 58 64 64 57 63 63 59 64 62 56 64 62 57 63 63 
+88 95 83 187 189 188 254 255 255 255 254 255 254 252 251 254 255 251 251 251 251 254 255 251 
+254 255 255 254 254 254 253 253 253 255 255 255 253 253 253 255 255 255 254 255 255 125 131 132 
+57 63 61 58 62 65 59 60 64 53 60 64 59 64 62 57 60 56 58 62 65 58 66 61 
+60 60 63 58 68 63 62 61 67 224 220 212 254 252 251 224 220 212 71 81 83 62 61 67 
+54 67 66 57 60 56 57 63 61 58 65 69 71 68 65 97 78 60 128 93 57 112 79 60 
+128 93 57 112 79 60 97 78 60 62 66 56 58 66 61 62 66 62 57 61 64 53 67 71 
+54 64 59 57 61 64 110 110 107 230 230 230 255 255 253 248 254 252 255 255 255 253 252 247 
+255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 
+252 252 252 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 
+253 253 255 254 255 251 254 252 251 254 255 251 172 178 183 68 69 75 57 60 56 62 65 65 
+59 64 62 60 64 65 57 61 64 58 62 65 71 72 69 85 80 60 112 79 60 128 93 57 
+128 93 57 128 93 57 112 79 60 97 78 60 71 68 65 62 61 67 58 62 65 62 65 65 
+59 59 56 53 60 64 58 62 65 58 66 61 125 131 132 241 240 247 255 255 253 254 254 255 
+255 253 254 253 253 255 255 255 255 254 254 254 255 255 253 248 254 252 253 255 254 253 253 255 
+255 254 255 254 251 249 248 254 252 254 251 249 156 160 157 60 64 65 58 62 65 57 60 70 
+62 66 56 54 64 59 59 64 62 62 61 67 54 67 66 56 66 64 57 63 61 54 67 66 
+187 189 188 255 255 255 255 255 255 251 251 251 255 255 255 254 254 254 252 252 252 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 248 254 253 172 178 183 62 65 65 59 59 56 56 64 62 51 61 71 54 64 59 
+54 64 59 56 64 62 56 66 64 58 62 65 60 64 65 60 61 69 172 178 183 253 255 254 
+254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+255 255 255 254 255 251 255 253 254 255 253 254 254 255 251 253 253 255 250 247 249 156 160 157 
+68 69 75 57 63 63 58 62 65 62 65 65 57 63 61 57 60 56 59 64 62 58 62 65 
+84 69 58 97 78 60 112 79 60 112 79 60 112 79 60 112 79 60 112 79 60 97 78 60 
+84 69 58 62 66 62 53 60 64 57 60 70 62 61 67 59 64 62 57 63 63 58 62 65 
+58 64 64 81 77 81 172 178 183 241 240 247 255 255 253 253 255 254 249 254 254 254 255 251 
+253 255 254 254 255 255 252 252 252 254 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+249 254 254 110 110 107 4 2 1 0 1 1 4 1 5 158 134 59 169 138 59 169 141 58 
+169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 169 141 58 
+166 144 56 169 144 61 178 172 162 178 172 162 178 172 162 178 172 162 178 172 162 178 172 162 
+178 172 162 178 172 162 178 172 162 214 206 175 230 230 230 254 255 251 254 254 255 187 189 188 
+0 0 0 241 240 247 253 253 253 252 252 252 224 220 212 213 212 223 230 230 230 254 254 254 
+255 255 255 255 255 255 255 255 255 252 252 252 219 227 224 242 238 229 255 255 255 255 255 255 
+219 227 224 4 1 5 21 19 24 142 120 69 165 143 59 173 145 52 169 144 61 158 134 59 
+0 0 0 4 2 1 241 240 247 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 187 189 188 
+68 69 75 60 64 65 62 65 65 57 63 61 60 64 65 58 64 64 58 62 63 58 62 63 
+59 60 62 154 157 157 253 253 253 255 255 255 253 253 253 253 253 253 202 204 206 81 77 81 
+57 63 63 58 64 64 58 64 64 57 63 63 58 64 64 58 64 64 57 63 63 57 63 63 
+57 63 63 60 64 65 57 63 63 58 62 63 57 58 61 58 64 64 60 64 65 81 77 81 
+187 189 188 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 252 252 252 230 230 230 140 141 138 71 72 69 57 63 61 
+58 64 64 57 63 63 57 63 63 57 63 63 60 64 65 60 64 65 57 63 63 57 63 63 
+58 64 64 57 63 63 60 64 65 60 64 65 57 63 63 57 63 63 60 64 65 57 63 63 
+57 63 61 57 63 61 81 77 81 140 141 138 230 230 230 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 202 204 206 110 110 107 59 64 62 
+57 63 63 60 64 65 60 64 65 57 63 63 57 63 63 57 63 63 57 63 63 58 64 64 
+57 63 63 57 63 63 57 63 63 58 62 63 58 64 64 59 64 62 71 72 69 156 160 157 
+253 253 253 255 255 255 253 253 253 255 255 255 241 240 247 110 110 107 62 65 65 62 65 65 
+57 63 63 60 64 65 58 64 64 57 63 63 58 62 63 59 64 62 88 95 83 219 227 224 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 254 255 251 250 252 246 255 255 253 254 255 255 254 254 255 255 255 253 202 204 206 
+110 110 107 57 60 56 54 64 59 54 64 59 57 63 61 60 64 65 58 65 69 58 62 65 
+58 62 63 62 65 65 58 62 63 58 62 63 57 58 61 58 64 64 60 64 65 58 62 63 
+59 60 62 88 95 83 172 178 183 254 252 250 202 204 206 58 62 65 60 64 65 62 66 56 
+156 124 53 158 126 53 157 126 52 157 126 52 159 126 56 158 125 54 158 124 54 158 127 55 
+155 126 57 149 124 55 58 62 65 56 64 62 62 65 65 249 254 246 255 253 254 253 255 254 
+255 255 255 254 254 254 224 220 212 88 95 83 59 64 62 58 64 64 58 64 64 60 64 65 
+58 62 63 58 64 64 58 62 63 62 65 65 178 172 162 251 251 251 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 241 240 247 
+178 172 162 81 77 81 57 63 61 60 64 65 62 65 65 58 62 63 57 63 63 60 64 65 
+58 62 63 58 62 63 58 62 63 58 62 63 58 62 63 58 62 63 58 64 64 60 64 65 
+56 66 64 57 63 63 57 63 61 59 64 62 57 63 61 71 72 69 140 141 138 202 204 206 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+145 151 154 58 62 63 58 62 63 58 64 64 57 63 63 60 64 65 60 64 65 57 58 61 
+59 64 62 81 77 81 219 227 224 253 253 253 255 255 255 255 255 255 241 240 247 156 160 157 
+68 69 75 58 64 64 58 64 64 58 62 63 58 62 63 60 64 65 57 63 63 57 63 63 
+58 64 64 57 63 63 60 64 65 57 58 61 60 64 65 58 62 63 60 64 65 58 62 63 
+110 110 107 202 206 211 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 241 240 247 178 172 162 81 77 81 
+60 64 65 57 58 61 58 62 63 62 65 65 58 62 63 57 63 63 60 64 65 57 63 63 
+60 64 65 57 63 63 60 64 65 60 64 65 57 63 63 57 63 63 60 64 65 57 63 63 
+59 64 62 71 72 69 140 141 138 230 230 230 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 252 252 252 255 255 255 187 189 188 71 72 69 59 64 62 
+57 63 63 57 63 63 57 63 63 62 65 65 58 62 63 57 63 61 88 95 83 202 206 211 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 187 189 188 71 72 69 58 62 63 57 58 61 58 62 63 
+57 63 63 58 64 64 58 64 64 57 63 61 71 72 69 172 178 183 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+241 240 247 178 172 162 81 77 81 59 64 62 57 63 61 57 63 63 57 63 63 57 63 63 
+58 62 63 60 64 65 58 64 64 58 62 63 58 62 63 58 62 63 58 64 64 58 62 63 
+57 63 63 58 64 64 60 64 65 57 63 61 58 64 64 58 62 63 68 69 75 125 131 132 
+202 204 206 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 48 49 51 4 2 1 0 0 0 85 80 60 165 143 59 169 141 58 166 134 56 
+169 141 58 169 141 58 166 144 56 169 141 58 169 144 61 169 141 58 169 141 58 169 144 61 
+178 172 162 254 252 244 254 252 251 253 253 255 255 254 255 254 252 250 253 252 247 253 253 255 
+254 251 249 254 255 251 254 255 251 255 255 253 252 252 252 252 252 252 254 255 255 219 227 224 
+0 0 0 187 189 188 255 255 255 255 255 255 219 227 224 224 220 212 230 230 230 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 254 254 254 254 254 254 253 253 253 255 255 255 
+145 151 154 4 2 1 142 120 69 165 143 59 164 144 50 169 141 58 169 141 58 166 144 56 
+62 65 65 0 0 0 178 172 162 255 255 255 254 254 254 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 253 253 253 
+250 247 249 160 163 161 104 112 110 62 65 65 58 62 63 57 58 61 97 100 105 145 151 154 
+230 230 230 253 253 253 255 255 255 253 253 253 255 255 255 254 254 254 251 251 251 255 255 255 
+202 206 211 140 141 138 68 69 75 58 62 63 58 62 63 60 64 65 58 62 63 62 65 65 
+58 62 63 58 62 63 58 62 63 58 64 64 81 77 81 125 131 132 187 189 188 253 253 255 
+253 253 253 253 253 253 253 253 253 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 251 251 251 255 255 255 254 255 255 253 255 254 254 255 255 187 189 188 
+145 151 154 97 100 105 62 65 65 58 62 63 58 62 63 58 62 63 62 70 69 60 64 65 
+58 64 64 60 64 65 57 58 61 57 58 61 60 64 65 60 64 65 81 77 81 113 113 120 
+178 172 162 219 227 224 254 255 255 254 255 255 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 252 252 252 255 255 255 253 253 253 253 255 254 254 255 255 230 230 230 
+145 151 154 97 100 105 57 58 61 60 64 65 60 64 65 60 64 65 58 62 63 62 65 65 
+58 64 64 58 64 64 62 65 65 58 62 63 88 95 83 187 189 188 241 240 247 254 255 255 
+255 255 255 252 252 252 255 255 255 254 254 254 254 255 255 253 255 254 187 189 188 113 113 120 
+71 81 83 58 62 63 57 58 61 68 69 75 104 112 110 187 189 188 241 240 247 255 255 255 
+254 254 254 254 254 254 255 255 255 252 252 252 254 254 254 254 254 254 252 252 252 255 255 255 
+253 253 255 254 255 251 254 255 251 255 255 253 252 252 252 251 251 251 255 255 253 253 253 255 
+254 254 255 213 212 223 145 151 154 97 100 105 58 65 69 60 60 63 57 58 61 59 64 62 
+58 64 64 58 62 63 58 64 64 58 62 63 62 65 65 58 62 63 68 69 75 125 131 132 
+187 189 188 254 254 255 253 255 254 255 254 255 140 141 138 53 63 60 62 66 62 81 77 81 
+156 124 53 156 126 54 156 126 54 156 124 53 159 126 56 159 126 56 156 125 56 152 124 51 
+158 126 53 128 113 57 57 58 61 53 63 60 88 95 83 248 254 252 254 251 252 254 255 255 
+254 254 254 255 255 255 255 255 255 252 252 252 172 178 183 104 112 110 68 69 75 58 62 63 
+58 62 63 104 112 110 145 151 154 230 230 230 253 253 253 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 
+254 255 255 254 255 255 224 220 212 156 160 157 104 112 110 58 62 63 58 64 64 58 62 63 
+58 62 63 58 62 63 58 64 64 58 64 64 58 64 64 58 64 64 58 62 63 57 58 61 
+58 62 63 68 69 75 104 112 110 156 160 157 219 227 224 253 255 254 253 255 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 255 230 230 230 145 151 154 97 100 105 62 65 65 57 58 61 68 69 75 110 110 107 
+178 172 162 241 240 247 253 255 254 253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 
+241 240 247 172 178 183 113 113 120 60 64 65 60 64 65 57 58 61 58 62 63 60 64 65 
+58 64 64 60 64 65 58 62 63 58 62 63 58 64 64 97 100 105 160 163 161 230 230 230 
+251 251 251 255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 
+213 212 223 145 151 154 97 100 105 58 62 63 60 64 65 60 64 65 60 64 65 60 64 65 
+57 58 61 60 64 65 58 64 64 58 62 63 58 62 63 58 62 63 88 95 83 125 131 132 
+187 189 188 254 255 255 254 255 255 253 255 254 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 254 254 254 254 255 255 230 230 230 160 163 161 
+104 112 110 60 64 65 58 62 63 68 69 75 104 112 110 187 189 188 241 240 247 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 251 251 251 254 255 255 241 240 247 178 172 162 104 112 110 58 62 63 
+58 62 63 62 65 65 104 112 110 178 172 162 241 240 247 253 255 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 255 255 254 255 255 224 220 212 178 172 162 104 112 110 57 58 61 60 64 65 
+58 62 63 57 58 61 58 62 63 60 64 65 60 64 65 58 64 64 58 62 63 60 64 65 
+58 64 64 62 65 65 62 70 69 113 113 120 160 163 161 202 204 206 254 255 255 253 253 255 
+255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 125 131 132 125 131 132 125 131 132 156 160 157 182 158 106 182 158 106 182 158 106 
+182 158 106 182 158 106 182 158 106 182 158 106 182 158 106 182 158 106 156 160 157 178 172 162 
+202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 
+202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 202 204 206 
+48 49 51 125 131 132 253 253 253 255 255 255 230 230 230 213 212 223 241 240 247 255 255 255 
+253 253 253 253 253 253 254 254 254 255 255 255 255 255 255 252 252 252 255 255 255 252 252 252 
+113 113 120 4 1 5 125 131 132 182 158 106 182 158 106 182 158 106 182 158 106 182 158 106 
+154 157 157 125 131 132 187 189 188 254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 252 252 252 255 255 255 
+252 252 252 253 253 253 254 255 255 253 253 253 253 255 254 254 255 255 254 255 255 254 255 255 
+255 255 255 255 255 255 251 251 251 255 255 255 251 251 251 255 255 255 254 254 254 254 254 254 
+255 255 255 254 254 254 255 255 255 224 220 212 187 189 188 156 160 157 156 160 157 156 160 157 
+154 157 157 172 178 183 202 204 206 230 230 230 253 255 254 254 255 255 253 255 254 254 255 255 
+255 255 255 250 247 249 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 253 253 253 255 255 255 
+252 252 252 254 255 255 253 253 253 202 206 211 202 204 206 160 163 161 154 157 157 156 160 157 
+154 157 157 156 160 157 160 163 161 202 204 206 202 204 206 241 240 247 249 252 251 254 255 255 
+253 255 254 253 255 254 254 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 252 252 252 255 255 255 255 255 255 254 254 254 254 255 255 249 252 251 
+253 253 253 254 255 255 253 255 254 202 204 206 172 178 183 154 157 157 160 163 161 154 157 157 
+154 157 157 178 172 162 202 204 206 250 247 249 254 255 255 253 253 253 251 251 251 255 255 255 
+251 251 251 255 255 255 254 254 254 251 251 251 252 252 252 254 254 254 255 255 255 254 255 255 
+253 253 255 250 252 254 254 255 255 254 255 255 254 255 255 253 253 253 255 255 255 254 254 254 
+254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 
+253 255 254 253 253 253 202 206 211 202 204 206 219 227 224 254 255 251 254 254 253 253 253 255 
+255 253 254 255 255 255 248 251 253 253 253 255 241 240 247 202 206 211 160 163 161 156 160 157 
+156 160 157 154 157 157 160 163 161 156 160 157 202 204 206 219 227 224 254 255 255 253 255 254 
+253 255 254 254 255 255 253 253 253 241 240 247 71 72 69 54 67 66 58 65 54 128 99 63 
+156 124 53 155 126 57 155 126 57 155 126 57 156 125 56 156 126 54 158 127 55 158 127 55 
+161 124 50 110 92 61 59 64 62 58 64 64 113 113 120 255 255 255 254 252 250 254 255 255 
+253 253 253 252 252 252 254 254 254 255 255 255 255 255 255 254 255 255 253 253 255 254 255 255 
+254 255 255 253 253 255 254 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 253 255 254 253 255 254 254 255 255 213 212 223 202 206 211 
+178 172 162 156 160 157 154 157 157 160 163 161 156 160 157 156 160 157 172 178 183 213 212 223 
+230 230 230 252 252 252 255 255 255 255 255 255 254 254 254 251 251 251 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 254 255 255 249 252 251 253 255 254 254 255 255 253 253 253 254 254 254 
+254 255 255 253 255 254 253 253 253 255 255 255 254 254 254 253 253 253 254 254 254 255 255 255 
+253 255 254 254 255 255 254 255 255 253 253 253 202 204 206 187 189 188 156 160 157 154 157 157 
+156 160 157 154 157 157 187 189 188 202 206 211 252 252 252 252 252 252 254 255 255 252 252 252 
+255 255 255 254 254 254 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 252 252 252 254 254 254 253 253 253 
+254 255 255 254 255 255 253 253 253 252 252 252 202 206 211 187 189 188 154 157 157 156 160 157 
+156 160 157 154 157 157 160 163 161 172 178 183 202 206 211 241 240 247 254 255 255 252 252 252 
+254 255 255 252 252 252 255 255 255 255 255 255 252 252 252 255 255 255 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 252 252 252 254 254 254 255 255 255 255 255 255 255 255 255 253 255 254 254 255 255 
+253 253 255 250 252 254 254 255 255 252 252 252 253 255 254 253 255 254 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 253 253 253 252 252 252 254 255 255 254 255 255 
+254 255 255 254 255 255 254 255 255 253 255 254 254 255 255 253 253 253 252 252 252 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 254 254 254 255 255 255 254 255 255 253 253 253 253 255 254 254 255 255 213 212 223 
+202 204 206 172 178 183 156 160 157 156 160 157 160 163 161 154 157 157 160 163 161 187 189 188 
+202 204 206 230 230 230 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 
+255 255 255 253 253 253 255 255 255 254 254 254 253 253 253 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+250 252 246 255 255 255 255 255 253 248 251 253 249 254 254 254 252 244 253 252 247 249 254 254 
+255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 254 255 255 250 252 254 253 253 255 
+253 253 255 254 255 251 254 255 251 249 252 251 254 255 251 255 255 253 251 251 251 254 255 251 
+254 255 251 254 255 251 252 252 252 254 254 253 255 255 255 255 254 255 254 251 252 255 254 255 
+154 157 157 0 0 0 202 204 206 255 255 255 250 247 249 230 230 230 255 255 255 253 253 253 
+255 255 255 254 254 254 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+97 100 105 0 1 1 250 252 254 255 255 255 254 251 249 253 253 255 253 253 255 250 252 254 
+255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 254 254 254 254 254 254 251 251 251 
+255 254 255 254 254 254 254 254 254 254 255 255 252 252 252 254 254 254 251 251 251 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 
+251 251 251 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 251 251 251 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 254 254 254 
+255 255 255 254 254 254 251 251 251 254 254 254 255 255 255 253 253 253 251 251 251 255 255 255 
+254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 251 251 251 255 255 255 
+252 252 252 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 
+255 255 255 252 252 252 255 255 255 253 253 253 251 251 251 255 255 255 252 252 252 255 255 255 
+253 253 253 255 255 255 251 251 251 254 254 254 253 253 253 253 253 253 254 254 254 250 247 249 
+125 131 132 62 61 67 60 61 69 53 63 60 57 63 61 71 72 69 113 113 120 187 189 188 
+254 255 251 253 252 247 255 255 253 255 255 253 255 255 253 254 251 249 255 255 255 253 253 255 
+253 253 253 253 255 254 251 251 251 254 254 254 255 255 255 254 254 254 251 251 251 254 254 254 
+253 252 247 248 254 253 253 253 255 125 131 132 62 65 65 58 68 63 62 66 56 157 124 59 
+158 125 54 156 126 54 155 126 57 155 126 57 156 125 56 158 125 54 158 127 55 158 127 55 
+159 126 56 85 80 60 59 64 62 58 62 63 156 160 157 255 254 255 254 255 251 255 255 255 
+255 255 255 255 255 255 255 255 255 251 251 251 253 253 253 255 255 255 253 253 253 255 255 255 
+254 254 254 255 255 255 252 252 252 252 252 252 255 255 255 251 251 251 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 
+255 255 255 253 253 253 251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 253 253 253 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 251 251 251 
+255 254 255 255 253 254 255 253 254 252 252 252 255 255 255 255 255 255 251 251 251 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 251 251 251 255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 254 254 254 
+255 255 255 255 255 255 253 253 253 251 251 251 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 254 254 254 252 252 252 255 255 255 
+255 255 255 255 255 255 252 252 252 254 254 254 253 253 253 255 255 255 254 254 254 253 253 253 
+253 253 253 255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 252 252 252 253 253 253 254 254 254 
+254 254 254 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 253 253 253 254 254 254 
+254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 255 254 255 254 251 252 255 254 255 
+252 252 252 254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 255 254 250 252 254 252 252 252 253 255 254 254 255 251 254 251 249 255 254 255 251 251 251 
+254 255 251 254 255 251 254 255 251 254 255 251 253 252 247 254 255 251 255 255 253 255 255 253 
+254 255 251 253 253 253 253 252 247 254 255 251 253 253 255 253 253 255 255 255 253 253 255 254 
+255 255 255 255 255 255 254 254 255 255 255 255 254 251 252 254 251 252 254 251 252 255 253 254 
+255 255 255 59 60 62 48 49 51 213 212 223 255 255 255 254 254 254 250 247 249 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 253 253 253 
+0 0 0 21 19 24 254 255 251 250 252 246 254 255 251 255 255 253 255 255 253 254 255 251 
+252 252 252 253 253 253 251 251 251 252 252 252 255 255 255 255 255 255 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 
+255 253 254 252 252 252 253 253 253 251 251 251 255 255 255 255 255 255 255 255 255 254 254 254 
+251 251 251 255 255 255 255 255 255 252 252 252 254 254 254 253 253 253 254 254 254 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 254 254 254 251 251 251 255 255 255 251 251 251 
+255 255 255 253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 
+255 255 255 254 254 254 251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 251 251 251 255 254 255 254 251 252 
+254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 
+252 252 252 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 
+255 255 255 250 247 249 254 254 254 254 254 254 255 255 255 253 253 253 255 255 255 251 251 251 
+255 254 255 252 252 252 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 253 253 253 
+255 255 255 252 252 252 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 252 252 252 253 253 253 
+255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 219 227 224 71 72 69 
+58 65 54 53 60 64 57 58 63 62 70 65 54 64 59 56 66 64 58 65 69 54 64 59 
+71 72 69 125 131 132 219 227 224 253 252 247 250 252 246 254 255 251 252 252 252 253 253 255 
+254 254 254 255 255 255 255 255 255 253 253 253 255 253 254 254 251 252 255 254 255 255 254 255 
+253 253 255 255 255 253 125 131 132 60 60 63 56 64 62 54 67 66 113 104 59 158 126 53 
+158 127 55 156 124 53 156 124 53 158 127 55 159 126 56 158 126 53 158 126 53 157 126 52 
+147 124 59 59 64 62 57 63 61 62 65 65 213 212 223 255 253 254 254 255 251 255 255 255 
+254 254 254 254 254 254 251 251 251 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 
+253 253 253 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 251 252 255 254 255 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 255 254 255 251 251 251 254 254 254 253 253 253 253 253 253 255 255 255 254 254 254 
+252 252 252 255 255 255 251 251 251 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 254 254 254 
+255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 254 254 254 252 252 252 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 
+254 254 254 255 255 255 253 253 253 253 253 253 251 251 251 251 251 251 255 255 255 255 255 255 
+250 247 249 255 255 255 254 254 254 251 251 251 255 255 255 255 255 255 252 252 252 253 253 253 
+253 253 253 255 255 255 252 252 252 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 253 253 253 255 255 255 254 254 254 250 247 249 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 253 253 253 255 255 255 
+253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 254 254 254 253 253 253 255 255 255 254 254 254 
+255 255 255 254 254 254 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 254 254 254 254 254 254 255 255 255 254 255 251 255 254 255 254 250 255 255 254 255 
+255 255 255 253 253 253 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 
+254 254 253 254 255 251 254 255 251 254 252 251 253 253 255 254 255 255 253 252 247 254 255 251 
+254 254 255 252 252 252 250 247 249 254 255 255 253 255 254 254 255 255 253 255 254 248 254 252 
+252 252 252 241 240 247 48 49 51 48 49 51 187 189 188 252 252 252 255 255 255 255 255 255 
+254 254 254 255 255 255 251 251 251 254 254 254 255 255 255 252 252 252 255 255 255 172 178 183 
+4 1 5 97 100 105 253 253 255 252 252 252 254 255 251 251 251 251 253 253 255 253 253 253 
+255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 252 252 252 252 252 252 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 255 255 255 
+255 255 255 251 251 251 251 251 251 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 251 251 251 253 253 253 255 255 255 254 255 255 249 252 251 253 255 254 254 255 255 
+251 251 251 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 252 252 252 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 254 255 
+253 253 253 253 253 253 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 254 254 254 
+252 252 252 255 255 255 255 255 255 253 253 253 253 253 253 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 
+252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 
+253 253 253 255 255 255 254 254 254 252 252 252 255 255 255 252 252 252 255 255 255 254 254 254 
+254 254 254 253 253 253 254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 
+254 254 254 254 254 254 251 251 251 253 253 253 255 255 255 230 230 230 68 69 75 58 64 64 
+53 60 64 62 61 67 69 60 69 72 76 65 62 66 56 57 61 64 58 62 65 60 64 65 
+58 62 65 58 62 65 58 62 65 97 100 105 178 172 162 230 230 230 255 255 255 250 252 254 
+252 252 252 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 
+202 206 211 88 95 83 60 64 65 57 60 70 58 62 65 85 80 60 152 124 51 152 124 51 
+158 127 55 157 126 52 156 126 54 158 127 55 157 126 52 157 126 52 159 126 56 158 127 55 
+113 104 59 58 62 65 57 63 61 81 77 81 254 255 255 255 254 255 249 254 246 255 253 254 
+254 254 254 253 253 253 255 255 255 252 252 252 255 255 255 252 252 252 251 251 251 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 
+251 251 251 255 255 255 254 254 254 255 255 255 254 255 255 249 252 251 253 255 254 249 252 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 252 252 252 255 255 255 252 252 252 255 255 255 254 254 254 253 253 253 255 255 255 
+255 255 255 252 252 252 255 255 255 252 252 252 251 251 251 253 253 253 254 254 254 253 253 253 
+255 255 255 251 251 251 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 253 253 253 
+255 255 255 254 254 254 251 251 251 253 253 253 252 252 252 255 255 255 254 254 254 255 255 255 
+255 255 255 252 252 252 254 254 254 253 253 253 252 252 252 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 253 253 253 
+255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 255 255 255 251 251 251 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 
+255 255 255 252 252 252 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 251 251 251 
+255 255 255 254 254 254 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 252 252 252 
+255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 251 251 251 
+255 255 255 253 253 253 255 255 255 251 251 251 254 254 254 255 255 255 252 252 252 254 255 255 
+251 251 251 255 255 255 255 255 255 251 251 251 254 254 254 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 254 255 251 253 253 255 253 255 254 254 255 251 250 252 246 248 254 252 249 254 246 
+255 255 253 255 255 253 255 255 253 255 255 253 254 254 253 255 255 253 255 255 253 255 255 253 
+255 254 255 254 255 251 250 247 249 255 254 255 254 255 251 255 255 253 252 252 252 253 252 247 
+254 255 251 254 255 251 254 255 251 255 255 253 254 255 251 254 255 255 254 255 255 253 255 254 
+255 255 255 251 251 251 241 240 247 48 49 51 0 1 1 125 131 132 230 230 230 252 252 252 
+253 253 253 253 253 253 255 255 255 255 255 255 251 251 251 255 255 255 213 212 223 21 19 24 
+0 0 0 187 189 188 255 255 255 253 253 255 255 255 253 254 255 251 255 255 253 255 255 255 
+254 254 254 251 251 251 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 253 253 253 253 253 253 255 255 255 
+255 255 255 254 254 254 252 252 252 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+251 251 251 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 
+253 253 253 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 252 252 252 254 254 254 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 254 254 254 253 253 253 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 251 251 251 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 
+254 254 254 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 254 254 254 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 253 253 253 253 253 253 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 255 255 255 251 251 251 252 252 252 252 252 252 255 255 255 
+255 255 255 255 255 255 252 252 252 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 253 253 253 253 253 253 254 254 254 255 255 255 
+255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+254 255 255 255 255 255 255 255 255 252 252 252 254 254 254 255 255 255 254 254 254 255 255 255 
+253 253 253 255 255 255 251 251 251 254 254 254 254 255 255 104 112 110 57 63 63 57 63 63 
+58 65 69 85 80 60 142 120 69 155 128 52 158 127 55 128 113 57 94 90 61 62 66 56 
+58 65 54 59 64 62 58 62 65 58 62 65 58 62 65 57 63 61 97 100 105 145 151 154 
+172 178 183 202 206 211 202 206 211 202 204 206 202 206 211 187 189 188 145 151 154 88 95 83 
+57 63 61 62 65 65 59 60 62 59 64 62 84 69 58 149 124 55 158 134 59 154 129 46 
+158 125 54 156 124 53 157 127 54 158 127 55 156 124 53 156 124 53 155 126 57 152 127 56 
+72 76 65 62 61 67 57 58 61 145 151 154 255 255 255 252 252 252 253 255 254 255 255 253 
+255 255 255 254 254 254 252 252 252 255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 251 251 251 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 
+255 255 255 251 251 251 255 255 255 253 253 253 255 255 255 254 254 254 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 252 252 252 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 251 251 251 254 254 254 253 253 253 254 254 254 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 
+252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 251 251 251 253 253 253 
+254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 253 253 253 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 252 252 252 252 252 252 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 252 252 252 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 253 253 253 252 252 252 255 255 255 253 253 253 255 255 255 
+254 254 254 255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 254 254 254 255 255 255 252 252 252 254 254 254 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 
+249 252 251 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 253 253 253 255 255 255 254 254 254 255 255 255 251 251 251 255 255 255 255 255 255 
+254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 254 254 254 255 255 255 
+255 255 255 254 254 254 253 253 253 255 255 255 254 254 254 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 253 253 253 251 251 251 255 255 255 255 255 255 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 255 253 252 247 249 254 254 253 253 255 254 254 254 254 255 251 254 254 255 254 252 251 
+254 255 251 254 255 255 254 255 255 253 255 254 253 255 254 253 255 254 253 253 253 254 255 255 
+255 255 253 254 254 255 255 255 253 250 252 246 254 255 255 252 252 252 255 255 253 255 254 255 
+255 254 255 255 254 255 255 254 255 254 251 252 254 251 252 255 254 255 255 253 254 255 253 254 
+251 251 251 255 255 255 252 252 252 254 254 254 125 131 132 4 2 1 0 0 0 125 131 132 
+187 189 188 241 240 247 254 254 254 255 255 255 219 227 224 145 151 154 48 49 51 0 0 0 
+125 131 132 255 255 253 254 255 251 254 255 255 253 255 254 255 255 253 251 251 251 253 255 254 
+254 254 254 255 255 255 253 253 253 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 255 255 255 252 252 252 
+253 255 254 254 255 255 254 255 255 252 252 252 255 255 255 253 253 253 255 255 255 253 253 253 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 
+255 254 255 251 251 251 255 254 255 254 254 254 255 255 255 253 253 253 255 255 255 253 253 253 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 254 255 255 254 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 254 254 254 
+254 255 255 253 253 253 255 255 255 254 254 254 252 252 252 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 253 253 253 
+253 253 253 254 255 255 254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+252 252 252 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 254 255 255 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 254 255 255 
+255 255 255 252 252 252 255 255 255 253 253 253 219 227 224 57 58 61 56 66 64 53 63 60 
+110 92 61 148 133 63 158 126 53 162 124 52 162 124 55 159 126 56 156 124 53 157 124 59 
+109 102 83 85 80 60 59 59 56 60 64 65 58 62 65 57 63 63 59 64 62 57 63 61 
+58 64 64 57 63 61 58 64 64 60 64 65 57 63 63 58 64 64 62 65 65 57 63 63 
+58 65 69 58 62 63 54 64 59 94 90 61 150 128 52 158 126 53 156 124 53 158 127 55 
+156 125 56 156 124 53 156 126 54 158 126 53 158 125 54 159 126 56 149 124 55 140 101 45 
+56 66 64 60 60 63 62 65 65 230 230 230 254 254 253 253 253 253 253 255 254 254 252 250 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 251 251 251 255 255 255 253 253 253 253 253 253 254 254 254 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 253 253 253 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 254 255 255 
+255 255 255 254 254 254 255 255 255 251 251 251 253 253 253 255 255 255 254 254 254 254 254 254 
+254 255 255 253 253 253 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 
+254 254 254 253 253 253 255 255 255 254 254 254 255 255 255 252 252 252 254 255 255 254 255 255 
+255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 
+253 255 254 254 255 255 252 252 252 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 253 253 253 255 255 255 254 254 254 254 254 254 254 255 255 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 255 255 255 
+254 255 255 253 255 254 255 255 255 253 253 253 255 255 255 255 255 255 255 255 255 253 255 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 254 254 254 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 255 255 255 255 255 255 254 255 255 253 255 254 252 252 252 254 255 255 
+255 255 255 252 252 252 255 255 255 254 254 254 254 254 254 255 255 255 252 252 252 255 255 255 
+255 253 254 255 253 254 252 252 252 254 254 254 254 254 254 255 255 255 254 254 254 255 255 255 
+254 254 254 254 254 254 254 254 254 255 255 255 253 253 253 252 252 252 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 251 251 251 255 255 255 254 254 254 255 255 255 219 227 224 97 100 105 0 0 0 
+0 0 0 0 1 1 0 0 0 4 2 1 4 2 1 0 0 0 21 19 24 156 160 157 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 253 253 253 255 254 251 252 254 255 251 140 141 138 54 67 66 58 62 65 66 60 61 
+149 124 55 155 126 57 155 127 54 155 127 54 155 127 54 155 128 52 158 127 55 158 124 56 
+161 124 50 155 126 57 142 120 69 101 91 62 72 76 65 60 64 65 58 62 63 58 66 61 
+58 62 65 56 66 64 56 66 64 53 60 64 56 64 62 59 64 62 59 64 62 59 59 56 
+62 61 67 94 90 61 128 113 57 155 126 57 157 126 52 159 126 56 158 124 54 158 125 54 
+157 127 54 157 126 52 156 124 53 158 127 55 152 124 51 161 124 50 152 127 56 72 76 65 
+58 64 64 58 64 64 110 110 107 255 255 255 253 253 253 255 255 255 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+252 252 252 254 254 254 255 255 255 254 254 254 254 254 254 255 255 255 250 247 249 241 240 247 
+172 178 183 125 131 132 71 72 69 60 60 63 110 110 107 156 160 157 241 240 247 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 251 251 251 255 255 253 254 255 251 104 112 110 53 60 64 62 66 56 94 90 61 
+152 124 51 159 126 56 159 126 56 152 124 51 157 126 52 162 125 53 158 124 53 155 128 52 
+148 128 46 155 126 57 157 124 59 162 124 55 158 126 53 147 124 59 113 104 59 101 91 62 
+94 90 61 85 80 60 72 76 65 72 76 65 72 76 65 84 69 58 94 90 61 109 102 83 
+149 124 55 150 126 55 156 128 53 158 126 53 155 128 52 156 128 53 152 124 51 155 128 52 
+154 129 46 162 124 55 158 127 55 150 126 55 159 126 56 162 125 53 110 92 61 58 65 54 
+57 63 61 58 62 63 213 212 223 254 254 254 255 255 255 254 254 254 251 251 251 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 252 252 252 255 255 255 255 255 255 252 252 252 255 255 255 253 253 253 
+253 253 253 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 250 255 254 255 251 253 255 254 254 255 255 104 112 110 58 65 69 66 60 61 128 113 57 
+158 127 55 155 128 52 157 126 52 162 125 53 166 129 59 152 124 51 158 127 55 156 124 53 
+158 124 56 158 125 54 158 126 53 156 124 53 158 125 54 159 126 56 159 126 56 158 125 54 
+156 125 56 156 125 56 158 127 55 156 126 54 156 126 54 156 126 54 159 126 56 159 126 56 
+161 124 50 162 125 53 162 125 53 158 124 53 157 126 52 158 127 55 158 124 54 159 126 56 
+159 126 56 152 124 51 155 126 57 159 126 56 158 124 53 128 113 57 62 65 65 58 62 65 
+58 62 63 145 151 154 253 255 254 255 255 255 252 252 252 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+251 251 251 252 252 252 255 255 255 255 255 255 255 255 255 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 251 251 251 255 255 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 252 251 251 251 251 253 253 255 255 255 255 145 151 154 57 61 64 59 60 64 85 80 60 
+155 128 52 155 126 57 155 126 57 159 126 56 152 124 51 158 134 59 155 126 57 157 124 59 
+157 124 59 159 126 56 158 132 49 158 132 49 155 128 52 155 127 54 157 126 52 161 124 50 
+159 126 56 159 126 56 156 126 54 156 124 53 156 126 54 158 127 55 159 126 56 158 124 54 
+150 128 52 155 126 57 157 124 59 157 124 59 158 124 56 158 125 54 158 124 53 161 124 50 
+158 124 56 156 128 53 162 124 55 162 124 52 147 124 59 71 72 69 56 66 64 59 64 62 
+88 95 83 241 240 247 255 255 255 251 251 251 254 254 254 255 255 255 252 252 252 254 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 252 252 252 255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 255 255 
+254 254 254 254 254 254 252 252 252 253 253 253 255 255 255 255 255 255 250 247 249 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 255 251 255 255 253 255 255 255 253 253 255 202 204 206 54 64 59 60 64 65 60 61 69 
+113 104 59 147 124 59 161 124 50 156 124 53 157 124 59 152 124 51 158 126 53 158 126 53 
+158 132 49 157 126 52 156 124 53 158 124 54 158 125 54 158 126 53 155 127 54 155 127 54 
+156 129 45 152 124 51 156 124 53 158 127 55 158 127 55 156 126 54 155 128 52 155 128 52 
+155 127 54 156 128 53 155 128 52 156 126 54 158 127 55 157 124 59 155 126 57 155 126 57 
+158 125 54 158 126 53 159 126 56 128 113 57 71 72 69 53 63 60 53 63 60 57 63 61 
+213 212 223 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+253 253 253 253 253 253 254 254 254 255 255 255 255 255 255 254 254 254 255 255 255 254 254 254 
+253 253 253 254 254 254 255 255 255 254 254 254 252 252 252 255 255 255 255 255 255 253 253 253 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 253 254 255 251 254 255 251 255 253 254 253 253 255 104 112 110 54 64 59 53 60 64 
+66 60 61 110 92 61 157 124 59 161 124 50 164 134 50 155 128 52 152 124 51 159 126 56 
+156 126 54 156 126 54 158 127 55 159 126 56 159 126 56 157 124 59 157 124 59 159 126 56 
+157 124 59 158 127 55 158 127 55 156 124 53 152 124 51 156 124 53 156 125 56 157 124 59 
+162 124 55 158 124 54 156 126 54 156 128 53 156 128 53 152 124 51 156 125 56 156 125 56 
+162 125 53 157 127 54 113 104 59 62 65 65 60 64 65 58 65 54 58 65 69 172 178 183 
+254 254 254 255 255 255 253 253 253 253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 254 254 254 
+255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 254 254 254 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 254 255 254 255 251 251 251 251 253 253 255 255 255 253 230 230 230 71 72 69 62 66 62 
+62 65 65 62 61 67 84 69 58 142 120 69 155 128 52 152 127 56 155 126 57 158 124 54 
+154 129 46 155 128 52 155 126 57 158 124 56 158 126 53 155 128 52 155 128 52 155 128 52 
+159 126 56 156 124 53 158 124 53 159 126 56 159 126 56 159 126 56 158 126 53 158 126 53 
+158 125 54 156 124 53 157 124 59 156 125 56 157 126 52 157 126 52 159 134 56 152 124 51 
+147 124 59 94 90 61 62 70 69 53 63 60 59 64 62 58 62 65 172 178 183 255 253 254 
+253 253 253 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 252 252 252 255 254 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 253 253 253 253 253 253 255 255 255 254 254 254 255 255 255 252 252 252 254 254 254 
+253 253 253 255 255 255 253 253 253 254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 253 254 254 252 251 253 253 255 255 254 255 253 252 247 253 255 254 213 212 223 71 72 69 
+58 62 65 53 63 60 56 66 64 62 65 65 97 78 60 128 113 57 155 126 57 155 128 52 
+158 124 56 158 125 54 158 126 53 156 126 54 156 125 56 158 127 55 159 126 56 158 126 53 
+155 127 54 157 127 54 158 127 55 156 124 53 156 124 53 158 127 55 157 127 54 155 128 52 
+155 128 52 156 126 54 159 126 56 158 124 53 161 124 50 158 127 55 147 124 59 113 104 59 
+71 65 56 58 64 64 53 60 64 62 65 65 68 69 75 187 189 188 252 252 252 253 255 254 
+255 255 255 253 253 253 255 255 255 255 255 255 253 253 253 255 253 254 255 254 255 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 253 253 253 255 255 255 255 255 255 251 251 251 241 240 247 
+113 113 120 57 63 61 56 64 62 56 64 62 58 64 64 59 64 62 72 73 56 88 95 83 
+140 101 45 157 124 59 157 124 59 152 124 51 158 127 55 156 125 56 159 126 56 156 124 53 
+155 128 52 156 128 53 155 127 54 156 126 54 156 126 54 156 126 54 157 127 54 155 127 54 
+154 129 46 155 128 52 157 126 52 157 124 59 128 113 57 94 90 61 71 68 65 53 67 71 
+59 64 62 59 64 62 57 58 61 97 100 105 230 230 230 253 253 253 255 255 255 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+254 254 255 202 204 206 104 112 110 57 60 56 57 61 64 62 65 65 59 59 56 62 66 56 
+60 64 65 62 66 56 85 80 60 101 91 62 113 104 59 128 113 57 156 128 53 158 132 49 
+157 126 52 158 125 54 159 126 56 159 126 56 159 126 56 158 124 53 158 125 54 159 126 56 
+128 99 63 110 92 61 94 90 61 71 68 65 53 63 60 58 64 64 59 64 62 59 64 62 
+57 63 61 71 72 69 172 178 183 253 255 254 253 255 254 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 253 253 253 254 254 254 255 255 255 
+255 254 255 255 255 253 255 255 253 202 206 211 140 141 138 58 62 65 58 62 65 59 64 62 
+58 62 65 57 61 64 60 64 65 59 60 62 60 60 63 60 60 63 62 65 65 71 68 65 
+72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 72 76 65 71 65 56 59 59 56 
+62 65 65 60 60 63 57 63 61 57 63 61 60 64 65 60 64 65 57 58 61 81 77 81 
+156 160 157 241 240 247 253 253 253 255 255 255 255 255 255 254 254 254 254 254 254 251 251 251 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 254 254 254 253 253 253 254 254 254 
+251 251 251 254 252 251 255 255 253 254 254 254 253 253 255 241 240 247 187 189 188 113 113 120 
+71 72 69 56 66 64 56 66 64 53 60 64 60 64 65 57 63 63 59 64 62 59 64 62 
+57 61 64 60 64 65 60 64 65 57 63 61 57 63 61 60 64 65 56 66 64 58 65 69 
+58 62 65 62 70 69 58 65 69 62 61 67 62 61 67 113 113 120 187 189 188 254 252 251 
+255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 251 251 251 253 253 253 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 255 255 255 254 254 254 
+254 255 255 255 255 255 255 255 253 254 251 249 255 255 253 251 251 251 254 255 255 254 255 255 
+255 255 253 224 220 212 172 178 183 140 141 138 104 112 110 58 65 69 53 63 60 59 64 62 
+58 62 65 58 62 65 58 62 63 57 63 61 59 64 62 57 63 63 53 60 64 58 62 65 
+68 69 75 104 112 110 156 160 157 187 189 188 241 240 247 253 255 254 253 253 255 253 253 255 
+255 255 255 252 252 252 255 255 255 252 252 252 255 255 255 255 255 255 253 253 253 254 254 254 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+254 254 254 255 255 255 255 255 255 254 254 254 254 254 254 255 255 255 255 255 255 255 255 255 
+249 252 251 254 255 255 251 251 251 251 251 251 254 255 251 254 255 251 254 254 253 254 252 251 
+255 255 255 254 254 255 255 255 255 254 254 255 254 254 254 254 254 253 254 255 251 202 204 206 
+202 204 206 202 204 206 202 206 211 202 206 211 202 204 206 202 204 206 219 227 224 253 255 254 
+254 255 251 254 255 251 253 252 247 254 255 251 254 255 251 254 255 251 253 255 254 253 255 254 
+253 253 253 255 255 255 255 255 255 255 255 255 252 252 252 255 255 255 252 252 252 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
+255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
new file mode 100644
index 0000000..6139679
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -0,0 +1,46 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI33x EVM from PSP, based on am335x-kernel"
+LICENSE = "GPLv2"
+KERNEL_IMAGETYPE = "uImage"
+
+require multi-kernel.inc
+
+S = "${WORKDIR}/git"
+
+MULTI_CONFIG_BASE_SUFFIX = ""
+
+BRANCH = "v3.2-staging"
+SRCREV = "83d907e1b05dabc44f3bb64532d7b58d059a14c0"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+
+COMPATIBLE_MACHINE = "(ti33x)"
+
+THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
+CONFIGS_PSP = "${@base_set_filespath(["${THISDIR}/${PN}-${PV}/tipspkernel"], d)}:\
+${@base_set_filespath(["${THISDIR}/${PN}/tipspkernel"], d)}:\
+${@base_set_filespath(["${THISDIR}/files/tipspkernel"], d)}:"
+FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
+
+SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=http;branch=${BRANCH} \
+	file://defconfig"
+
+PATCHES_OVER_PSP = " \
+	file://0001-f_rndis-HACK-around-undefined-variables.patch \
+	file://0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
+	file://0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch \
+	file://0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch \
+	file://0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
+	file://0006-more-beaglebone-merges.patch \
+	file://0007-beaglebone-disable-tsadc.patch \
+	file://0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch \
+	file://0009-tscadc-Add-board-file-mfd-support-fix-warning.patch \
+	file://0010-AM335X-init-tsc-bone-style-for-new-boards.patch \
+	file://0011-tscadc-make-stepconfig-channel-configurable.patch \
+	file://0012-tscadc-Trigger-through-sysfs.patch \
+	file://0013-meta-ti-Remove-debug-messages-for-meta-ti.patch \
+	file://0014-tscadc-switch-to-polling-instead-of-interrupts.patch \
+	file://0015-beaglebone-fix-ADC-init.patch \
+"
+
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
+SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
-- 
1.7.2.5


