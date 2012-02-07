Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91E3DE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Tue,  7 Feb 2012 03:14:27 -0800 (PST)
Received: by werb10 with SMTP id b10so5976570wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 07 Feb 2012 03:14:26 -0800 (PST)
Received: by 10.216.145.207 with SMTP id p57mr8403546wej.29.1328613266315;
	Tue, 07 Feb 2012 03:14:26 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y1sm55631555wiw.6.2012.02.07.03.14.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:14:25 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue,  7 Feb 2012 12:14:08 +0100
Message-Id: <1328613252-27915-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
References: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
Subject: [BeagleBone][PATCH 2/6] linux-ti335x-psp 3.2: fix sd timeout, use pwm for backlight, add SPI fb support
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
X-List-Received-Date: Tue, 07 Feb 2012 11:14:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...1-f_rndis-HACK-around-undefined-variables.patch |    4 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    4 +-
 .../0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch   |    4 +-
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |    4 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    4 +-
 .../0006-more-beaglebone-merges.patch              |    4 +-
 .../0007-beaglebone-disable-tsadc.patch            |    4 +-
 ...general-purpose-mode-untested-with-touchs.patch |    4 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    4 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    4 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    4 +-
 .../0012-tscadc-Trigger-through-sysfs.patch        |    4 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    4 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    4 +-
 .../0015-beaglebone-fix-ADC-init.patch             |    4 +-
 .../0017-AM335x-MUX-add-ehrpwm1A.patch             |   26 +
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |  177 ++++++
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   34 +
 ...set-default-brightness-to-50-for-pwm-back.patch |   27 +
 ...P-framebuffer-driver-supporting-Adafruit-.patch |  668 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    9 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    9 +-
 22 files changed, 974 insertions(+), 36 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0017-AM335x-MUX-add-ehrpwm1A.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0019-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0021-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
index 73a61da..c2dc852 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -1,7 +1,7 @@
 From d26b2d246668587049b1362a42c9b829f2ca288a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/16] f_rndis: HACK around undefined variables
+Subject: [PATCH 01/21] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
index c3b3da8..5a42aea 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,7 +1,7 @@
 From 0188ea8b0633815f9ed9a728a6a1a53d64c1093c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/16] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 02/21] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -34,5 +34,5 @@ index 85eda33..dea8936 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
index 5d972f1..808868a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0003-arm-omap-mux33xx-Add-i2c2-pin-mux.patch
@@ -1,7 +1,7 @@
 From 11622554369db32c7c14572efb525ef5e418338d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:21:32 +0100
-Subject: [PATCH 03/16] arm:omap:mux33xx: Add i2c2 pin mux
+Subject: [PATCH 03/21] arm:omap:mux33xx: Add i2c2 pin mux
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -26,5 +26,5 @@ index 81a657e..36bb10a 100644
  	_AM33XX_MUXENTRY(UART1_RXD, 0,
  		"uart1_rxd", "mmc1_sdwp", NULL, NULL,
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
index 836b4a7..6ec9f88 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0004-omap-hwmod-33xx-Add-support-for-third-i2c-bus.patch
@@ -1,7 +1,7 @@
 From 4f823ac4857d0d48b53b7a8799a745f746bfda1a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 16 Nov 2011 07:23:37 -0600
-Subject: [PATCH 04/16] omap:hwmod:33xx: Add support for third i2c bus
+Subject: [PATCH 04/21] omap:hwmod:33xx: Add support for third i2c bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -88,5 +88,5 @@ index 9b15ffe..f9b91fa 100644
  	&am33xx_icss_hwmod,
  	/* ieee5000 class */
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index 03b4c93..c4590eb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0005-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,7 +1,7 @@
 From c240df1d9fd60f318e719d0e77bc5955fecbb64e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 05/16] beaglebone: rebase everything onto 3.2  - WARNING
+Subject: [PATCH 05/21] beaglebone: rebase everything onto 3.2  - WARNING
  MEGAPATCH
 
 ---
@@ -544,5 +544,5 @@ index 4c09cc9..e0c20c5 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
index b72bb56..25c7fcc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0006-more-beaglebone-merges.patch
@@ -1,7 +1,7 @@
 From 873c06849ccdb685b5cab1e6e809eda260427d42 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 06/16] more beaglebone merges
+Subject: [PATCH 06/21] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -121,5 +121,5 @@ index e0c20c5..177ab9e 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
index 3d1a8ea..63a9575 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0007-beaglebone-disable-tsadc.patch
@@ -1,7 +1,7 @@
 From 6f50bf55f6182ecd09aac93d3b613a99159b606c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 07/16] beaglebone: disable tsadc
+Subject: [PATCH 07/21] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 177ab9e..87ccf14 100644
  
  static struct platform_device tsc_device = {
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index 5d5f95f..ef1ece0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0008-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,7 @@
 From 7cb067cd1bd237a7a9978747fc4f96fa90b5d146 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 08/16] tscadc: Add general purpose mode, untested with
+Subject: [PATCH 08/21] tscadc: Add general purpose mode, untested with
  touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
