Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 887ACE01432
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 03:28:45 -0700 (PDT)
Received: by weyr3 with SMTP id r3so4314900wey.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 03:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cszjc5Quj5pbjasE7BAnHc5Kks2ti89OW4VW3cu42p8=;
	b=pIkBpaJ8F5Ne6EzcC8ROMOnBxZcilIhQpSHIdw7RXMuWWSeouh90wAFbTynOrwadxh
	30xPbcFWQQfJhkgep7cTLIU2Kh1tQW1fZFnJUaZROupT3UIZGP7q1CUS3WRnjsLqC86m
	tnl0Vq4+B9vlMwJp6wFAzlXJ+dUT3EiY1EPAbx75LeHFm1LLyIuBoZlvz4celqtCoQID
	mthFM2zIN++QmsT4MvGk9WcW0+dAB0mWY7NI+3FsJOcZHOmmgtwWBVUcaf4rj7k/rH72
	T+jYLcbnjftNmjhgTBI0xSs7xD6a4/0ViDHIfZLXMwpR4w3Pa+ToFLlZV2GAIVmDgXv/
	MJvQ==
Received: by 10.216.134.41 with SMTP id r41mr10053190wei.13.1337596123688;
	Mon, 21 May 2012 03:28:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fo7sm24886237wib.9.2012.05.21.03.28.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 03:28:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 21 May 2012 12:28:31 +0200
Message-Id: <1337596111-5648-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmz1N/XDfCuSAdl01ZLwm7dRDLzYhRIC9o7BO7lyUg9DeEAQmdlWX1mPUxmDWDEi/lzl1I8
Cc: denys@ti.com
Subject: [PATCH] linux-ti335x-psp 3.2: cape enhancements and patch cleanups
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
X-List-Received-Date: Mon, 21 May 2012 10:28:46 -0000

* add support for revision A2 of the 7" Beagleboardtoys cape
* allow capes to disable w1-gpio
* add stub for the Beagleboardtoys camera cape
* Fill in more entries in the am335x mux table
* switch to 4x oversampling in the tsadc driver to reduce jitter (or cursor hula dancing as Gerald describes it)
* Add a function to set the pinmux from the eeprom data instead of the boardfile
* Add support for the Bebopr cape

All beaglebone patches have been rediffed and renumbered to avoid confusion

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...1-f_rndis-HACK-around-undefined-variables.patch |    8 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    8 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    8 +-
 .../beaglebone/0004-more-beaglebone-merges.patch   |   10 +-
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |    8 +-
 ...general-purpose-mode-untested-with-touchs.patch |    6 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    6 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    8 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    8 +-
 .../0010-tscadc-Trigger-through-sysfs.patch        |    6 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    8 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    8 +-
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |    8 +-
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    8 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |    8 +-
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |    8 +-
 ...set-default-brightness-to-50-for-pwm-back.patch |    8 +-
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    8 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |    8 +-
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   10 +-
 ...add-more-beagleboardtoys-cape-partnumbers.patch |    8 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |    8 +-
 ...23-beaglebone-add-enter-key-for-lcd7-cape.patch |    8 +-
 .../0024-beaglebone-add-gpio-keys-for-lcd.patch    |    8 +-
 ...025-beaglebone-fix-direction-of-gpio-keys.patch |    8 +-
 .../0026-beaglebone-fix-3.5-lcd-cape-support.patch |    8 +-
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |    8 +-
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |    8 +-
 ...0029-beaglebone-also-report-cape-revision.patch |    8 +-
 ...don-t-compare-undefined-characters-it-mak.patch |    8 +-
 .../0031-beaglebone-fix-3.5-cape-support.patch     |    8 +-
 ...-connect-batterycape-GPIO-to-gpio-charger.patch |    8 +-
 ...lebone-add-support-for-CAN-and-RS232-cape.patch |   10 +-
 ...glebone-add-support-for-DVI-rev.-A2-capes.patch |    4 +-
 ...e-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch |    4 +-
 ...036-Beaglebone-Fixed-compiletime-warnings.patch |    4 +-
 ...Added-missing-termination-record-to-bone_.patch |    4 +-
 ...xevm.c-Beaglebone-expose-all-pwms-through.patch |    4 +-
 ...x-Fixed-debugfs-mux-output-always-reporti.patch |    4 +-
 ...export-SPI2-as-spidev-when-no-capes-are-u.patch |    4 +-
 ...king-WIP-changes-to-make-DMA-safe-and-ad.patch} |    4 +-
 ...> 0042-omap-hwmod-silence-st_shift-error.patch} |    4 +-
 ...sw-phy_device-demote-PHY-message-to-INFO.patch} |    4 +-
 ...ne-add-support-for-7-LCD-cape-revision-A2.patch |   66 ++++
 ...beaglebone-allow-capes-to-disable-w1-gpio.patch |   52 +++
 ...add-stub-for-the-camera-cape-to-disable-w.patch |   30 ++
 ...y-of-the-missing-signals-to-the-mux-table.patch |  310 +++++++++++++++++
 ...sed-part-of-LCD-bus.-Added-even-more-miss.patch |  113 ++++++
 ...c-add-defines-for-4x-and-16x-oversampling.patch |   26 ++
 .../0050-ts_tscadc-switch-to-4x-oversampling.patch |   58 ++++
 ...of-pinmux-data-array-in-EEPROM-data-struc.patch |   27 ++
 ...-Bone-Cape-configuration-from-EEPROM.-Onl.patch |  363 ++++++++++++++++++++
 ...nditional-debug-code-by-pr_debug-statemen.patch |  188 ++++++++++
 ...for-boards-with-mistaken-ASCII-interpreta.patch |   31 ++
 ...for-EEPROM-contents-blocking-further-I2C-.patch |   30 ++
 ...-on-EEPROM-revision-to-prevent-interpreti.patch |   60 ++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   25 +-
 57 files changed, 1526 insertions(+), 157 deletions(-)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch => 0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch} (96%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0044-omap-hwmod-silence-st_shift-error.patch => 0042-omap-hwmod-silence-st_shift-error.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0045-cpws-phy_device-demote-PHY-message-to-INFO.patch => 0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch} (93%)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
index 9045bb6..a76d5c1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -1,12 +1,12 @@
-From 4999df64c677cd0a32e87ccea5c1405331576d3d Mon Sep 17 00:00:00 2001
+From 0a8e60a2f92c5507739e84cdbe5fb3de3f4ee1b6 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/33] f_rndis: HACK around undefined variables
+Subject: [PATCH 01/56] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/usb/gadget/f_rndis.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/usb/gadget/f_rndis.c b/drivers/usb/gadget/f_rndis.c
 index 6614490..d2f1b6f 100644
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
index 9414a32..b227e64 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,12 +1,12 @@
-From 831a092f5cad298cb9d7d3f2d1a2d08cec82e733 Mon Sep 17 00:00:00 2001
+From 7db7d9b0c2ca8aea0ae522b7fc30c7ac034edfe2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/33] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 02/56] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/video/da8xx-fb.c |   14 ++++++++++++++
- 1 file changed, 14 insertions(+)
+ 1 files changed, 14 insertions(+), 0 deletions(-)
 
 diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
 index 2e69278..b01f15b 100644
@@ -34,5 +34,5 @@ index 2e69278..b01f15b 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index c29cfa7..680fa6a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,13 +1,13 @@
-From 83111bdeba0ddfd16b409e8c1cacd77a756507c9 Mon Sep 17 00:00:00 2001
+From 8ba62500dc8a2a033099ddcf85fd765b09c47f6d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 03/33] beaglebone: rebase everything onto 3.2 - WARNING
+Subject: [PATCH 03/56] beaglebone: rebase everything onto 3.2 - WARNING
  MEGAPATCH
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |  426 ++++++++++++++++++++++++++++++++-
- 1 file changed, 415 insertions(+), 11 deletions(-)
+ 1 files changed, 415 insertions(+), 11 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 563bdf1..2741431 100644
@@ -559,5 +559,5 @@ index 563bdf1..2741431 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
index 3b4b05c..1672a11 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
@@ -1,12 +1,12 @@
-From fda651d1a17eba23bae75e22a811a9f45c96da16 Mon Sep 17 00:00:00 2001
+From b5158f58ced19e39423d3f12b01f67435a1029b0 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 04/33] more beaglebone merges
+Subject: [PATCH 04/56] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   52 +++++++++++++++++++++++++++++++--
- 1 file changed, 50 insertions(+), 2 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   52 +++++++++++++++++++++++++++++++-
+ 1 files changed, 50 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 2741431..ffbecae 100644
@@ -103,5 +103,5 @@ index 2741431..ffbecae 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
index dc8843f..6d8fdb8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
@@ -1,12 +1,12 @@
-From 182bdf186f6dfde9d97faea406bc9d1925f18353 Mon Sep 17 00:00:00 2001
+From 590219f8dedc88345dff5e2fcac3c63501333aba Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 05/33] beaglebone: disable tsadc
+Subject: [PATCH 05/56] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ffbecae..ba611c0 100644
@@ -27,5 +27,5 @@ index ffbecae..ba611c0 100644
  
  static u8 am335x_iis_serializer_direction1[] = {
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index 720dc18..3dbd5d1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,7 @@
-From 9b99753d6e4324b98bedd6289993e57c93dbe59d Mon Sep 17 00:00:00 2001
+From d15ac41429630a7065e409079370efc4cfcb3e65 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 06/33] tscadc: Add general purpose mode, untested with
+Subject: [PATCH 06/56] tscadc: Add general purpose mode, untested with
  touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
@@ -402,5 +402,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
index 3b747f8..6852fc6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
-From 2c10000ff1538c2cfb91ebfb27054b262584ce1c Mon Sep 17 00:00:00 2001
+From 5275f0cc4c9f541711ab49e7e179a153fb61cda5 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 07/33] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 07/56] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -40,5 +40,5 @@ index c6dc6f0..b50a08c 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
index 023b6ab..fe1db5c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,12 +1,12 @@
-From 8b4f4ecc8c831a5bfa87ee66faada2d9d28c5fb4 Mon Sep 17 00:00:00 2001
+From e9aa7ff6f36d532d2268cd3b91555cbeb72fda4f Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 08/33] AM335X: init tsc bone style for new boards
+Subject: [PATCH 08/56] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 64a0c0a..6b78ae6 100644
@@ -22,5 +22,5 @@ index 64a0c0a..6b78ae6 100644
  };
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
index f100a6d..8d73637 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,12 +1,12 @@
-From fb47de51034c21646d79aef0605a7a84b9fb6dcf Mon Sep 17 00:00:00 2001
+From 7042bb10731908812bc3b248b963899898773c4b Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 09/33] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 09/56] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
+ 1 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index b50a08c..6083de7 100644
@@ -42,5 +42,5 @@ index b50a08c..6083de7 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
index 50407fa..27052fc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
-From a45b9634ecd2d8251c86ff2111e7202471f3f842 Mon Sep 17 00:00:00 2001
+From 23f1ea4e1324704d36381cf1a2b6d4578c5f3fb4 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 10/33] tscadc: Trigger through sysfs
+Subject: [PATCH 10/56] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -145,5 +145,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
index 5ecb48c..d6d6a8f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,12 +1,12 @@
-From a893b2486f36716a3196fa58fae5b7d973976b5a Mon Sep 17 00:00:00 2001
+From 44e604188006ae23fb48fe27b68b20cc9e3b20cb Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 11/33] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 11/56] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index d6aec8c..da48bcd 100644
@@ -30,5 +30,5 @@ index d6aec8c..da48bcd 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
index 92375cc..86ef82e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,12 +1,12 @@
-From f0963a18454ca4943c436432300d310b6f4ebd16 Mon Sep 17 00:00:00 2001
+From 04b4ae6caf9912acb99b294ab946ca88146ec6a9 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 12/33] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 12/56] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |   16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
+ 1 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index da48bcd..4fd2e18 100644
@@ -50,5 +50,5 @@ index da48bcd..4fd2e18 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
index 6e3a9ce..b15e894 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
@@ -1,12 +1,12 @@
-From a1dabedca0bb4b1e016036368fa1888e21514570 Mon Sep 17 00:00:00 2001
+From 14830f07a752e8c2d643a307ebb5e268008d9c04 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 13/33] beaglebone: fix ADC init
+Subject: [PATCH 13/56] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
+ 1 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 6b78ae6..ffbecae 100644
@@ -43,5 +43,5 @@ index 6b78ae6..ffbecae 100644
  };
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
index d50acc2..3fec092 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
@@ -1,12 +1,12 @@
-From 32868ed9e44bf2cf9193e4bb8a903c20ca5a8d93 Mon Sep 17 00:00:00 2001
+From ae3da1ea2d7c8b915e8eebec7d5f3524f53bf510 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 16:49:52 +0100
-Subject: [PATCH 14/33] AM335x: MUX: add ehrpwm1A
+Subject: [PATCH 14/56] AM335x: MUX: add ehrpwm1A
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/mux33xx.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
 index 572ed16..0f71646 100644
