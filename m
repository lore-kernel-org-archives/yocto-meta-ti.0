Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CB12E0044D
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:47 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so1779139wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.201.105 with SMTP id a83mr7046103weo.38.1328815306910;
	Thu, 09 Feb 2012 11:21:46 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y6sm8664191wix.10.2012.02.09.11.21.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:24 +0100
Message-Id: <1328815284-26086-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
References: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkpJNl5YtyeWQ9OF5cAEOD+GwuYmbKjNr4TTHxcCme1hJdqAAUMzkjr0R920z17Xd1mlND8
Subject: [PATCH 6/6] linux-ti33x-psp 3.2: rebase patches onto latest v3.2-staging branch
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:48 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-f_rndis-HACK-around-undefined-variables.patch} |    6 +-
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |   30 -------
 ...-da8xx-fb-add-DVI-support-for-beaglebone.patch} |    6 +-
 ...ebase-everything-onto-3.2-WARNING-MEGAPA.patch} |   77 +++++++++--------
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |   92 --------------------
 ...ges.patch => 0005-more-beaglebone-merges.patch} |    6 +-
 ...c.patch => 0006-beaglebone-disable-tsadc.patch} |    6 +-
 ...eneral-purpose-mode-untested-with-touchs.patch} |    9 +-
 ...c-Add-board-file-mfd-support-fix-warning.patch} |    6 +-
 ...M335X-init-tsc-bone-style-for-new-boards.patch} |    6 +-
 ...adc-make-stepconfig-channel-configurable.patch} |    6 +-
 ...tch => 0011-tscadc-Trigger-through-sysfs.patch} |    6 +-
 ...eta-ti-Remove-debug-messages-for-meta-ti.patch} |    6 +-
 ...-switch-to-polling-instead-of-interrupts.patch} |    6 +-
 ...it.patch => 0014-beaglebone-fix-ADC-init.patch} |    6 +-
 ...1A.patch => 0015-AM335x-MUX-add-ehrpwm1A.patch} |    8 +-
 ...nable-PWM-for-lcd-backlight-backlight-is.patch} |   11 ++-
 ...et-dto-to-max-value-of-14-to-avoid-SD-Ca.patch} |    7 +-
 ...et-default-brightness-to-50-for-pwm-back.patch} |    7 +-
 ...-framebuffer-driver-supporting-Adafruit-.patch} |    7 +-
 ...20-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch} |    6 +-
 ...dd-support-for-Towertech-TT3201-CAN-cape.patch} |   32 ++++---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   46 +++++-----
 23 files changed, 146 insertions(+), 252 deletions(-)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0001-f_rndis-HACK-around-undefined-variables.patch => 0002-f_rndis-HACK-around-undefined-variables.patch} (86%)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0002-da8xx-fb-add-DVI-support-for-beaglebone.patch => 0003-da8xx-fb-add-DVI-support-for-beaglebone.patch} (86%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch => 0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch} (90%)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0006-more-beaglebone-merges.patch => 0005-more-beaglebone-merges.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0007-beaglebone-disable-tsadc.patch => 0006-beaglebone-disable-tsadc.patch} (87%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch => 0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch} (98%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0009-tscadc-Add-board-file-mfd-support-fix-warning.patch => 0008-tscadc-Add-board-file-mfd-support-fix-warning.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0010-AM335X-init-tsc-bone-style-for-new-boards.patch => 0009-AM335X-init-tsc-bone-style-for-new-boards.patch} (85%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0011-tscadc-make-stepconfig-channel-configurable.patch => 0010-tscadc-make-stepconfig-channel-configurable.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0012-tscadc-Trigger-through-sysfs.patch => 0011-tscadc-Trigger-through-sysfs.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0013-meta-ti-Remove-debug-messages-for-meta-ti.patch => 0012-meta-ti-Remove-debug-messages-for-meta-ti.patch} (88%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0014-tscadc-switch-to-polling-instead-of-interrupts.patch => 0013-tscadc-switch-to-polling-instead-of-interrupts.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0015-beaglebone-fix-ADC-init.patch => 0014-beaglebone-fix-ADC-init.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0016-AM335x-MUX-add-ehrpwm1A.patch => 0015-AM335x-MUX-add-ehrpwm1A.patch} (83%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0017-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch => 0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0018-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch => 0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch} (84%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch => 0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch} (83%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch => 0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch} (98%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch => 0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/{0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch => 0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch} (91%)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-f_rndis-HACK-around-undefined-variables.patch
similarity index 86%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0002-f_rndis-HACK-around-undefined-variables.patch
index ce08a5d..997d74b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-f_rndis-HACK-around-undefined-variables.patch
@@ -1,7 +1,7 @@
-From b3f548e71f6b8b568e1b683b1585406c942d1d3d Mon Sep 17 00:00:00 2001
+From ce48c5fa02f48ba304a28209fef934faa99d81f0 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/21] f_rndis: HACK around undefined variables
+Subject: [PATCH 02/21] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
deleted file mode 100644
index bbcb03b..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3a58d6b8a90793dd793265b09219871b53aaf63a Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 31 Jan 2012 10:21:32 +0100
-Subject: [PATCH 03/21] arm:omap:mux33xx: Add i2c2 pin mux
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/mux33xx.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 81a657e..36bb10a 100644
---- a/arch/arm/mach-omap2/mux33xx.c
-+++ b/arch/arm/mach-omap2/mux33xx.c
-@@ -312,10 +312,10 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
- 		"uart0_txd", "spi1_cs1", "d_can0_rx", NULL,
- 		NULL, NULL, NULL, "gpio1_11"),
- 	_AM33XX_MUXENTRY(UART1_CTSN, 0,
--		"uart1_ctsn", NULL, NULL, NULL,
-+		"uart1_ctsn", NULL, "d_can0_tx", "i2c2_sda",
- 		"spi1_cs0", NULL, NULL, "gpio0_12"),
- 	_AM33XX_MUXENTRY(UART1_RTSN, 0,
--		"uart1_rtsn", NULL, NULL, NULL,
-+		"uart1_rtsn", NULL, "d_can0_rx", "i2c2_scl",
- 		"spi1_cs1", NULL, NULL, "gpio0_13"),
- 	_AM33XX_MUXENTRY(UART1_RXD, 0,
- 		"uart1_rxd", "mmc1_sdwp", NULL, NULL,
--- 
-1.7.2.5
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-da8xx-fb-add-DVI-support-for-beaglebone.patch
similarity index 86%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0003-da8xx-fb-add-DVI-support-for-beaglebone.patch
index c6a63cc..a7e7486 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,7 +1,7 @@
-From 72c2e6a521c288a0620f5ec7420f27899d1f519d Mon Sep 17 00:00:00 2001
+From 1030700d88f2f55dc6116d8112e31df49201c56d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/21] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 03/21] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -34,5 +34,5 @@ index 85eda33..dea8936 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index ab8b39a..3519968 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,14 +1,15 @@
-From 788e842835e3ecb2d218ab11381e9c9dea4fa91c Mon Sep 17 00:00:00 2001
+From 8ec756a80947ee8bb0f24e4016d594f8eb6c2896 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 05/21] beaglebone: rebase everything onto 3.2 - WARNING MEGAPATCH
+Subject: [PATCH 04/21] beaglebone: rebase everything onto 3.2 - WARNING
+ MEGAPATCH
 
 ---
