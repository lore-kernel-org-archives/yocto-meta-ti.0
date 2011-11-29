Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00088E0030A
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 20:02:00 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAT41xHe018666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 22:01:59 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAT41xIE024606
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 22:01:59 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAT41wJi006847
	for <meta-ti@yoctoproject.org>; Mon, 28 Nov 2011 22:01:58 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 28 Nov 2011 22:01:58 -0600
Received: from localhost.localdomain (h0-178.vpn.ti.com [172.24.0.178])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAT41vYX011015;
	Mon, 28 Nov 2011 22:01:58 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Nov 2011 22:01:56 -0600
Message-ID: <1322539316-26560-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, mporter@ti.com, k-kooi@ti.com
Subject: [PATCH] linux-ti33x-psp 3.1: ADC support for beaglebone
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
X-List-Received-Date: Tue, 29 Nov 2011 04:02:01 -0000
Content-Type: text/plain

First 3 patches are cherry picks from PSP.
Next 6 add support for gen purpose adc, MFD support, sysfs triggering etc.

Currently:
cat /sys/bus/platform/tsc/ain* will trigger sampling
Output will goto kernel logs.
This is due to a small bug preventing synchronizing the sysfs readers
with the adc interrupt.

TODO list:
1. IIO driver support
2. Sysfs readers synchronizing with interrupt handler

The patchset will be updated continuously.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch |  219 +++++++++
 ...M-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch |  122 +++++
 ...d-support-for-pressure-measurement-on-TSC.patch |  219 +++++++++
 ...general-purpose-mode-untested-with-touchs.patch |  463 ++++++++++++++++++++
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   86 ++++
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   26 ++
 ...cadc-make-stepconfig-channel-configurable.patch |   46 ++
 .../adc/0008-tscadc-Trigger-through-sysfs.patch    |  151 +++++++
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   34 ++
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |   11 +-
 10 files changed, 1376 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0001-AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0002-ARM-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0003-AM335x-Add-support-for-pressure-measurement-on-TSC.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0004-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0005-tscadc-Add-board-file-mfd-support-fix-warning.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0006-AM335X-init-tsc-bone-style-for-new-boards.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0007-tscadc-make-stepconfig-channel-configurable.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0008-tscadc-Trigger-through-sysfs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0001-AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0001-AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch
new file mode 100644
index 0000000..b4b14b8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0001-AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch
@@ -0,0 +1,219 @@
+From 3c22386bee665fb13aeb1f28016a9e77fc6c2dc2 Mon Sep 17 00:00:00 2001
+From: Patil, Rachna <rachna@ti.com>
+Date: Fri, 11 Nov 2011 18:03:27 +0530
+Subject: [PATCH 1/9] AM335x: Add support for TSC on Beta GP EVM.
+
+AN1 and AN2(analog inputs to analog front end) were swapped
+on alpha EVM's. This change is IP dependent, hence changes are
+made in the driver to support the beta EVM.
+
+Signed-off-by: Patil, Rachna <rachna@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    8 +++
+ drivers/input/touchscreen/ti_tscadc.c |   83 ++++++++++++++++++++++-----------
+ include/linux/input/ti_tscadc.h       |   10 ++++
+ 3 files changed, 73 insertions(+), 28 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 590c4ca..9ec56c6 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -912,6 +912,14 @@ static void dvi_init(int evm_id, int profile)
+ static void tsc_init(int evm_id, int profile)
+ {
+ 	int err;
++
++	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
++		am335x_touchscreen_data.analog_input = 1;
++		pr_info("TSC connected to beta GP EVM\n");
++	} else {
++		am335x_touchscreen_data.analog_input = 0;
++		pr_info("TSC connected to alpha GP EVM\n");
++	}
+ 	setup_pin_mux(tsc_pin_mux);
+ 	err = platform_device_register(&tsc_device);
+ 	if (err)
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 1f4db8d..021db7f 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -65,13 +65,16 @@
+ #define TSCADC_STEPCONFIG_RFP		(1 << 12)
+ #define TSCADC_STEPCONFIG_INM		(1 << 18)
+ #define TSCADC_STEPCONFIG_INP_4		(1 << 19)
++#define TSCADC_STEPCONFIG_INP		(1 << 20)
+ #define TSCADC_STEPCONFIG_INP_5		(1 << 21)
+ #define TSCADC_STEPCONFIG_FIFO1		(1 << 26)
+ #define TSCADC_STEPCONFIG_IDLE_INP	(1 << 22)
+ #define TSCADC_STEPCONFIG_OPENDLY	0x018
+ #define TSCADC_STEPCONFIG_SAMPLEDLY	0x88
+-#define TSCADC_STEPCHARGE_INM		BIT(16)
+-#define TSCADC_STEPCHARGE_INP		BIT(20)
++#define TSCADC_STEPCHARGE_INM_SWAP     BIT(16)
++#define TSCADC_STEPCHARGE_INM          BIT(15)
++#define TSCADC_STEPCHARGE_INP_SWAP     BIT(20)
++#define TSCADC_STEPCHARGE_INP          BIT(19)
+ #define TSCADC_STEPCHARGE_RFM		(1 << 23)
+ #define TSCADC_STEPCHARGE_DELAY		0x1
+ #define TSCADC_CNTRLREG_TSCSSENB	BIT(0)
+@@ -94,6 +97,7 @@ unsigned int bckup_x = 0, bckup_y = 0;
+ struct tscadc {
+ 	struct input_dev	*input;
+ 	int			wires;
++	int			analog_input;
+ 	struct clk		*clk;
+ 	int			irq;
+ 	void __iomem		*tsc_base;
+@@ -121,21 +125,37 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+ 
+ 	stepconfigx = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-			TSCADC_STEPCONFIG_2SAMPLES_AVG | TSCADC_STEPCONFIG_XPP |
+-			TSCADC_STEPCONFIG_YPN;
++			TSCADC_STEPCONFIG_2SAMPLES_AVG | TSCADC_STEPCONFIG_XPP;
++
+ 	switch (ts_dev->wires) {
+ 	case 4:
+-		stepconfigx |= TSCADC_STEPCONFIG_INP_4;
++		if (ts_dev->analog_input == 0)
++			stepconfigx |= TSCADC_STEPCONFIG_INP_4 |
++				TSCADC_STEPCONFIG_YPN;
++		else
++			stepconfigx |= TSCADC_STEPCONFIG_INP |
++				TSCADC_STEPCONFIG_XNN;
+ 		break;
+ 	case 5:
+-		stepconfigx |= TSCADC_STEPCONFIG_YPP |
+-				TSCADC_STEPCONFIG_YNN |
++		stepconfigx |= TSCADC_STEPCONFIG_YNN |
+ 				TSCADC_STEPCONFIG_INP_5;
++		if (ts_dev->analog_input == 0)
++			stepconfigx |= TSCADC_STEPCONFIG_XNP |
++				TSCADC_STEPCONFIG_YPN;
++		else
++			stepconfigx |= TSCADC_STEPCONFIG_XNN |
++				TSCADC_STEPCONFIG_YPP;
+ 		break;
+ 	case 8:
+-		stepconfigx |= TSCADC_STEPCONFIG_INP_4;
++		if (ts_dev->analog_input == 0)
++			stepconfigx |= TSCADC_STEPCONFIG_INP_4 |
++				TSCADC_STEPCONFIG_YPN;
++		else
++			stepconfigx |= TSCADC_STEPCONFIG_INP |
++				TSCADC_STEPCONFIG_XNN;
+ 		break;
+ 	}
++
+ 	for (i = 1; i < 7; i++) {
+ 		tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG(i), stepconfigx);
+ 		tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY(i), delay);
+@@ -146,18 +166,28 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 			TSCADC_STEPCONFIG_INM | TSCADC_STEPCONFIG_FIFO1;
+ 	switch (ts_dev->wires) {
+ 	case 4:
+-		stepconfigy |= TSCADC_STEPCONFIG_XNP;
++		if (ts_dev->analog_input == 0)
++			stepconfigy |= TSCADC_STEPCONFIG_XNP;
++		else
++			stepconfigy |= TSCADC_STEPCONFIG_YPP;
+ 		break;
+ 	case 5:
+-		stepconfigy |= TSCADC_STEPCONFIG_XPP |
+-				TSCADC_STEPCONFIG_XNP |
+-				TSCADC_STEPCONFIG_YPN |
+-				TSCADC_STEPCONFIG_INP_5;
++		stepconfigy |= TSCADC_STEPCONFIG_XPP | TSCADC_STEPCONFIG_INP_5;
++		if (ts_dev->analog_input == 0)
++			stepconfigy |= TSCADC_STEPCONFIG_XNN |
++				TSCADC_STEPCONFIG_YPP;
++		else
++			stepconfigy |= TSCADC_STEPCONFIG_XNP |
++				TSCADC_STEPCONFIG_YPN;
+ 		break;
+ 	case 8:
+-		stepconfigy |= TSCADC_STEPCONFIG_XNP;
++		if (ts_dev->analog_input == 0)
++			stepconfigy |= TSCADC_STEPCONFIG_XNP;
++		else
++			stepconfigy |= TSCADC_STEPCONFIG_YPP;
+ 		break;
+ 	}
++
+ 	for (i = 7; i < 13; i++) {
+ 		tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG(i), stepconfigy);
+ 		tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY(i), delay);
+@@ -166,8 +196,12 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	chargeconfig = TSCADC_STEPCONFIG_XPP |
+ 			TSCADC_STEPCONFIG_YNN |
+ 			TSCADC_STEPCONFIG_RFP |
+-			TSCADC_STEPCHARGE_INM | TSCADC_STEPCHARGE_INP |
+ 			TSCADC_STEPCHARGE_RFM;
++	if (ts_dev->analog_input == 0)
++		chargeconfig |= TSCADC_STEPCHARGE_INM_SWAP |
++			TSCADC_STEPCHARGE_INP_SWAP;
++	else
++		chargeconfig |= TSCADC_STEPCHARGE_INM | TSCADC_STEPCHARGE_INP;
+ 	tscadc_writel(ts_dev, TSCADC_REG_CHARGECONFIG, chargeconfig);
+ 	tscadc_writel(ts_dev, TSCADC_REG_CHARGEDELAY, TSCADC_STEPCHARGE_DELAY);
+ 
+@@ -180,20 +214,12 @@ static void tsc_idle_config(struct tscadc *ts_config)
+ 	unsigned int	 idleconfig;
+ 
+ 	idleconfig = TSCADC_STEPCONFIG_YNN |
+-				TSCADC_STEPCONFIG_XNN |
+-				TSCADC_STEPCONFIG_INM;
++			TSCADC_STEPCONFIG_INM | TSCADC_STEPCONFIG_IDLE_INP;
++	if (ts_config->analog_input == 0)
++		idleconfig |= TSCADC_STEPCONFIG_XNN;
++	else
++		idleconfig |= TSCADC_STEPCONFIG_YPN;
+ 
+-	switch (ts_config->wires) {
+-	case 4:
+-		idleconfig |= TSCADC_STEPCONFIG_IDLE_INP;
+-		break;
+-	case 5:
+-		idleconfig |= TSCADC_STEPCONFIG_INP_5;
+-		break;
+-	case 8:
+-		idleconfig |= TSCADC_STEPCONFIG_INP_4;
+-		break;
+-	}
+ 	tscadc_writel(ts_config, TSCADC_REG_IDLECONFIG, idleconfig);
+ }
+ 
+@@ -376,6 +402,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 	tscadc_writel(ts_dev, TSCADC_REG_IRQWAKEUP, TSCADC_IRQWKUP_ENB);
+ 
+ 	ts_dev->wires = pdata->wires;
++	ts_dev->analog_input = pdata->analog_input;
+ 
+ 	/* Set the control register bits */
+ 	ctrl = TSCADC_CNTRLREG_STEPCONFIGWRT |
+diff --git a/include/linux/input/ti_tscadc.h b/include/linux/input/ti_tscadc.h
+index 29f87db..b9d9a46 100644
+--- a/include/linux/input/ti_tscadc.h
++++ b/include/linux/input/ti_tscadc.h
+@@ -3,8 +3,18 @@
+  * @wires:		Wires refer to application modes
+  *			i.e. 4/5/8 wire touchscreen support
+  *			on the platform
++ * @analog_input:	Analog inputs refer to the order in which the
++ *			connections are made to the AFE. If the connections
++ *			are as : XPUL = AN0,XNUR = AN1,YPLL = AN2,
++ *			YNLR = AN3, then this variable is set to 1.
++ *			Else if the connections are as :
++ *			XPUL = AN0,YPLL = AN1,XNUR = AN2,
++ *			YNLR = AN3, then set this variable to
++ *			0.
+  */
+ 
+ struct tsc_data {
+ 	int wires;
++	int analog_input;
++
+ };
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0002-ARM-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0002-ARM-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch
new file mode 100644
index 0000000..c7e4b78
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0002-ARM-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch
@@ -0,0 +1,122 @@
+From 98d0446f94a6f89016f5ed73cb6bc304075cceb6 Mon Sep 17 00:00:00 2001
+From: Patil, Rachna <rachna@ti.com>
+Date: Fri, 11 Nov 2011 13:09:51 +0530
+Subject: [PATCH 2/9] ARM: OMAP: AM335x: Add support for Beta GP EVM.
+
+This patch adds support for BETA EVM.
+BETA EVM is set as the default configuration.
+Since the peripherals were supported only in profile 0 for
+alpha EVM, It makes use of the exisiting GP EVM structure.
+
+Changes have been made to MMC and audio.
+
+Flag gp_evm_revision can be used to differentiate between the
+revisions of the GP EVM.
+
+Signed-off-by: Patil, Rachna <rachna@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   57 ++++++++++++---------------------
+ 1 files changed, 21 insertions(+), 36 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 9ec56c6..d6bf7b1 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -329,6 +329,11 @@ struct am335x_evm_eeprom_config {
+ static struct am335x_evm_eeprom_config config;
+ static bool daughter_brd_detected;
+ 
++#define GP_EVM_REV_IS_1_0A		0x1
++#define GP_EVM_REV_IS_1_1A		0x2
++#define GP_EVM_REV_IS_UNKNOWN		0xFF
++static unsigned int gp_evm_revision = GP_EVM_REV_IS_UNKNOWN;
++
+ #define EEPROM_MAC_ADDRESS_OFFSET	60 /* 4+8+4+12+32 */
+ #define EEPROM_NO_OF_MAC_ADDR		3
+ static char am335x_mac_addr[EEPROM_NO_OF_MAC_ADDR][ETH_ALEN];
+@@ -629,25 +634,8 @@ static struct pinmux_config mmc1_pin_mux[] = {
+ 	{"gpmc_ad0.mmc1_dat0",	OMAP_MUX_MODE1 | AM33XX_PIN_INPUT_PULLUP},
+ 	{"gpmc_csn1.mmc1_clk",	OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLUP},
+ 	{"gpmc_csn2.mmc1_cmd",	OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLUP},
+-	{"uart1_rxd.mmc1_sdwp",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+-	{"mcasp0_fsx.mmc1_sdcd", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+-	{NULL, 0},
+-};
+-
+-/* Module pin mux for mmc2 */
+-static struct pinmux_config mmc2_pin_mux[] = {
+-	{"gpmc_ad11.mmc2_dat7",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad10.mmc2_dat6",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad9.mmc2_dat5",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad8.mmc2_dat4",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad15.mmc2_dat3",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad14.mmc2_dat2",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad13.mmc2_dat1",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_ad12.mmc2_dat0",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_clk.mmc2_clk",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"gpmc_csn3.mmc2_cmd",	OMAP_MUX_MODE3 | AM33XX_PIN_INPUT_PULLUP},
+-	{"spi0_cs0.mmc2_sdwp",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+-	{"mcasp0_axr0.mmc2_sdcd", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_csn0.mmc1_sdwp",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_advn_ale.mmc1_sdcd", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+ 	{NULL, 0},
+ };
+ 
+@@ -1138,20 +1126,6 @@ static void mmc1_init(int evm_id, int profile)
+ 	return;
+ }
+ 
+-static void mmc2_init(int evm_id, int profile)
+-{
+-	setup_pin_mux(mmc2_pin_mux);
+-
+-	am335x_mmc[1].mmc = 3;
+-	am335x_mmc[1].caps = MMC_CAP_4_BIT_DATA;
+-	am335x_mmc[1].gpio_cd = GPIO_TO_PIN(3, 16);
+-	am335x_mmc[1].gpio_wp = GPIO_TO_PIN(0, 5);
+-	am335x_mmc[1].ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34; /* 3V3 */
+-
+-	/* mmc will be initialized when mmc0_init is called */
+-	return;
+-}
+-
+ static void mmc2_wl12xx_init(int evm_id, int profile)
+ {
+ 	setup_pin_mux(mmc2_wl12xx_pin_mux);
+@@ -1488,9 +1462,8 @@ static struct evm_dev_cfg gen_purp_evm_dev_cfg[] = {
+ 	{evm_nand_init, DEV_ON_DGHTR_BRD,
+ 		(PROFILE_ALL & ~PROFILE_2 & ~PROFILE_3)},
+ 	{i2c1_init,	DEV_ON_DGHTR_BRD, (PROFILE_0 | PROFILE_3 | PROFILE_7)},
+-	{mcasp1_init,	DEV_ON_DGHTR_BRD, (PROFILE_0 | PROFILE_3) },
++	{mcasp1_init,	DEV_ON_DGHTR_BRD, (PROFILE_0 | PROFILE_3 | PROFILE_7) },
+ 	{mmc1_init,	DEV_ON_DGHTR_BRD, PROFILE_2},
+-	{mmc2_init,	DEV_ON_DGHTR_BRD, PROFILE_4},
+ 	{mmc2_wl12xx_init,	DEV_ON_BASEBOARD, (PROFILE_0 | PROFILE_3 |
+ 								PROFILE_5)},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, (PROFILE_ALL & ~PROFILE_5)},
+@@ -1563,9 +1536,21 @@ static void setup_low_cost_evm(void)
+ static void setup_general_purpose_evm(void)
+ {
+ 	u32 prof_sel = am335x_get_profile_selection();
+-
+ 	pr_info("The board is general purpose EVM in profile %d\n", prof_sel);
+ 
++	if (!strncmp("1.1A", config.version, 4)) {
++		pr_info("EVM version is %s\n", config.version);
++		gp_evm_revision = GP_EVM_REV_IS_1_1A;
++	}
++	else if (!strncmp("1.0A", config.version, 4)) {
++		pr_info("EVM version is %s\n", config.version);
++		gp_evm_revision = GP_EVM_REV_IS_1_0A;
++	}
++	else {
++		pr_err("EVM version read fail, falling back to Rev1.1A");
++		gp_evm_revision = GP_EVM_REV_IS_1_1A;
++	}
++
+ 	_configure_device(GEN_PURP_EVM, gen_purp_evm_dev_cfg, (1L << prof_sel));
+ }
+ 
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0003-AM335x-Add-support-for-pressure-measurement-on-TSC.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0003-AM335x-Add-support-for-pressure-measurement-on-TSC.patch
new file mode 100644
index 0000000..9e73316
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0003-AM335x-Add-support-for-pressure-measurement-on-TSC.patch
@@ -0,0 +1,219 @@
+From b086fa2754f2c5f4f05a9690f170e2ef86207b4e Mon Sep 17 00:00:00 2001
+From: Patil, Rachna <rachna@ti.com>
+Date: Fri, 11 Nov 2011 18:28:54 +0530
+Subject: [PATCH 3/9] AM335x: Add support for pressure measurement on TSC.
+
+This patch adds support for pressure measurement configurations
+on TSC. Along with X and Y co-ordinates pressure is also reported to
+the sub-system.
+
+Signed-off-by: Patil, Rachna <rachna@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    1 +
+ drivers/input/touchscreen/ti_tscadc.c |   77 +++++++++++++++++++++++++++------
+ include/linux/input/ti_tscadc.h       |    3 +-
+ 3 files changed, 66 insertions(+), 15 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index d6bf7b1..46fce3e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -194,6 +194,7 @@ static struct resource tsc_resources[]  = {
+ 
+ static struct tsc_data am335x_touchscreen_data  = {
+ 	.wires  = 4,
++	.x_plate_resistance = 200,
+ };
+ 
+ static struct platform_device tsc_device = {
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 021db7f..9783435 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -41,6 +41,10 @@
+ #define TSCADC_REG_CHARGEDELAY		0x060
+ #define TSCADC_REG_STEPCONFIG(n)	(0x64 + ((n-1) * 8))
+ #define TSCADC_REG_STEPDELAY(n)		(0x68 + ((n-1) * 8))
++#define TSCADC_REG_STEPCONFIG13		0x0C4
++#define TSCADC_REG_STEPDELAY13		0x0C8
++#define TSCADC_REG_STEPCONFIG14		0x0CC
++#define TSCADC_REG_STEPDELAY14		0x0D0
+ #define TSCADC_REG_FIFO0CNT		0xE4
+ #define TSCADC_REG_FIFO0THR		0xE8
+ #define TSCADC_REG_FIFO1CNT		0xF0
+@@ -50,7 +54,7 @@
+ 
+ /*	Register Bitfields	*/
+ #define TSCADC_IRQWKUP_ENB		BIT(0)
+-#define TSCADC_STPENB_STEPENB		0x1fFF
++#define TSCADC_STPENB_STEPENB		0x7FFF
+ #define TSCADC_IRQENB_FIFO0THRES	BIT(2)
+ #define TSCADC_IRQENB_FIFO1THRES	BIT(5)
+ #define TSCADC_IRQENB_PENUP		BIT(9)
+@@ -71,10 +75,11 @@
+ #define TSCADC_STEPCONFIG_IDLE_INP	(1 << 22)
+ #define TSCADC_STEPCONFIG_OPENDLY	0x018
+ #define TSCADC_STEPCONFIG_SAMPLEDLY	0x88
+-#define TSCADC_STEPCHARGE_INM_SWAP     BIT(16)
+-#define TSCADC_STEPCHARGE_INM          BIT(15)
+-#define TSCADC_STEPCHARGE_INP_SWAP     BIT(20)
+-#define TSCADC_STEPCHARGE_INP          BIT(19)
++#define TSCADC_STEPCONFIG_Z1		(3 << 19)
++#define TSCADC_STEPCHARGE_INM_SWAP	BIT(16)
++#define TSCADC_STEPCHARGE_INM		BIT(15)
++#define TSCADC_STEPCHARGE_INP_SWAP	BIT(20)
++#define TSCADC_STEPCHARGE_INP		BIT(19)
+ #define TSCADC_STEPCHARGE_RFM		(1 << 23)
+ #define TSCADC_STEPCHARGE_DELAY		0x1
+ #define TSCADC_CNTRLREG_TSCSSENB	BIT(0)
+@@ -98,6 +103,7 @@ struct tscadc {
+ 	struct input_dev	*input;
+ 	int			wires;
+ 	int			analog_input;
++	int			x_plate_resistance;
+ 	struct clk		*clk;
+ 	int			irq;
+ 	void __iomem		*tsc_base;
+@@ -118,6 +124,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ {
+ 	unsigned int	stepconfigx = 0, stepconfigy = 0;
+ 	unsigned int	delay, chargeconfig = 0;
++	unsigned int	stepconfigz1 = 0, stepconfigz2 = 0;
+ 	int i;
+ 
+ 	/* Configure the Step registers */
+@@ -205,6 +212,18 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	tscadc_writel(ts_dev, TSCADC_REG_CHARGECONFIG, chargeconfig);
+ 	tscadc_writel(ts_dev, TSCADC_REG_CHARGEDELAY, TSCADC_STEPCHARGE_DELAY);
+ 
++	 /* Configure to calculate pressure */
++	stepconfigz1 = TSCADC_STEPCONFIG_MODE_HWSYNC |
++				TSCADC_STEPCONFIG_2SAMPLES_AVG |
++				TSCADC_STEPCONFIG_XNP |
++				TSCADC_STEPCONFIG_YPN | TSCADC_STEPCONFIG_INM;
++	stepconfigz2 = stepconfigz1 | TSCADC_STEPCONFIG_Z1 |
++				TSCADC_STEPCONFIG_FIFO1;
++	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG13, stepconfigz1);
++	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY13, delay);
++	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG14, stepconfigz2);
++	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY14, delay);
++
+ 	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB);
+ }
+ 
+@@ -235,14 +254,14 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+ 	unsigned int		prev_diff_x = ~0, prev_diff_y = ~0;
+ 	unsigned int		cur_diff_x = 0, cur_diff_y = 0;
+ 	unsigned int		val_x = 0, val_y = 0, diffx = 0, diffy = 0;
++	unsigned int		z1 = 0, z2 = 0, z = 0;
+ 
+ 	status = tscadc_readl(ts_dev, TSCADC_REG_IRQSTATUS);
+ 
+ 	if (status & TSCADC_IRQENB_FIFO1THRES) {
+ 		fifo0count = tscadc_readl(ts_dev, TSCADC_REG_FIFO0CNT);
+ 		fifo1count = tscadc_readl(ts_dev, TSCADC_REG_FIFO1CNT);
+-
+-		for (i = 0; i < fifo0count; i++) {
++		for (i = 0; i < (fifo0count-1); i++) {
+ 			readx1 = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
+ 			readx1 = readx1 & 0xfff;
+ 			if (readx1 > prev_val_x)
+@@ -281,12 +300,39 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+ 		bckup_x = val_x;
+ 		bckup_y = val_y;
+ 
+-		if (pen == 0) {
+-			if ((diffx < 15) && (diffy < 15)) {
+-				input_report_abs(input_dev, ABS_X, val_x);
+-				input_report_abs(input_dev, ABS_Y, val_y);
+-				input_report_key(input_dev, BTN_TOUCH, 1);
+-				input_sync(input_dev);
++		z1 = ((tscadc_readl(ts_dev, TSCADC_REG_FIFO0)) & 0xfff);
++		z2 = ((tscadc_readl(ts_dev, TSCADC_REG_FIFO1)) & 0xfff);
++
++		if ((z1 != 0) && (z2 != 0)) {
++			/*
++			 * cal pressure using formula
++			 * Resistance(touch) = x plate resistance *
++			 * x postion/4096 * ((z2 / z1) - 1)
++			 */
++			z = z2 - z1;
++			z *= val_x;
++			z *= ts_dev->x_plate_resistance;
++			z /= z1;
++			z = (z + 2047) >> 12;
++
++			/*
++			 * Sample found inconsistent by debouncing
++			 * or pressure is beyond the maximum.
++			 * Don't report it to user space.
++			 */
++			if (pen == 0) {
++				if ((diffx < 15) && (diffy < 15)
++						&& (z <= MAX_12BIT)) {
++					input_report_abs(input_dev, ABS_X,
++							val_x);
++					input_report_abs(input_dev, ABS_Y,
++							val_y);
++					input_report_abs(input_dev, ABS_PRESSURE,
++							z);
++					input_report_key(input_dev, BTN_TOUCH,
++							1);
++					input_sync(input_dev);
++				}
+ 			}
+ 		}
+ 		irqclr |= TSCADC_IRQENB_FIFO1THRES;
+@@ -303,6 +349,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+ 			bckup_x = 0;
+ 			bckup_y = 0;
+ 			input_report_key(input_dev, BTN_TOUCH, 0);
++			input_report_abs(input_dev, ABS_PRESSURE, 0);
+ 			input_sync(input_dev);
+ 		} else {
+ 			pen = 0;
+@@ -403,6 +450,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 
+ 	ts_dev->wires = pdata->wires;
+ 	ts_dev->analog_input = pdata->analog_input;
++	ts_dev->x_plate_resistance = pdata->x_plate_resistance;
+ 
+ 	/* Set the control register bits */
+ 	ctrl = TSCADC_CNTRLREG_STEPCONFIGWRT |
+@@ -430,7 +478,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 
+ 	tsc_step_config(ts_dev);
+ 
+-	tscadc_writel(ts_dev, TSCADC_REG_FIFO1THR, 5);
++	tscadc_writel(ts_dev, TSCADC_REG_FIFO1THR, 6);
+ 
+ 	ctrl |= TSCADC_CNTRLREG_TSCSSENB;
+ 	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);
+@@ -443,6 +491,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 
+ 	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, 0, 0);
+ 	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
++	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT, 0, 0);
+ 
+ 	/* register to the input system */
+ 	err = input_register_device(input_dev);
+diff --git a/include/linux/input/ti_tscadc.h b/include/linux/input/ti_tscadc.h
+index b9d9a46..2c547bb 100644
+--- a/include/linux/input/ti_tscadc.h
++++ b/include/linux/input/ti_tscadc.h
+@@ -11,10 +11,11 @@
+  *			XPUL = AN0,YPLL = AN1,XNUR = AN2,
+  *			YNLR = AN3, then set this variable to
+  *			0.
++ * @x_plate_resistance:	X plate resistance.
+  */
+ 
+ struct tsc_data {
+ 	int wires;
+ 	int analog_input;
+-
++	int x_plate_resistance;
+ };
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0004-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0004-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
new file mode 100644
index 0000000..adbe1a5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0004-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -0,0 +1,463 @@
+From 2b44ca7878e41f25b91486ebcb8db2c3be1f61eb Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Sat, 29 Oct 2011 01:17:43 -0500
+Subject: [PATCH 4/9] tscadc: Add general purpose mode, untested with touchscreen functionality
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ adc-notes.txt                         |   33 +++++
+ arch/arm/mach-omap2/board-am335xevm.c |    6 +
+ arch/arm/mach-omap2/mux33xx.c         |   12 ++
+ arch/arm/mach-omap2/mux33xx.h         |    4 +
+ drivers/input/touchscreen/ti_tscadc.c |  209 +++++++++++++++++++++++++--------
+ include/linux/input/ti_tscadc.h       |    4 +
+ 6 files changed, 216 insertions(+), 52 deletions(-)
+ create mode 100755 adc-notes.txt
+
+diff --git a/adc-notes.txt b/adc-notes.txt
+new file mode 100755
+index 0000000..178e262
+--- /dev/null
++++ b/adc-notes.txt
+@@ -0,0 +1,33 @@
++Features
++  - software register bit for SOC (Start of conversion) and EOC
++  - single conversion (one-shot) - software enabled
++  - Data stored in either of 2 fifo groups- can be read through dma or cpu
++
++
++Events
++  - Status bit to indicate if ADC is busy converting (can use polling to check if conversion is finished)
++  - Interrupts on FIFO threhold levels reached
++  - In on one-shot mode, Step-enable bit is turned off automatically after conversion - can be used to check if conversion is finished.
++  - END_OF_SEQUENCE interrupt can be configured when the FSM is done with the last enabled step (but should not be used to check if data is in the FIFO)
++  - For availability of data, the FIFO interrupts and word count reg should be used.
++
++Clocks-
++  - ADC uses adc_clk
++  - Sequencers, FIFO etc use ocp_clk
++
++One shot mode
++  - Step-enable bit is turned off automatically after conversion - can be used to check if conversion is finished.
++
++ADC Controller
++==============
++*** config steps
++1. configure a STEPCONFIG register
++	For ADC we would like to configure the steps as general-purpose (non-touch screen)
++2. Enable TSC_ADC_SS
++3. Set STEPENABLE bit of any step for the sequencer to go to that step, perform conversion and store the data in FIFO
++
++*** reading data:
++1. Check word count reg in FIFO register
++2. If non 0, read word
++3. Step enable bit can be polled to check if conversion is over or not.
++
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 46fce3e..c8da580 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -456,6 +456,10 @@ static struct pinmux_config tsc_pin_mux[] = {
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
+@@ -1513,6 +1517,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+@@ -1524,6 +1529,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 4399003..832a50b 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -587,6 +587,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
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
+index 9783435..76fc7b6 100644
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
+@@ -72,7 +80,7 @@
+ #define TSCADC_STEPCONFIG_INP		(1 << 20)
+ #define TSCADC_STEPCONFIG_INP_5		(1 << 21)
+ #define TSCADC_STEPCONFIG_FIFO1		(1 << 26)
+-#define TSCADC_STEPCONFIG_IDLE_INP	(1 << 22)
++#define TSCADC_STEPCONFIG_IDLE_INP	0x0000
+ #define TSCADC_STEPCONFIG_OPENDLY	0x018
+ #define TSCADC_STEPCONFIG_SAMPLEDLY	0x88
+ #define TSCADC_STEPCONFIG_Z1		(3 << 19)
+@@ -104,6 +112,7 @@ struct tscadc {
+ 	int			wires;
+ 	int			analog_input;
+ 	int			x_plate_resistance;
++	int mode;
+ 	struct clk		*clk;
+ 	int			irq;
+ 	void __iomem		*tsc_base;
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
+ 	ts_dev->tsc_base = ioremap(res->start, resource_size(res));
+ 	if (!ts_dev->tsc_base) {
+@@ -415,8 +506,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
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
+@@ -436,11 +534,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 		goto err_free_irq;
+ 	}
+ 	clock_rate = clk_get_rate(ts_dev->clk);
++
++	/* clk_value of atleast 21MHz required
++ 	 * Clock verified on BeagleBone to be 24MHz */
+ 	clk_value = clock_rate / ADC_CLK;
+ 	if (clk_value < 7) {
+ 		dev_err(&pdev->dev, "clock input less than min clock requirement\n");
+ 		goto err_fail;
+ 	}
++
+ 	/* TSCADC_CLKDIV needs to be configured to the value minus 1 */
+ 	clk_value = clk_value - 1;
+ 	tscadc_writel(ts_dev, TSCADC_REG_CLKDIV, clk_value);
+@@ -451,56 +553,59 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
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
+ 	return 0;
+ 
+ err_fail:
++	printk(KERN_ERR "Fatal error, shutting down TSC_ADC\n");
+ 	clk_disable(ts_dev->clk);
+ 	clk_put(ts_dev->clk);
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
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0005-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0005-tscadc-Add-board-file-mfd-support-fix-warning.patch
new file mode 100644
index 0000000..745855f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0005-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -0,0 +1,86 @@
+From 800fc5594ec8922ef06e4063497d858cfd92c655 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 23 Nov 2011 17:52:57 -0600
+Subject: [PATCH 5/9] tscadc: Add board file mfd support, fix warning
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   27 ++++++++++++++++++++++++++-
+ drivers/input/touchscreen/ti_tscadc.c |    2 +-
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index c8da580..563770e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -195,6 +195,11 @@ static struct resource tsc_resources[]  = {
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
+@@ -207,6 +212,16 @@ static struct platform_device tsc_device = {
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
+@@ -919,6 +934,16 @@ static void tsc_init(int evm_id, int profile)
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
+ static void boneleds_init(int evm_id, int profile )
+ {
+ 	int err;
+@@ -1517,7 +1542,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 76fc7b6..49a5a70 100644
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
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0006-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0006-AM335X-init-tsc-bone-style-for-new-boards.patch
new file mode 100644
index 0000000..85f200d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0006-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -0,0 +1,26 @@
+From be48948e9fe62f75cb221309aec0990f9ecd5e01 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 18:01:07 -0600
+Subject: [PATCH 6/9] AM335X: init tsc bone style for new boards
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 563770e..20b4e29 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1554,7 +1554,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
+-	{tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
++	{bone_tsc_init, 	DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0007-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0007-tscadc-make-stepconfig-channel-configurable.patch
new file mode 100644
index 0000000..487c556
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0007-tscadc-make-stepconfig-channel-configurable.patch
@@ -0,0 +1,46 @@
+From 012ea9d8c2e7e522b1bd614ba5df814224663140 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 18:18:04 -0600
+Subject: [PATCH 7/9] tscadc: make stepconfig channel-configurable
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 49a5a70..638feb9 100644
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
+@@ -593,7 +595,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 			goto err_fail;
+ 	}
+ 	else {
+-		tsc_adc_step_config(ts_dev);
++		tsc_adc_step_config(ts_dev, 8);
+ 		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
+ 		irqenable = TSCADC_IRQENB_FIFO0THRES;
+ 	}
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0008-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0008-tscadc-Trigger-through-sysfs.patch
new file mode 100644
index 0000000..378e8cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0008-tscadc-Trigger-through-sysfs.patch
@@ -0,0 +1,151 @@
+From 01b25097f2ad4ca1e9f35547b1a040c5f06a5dfd Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 20:55:25 -0600
+Subject: [PATCH 8/9] tscadc: Trigger through sysfs
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |   61 ++++++++++++++++++++++++++++++---
+ include/linux/input/ti_tscadc.h       |    1 +
+ 2 files changed, 57 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 638feb9..0126219 100644
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
+ 	struct clk			*tsc_ick;
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
+@@ -595,7 +646,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 			goto err_fail;
+ 	}
+ 	else {
+-		tsc_adc_step_config(ts_dev, 8);
+ 		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
+ 		irqenable = TSCADC_IRQENB_FIFO0THRES;
+ 	}
+@@ -604,6 +654,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+ 	ctrl |= TSCADC_CNTRLREG_TSCSSENB;
+ 	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);	/* Turn on TSC_ADC */
+ 
++	dev_set_drvdata(&pdev->dev, ts_dev);
+ 	return 0;
+ 
+ err_fail:
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
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch
new file mode 100644
index 0000000..2c30570
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -0,0 +1,34 @@
+From ddb162b6ced5d47caa3a62ab5e95b659287a32d1 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Mon, 28 Nov 2011 20:56:48 -0600
+Subject: [PATCH 9/9] meta-ti: Remove debug messages for meta-ti
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 0126219..182428b 100644
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
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index f37cf7d..574e607 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -44,6 +44,15 @@ PATCHES_OVER_PSP = " \
 	file://i2c/0001-arm-omap-mux33xx-Add-i2c2-pin-muix.patch \
 	file://i2c/0002-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch \
 	file://i2c/0003-arm-omap-board-Add-quick-hack-to-get-i2c2-bus-suppor.patch	\
+	file://adc/0001-AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch \
+	file://adc/0002-ARM-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch \
+	file://adc/0003-AM335x-Add-support-for-pressure-measurement-on-TSC.patch \
+	file://adc/0004-tscadc-Add-general-purpose-mode-untested-with-touchs.patch \
+	file://adc/0005-tscadc-Add-board-file-mfd-support-fix-warning.patch \
+	file://adc/0006-AM335X-init-tsc-bone-style-for-new-boards.patch \
+	file://adc/0007-tscadc-make-stepconfig-channel-configurable.patch \
+	file://adc/0008-tscadc-Trigger-through-sysfs.patch \
+	file://adc/0009-meta-ti-Remove-debug-messages-for-meta-ti.patch \
 	"
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.4.1


