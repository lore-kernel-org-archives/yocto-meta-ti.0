Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CCEDE0141F
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:53 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so937547wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=cTYzBdaWhjiSs76MsPuDzkgFNyLULgkxWD9FCkQhC8I=;
	b=kNcdHIXIxdH3TpWCYWHVSx+EJNmOv6+V6vacZCkGBv1aePUb8R9TKmV1HY15hgrVJG
	o0Hc8LSF77grcyhy9Rn+MFs4dfCH69VON0rAuF1KN2zPA9k8dhJYBz1+pLICMDCbUJ46
	Oid1J93uHGYSb+/rW+2nDMGB9aaj2Z705sLEBvhvK5XZ9O/bJjOQ3Q2ka5iqFbZJOSAW
	4Mp1LvyFhdb7COM2nQeXegCglSVwidd9bwI0k/6nBzqVIGTWb8HEqXPOMDjDM3fc+5lU
	bz3pORvuqWCofTDDBbr+JyvU37Aq7WBdurEnWO3sHRLyBiejilGTNOtLvXFF1W//G78c
	FKjw==
Received: by 10.180.24.193 with SMTP id w1mr7461629wif.5.1336640393012;
	Thu, 10 May 2012 01:59:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm1938486wix.8.2012.05.10.01.59.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 01:59:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:24 +0200
Message-Id: <1336640375-20418-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnx6c9RwvgSpnLvR9u/ZbtsIdByO8eIeNCgCedGfOsBe28XwfEc5BNjHlOUTSMI5CK9JDzE
Cc: denys@ti.com
Subject: [PATCH v3 02/13] linux-mainline 3.2: add support for beagleboard wifi expansion board
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
X-List-Received-Date: Thu, 10 May 2012 08:59:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../beagle/0014-expansion-add-wifi.patch           |  142 ++++++++++++++++++++
 recipes-kernel/linux/linux-mainline_3.2.bb         |    3 +-
 2 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/beagle/0014-expansion-add-wifi.patch