- arch/arm/mach-omap2/board-am335xevm.c |  429 ++++++++++++++++++++++++++++++++-
- 1 files changed, 427 insertions(+), 2 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |  425 ++++++++++++++++++++++++++++++++-
+ 1 files changed, 414 insertions(+), 11 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 4c09cc9..e0c20c5 100644
+index 8aa7e10..e0c20c5 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
 @@ -19,6 +19,7 @@
@@ -225,22 +226,19 @@ index 4c09cc9..e0c20c5 100644
  	{"vrefp.vrefp",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{"vrefn.vrefn",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{NULL, 0},
-@@ -541,6 +718,14 @@ static struct pinmux_config i2c1_pin_mux[] = {
+@@ -543,9 +720,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
+ 
+ static struct pinmux_config i2c2_pin_mux[] = {
+ 	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
+-					AM33XX_PULL_UP | AM33XX_INPUT_EN},
++					AM33XX_PIN_INPUT_PULLUP},
+ 	{"uart1_rtsn.i2c2_scl",   OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
+-					AM33XX_PULL_UP | AM33XX_INPUT_EN},
++					AM33XX_PIN_INPUT_PULLUP},
  	{NULL, 0},
  };
  
-+static struct pinmux_config i2c2_pin_mux[] = {
-+	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
-+					AM33XX_PIN_INPUT_PULLUP},
-+	{"uart1_rtsn.i2c2_scl",   OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
-+					AM33XX_PIN_INPUT_PULLUP},
-+	{NULL, 0},
-+};
-+
- /* Module pin mux for mcasp1 */
- static struct pinmux_config mcasp1_pin_mux[] = {
- 	{"mii1_crs.mcasp1_aclkx", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
-@@ -815,6 +1000,64 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -823,6 +1000,64 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -305,7 +303,7 @@ index 4c09cc9..e0c20c5 100644
  /* Module pin mux for eCAP0 */
  static struct pinmux_config ecap0_pin_mux[] = {
  	{"ecap0_in_pwm0_out.ecap0_in_pwm0_out",
-@@ -924,6 +1167,51 @@ static void lcdc_init(int evm_id, int profile)
+@@ -932,6 +1167,51 @@ static void lcdc_init(int evm_id, int profile)
  	return;
  }
  
@@ -357,7 +355,7 @@ index 4c09cc9..e0c20c5 100644
  static void tsc_init(int evm_id, int profile)
  {
  	int err;
-@@ -931,16 +1219,48 @@ static void tsc_init(int evm_id, int profile)
+@@ -939,16 +1219,48 @@ static void tsc_init(int evm_id, int profile)
  	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
  		am335x_touchscreen_data.analog_input = 1;
  		pr_info("TSC connected to beta GP EVM\n");
@@ -407,7 +405,7 @@ index 4c09cc9..e0c20c5 100644
  static void rgmii1_init(int evm_id, int profile)
  {
  	setup_pin_mux(rgmii1_pin_mux);
-@@ -1350,6 +1670,106 @@ static void i2c1_init(int evm_id, int profile)
+@@ -1358,18 +1670,106 @@ static void i2c1_init(int evm_id, int profile)
  	return;
  }
  
@@ -443,7 +441,8 @@ index 4c09cc9..e0c20c5 100644
 +	pr_info("BeagleBone cape: %s %s\n", manufacturer, name);
 +	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
 +	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
-+
+ 
+-static struct i2c_board_info am335x_i2c_boardinfo2[] = {
 +	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 5)) {
 +			pr_info("BeagleBone cape: initializing DVI cape\n");
 +			dvi_init(0,0);
@@ -500,41 +499,47 @@ index 4c09cc9..e0c20c5 100644
 +                I2C_BOARD_INFO("24c256", 0x57),
 +                .platform_data  = &cape_eeprom_info,
 +        },
-+};
-+
-+static void i2c2_init(int evm_id, int profile)
-+{
+ };
+ 
+ static void i2c2_init(int evm_id, int profile)
+ {
+-	setup_pin_mux(i2c2_pin_mux);
+-	omap_register_i2c_bus(3, 100, am335x_i2c_boardinfo2,
+-			ARRAY_SIZE(am335x_i2c_boardinfo2));
+-	return;
 +        setup_pin_mux(i2c2_pin_mux);
 +        omap_register_i2c_bus(3, 100, cape_i2c_boardinfo,
 +                        ARRAY_SIZE(cape_i2c_boardinfo));
 +        return;
-+}
-+
+ }
+ 
 +
  /* Setup McASP 1 */
  static void mcasp1_init(int evm_id, int profile)
  {
-@@ -1703,7 +2123,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -1723,8 +2123,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{rmii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
-+	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
- 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
 +	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
  	{NULL, 0, 0},
  };
  
-@@ -1713,7 +2135,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -1734,8 +2135,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
-+	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
- 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
 +	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
  	{NULL, 0, 0},
  };
  
-@@ -1800,6 +2224,7 @@ static void setup_beaglebone_old(void)
+@@ -1822,6 +2224,7 @@ static void setup_beaglebone_old(void)
  static void setup_beaglebone(void)
  {
  	pr_info("The board is a AM335x Beaglebone.\n");
@@ -543,5 +548,5 @@ index 4c09cc9..e0c20c5 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
deleted file mode 100644
index bb2871b..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 4ed424e6817669025702b1ea5bfa6b798a811b6d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 16 Nov 2011 07:23:37 -0600
-Subject: [PATCH 04/21] omap:hwmod:33xx: Add support for third i2c bus
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/omap_hwmod_33xx_data.c |   54 ++++++++++++++++++++++++++++
- 1 files changed, 54 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-index 9b15ffe..f9b91fa 100644
---- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
-@@ -62,6 +62,7 @@ static struct omap_hwmod am33xx_gpio2_hwmod;
- static struct omap_hwmod am33xx_gpio3_hwmod;
- static struct omap_hwmod am33xx_i2c1_hwmod;
- static struct omap_hwmod am33xx_i2c2_hwmod;
-+static struct omap_hwmod am33xx_i2c3_hwmod;
- static struct omap_hwmod am33xx_usbss_hwmod;
- static struct omap_hwmod am33xx_mmc0_hwmod;
- static struct omap_hwmod am33xx_mmc1_hwmod;
-@@ -1084,6 +1085,58 @@ static struct omap_hwmod am33xx_i2c2_hwmod = {
- 	.class		= &i2c_class,
- };
- 
-+/* i2c3 */
-+/* l4 per -> i2c3 */
-+static struct omap_hwmod_addr_space am33xx_i2c3_addr_space[] = {
-+	{
-+		.pa_start	= AM33XX_I2C2_BASE,
-+		.pa_end		= AM33XX_I2C2_BASE + SZ_4K - 1,
-+		.flags		= ADDR_TYPE_RT
-+	},
-+	{ }
-+};
-+
-+static struct omap_hwmod_ocp_if am335_l4_per_i2c3 = {
-+	.master		= &am33xx_l4per_hwmod,
-+	.slave		= &am33xx_i2c3_hwmod,
-+	.addr		= am33xx_i2c3_addr_space,
-+	.user		= OCP_USER_MPU,
-+};
-+
-+static struct omap_hwmod_irq_info i2c3_mpu_irqs[] = {
-+	{ .irq = AM33XX_IRQ_MSHSI2COCP2 },
-+	{ .irq = -1 }
-+};
-+
-+static struct omap_hwmod_dma_info i2c3_edma_reqs[] = {
-+	{ .name = "tx", .dma_req = 0, },
-+	{ .name = "rx", .dma_req = 0, },
-+	{ .dma_req = -1 }
-+};
-+
-+static struct omap_hwmod_ocp_if *am33xx_i2c3_slaves[] = {
-+	&am335_l4_per_i2c3,
-+};
-+
-+static struct omap_hwmod am33xx_i2c3_hwmod = {
-+	.name		= "i2c3",
-+	.mpu_irqs	= i2c3_mpu_irqs,
-+	.sdma_reqs	= i2c3_edma_reqs,
-+	.main_clk	= "i2c3_fck",
-+	.clkdm_name	= "l4ls_clkdm",
-+	.prcm		= {
-+		.omap4 = {
-+			.clkctrl_offs	= AM33XX_CM_PER_I2C2_CLKCTRL_OFFSET,
-+			.modulemode	= MODULEMODE_SWCTRL,
-+		},
-+	},
-+	.flags		= HWMOD_16BIT_REG,
-+	.dev_attr	= &i2c_dev_attr,
-+	.slaves		= am33xx_i2c3_slaves,
-+	.slaves_cnt	= ARRAY_SIZE(am33xx_i2c3_slaves),
-+	.class		= &i2c_class,
-+};
-+
- /* 'icss' class */
- static struct omap_hwmod_class am33xx_icss_hwmod_class = {
- 	.name = "icss",
-@@ -3001,6 +3054,7 @@ static __initdata struct omap_hwmod *am33xx_hwmods[] = {
- 	/* i2c class */
- 	&am33xx_i2c1_hwmod,
- 	&am33xx_i2c2_hwmod,
-+	&am33xx_i2c3_hwmod,
- 	/* icss class */
- 	&am33xx_icss_hwmod,
- 	/* ieee5000 class */
--- 
-1.7.2.5
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-more-beaglebone-merges.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0005-more-beaglebone-merges.patch
index 04f9e2b..80ec68b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-more-beaglebone-merges.patch
@@ -1,7 +1,7 @@
-From 2e5a948c8a5bcd6ac904ec5e6feb44eaa8085dce Mon Sep 17 00:00:00 2001
+From 723b8183fe5fbd584eabed3e88557ac7f76f2703 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 06/21] more beaglebone merges
+Subject: [PATCH 05/21] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -121,5 +121,5 @@ index e0c20c5..177ab9e 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-beaglebone-disable-tsadc.patch
similarity index 87%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0006-beaglebone-disable-tsadc.patch
index af37d28..6a0d419 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-beaglebone-disable-tsadc.patch
@@ -1,7 +1,7 @@
-From 418ca67a6e1bc3009b63587b0d65d064fa9c6e1a Mon Sep 17 00:00:00 2001
+From b424eb3338204b799bd49a490c90d0ebbe7b77cb Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 07/21] beaglebone: disable tsadc
+Subject: [PATCH 06/21] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 177ab9e..87ccf14 100644
  
  static struct platform_device tsc_device = {
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
similarity index 98%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index bff0cbf..ede104c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,8 @@
-From 0a97d120ca4b129c763c420b4c85e71f68286704 Mon Sep 17 00:00:00 2001
+From c733e3990004292c4e144c78a77bd279b7e140be Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 08/21] tscadc: Add general purpose mode, untested with touchscreen functionality
+Subject: [PATCH 07/21] tscadc: Add general purpose mode, untested with
+ touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -38,7 +39,7 @@ index 87ccf14..c7bb091 100644
  };
  
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 36bb10a..e4cd407 100644
+index 8df8fa9..14ef129 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
 @@ -584,6 +584,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
@@ -406,5 +407,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-board-file-mfd-support-fix-warning.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-board-file-mfd-support-fix-warning.patch
index 3cfb733..78b6fa6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
-From 7858340efc39a1b098e3d291ab8bb1ba553e08da Mon Sep 17 00:00:00 2001
+From 4c5e21f822dc058eb63b45300037759f485df6b6 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 09/21] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 08/21] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -40,5 +40,5 @@ index 699503d..f813564 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-AM335X-init-tsc-bone-style-for-new-boards.patch
similarity index 85%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0009-AM335X-init-tsc-bone-style-for-new-boards.patch
index 72f0290..04ed3b9 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,7 +1,7 @@
-From a43c57a49ba30d4bb6087a6bb4f6200c785905c5 Mon Sep 17 00:00:00 2001
+From 79d0c41d98e7121ff7278b79ff57b0de8a0c9377 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 10/21] AM335X: init tsc bone style for new boards
+Subject: [PATCH 09/21] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -22,5 +22,5 @@ index 17705b3..ac4f78f 100644
  };
  
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-tscadc-make-stepconfig-channel-configurable.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0010-tscadc-make-stepconfig-channel-configurable.patch
index bf5d08f..ed243c7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,7 +1,7 @@
-From 6fdcca153f70cad5438d682987d6eae16aeb2ea7 Mon Sep 17 00:00:00 2001
+From 1588794b88cf7de787433f23d1fff8053a163f74 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 11/21] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 10/21] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -42,5 +42,5 @@ index f813564..0b91bdc 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-Trigger-through-sysfs.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-Trigger-through-sysfs.patch
index 4daca0a..dad8caa 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
-From aa9aa700a94ecef9726c46346a9503d473894f75 Mon Sep 17 00:00:00 2001
+From 0b3d50a459b9414aa57739f8595ccfb7808f2db4 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 12/21] tscadc: Trigger through sysfs
+Subject: [PATCH 11/21] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -143,5 +143,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-meta-ti-Remove-debug-messages-for-meta-ti.patch
similarity index 88%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0012-meta-ti-Remove-debug-messages-for-meta-ti.patch
index 78691be..4890adf 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,7 +1,7 @@
-From a0828509fefd049bc014e850366f6e39196e4e2f Mon Sep 17 00:00:00 2001
+From 51a1a0fe527d34be13d788bc50063127b9bcbe25 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 13/21] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 12/21] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -30,5 +30,5 @@ index a74d9ba..1f9cbf5 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-tscadc-switch-to-polling-instead-of-interrupts.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0013-tscadc-switch-to-polling-instead-of-interrupts.patch
index 38cc414..2dd7386 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,7 +1,7 @@
-From 55f39df40bf9efe2576f39e8c0bd0e1390145b46 Mon Sep 17 00:00:00 2001
+From 888913aadadaccf759c4d1fc7c329243764012f1 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 14/21] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 13/21] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -50,5 +50,5 @@ index 1f9cbf5..8e2a994 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-beaglebone-fix-ADC-init.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0014-beaglebone-fix-ADC-init.patch
index 47f89db..cf3bee6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-beaglebone-fix-ADC-init.patch
@@ -1,7 +1,7 @@
-From baaf9182087ab02092c028f9a7d0c8a89c9cd4e2 Mon Sep 17 00:00:00 2001
+From 7bb1a67ac428c3a5b13411972bb74c0071eaa0d1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 15/21] beaglebone: fix ADC init
+Subject: [PATCH 14/21] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -43,5 +43,5 @@ index ac4f78f..177ab9e 100644
  };
  
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0016-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-AM335x-MUX-add-ehrpwm1A.patch
similarity index 83%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0016-AM335x-MUX-add-ehrpwm1A.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0015-AM335x-MUX-add-ehrpwm1A.patch
index fca0fdf..24f5658 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0016-AM335x-MUX-add-ehrpwm1A.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-AM335x-MUX-add-ehrpwm1A.patch
@@ -1,7 +1,7 @@
-From 8fc518e3bc8d60b01f1d94942bd733cebb9a0a0e Mon Sep 17 00:00:00 2001
+From a6b5dbf7cd70d996f7d8a058633efc69bc5248e1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 16:49:52 +0100
-Subject: [PATCH 16/21] AM335x: MUX: add ehrpwm1A
+Subject: [PATCH 15/21] AM335x: MUX: add ehrpwm1A
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index e4cd407..0a06241 100644
+index 14ef129..fcb81ec 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
 @@ -85,7 +85,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