@@ -22,5 +22,5 @@ index 572ed16..0f71646 100644
  		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
  		NULL, NULL, NULL, "gpio1_19"),
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
index f70e898..e20d320 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -1,13 +1,13 @@
-From 28cbad5cd7338d27e6f440c26b508a171640df85 Mon Sep 17 00:00:00 2001
+From 8930849074cc11163a2f176927d4e76072d4fb80 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 17:02:10 +0100
-Subject: [PATCH 15/33] beaglebone: enable PWM for lcd backlight <- backlight
+Subject: [PATCH 15/56] beaglebone: enable PWM for lcd backlight <- backlight
  is inverted
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   51 +++++++++++++++++++++++++++------
- 1 file changed, 42 insertions(+), 9 deletions(-)
+ 1 files changed, 42 insertions(+), 9 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ffbecae..43a83ca 100644
@@ -119,5 +119,5 @@ index ffbecae..43a83ca 100644
  	}
  	
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
index d3e8e0e..0ef109c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -1,7 +1,7 @@
-From ba233d60909b0b895c28f88c5714ebcb68b87617 Mon Sep 17 00:00:00 2001
+From e099fdb60eae41faea813fd1098af28b38f050d1 Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
 Date: Mon, 18 Jul 2011 23:13:41 -0500
-Subject: [PATCH 16/33] omap_hsmmc: Set dto to max value of 14 to avoid SD
+Subject: [PATCH 16/56] omap_hsmmc: Set dto to max value of 14 to avoid SD
  Card timeouts
 
 This fixes MMC errors due to timeouts on certain SD Cards following suggestions
@@ -13,7 +13,7 @@ http://talk.maemo.org/showthread.php?p=1000707#post1000707
 This fix was originally proposed by Sukumar Ghoral of TI.
 ---
  drivers/mmc/host/omap_hsmmc.c |    3 +++
- 1 file changed, 3 insertions(+)
+ 1 files changed, 3 insertions(+), 0 deletions(-)
 
 diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
 index 1f938d9..ace26f7 100644
@@ -30,5 +30,5 @@ index 1f938d9..ace26f7 100644
  	reg |= dto << DTO_SHIFT;
  	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
index 2c2c455..3ad8b52 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -1,13 +1,13 @@
-From 2d746bba72e5334bbf6269e1063dea891ad58394 Mon Sep 17 00:00:00 2001
+From 8de8f4d2da1d92847f27babbf3a91ca960afdbc9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 1 Feb 2012 14:10:38 +0100
-Subject: [PATCH 17/33] beaglebone: set default brightness to 50% for pwm
+Subject: [PATCH 17/56] beaglebone: set default brightness to 50% for pwm
  backlights
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 43a83ca..97b069f 100644
@@ -23,5 +23,5 @@ index 43a83ca..97b069f 100644
  
  #define PWM_DEVICE_ID   "ecap.0"
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
index 46fafa0..d6a06f1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -1,7 +1,7 @@
-From 5d3a23267ebf757159b1dce032505d0c15683909 Mon Sep 17 00:00:00 2001
+From 4d3af135dec5fcd7119e62c17d5db6d678ad68d5 Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Mon, 21 Nov 2011 12:55:23 -0500
-Subject: [PATCH 18/33] st7735fb: WIP framebuffer driver supporting Adafruit
+Subject: [PATCH 18/56] st7735fb: WIP framebuffer driver supporting Adafruit
  1.8" SPI LCD
 
 Signed-off-by: Matt Porter <mporter@ti.com>
@@ -11,7 +11,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  drivers/video/Makefile   |    1 +
  drivers/video/st7735fb.c |  516 ++++++++++++++++++++++++++++++++++++++++++++++
  include/video/st7735fb.h |   86 ++++++++
- 4 files changed, 614 insertions(+)
+ 4 files changed, 614 insertions(+), 0 deletions(-)
  create mode 100644 drivers/video/st7735fb.c
  create mode 100644 include/video/st7735fb.h
 
@@ -664,5 +664,5 @@ index 0000000..250f036
 +
 +
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
index d5b6a27..96390aa 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
@@ -1,12 +1,12 @@
-From f70a6f936227f65da0e5bff0e72ad59fe2c9b36f Mon Sep 17 00:00:00 2001
+From 6a862f51ac8eca5e4e00acdc13a73db521eb74fa Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 7 Feb 2012 11:01:13 +0100
-Subject: [PATCH 19/33] beaglebone: use P8_6 (gpio1_3) as w1 bus
+Subject: [PATCH 19/56] beaglebone: use P8_6 (gpio1_3) as w1 bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
+ 1 files changed, 31 insertions(+), 0 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 97b069f..3ba4bbc 100644
@@ -79,5 +79,5 @@ index 97b069f..3ba4bbc 100644
  };
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
index 313d140..80e2b1e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -1,13 +1,13 @@
-From 3554b72659f168b6b699a02a57e9d91471ad7c32 Mon Sep 17 00:00:00 2001
+From fc2a970788a0181b495f79a78b35e6bdd6987aa8 Mon Sep 17 00:00:00 2001
 From: Alessandro Zummo <a.zummo@towertech.it>
 Date: Thu, 9 Feb 2012 12:46:52 +0100
-Subject: [PATCH 20/33] beaglebone: add support for Towertech TT3201 CAN cape
+Subject: [PATCH 20/56] beaglebone: add support for Towertech TT3201 CAN cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   54 ++++++++++++++++++++++++++++++++-
- arch/arm/mach-omap2/mux33xx.c         |    8 ++---
- drivers/net/can/dev.c                 |    8 ++---
+ arch/arm/mach-omap2/mux33xx.c         |    8 ++--
+ drivers/net/can/dev.c                 |    8 ++--
  drivers/net/can/mcp251x.c             |   47 ++++++++++++++++++++++------
  4 files changed, 98 insertions(+), 19 deletions(-)
 
@@ -316,5 +316,5 @@ index 330140e..b3e231c 100644
  	}
  error_probe:
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index 937c03a..b242789 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -1,12 +1,12 @@
-From 33f4b51e615b9550acdb99de61427e1aa46db4b3 Mon Sep 17 00:00:00 2001
+From b7bcc2d2d68f0683ee25027fa33afd43357912cb Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 12:01:35 +0100
-Subject: [PATCH 21/33] beaglebone: add more beagleboardtoys cape partnumbers
+Subject: [PATCH 21/56] beaglebone: add more beagleboardtoys cape partnumbers
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   25 ++++++++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
+ 1 files changed, 24 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index a8dfcdf..f854329 100644
@@ -49,5 +49,5 @@ index a8dfcdf..f854329 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index d219f97..e29a568 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -1,13 +1,13 @@
-From 73da74ec5becc06d598a1ddcc435ed9fb277d0ce Mon Sep 17 00:00:00 2001
+From 7d829ebc289c6e311171cb3974e428ed2562c0ad Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 13:32:43 +0100
-Subject: [PATCH 22/33] beaglebone: add gpio-keys for lcd7, add notes for
+Subject: [PATCH 22/56] beaglebone: add gpio-keys for lcd7, add notes for
  missing functionality for other capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   79 +++++++++++++++++++++++++++++++++
- 1 file changed, 79 insertions(+)
+ 1 files changed, 79 insertions(+), 0 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index f854329..9e9cf5b 100644
@@ -126,5 +126,5 @@ index f854329..9e9cf5b 100644
  	}
  	
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
index 6d0d3d3..4b8faef 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
@@ -1,12 +1,12 @@
-From 47651bc2ba05d4d5f8a7d10a9c55ad915a4e3500 Mon Sep 17 00:00:00 2001
+From d7eecab57e0c72ef16663b45d2e1498368cfe9fe Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 14:26:37 +0100
-Subject: [PATCH 23/33] beaglebone: add enter key for lcd7 cape
+Subject: [PATCH 23/56] beaglebone: add enter key for lcd7 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    9 +++++++++
- 1 file changed, 9 insertions(+)
+ 1 files changed, 9 insertions(+), 0 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 9e9cf5b..8c78eb5 100644
@@ -36,5 +36,5 @@ index 9e9cf5b..8c78eb5 100644
  
  static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
index 7de222e..3fb1d9d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
@@ -1,12 +1,12 @@
-From 555493dc65a5f0ff80bfb8fc60a10bb8c0fef0de Mon Sep 17 00:00:00 2001
+From 15f9d6c3d2ea7b9c932b311e7b615735bb940f01 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 15:15:06 +0100
-Subject: [PATCH 24/33] beaglebone: add gpio-keys for lcd
+Subject: [PATCH 24/56] beaglebone: add gpio-keys for lcd
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   82 +++++++++++++++++++++++++++++++--
- 1 file changed, 78 insertions(+), 4 deletions(-)
+ 1 files changed, 78 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 8c78eb5..5266f78 100644
@@ -109,5 +109,5 @@ index 8c78eb5..5266f78 100644
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
index 4edc4c8..39f255b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
@@ -1,12 +1,12 @@
-From c33d25585e467ab54b3db2d3c5b403e071150751 Mon Sep 17 00:00:00 2001
+From 9ae51575e2d99c806ee5caabb4a11a380e5e9b7b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 26 Mar 2012 20:28:56 +0200
-Subject: [PATCH 25/33] beaglebone: fix direction of gpio-keys
+Subject: [PATCH 25/56] beaglebone: fix direction of gpio-keys
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ 1 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 5266f78..36b0c85 100644
@@ -103,5 +103,5 @@ index 5266f78..36b0c85 100644
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
index 60ea055..879920d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
@@ -1,7 +1,7 @@
-From 23c8aaf1d86378c6d4325b88ec85ac7d8130e86a Mon Sep 17 00:00:00 2001
+From 1979148439115875ee92c370e369a28ba3b5f37c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 29 Feb 2012 17:25:22 +0100
-Subject: [PATCH 26/33] beaglebone: fix 3.5" lcd cape support
+Subject: [PATCH 26/56] beaglebone: fix 3.5" lcd cape support
 
 * proper timings
 * fix gpio conflict
@@ -10,7 +10,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
  drivers/video/da8xx-fb.c              |   14 +++++++++++
- 2 files changed, 55 insertions(+), 1 deletion(-)
+ 2 files changed, 55 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 36b0c85..127516f 100644
@@ -105,5 +105,5 @@ index b01f15b..86b19ac 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
index 0b99d3b..414a958 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
@@ -1,13 +1,13 @@
-From 91190bb0f7c8b075011701e44daffc0f1a8ca766 Mon Sep 17 00:00:00 2001
+From 07553571e947d49d906d5f12fd0cb4eac6a8c4e5 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 11:25:00 +0200
-Subject: [PATCH 27/33] beaglebone: decrease PWM frequency to old value, LCD7
+Subject: [PATCH 27/56] beaglebone: decrease PWM frequency to old value, LCD7
  doesn't like it
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 127516f..4d5238d 100644
@@ -23,5 +23,5 @@ index 127516f..4d5238d 100644
  #define PWM_DEVICE_ID   "ecap.0"
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
index 3d725d0..42e945f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
@@ -1,12 +1,12 @@
-From 61314ea39f2f7cbf5e72efa93350820b83b95fd9 Mon Sep 17 00:00:00 2001
+From 1ca68f8e87f5825a54c41f5d1fbf90fc2c09496c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:35:01 +0200
-Subject: [PATCH 28/33] beaglebone: fix ehrpwm backlight
+Subject: [PATCH 28/56] beaglebone: fix ehrpwm backlight
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    1 +
- 1 file changed, 1 insertion(+)
+ 1 files changed, 1 insertions(+), 0 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 4d5238d..24ed0b6 100644
@@ -21,5 +21,5 @@ index 4d5238d..24ed0b6 100644
  
  /* Setup pwm-backlight for bbtoys7lcd */
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
index 86db3fc..6dc4a4b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
@@ -1,12 +1,12 @@
-From dc1f8ab451ceb72da5d6d2bf8418dc0b0043723c Mon Sep 17 00:00:00 2001
+From 247ab0d5d63145121e94afaee1b221545d37eb20 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:57:38 +0200
-Subject: [PATCH 29/33] beaglebone: also report cape revision
+Subject: [PATCH 29/56] beaglebone: also report cape revision
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ 1 files changed, 3 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 24ed0b6..a4e113c 100644
@@ -32,5 +32,5 @@ index 24ed0b6..a4e113c 100644
  	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
