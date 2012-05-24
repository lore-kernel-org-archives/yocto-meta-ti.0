Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51225E013E5
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 00:57:44 -0700 (PDT)
Received: by eekb45 with SMTP id b45so2506447eek.35
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 00:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Zvwm254wE9DFnonFA1LkDxvcXxVKy09nKUIRyCUlJsw=;
	b=csN1zAsjr1B+g4wmpSk12okzgv1mcWn8vGjmRYdVYmnYss1Uuf7vosyifbBjR+4c8p
	6TgRLJn7BhuUoh9kt/mMq9u4XtumtSWbVWZ2MxyDOiCBaW2xYKP/bEpLPHi02+5oCk6T
	t5gfhKRoin1xiLyFWx/BoBdt3fEqWYFGfTkyCB+qhSClzrAXtYjyr4fRiRHLnSfZpd4b
	9dMLKTv8BlYtW8nMkxTZ62gke8Wd5yZAuq29RfHCzhrpVLK+XW4p0ZglfWLqWxAqK+dj
	lS47JoJHi5hFuDuk0ZTOPzZzXo0/slrX9RpDQp1/NHi+RTEPRaXFQvevC35IMu6IeZRt
	Nw1g==
Received: by 10.14.101.2 with SMTP id a2mr86392eeg.9.1337846263079;
	Thu, 24 May 2012 00:57:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q53sm135438087eef.8.2012.05.24.00.57.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 00:57:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 24 May 2012 09:57:29 +0200
Message-Id: <1337846249-26371-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
References: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm+TTp5B1Cui/wcOiNtyod+7s4pW+CIgG5SndidG1nYjz91CYGZaVKlO3yZGWMS2FabcLml
Cc: denys@ti.com
Subject: [PATCH 2/2] linux-ti33x-psp 3.2: fix pin free check once and for all
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
X-List-Received-Date: Thu, 24 May 2012 07:57:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...lebone-always-execute-the-pin-free-checks.patch |   68 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
new file mode 100644
index 0000000..e6f696e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
@@ -0,0 +1,68 @@
+From 2b000164f7bd77838ec5c9ad5d392282a4e27b3f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 23 May 2012 17:39:12 +0200
+Subject: [PATCH 64/64] beaglebone: always execute the pin free checks
+
+This code needs to run when there are no capes and when there are capes present.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   26 +++++++++++++-------------
+ 1 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 1f2d1fd..da6020b 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2589,7 +2589,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
+ 	if (ret != sizeof(cape_config)) {
+ 		pr_warning("BeagleBone cape EEPROM: could not read eeprom at address 0x%x\n", capecount + 0x53);
+-		return;
++		goto out2;
+ 	}
+ 
+ 	if (cape_config.header != AM335X_EEPROM_HEADER) {
+@@ -2724,6 +2724,16 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_w1gpio_free = 0;
+ 	}
+ 
++	goto out2;
++out:
++	/*
++	 * If the EEPROM hasn't been programed or an incorrect header
++	 * or board name are read, assume this is an old beaglebone board
++	 * (< Rev A3)
++	 */
++	pr_err("Could not detect BeagleBone cape properly\n");
++	beaglebone_cape_detected = false;
++out2:
+ 	if (capecount > 3) {
+ 		if (beaglebone_tsadcpins_free == 1) {
+ 			pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+@@ -2741,20 +2751,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			spi_register_board_info(bone_spidev2_info, ARRAY_SIZE(bone_spidev2_info));
+ 		}
+ 		if(beaglebone_w1gpio_free == 1) {
++			pr_info("BeagleBone cape: initializing w1-gpio\n");
+ 			bonew1_gpio_init(0,0);
+ 		}
+-	}	
+-	
+-	return;
+-out:
+-	/*
+-	 * If the EEPROM hasn't been programed or an incorrect header
+-	 * or board name are read, assume this is an old beaglebone board
+-	 * (< Rev A3)
+-	 */
+-	pr_err("Could not detect BeagleBone cape properly\n");
+-	beaglebone_cape_detected = false;
+-
++	}
+ }
+ 
+ static struct at24_platform_data cape_eeprom_info = {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 710308f..638bc9a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -16,7 +16,7 @@ FILESPATH =. "${FILE_DIRNAME}/${PN}-3.2:${FILE_DIRNAME}/${PN}-3.2/${MACHINE}:"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1224,4 +1224,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch \
 	file://beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch \
 	file://beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch \
+	file://beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch \
 "
-- 
1.7.10