@@ -22,5 +22,5 @@ index e4cd407..0a06241 100644
  		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
  		NULL, NULL, NULL, "gpio1_19"),
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0017-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
index b21c0ed..f3c93f4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -1,7 +1,8 @@
-From cf8d37c600dbe0d13e55874db46d385db435d6dc Mon Sep 17 00:00:00 2001
+From 69cea1f60bd1b22f382093feabf7fdec69f10f70 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 17:02:10 +0100
-Subject: [PATCH 17/21] beaglebone: enable PWM for lcd backlight <- backlight is inverted
+Subject: [PATCH 16/21] beaglebone: enable PWM for lcd backlight <- backlight
+ is inverted
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -137,10 +138,10 @@ index 177ab9e..6a77194 100644
  	}
  	
 diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
-index 4b137e9..33291ae 100644
+index 198df7b..8cd2523 100644
 --- a/arch/arm/mach-omap2/devices.c
 +++ b/arch/arm/mach-omap2/devices.c
-@@ -1277,6 +1277,19 @@ void register_ehrpwm(int max_freq)
+@@ -1278,6 +1278,19 @@ void register_ehrpwm(int max_freq)
  	platform_device_register(&am335x_epwm2_device);
  }
  
@@ -172,5 +173,5 @@ index e086839..5161eb4 100644
  
  #endif
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
similarity index 84%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0018-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
index edd293e..786ed1c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -1,7 +1,8 @@
-From 05698cd9793d58226c5d5a986537aaf906433851 Mon Sep 17 00:00:00 2001
+From 1e36791b2e956275e4165928fb0c65908029a693 Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
 Date: Mon, 18 Jul 2011 23:13:41 -0500
