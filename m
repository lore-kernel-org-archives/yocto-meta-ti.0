Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5A20E00348
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:23 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ga9sgAlhz7wrnM/LPT3VPXK7gXcfmMDkvJonMQHCPU8=;
	b=MqyUSJQ+6zwGgxFtpaEdzwUvFncZgOhMD0U7MuOUfGElF25UbjRvkVkLjQlEeoPdmu
	wW8wr9tgjY8j7VNhmgk2JW/rKS4XgWxUaa3OgYrk6MY2OTg2BxVGdX4cayvy1Ql/2rYF
	bmkPdviOy9Vh7YM/whKujTyO+zgKcwCLBhbY7iFGB7HHJ7Ri2SNtO+yTmG6rKzbO9F3/
	StzzGlmqdOMnFjvdma42/XllJhVE8We8DghgxEZpPKuXykwidzPTNzHpcrCTnRkKYEqJ
	tYqLspPOlMffVMqcBYzvYlzyosaxo5dm51J4Ec7FazF7sjhEgFI5Sq4UhZSLJwFufC7q
	huBw==
Received: by 10.14.204.197 with SMTP id h45mr9140577eeo.8.1343581763280;
	Sun, 29 Jul 2012 10:09:23 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id w3sm21608909eep.2.2012.07.29.10.09.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:29 +0200
Message-Id: <1343581714-20397-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkIur3bp3aN/xtZ+cgN9ejK6Ff5Dw9nMmZdgtl9rwbIR7yFxaAlnxVtuspSnWQl+dffBQhW
Subject: [PATCH][for-denzil 07/12] linux-ti33x-psp 3.2: add support for audio cape and disable LBO gpio for battery cape
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...add-support-for-DVI-audio-and-audio-only-.patch |   63 ++++++++++++++++++++
 ...glebone-disable-LBO-GPIO-for-battery-cape.patch |   35 +++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 +-
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
new file mode 100644
index 0000000..60d5be0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
@@ -0,0 +1,63 @@
+From d87e8e9379764451de06b3f6d13d19424836f64c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 3 Jul 2012 08:45:47 +0200
+Subject: [PATCH] beaglebone: add support for DVI+audio and audio-only capes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   32 ++++++++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 1680612..4b3f7d2 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2906,8 +2906,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		
+ 		beaglebone_leds_free = 0;
+ 		dvileds_init(0,0);
+-		beaglebone_spi1_free = 0;
+-		mcasp0_init(0,0);
++
++		// Uncomment these for custom DVI capes with audio populated
++		//beaglebone_spi1_free = 0;
++		//mcasp0_init(0,0);
+ 	
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+ 			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
+@@ -2923,6 +2925,32 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			dvi_init(0,0);
+ 		}
+ 	}
++
++	if (!strncmp("BB-BONE-DVID-02", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing DVI+audio cape\n");
++
++		beaglebone_leds_free = 0;
++		dvileds_init(0,0);
++
++		beaglebone_spi1_free = 0;
++		mcasp0_init(0,0);
++	
++		setup_pin_mux(dvia2_pin_mux);
++		gpio_request(BEAGLEBONEDVI_PDn_A2, "DVI_PDn");
++		gpio_direction_output(BEAGLEBONEDVI_PDn_A2, 1);
++		dvi_init(0,0);
++	}
++
++	if (!strncmp("BB-BONE-AUDI-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing audio cape\n");
++
++		beaglebone_leds_free = 0;
++		dvileds_init(0,0);
++
++		beaglebone_spi1_free = 0;
++		mcasp0_init(0,0);
++	}
++
+ 	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
new file mode 100644
index 0000000..641db75
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
@@ -0,0 +1,35 @@
+From 9332627ac6b70511742208d6fa7c7042c203f852 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 3 Jul 2012 21:28:44 +0200
+Subject: [PATCH 75/75] beaglebone: disable LBO GPIO for battery cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index af75c88..7d6ac77 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2999,7 +2999,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing battery cape\n");
+ 		// gpio1_6, P9_15 lowbat output
+ 		// AIN4, P9_33 vbat
+-		setup_pin_mux(batterycape_pin_mux);
++		/* LBO doesn't work, so disable it for now
++ 		setup_pin_mux(batterycape_pin_mux);
+ 		#if defined(CONFIG_CHARGER_GPIO)
+ 			int err;
+ 			err = platform_device_register(&beaglebone_charger_device);
+@@ -3007,6 +3008,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 				pr_err("failed to register BeagleBone battery cape gpio\n");
+ 		
+ 		#endif
++		*/
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-SERL-01", cape_config.partnumber, 15)) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 95175cb..01bfc23 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1538,4 +1538,6 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch \
 	file://beaglebone/0072-beaglebone-fix-audio-spi-clash.patch \
 	file://beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch \
+	file://beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch \
+	file://beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch \
 "
-- 
1.7.10