@@ -407,5 +407,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
index bae95a9..27133e8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0009-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
 From f7330897eabdf0275cd51213fe1dc778e165d07c Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 09/16] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 09/21] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -40,5 +40,5 @@ index 699503d..f813564 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
index c78cb81..b5f3d48 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0010-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,7 +1,7 @@
 From f02d01f3f7bafede91847480a72b50d8a8d45a6a Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 10/16] AM335X: init tsc bone style for new boards
+Subject: [PATCH 10/21] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -22,5 +22,5 @@ index 17705b3..ac4f78f 100644
  };
  
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
index 64f5e37..892f196 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0011-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,7 +1,7 @@
 From 0524d48ca4e3178d89d940b38f1fa26cf448ebb8 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 11/16] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 11/21] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -42,5 +42,5 @@ index f813564..0b91bdc 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
index 8375cf8..398c951 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0012-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
 From 5b0c06b556db15cac8d14eb7e74307521481e185 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 12/16] tscadc: Trigger through sysfs
+Subject: [PATCH 12/21] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -143,5 +143,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
index 7c06c09..866349d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0013-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,7 +1,7 @@
 From edb40d9ed626b634bfe71c39a02602e2ae871175 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 13/16] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 13/21] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -30,5 +30,5 @@ index a74d9ba..1f9cbf5 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
index 0df5346..168230c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0014-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,7 +1,7 @@
 From f36d060e6965cdbf797308fb2d80a77c4bbaeac3 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 14/16] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 14/21] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -50,5 +50,5 @@ index 1f9cbf5..8e2a994 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
index 2757844..3220a5c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0015-beaglebone-fix-ADC-init.patch
@@ -1,7 +1,7 @@
 From 9289020d4d0f1dc6a973feca4b6465ee1dbcb1b7 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 15/16] beaglebone: fix ADC init
+Subject: [PATCH 15/21] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -43,5 +43,5 @@ index ac4f78f..177ab9e 100644
  };
  
 -- 