-Subject: [PATCH 18/21] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
+Subject: [PATCH 17/21] omap_hsmmc: Set dto to max value of 14 to avoid SD
+ Card timeouts
 
 This fixes MMC errors due to timeouts on certain SD Cards following suggestions
 to set dto to 14 by Jason Kridner and Steven Kipisz
@@ -29,5 +30,5 @@ index 703013c..554237f 100644
  	reg |= dto << DTO_SHIFT;
  	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
similarity index 83%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
index 878bc22..39052cd 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -1,7 +1,8 @@
-From 29f8dc540ea4b5ad963be07555d6ce9906b54dd4 Mon Sep 17 00:00:00 2001
+From 27e32a289edc6da85dbaa94926f3bbdd55185340 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 1 Feb 2012 14:10:38 +0100
-Subject: [PATCH 19/21] beaglebone: set default brightness to 50% for pwm backlights
+Subject: [PATCH 18/21] beaglebone: set default brightness to 50% for pwm
+ backlights
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -22,5 +23,5 @@ index 6a77194..c31c0aa 100644
  
  #define PWM_DEVICE_ID   "ecap.0"
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
similarity index 98%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
index be807d9..e93bed3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -1,7 +1,8 @@
-From 4f8bf35db23976bbc4705ba57ae9e0df4b8442ab Mon Sep 17 00:00:00 2001
+From aba244518f8afad62e0113cc7f08fbf27d7a2c34 Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Mon, 21 Nov 2011 12:55:23 -0500
-Subject: [PATCH 20/21] st7735fb: WIP framebuffer driver supporting Adafruit 1.8" SPI LCD
+Subject: [PATCH 19/21] st7735fb: WIP framebuffer driver supporting Adafruit
+ 1.8" SPI LCD
 
 Signed-off-by: Matt Porter <mporter@ti.com>
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -663,5 +664,5 @@ index 0000000..250f036
 +
 +
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
index fa4aaa3..568b241 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
@@ -1,7 +1,7 @@
-From 4428744c852ed5f9d5a7dfa9c5d0a783e6134582 Mon Sep 17 00:00:00 2001
+From b3a428ac863b594fc5538d94e6d706b230a29da7 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 7 Feb 2012 11:01:13 +0100
-Subject: [PATCH 21/21] beaglebone: use P8_6 (gpio1_3) as w1 bus
+Subject: [PATCH 20/21] beaglebone: use P8_6 (gpio1_3) as w1 bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -79,5 +79,5 @@ index c31c0aa..538466d 100644
  };
  
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
index 086ace9..2c1c40c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -1,15 +1,15 @@
-From af31b4d5a2d52284b169633b9a601c39c7300300 Mon Sep 17 00:00:00 2001
+From 7a669d97dae9aa8b7404a9dbe6d559c422971566 Mon Sep 17 00:00:00 2001
 From: Alessandro Zummo <a.zummo@towertech.it>
 Date: Thu, 9 Feb 2012 12:46:52 +0100