index 7e4168f..7af3073 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
@@ -1,13 +1,13 @@
-From 7757a6ad6989fc4baeb7fcd8a1784531cdfc76c8 Mon Sep 17 00:00:00 2001
+From e33f195b5e929944ce6934c38a135821f8206a1a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 07:55:55 +0200
-Subject: [PATCH 30/33] beaglebone: don't compare undefined characters, it
+Subject: [PATCH 30/56] beaglebone: don't compare undefined characters, it
  makes strncomp fail
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index a4e113c..f2f03b6 100644
@@ -23,5 +23,5 @@ index a4e113c..f2f03b6 100644
  		dvi_init(0,0);
  	}
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
index 72df38c..f7e47de 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
@@ -1,12 +1,12 @@
-From 6114856631437ebac4469713e5b7ec2b1094f536 Mon Sep 17 00:00:00 2001
+From 138b017b71191f87a5f00f94995f144e432b8d9f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 14:33:53 +0200
-Subject: [PATCH 31/33] beaglebone: fix 3.5" cape support
+Subject: [PATCH 31/56] beaglebone: fix 3.5" cape support
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
- 1 file changed, 41 insertions(+), 1 deletion(-)
+ 1 files changed, 41 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index f2f03b6..3adc4ac 100644
@@ -69,5 +69,5 @@ index f2f03b6..3adc4ac 100644
  	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
  	if (conf_disp_pll(16000000)) {
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
index 8eb4233..7f922d8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
@@ -1,12 +1,12 @@
-From b81fd612ad4d08415df513e2627b35439cd921e5 Mon Sep 17 00:00:00 2001
+From dbae54fe993315205d8415ef78e83f149c829a9b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 25 Apr 2012 12:35:07 +0200
-Subject: [PATCH 32/33] beaglebone: connect batterycape GPIO to gpio-charger
+Subject: [PATCH 32/56] beaglebone: connect batterycape GPIO to gpio-charger
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   46 ++++++++++++++++++++++++++++++++-
- 1 file changed, 45 insertions(+), 1 deletion(-)
+ 1 files changed, 45 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 3adc4ac..717bb8c 100644
@@ -80,5 +80,5 @@ index 3adc4ac..717bb8c 100644
  	
  	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
index e70ebd4..6d8b646 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
@@ -1,12 +1,12 @@
-From 0bed6db60e5a5bf78931b7da0376676a14bfce6f Mon Sep 17 00:00:00 2001
+From 2345361d8188eb3a946f2a0ab9e648eba2cc9c27 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 4 May 2012 13:19:45 +0200
-Subject: [PATCH 33/33] beaglebone: add support for CAN and RS232 cape
+Subject: [PATCH 33/56] beaglebone: add support for CAN and RS232 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++------
- 1 file changed, 30 insertions(+), 6 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++-----
+ 1 files changed, 30 insertions(+), 6 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 717bb8c..6e7b203 100644
@@ -63,5 +63,5 @@ index 717bb8c..6e7b203 100644
  	}
  	
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
index cd04c5e..14e7cd6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
@@ -1,7 +1,7 @@
-From b97227a0f246edd115cba03d8509c2b7460a815b Mon Sep 17 00:00:00 2001
+From 64918c14ce7c12660cdf3b7650d6992a4eb7a69e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 14:23:06 +0200
-Subject: [PATCH 34/40] beaglebone: add support for DVI rev. A2 capes
+Subject: [PATCH 34/56] beaglebone: add support for DVI rev. A2 capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
index f50bdf6..3d05376 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
@@ -1,7 +1,7 @@
-From 080d90fddb1c39a5197b56b3aab0a7701adced75 Mon Sep 17 00:00:00 2001
+From 11a78ddde39b0ae90c718b724426e01b6af3f8e1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 11 May 2012 13:08:24 +0200
-Subject: [PATCH 35/40] beaglebone: enable LEDs for DVI, LCD3 and LCD7 capes
+Subject: [PATCH 35/56] beaglebone: enable LEDs for DVI, LCD3 and LCD7 capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
index 8e82e1f..c576682 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
@@ -1,7 +1,7 @@
-From 8688e4d9d9bdf1a9ff34b77b9a5b5ac22ca1c548 Mon Sep 17 00:00:00 2001
+From b038926e4aa0feeeb20bbcf5bb24765ae40162f5 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:06:24 +0200
-Subject: [PATCH 36/40] Beaglebone: Fixed compiletime warnings.
+Subject: [PATCH 36/56] Beaglebone: Fixed compiletime warnings.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 ---
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
index dcef3aa..e40cd63 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
@@ -1,7 +1,7 @@
-From f1f19044cff0ac6a145c4f14782e4ddb78bb38cb Mon Sep 17 00:00:00 2001
+From 387e0633f95924f2e70dd48651720c6718e0ff2f Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:18:52 +0200
-Subject: [PATCH 37/40] Beaglebone: Added missing termination record to
+Subject: [PATCH 37/56] Beaglebone: Added missing termination record to
  bone_pin_mux data.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
index 0607be3..cf0730e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
@@ -1,7 +1,7 @@
-From 557ed6bc4850bcb4610ff1b9e024a4fd13785c27 Mon Sep 17 00:00:00 2001
+From adcb99ec934a692e4bdeb993901f5df89188a32c Mon Sep 17 00:00:00 2001
 From: Rob Kellett <r-kellett@ti.com>
 Date: Mon, 14 May 2012 09:35:35 +0100