-1.7.7.5
+1.7.7.4
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-AM335x-MUX-add-ehrpwm1A.patch
new file mode 100644
index 0000000..ecaf9f5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0017-AM335x-MUX-add-ehrpwm1A.patch
@@ -0,0 +1,26 @@
+From 2d9d76c49c1a208d9cb4894bf26c9fb96f440e3f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 16:49:52 +0100
+Subject: [PATCH 17/21] AM335x: MUX: add ehrpwm1A
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/mux33xx.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index e4cd407..0a06241 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -85,7 +85,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		NULL, NULL, NULL, "gpio1_17"),
+ 	_AM33XX_MUXENTRY(GPMC_A2, 0,
+ 		"gpmc_a2", "mii2_txd3", "rgmii2_td3", "mmc2_dat1",
+-		NULL, NULL, NULL, "gpio1_18"),
++		NULL, NULL, "ehrpwm1A", "gpio1_18"),
+ 	_AM33XX_MUXENTRY(GPMC_A3, 0,
+ 		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
+ 		NULL, NULL, NULL, "gpio1_19"),
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
new file mode 100644
index 0000000..0449936
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0018-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -0,0 +1,177 @@
+From 5fb56662c5ed2e0499b9bb43a542f896a8274cab Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 31 Jan 2012 17:02:10 +0100
+Subject: [PATCH 18/21] beaglebone: enable PWM for lcd backlight <- backlight
+ is inverted
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   54 ++++++++++++++++++++++++++------
+ arch/arm/mach-omap2/devices.c         |   13 ++++++++
+ arch/arm/mach-omap2/devices.h         |    1 +
+ 3 files changed, 58 insertions(+), 10 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 177ab9e..6a77194 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -36,6 +36,7 @@
+ #include <linux/mfd/tps65910.h>
+ #include <linux/mfd/tps65217.h>
+ #include <linux/pwm_backlight.h>
++#include <linux/pwm/pwm.h>
+ 
+ /* LCD controller is similar to DA850 */
+ #include <video/da8xx-fb.h>
+@@ -131,7 +132,7 @@ static const struct display_panel disp_panel = {
+ /* LCD backlight platform Data */
+ #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
+ #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    100
+-#define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 10)
++#define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 5)
+ 
+ #define PWM_DEVICE_ID   "ecap.0"
+ 
+@@ -175,6 +176,16 @@ static const struct display_panel bbtoys7_panel = {
+ 	COLOR_ACTIVE,
+ };
+ 
++#define BBTOYS7LCD_PWM_DEVICE_ID   "ehrpwm.1:0"
++
++static struct platform_pwm_backlight_data bbtoys7lcd_backlight_data = {
++	.pwm_id         = BBTOYS7LCD_PWM_DEVICE_ID,
++	.ch             = -1,
++	.max_brightness = AM335X_BACKLIGHT_MAX_BRIGHTNESS,
++	.dft_brightness = AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS,
++	.pwm_period_ns  = AM335X_PWM_PERIOD_NANO_SECONDS,
++};
++
+ static struct lcd_ctrl_config bbtoys7_cfg = {
+ 	&bbtoys7_panel,
+ 	.ac_bias		= 255,
+@@ -586,9 +597,9 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+ 	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+-	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT}, 
+-	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Backlight
++	{"lcd_ac_bias_en.lcd_ac_bias_en", OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
+ 	{"ecap0_in_pwm0_out.gpio0_7", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
++	{"gpmc_a2.ehrpwm1A", OMAP_MUX_MODE6 | AM33XX_PIN_OUTPUT}, // Backlight
+ 	{NULL, 0},
+ };
+ 
+@@ -1121,6 +1132,7 @@ static struct pinmux_config ecap0_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++static int ehrpwm_backlight_enable;
+ static int backlight_enable;
+ 
+ #define AM335XEVM_WLAN_PMENA_GPIO	GPIO_TO_PIN(1, 30)
+@@ -1190,6 +1202,30 @@ static int __init ecap0_init(void)
+ }
+ late_initcall(ecap0_init);
+ 
++static void enable_ehrpwm1(int evm_id, int profile)
++{
++	ehrpwm_backlight_enable = true;
++}
++
++/* Setup pwm-backlight for bbtoys7lcd */
++static struct platform_device bbtoys7lcd_backlight = {
++	.name           = "pwm-backlight",
++	.id             = -1,
++	.dev            = {
++		.platform_data  = &bbtoys7lcd_backlight_data,
++	}
++};
++
++static int __init ehrpwm1_init(void)
++{
++	int status = 0;
++	if (ehrpwm_backlight_enable) {
++		platform_device_register(&bbtoys7lcd_backlight);
++	}
++	return status;
++}
++late_initcall(ehrpwm1_init);
++
+ static int __init conf_disp_pll(int rate)
+ {
+ 	struct clk *disp_pll;
+@@ -1224,11 +1260,12 @@ static void lcdc_init(int evm_id, int profile)
+ }
+ 
+ #define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
+-#define BEAGLEBONE_LCD_BL GPIO_TO_PIN(1, 18)
+ 
+ static void bbtoys7lcd_init(int evm_id, int profile)
+ {
+ 	setup_pin_mux(bbtoys7_pin_mux);
++	gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
++	gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
+ 
+ 	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
+ 	if (conf_disp_pll(300000000)) {
+@@ -1239,12 +1276,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+ 	
+ 	if (am33xx_register_lcdc(&bbtoys7_pdata))
+ 		pr_info("Failed to register Beagleboardtoys 7\" LCD cape device\n");
+-	
+-	gpio_request(BEAGLEBONE_LCD_BL, "BONE_LCD_BL");
+-	gpio_direction_output(BEAGLEBONE_LCD_BL, 1);
+-	gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
+-	gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
+-
++		
+ 	return;
+ }
+ 
+@@ -1768,6 +1800,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		bbtoys7lcd_init(0,0);
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
++		pr_info("BeagleBone cape: Registering PWM backlight for LCD cape\n");
++		enable_ehrpwm1(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+ 	}
+ 	
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index 4b137e9..33291ae 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -1277,6 +1277,19 @@ void register_ehrpwm(int max_freq)
+ 	platform_device_register(&am335x_epwm2_device);
+ }
+ 
++void register_ehrpwm1(int max_freq)
++{
++	int val;
++
++	val = __raw_readw(AM33XX_CTRL_REGADDR(AM33XX_PWMSS_CTRL));
++	val |= PWMSS1_TBCLKEN;
++	__raw_writew(val, AM33XX_CTRL_REGADDR(AM33XX_PWMSS_CTRL));
++	am335x_pwmss_config1.chan_attrib[1].max_freq = max_freq;
++	sema_init(&am335x_pwmss_config1.config_semaphore, 1);
++	am335x_pwmss_config1.version = PWM_VERSION_1;
++	platform_device_register(&am335x_epwm1_device);
++}
++
+ static struct resource am335x_ecap0_resurce[] = {
+ 	{
+ 		.start = AM33XX_EPWMSS0_BASE ,
+diff --git a/arch/arm/mach-omap2/devices.h b/arch/arm/mach-omap2/devices.h
+index e086839..5161eb4 100644
+--- a/arch/arm/mach-omap2/devices.h
++++ b/arch/arm/mach-omap2/devices.h
+@@ -18,5 +18,6 @@ int omap3_init_camera(struct isp_platform_data *pdata);
+ 
+ void __init am335x_register_mcasp1(struct snd_platform_data *pdata);
+ extern void register_ehrpwm(int max_freq);
++extern void register_ehrpwm1(int max_freq);
+ 
+ #endif
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
new file mode 100644
index 0000000..d4255da
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0019-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -0,0 +1,34 @@
+From 91e061ce4d020a11259adc79499cf7e6714eedb0 Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH 19/21] omap_hsmmc: Set dto to max value of 14 to avoid SD
+ Card timeouts
+
+This fixes MMC errors due to timeouts on certain SD Cards following suggestions
+to set dto to 14 by Jason Kridner and Steven Kipisz
+
+Details of the issue:
+http://talk.maemo.org/showthread.php?p=1000707#post1000707
+
+This fix was originally proposed by Sukumar Ghoral of TI.
+---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index 703013c..554237f 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -1562,6 +1562,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 			dto = 14;
+ 	}
+ 
++	/* Set dto to max value of 14 to avoid SD Card timeouts */
++	dto = 14;
++
+ 	reg &= ~DTO_MASK;
+ 	reg |= dto << DTO_SHIFT;
+ 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
new file mode 100644
index 0000000..d4d4622
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0020-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -0,0 +1,27 @@
+From 028a2779bf8e08a333b01a1c4fc71d6fae99ed73 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 1 Feb 2012 14:10:38 +0100
+Subject: [PATCH 20/21] beaglebone: set default brightness to 50% for pwm
+ backlights
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 6a77194..c31c0aa 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -131,7 +131,7 @@ static const struct display_panel disp_panel = {
+ 
+ /* LCD backlight platform Data */
+ #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
+-#define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    100
++#define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
+ #define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 5)
+ 
+ #define PWM_DEVICE_ID   "ecap.0"
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
new file mode 100644
index 0000000..2a71658
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0021-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -0,0 +1,668 @@
+From effae95a02a22474626aa8abdfb8573fd3eb74b6 Mon Sep 17 00:00:00 2001
+From: Matt Porter <mporter@ti.com>
+Date: Mon, 21 Nov 2011 12:55:23 -0500
+Subject: [PATCH 21/21] st7735fb: WIP framebuffer driver supporting Adafruit
+ 1.8" SPI LCD
+
+Signed-off-by: Matt Porter <mporter@ti.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/video/Kconfig    |   11 +
+ drivers/video/Makefile   |    1 +
+ drivers/video/st7735fb.c |  516 ++++++++++++++++++++++++++++++++++++++++++++++
+ include/video/st7735fb.h |   86 ++++++++
+ 4 files changed, 614 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/video/st7735fb.c
+ create mode 100644 include/video/st7735fb.h
+
+diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
+index f66bf0e..64754de 100644
+--- a/drivers/video/Kconfig
++++ b/drivers/video/Kconfig
+@@ -2420,6 +2420,17 @@ config FB_PUV3_UNIGFX
+ 	  Choose this option if you want to use the Unigfx device as a
+ 	  framebuffer device. Without the support of PCI & AGP.
+ 
++config FB_ST7735
++	tristate "ST7735 framebuffer support"
++	depends on FB && SPI
++	select FB_SYS_FILLRECT
++	select FB_SYS_COPYAREA
++	select FB_SYS_IMAGEBLIT
++	select FB_SYS_FOPS
++	select FB_DEFERRED_IO
++	help
++	  Framebuffer support for the ST7735 display controller in SPI mode.
++
+ source "drivers/video/omap/Kconfig"
+ source "drivers/video/omap2/Kconfig"
+ 
+diff --git a/drivers/video/Makefile b/drivers/video/Makefile
+index 9b9d8ff..c6d9851 100644
+--- a/drivers/video/Makefile
++++ b/drivers/video/Makefile
+@@ -143,6 +143,7 @@ obj-$(CONFIG_FB_MSM)              += msm/
+ obj-$(CONFIG_FB_NUC900)           += nuc900fb.o
+ obj-$(CONFIG_FB_JZ4740)		  += jz4740_fb.o
+ obj-$(CONFIG_FB_PUV3_UNIGFX)      += fb-puv3.o
++obj-$(CONFIG_FB_ST7735)		  += st7735fb.o
+ 
+ # Platform or fallback drivers go here
+ obj-$(CONFIG_FB_UVESA)            += uvesafb.o
+diff --git a/drivers/video/st7735fb.c b/drivers/video/st7735fb.c
+new file mode 100644
+index 0000000..500cc88
+--- /dev/null
++++ b/drivers/video/st7735fb.c
+@@ -0,0 +1,516 @@
++/*
++ * linux/drivers/video/st7735fb.c -- FB driver for ST7735 LCD controller
++ * Layout is based on skeletonfb.c by James Simmons and Geert Uytterhoeven.
++ *
++ * Copyright (C) 2011, Matt Porter
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License. See the file COPYING in the main directory of this archive for
++ * more details.
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/string.h>
++#include <linux/mm.h>
++#include <linux/vmalloc.h>
++#include <linux/slab.h>
++#include <linux/init.h>
++#include <linux/fb.h>
++#include <linux/gpio.h>
++#include <linux/spi/spi.h>
++#include <linux/delay.h>
++#include <linux/uaccess.h>
++
++#include <video/st7735fb.h>
++
++static struct st7735_function st7735_cfg_script[] = {
++	{ ST7735_START, ST7735_START},
++	{ ST7735_CMD, ST7735_SWRESET},
++	{ ST7735_DELAY, 150},
++	{ ST7735_CMD, ST7735_SLPOUT},
++	{ ST7735_DELAY, 500},
++	{ ST7735_CMD, ST7735_FRMCTR1},
++	{ ST7735_DATA, 0x01},
++	{ ST7735_DATA, 0x2c},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_CMD, ST7735_FRMCTR2},
++	{ ST7735_DATA, 0x01},
++	{ ST7735_DATA, 0x2c},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_CMD, ST7735_FRMCTR3},
++	{ ST7735_DATA, 0x01},
++	{ ST7735_DATA, 0x2c},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_DATA, 0x01},
++	{ ST7735_DATA, 0x2c},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_CMD, ST7735_INVCTR},
++	{ ST7735_DATA, 0x07},
++	{ ST7735_CMD, ST7735_PWCTR1},
++	{ ST7735_DATA, 0xa2},
++	{ ST7735_DATA, 0x02},
++	{ ST7735_DATA, 0x84},
++	{ ST7735_CMD, ST7735_PWCTR2},
++	{ ST7735_DATA, 0xc5},
++	{ ST7735_CMD, ST7735_PWCTR3},
++	{ ST7735_DATA, 0x0a},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_CMD, ST7735_PWCTR4},
++	{ ST7735_DATA, 0x8a},
++	{ ST7735_DATA, 0x2a},
++	{ ST7735_CMD, ST7735_PWCTR5},
++	{ ST7735_DATA, 0x8a},
++	{ ST7735_DATA, 0xee},
++	{ ST7735_CMD, ST7735_VMCTR1},
++	{ ST7735_DATA, 0x0e},
++	{ ST7735_CMD, ST7735_INVOFF},
++	{ ST7735_CMD, ST7735_MADCTL},
++	{ ST7735_DATA, 0xc8},
++	{ ST7735_CMD, ST7735_COLMOD},
++	{ ST7735_DATA, 0x05},
++	{ ST7735_CMD, ST7735_CASET},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x7f},
++	{ ST7735_CMD, ST7735_RASET},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x9f},
++	{ ST7735_CMD, ST7735_GMCTRP1},
++	{ ST7735_DATA, 0x02},
++	{ ST7735_DATA, 0x1c},
++	{ ST7735_DATA, 0x07},
++	{ ST7735_DATA, 0x12},
++	{ ST7735_DATA, 0x37},
++	{ ST7735_DATA, 0x32},
++	{ ST7735_DATA, 0x29},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_DATA, 0x29},
++	{ ST7735_DATA, 0x25},
++	{ ST7735_DATA, 0x2b},
++	{ ST7735_DATA, 0x39},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x01},
++	{ ST7735_DATA, 0x03},
++	{ ST7735_DATA, 0x10},
++	{ ST7735_CMD, ST7735_GMCTRN1},
++	{ ST7735_DATA, 0x03},
++	{ ST7735_DATA, 0x1d},
++	{ ST7735_DATA, 0x07},
++	{ ST7735_DATA, 0x06},
++	{ ST7735_DATA, 0x2e},
++	{ ST7735_DATA, 0x2c},
++	{ ST7735_DATA, 0x29},
++	{ ST7735_DATA, 0x2d},
++	{ ST7735_DATA, 0x2e},
++	{ ST7735_DATA, 0x2e},
++	{ ST7735_DATA, 0x37},
++	{ ST7735_DATA, 0x3f},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x00},
++	{ ST7735_DATA, 0x02},
++	{ ST7735_DATA, 0x10},
++	{ ST7735_CMD, ST7735_DISPON},
++	{ ST7735_DELAY, 100},
++	{ ST7735_CMD, ST7735_NORON},
++	{ ST7735_DELAY, 10},
++	{ ST7735_END, ST7735_END},
++};
++
++static struct fb_fix_screeninfo st7735fb_fix __devinitdata = {
++	.id =		"ST7735", 
++	.type =		FB_TYPE_PACKED_PIXELS,
++	.visual =	FB_VISUAL_PSEUDOCOLOR,
++	.xpanstep =	0,
++	.ypanstep =	0,
++	.ywrapstep =	0, 
++	.line_length =	WIDTH*BPP/8,
++	.accel =	FB_ACCEL_NONE,
++};
++
++static struct fb_var_screeninfo st7735fb_var __devinitdata = {
++	.xres =			WIDTH,
++	.yres =			HEIGHT,
++	.xres_virtual =		WIDTH,
++	.yres_virtual =		HEIGHT,
++	.bits_per_pixel =	BPP,
++	.nonstd	=		1,
++};
++
++static int st7735_write(struct st7735fb_par *par, u8 data)
++{
++	u8 txbuf[2]; /* allocation from stack must go */
++
++	txbuf[0] = data;
++
++	return spi_write(par->spi, &txbuf[0], 1);
++}
++
++static void st7735_write_data(struct st7735fb_par *par, u8 data)
++{
++	int ret = 0;
++
++	/* Set data mode */
++	gpio_set_value(par->dc, 1);
++
++	ret = st7735_write(par, data);
++	if (ret < 0)
++		pr_err("%s: write data %02x failed with status %d\n",
++			par->info->fix.id, data, ret);
++}
++
++static int st7735_write_data_buf(struct st7735fb_par *par,
++					u8 *txbuf, int size)
++{
++	/* Set data mode */
++	gpio_set_value(par->dc, 1);
++
++	/* Write entire buffer */
++	return spi_write(par->spi, txbuf, size);
++}
++
++static void st7735_write_cmd(struct st7735fb_par *par, u8 data)
++{
++	int ret = 0;
++
++	/* Set command mode */
++	gpio_set_value(par->dc, 0);
++
++	ret = st7735_write(par, data);
++	if (ret < 0)
++		pr_err("%s: write command %02x failed with status %d\n",
++			par->info->fix.id, data, ret);
++}
++
++static void st7735_run_cfg_script(struct st7735fb_par *par)
++{
++	int i = 0;
++	int end_script = 0;
++
++	do {
++		switch (st7735_cfg_script[i].cmd)
++		{
++		case ST7735_START:
++			break;
++		case ST7735_CMD:
++			st7735_write_cmd(par,
++				st7735_cfg_script[i].data & 0xff);
++			break;
++		case ST7735_DATA:
++			st7735_write_data(par,
++				st7735_cfg_script[i].data & 0xff);
++			break;
++		case ST7735_DELAY:
++			mdelay(st7735_cfg_script[i].data);
++			break;
++		case ST7735_END:
++			end_script = 1;
++		}
++		i++;
++	} while (!end_script);
++}
++
++static void st7735_set_addr_win(struct st7735fb_par *par,
++				int xs, int ys, int xe, int ye)
++{
++	st7735_write_cmd(par, ST7735_CASET);
++	st7735_write_data(par, 0x00);
++	st7735_write_data(par, xs+2);
++	st7735_write_data(par, 0x00);
++	st7735_write_data(par, xe+2);
++	st7735_write_cmd(par, ST7735_RASET);
++	st7735_write_data(par, 0x00);
++	st7735_write_data(par, ys+1);
++	st7735_write_data(par, 0x00);
++	st7735_write_data(par, ye+1);
++}
++
++static void st7735_reset(struct st7735fb_par *par)
++{
++	/* Reset controller */
++	gpio_set_value(par->rst, 0);
++	udelay(10);
++	gpio_set_value(par->rst, 1);
++	mdelay(120);
++}
++
++static void st7735fb_update_display(struct st7735fb_par *par)
++{
++	int ret = 0;
++	u8 *vmem = par->info->screen_base;
++
++	/*
++		TODO:
++		Allow a subset of pages to be passed in
++		(for deferred I/O).  Check pages against
++		pan display settings to see if they
++		should be updated.
++	*/
++	/* For now, just write the full 40KiB on each update */
++
++	/* Set row/column data window */
++	st7735_set_addr_win(par, 0, 0, WIDTH-1, HEIGHT-1);
++
++	/* Internal RAM write command */
++	st7735_write_cmd(par, ST7735_RAMWR);
++
++	/* Blast framebuffer to ST7735 internal display RAM */
++	ret = st7735_write_data_buf(par, vmem, WIDTH*HEIGHT*BPP/8);
++	if (ret < 0)
++		pr_err("%s: spi_write failed to update display buffer\n",
++			par->info->fix.id);
++}
++
++static void st7735fb_deferred_io(struct fb_info *info,
++				struct list_head *pagelist)
++{
++	st7735fb_update_display(info->par);
++}
++
++static int st7735fb_init_display(struct st7735fb_par *par)
++{
++	/* TODO: Need some error checking on gpios */
++
++        /* Request GPIOs and initialize to default values */
++        gpio_request_one(par->rst, GPIOF_OUT_INIT_HIGH,
++			"ST7735 Reset Pin");
++        gpio_request_one(par->dc, GPIOF_OUT_INIT_LOW,
++			"ST7735 Data/Command Pin");
++
++	st7735_reset(par);
++
++	st7735_run_cfg_script(par);
++
++	return 0;
++}
++
++void st7735fb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
++{
++	struct st7735fb_par *par = info->par;
++
++	sys_fillrect(info, rect);
++
++	st7735fb_update_display(par);
++}
++
++void st7735fb_copyarea(struct fb_info *info, const struct fb_copyarea *area) 
++{
++	struct st7735fb_par *par = info->par;
++
++	sys_copyarea(info, area);
++
++	st7735fb_update_display(par);
++}
++
++void st7735fb_imageblit(struct fb_info *info, const struct fb_image *image) 
++{
++	struct st7735fb_par *par = info->par;
++
++	sys_imageblit(info, image);
++
++	st7735fb_update_display(par);
++}
++
++static ssize_t st7735fb_write(struct fb_info *info, const char __user *buf,
++		size_t count, loff_t *ppos)
++{
++	struct st7735fb_par *par = info->par;
++	unsigned long p = *ppos;
++	void *dst;
++	int err = 0;
++	unsigned long total_size;
++
++	if (info->state != FBINFO_STATE_RUNNING)
++		return -EPERM;
++
++	total_size = info->fix.smem_len;
++
++	if (p > total_size)
++		return -EFBIG;
++
++	if (count > total_size) {
++		err = -EFBIG;
++		count = total_size;
++	}
++
++	if (count + p > total_size) {
++		if (!err)
++			err = -ENOSPC;
++
++		count = total_size - p;
++	}
++
++	dst = (void __force *) (info->screen_base + p);
++
++	if (copy_from_user(dst, buf, count))
++		err = -EFAULT;
++
++	if  (!err)
++		*ppos += count;
++
++	st7735fb_update_display(par);
++
++	return (err) ? err : count;
++}
++
++static struct fb_ops st7735fb_ops = {
++	.owner		= THIS_MODULE,
++	.fb_read	= fb_sys_read,
++	.fb_write	= st7735fb_write,
++	.fb_fillrect	= st7735fb_fillrect,
++	.fb_copyarea	= st7735fb_copyarea,
++	.fb_imageblit	= st7735fb_imageblit,
++};
++
++static struct fb_deferred_io st7735fb_defio = {
++	.delay		= HZ,
++	.deferred_io	= st7735fb_deferred_io,
++};
++
++static int __devinit st7735fb_probe (struct spi_device *spi)
++{
++	int chip = spi_get_device_id(spi)->driver_data;
++	struct st7735fb_platform_data *pdata = spi->dev.platform_data;
++	int vmem_size = WIDTH*HEIGHT*BPP/8;
++	u8 *vmem;
++	struct fb_info *info;
++	struct st7735fb_par *par;
++	int retval = -ENOMEM;
++
++	if (chip != ST7735_DISPLAY_AF_TFT18) {
++		pr_err("%s: only the %s device is supported\n", DRVNAME,
++			to_spi_driver(spi->dev.driver)->id_table->name);
++		return -EINVAL;
++	}
++
++	if (!pdata) {
++		pr_err("%s: platform data required for rst and dc info\n",
++			DRVNAME);
++		return -EINVAL;
++	}
++
++	vmem = vzalloc(vmem_size);
++	if (!vmem)
++		return retval;
++
++	info = framebuffer_alloc(sizeof(struct st7735fb_par), &spi->dev);
++	if (!info)
++		goto fballoc_fail;
++
++	info->screen_base = (u8 __force __iomem *)vmem;
++	info->fbops = &st7735fb_ops;
++	info->fix = st7735fb_fix;
++	info->fix.smem_len = vmem_size;
++	info->var = st7735fb_var;
++	/* Choose any packed pixel format as long as it's RGB565 */
++	info->var.red.offset = 11;
++	info->var.red.length = 5;
++	info->var.green.offset = 5;
++	info->var.green.length = 6;
++	info->var.blue.offset = 0;
++	info->var.blue.length = 5;
++	info->var.transp.offset = 0;
++	info->var.transp.length = 0;
++	info->flags = FBINFO_FLAG_DEFAULT |
++#ifdef __LITTLE_ENDIAN
++			FBINFO_FOREIGN_ENDIAN |
++#endif
++			FBINFO_VIRTFB;
++
++	info->fbdefio = &st7735fb_defio;
++	fb_deferred_io_init(info);
++
++	par = info->par;
++	par->info = info;
++	par->spi = spi;
++	par->rst = pdata->rst_gpio;
++	par->dc = pdata->dc_gpio;
++
++	retval = register_framebuffer(info);
++	if (retval < 0)
++		goto fbreg_fail;
++
++	spi_set_drvdata(spi, info);
++
++	retval = st7735fb_init_display(par);
++	if (retval < 0)
++		goto init_fail;
++
++	printk(KERN_INFO
++		"fb%d: %s frame buffer device,\n\tusing %d KiB of video memory\n",
++		info->node, info->fix.id, vmem_size);
++
++	return 0;
++
++
++	/* TODO: release gpios on fail */
++init_fail:
++	spi_set_drvdata(spi, NULL);
++
++fbreg_fail:
++	framebuffer_release(info);
++
++fballoc_fail:
++	vfree(vmem);
++
++	return retval;
++}
++
++static int __devexit st7735fb_remove(struct spi_device *spi)
++{
++	struct fb_info *info = spi_get_drvdata(spi);
++
++	spi_set_drvdata(spi, NULL);
++
++	if (info) {
++		unregister_framebuffer(info);
++		vfree(info->screen_base);	
++		framebuffer_release(info);
++	}
++
++	/* TODO: release gpios */
++
++	return 0;
++}
++
++static const struct spi_device_id st7735fb_ids[] = {
++	{ "adafruit_tft18", ST7735_DISPLAY_AF_TFT18 },
++	{ },
++};
++
++MODULE_DEVICE_TABLE(spi, st7735fb_ids);
++
++static struct spi_driver st7735fb_driver = {
++	.driver = {
++		.name   = "st7735fb",
++		.owner  = THIS_MODULE,
++	},
++	.id_table = st7735fb_ids,
++	.probe  = st7735fb_probe,
++	.remove = __devexit_p(st7735fb_remove),
++};
++
++static int __init st7735fb_init(void)
++{
++	return spi_register_driver(&st7735fb_driver);
++}
++
++static void __exit st7735fb_exit(void)
++{
++	spi_unregister_driver(&st7735fb_driver);
++}
++
++/* ------------------------------------------------------------------------- */
++
++module_init(st7735fb_init);
++module_exit(st7735fb_exit);
++
++MODULE_DESCRIPTION("FB driver for ST7735 display controller");
++MODULE_AUTHOR("Matt Porter");
++MODULE_LICENSE("GPL");
+diff --git a/include/video/st7735fb.h b/include/video/st7735fb.h
+new file mode 100644
+index 0000000..250f036
+--- /dev/null
++++ b/include/video/st7735fb.h
+@@ -0,0 +1,86 @@
++/*
++ * linux/include/video/st7735fb.h -- FB driver for ST7735 LCD controller
++ *
++ * Copyright (C) 2011, Matt Porter
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License. See the file COPYING in the main directory of this archive for
++ * more details.
++ */
++
++#define DRVNAME		"st7735fb"
++#define WIDTH		128
++#define HEIGHT		160
++#define BPP		16
++
++/* Supported display modules */
++#define ST7735_DISPLAY_AF_TFT18		0	/* Adafruit SPI TFT 1.8" */
++
++/* Init script function */
++struct st7735_function {
++	u16 cmd;
++	u16 data;
++};
++
++/* Init script commands */
++enum st7735_cmd {
++	ST7735_START,
++	ST7735_END,
++	ST7735_CMD,
++	ST7735_DATA,
++	ST7735_DELAY
++};
++
++struct st7735fb_par {
++	struct spi_device *spi;
++	struct fb_info *info;
++	int rst;
++	int dc;
++};
++
++struct st7735fb_platform_data {
++	int rst_gpio;
++	int dc_gpio;
++};
++
++/* ST7735 Commands */
++#define ST7735_NOP	0x0
++#define ST7735_SWRESET	0x01
++#define ST7735_RDDID	0x04
++#define ST7735_RDDST	0x09
++#define ST7735_SLPIN	0x10
++#define ST7735_SLPOUT	0x11
++#define ST7735_PTLON	0x12
++#define ST7735_NORON	0x13
++#define ST7735_INVOFF	0x20
++#define ST7735_INVON	0x21
++#define ST7735_DISPOFF	0x28
++#define ST7735_DISPON	0x29
++#define ST7735_CASET	0x2A
++#define ST7735_RASET	0x2B
++#define ST7735_RAMWR	0x2C
++#define ST7735_RAMRD	0x2E
++#define ST7735_COLMOD	0x3A
++#define ST7735_MADCTL	0x36
++#define ST7735_FRMCTR1	0xB1
++#define ST7735_FRMCTR2	0xB2
++#define ST7735_FRMCTR3	0xB3
++#define ST7735_INVCTR	0xB4
++#define ST7735_DISSET5	0xB6
++#define ST7735_PWCTR1	0xC0
++#define ST7735_PWCTR2	0xC1
++#define ST7735_PWCTR3	0xC2
++#define ST7735_PWCTR4	0xC3
++#define ST7735_PWCTR5	0xC4
++#define ST7735_VMCTR1	0xC5
++#define ST7735_RDID1	0xDA
++#define ST7735_RDID2	0xDB
++#define ST7735_RDID3	0xDC
++#define ST7735_RDID4	0xDD
++#define ST7735_GMCTRP1	0xE0
++#define ST7735_GMCTRN1	0xE1
++#define ST7735_PWCTR6	0xFC
++
++
++
++
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index fc8d313..50f6c53 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -2285,14 +2285,14 @@ CONFIG_FB_CFB_FILLRECT=y
 CONFIG_FB_CFB_COPYAREA=y
 CONFIG_FB_CFB_IMAGEBLIT=y
 # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-CONFIG_FB_SYS_FILLRECT=m
-CONFIG_FB_SYS_COPYAREA=m
-CONFIG_FB_SYS_IMAGEBLIT=m
+CONFIG_FB_SYS_FILLRECT=y
+CONFIG_FB_SYS_COPYAREA=y
+CONFIG_FB_SYS_IMAGEBLIT=y
 CONFIG_FB_FOREIGN_ENDIAN=y
 CONFIG_FB_BOTH_ENDIAN=y
 # CONFIG_FB_BIG_ENDIAN is not set
 # CONFIG_FB_LITTLE_ENDIAN is not set
-CONFIG_FB_SYS_FOPS=m
+CONFIG_FB_SYS_FOPS=y
 # CONFIG_FB_WMT_GE_ROPS is not set
 CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_SVGALIB is not set
@@ -2314,6 +2314,7 @@ CONFIG_FB_DA8XX_CONSISTENT_DMA_SIZE=4
 # CONFIG_FB_VIRTUAL is not set
 # CONFIG_FB_METRONOME is not set
 # CONFIG_FB_BROADSHEET is not set
+CONFIG_FB_ST7735=y
 # CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
 CONFIG_OMAP2_VRAM=y
 CONFIG_OMAP2_VRFB=y
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 6139679..aa6d056 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "83d907e1b05dabc44f3bb64532d7b58d059a14c0"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -40,7 +40,12 @@ PATCHES_OVER_PSP = " \
 	file://0013-meta-ti-Remove-debug-messages-for-meta-ti.patch \
 	file://0014-tscadc-switch-to-polling-instead-of-interrupts.patch \
 	file://0015-beaglebone-fix-ADC-init.patch \
+	file://0017-AM335x-MUX-add-ehrpwm1A.patch \
+	file://0018-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch \
+	file://0019-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
+	file://0020-beaglebone-set-default-brightness-to-50-for-pwm-back.patch \
+	file://0021-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
 "
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
+
-- 
1.7.2.5