-Subject: [PATCH 22/22] beaglebone: add support for Towertech TT3201 CAN cape
+Subject: [PATCH 21/21] beaglebone: add support for Towertech TT3201 CAN cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   54 ++++++++++++++++++++++++++++++++-
- arch/arm/mach-omap2/mux33xx.c         |    4 +-
+ arch/arm/mach-omap2/mux33xx.c         |    8 ++--
  drivers/net/can/dev.c                 |    8 ++--
  drivers/net/can/mcp251x.c             |   47 ++++++++++++++++++++++------
- 4 files changed, 96 insertions(+), 17 deletions(-)
+ 4 files changed, 98 insertions(+), 19 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 538466d..36efca1 100644
@@ -98,19 +98,27 @@ index 538466d..36efca1 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 0a06241..e4f3bd9 100644
+index fcb81ec..2de76e3 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
-@@ -318,10 +318,10 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
- 		"uart1_rtsn", NULL, "d_can0_rx", "i2c2_scl",
+@@ -312,16 +312,16 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"uart0_txd", "spi1_cs1", "d_can0_rx", "i2c2_scl",
+ 		NULL, NULL, NULL, "gpio1_11"),
+ 	_AM33XX_MUXENTRY(UART1_CTSN, 0,
+-		"uart1_ctsn", NULL, NULL, "i2c2_sda",
++		"uart1_ctsn", NULL, "d_can0_tx", "i2c2_sda",
+ 		"spi1_cs0", NULL, NULL, "gpio0_12"),
+ 	_AM33XX_MUXENTRY(UART1_RTSN, 0,
+-		"uart1_rtsn", NULL, NULL, "i2c2_scl",
++		"uart1_rtsn", NULL, "d_can0_rx", "i2c2_scl",
  		"spi1_cs1", NULL, NULL, "gpio0_13"),
  	_AM33XX_MUXENTRY(UART1_RXD, 0,
--		"uart1_rxd", "mmc1_sdwp", NULL, NULL,
-+		"uart1_rxd", "mmc1_sdwp", "d_can1_tx", NULL,
+-		"uart1_rxd", "mmc1_sdwp", NULL, "i2c1_sda",
++		"uart1_rxd", "mmc1_sdwp", "d_can1_tx", "i2c1_sda",
  		NULL, "pr1_uart0_rxd_mux1", NULL, "gpio0_14"),
  	_AM33XX_MUXENTRY(UART1_TXD, 0,
--		"uart1_txd", "mmc2_sdwp", NULL, NULL,
-+		"uart1_txd", "mmc2_sdwp", "d_can1_rx", NULL,
+-		"uart1_txd", "mmc2_sdwp", NULL, "i2c1_scl",
++		"uart1_txd", "mmc2_sdwp", "d_can1_rx", "i2c1_scl",
  		NULL, "pr1_uart0_txd_mux1", NULL, "gpio0_15"),
  	_AM33XX_MUXENTRY(I2C0_SDA, 0,
  		"i2c0_sda", NULL, NULL, NULL,
@@ -308,5 +316,5 @@ index 330140e..b3e231c 100644
  	}
  error_probe:
 -- 