-Subject: [PATCH 38/40] board-am335xevm.c: Beaglebone - expose all pwms
+Subject: [PATCH 38/56] board-am335xevm.c: Beaglebone - expose all pwms
  through sysfs
 
 ---
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
index 7df5c20..d4240cf 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
@@ -1,7 +1,7 @@
-From b8241eee030b29f23a5792de1eec03830699ae98 Mon Sep 17 00:00:00 2001
+From d38171c24019061250e120d554ad89199c58ad53 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:09:57 +0200
-Subject: [PATCH 39/40] ARM: OMAP: Mux: Fixed debugfs mux output (always
+Subject: [PATCH 39/56] ARM: OMAP: Mux: Fixed debugfs mux output (always
  reporting pins as output)
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
index 4a004d7..3fe08e4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
@@ -1,7 +1,7 @@
-From d4527038dac639f1066b529cbcc368de91d2f525 Mon Sep 17 00:00:00 2001
+From b42299b9cd05cb162cd2364fa41e7307515b8a55 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 14 May 2012 14:23:45 +0200
-Subject: [PATCH 40/40] beaglebone: export SPI2 as spidev when no capes are
+Subject: [PATCH 40/56] beaglebone: export SPI2 as spidev when no capes are
  using SPI
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
similarity index 96%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
index 5e4b6b3..da872b1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
@@ -1,7 +1,7 @@
-From 783a66842e956b2eb9d7dc379848fbf79a370bc8 Mon Sep 17 00:00:00 2001
+From eef1e8089f452606aa32ee57b6a39783bd26e51f Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Wed, 28 Mar 2012 23:35:44 -0400
-Subject: [PATCH] st7735fb: Working WIP changes to make DMA safe and add
+Subject: [PATCH 41/56] st7735fb: Working WIP changes to make DMA safe and add
  endian fix
 
 This removes the "from the stack" allocation of 1 byte buffers
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
index 7991f0a..d29624c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
@@ -1,7 +1,7 @@
-From 4119ec2ea20b7ae4095049e9f192c751559fbb87 Mon Sep 17 00:00:00 2001
+From 60182b1efd893c0e8c4c6176d2ce0e766d702abb Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 16 May 2012 17:57:31 +0200
-Subject: [PATCH] omap hwmod: silence st_shift error
+Subject: [PATCH 42/56] omap hwmod: silence st_shift error
 
 During boot the following error is shown:
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
index 2aed646..09160ba 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
@@ -1,7 +1,7 @@
-From 04924dfd0335b8adca0e7783112827df30e70a5f Mon Sep 17 00:00:00 2001
+From e846fa8a57d5f050fdb382e8d5599d9b0341a111 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 17 May 2012 10:59:18 +0200
-Subject: [PATCH] cpsw,phy_device: demote PHY message to INFO
+Subject: [PATCH 43/56] cpsw,phy_device: demote PHY message to INFO
 
 This keeps them from appearing on the screen when booting with 'quiet'
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
new file mode 100644
index 0000000..c3697bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
@@ -0,0 +1,66 @@
+From 994f87a816d1bd28483e34df8dfa68950eb70c72 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 18 May 2012 12:17:12 +0200
+Subject: [PATCH 44/56] beaglebone: add support for 7" LCD cape revision A2
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   24 +++++++++++++++++++++---
+ 1 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index a0fa53a..5bb71b1 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -629,6 +629,14 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Module pin mux for Beagleboardtoys 7" LCD cape */
++static struct pinmux_config bbtoys7a2_pin_mux[] = {
++	{"gpmc_csn2.gpio1_31", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // AVDD_EN
++	{"gpmc_a2.ehrpwm1A", OMAP_MUX_MODE6 | AM33XX_PIN_OUTPUT}, // Backlight
++	{NULL, 0},
++};
++
++
+ static struct pinmux_config w1_gpio_pin_mux[] = {
+ 	{"gpmc_ad3.gpio1_3",	OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
+ 	{NULL, 0},
+@@ -1595,13 +1603,11 @@ static void lcdc_init(int evm_id, int profile)
+ }
+ 
+ #define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
++#define BEAGLEBONE_LCD7A2_AVDD_EN GPIO_TO_PIN(1, 31)
+ 
+ static void bbtoys7lcd_init(int evm_id, int profile)
+ {
+ 	setup_pin_mux(lcdc16_pin_mux);
+-	setup_pin_mux(bbtoys7_pin_mux);
+-	gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
+-	gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
+ 
+ 	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
+ 	if (conf_disp_pll(300000000)) {
+@@ -2292,6 +2298,18 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	}
+ 	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
++
++		if (!strncmp("00A2", cape_config.version, 4)) {
++			setup_pin_mux(bbtoys7a2_pin_mux);
++			gpio_request(BEAGLEBONE_LCD7A2_AVDD_EN, "BONE_LCD_AVDD_EN");
++			gpio_direction_output(BEAGLEBONE_LCD7A2_AVDD_EN, 1);
++		} else {
++			setup_pin_mux(bbtoys7_pin_mux);
++			gpio_request(BEAGLEBONE_LCD_AVDD_EN, "BONE_LCD_AVDD_EN");
++			gpio_direction_output(BEAGLEBONE_LCD_AVDD_EN, 1);
++			bbtoys7lcd_init(0,0);
++		}
++
+ 		bbtoys7lcd_init(0,0);
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
new file mode 100644
index 0000000..7d12172
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
@@ -0,0 +1,52 @@
+From bddb03181fef4172d529717ff1c613a1770d737c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 18 May 2012 12:39:25 +0200
+Subject: [PATCH 45/56] beaglebone: allow capes to disable w1-gpio
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 5bb71b1..5c89494 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -498,7 +498,7 @@ static int capecount = 0;
+ static bool beaglebone_tsadcpins_free = 1;
+ static bool beaglebone_leds_free = 1;
+ static bool beaglebone_spi1_free = 1;
+-
++static bool beaglebone_w1gpio_free = 1;
+ 
+ #define GP_EVM_REV_IS_1_0		0x1
+ #define GP_EVM_REV_IS_1_0A		0x1
+@@ -1727,6 +1727,7 @@ static void lcd7leds_init(int evm_id, int profile )
+ 
+ static void bonew1_gpio_init(int evm_id, int profile )
+ {
++	beaglebone_w1gpio_free = 0;
+ 	int err;
+ 	setup_pin_mux(w1_gpio_pin_mux);
+ 	err = platform_device_register(&bone_w1_device);
+@@ -2258,6 +2259,9 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 				setup_pin_mux(spi1_pin_mux);
+ 				spi_register_board_info(bone_spidev2_info, ARRAY_SIZE(bone_spidev2_info));
+ 			}
++			if(beaglebone_w1gpio_free == 1) {
++				bonew1_gpio_init(0,0);
++			}
+ 		}
+ 		return;
+ 	}
+@@ -2831,7 +2835,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+ 	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
+-	{bonew1_gpio_init, DEV_ON_BASEBOARD, PROFILE_ALL},
+ 	{NULL, 0, 0},
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
new file mode 100644
index 0000000..5726f2f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
@@ -0,0 +1,30 @@
+From d338dc3eff341be3e3c038e300e1636c1b667b0c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 18 May 2012 12:58:16 +0200
+Subject: [PATCH 46/56] beaglebone: add stub for the camera cape to disable
+ w1-gpio
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 5c89494..ece4e46 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2384,6 +2384,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing CAN cape\n");
+ 		tt3201_init(0,0);
+ 	}
++
++	if (!strncmp("BB-BONE-CAM-01", cape_config.partnumber, 14)) {
++		pr_info("BeagleBone cape: recognized Camera cape\n");
++		beaglebone_w1gpio_free = 0;
++	}
+ 	
+ 	if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
+ 		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
new file mode 100644
index 0000000..f20aa6c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
@@ -0,0 +1,310 @@
+From 6d5deaa1b63e1b6fc5c72c98cf44bcc5bd919974 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:16:34 +0200
+Subject: [PATCH 47/56] Adding many of the missing signals to the mux table.
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+---
+ arch/arm/mach-omap2/mux33xx.c |  197 +++++++++++++++++++++--------------------
+ 1 files changed, 101 insertions(+), 96 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 25dcedb..26ecd66 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -28,6 +28,11 @@
+ }
+ 
+ /* AM33XX pin mux super set */
++/* 20120513 - SJL added a lot of missing signals using datasheet rev. C.
++ *            Converted all names to lower case, except for the A and B
++ *            channel suffixes, as that seems to be the rule.
++ *            Marked lines with completed spec by leading empty comment.
++ */
+ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(GPMC_AD0, 0,
+ 		"gpmc_ad0", "mmc1_dat0", NULL, NULL,
+@@ -53,21 +58,21 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(GPMC_AD7, 0,
+ 		"gpmc_ad7", "mmc1_dat7", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_7"),
+-	_AM33XX_MUXENTRY(GPMC_AD8, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD8, 0,
+ 		"gpmc_ad8", "lcd_data16", "mmc1_dat0", "mmc2_dat4",
+-		NULL, NULL, NULL, "gpio0_22"),
+-	_AM33XX_MUXENTRY(GPMC_AD9, 0,
++		"ehrpwm2A", "pr1_mii_mt0_clk", NULL, "gpio0_22"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD9, 0,
+ 		"gpmc_ad9", "lcd_data17", "mmc1_dat1", "mmc2_dat5",
+-		"ehrpwm2B", NULL, NULL, "gpio0_23"),
+-	_AM33XX_MUXENTRY(GPMC_AD10, 0,
++		"ehrpwm2B", "pr1_mii0_col", NULL, "gpio0_23"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD10, 0,
+ 		"gpmc_ad10", "lcd_data18", "mmc1_dat2", "mmc2_dat6",
+-		NULL, NULL, NULL, "gpio0_26"),
+-	_AM33XX_MUXENTRY(GPMC_AD11, 0,
++		"ehrpwm2_tripzone_input", "pr1_mii0_txen", NULL, "gpio0_26"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD11, 0,
+ 		"gpmc_ad11", "lcd_data19", "mmc1_dat3", "mmc2_dat7",
+-		NULL, NULL, NULL, "gpio0_27"),
+-	_AM33XX_MUXENTRY(GPMC_AD12, 0,
++		"ehrpwm0_synco", "pr1_mii0_txd3", NULL, "gpio0_27"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD12, 0,
+ 		"gpmc_ad12", "lcd_data20", "mmc1_dat4", "mmc2_dat0",
+-		NULL, NULL, NULL, "gpio1_12"),
++		"eqep2a_in", "pr1_mii0_txd2", "pr1_pru0_pru_r30_14", "gpio1_12"),
+ 	_AM33XX_MUXENTRY(GPMC_AD13, 0,
+ 		"gpmc_ad13", "lcd_data21", "mmc1_dat5", "mmc2_dat1",
+ 		NULL, NULL, NULL, "gpio1_13"),
+@@ -77,33 +82,33 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(GPMC_AD15, 0,
+ 		"gpmc_ad15", "lcd_data23", "mmc1_dat7", "mmc2_dat3",
+ 		NULL, NULL, NULL, "gpio1_15"),
+-	_AM33XX_MUXENTRY(GPMC_A0, 0,
+-		"gpmc_a0", "mii2_txen", "rgmii2_tctl", "rmii2_txen",
+-		NULL, NULL, NULL, "gpio1_16"),
+-	_AM33XX_MUXENTRY(GPMC_A1, 0,
+-		"gpmc_a1", "mii2_rxdv", "rgmii2_rctl", "mmc2_dat0",
+-		NULL, NULL, NULL, "gpio1_17"),
+-	_AM33XX_MUXENTRY(GPMC_A2, 0,
+-		"gpmc_a2", "mii2_txd3", "rgmii2_td3", "mmc2_dat1",
+-		NULL, NULL, "ehrpwm1A", "gpio1_18"),
+-	_AM33XX_MUXENTRY(GPMC_A3, 0,
+-		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
+-		NULL, NULL, NULL, "gpio1_19"),
+-	_AM33XX_MUXENTRY(GPMC_A4, 0,
+-		"gpmc_a4", "mii2_txd1", "rgmii2_td1", "rmii2_txd1",
+-		"gpmc_a20", NULL, NULL, "gpio1_20"),
+-	_AM33XX_MUXENTRY(GPMC_A5, 0,
+-		"gpmc_a5", "mii2_txd0", "rgmii2_td0", "rmii2_txd0",
+-		"gpmc_a21", NULL, NULL, "gpio1_21"),
+-	_AM33XX_MUXENTRY(GPMC_A6, 0,
+-		"gpmc_a6", "mii2_txclk", "rgmii2_tclk", "mmc2_dat4",
+-		"gpmc_a22", NULL, NULL, "gpio1_22"),
+-	_AM33XX_MUXENTRY(GPMC_A7, 0,
+-		"gpmc_a7", "mii2_rxclk", "rgmii2_rclk", "mmc2_dat5",
+-		NULL, NULL, NULL, "gpio1_23"),
+-	_AM33XX_MUXENTRY(GPMC_A8, 0,
+-		"gpmc_a8", "mii2_rxd3", "rgmii2_rd3", "mmc2_dat6",
+-		NULL, NULL, "mcasp0_aclkx", "gpio1_24"),
++/**/	_AM33XX_MUXENTRY(GPMC_A0, 0,
++		"gpmc_a0", "gmii2_txen", "rgmii2_tctl", "rmii2_txen",
++		"gpmc_a16", "pr1_mii_mt1_clk", "ehrpwm1_tripzone_input", "gpio1_16"),
++/**/	_AM33XX_MUXENTRY(GPMC_A1, 0,
++		"gpmc_a1", "gmii2_rxdv", "rgmii2_rctl", "mmc2_dat0",
++		"gpmc_a17", "pr1_mii1_txd3", "ehrpwm0_synco", "gpio1_17"),
++/**/	_AM33XX_MUXENTRY(GPMC_A2, 0,
++		"gpmc_a2", "gmii2_txd3", "rgmii2_td3", "mmc2_dat1",
++		"gpmc_a18", "pr1_mii1_txd2", "ehrpwm1A", "gpio1_18"),
++/**/	_AM33XX_MUXENTRY(GPMC_A3, 0,
++		"gpmc_a3", "gmii2_txd2", "rgmii2_td2", "mmc2_dat2",
++		"gpmc_a19", "pr1_mii1_txd1", "ehrpwm1B", "gpio1_19"),
++/**/	_AM33XX_MUXENTRY(GPMC_A4, 0,
++		"gpmc_a4", "gmii2_txd1", "rgmii2_td1", "rmii2_txd1",
++		"gpmc_a20", "pr1_mii1_txd0", "eqep1a_in", "gpio1_20"),
++/**/	_AM33XX_MUXENTRY(GPMC_A5, 0,
++		"gpmc_a5", "gmii2_txd0", "rgmii2_td0", "rmii2_txd0",
++		"gpmc_a21", "pr1_mii1_rxd3", "eqep1b_in", "gpio1_21"),
++/**/	_AM33XX_MUXENTRY(GPMC_A6, 0,
++		"gpmc_a6", "gmii2_txclk", "rgmii2_tclk", "mmc2_dat4",
++		"gpmc_a22", "pr1_mii1_rxd2", "eqep1_index", "gpio1_22"),
++/**/	_AM33XX_MUXENTRY(GPMC_A7, 0,
++		"gpmc_a7", "gmii2_rxclk", "rgmii2_rclk", "mmc2_dat5",
++		"gpmc_a23", "pr1_mii1_rxd1", "eqep1_strobe", "gpio1_23"),
++/**/	_AM33XX_MUXENTRY(GPMC_A8, 0,
++		"gpmc_a8", "gmii2_rxd3", "rgmii2_rd3", "mmc2_dat6",
++		"gpmc_a24", "pr1_mii1_rxd0", "mcasp0_aclkx", "gpio1_24"),
+ 	_AM33XX_MUXENTRY(GPMC_A9, 0,
+ 		"gpmc_a9", "mii2_rxd2", "rgmii2_rd2", "mmc2_dat7",
+ 		NULL, NULL, "mcasp0_fsx", "gpio1_25"),
+@@ -122,18 +127,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(GPMC_BEN1, 0,
+ 		"gpmc_ben1", "mii2_col", NULL, "mmc2_dat3",
+ 		NULL, NULL, "mcasp0_aclkr", "gpio1_28"),
+-	_AM33XX_MUXENTRY(GPMC_CSN0, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_CSN0, 0,
+ 		"gpmc_csn0", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_29"),
+-	_AM33XX_MUXENTRY(GPMC_CSN1, 0,
+-		"gpmc_csn1", NULL, "mmc1_clk", NULL,
+-		NULL, NULL, NULL, "gpio1_30"),
+-	_AM33XX_MUXENTRY(GPMC_CSN2, 0,
+-		"gpmc_csn2", NULL, "mmc1_cmd", NULL,
+-		NULL, NULL, NULL, "gpio1_31"),
+-	_AM33XX_MUXENTRY(GPMC_CSN3, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_CSN1, 0,
++		"gpmc_csn1", "gpmc_clk", "mmc1_clk", "pr1_edio_data_in6",
++		"pr1_edio_data_out6", "pr1_pru1_pru_r30_12", "pr1_pru1_pru_r31_12", "gpio1_30"),
++/**/	_AM33XX_MUXENTRY(GPMC_CSN2, 0,
++		"gpmc_csn2", "gpmc_be1n", "mmc1_cmd", "pr1_edio_data_in7",
++		"pr1_edio_data_out7", "pr1_pru1_pru_r30_13", "pr1_pru1_pru_r31_13", "gpio1_31"),
++/**/	_AM33XX_MUXENTRY(GPMC_CSN3, 0,
+ 		"gpmc_csn3", NULL, NULL, "mmc2_cmd",
+-		NULL, NULL, NULL, "gpio2_0"),
++		"pr1_mii0_crs", "pr1_mdio_data", "EMU4", "gpio2_0"),
+ 	_AM33XX_MUXENTRY(GPMC_CLK, 0,
+ 		"gpmc_clk", "lcd_memory_clk_mux", NULL, "mmc2_clk",
+ 		NULL, NULL, "mcasp0_fsr", "gpio2_1"),
+@@ -155,33 +160,33 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(LCD_DATA1, 0,
+ 		"lcd_data1", "gpmc_a1", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio2_7"),
+-	_AM33XX_MUXENTRY(LCD_DATA2, 0,
+-		"lcd_data2", "gpmc_a2", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_8"),
+-	_AM33XX_MUXENTRY(LCD_DATA3, 0,
+-		"lcd_data3", "gpmc_a3", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_9"),
+-	_AM33XX_MUXENTRY(LCD_DATA4, 0,
+-		"lcd_data4", "gpmc_a4", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_10"),
+-	_AM33XX_MUXENTRY(LCD_DATA5, 0,
+-		"lcd_data5", "gpmc_a5", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_11"),
+-	_AM33XX_MUXENTRY(LCD_DATA6, 0,
+-		"lcd_data6", "gpmc_a6", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_12"),
+-	_AM33XX_MUXENTRY(LCD_DATA7, 0,
+-		"lcd_data7", "gpmc_a7", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_13"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA2, 0,
++		"lcd_data2", "gpmc_a2", "pr1_mii0_txd3", "ehrpwm2_tripzone_input",
++		NULL, "pr1_pru1_pru_r30_2", "pr1_pru1_pru_r31_2", "gpio2_8"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA3, 0,
++		"lcd_data3", "gpmc_a3", "pr1_mii0_txd2","ehrpwm0_synco",
++		NULL, "pr1_pru1_pru_r30_3", "pr1_pru1_pru_r31_3", "gpio2_9"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA4, 0,
++		"lcd_data4", "gpmc_a4", "pr1_mii0_txd1", "eQEP2A_in",
++		NULL, "pr1_pru1_pru_r30_4", "pr1_pru1_pru_r31_4", "gpio2_10"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA5, 0,
++		"lcd_data5", "gpmc_a5", "pr1_mii0_txd0", "eqep2b_in",
++		NULL, "pr1_pru1_pru_r30_5", "pr1_pru1_pru_r31_5", "gpio2_11"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA6, 0,
++		"lcd_data6", "gpmc_a6", "pr1_edio_data_in6", "eqep2_index",
++		"pr1_edio_data_out6", "pr1_pru1_pru_r30_6", "pr1_pru1_pru_r31_6", "gpio2_12"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA7, 0,
++		"lcd_data7", "gpmc_a7", "pr1_edio_data_in7", "eqep2_strobe",
++		"pr1_pru1_pru_r30_7", "pr1_pru_pru1_r30_7", "pr1_pru1_pru_r31_7", "gpio2_13"),
+ 	_AM33XX_MUXENTRY(LCD_DATA8, 0,
+ 		"lcd_data8", "gpmc_a12", NULL, "mcasp0_aclkx",
+ 		NULL, NULL, "uart2_ctsn", "gpio2_14"),
+ 	_AM33XX_MUXENTRY(LCD_DATA9, 0,
+ 		"lcd_data9", "gpmc_a13", NULL, "mcasp0_fsx",
+ 		NULL, NULL, "uart2_rtsn", "gpio2_15"),
+-	_AM33XX_MUXENTRY(LCD_DATA10, 0,
+-		"lcd_data10", "gpmc_a14", NULL, "mcasp0_axr0",
+-		NULL, NULL, NULL, "gpio2_16"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA10, 0,
++		"lcd_data10", "gpmc_a14", "ehrpwm1A", "mcasp0_axr0",
++		"mcasp0_axr0", "pr1_mii0_rxd1", "uart3_ctsn", "gpio2_16"),
+ 	_AM33XX_MUXENTRY(LCD_DATA11, 0,
+ 		"lcd_data11", "gpmc_a15", NULL, "mcasp0_ahclkr",
+ 		"mcasp0_axr2", NULL, NULL, "gpio2_17"),
+@@ -197,18 +202,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(LCD_DATA15, 0,
+ 		"lcd_data15", "gpmc_a19", NULL, "mcasp0_ahclkx",
+ 		"mcasp0_axr3", NULL, NULL, "gpio0_11"),
+-	_AM33XX_MUXENTRY(LCD_VSYNC, 0,
+-		"lcd_vsync", NULL, NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_22"),
+-	_AM33XX_MUXENTRY(LCD_HSYNC, 0,
+-		"lcd_hsync", NULL, NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_23"),
+-	_AM33XX_MUXENTRY(LCD_PCLK, 0,
+-		"lcd_pclk", NULL, NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_24"),
+-	_AM33XX_MUXENTRY(LCD_AC_BIAS_EN, 0,
+-		"lcd_ac_bias_en", NULL, NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_25"),
++/**/	_AM33XX_MUXENTRY(LCD_VSYNC, 0,
++		"lcd_vsync", "gpmc_a8", NULL, "pr1_edio_data_in2",
++		"pr1_edio_data_out2", "pr1_pru1_pru_r30_8", "pr1_pru1_pru_r31_8", "gpio2_22"),
++/**/	_AM33XX_MUXENTRY(LCD_HSYNC, 0,
++		"lcd_hsync", "gpmc_a9", NULL, "pr1_edio_data_in3",
++		"pr1_edio_data_out3", "pr1_pru1_pru_r30_9", "pr1_pru1_pru_r31_9", "gpio2_23"),
++/**/	_AM33XX_MUXENTRY(LCD_PCLK, 0,
++		"lcd_pclk", "gpmc_a10", "pr1_mii0_crs", "pr1_edio_data_in4",
++		"pr1_edio_data_out4", "pr1_pru1_pru_r30_10", "pr1_pru1_pru_r31_10", "gpio2_24"),
++/**/	_AM33XX_MUXENTRY(LCD_AC_BIAS_EN, 0,
++		"lcd_ac_bias_en", "gpmc_a11", "pr1_mii1_crs", "pr1_edio_data_in5",
++		"pr1_edio_data_out5", "pr1_pru1_pru_r30_11", "pr1_pru1_pru_r31_11", "gpio2_25"),
+ 	_AM33XX_MUXENTRY(MMC0_DAT3, 0,
+ 		"mmc0_dat3", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio2_26"),
+@@ -296,9 +301,9 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(SPI0_CS1, 0,
+ 		"spi0_cs1", "uart3_rxd", NULL, "mmc0_pow",
+ 		NULL, "mmc0_sdcd", NULL, "gpio0_6"),
+-	_AM33XX_MUXENTRY(ECAP0_IN_PWM0_OUT, 0,
+-		"ecap0_in_pwm0_out", "uart3_txd", "spi1_cs1", NULL,
+-		"spi1_sclk", "mmc0_sdwp", NULL, "gpio0_7"),
++/**/	_AM33XX_MUXENTRY(ECAP0_IN_PWM0_OUT, 0,
++		"ecap0_in_pwm0_out", "uart3_txd", "spi1_cs1", "pr1_ecap0_ecap_capin_apwm_o",
++		"spi1_sclk", "mmc0_sdwp", "xdma_event_intr2", "gpio0_7"),
+ 	_AM33XX_MUXENTRY(UART0_CTSN, 0,
+ 		"uart0_ctsn", NULL, "d_can1_tx", "i2c1_sda",
+ 		"spi1_d0", NULL, NULL, "gpio1_8"),
+@@ -389,11 +394,11 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(TRSTN, 0,
+ 		NULL, NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(EMU0, 0,
+-		NULL, NULL, NULL, NULL,
++/**/	_AM33XX_MUXENTRY(EMU0, 0,
++		"emu0", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio3_7"),
+-	_AM33XX_MUXENTRY(EMU1, 0,
+-		NULL, NULL, NULL, NULL,
++/**/	_AM33XX_MUXENTRY(EMU1, 0,
++		"emu1", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio3_8"),
+ 	_AM33XX_MUXENTRY(RTC_XTALIN, 0,
+ 		NULL, NULL, NULL, NULL,
+@@ -572,34 +577,34 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(DDR_VTP, 0,
+ 		NULL, NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN0, 0,
++/**/	_AM33XX_MUXENTRY(AIN0, 0,
+ 		"ain0", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN1, 0,
++/**/	_AM33XX_MUXENTRY(AIN1, 0,
+ 		"ain1", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN2, 0,
++/**/	_AM33XX_MUXENTRY(AIN2, 0,
+ 		"ain2", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN3, 0,
++/**/	_AM33XX_MUXENTRY(AIN3, 0,
+ 		"ain3", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN4, 0,
++/**/	_AM33XX_MUXENTRY(AIN4, 0,
+ 		"ain4", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN5, 0,
++/**/	_AM33XX_MUXENTRY(AIN5, 0,
+ 		"ain5", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN6, 0,
++/**/	_AM33XX_MUXENTRY(AIN6, 0,
+ 		"ain6", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(AIN7, 0,
++/**/	_AM33XX_MUXENTRY(AIN7, 0,
+ 		"ain7", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(VREFP, 0,
++/**/	_AM33XX_MUXENTRY(VREFP, 0,
+ 		"vrefp", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+-	_AM33XX_MUXENTRY(VREFN, 0,
++/**/	_AM33XX_MUXENTRY(VREFN, 0,
+ 		"vrefn", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
+ 	{ .reg_offset = OMAP_MUX_TERMINATOR },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
new file mode 100644
index 0000000..a82c17f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
@@ -0,0 +1,113 @@
+From 122136b42459ab34853157fb5de1691e890f8f88 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Mon, 14 May 2012 18:26:12 +0200
+Subject: [PATCH 48/56] Fixed reversed part of LCD bus. Added even more
+ missing entries (TBC).
+
+---
+ arch/arm/mach-omap2/mux33xx.c |   56 ++++++++++++++++++++--------------------
+ 1 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 26ecd66..72ac899 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -34,54 +34,54 @@
+  *            Marked lines with completed spec by leading empty comment.
+  */
+ static struct omap_mux __initdata am33xx_muxmodes[] = {
+-	_AM33XX_MUXENTRY(GPMC_AD0, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD0, 0,
+ 		"gpmc_ad0", "mmc1_dat0", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_0"),
+-	_AM33XX_MUXENTRY(GPMC_AD1, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD1, 0,
+ 		"gpmc_ad1", "mmc1_dat1", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_1"),
+-	_AM33XX_MUXENTRY(GPMC_AD2, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD2, 0,
+ 		"gpmc_ad2", "mmc1_dat2", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_2"),
+-	_AM33XX_MUXENTRY(GPMC_AD3, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD3, 0,
+ 		"gpmc_ad3", "mmc1_dat3", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_3"),
+-	_AM33XX_MUXENTRY(GPMC_AD4, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD4, 0,
+ 		"gpmc_ad4", "mmc1_dat4", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_4"),
+-	_AM33XX_MUXENTRY(GPMC_AD5, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD5, 0,
+ 		"gpmc_ad5", "mmc1_dat5", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_5"),
+-	_AM33XX_MUXENTRY(GPMC_AD6, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD6, 0,
+ 		"gpmc_ad6", "mmc1_dat6", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_6"),
+-	_AM33XX_MUXENTRY(GPMC_AD7, 0,
++/**/	_AM33XX_MUXENTRY(GPMC_AD7, 0,
+ 		"gpmc_ad7", "mmc1_dat7", NULL, NULL,
+ 		NULL, NULL, NULL, "gpio1_7"),
+ /**/	_AM33XX_MUXENTRY(GPMC_AD8, 0,
+-		"gpmc_ad8", "lcd_data16", "mmc1_dat0", "mmc2_dat4",
++		"gpmc_ad8", "lcd_data23", "mmc1_dat0", "mmc2_dat4",
+ 		"ehrpwm2A", "pr1_mii_mt0_clk", NULL, "gpio0_22"),
+ /**/	_AM33XX_MUXENTRY(GPMC_AD9, 0,
+-		"gpmc_ad9", "lcd_data17", "mmc1_dat1", "mmc2_dat5",
++		"gpmc_ad9", "lcd_data22", "mmc1_dat1", "mmc2_dat5",
+ 		"ehrpwm2B", "pr1_mii0_col", NULL, "gpio0_23"),
+ /**/	_AM33XX_MUXENTRY(GPMC_AD10, 0,
+-		"gpmc_ad10", "lcd_data18", "mmc1_dat2", "mmc2_dat6",
++		"gpmc_ad10", "lcd_data21", "mmc1_dat2", "mmc2_dat6",
+ 		"ehrpwm2_tripzone_input", "pr1_mii0_txen", NULL, "gpio0_26"),
+ /**/	_AM33XX_MUXENTRY(GPMC_AD11, 0,
+-		"gpmc_ad11", "lcd_data19", "mmc1_dat3", "mmc2_dat7",
++		"gpmc_ad11", "lcd_data20", "mmc1_dat3", "mmc2_dat7",
+ 		"ehrpwm0_synco", "pr1_mii0_txd3", NULL, "gpio0_27"),
+ /**/	_AM33XX_MUXENTRY(GPMC_AD12, 0,
+-		"gpmc_ad12", "lcd_data20", "mmc1_dat4", "mmc2_dat0",
++		"gpmc_ad12", "lcd_data19", "mmc1_dat4", "mmc2_dat0",
+ 		"eqep2a_in", "pr1_mii0_txd2", "pr1_pru0_pru_r30_14", "gpio1_12"),
+-	_AM33XX_MUXENTRY(GPMC_AD13, 0,
+-		"gpmc_ad13", "lcd_data21", "mmc1_dat5", "mmc2_dat1",
+-		NULL, NULL, NULL, "gpio1_13"),
+-	_AM33XX_MUXENTRY(GPMC_AD14, 0,
+-		"gpmc_ad14", "lcd_data22", "mmc1_dat6", "mmc2_dat2",
+-		NULL, NULL, NULL, "gpio1_14"),
+-	_AM33XX_MUXENTRY(GPMC_AD15, 0,
+-		"gpmc_ad15", "lcd_data23", "mmc1_dat7", "mmc2_dat3",
+-		NULL, NULL, NULL, "gpio1_15"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD13, 0,
++		"gpmc_ad13", "lcd_data18", "mmc1_dat5", "mmc2_dat1",
++		"eqep2B_in", "pr1_mii0_txd", "pr1_pru0_pru_r30_15", "gpio1_13"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD14, 0,
++		"gpmc_ad14", "lcd_data17", "mmc1_dat6", "mmc2_dat2",
++		"eqep2_index", "pr1_mii0_txd0", "pr1_pru0_pru_r31_14", "gpio1_14"),
++/**/	_AM33XX_MUXENTRY(GPMC_AD15, 0,
++		"gpmc_ad15", "lcd_data16", "mmc1_dat7", "mmc2_dat3",
++		"eqep2_strobe", "pr1_ecap0_ecap_capin_apwm_o", "pr1_pru0_pru_r31_15", "gpio1_15"),
+ /**/	_AM33XX_MUXENTRY(GPMC_A0, 0,
+ 		"gpmc_a0", "gmii2_txen", "rgmii2_tctl", "rmii2_txen",
+ 		"gpmc_a16", "pr1_mii_mt1_clk", "ehrpwm1_tripzone_input", "gpio1_16"),
+@@ -154,12 +154,12 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 	_AM33XX_MUXENTRY(GPMC_BEN0_CLE, 0,
+ 		"gpmc_ben0_cle", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio2_5"),
+-	_AM33XX_MUXENTRY(LCD_DATA0, 0,
+-		"lcd_data0", "gpmc_a0", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_6"),
+-	_AM33XX_MUXENTRY(LCD_DATA1, 0,
+-		"lcd_data1", "gpmc_a1", NULL, NULL,
+-		NULL, NULL, NULL, "gpio2_7"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA0, 0,
++		"lcd_data0", "gpmc_a0", "pr1_mii_mt0_clk", "ehrpwm2A",
++		NULL, "pr1_pru1_pru_r30_0", "pr1_pru1_pru_r31_0", "gpio2_6"),
++/**/	_AM33XX_MUXENTRY(LCD_DATA1, 0,
++		"lcd_data1", "gpmc_a1", "pr1_mii0_txen", "ehrpwm2B",
++		NULL, "pr1_pru1_pru_r30_1", "pr1_pru1_pru_r31_1", "gpio2_7"),
+ /**/	_AM33XX_MUXENTRY(LCD_DATA2, 0,
+ 		"lcd_data2", "gpmc_a2", "pr1_mii0_txd3", "ehrpwm2_tripzone_input",
+ 		NULL, "pr1_pru1_pru_r30_2", "pr1_pru1_pru_r31_2", "gpio2_8"),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
new file mode 100644
index 0000000..96aae36
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
@@ -0,0 +1,26 @@
+From b0977ddac55066159dc227585cf6c682fbb8f1a4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 19 May 2012 11:29:14 +0200
+Subject: [PATCH 49/56] ts_tscadc: add defines for 4x and 16x oversampling
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/input/touchscreen/ti_tscadc.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index 4fd2e18..acb62d1 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -83,6 +83,8 @@ static DEVICE_ATTR(ain8, S_IRUGO, do_adc_sample, NULL);
+ #define TSCADC_STEPCONFIG_MODE_SWCONT		0x1
+ #define TSCADC_STEPCONFIG_MODE_SWONESHOT	0x0
+ #define TSCADC_STEPCONFIG_2SAMPLES_AVG	(1 << 4)
++#define TSCADC_STEPCONFIG_4SAMPLES_AVG	(1 << 3)
++#define TSCADC_STEPCONFIG_16SAMPLES_AVG	(1 << 2)
+ #define TSCADC_STEPCONFIG_NO_AVG	0
+ #define TSCADC_STEPCONFIG_XPP		BIT(5)
+ #define TSCADC_STEPCONFIG_XNN		BIT(6)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
new file mode 100644
index 0000000..8c562fd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
@@ -0,0 +1,58 @@
+From fb76db075eb565d152d99b734e3fe9d84b4fe495 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 19 May 2012 11:37:21 +0200
+Subject: [PATCH 50/56] ts_tscadc: switch to 4x oversampling
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/input/touchscreen/ti_tscadc.c |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
+index acb62d1..7df7bb2 100644
+--- a/drivers/input/touchscreen/ti_tscadc.c
++++ b/drivers/input/touchscreen/ti_tscadc.c
+@@ -157,11 +157,11 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+ 	/*
+  	 * Step Configuration
+  	 * software-enabled continous mode
+- 	 * 2 sample averaging
++ 	 * 4 sample averaging
+  	 * sample channel 1 (SEL_INP mux bits = 0)
+  	 */
+ 	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
+-		TSCADC_STEPCONFIG_2SAMPLES_AVG |
++		TSCADC_STEPCONFIG_4SAMPLES_AVG |
+ 		((channel-1) << 19);
+ 	
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+@@ -242,7 +242,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
+ 
+ 	stepconfigx = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-			TSCADC_STEPCONFIG_2SAMPLES_AVG | TSCADC_STEPCONFIG_XPP;
++			TSCADC_STEPCONFIG_4SAMPLES_AVG | TSCADC_STEPCONFIG_XPP;
+ 
+ 	switch (ts_dev->wires) {
+ 	case 4:
+@@ -279,7 +279,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 	}
+ 
+ 	stepconfigy = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-			TSCADC_STEPCONFIG_2SAMPLES_AVG | TSCADC_STEPCONFIG_YNN |
++			TSCADC_STEPCONFIG_4SAMPLES_AVG | TSCADC_STEPCONFIG_YNN |
+ 			TSCADC_STEPCONFIG_INM | TSCADC_STEPCONFIG_FIFO1;
+ 	switch (ts_dev->wires) {
+ 	case 4:
+@@ -324,7 +324,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+ 
+ 	 /* Configure to calculate pressure */
+ 	stepconfigz1 = TSCADC_STEPCONFIG_MODE_HWSYNC |
+-				TSCADC_STEPCONFIG_2SAMPLES_AVG |
++				TSCADC_STEPCONFIG_4SAMPLES_AVG |
+ 				TSCADC_STEPCONFIG_XNP |
+ 				TSCADC_STEPCONFIG_YPN | TSCADC_STEPCONFIG_INM;
+ 	stepconfigz2 = stepconfigz1 | TSCADC_STEPCONFIG_Z1 |
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
new file mode 100644
index 0000000..aba0afa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
@@ -0,0 +1,27 @@
+From 32fc1a1006035b1c05e45e962b89efe7f9c43182 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:07:59 +0200
+Subject: [PATCH 51/56] Fixed size of pinmux data array in EEPROM data struct.
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index ece4e46..c6ec997 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -483,7 +483,7 @@ struct beaglebone_cape_eeprom_config {
+ 	char	partnumber[16];
+ 	u16  numpins;
+ 	char	serial[12];
+-	u8	muxdata[170];
++	u16	muxdata[74];
+ 	u16  current_3v3;
+ 	u16  current_vdd5v;
+ 	u16  current_sys5v;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
new file mode 100644
index 0000000..f0a3b77
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
@@ -0,0 +1,363 @@
+From ef6c0767e7c4337f45080906cda46a2c05e000f8 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Sun, 13 May 2012 18:14:22 +0200
+Subject: [PATCH 52/56] Implemented Bone Cape configuration from EEPROM. Only
+ used for BEBOPR cape for now.
+
+Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |  304 +++++++++++++++++++++++++++++++++
+ arch/arm/mach-omap2/mux33xx.c         |   14 ++
+ 2 files changed, 318 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index c6ec997..7fb8295 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2231,6 +2231,304 @@ static void tt3201_init(int evm_id, int profile)
+ 
+ 	am33xx_d_can_init(1);
+ }
++
++static const char* cape_pins[] = {
++/*
++  From SRM RevA5.0.1:
++*/
++  /* offset  88 - P9-22 */ "uart2_rxd",
++  /* offset  90 - P9-21 */ "uart2_txd",
++  /* offset  92 - P9-18 */ "spi0_d1",
++  /* offset  94 - P9-17 */ "spi0_cs0",
++  /* offset  96 - P9-42 */ "ecap0_in_pwm0_out",
++  /* offset  98 - P8-35 */ "lcd_data12",
++  /* offset 100 - P8-33 */ "lcd_data13",
++  /* offset 102 - P8-31 */ "lcd_data14",
++  /* offset 104 - P8-32 */ "lcd_data15",
++  /* offset 106 - P9-19 */ "uart1_rtsn",
++  /* offset 108 - P9-20 */ "uart1_ctsn",
++  /* offset 110 - P9-26 */ "uart1_rxd",
++  /* offset 112 - P9-24 */ "uart1_txd",
++  /* offset 114 - P9-41 */ "xdma_event_intr1",
++  /* offset 116 - P8-19 */ "gpmc_ad8",
++  /* offset 118 - P8-13 */ "gpmc_ad9",
++  /* offset 120 - P8-14 */ "gpmc_ad10",
++  /* offset 122 - P8-17 */ "gpmc_ad12",
++  /* offset 124 - P9-11 */ "gpmc_wait0",
++  /* offset 126 - P9-13 */ "gpmc_wpn",
++  /* offset 128 - P8-25 */ "gpmc_ad0",
++  /* offset 130 - P8-24 */ "gpmc_ad1",
++  /* offset 132 - P8- 5 */ "gpmc_ad2",
++  /* offset 134 - P8- 6 */ "gpmc_ad3",
++  /* offset 136 - P8-23 */ "gpmc_ad4",
++  /* offset 138 - P8-22 */ "gpmc_ad5",
++  /* offset 140 - P8- 3 */ "gpmc_ad6",
++  /* offset 142 - P8- 4 */ "gpmc_ad7",
++  /* offset 144 - P8-12 */ "gpmc_ad12",
++  /* offset 146 - P8-11 */ "gpmc_ad13",
++  /* offset 148 - P8-16 */ "gpmc_ad14",
++  /* offset 150 - P8-15 */ "gpmc_ad15",
++  /* offset 152 - P9-15 */ "gpmc_a0",
++  /* offset 154 - P9-23 */ "gpmc_a1",
++  /* offset 156 - P9-14 */ "gpmc_a2",
++  /* offset 158 - P9-16 */ "gpmc_a3",
++  /* offset 160 - P9-12 */ "gpmc_be1n",
++  /* offset 162 - P8-26 */ "gpmc_csn0",
++  /* offset 164 - P8-21 */ "gpmc_csn1",
++  /* offset 166 - P8-20 */ "gpmc_csn2",
++  /* offset 168 - P8-18 */ "gpmc_clk",
++  /* offset 170 - P8-7  */ "gpmc_advn_ale",
++  /* offset 172 - P8-9  */ "gpmc_ben0_cle",
++  /* offset 174 - P8-10 */ "gpmc_wen",
++  /* offset 176 - P8-8  */ "gpmc_csn3",
++  /* offset 178 - P8-45 */ "lcd_data0",
++  /* offset 180 - P8-46 */ "lcd_data1",
++  /* offset 182 - P8-43 */ "lcd_data2",
++  /* offset 184 - P8-44 */ "lcd_data3",
++  /* offset 186 - P8-41 */ "lcd_data4",
++  /* offset 188 - P8-42 */ "lcd_data5",
++  /* offset 190 - P8-39 */ "lcd_data6",
++  /* offset 192 - P8-40 */ "lcd_data7",
++  /* offset 194 - P8-37 */ "lcd_data8",
++  /* offset 196 - P8-38 */ "lcd_data9",
++  /* offset 198 - P8-36 */ "lcd_data10",
++  /* offset 200 - P8-34 */ "lcd_data11",
++  /* offset 202 - P8-27 */ "lcd_vsync",
++  /* offset 204 - P8-29 */ "lcd_hsync",
++  /* offset 206 - P8-28 */ "lcd_pclk",
++  /* offset 208 - P8-30 */ "lcd_ac_bias_en",
++  /* offset 210 - P9-29 */ "mcasp0_fsx",
++  /* offset 212 - P9-30 */ "mcasp0_axr0",
++  /* offset 214 - P9-28 */ "mcasp0_ahclkr",
++  /* offset 216 - P9-27 */ "mcasp0_fsr",
++  /* offset 218 - P9-31 */ "mcasp0_aclkx",
++  /* offset 220 - P9-25 */ "mcasp0_ahclkx",
++  /* offset 222 - P9-39 */ "ain0",
++  /* offset 224 - P9-40 */ "ain1",
++  /* offset 226 - P9-37 */ "ain2",
++  /* offset 228 - P9-38 */ "ain3",
++  /* offset 230 - P9-33 */ "ain4",
++  /* offset 232 - P9-36 */ "ain5",
++  /* offset 234 - P9-35 */ "ain6",
++};
++
++#define BIG_ENDIAN_16( i) ( ((i & 255) << 8) | ((i >> 8) & 255) )
++#define NR_ITEMS( x) (sizeof( (x)) / sizeof( *(x)))
++
++extern int am33xx_mux_get_entry( int index, struct omap_mux** mux);
++
++typedef union {
++/*
++  From SRM RevA5.0.1:
++  Bit 15     Pin is used or not: 0=Unused by Cape 1=Used by Cape
++  Bit 14-13  Pin Direction: 10=Output 01=Input 11=BDIR
++  Bit 12-7   Reserved
++  Bit 6      Slew Rate: 0=Fast 1=Slow
++  Bit 5      Rx Enable: 0=Disabled 1=Enabled
++  Bit 4      Pull Up/Dn Select: 0=Pulldown 1=PullUp
++  Bit 3      Pull Up/DN enabled: 0=Enabled 1=Disabled
++  Bit 2-0    Mux Mode Selection: Mode 0-7
++*/
++	struct {
++		uint16_t    mux             : 3;
++	  	uint16_t    pull_enable     : 1;
++		uint16_t    pull_up         : 1;
++	  	uint16_t    rx_enable       : 1;
++		uint16_t    slew_rate       : 1;
++	  	uint16_t    reserved        : 6;
++	  	uint16_t    direction       : 2;
++	  	uint16_t    used            : 1;
++	};
++  	uint16_t      value;
++} pin_def;
++
++#define DEBUG_EEPROM_CONFIG 0
++
++static int bone_io_get_mux_setting( pin_def setting)
++{
++	int pin_setting;
++
++	switch (setting.direction) {
++	case 1:
++	/* input */
++	  	if (setting.pull_enable) {
++			if (setting.pull_up) {
++			  	pin_setting = AM33XX_PIN_INPUT_PULLUP;
++			} else {
++			  	pin_setting = AM33XX_PIN_INPUT_PULLDOWN;
++			}
++		} else {
++		  	pin_setting = AM33XX_PIN_INPUT;
++		}
++		if (!setting.rx_enable) {
++#if DEBUG_EEPROM_CONFIG
++			pr_warning( "  pin is set as input but the receiver is not enabled!\n");
++#endif
++		}
++		break;
++	case 2:
++	/* output */
++	  	pin_setting = AM33XX_PIN_OUTPUT;
++		break;
++	case 3:
++	/* bi-dir */
++	default:
++	/* reserved */
++#if DEBUG_EEPROM_CONFIG
++	  	pr_warning( "  pin ignored because it uses an unsupported mode: 0x%04x\n",
++			    setting.direction);
++#endif
++		return -1;
++	}
++#if DEBUG_EEPROM_CONFIG
++	pr_info("  pin is configured as %s\n",
++		(pin_setting & AM33XX_PIN_INPUT) ? "input" : "output");
++#endif
++	switch (setting.mux) {
++	case 0: pin_setting |= OMAP_MUX_MODE0; break;
++	case 1: pin_setting |= OMAP_MUX_MODE1; break;
++	case 2: pin_setting |= OMAP_MUX_MODE2; break;
++	case 3: pin_setting |= OMAP_MUX_MODE3; break;
++	case 4: pin_setting |= OMAP_MUX_MODE4; break;
++	case 5: pin_setting |= OMAP_MUX_MODE5; break;
++	case 6: pin_setting |= OMAP_MUX_MODE6; break;
++	case 7: pin_setting |= OMAP_MUX_MODE7; break;
++	}
++	return pin_setting;
++}
++
++static struct omap_mux* bone_io_pin_lookup( const char* pin_name)
++{
++	int index = 0;
++	struct omap_mux* mux;
++
++	for (;;) {
++		if (am33xx_mux_get_entry( index, &mux) < 0) {
++		  	/* no more entries */
++#if DEBUG_EEPROM_CONFIG
++		  	pr_warning( "   configuration error, pin '%s' not found in mux database\n",
++				    pin_name);
++#endif
++			return NULL;
++		}
++		if (mux != NULL &&
++		    mux->muxnames[ 0] != NULL &&
++		    strcmp( mux->muxnames[ 0], pin_name) == 0)
++		{
++			/* entry found */
++#if DEBUG_EEPROM_CONFIG
++			pr_info( "   found pin '%s' at index %d in mux database'\n",
++				 pin_name, index);
++#endif
++			return mux;
++		}
++		++index;
++	}
++}
++
++static int bone_io_config_pin( const char* pin_name, pin_def eeprom_setting)
++{
++	struct omap_mux* mux;
++	char* signal_name;
++	int pin_setting = bone_io_get_mux_setting( eeprom_setting);
++	int l1, l2;
++	char full_name[ 50];
++
++	if (pin_setting < 0) {
++		return -1;
++	}
++
++	mux = bone_io_pin_lookup( pin_name);
++
++	if (mux == NULL) {
++		return -1;
++	}
++
++	signal_name = mux->muxnames[ eeprom_setting.mux];
++
++	if (signal_name == NULL) {
++#if DEBUG_EEPROM_CONFIG
++	  	pr_warning( "    Configuration error, no signal found for pin '%s' in mode %d\n",
++			    pin_name, eeprom_setting.mux);
++#endif
++		return -1;
++	}
++
++#if DEBUG_EEPROM_CONFIG
++	pr_info( "    setting pin '%s' to signal '%s'\n",
++		 pin_name, signal_name);
++#endif
++  	l1 = strlen( pin_name);
++	l2 = strlen( signal_name);
++
++	if (l1 + 1 + l2 + 1 > sizeof( full_name)) {
++#if DEBUG_EEPROM_CONFIG
++	  	pr_warning( "    Internal error, combined signal name too long\n");
++#endif
++		return -1;
++	} else {
++	  	memcpy( full_name, pin_name, l1);
++		full_name[ l1] = '.';
++		memcpy( full_name + l1 + 1, signal_name, l2);
++		full_name[ l1 + 1 + l2] = '\0';
++		if (omap_mux_init_signal( full_name, pin_setting) < 0) {
++			return -1;
++		}
++#if DEBUG_EEPROM_CONFIG
++		pr_info( "     mux '%s' was set to mode 0x%04x\n",
++			 full_name, pin_setting);
++#endif
++	}
++	// return 0 for input, 1 for output
++	return (pin_setting & AM33XX_PIN_INPUT) ? 0 : 1;
++}
++
++#define RULER( x) \
++	do { \
++		char* p = status; \
++		int i = 0; \
++		int cnt = x; \
++		status[ cnt] = '\0'; \
++		while (cnt--) { \
++			if (++i == 10) { \
++				*p++ = '+'; \
++				i = 0; \
++			} else { \
++				*p++ = '-'; \
++			} \
++		} \
++		pr_info( "+%s+\n", status); \
++	} while (0)
++
++static void bone_io_config_from_cape_eeprom( void)
++{
++	int i;
++	int cnt = BIG_ENDIAN_16( cape_config.numpins);
++	u16* pmuxdata;
++	char status[ NR_ITEMS( cape_config.muxdata) + 1];
++
++	pr_info( "BeagleBone cape: configuring %2d out of %2d signals:\n",
++		 cnt, NR_ITEMS( cape_config.muxdata));
++	RULER( NR_ITEMS( cape_config.muxdata));
++	for (i = 0, pmuxdata = cape_config.muxdata ; i < NR_ITEMS( cape_config.muxdata) ; ++i, ++pmuxdata) {
++		const char* pin_name = cape_pins[ i];
++		pin_def pin_setting = { .value = BIG_ENDIAN_16( *pmuxdata) };
++
++		if (pin_setting.used) {
++			switch (bone_io_config_pin( pin_name, pin_setting)) {
++			case 0:  status[ i] = 'i'; break;
++			case 1:  status[ i] = 'o'; break;
++			default: status[ i] = '#'; break;
++			}
++		} else {
++			status[ i] = ' ';
++		}
++	}
++	status[ NR_ITEMS( cape_config.muxdata)] = '\0';
++	pr_info( "|%s|\n", status);
++	RULER( NR_ITEMS( cape_config.muxdata));
++}
++
+ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
+ {
+ 	int ret;
+@@ -2280,6 +2578,12 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
+ 	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
+ 
++	if (!strncmp( "BEBOPR", cape_config.name, 6)) {
++		pr_info( "BeagleBone cape: initializing BEBOPR cape\n");
++		bone_io_config_from_cape_eeprom();
++		return;	// if configured from eeprom, skip all other initialization
++	}
++
+ 	if (!strncmp("BB-BONE-DVID-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing DVI cape\n");
+ 		
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 72ac899..43c8989 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -616,6 +616,20 @@ int __init am33xx_mux_init(struct omap_board_mux *board_subset)
+ 			AM33XX_CONTROL_PADCONF_MUX_SIZE, am33xx_muxmodes,
+ 			NULL, board_subset, NULL);
+ }
++
++#define NR_ITEMS( x) (sizeof( (x)) / sizeof( *(x)))
++
++int am33xx_mux_get_entry( int index, struct omap_mux** mux)
++{
++  if (index >= 0 && index < NR_ITEMS( am33xx_muxmodes)) {
++    *mux = &am33xx_muxmodes[ index];
++    return 0;
++  } else {
++    *mux = NULL;
++    return -1;
++  }
++}
++
+ #else
+ int __init am33xx_mux_init(struct omap_board_mux *board_subset)
+ {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
new file mode 100644
index 0000000..175468f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
@@ -0,0 +1,188 @@
+From 3df22c4c4db479f189d892bcbf009102855bbd05 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Mon, 14 May 2012 14:31:37 +0200
+Subject: [PATCH 53/56] Replaced conditional debug code by pr_debug statements
+ for cleaner code.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   91 +++++++++++++--------------------
+ 1 files changed, 36 insertions(+), 55 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 7fb8295..d6a607a 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2323,23 +2323,23 @@ typedef union {
+   Bit 15     Pin is used or not: 0=Unused by Cape 1=Used by Cape
+   Bit 14-13  Pin Direction: 10=Output 01=Input 11=BDIR
+   Bit 12-7   Reserved
+-  Bit 6      Slew Rate: 0=Fast 1=Slow
+-  Bit 5      Rx Enable: 0=Disabled 1=Enabled
+-  Bit 4      Pull Up/Dn Select: 0=Pulldown 1=PullUp
+-  Bit 3      Pull Up/DN enabled: 0=Enabled 1=Disabled
++  Bit 6	     Slew Rate: 0=Fast 1=Slow
++  Bit 5	     Rx Enable: 0=Disabled 1=Enabled
++  Bit 4	     Pull Up/Dn Select: 0=Pulldown 1=PullUp
++  Bit 3	     Pull Up/DN enabled: 0=Enabled 1=Disabled
+   Bit 2-0    Mux Mode Selection: Mode 0-7
+ */
+ 	struct {
+-		uint16_t    mux             : 3;
+-	  	uint16_t    pull_enable     : 1;
+-		uint16_t    pull_up         : 1;
+-	  	uint16_t    rx_enable       : 1;
+-		uint16_t    slew_rate       : 1;
+-	  	uint16_t    reserved        : 6;
+-	  	uint16_t    direction       : 2;
+-	  	uint16_t    used            : 1;
++		uint16_t    mux		    : 3;
++		uint16_t    pull_enable	    : 1;
++		uint16_t    pull_up	    : 1;
++		uint16_t    rx_enable	    : 1;
++		uint16_t    slew_rate	    : 1;
++		uint16_t    reserved	    : 6;
++		uint16_t    direction	    : 2;
++		uint16_t    used	    : 1;
+ 	};
+-  	uint16_t      value;
++	uint16_t      value;
+ } pin_def;
+ 
+ #define DEBUG_EEPROM_CONFIG 0
+@@ -2351,39 +2351,33 @@ static int bone_io_get_mux_setting( pin_def setting)
+ 	switch (setting.direction) {
+ 	case 1:
+ 	/* input */
+-	  	if (setting.pull_enable) {
++		if (setting.pull_enable) {
+ 			if (setting.pull_up) {
+-			  	pin_setting = AM33XX_PIN_INPUT_PULLUP;
++				pin_setting = AM33XX_PIN_INPUT_PULLUP;
+ 			} else {
+-			  	pin_setting = AM33XX_PIN_INPUT_PULLDOWN;
++				pin_setting = AM33XX_PIN_INPUT_PULLDOWN;
+ 			}
+ 		} else {
+-		  	pin_setting = AM33XX_PIN_INPUT;
++			pin_setting = AM33XX_PIN_INPUT;
+ 		}
+ 		if (!setting.rx_enable) {
+-#if DEBUG_EEPROM_CONFIG
+-			pr_warning( "  pin is set as input but the receiver is not enabled!\n");
+-#endif
++			pr_debug( "  pin is set as input but the receiver is not enabled!\n");
+ 		}
+ 		break;
+ 	case 2:
+ 	/* output */
+-	  	pin_setting = AM33XX_PIN_OUTPUT;
++		pin_setting = AM33XX_PIN_OUTPUT;
+ 		break;
+ 	case 3:
+ 	/* bi-dir */
+ 	default:
+ 	/* reserved */
+-#if DEBUG_EEPROM_CONFIG
+-	  	pr_warning( "  pin ignored because it uses an unsupported mode: 0x%04x\n",
+-			    setting.direction);
+-#endif
++		pr_debug( "  pin ignored because it uses an unsupported mode: 0x%04x\n",
++			setting.direction);
+ 		return -1;
+ 	}
+-#if DEBUG_EEPROM_CONFIG
+-	pr_info("  pin is configured as %s\n",
++	pr_debug("  pin is configured as %s\n",
+ 		(pin_setting & AM33XX_PIN_INPUT) ? "input" : "output");
+-#endif
+ 	switch (setting.mux) {
+ 	case 0: pin_setting |= OMAP_MUX_MODE0; break;
+ 	case 1: pin_setting |= OMAP_MUX_MODE1; break;
+@@ -2404,11 +2398,9 @@ static struct omap_mux* bone_io_pin_lookup( const char* pin_name)
+ 
+ 	for (;;) {
+ 		if (am33xx_mux_get_entry( index, &mux) < 0) {
+-		  	/* no more entries */
+-#if DEBUG_EEPROM_CONFIG
+-		  	pr_warning( "   configuration error, pin '%s' not found in mux database\n",
+-				    pin_name);
+-#endif
++			/* no more entries */
++			pr_debug( "   configuration error, pin '%s' not found in mux database\n",
++				pin_name);
+ 			return NULL;
+ 		}
+ 		if (mux != NULL &&
+@@ -2416,10 +2408,8 @@ static struct omap_mux* bone_io_pin_lookup( const char* pin_name)
+ 		    strcmp( mux->muxnames[ 0], pin_name) == 0)
+ 		{
+ 			/* entry found */
+-#if DEBUG_EEPROM_CONFIG
+-			pr_info( "   found pin '%s' at index %d in mux database'\n",
+-				 pin_name, index);
+-#endif
++			pr_debug( "   found pin '%s' at index %d in mux database'\n",
++				pin_name, index);
+ 			return mux;
+ 		}
+ 		++index;
+@@ -2447,37 +2437,28 @@ static int bone_io_config_pin( const char* pin_name, pin_def eeprom_setting)
+ 	signal_name = mux->muxnames[ eeprom_setting.mux];
+ 
+ 	if (signal_name == NULL) {
+-#if DEBUG_EEPROM_CONFIG
+-	  	pr_warning( "    Configuration error, no signal found for pin '%s' in mode %d\n",
+-			    pin_name, eeprom_setting.mux);
+-#endif
++		pr_debug( "    Configuration error, no signal found for pin '%s' in mode %d\n",
++			pin_name, eeprom_setting.mux);
+ 		return -1;
+ 	}
+-
+-#if DEBUG_EEPROM_CONFIG
+-	pr_info( "    setting pin '%s' to signal '%s'\n",
++	pr_debug( "    setting pin '%s' to signal '%s'\n",
+ 		 pin_name, signal_name);
+-#endif
+-  	l1 = strlen( pin_name);
++	l1 = strlen( pin_name);
+ 	l2 = strlen( signal_name);
+ 
+ 	if (l1 + 1 + l2 + 1 > sizeof( full_name)) {
+-#if DEBUG_EEPROM_CONFIG
+-	  	pr_warning( "    Internal error, combined signal name too long\n");
+-#endif
++		pr_debug( "    Internal error, combined signal name too long\n");
+ 		return -1;
+ 	} else {
+-	  	memcpy( full_name, pin_name, l1);
++		memcpy( full_name, pin_name, l1);
+ 		full_name[ l1] = '.';
+ 		memcpy( full_name + l1 + 1, signal_name, l2);
+ 		full_name[ l1 + 1 + l2] = '\0';
+ 		if (omap_mux_init_signal( full_name, pin_setting) < 0) {
+ 			return -1;
+ 		}
+-#if DEBUG_EEPROM_CONFIG
+-		pr_info( "     mux '%s' was set to mode 0x%04x\n",
++		pr_debug( "	mux '%s' was set to mode 0x%04x\n",
+ 			 full_name, pin_setting);
+-#endif
+ 	}
+ 	// return 0 for input, 1 for output
+ 	return (pin_setting & AM33XX_PIN_INPUT) ? 0 : 1;
+@@ -2516,8 +2497,8 @@ static void bone_io_config_from_cape_eeprom( void)
+ 
+ 		if (pin_setting.used) {
+ 			switch (bone_io_config_pin( pin_name, pin_setting)) {
+-			case 0:  status[ i] = 'i'; break;
+-			case 1:  status[ i] = 'o'; break;
++			case 0:	 status[ i] = 'i'; break;
++			case 1:	 status[ i] = 'o'; break;
+ 			default: status[ i] = '#'; break;
+ 			}
+ 		} else {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
new file mode 100644
index 0000000..028fe81
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
@@ -0,0 +1,31 @@
+From bf49a3539e82539d8d347f7d88626c308662ed62 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Mon, 14 May 2012 14:36:23 +0200
+Subject: [PATCH 54/56] Workaround for boards with (mistaken) ASCII
+ interpretation for the numpins field.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index d6a607a..0a1738a 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2488,6 +2488,12 @@ static void bone_io_config_from_cape_eeprom( void)
+ 	u16* pmuxdata;
+ 	char status[ NR_ITEMS( cape_config.muxdata) + 1];
+ 
++	// Workaround for capes that have encoded this as ASCII
++	if (cnt > 256) {
++		pr_info( "BeagleBone cape: workaround for bad 'numpins' setting\n");
++		cnt = (cape_config.numpins & 255) - '0';
++		cnt = 10 * cnt + ((cape_config.numpins >> 8) & 255) - '0';
++	}
+ 	pr_info( "BeagleBone cape: configuring %2d out of %2d signals:\n",
+ 		 cnt, NR_ITEMS( cape_config.muxdata));
+ 	RULER( NR_ITEMS( cape_config.muxdata));
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
new file mode 100644
index 0000000..fa23ece
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
@@ -0,0 +1,30 @@
+From 2dc46dbcb68848a670dbe877f954835980cf8d66 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Mon, 14 May 2012 15:07:43 +0200
+Subject: [PATCH 55/56] Workaround for EEPROM contents blocking further I2C
+ bus access.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 0a1738a..0fa8a32 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2501,7 +2501,10 @@ static void bone_io_config_from_cape_eeprom( void)
+ 		const char* pin_name = cape_pins[ i];
+ 		pin_def pin_setting = { .value = BIG_ENDIAN_16( *pmuxdata) };
+ 
+-		if (pin_setting.used) {
++		// Detect broken I2C configuration to prevent bus hangup!
++		if (i >= 9 && i <= 10) {
++			status[ i] = '-';
++		} else if (pin_setting.used) {
+ 			switch (bone_io_config_pin( pin_name, pin_setting)) {
+ 			case 0:	 status[ i] = 'i'; break;
+ 			case 1:	 status[ i] = 'o'; break;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch
new file mode 100644
index 0000000..239e993
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch
@@ -0,0 +1,60 @@
+From 8c79cdf0bbe2bff8043cf81da7b8793c21f64f17 Mon Sep 17 00:00:00 2001
+From: Bas Laarhoven <sjml@xs4all.nl>
+Date: Tue, 15 May 2012 10:00:47 +0200
+Subject: [PATCH 56/56] Added check on EEPROM revision to prevent interpreting
+ unknown formats.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   16 +++++++++++++---
+ 1 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 0fa8a32..68ddfe2 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2481,12 +2481,21 @@ static int bone_io_config_pin( const char* pin_name, pin_def eeprom_setting)
+ 		pr_info( "+%s+\n", status); \
+ 	} while (0)
+ 
+-static void bone_io_config_from_cape_eeprom( void)
++static int bone_io_config_from_cape_eeprom( void)
+ {
+ 	int i;
+ 	int cnt = BIG_ENDIAN_16( cape_config.numpins);
+ 	u16* pmuxdata;
+ 	char status[ NR_ITEMS( cape_config.muxdata) + 1];
++	char revision[ NR_ITEMS( cape_config.format_revision) + 1];
++
++	strncpy( revision, cape_config.format_revision, NR_ITEMS( revision) - 1);
++	revision[ NR_ITEMS( revision) - 1] = '\0';
++	if (strcmp( revision, "A0") != 0) {
++		pr_warn( "BeagleBone cape: configuration revision '%s' is not supported\n",
++			revision);
++		return -1;
++	}
+ 
+ 	// Workaround for capes that have encoded this as ASCII
+ 	if (cnt > 256) {
+@@ -2494,8 +2503,8 @@ static void bone_io_config_from_cape_eeprom( void)
+ 		cnt = (cape_config.numpins & 255) - '0';
+ 		cnt = 10 * cnt + ((cape_config.numpins >> 8) & 255) - '0';
+ 	}
+-	pr_info( "BeagleBone cape: configuring %2d out of %2d signals:\n",
+-		 cnt, NR_ITEMS( cape_config.muxdata));
++	pr_info( "BeagleBone cape: revision %s format, configuring %2d out of %2d signals:\n",
++		revision, cnt, NR_ITEMS( cape_config.muxdata));
+ 	RULER( NR_ITEMS( cape_config.muxdata));
+ 	for (i = 0, pmuxdata = cape_config.muxdata ; i < NR_ITEMS( cape_config.muxdata) ; ++i, ++pmuxdata) {
+ 		const char* pin_name = cape_pins[ i];
+@@ -2517,6 +2526,7 @@ static void bone_io_config_from_cape_eeprom( void)
+ 	status[ NR_ITEMS( cape_config.muxdata)] = '\0';
+ 	pr_info( "|%s|\n", status);
+ 	RULER( NR_ITEMS( cape_config.muxdata));
++	return 0;
+ }
+ 
+ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 0fe3d4f..888c7a3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "m+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -927,6 +927,9 @@ PATCHES_OVER_PSP = " \
 	file://3.2.16/0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch \
 	file://3.2.16/0068-Linux-3.2.16.patch \
 	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
+	\
+	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
+	\
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
@@ -967,8 +970,20 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch \
 	file://beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch \
 	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
-    file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
-	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \
-	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
-	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
+	file://beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
+	file://beaglebone/0042-omap-hwmod-silence-st_shift-error.patch \
+	file://beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch \
+	file://beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch \
+	file://beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch \
+	file://beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch \
+	file://beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch \
+	file://beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch \
+	file://beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch \
+	file://beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch \
+	file://beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch \
+	file://beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch \
+	file://beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch \
+	file://beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch \
+	file://beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch \
+	file://beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch \
 "
-- 
1.7.10