diff --git a/recipes-kernel/linux/linux-mainline-3.2/beagle/0014-expansion-add-wifi.patch b/recipes-kernel/linux/linux-mainline-3.2/beagle/0014-expansion-add-wifi.patch
new file mode 100644
index 0000000..fe175c0
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/beagle/0014-expansion-add-wifi.patch
@@ -0,0 +1,142 @@
+From cd3ddffcde4c2b2c8c66389abed3b890b12f31c2 Mon Sep 17 00:00:00 2001
+From: Robert Nelson <robertcnelson@gmail.com>
+Date: Mon, 16 Apr 2012 10:56:17 -0500
+Subject: [PATCH 14/14] expansion: add wifi
+
+Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
+---
+ arch/arm/mach-omap2/board-omap3beagle.c |  103 +++++++++++++++++++++++++++++++
+ 1 files changed, 103 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
+index 0299d47..a7d81fc 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle.c
++++ b/arch/arm/mach-omap2/board-omap3beagle.c
+@@ -166,6 +166,90 @@ static void __init omap3_beagle_init_rev(void)
+ char expansionboard_name[16];
+ char expansionboard2_name[16];
+ 
++#if defined(CONFIG_WL12XX) || defined(CONFIG_WL12XX_MODULE)
++#include <linux/regulator/fixed.h>
++#include <linux/ti_wilink_st.h>
++#include <linux/wl12xx.h>
++
++#define OMAP_BEAGLE_WLAN_EN_GPIO    (139)
++#define OMAP_BEAGLE_BT_EN_GPIO      (138)
++#define OMAP_BEAGLE_WLAN_IRQ_GPIO   (137)
++#define OMAP_BEAGLE_FM_EN_BT_WU     (136)
++
++struct wl12xx_platform_data omap_beagle_wlan_data __initdata = {
++	.irq = OMAP_GPIO_IRQ(OMAP_BEAGLE_WLAN_IRQ_GPIO),
++	.board_ref_clock = 2, /* 38.4 MHz */
++};
++
++static struct ti_st_plat_data wilink_platform_data = {
++	.nshutdown_gpio	= OMAP_BEAGLE_BT_EN_GPIO,
++	.dev_name		= "/dev/ttyO1",
++	.flow_cntrl		= 1,
++	.baud_rate		= 3000000,
++	.chip_enable		= NULL,
++	.suspend		= NULL,
++	.resume		= NULL,
++};
++
++static struct platform_device wl12xx_device = {
++		.name		= "kim",
++		.id			= -1,
++		.dev.platform_data = &wilink_platform_data,
++};
++
++static struct platform_device btwilink_device = {
++	.name	= "btwilink",
++	.id	= -1,
++};
++
++static struct omap2_hsmmc_info mmcbbt[] = {
++	{
++		.mmc		= 1,
++		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA,
++		.gpio_wp	= -EINVAL,
++	},
++	{
++		.name		= "wl1271",
++		.mmc		= 2,
++		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_POWER_OFF_CARD,
++		.gpio_wp	= -EINVAL,
++		.gpio_cd	= -EINVAL,
++		.ocr_mask	= MMC_VDD_165_195,
++		.nonremovable	= true,
++	},
++	{}	/* Terminator */
++};
++
++static struct regulator_consumer_supply beagle_vmmc2_supply =
++	REGULATOR_SUPPLY("vmmc", "omap_hsmmc.1");
++
++static struct regulator_init_data beagle_vmmc2 = {
++	.constraints = {
++		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies = 1,
++	.consumer_supplies = &beagle_vmmc2_supply,
++};
++
++static struct fixed_voltage_config beagle_vwlan = {
++	.supply_name = "vwl1271",
++	.microvolts = 1800000,  /* 1.8V */
++	.gpio = OMAP_BEAGLE_WLAN_EN_GPIO,
++	.startup_delay = 70000, /* 70ms */
++	.enable_high = 1,
++	.enabled_at_boot = 0,
++	.init_data = &beagle_vmmc2,
++};
++
++static struct platform_device omap_vwlan_device = {
++	.name		= "reg-fixed-voltage",
++	.id		= 1,
++	.dev = {
++		.platform_data = &beagle_vwlan,
++	},
++};
++#endif
++
+ #if defined(CONFIG_ENC28J60) || defined(CONFIG_ENC28J60_MODULE)
+ 
+ #include <plat/mcspi.h>
+@@ -449,7 +533,15 @@ static int beagle_twl_gpio_setup(struct device *dev,
+ 	mmc[0].gpio_wp = beagle_config.mmc1_gpio_wp;
+ 	/* gpio + 0 is "mmc0_cd" (input/IRQ) */
+ 	mmc[0].gpio_cd = gpio + 0;
++#if defined(CONFIG_WL12XX) || defined(CONFIG_WL12XX_MODULE)
++	if(!strcmp(expansionboard_name, "bbtoys-wifi")) {
++		omap2_hsmmc_init(mmcbbt);
++	} else {
++		omap2_hsmmc_init(mmc);
++	}
++#else
+ 	omap2_hsmmc_init(mmc);
++#endif
+ 
+ 	/*
+ 	 * TWL4030_GPIO_MAX + 0 == ledA, EHCI nEN_USB_PWR (out, XM active
+@@ -849,6 +941,17 @@ static void __init omap3_beagle_init(void)
+ 		gpio_export(162, 1);
+ 	}
+ 
++	if(!strcmp(expansionboard_name, "bbtoys-wifi"))
++	{
++		if (wl12xx_set_platform_data(&omap_beagle_wlan_data))
++			pr_err("error setting wl12xx data\n");
++		printk(KERN_INFO "Beagle expansionboard: registering wl12xx bt platform device\n");
++		platform_device_register(&wl12xx_device);
++		platform_device_register(&btwilink_device);
++		printk(KERN_INFO "Beagle expansionboard: registering wl12xx wifi platform device\n");
++		platform_device_register(&omap_vwlan_device);
++	}
++
+ 	if(!strcmp(expansionboard2_name, "bbtoys-ulcd"))
+ 	{
+ 		printk(KERN_INFO "Beagle second expansionboard: initializing touchscreen: tsc2007\n");
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index dd86bbf..3e57ccf 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,7 +10,7 @@ PV = "3.2.16"
 SRCREV_pn-${PN} = "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
@@ -57,6 +57,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://beagle/0011-default-to-fifo-mode-5-for-old-musb-beagles.patch \
             file://beagle/0012-backlight-Add-TLC59108-backlight-control-driver.patch \
             file://beagle/0013-tlc59108-adjust-for-beagleboard-uLCD7.patch \
+            file://beagle/0014-expansion-add-wifi.patch \
             file://devkit8000/0001-arm-omap-devkit8000-for-lcd-use-samsung_lte_panel.patch \
             file://touchbook/0001-omap3-touchbook-remove-mmc-gpio_wp.patch \
             file://touchbook/0002-omap3-touchbook-drop-u-boot-readonly.patch \
-- 
1.7.10