-1.7.2.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 682fa8c..a25d503 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -10,8 +10,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "83d907e1b05dabc44f3bb64532d7b58d059a14c0"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+SRCREV = "21ef5e1fa530eb8f23bfe18650e3915d7c291ca9"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -25,28 +25,26 @@ SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=http;b
 	file://defconfig"
 
 PATCHES_OVER_PSP = " \
-	file://0001-f_rndis-HACK-around-undefined-variables.patch \
-	file://0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
-	file://0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch \
-	file://0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch \
-	file://0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-	file://0006-more-beaglebone-merges.patch \
-	file://0007-beaglebone-disable-tsadc.patch \
-	file://0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch \
-	file://0009-tscadc-Add-board-file-mfd-support-fix-warning.patch \
-	file://0010-AM335X-init-tsc-bone-style-for-new-boards.patch \
-	file://0011-tscadc-make-stepconfig-channel-configurable.patch \
-	file://0012-tscadc-Trigger-through-sysfs.patch \
-	file://0013-meta-ti-Remove-debug-messages-for-meta-ti.patch \
-	file://0014-tscadc-switch-to-polling-instead-of-interrupts.patch \
-	file://0015-beaglebone-fix-ADC-init.patch \
-	file://0016-AM335x-MUX-add-ehrpwm1A.patch \
-	file://0017-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch \
-	file://0018-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
-	file://0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch \
-	file://0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
-	file://0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
-	file://0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
+	file://0002-f_rndis-HACK-around-undefined-variables.patch \
+	file://0003-da8xx-fb-add-DVI-support-for-beaglebone.patch \
+	file://0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
+	file://0005-more-beaglebone-merges.patch \
+	file://0006-beaglebone-disable-tsadc.patch \
+	file://0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch \
+	file://0008-tscadc-Add-board-file-mfd-support-fix-warning.patch \
+	file://0009-AM335X-init-tsc-bone-style-for-new-boards.patch \
+	file://0010-tscadc-make-stepconfig-channel-configurable.patch \
+	file://0011-tscadc-Trigger-through-sysfs.patch \
+	file://0012-meta-ti-Remove-debug-messages-for-meta-ti.patch \
+	file://0013-tscadc-switch-to-polling-instead-of-interrupts.patch \
+	file://0014-beaglebone-fix-ADC-init.patch \
+	file://0015-AM335x-MUX-add-ehrpwm1A.patch \
+	file://0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch \
+	file://0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
+	file://0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch \
+	file://0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
+	file://0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
+	file://0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
 "
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.2.5


