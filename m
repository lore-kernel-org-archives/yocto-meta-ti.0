Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C1B5E01409
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:02 -0700 (PDT)
Received: by mail-wi0-f176.google.com with SMTP id hm17so414551wib.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=waDyVK1+ArRedFQWEo7dmxNYSJc0+xIVFS7KtAr4rEM=;
	b=gzfNI1nvRccF+BK8UzlssUXwtmszt2kSfnExoNNttuR0sc6uMCLMak6wNi0vCheuRE
	bzwrYeNc/z/yYYO80j6mhZLG1jWm2B3ghYhPpSUZ6FrI2PPIycKvfW3GOTbBKI1dfbBH
	3NtuXSz7XpYVD3q2PMgOJZFxLfs14TotnVMEdETJZoYfs+QEC1+oqCF8gz4+BVBFlVmC
	t435Hhcsx1T5OIdtplkNoJTjoulH5nn2ugzf+h4VGjb9sdWC3qdQfc/nS5GpnZu923jN
	nq2MJg5GruXVFsPCr/yx1KAbFmUwqmF4kBpKU9Mr/wipzjibwRW58O8cBTH/rvrKdWD6
	rsIg==
Received: by 10.216.136.72 with SMTP id v50mr9251281wei.73.1334666882480;
	Tue, 17 Apr 2012 05:48:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	ev10sm26736768wid.10.2012.04.17.05.48.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:48:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:44 +0200
Message-Id: <1334666866-24955-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnU45H77nxyScyvjqbI1AyqTjxpW1ZZ0VQHy5qDfk/sWhVclE7vtPccLSXnSO3ntXNS6ujR
Cc: denys@ti.com
Subject: [PATCH v2 5/7] linux-ti33x-psp 3.2: rebase onto latest PSP
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
X-List-Received-Date: Tue, 17 Apr 2012 12:48:05 -0000

This fixes most PM operations: cpufreq, cpuidle and suspend. Resume does not work on beaglebone, but 3 out of 4 ain't bad :)

The M3 firmware needed for suspend/resume is used as a binary, building it from source and including it from sysroots is planned for future commits.

Beaglebone patches have been forward ported and runtime tested.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...AP-correct-SYSC-register-offset-for-OMAP4.patch |   34 --------
 ...new-UV2-hardware-by-using-native-UV2-bro.patch} |    6 +-
 ...x-BAU-destination-timeout-initialization.patch} |    6 +-
 ...atch => 0115-x86-UV2-Work-around-BAU-bug.patch} |    6 +-
 ...ix-interpretation-of-the-rx-KeyMiss-flag.patch} |    6 +-
 ...00pci-fix-spurious-interrupts-generation.patch} |    6 +-
 ...-endian-conversion-issue-in-discard-code.patch} |    6 +-
 ...0t-modified-the-setting-of-transfer-rate.patch} |    6 +-
 ...-fix-off-by-one-index-into-syscall-table.patch} |    6 +-
 ...efault-wsize-when-unix-extensions-are-no.patch} |    6 +-
 ...-kprobes-initialize-before-using-a-hlist.patch} |    6 +-
 ...c-clear_refs-do-not-clear-reserved-pages.patch} |    6 +-
 ...ptr-dereference-in-__count_immobile_page.patch} |    6 +-
 ...patch => 0125-iwlagn-check-for-SMPS-mode.patch} |    6 +-
 ...45-fix-hw-passive-scan-on-radar-channels.patch} |    6 +-
 ...HM_UNLOCK-fix-long-unpreemptible-section.patch} |    8 +-
 ...ix-Unevictable-pages-stranded-after-swap.patch} |    6 +-
 ...30-Linux-3.2.2.patch => 0129-Linux-3.2.2.patch} |    6 +-
 .../linux-ti33x-psp-3.2/am335x-pm-firmware.bin     |  Bin 0 -> 10732 bytes
 ...1-f_rndis-HACK-around-undefined-variables.patch |    6 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |   10 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |   63 +++++++++-------
 .../beaglebone/0004-more-beaglebone-merges.patch   |   48 ++++--------
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |   12 ++--
 ...general-purpose-mode-untested-with-touchs.patch |   67 ++++++++---------
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   14 ++--
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   10 +-
 ...cadc-make-stepconfig-channel-configurable.patch |   14 ++--
 .../0010-tscadc-Trigger-through-sysfs.patch        |   28 ++++---
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   10 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |   14 ++--
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |   16 ++--
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    8 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |   80 +++----------------
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   14 ++--
 ...set-default-brightness-to-50-for-pwm-back.patch |   12 ++--
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    6 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |   20 +++---
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   20 +++---
 ...am33xx-fix-serial-mux-warnings-for-am33xx.patch |   40 ----------
 ...dd-more-beagleboardtoys-cape-partnumbers.patch} |   12 ++--
 ...MAP2-am335x-correct-McASP0-pin-mux-detail.patch |   29 -------
 ...dd-gpio-keys-for-lcd7-add-notes-for-miss.patch} |   19 +++--
 ...3-beaglebone-add-enter-key-for-lcd7-cape.patch} |   14 ++--
 ...=> 0024-beaglebone-add-gpio-keys-for-lcd.patch} |   14 ++--
 ...25-beaglebone-fix-direction-of-gpio-keys.patch} |   30 ++++----
 ...0026-beaglebone-fix-3.5-lcd-cape-support.patch} |   20 +++---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   30 +++++---
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    7 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   56 +++++++-------
 51 files changed, 364 insertions(+), 519 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch => 0113-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch} (98%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch => 0114-x86-UV2-Fix-BAU-destination-timeout-initialization.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0116-x86-UV2-Work-around-BAU-bug.patch => 0115-x86-UV2-Work-around-BAU-bug.patch} (99%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch => 0116-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0118-rt2800pci-fix-spurious-interrupts-generation.patch => 0117-rt2800pci-fix-spurious-interrupts-generation.patch} (96%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0119-xfs-fix-endian-conversion-issue-in-discard-code.patch => 0118-xfs-fix-endian-conversion-issue-in-discard-code.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch => 0119-i2c-eg20t-modified-the-setting-of-transfer-rate.patch} (88%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0121-score-fix-off-by-one-index-into-syscall-table.patch => 0120-score-fix-off-by-one-index-into-syscall-table.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch => 0121-cifs-lower-default-wsize-when-unix-extensions-are-no.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0123-kprobes-initialize-before-using-a-hlist.patch => 0122-kprobes-initialize-before-using-a-hlist.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0124-proc-clear_refs-do-not-clear-reserved-pages.patch => 0123-proc-clear_refs-do-not-clear-reserved-pages.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch => 0124-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch} (96%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0126-iwlagn-check-for-SMPS-mode.patch => 0125-iwlagn-check-for-SMPS-mode.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch => 0126-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch => 0127-SHM_UNLOCK-fix-long-unpreemptible-section.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch => 0128-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch} (98%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/{0130-Linux-3.2.2.patch => 0129-Linux-3.2.2.patch} (77%)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-pm-firmware.bin
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch => 0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch} (84%)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch => 0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch} (87%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0025-beaglebone-add-enter-key-for-lcd7-cape.patch => 0023-beaglebone-add-enter-key-for-lcd7-cape.patch} (75%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0026-beaglebone-add-gpio-keys-for-lcd.patch => 0024-beaglebone-add-gpio-keys-for-lcd.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0027-beaglebone-fix-direction-of-gpio-keys.patch => 0025-beaglebone-fix-direction-of-gpio-keys.patch} (78%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0028-beaglebone-fix-3.5-lcd-cape-support.patch => 0026-beaglebone-fix-3.5-lcd-cape-support.patch} (83%)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 1ede65c..c5926a8 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r9"
+MACHINE_KERNEL_PR = "r10"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch
deleted file mode 100644
index 3c2c1b4..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f7455ca607fd743b247e01c51d4558ff4f4b0e23 Mon Sep 17 00:00:00 2001
-From: Alexander Aring <a.aring@phytec.de>
-Date: Thu, 8 Dec 2011 15:43:53 +0100
-Subject: [PATCH 113/130] I2C: OMAP: correct SYSC register offset for OMAP4
-
-commit 2727b1753934e154931d6b3bdf20c9b2398457a2 upstream.
-
-Correct OMAP_I2C_SYSC_REG offset in omap4 register map.
-Offset 0x20 is reserved and OMAP_I2C_SYSC_REG has 0x10 as offset.
-
-Signed-off-by: Alexander Aring <a.aring@phytec.de>
-[khilman@ti.com: minor changelog edits]
-Signed-off-by: Kevin Hilman <khilman@ti.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
----
- drivers/i2c/busses/i2c-omap.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
-index 82fff06..e0733b7 100644
---- a/drivers/i2c/busses/i2c-omap.c
-+++ b/drivers/i2c/busses/i2c-omap.c
-@@ -235,7 +235,7 @@ static const u8 reg_map_ip_v2[] = {
- 	[OMAP_I2C_BUF_REG] = 0x94,
- 	[OMAP_I2C_CNT_REG] = 0x98,
- 	[OMAP_I2C_DATA_REG] = 0x9c,
--	[OMAP_I2C_SYSC_REG] = 0x20,
-+	[OMAP_I2C_SYSC_REG] = 0x10,
- 	[OMAP_I2C_CON_REG] = 0xa4,
- 	[OMAP_I2C_OA_REG] = 0xa8,
- 	[OMAP_I2C_SA_REG] = 0xac,
--- 
-1.7.9.4
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch
similarity index 98%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch
index bf54d90..29557a4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0113-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch
@@ -1,7 +1,7 @@
-From 15259eb18bbb73a316954965e66a8a85a9e12635 Mon Sep 17 00:00:00 2001
+From ec2a416f6ce2e5b896074a6e8c86fda4d1d21466 Mon Sep 17 00:00:00 2001
 From: Cliff Wickman <cpw@sgi.com>
 Date: Mon, 16 Jan 2012 15:17:50 -0600
-Subject: [PATCH 114/130] x86/UV2: Fix new UV2 hardware by using native UV2
+Subject: [PATCH 113/129] x86/UV2: Fix new UV2 hardware by using native UV2
  broadcast mode
 
 commit da87c937e5a2374686edd58df06cfd5050b125fa upstream.
@@ -346,5 +346,5 @@ index 5b55219..1341a2e 100644
  	}
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-BAU-destination-timeout-initialization.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-BAU-destination-timeout-initialization.patch
index aa154c9..a750251 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0114-x86-UV2-Fix-BAU-destination-timeout-initialization.patch
@@ -1,7 +1,7 @@
-From b92c8d886296debcaf5af9cceb74f02bbce4d83d Mon Sep 17 00:00:00 2001
+From 0b3a1f5aefb71777fec89809de87c49b917a88e7 Mon Sep 17 00:00:00 2001
 From: Cliff Wickman <cpw@sgi.com>
 Date: Mon, 16 Jan 2012 15:18:48 -0600
-Subject: [PATCH 115/130] x86/UV2: Fix BAU destination timeout initialization
+Subject: [PATCH 114/129] x86/UV2: Fix BAU destination timeout initialization
 
 commit d059f9fa84a30e04279c6ff615e9e2cf3b260191 upstream.
 
@@ -62,5 +62,5 @@ index 1341a2e..c425ff1 100644
  
  	for_each_possible_blade(uvhub) {
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Work-around-BAU-bug.patch
similarity index 99%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Work-around-BAU-bug.patch
index 387d19e..bfcab13 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0115-x86-UV2-Work-around-BAU-bug.patch
@@ -1,7 +1,7 @@
-From 67963c536b1b1f4304913ad0d1b32821510f690d Mon Sep 17 00:00:00 2001
+From d1eaa067ea8545101d57f6d484519722ee8c3783 Mon Sep 17 00:00:00 2001
 From: Cliff Wickman <cpw@sgi.com>
 Date: Mon, 16 Jan 2012 15:19:47 -0600
-Subject: [PATCH 116/130] x86/UV2: Work around BAU bug
+Subject: [PATCH 115/129] x86/UV2: Work around BAU bug
 
 commit c5d35d399e685acccc85a675e8765c26b2a9813a upstream.
 
@@ -566,5 +566,5 @@ index c425ff1..9010ca7 100644
  			printk(KERN_EMERG "%d cpus per uvhub invalid\n",
  				bcp->uvhub_cpu);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch
index b89b863..bde74d7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0116-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch
@@ -1,7 +1,7 @@
-From 414c945630702378c3477085517e8c24e2eb3a57 Mon Sep 17 00:00:00 2001
+From 28cfb4fe93728e07bee3b360682f3a4b2ca6f1f0 Mon Sep 17 00:00:00 2001
 From: Felix Fietkau <nbd@openwrt.org>
 Date: Sat, 14 Jan 2012 15:08:34 +0100
-Subject: [PATCH 117/130] ath9k_hw: fix interpretation of the rx KeyMiss flag
+Subject: [PATCH 116/129] ath9k_hw: fix interpretation of the rx KeyMiss flag
 
 commit 7a532fe7131216a02c81a6c1b1f8632da1195a58 upstream.
 
@@ -57,5 +57,5 @@ index ecdb6fd..bbcb777 100644
  }
  EXPORT_SYMBOL(ath9k_hw_rxprocdesc);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-rt2800pci-fix-spurious-interrupts-generation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-rt2800pci-fix-spurious-interrupts-generation.patch
similarity index 96%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-rt2800pci-fix-spurious-interrupts-generation.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-rt2800pci-fix-spurious-interrupts-generation.patch
index 526265b..2911ced 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-rt2800pci-fix-spurious-interrupts-generation.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0117-rt2800pci-fix-spurious-interrupts-generation.patch
@@ -1,7 +1,7 @@
-From 5feb9896b1fbfcb0ccd73789f3deeef7a53e19c4 Mon Sep 17 00:00:00 2001
+From 021083c5844b20210ced59ad5b760d2a7cb97cd2 Mon Sep 17 00:00:00 2001
 From: Stanislaw Gruszka <sgruszka@redhat.com>
 Date: Fri, 13 Jan 2012 12:59:32 +0100
-Subject: [PATCH 118/130] rt2800pci: fix spurious interrupts generation
+Subject: [PATCH 117/129] rt2800pci: fix spurious interrupts generation
 
 commit dfd00c4c8f3dfa1fd7cec45f83d98b2a49743dcd upstream.
 
@@ -82,5 +82,5 @@ index da48c8a..837b460 100644
  	spin_unlock_irqrestore(&rt2x00dev->irqmask_lock, flags);
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-xfs-fix-endian-conversion-issue-in-discard-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-xfs-fix-endian-conversion-issue-in-discard-code.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-xfs-fix-endian-conversion-issue-in-discard-code.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-xfs-fix-endian-conversion-issue-in-discard-code.patch
index 6a7583d..fda910b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-xfs-fix-endian-conversion-issue-in-discard-code.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0118-xfs-fix-endian-conversion-issue-in-discard-code.patch
@@ -1,7 +1,7 @@
-From ddef510f3f47839e2c1c9498aba0ed5ef09fd792 Mon Sep 17 00:00:00 2001
+From 40713843ccb84ed06d4799763c3832376d6cd5cb Mon Sep 17 00:00:00 2001
 From: Dave Chinner <dchinner@redhat.com>
 Date: Wed, 18 Jan 2012 14:41:45 -0600
-Subject: [PATCH 119/130] xfs: fix endian conversion issue in discard code
+Subject: [PATCH 118/129] xfs: fix endian conversion issue in discard code
 
 commit b1c770c273a4787069306fc82aab245e9ac72e9d upstream
 
@@ -41,5 +41,5 @@ index 8a24f0c..286a051 100644
  		/*
  		 * Too small?  Give up.
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-i2c-eg20t-modified-the-setting-of-transfer-rate.patch
similarity index 88%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-i2c-eg20t-modified-the-setting-of-transfer-rate.patch
index c57ba9c..839253c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0119-i2c-eg20t-modified-the-setting-of-transfer-rate.patch
@@ -1,7 +1,7 @@
-From 8d6915d8e53d9b080f079af5891d109011c6b112 Mon Sep 17 00:00:00 2001
+From 072d0e473d1a1d4adc67a7d39be9f71fea4fadad Mon Sep 17 00:00:00 2001
 From: Toshiharu Okada <toshiharu-linux@dsn.okisemi.com>
 Date: Mon, 26 Sep 2011 16:16:23 +0900
-Subject: [PATCH 120/130] i2c-eg20t: modified the setting of transfer rate.
+Subject: [PATCH 119/129] i2c-eg20t: modified the setting of transfer rate.
 
 commit ff35e8b18984ad2a82cbd259fc07f0be4b34b1aa upstream.
 
@@ -29,5 +29,5 @@ index 18936ac..730215e 100644
  	iowrite32(pch_i2cbc, p + PCH_I2CBC);
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-score-fix-off-by-one-index-into-syscall-table.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-score-fix-off-by-one-index-into-syscall-table.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-score-fix-off-by-one-index-into-syscall-table.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-score-fix-off-by-one-index-into-syscall-table.patch
index 2220869..32a8d96 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-score-fix-off-by-one-index-into-syscall-table.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0120-score-fix-off-by-one-index-into-syscall-table.patch
@@ -1,7 +1,7 @@
-From 9e5123c755ee15680df171b9b871533faa20bd70 Mon Sep 17 00:00:00 2001
+From 9ed6d95eba2ead578e1fa4e5be8cb16b185c8c97 Mon Sep 17 00:00:00 2001
 From: Dan Rosenberg <drosenberg@vsecurity.com>
 Date: Fri, 20 Jan 2012 14:34:27 -0800
-Subject: [PATCH 121/130] score: fix off-by-one index into syscall table
+Subject: [PATCH 120/129] score: fix off-by-one index into syscall table
 
 commit c25a785d6647984505fa165b5cd84cfc9a95970b upstream.
 
@@ -42,5 +42,5 @@ index 577abba..83bb960 100644
  	slli	r8, r27, 2		# get syscall routine
  	la	r11, sys_call_table
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-cifs-lower-default-wsize-when-unix-extensions-are-no.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-cifs-lower-default-wsize-when-unix-extensions-are-no.patch
index 3f2abce..fb4af96 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0121-cifs-lower-default-wsize-when-unix-extensions-are-no.patch
@@ -1,7 +1,7 @@
-From bc39faacff1307f46e6e0738f9b73ec9e3f06dc9 Mon Sep 17 00:00:00 2001
+From ac9426f8233d76fd80412576fb53a26a7b1bd7ea Mon Sep 17 00:00:00 2001
 From: Jeff Layton <jlayton@redhat.com>
 Date: Tue, 17 Jan 2012 16:08:51 -0500
-Subject: [PATCH 122/130] cifs: lower default wsize when unix extensions are
+Subject: [PATCH 121/129] cifs: lower default wsize when unix extensions are
  not used
 
 commit ce91acb3acae26f4163c5a6f1f695d1a1e8d9009 upstream.
@@ -63,5 +63,5 @@ index f3670cf..63e4be4 100644
  	/* can server support 24-bit write sizes? (via UNIX extensions) */
  	if (!tcon->unix_ext || !(unix_cap & CIFS_UNIX_LARGE_WRITE_CAP))
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-kprobes-initialize-before-using-a-hlist.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-kprobes-initialize-before-using-a-hlist.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-kprobes-initialize-before-using-a-hlist.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-kprobes-initialize-before-using-a-hlist.patch
index e516723..3d055c3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-kprobes-initialize-before-using-a-hlist.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0122-kprobes-initialize-before-using-a-hlist.patch
@@ -1,7 +1,7 @@
-From 7e71cd56cf6675bb6ffebddbc6fae6cc1bc17d4d Mon Sep 17 00:00:00 2001
+From d159bea43eb9f0ba806a4ddc7e03dbb218b88136 Mon Sep 17 00:00:00 2001
 From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
 Date: Fri, 20 Jan 2012 14:34:04 -0800
-Subject: [PATCH 123/130] kprobes: initialize before using a hlist
+Subject: [PATCH 122/129] kprobes: initialize before using a hlist
 
 commit d496aab567e7e52b3e974c9192a5de6e77dce32c upstream.
 
@@ -45,5 +45,5 @@ index e5d8464..52fd049 100644
  		hlist_del(&ri->hlist);
  		kfree(ri);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-proc-clear_refs-do-not-clear-reserved-pages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-proc-clear_refs-do-not-clear-reserved-pages.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-proc-clear_refs-do-not-clear-reserved-pages.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-proc-clear_refs-do-not-clear-reserved-pages.patch
index a4405c0..23678bd 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-proc-clear_refs-do-not-clear-reserved-pages.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0123-proc-clear_refs-do-not-clear-reserved-pages.patch
@@ -1,7 +1,7 @@
-From 669ae9fcf0f482983eed166dd9edc06ce3e1f1e9 Mon Sep 17 00:00:00 2001
+From 1740c878a52dd4afc5b6e927d9b157d6db230184 Mon Sep 17 00:00:00 2001
 From: Will Deacon <will.deacon@arm.com>
 Date: Fri, 20 Jan 2012 14:34:09 -0800
-Subject: [PATCH 124/130] proc: clear_refs: do not clear reserved pages
+Subject: [PATCH 123/129] proc: clear_refs: do not clear reserved pages
 
 commit 85e72aa5384b1a614563ad63257ded0e91d1a620 upstream.
 
@@ -60,5 +60,5 @@ index e418c5a..7dcd2a2 100644
  		ptep_test_and_clear_young(vma, addr, pte);
  		ClearPageReferenced(page);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch
similarity index 96%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch
index 498a147..ca05e3e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0124-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch
@@ -1,7 +1,7 @@
-From a59b11463ac1c9a0baf19cf3e713a6dd5c2e5509 Mon Sep 17 00:00:00 2001
+From ddcb13eadda3bcb23d81672ea705d6bfa313bbf8 Mon Sep 17 00:00:00 2001
 From: Michal Hocko <mhocko@suse.cz>
 Date: Fri, 20 Jan 2012 14:33:55 -0800
-Subject: [PATCH 125/130] mm: fix NULL ptr dereference in
+Subject: [PATCH 124/129] mm: fix NULL ptr dereference in
  __count_immobile_pages
 
 commit 687875fb7de4a95223af20ee024282fa9099f860 upstream.
@@ -87,5 +87,5 @@ index 2b8ba3a..485be89 100644
  }
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlagn-check-for-SMPS-mode.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-iwlagn-check-for-SMPS-mode.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlagn-check-for-SMPS-mode.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-iwlagn-check-for-SMPS-mode.patch
index 1691f6a..a3fffd5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlagn-check-for-SMPS-mode.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0125-iwlagn-check-for-SMPS-mode.patch
@@ -1,7 +1,7 @@
-From 3a12635bc47f7e3cd83525ce9e6e98dd3c58b31a Mon Sep 17 00:00:00 2001
+From cd3b4541cb6b11e119007268e0890a1a38e68f8e Mon Sep 17 00:00:00 2001
 From: Wey-Yi Guy <wey-yi.w.guy@intel.com>
 Date: Thu, 10 Nov 2011 06:55:04 -0800
-Subject: [PATCH 126/130] iwlagn: check for SMPS mode
+Subject: [PATCH 125/129] iwlagn: check for SMPS mode
 
 commit b2ccccdca46273c7b321ecf5041c362cd950da20 upstream.
 
@@ -46,5 +46,5 @@ index 5c7c17c..d552fa3 100644
  		IWL_DEBUG_MAC80211(priv, "leave - scanning\n");
  		goto out;
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch
index 03ec19d..7cbd3d8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0126-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch
@@ -1,7 +1,7 @@
-From 5be98e8ad61eb5fb868590255329e30408707c1b Mon Sep 17 00:00:00 2001
+From 98214e3fab80dbfdf54c908de2ae0c9730d6430d Mon Sep 17 00:00:00 2001
 From: Stanislaw Gruszka <sgruszka@redhat.com>
 Date: Fri, 23 Dec 2011 08:13:50 +0100
-Subject: [PATCH 127/130] iwlegacy: 3945: fix hw passive scan on radar
+Subject: [PATCH 126/129] iwlegacy: 3945: fix hw passive scan on radar
  channels
 
 commit 68acc4afb040d98ddfd2cae0de09e2f4e1ee127f upstream.
@@ -56,5 +56,5 @@ index b282d86..05f2ad1 100644
  	len = iwl_legacy_fill_probe_req(priv, (struct ieee80211_mgmt *)scan->data,
  					vif->addr, priv->scan_request->ie,
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-SHM_UNLOCK-fix-long-unpreemptible-section.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-SHM_UNLOCK-fix-long-unpreemptible-section.patch
index d2eb914..3731f65 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0127-SHM_UNLOCK-fix-long-unpreemptible-section.patch
@@ -1,7 +1,7 @@
-From 1d36f35b70322d93b6ed8e39ef38fdd9a895962e Mon Sep 17 00:00:00 2001
+From 5e2208d9c6ce1c5e57ad5fe56adc5b8f349ce23a Mon Sep 17 00:00:00 2001
 From: Hugh Dickins <hughd@google.com>
 Date: Fri, 20 Jan 2012 14:34:19 -0800
-Subject: [PATCH 128/130] SHM_UNLOCK: fix long unpreemptible section
+Subject: [PATCH 127/129] SHM_UNLOCK: fix long unpreemptible section
 
 commit 85046579bde15e532983438f86b36856e358f417 upstream.
 
@@ -118,7 +118,7 @@ index 02ecf2c..854ab58 100644
  	}
  	case IPC_RMID:
 diff --git a/mm/shmem.c b/mm/shmem.c
-index d672250..cc6d40b2 100644
+index d6722506..cc6d40b2 100644
 --- a/mm/shmem.c
 +++ b/mm/shmem.c
 @@ -1068,13 +1068,6 @@ int shmem_lock(struct file *file, int lock, struct user_struct *user)
@@ -182,5 +182,5 @@ index f54a05b..824676a 100644
  static void warn_scan_unevictable_pages(void)
  {
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch
similarity index 98%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch
index 9371b39..e7adafc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0128-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch
@@ -1,7 +1,7 @@
-From ab3abbd7cc331621031a1c603fc6be86c5a72430 Mon Sep 17 00:00:00 2001
+From 8704b3941de0865d7c11921ee2dd7abbc04a0081 Mon Sep 17 00:00:00 2001
 From: Hugh Dickins <hughd@google.com>
 Date: Fri, 20 Jan 2012 14:34:21 -0800
-Subject: [PATCH 129/130] SHM_UNLOCK: fix Unevictable pages stranded after
+Subject: [PATCH 128/129] SHM_UNLOCK: fix Unevictable pages stranded after
  swap
 
 commit 245132643e1cfcd145bbc86a716c1818371fcb93 upstream.
@@ -338,5 +338,5 @@ index 824676a..cb33d9c 100644
  
  static void warn_scan_unevictable_pages(void)
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0130-Linux-3.2.2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-Linux-3.2.2.patch
similarity index 77%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0130-Linux-3.2.2.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-Linux-3.2.2.patch
index 4b7bd53..f4e3ff5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0130-Linux-3.2.2.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.2/0129-Linux-3.2.2.patch
@@ -1,7 +1,7 @@
-From 43a16c537c58047f07f1700cb0b15982ab68c6b8 Mon Sep 17 00:00:00 2001
+From 8e03b0ed729407fef72578c24148208a079e7f2c Mon Sep 17 00:00:00 2001
 From: Greg Kroah-Hartman <gregkh@suse.de>
 Date: Wed, 25 Jan 2012 16:39:32 -0800
-Subject: [PATCH 130/130] Linux 3.2.2
+Subject: [PATCH 129/129] Linux 3.2.2
 
 ---
  Makefile |    2 +-
@@ -20,5 +20,5 @@ index c5edffa..2f684da 100644
  NAME = Saber-toothed Squirrel
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-pm-firmware.bin b/recipes-kernel/linux/linux-ti33x-psp-3.2/am335x-pm-firmware.bin
new file mode 100644
index 0000000000000000000000000000000000000000..571d377dc50cc7bb8258facec8948b86b8025248
GIT binary patch
literal 10732
zcmbta4RBo5b-r((^<yk-#WJqE@*gGz!OFi%LAGhKl9(-!#Ov4&Z4E<LH6c$lLlLBA
z@iJs>T%%-CkHb(xWQMpj!#ISgK`|X-LoBdq%g<2Dq8YGBv&1dVC?tJaZ}e7LX<xr{
z@45TlTP-#Q%{<-x&N=s-bI-l+-gEDLqP|vq#t>q=Da5z&d=JkL@ca{=^1mO0_8ilH
zhVqZE6ru-pKh5(p^nB9#uW{W=rok6HmGpFjz8%jG@H~g-H9YU*8N>6LDj}}Kvl7n@
zc)IYUpWpGUIM6YAtYIK4%v2(Z{{z`tb8TWqCS`@KwN^N>)-p$?fs&GCDzV0jW}Br{
zU&n_-)32X?L);dj-i{ZJMDx=k<EKLQ%!!(j+M1VQ>6g+6#ew1(A(}<4cm_}U;NQbu
zQtDb15|I~<G{oY=TN(<9aVwtd+IVzSm_v>6;Rnqo>u_S56(9cfJ@Mh8Ehid7_M*^G
zIBpxE(71W_kkv74nun*<Is|`fM&^+17w`HrapYX~I!6=ch1(0(x-fhDK9N0tt*Q1N
zL_F7x)^B_ZJ=bKV5ZO+98hTRGw#kUpaYWJwE6In>AukS~ccEECs*cmI#+Zt2@r=@y
zOss~@H32IWcd|qM++;PzYDPT!ay)?lDa+@{uSLRjX1XE!`Y|&mBDI4U9U^4kFs?YS
z6=!8a_MPLB2j4@&uzOs^J6trtyKOA}5`2}qE)~KaA6J;(32JL9q5e<LBrVr@w@CkI
zy7V3x;H9kANcNX;dkMUFqZqRPbWD$Wt+N@NpBLkHGjzYnx=Hhup!b803B?}p(XRsi
zDbTM1{h*H?0lg3O2<ZEL^cK)}gWdxA<39RQ(072o6!bkl`ZCbBg1!v&oj&?<(C+|!
zIp|46*Zm`7vl9Hx;I9PV^3_`f`Z~~8fqsjR-U@mL=&hiyXZlV#9%jS}ccrYG@orOO
z3klbGt9aOIN}Bd8^Hjfx)Eo!0I?tLwH}@A3p$z&Ba_h2>iDTK*(RePs(sf=buFIw+
zcAeLYW^CLVY9tv&8$&NWR}}W8c#h!tnk(#-TQgEGXC&&I%Dx2r7_96E#Sgxi@TC*J
ztO}D=iJGjE7ZQ)lH^Q^IE71N_7qx$_{9i~Ek|I()nChlD7%~pVpkbTisqRy~ooBym
z?(Glv7n1d{c`?JDD3Ejmq{CKxw0O@z)-Xeu3q@r5acDs7;*f9ZZ-nf^aWfMe{kz46
zJrD1M!1%8kYa^TZ_2O7w+FeU_@9R99mJx4^jakCJ)>X6tAMJXki3aK!CASH*n^8B)
za;v+AonV^QN3?G+P3t3C(#>0VUkzcuT5Rh^FXPt$dh6*4VP7{X?C;=r2IUjQnvq7e
zmOOvqG3*+v6vNFI5X1Y&bPVquqxr?Kx8x~?^ecRh81@yX#_%bo`D54*8pY7yxKeED
zI9}U*v_{bOlAJHrpDo4kvQi8eB5ofdZlO;Vw^#F(;`a0Lk3aS@c^$V?d768L{qHWt
zjb`Bo@@ni|!DFx8H>P$}h{sN*`Qxz%wDNd7Uesf1@1!16k0KWLPnO0IuS?#FMDu|+
z-$%2L$jqjxx2fM8aa*e+i{CMx+>pP_7DxW_A|d_?&)4wWi|22+>_I8)Rr$J%u>T}K
z9sk?%)%d>=5fJtrd66leG3+&n0<9=&E%|AI){@^8f@=xJ)`Vf-i}~v7kfzn`>jhzd
zrIby<SIo;^ZsYsyYXjcxLNa04KSbRbX#Mx_M*RxEzX+R#eW+;In}9wjY4x|?u%D21
zw?pE0sJBwq*@rr7KzZ{c>g<$t$k(9>ve66q;k;olF6b4J{ElW5GPa0AD4dRFzZ*a*
z?waSJ&B#eNd6Gcu1E@EE_5{!^0raH++8IFmeaMUNLzuJkiJv95B??xm>#+5=m}j?j
z(`=jS+SZ+tIcTaY)lC`Bd|%F~b03WMP&gruq_C!$xoB&A__9tBaR$B7=jBPV<z=#F
zP*(P_%C|(s9Bjh~`juOiNm-#tNTOGe-B5<6qwcMBL@&r}tdO90#56F2g<R(!+&rk|
zYn56bE7b|1&OH_D&^x4jGuXG61HQdI)i;a@<*$mk%EN?++jER#*-X3Z?4mlrjf@{)
zJfHDa#-C+;C*x+uw=-^Gd@JJ>jBjH6ImYW4w=s?}zLxRl8Almk&G<UT%NSqJ_;SWy
zV!V*?dd71ZTa0Hi{s!Y}#&<C;BB!Ewe3S7g<0RwXGrphk2aMB<|C{kn#=l_P%lIwE
zdl>&4<3|`%E=%_JG5%M^KVtkZjGtjlxh%;)%lHY#2N^%g_(jIM84obt#rPQG2N=J}
zcq`-MjPGRpHsjkB&OO$n#?!6Le~0-uG5#OM>lpurag6bYj6cuVW_&f{9OGq-^NcTN
zJi&OO!nrj2Gner$#xoiBGOlL)FyrE+jA!l<#-ogvbgB0Jp7B%6|9~*&1MI_P9*@4r
zY2G_Z*4Ax5&RECtKNzoI-v=1CFn)n?Gvj9!&S~HGOB~G}Y*)VRV|hImA0zDZE#&j<
zJKzDAeA~fT`?ig-_U&%Q+P6CxYv2A_;gWBgCH8#V!1CI+8-YFFT<7UY+CyH0{UwcN
zt@Rp`0@hwFXPn@OT%mAo5BJ6*=HJHrKVtkI<5`R|jB5zX2+=$)4!F+kB|j)STJG$G
zik8;%TgKYXX@yIEoMOKAbBM8S#~X}wJC6eU{h(Gyv(vg%zaE_M_Rt|8eZP-xpl=`L
zC=5dz;eCvM&G<>iCmH{U@d?KJ8NaTuEjUWAFn>4m4>7-%`TdNiF@BnH9pfi`eo|C5
z{ZYsf*7bHX)_Qj-oYQt6V7~TiEAzGAcQV%Px}C9Z_pOX|TyA2l<F?M{C&h1|OU1v#
zM~A;9`qe%<$){QVDj%KXHGQF?bAG%Ur+!9c?x4=S=oBeBI&BMVc7}2Or?RJTBA!b~
z8u1%5Ymtduf;uWgQ*~-Pbsd#sk)Aq9Bfc70zI@1+<HU!}Ep5nE(mmmr>$DZx;8QTS
z@p2BF7;c1YE^UzPlJm$Om9j$0)}2qbLHZzNN5{|YL+3ptE51TLWX>adRJKiYk?iYJ
zWqth+I6n)-r&IctkiPAosv{^X?F~qK51&W&LD`OIJNb71Ib^A|rm+oqXm^>E+EY+I
z=*j%~6q#V2DI#qcJL>#-FU~z)F6|0k=T+pKn&&@pptGJU%6R(Zfq2Wyc=`l_c-Mfp
z71^^P?bga2K)Ky-%leAv-=$Oi)nz=rJ0)JbkLTZ|67L4^*2t{=8nm~*qTMgc`ifU>
zcd|&a@OXZ^Rla)Vb}t66Am1Q$Dy92KzmN1@t36UULA%rCt{DryZy()XO}>)}YNIQC
zRDDT2f1g}j#`E{dC1pJCq{MX=fVa7<zsl_%mGxDBmD?Shq_}xJzukAscz(O@gSSxj
zS5v9K%I!WR?W#T@Ub}DX&I7Mf-1Xc^aaTK4756VriMu?X$nC~V`+g^#@h36UiIsR(
zxz02BBxYg7^UtV!|03rA&G*&C9vo-K=c&v6U9v3qj-zf5z43S93`gr751w`M9S_az
zwC6NO>dht#r<|5)&oSpjYL6>gJXdu$tpJ8;Wb`_qZ*KIxO(h-k&H0`Vdp>s97p|ku
ztn=x3^8$2iDz(M)W0M*GgnoEB>Mu}7vgC(pn%tHobeI>=7O!6#%|>558b4YG^3Z7Z
zFXWtMj`ZSguCsyehHB*f3Zfvhs-p8_w_J+u5Pg!l@5_9o=sXgTq??tX&S>_<cFJ^$
z&bI=RB&9}{wyyK}qH{+D$vFY*+u8b8D@Zn0l#Eu8tPMyC))}cFS?80CW{+`;=2noL
zACP>TB@LJMaO!<rEwd(ivjon4*5ZFP<|Wl9Gy_y;G-@Ap<r{{Z2F!d@du;~Y=n1da
z-ok$KQc-kT#>%C2?=3h^_U5YIF7+YqvT`e;=%pxfFU)pQYl-{M(Ao^GMnJ2-r~O*J
z{(cBr*RxidLrJU0O+srcwEiML)mIwVA`;Z9_Mt`R7HF+!t@S0Xn)_vFT?(x~si0Mj
zAivglPLHFN(3)YbHKhn>?h<HS2CeA|TGeQ)tQGtJlGgXI3aPkitq%5w%c1qF6|}06
zd5P?;ncQ1?e4d)b$^&0dqql~n)~ldpRRt|-)cUn}V;B4XTzb9IQZ2Q#K+CKOTGWUR
zYSH8RAE9L*`*J{PStTZ&4@<XowC~mZi`L6|iAHDx&c|s?%|dx4${8rB6*VX$C{2_t
z(B$F-Z7IqE%4H}Wl*>_`MY#gy|Djxo^0z3-@)?w^C{NS-MrYQ%S3zbJ!gmp&*|cZj
zJr7px63sg^rtcfH1g&~n1AWh+cTltrM@QApsL5K3uNYF+4xB2RHr?Z0G<XQ#U3fS|
z=MHj>H00TCX^rIkK8YK<{~V7V(WkyTucI99cWBQNw5JmhRT)9>zJoNYJBdlB+f7=N
z&J$(#+rplg7xvOZ(OG~U=_2S_;JPx-0{0Uy`Sq6FO+>RTzEgESqBDJu*B3x111Q|(
zm)smceF1b5=(d1850O0&kv$KQJr9vR50O0&kv$KQz2<<u$9>2f58^<3wz-uuH_G!=
ztHX)*Y)ct!GiWQyXnml4u8ejPw6-!@xT`&TZ5eHIS3K9ZF=)3Ba@Uo~o$T^_rF#oA
zR_GbO@4D>koiAtG8q~Kq<hg2VI8nF{d+m^J$xvfBrg=?P1HQe{UwWv!D&2NOuJo?x
zwrko3yi>aEn)a}yskUp{2}x6J*R<K)R9CfK(>8#n+pcL3OF7kcO*;YF$7nm+r+Sv!
zr(3Vafoi?S^;+-0Q={`P*IAFXUd6D<>g(5cVd3=LOf=glN6t2@H9vc?<}~%r#w~td
z2fh7<S(~ApS$%a<6ZzkF>Ael^&Ga2+p~rQO6?OmYwSGF{e&HhI2WsS<l33|1^k`}y
z`gfo7A&j>{NuDgx=<QMWagdU|NECIK7w*+Oy3tcKeRq0s<fhWy>2p^IaTL#g;aP;w
zVa{+l#^nsqi0*&p0T=Freu0@+%!^Gr?-iG4f|Pmg<z<u`-34Wo)9#!ArRZ$U&&X)K
zMduIsX&Kk~=A?n!+N!*No}~LJ>btuUPu+JomFkEO&+gC^ikRkg=F+qEXpy@T)ICx3
zz9~v#1t)zso>N~6U%i<n{Y_T5vs~wX-0kcAo%V4tbb9fhg^b*fXChOiF+)2oT1BK!
zW%IT7E|lLZPdaZ*Ogisl{-@QV8ec<AIvXau5!o8~!!KQ@3U|%(@<nGlzLTJJVmisA
zwLg*dywR%8vInq=9Cue7nZ$QwK6@YI_wd{JZn1XaTe2K+WqBGUzWoxWs1h||x|k_u
GiT?)_RKvai

literal 0
HcmV?d00001

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
index 99ab48f..6676539 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -1,7 +1,7 @@
-From d325c3f83e6f42536678dbf317f1bbf0e3f8efc7 Mon Sep 17 00:00:00 2001
+From 0a4a06fdba20b76d03dde619a4dec0e88cdad6c3 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/22] f_rndis: HACK around undefined variables
+Subject: [PATCH 01/26] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
index 1cc88e4..23b7aaf 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,7 +1,7 @@
-From 94e7b8b9535e83ad46a523bb5020bd9fdb352f54 Mon Sep 17 00:00:00 2001
+From a89b2d3cdef2af0baa57f31da5e39537d22c247c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/22] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 02/26] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 14 insertions(+)
 
 diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
-index 85eda33..dea8936 100644
+index 2e69278..b01f15b 100644
 --- a/drivers/video/da8xx-fb.c
 +++ b/drivers/video/da8xx-fb.c
-@@ -271,6 +271,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+@@ -272,6 +272,20 @@ static struct da8xx_panel known_lcd_panels[] = {
  		.pxl_clk = 30000000,
  		.invert_pxl_clk = 0,
  	},
@@ -34,5 +34,5 @@ index 85eda33..dea8936 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index c5b1ce0..4b682c5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,15 +1,16 @@
-From 839c23bffe07e2c955904ce3e9e3c776c1b2f88b Mon Sep 17 00:00:00 2001
+From 5b5413023290ed7f79ef3018eeee046c7736d7d0 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 03/22] beaglebone: rebase everything onto 3.2 - WARNING
+Subject: [PATCH 03/26] beaglebone: rebase everything onto 3.2 - WARNING
  MEGAPATCH
 
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |  425 ++++++++++++++++++++++++++++++++-
- 1 file changed, 414 insertions(+), 11 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |  426 ++++++++++++++++++++++++++++++++-
+ 1 file changed, 415 insertions(+), 11 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 8aa7e10..e0c20c5 100644
+index 70aa3a9..12a269f 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
 @@ -19,6 +19,7 @@
@@ -20,7 +21,15 @@ index 8aa7e10..e0c20c5 100644
  #include <linux/spi/spi.h>
  #include <linux/spi/flash.h>
  #include <linux/gpio_keys.h>
-@@ -167,6 +168,66 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
+@@ -35,7 +36,6 @@
+ #include <linux/mfd/tps65910.h>
+ #include <linux/mfd/tps65217.h>
+ #include <linux/pwm_backlight.h>
+-#include <linux/input/ti_tscadc.h>
+ #include <linux/reboot.h>
+ #include <linux/pwm/pwm.h>
+ 
+@@ -172,6 +172,68 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
  
  #include "common.h"
  
@@ -84,14 +93,15 @@ index 8aa7e10..e0c20c5 100644
 +	.type			= "1024x768@60",
 +};
 +
- /* TSc controller */
- #include <linux/input/ti_tscadc.h>
++/* TSc controller */
++#include <linux/input/ti_tscadc.h>
  #include <linux/lis3lv02d.h>
-@@ -320,9 +381,34 @@ struct am335x_evm_eeprom_config {
- static struct am335x_evm_eeprom_config config;
+ 
+ /* TSc controller */
+@@ -340,9 +402,34 @@ static struct am335x_evm_eeprom_config config;
+ static struct am335x_eeprom_config1 config1;
  static bool daughter_brd_detected;
  
--#define GP_EVM_REV_IS_1_0		0x1
 +struct beaglebone_cape_eeprom_config {
 +	u32	header;
 +	char  format_revision[2];
@@ -116,14 +126,14 @@ index 8aa7e10..e0c20c5 100644
 +static bool beaglebone_tsadcpins_free = 1;
 +
 +
-+#define GP_EVM_REV_IS_1_0A		0x1
+ #define GP_EVM_REV_IS_1_0		0x1
  #define GP_EVM_REV_IS_1_1A		0x2
  #define GP_EVM_REV_IS_UNKNOWN		0xFF
 +#define GP_EVM_ACTUALLY_BEAGLEBONE  0xBB
  static unsigned int gp_evm_revision = GP_EVM_REV_IS_UNKNOWN;
+ 
  unsigned int gigabit_enable = 1;
- 
-@@ -404,11 +490,102 @@ static struct pinmux_config lcdc_pin_mux[] = {
+@@ -425,11 +512,102 @@ static struct pinmux_config lcdc_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -226,7 +236,7 @@ index 8aa7e10..e0c20c5 100644
  	{"vrefp.vrefp",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{"vrefn.vrefn",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{NULL, 0},
-@@ -543,9 +720,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
+@@ -564,9 +742,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
  
  static struct pinmux_config i2c2_pin_mux[] = {
  	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
@@ -238,7 +248,7 @@ index 8aa7e10..e0c20c5 100644
  	{NULL, 0},
  };
  
-@@ -823,6 +1000,64 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -844,6 +1022,64 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -303,7 +313,7 @@ index 8aa7e10..e0c20c5 100644
  /* Module pin mux for eCAP0 */
  static struct pinmux_config ecap0_pin_mux[] = {
  	{"ecap0_in_pwm0_out.ecap0_in_pwm0_out",
-@@ -932,6 +1167,51 @@ static void lcdc_init(int evm_id, int profile)
+@@ -966,6 +1202,51 @@ static void lcdc_init(int evm_id, int profile)
  	return;
  }
  
@@ -355,7 +365,7 @@ index 8aa7e10..e0c20c5 100644
  static void tsc_init(int evm_id, int profile)
  {
  	int err;
-@@ -939,16 +1219,48 @@ static void tsc_init(int evm_id, int profile)
+@@ -973,10 +1254,15 @@ static void tsc_init(int evm_id, int profile)
  	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
  		am335x_touchscreen_data.analog_input = 1;
  		pr_info("TSC connected to beta GP EVM\n");
@@ -370,8 +380,9 @@ index 8aa7e10..e0c20c5 100644
 +		pr_info("TSC connected to BeagleBone\n");;	
 +	}
  	setup_pin_mux(tsc_pin_mux);
- 	err = platform_device_register(&tsc_device);
- 	if (err)
+ 
+ 	err = am33xx_register_tsc(&am335x_touchscreen_data);
+@@ -984,6 +1270,33 @@ static void tsc_init(int evm_id, int profile)
  		pr_err("failed to register touchscreen device\n");
  }
  
@@ -379,7 +390,7 @@ index 8aa7e10..e0c20c5 100644
 +{
 +	int err;
 +	setup_pin_mux(tsc_pin_mux);
-+	err = platform_device_register(&bone_tsc_device);
++	err = am33xx_register_tsc(&bone_touchscreen_data);
 +	if (err)
 +		pr_err("failed to register touchscreen device\n");
 +}
@@ -405,7 +416,7 @@ index 8aa7e10..e0c20c5 100644
  static void rgmii1_init(int evm_id, int profile)
  {
  	setup_pin_mux(rgmii1_pin_mux);
-@@ -1358,18 +1670,106 @@ static void i2c1_init(int evm_id, int profile)
+@@ -1429,18 +1742,106 @@ static void i2c1_init(int evm_id, int profile)
  	return;
  }
  
@@ -517,7 +528,7 @@ index 8aa7e10..e0c20c5 100644
  /* Setup McASP 1 */
  static void mcasp1_init(int evm_id, int profile)
  {
-@@ -1723,8 +2123,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -1794,8 +2195,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{rmii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
@@ -528,7 +539,7 @@ index 8aa7e10..e0c20c5 100644
  	{NULL, 0, 0},
  };
  
-@@ -1734,8 +2135,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -1805,8 +2207,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
@@ -539,7 +550,7 @@ index 8aa7e10..e0c20c5 100644
  	{NULL, 0, 0},
  };
  
-@@ -1822,6 +2224,7 @@ static void setup_beaglebone_old(void)
+@@ -1893,6 +2296,7 @@ static void setup_beaglebone_old(void)
  static void setup_beaglebone(void)
  {
  	pr_info("The board is a AM335x Beaglebone.\n");
@@ -548,5 +559,5 @@ index 8aa7e10..e0c20c5 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
index eb79ebb..e8ef8ee 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
@@ -1,18 +1,18 @@
-From e32e80d4258b45a8b59306c3cf2ab35e6ec19ac2 Mon Sep 17 00:00:00 2001
+From f5d99c334bedef5b0213118590ea2ad7dbc2e29a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 04/22] more beaglebone merges
+Subject: [PATCH 04/26] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   63 +++++++++++++++++++++++++++++++--
- 1 file changed, 60 insertions(+), 3 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   52 +++++++++++++++++++++++++++++++--
+ 1 file changed, 50 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index e0c20c5..177ab9e 100644
+index 12a269f..3c67e94 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -248,6 +248,11 @@ static struct resource tsc_resources[]  = {
+@@ -240,6 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -23,34 +23,16 @@ index e0c20c5..177ab9e 100644
 +	.mode = TI_TSCADC_GENMODE,
  };
  
- static struct platform_device tsc_device = {
-@@ -260,6 +265,16 @@ static struct platform_device tsc_device = {
- 	.resource       = tsc_resources,
- };
- 
-+static struct platform_device bone_tsc_device = {
-+	.name   = "tsc",
-+	.id     = -1,
-+	.dev    = {
-+			.platform_data  = &bone_touchscreen_data,
-+	},
-+	.num_resources  = ARRAY_SIZE(tsc_resources),
-+	.resource       = tsc_resources,
-+};
-+
  static u8 am335x_iis_serializer_direction1[] = {
- 	INACTIVE_MODE,	INACTIVE_MODE,	TX_MODE,	RX_MODE,
- 	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,
-@@ -404,7 +419,7 @@ static bool beaglebone_cape_detected;
- static int capecount = 0;
- static bool beaglebone_tsadcpins_free = 1;
+@@ -427,6 +432,7 @@ static bool beaglebone_tsadcpins_free = 1;
  
--
-+#define GP_EVM_REV_IS_1_0		0x1
- #define GP_EVM_REV_IS_1_0A		0x1
+ 
+ #define GP_EVM_REV_IS_1_0		0x1
++#define GP_EVM_REV_IS_1_0A		0x1
  #define GP_EVM_REV_IS_1_1A		0x2
  #define GP_EVM_REV_IS_UNKNOWN		0xFF
-@@ -1000,6 +1015,47 @@ static struct pinmux_config profibus_pin_mux[] = {
+ #define GP_EVM_ACTUALLY_BEAGLEBONE  0xBB
+@@ -1022,6 +1028,47 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -98,7 +80,7 @@ index e0c20c5..177ab9e 100644
  
  #define BEAGLEBONEDVI_USR0_LED  GPIO_TO_PIN(1, 18)
  #define BEAGLEBONEDVI_USR1_LED  GPIO_TO_PIN(1, 19)
-@@ -1703,11 +1759,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1775,11 +1822,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
  	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
  
@@ -112,7 +94,7 @@ index e0c20c5..177ab9e 100644
  		pr_info("BeagleBone cape: initializing LCD cape\n");
  		bbtoys7lcd_init(0,0);
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
-@@ -2154,6 +2210,7 @@ static void setup_general_purpose_evm(void)
+@@ -2226,6 +2273,7 @@ static void setup_general_purpose_evm(void)
  	pr_info("The board is general purpose EVM in profile %d\n", prof_sel);
  
  	if (!strncmp("1.1A", config.version, 4)) {
@@ -121,5 +103,5 @@ index e0c20c5..177ab9e 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
index 5b60b4c..a7f5385 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
@@ -1,7 +1,7 @@
-From 622a15ae235de585d3223384828d68ed6faa7730 Mon Sep 17 00:00:00 2001
+From ca13fa5f840198db430a21a643f3df4788f21b85 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 05/22] beaglebone: disable tsadc
+Subject: [PATCH 05/26] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 177ab9e..87ccf14 100644
+index 3c67e94..b0f5ce3 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -248,11 +248,11 @@ static struct resource tsc_resources[]  = {
+@@ -240,11 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -25,7 +25,7 @@ index 177ab9e..87ccf14 100644
 +//	.mode = TI_TSCADC_GENMODE,
  };
  
- static struct platform_device tsc_device = {
+ static u8 am335x_iis_serializer_direction1[] = {
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index 69f2e4e..01c309d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,7 @@
-From cd5378a9341cb6c5ea511a95ec8ebbfeb2aae44d Mon Sep 17 00:00:00 2001
+From 529eb4be71f6387842a1823c7dcac803cc31d8f9 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 06/22] tscadc: Add general purpose mode, untested with
+Subject: [PATCH 06/26] tscadc: Add general purpose mode, untested with
  touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
@@ -14,15 +14,15 @@ Conflicts:
  arch/arm/mach-omap2/board-am335xevm.c |    2 +
  arch/arm/mach-omap2/mux33xx.c         |   12 ++
  arch/arm/mach-omap2/mux33xx.h         |    4 +
- drivers/input/touchscreen/ti_tscadc.c |  209 +++++++++++++++++++++++++--------
+ drivers/input/touchscreen/ti_tscadc.c |  205 +++++++++++++++++++++++++--------
  include/linux/input/ti_tscadc.h       |    4 +
- 5 files changed, 180 insertions(+), 51 deletions(-)
+ 5 files changed, 178 insertions(+), 49 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 87ccf14..c7bb091 100644
+index b0f5ce3..5ab9c18 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2182,6 +2182,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -2245,6 +2245,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -30,7 +30,7 @@ index 87ccf14..c7bb091 100644
  	{NULL, 0, 0},
  };
  
-@@ -2194,6 +2195,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2257,6 +2258,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -39,7 +39,7 @@ index 87ccf14..c7bb091 100644
  };
  
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 8df8fa9..14ef129 100644
+index 59e51e0..572ed16 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
 @@ -584,6 +584,18 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
@@ -77,23 +77,22 @@ index 70a3012..348c8e5 100644
  #define AM33XX_CONTROL_PADCONF_AIN2_OFFSET			0x0B24
  #define AM33XX_CONTROL_PADCONF_AIN1_OFFSET			0x0B28
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index e3b5775..699503d 100644
+index 950c07f..2f38c0c 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -27,6 +27,8 @@
- #include <linux/input/ti_tscadc.h>
+@@ -28,6 +28,8 @@
  #include <linux/delay.h>
+ #include <linux/pm_runtime.h>
  
 +/* Memory mapped registers here have incorrect offsets!
 + * Correct after referring TRM */
  #define TSCADC_REG_IRQEOI		0x020
  #define TSCADC_REG_RAWIRQSTATUS		0x024
  #define TSCADC_REG_IRQSTATUS		0x028
-@@ -54,12 +56,18 @@
- 
- /*	Register Bitfields	*/
+@@ -58,12 +60,19 @@
  #define TSCADC_IRQWKUP_ENB		BIT(0)
--#define TSCADC_STPENB_STEPENB		0x7FFF
+ #define TSCADC_IRQWKUP_DISABLE		0x00
+ #define TSCADC_STPENB_STEPENB		0x7FFF
 +#define TSCADC_STPENB_STEPENB_TOUCHSCREEN	0x7FFF
 +#define TSCADC_STPENB_STEPENB_GENERAL		0x0400
  #define TSCADC_IRQENB_FIFO0THRES	BIT(2)
@@ -101,8 +100,8 @@ index e3b5775..699503d 100644
  #define TSCADC_IRQENB_FIFO1THRES	BIT(5)
 +#define TSCADC_IRQENB_EOS		BIT(1)
  #define TSCADC_IRQENB_PENUP		BIT(9)
--#define TSCADC_STEPCONFIG_MODE_HWSYNC	0x2
-+#define TSCADC_STEPCONFIG_MODE_HWSYNC		0x2
+ #define TSCADC_IRQENB_HW_PEN		BIT(0)
+ #define TSCADC_STEPCONFIG_MODE_HWSYNC	0x2
 +#define TSCADC_STEPCONFIG_MODE_SWCONT		0x1
 +#define TSCADC_STEPCONFIG_MODE_SWONESHOT	0x0
  #define TSCADC_STEPCONFIG_2SAMPLES_AVG	(1 << 4)
@@ -110,15 +109,15 @@ index e3b5775..699503d 100644
  #define TSCADC_STEPCONFIG_XPP		BIT(5)
  #define TSCADC_STEPCONFIG_XNN		BIT(6)
  #define TSCADC_STEPCONFIG_YPP		BIT(7)
-@@ -105,6 +113,7 @@ struct tscadc {
+@@ -108,6 +117,7 @@ struct tscadc {
+ 	int			wires;
  	int			analog_input;
  	int			x_plate_resistance;
- 	struct clk		*tsc_ick;
 +	int mode;
  	int			irq;
  	void __iomem		*tsc_base;
- };
-@@ -120,6 +129,86 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+ 	unsigned int		ctrl;
+@@ -124,6 +134,86 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
  	writel(val, tsc->tsc_base + reg);
  }
  
@@ -205,7 +204,7 @@ index e3b5775..699503d 100644
  static void tsc_step_config(struct tscadc *ts_dev)
  {
  	unsigned int	stepconfigx = 0, stepconfigy = 0;
-@@ -224,7 +313,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+@@ -228,7 +318,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
  	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG14, stepconfigz2);
  	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY14, delay);
  
@@ -214,7 +213,7 @@ index e3b5775..699503d 100644
  }
  
  static void tsc_idle_config(struct tscadc *ts_config)
-@@ -242,7 +331,7 @@ static void tsc_idle_config(struct tscadc *ts_config)
+@@ -246,7 +336,7 @@ static void tsc_idle_config(struct tscadc *ts_config)
  	tscadc_writel(ts_config, TSCADC_REG_IDLECONFIG, idleconfig);
  }
  
@@ -223,7 +222,7 @@ index e3b5775..699503d 100644
  {
  	struct tscadc		*ts_dev = (struct tscadc *)dev;
  	struct input_dev	*input_dev = ts_dev->input;
-@@ -362,7 +451,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+@@ -367,7 +457,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
  	/* check pending interrupts */
  	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
  
@@ -232,7 +231,7 @@ index e3b5775..699503d 100644
  	return IRQ_HANDLED;
  }
  
-@@ -400,13 +489,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -405,13 +495,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		return -ENODEV;
  	}
  
@@ -254,7 +253,7 @@ index e3b5775..699503d 100644
  
  	res =  request_mem_region(res->start, resource_size(res), pdev->name);
  	if (!res) {
-@@ -422,8 +513,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -427,8 +519,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		goto err_release_mem;
  	}
  
@@ -272,7 +271,7 @@ index e3b5775..699503d 100644
  	if (err) {
  		dev_err(&pdev->dev, "failed to allocate irq.\n");
  		goto err_unmap_regs;
-@@ -443,11 +541,17 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -444,12 +543,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		goto err_free_irq;
  	}
  	clock_rate = clk_get_rate(clk);
@@ -284,13 +283,14 @@ index e3b5775..699503d 100644
  	clk_value = clock_rate / ADC_CLK;
  	if (clk_value < 7) {
  		dev_err(&pdev->dev, "clock input less than min clock requirement\n");
+ 		err = -EINVAL;
  		goto err_fail;
  	}
 +
  	/* TSCADC_CLKDIV needs to be configured to the value minus 1 */
  	clk_value = clk_value - 1;
  	tscadc_writel(ts_dev, TSCADC_REG_CLKDIV, clk_value);
-@@ -458,57 +562,60 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -457,53 +562,55 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	ts_dev->wires = pdata->wires;
  	ts_dev->analog_input = pdata->analog_input;
  	ts_dev->x_plate_resistance = pdata->x_plate_resistance;
@@ -327,6 +327,7 @@ index e3b5775..699503d 100644
 +		}
  	}
  	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);
+ 	ts_dev->ctrl = ctrl;
  
 -	/* Set register bits for Idel Config Mode */
 -	tsc_idle_config(ts_dev);
@@ -381,14 +382,8 @@ index e3b5775..699503d 100644
 -		goto err_fail;
 +	tscadc_writel(ts_dev, TSCADC_REG_CTRL, ctrl);	/* Turn on TSC_ADC */
  
+ 	device_init_wakeup(&pdev->dev, true);
  	platform_set_drvdata(pdev, ts_dev);
- 	return 0;
- 
- err_fail:
-+	printk(KERN_ERR "Fatal error, shutting down TSC_ADC\n");
- 	clk_disable(ts_dev->tsc_ick);
- 	clk_put(ts_dev->tsc_ick);
- err_free_irq:
 diff --git a/include/linux/input/ti_tscadc.h b/include/linux/input/ti_tscadc.h
 index 2c547bb..850cd4b 100644
 --- a/include/linux/input/ti_tscadc.h
@@ -407,5 +402,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
index 6f37ba6..8119270 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
-From f6e6f6bf5e460f5294b4f0f05af14506db631b55 Mon Sep 17 00:00:00 2001
+From 3d2d69999a7de330c9c1e85fcedb094d4f160e16 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 07/22] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 07/26] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -14,10 +14,10 @@ Conflicts:
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index c7bb091..17705b3 100644
+index 5ab9c18..2597650 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2182,7 +2182,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -2245,7 +2245,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -27,10 +27,10 @@ index c7bb091..17705b3 100644
  };
  
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 699503d..f813564 100644
+index 2f38c0c..5070450 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -462,7 +462,7 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+@@ -468,7 +468,7 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
  static	int __devinit tscadc_probe(struct platform_device *pdev)
  {
  	struct tscadc			*ts_dev;
@@ -40,5 +40,5 @@ index 699503d..f813564 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
index 6f49918..2cf1fec 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,7 +1,7 @@
-From d27f8ff05d04b9191f70eb8a7cb4d901d3ab50f7 Mon Sep 17 00:00:00 2001
+From 165b0cfffef915ca0efc4f55bc7078c55893ef3e Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 08/22] AM335X: init tsc bone style for new boards
+Subject: [PATCH 08/26] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 17705b3..ac4f78f 100644
+index 2597650..5bac604 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2195,7 +2195,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2258,7 +2258,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -22,5 +22,5 @@ index 17705b3..ac4f78f 100644
  };
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
index 47d9b24..d1dadf2 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,7 +1,7 @@
-From 750ca3e9b053119b867d3630bf5c891b845144b3 Mon Sep 17 00:00:00 2001
+From f7e890d43fd383c48e75bbdc363e5ce44bd5eb04 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 09/22] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 09/26] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index f813564..0b91bdc 100644
+index 5070450..3950696 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -129,7 +129,9 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+@@ -134,7 +134,9 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
  	writel(val, tsc->tsc_base + reg);
  }
  
@@ -23,7 +23,7 @@ index f813564..0b91bdc 100644
  {
  	unsigned int	stepconfig = 0, delay = 0, chargeconfig = 0;
  
-@@ -141,7 +143,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev)
+@@ -146,7 +148,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev)
   	 */
  	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
  		TSCADC_STEPCONFIG_2SAMPLES_AVG |
@@ -32,7 +32,7 @@ index f813564..0b91bdc 100644
  
  	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
  
-@@ -602,7 +604,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -603,7 +605,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  			goto err_fail;
  	}
  	else {
@@ -42,5 +42,5 @@ index f813564..0b91bdc 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
index a008eb5..a076542 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
-From fb718df2afa6f3876c22d830c55de70943d95812 Mon Sep 17 00:00:00 2001
+From 50c698d37ac59a4ba4cec9d6b844444e312e1a26 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 10/22] tscadc: Trigger through sysfs
+Subject: [PATCH 10/26] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -14,15 +14,16 @@ Conflicts:
  2 files changed, 56 insertions(+), 5 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 0b91bdc..a74d9ba 100644
+index 3950696..8661b3a 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -26,6 +26,17 @@
+@@ -26,8 +26,19 @@
  #include <linux/io.h>
  #include <linux/input/ti_tscadc.h>
  #include <linux/delay.h>
 +#include <linux/device.h>
-+
+ #include <linux/pm_runtime.h>
+ 
 +size_t do_adc_sample(struct kobject *, struct attribute *, char *);
 +static DEVICE_ATTR(ain1, S_IRUGO, do_adc_sample, NULL);
 +static DEVICE_ATTR(ain2, S_IRUGO, do_adc_sample, NULL);
@@ -32,10 +33,11 @@ index 0b91bdc..a74d9ba 100644
 +static DEVICE_ATTR(ain6, S_IRUGO, do_adc_sample, NULL);
 +static DEVICE_ATTR(ain7, S_IRUGO, do_adc_sample, NULL);
 +static DEVICE_ATTR(ain8, S_IRUGO, do_adc_sample, NULL);
- 
++
  /* Memory mapped registers here have incorrect offsets!
   * Correct after referring TRM */
-@@ -144,12 +155,12 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+ #define TSCADC_REG_IRQEOI		0x020
+@@ -149,12 +160,12 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
  	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
  		TSCADC_STEPCONFIG_2SAMPLES_AVG |
  		((channel-1) << 19);
@@ -50,7 +52,7 @@ index 0b91bdc..a74d9ba 100644
  	/* Get the ball rolling, this will trigger the FSM to step through
   	 * as soon as TSC_ADC_SS is turned on */
  	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
-@@ -199,7 +210,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -204,7 +215,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  		irqclr |= TSCADC_IRQENB_FIFO1THRES;
  	}
  
@@ -59,7 +61,7 @@ index 0b91bdc..a74d9ba 100644
  
  	tscadc_writel(ts_dev, TSCADC_REG_IRQSTATUS, irqclr);
  
-@@ -207,7 +218,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -212,7 +223,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
  
  	/* Turn on Step 1 again */
@@ -68,7 +70,7 @@ index 0b91bdc..a74d9ba 100644
  	return IRQ_HANDLED;
  }
  
-@@ -461,6 +472,34 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+@@ -467,6 +478,34 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
  * The functions for inserting/removing driver as a module.
  */
  
@@ -103,7 +105,7 @@ index 0b91bdc..a74d9ba 100644
  static	int __devinit tscadc_probe(struct platform_device *pdev)
  {
  	struct tscadc			*ts_dev;
-@@ -472,6 +511,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -478,6 +517,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	struct resource			*res;
  	struct clk			*clk;
  
@@ -122,7 +124,7 @@ index 0b91bdc..a74d9ba 100644
  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  	if (!res) {
  		dev_err(&pdev->dev, "no memory resource defined.\n");
-@@ -604,7 +655,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -605,7 +656,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  			goto err_fail;
  	}
  	else {
@@ -143,5 +145,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
index 9470d39..c7c1c37 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,7 +1,7 @@
-From f3e413faef836c5f9357f091d7149a8924ffabdd Mon Sep 17 00:00:00 2001
+From 92c8dd2fe6e62db7bcb07a9010c5eb9b757f2446 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 11/22] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 11/26] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index a74d9ba..1f9cbf5 100644
+index 8661b3a..c82f9bf 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -181,14 +181,14 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -186,14 +186,14 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  
  	status = tscadc_readl(ts_dev, TSCADC_REG_IRQSTATUS);
  
@@ -30,5 +30,5 @@ index a74d9ba..1f9cbf5 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
index d1456ad..d08d8d5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,7 +1,7 @@
-From 994bbaf10e91e859c54ba238e72e8f6f496c14e0 Mon Sep 17 00:00:00 2001
+From a1bedb47197c154069710b8f0f2258a7651cc05c Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 12/22] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 12/26] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 1f9cbf5..8e2a994 100644
+index c82f9bf..3082e5c 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -477,6 +477,8 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+@@ -483,6 +483,8 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
  	struct device *dev;
  	struct tscadc *ts_dev;
  	int channel_num;
@@ -21,7 +21,7 @@ index 1f9cbf5..8e2a994 100644
  
  	pdev = (struct platform_device *)container_of(kobj, struct device, kobj);
  	dev = &pdev->dev;
-@@ -496,7 +498,17 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+@@ -502,7 +504,17 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
  
  	tsc_adc_step_config(ts_dev, channel_num);
  
@@ -40,7 +40,7 @@ index 1f9cbf5..8e2a994 100644
  	return strlen(attr->name);
  }
  
-@@ -656,7 +668,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -657,7 +669,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	}
  	else {
  		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
@@ -50,5 +50,5 @@ index 1f9cbf5..8e2a994 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
index 9736738..5931829 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
@@ -1,7 +1,7 @@
-From 045193b61f57d4244e569800b252fff5e6e91a4b Mon Sep 17 00:00:00 2001
+From 1d54ffc655a7d22e1477e3bc0d72c0593049d83b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 13/22] beaglebone: fix ADC init
+Subject: [PATCH 13/26] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index ac4f78f..177ab9e 100644
+index 5bac604..3c67e94 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -248,11 +248,11 @@ static struct resource tsc_resources[]  = {
+@@ -240,11 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -25,8 +25,8 @@ index ac4f78f..177ab9e 100644
 +	.mode = TI_TSCADC_GENMODE,
  };
  
- static struct platform_device tsc_device = {
-@@ -2182,7 +2182,6 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+ static u8 am335x_iis_serializer_direction1[] = {
+@@ -2245,7 +2245,6 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -34,7 +34,7 @@ index ac4f78f..177ab9e 100644
  	{NULL, 0, 0},
  };
  
-@@ -2195,7 +2194,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2258,7 +2257,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -43,5 +43,5 @@ index ac4f78f..177ab9e 100644
  };
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
index 15aebe5..44c5052 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
@@ -1,7 +1,7 @@
-From bc405fc66657f9275bcdfe82c46e78ab71195f93 Mon Sep 17 00:00:00 2001
+From c150d02db78ceb0ec05774b834bf2001c6427552 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 16:49:52 +0100
-Subject: [PATCH 14/22] AM335x: MUX: add ehrpwm1A
+Subject: [PATCH 14/26] AM335x: MUX: add ehrpwm1A
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 14ef129..fcb81ec 100644
+index 572ed16..0f71646 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
 @@ -85,7 +85,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
@@ -22,5 +22,5 @@ index 14ef129..fcb81ec 100644
  		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
  		NULL, NULL, NULL, "gpio1_19"),
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
index b98a95c..ba2b306 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -1,38 +1,19 @@
-From b1340250f872964ced2298fc4e0ae4d39469cf12 Mon Sep 17 00:00:00 2001
+From 46c7fc0ed1ad0e5da431d15a4333a4fb5bb0ff0e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 17:02:10 +0100
-Subject: [PATCH 15/22] beaglebone: enable PWM for lcd backlight <- backlight
+Subject: [PATCH 15/26] beaglebone: enable PWM for lcd backlight <- backlight
  is inverted
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   54 +++++++++++++++++++++++++++------
- arch/arm/mach-omap2/devices.c         |   13 ++++++++
- arch/arm/mach-omap2/devices.h         |    1 +
- 3 files changed, 58 insertions(+), 10 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   51 +++++++++++++++++++++++++++------
+ 1 file changed, 42 insertions(+), 9 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 177ab9e..6a77194 100644
+index 3c67e94..23b59c2 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -36,6 +36,7 @@
- #include <linux/mfd/tps65910.h>
- #include <linux/mfd/tps65217.h>
- #include <linux/pwm_backlight.h>
-+#include <linux/pwm/pwm.h>
- 
- /* LCD controller is similar to DA850 */
- #include <video/da8xx-fb.h>
-@@ -131,7 +132,7 @@ static const struct display_panel disp_panel = {
- /* LCD backlight platform Data */
- #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
- #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    100
--#define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 10)
-+#define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 5)
- 
- #define PWM_DEVICE_ID   "ecap.0"
- 
-@@ -175,6 +176,16 @@ static const struct display_panel bbtoys7_panel = {
+@@ -179,6 +179,16 @@ static const struct display_panel bbtoys7_panel = {
  	COLOR_ACTIVE,
  };
  
@@ -49,7 +30,7 @@ index 177ab9e..6a77194 100644
  static struct lcd_ctrl_config bbtoys7_cfg = {
  	&bbtoys7_panel,
  	.ac_bias		= 255,
-@@ -586,9 +597,9 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+@@ -599,9 +609,9 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
  	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
  	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
  	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
@@ -61,7 +42,7 @@ index 177ab9e..6a77194 100644
  	{NULL, 0},
  };
  
-@@ -1121,6 +1132,7 @@ static struct pinmux_config ecap0_pin_mux[] = {
+@@ -1134,6 +1144,7 @@ static struct pinmux_config ecap0_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -69,7 +50,7 @@ index 177ab9e..6a77194 100644
  static int backlight_enable;
  
  #define AM335XEVM_WLAN_PMENA_GPIO	GPIO_TO_PIN(1, 30)
-@@ -1190,6 +1202,30 @@ static int __init ecap0_init(void)
+@@ -1216,6 +1227,30 @@ static int __init ecap0_init(void)
  }
  late_initcall(ecap0_init);
  
@@ -100,7 +81,7 @@ index 177ab9e..6a77194 100644
  static int __init conf_disp_pll(int rate)
  {
  	struct clk *disp_pll;
-@@ -1224,11 +1260,12 @@ static void lcdc_init(int evm_id, int profile)
+@@ -1250,11 +1285,12 @@ static void lcdc_init(int evm_id, int profile)
  }
  
  #define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
@@ -114,7 +95,7 @@ index 177ab9e..6a77194 100644
  
  	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
  	if (conf_disp_pll(300000000)) {
-@@ -1239,12 +1276,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+@@ -1265,12 +1301,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
  	
  	if (am33xx_register_lcdc(&bbtoys7_pdata))
  		pr_info("Failed to register Beagleboardtoys 7\" LCD cape device\n");
@@ -128,7 +109,7 @@ index 177ab9e..6a77194 100644
  	return;
  }
  
-@@ -1768,6 +1800,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1831,6 +1862,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		bbtoys7lcd_init(0,0);
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
@@ -137,41 +118,6 @@ index 177ab9e..6a77194 100644
  		beaglebone_tsadcpins_free = 0;
  	}
  	
-diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
-index 198df7b..8cd2523 100644
---- a/arch/arm/mach-omap2/devices.c
-+++ b/arch/arm/mach-omap2/devices.c
-@@ -1278,6 +1278,19 @@ void register_ehrpwm(int max_freq)
- 	platform_device_register(&am335x_epwm2_device);
- }
- 
-+void register_ehrpwm1(int max_freq)
-+{
-+	int val;
-+
-+	val = __raw_readw(AM33XX_CTRL_REGADDR(AM33XX_PWMSS_CTRL));
-+	val |= PWMSS1_TBCLKEN;
-+	__raw_writew(val, AM33XX_CTRL_REGADDR(AM33XX_PWMSS_CTRL));
-+	am335x_pwmss_config1.chan_attrib[1].max_freq = max_freq;
-+	sema_init(&am335x_pwmss_config1.config_semaphore, 1);
-+	am335x_pwmss_config1.version = PWM_VERSION_1;
-+	platform_device_register(&am335x_epwm1_device);
-+}
-+
- static struct resource am335x_ecap0_resurce[] = {
- 	{
- 		.start = AM33XX_EPWMSS0_BASE ,
-diff --git a/arch/arm/mach-omap2/devices.h b/arch/arm/mach-omap2/devices.h
-index e086839..5161eb4 100644
---- a/arch/arm/mach-omap2/devices.h
-+++ b/arch/arm/mach-omap2/devices.h
-@@ -18,5 +18,6 @@ int omap3_init_camera(struct isp_platform_data *pdata);
- 
- void __init am335x_register_mcasp1(struct snd_platform_data *pdata);
- extern void register_ehrpwm(int max_freq);
-+extern void register_ehrpwm1(int max_freq);
- 
- #endif
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
index fb61077..42e342b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -1,7 +1,7 @@
-From 0cc4e8a341f58683ee26bceb27e43cbb7bb3dc30 Mon Sep 17 00:00:00 2001
+From 96debb4a5199afb9ad47e8c94292540e99d4050f Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
 Date: Mon, 18 Jul 2011 23:13:41 -0500
-Subject: [PATCH 16/22] omap_hsmmc: Set dto to max value of 14 to avoid SD
+Subject: [PATCH 16/26] omap_hsmmc: Set dto to max value of 14 to avoid SD
  Card timeouts
 
 This fixes MMC errors due to timeouts on certain SD Cards following suggestions
@@ -16,12 +16,12 @@ This fix was originally proposed by Sukumar Ghoral of TI.
  1 file changed, 3 insertions(+)
 
 diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
-index 703013c..554237f 100644
+index 1f938d9..ace26f7 100644
 --- a/drivers/mmc/host/omap_hsmmc.c
 +++ b/drivers/mmc/host/omap_hsmmc.c
-@@ -1562,6 +1562,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
- 			dto = 14;
- 	}
+@@ -1542,6 +1542,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host)
+ 	/* Use the maximum timeout value allowed in the standard of 14 or 0xE */
+ 	dto = 14;
  
 +	/* Set dto to max value of 14 to avoid SD Card timeouts */
 +	dto = 14;
@@ -30,5 +30,5 @@ index 703013c..554237f 100644
  	reg |= dto << DTO_SHIFT;
  	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
index d170569..a52ff8c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -1,7 +1,7 @@
-From f4574c67479c3c86f5eb78a1806f627740c91483 Mon Sep 17 00:00:00 2001
+From 55315e3442ea08e4bd0d676921f968dc1fccf588 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 1 Feb 2012 14:10:38 +0100
-Subject: [PATCH 17/22] beaglebone: set default brightness to 50% for pwm
+Subject: [PATCH 17/26] beaglebone: set default brightness to 50% for pwm
  backlights
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -10,18 +10,18 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 6a77194..c31c0aa 100644
+index 23b59c2..9294af5 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -131,7 +131,7 @@ static const struct display_panel disp_panel = {
+@@ -133,7 +133,7 @@ static const struct display_panel disp_panel = {
  
  /* LCD backlight platform Data */
  #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
 -#define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    100
 +#define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
- #define AM335X_PWM_PERIOD_NANO_SECONDS        (1000000 * 5)
+ #define AM335X_PWM_PERIOD_NANO_SECONDS        (5000 * 10)
  
  #define PWM_DEVICE_ID   "ecap.0"
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
index fbd442c..9f60391 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -1,7 +1,7 @@
-From dd3b1a497531a579e80656f298bf8adf7a789f43 Mon Sep 17 00:00:00 2001
+From 87a3d78cceff02796574ec9c0e5ee9c81372cd29 Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Mon, 21 Nov 2011 12:55:23 -0500
-Subject: [PATCH 18/22] st7735fb: WIP framebuffer driver supporting Adafruit
+Subject: [PATCH 18/26] st7735fb: WIP framebuffer driver supporting Adafruit
  1.8" SPI LCD
 
 Signed-off-by: Matt Porter <mporter@ti.com>
@@ -664,5 +664,5 @@ index 0000000..250f036
 +
 +
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
index 8986fd8..c165721 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
@@ -1,7 +1,7 @@
-From a2282555e35f8f3278d0d4b2fd67348152dde883 Mon Sep 17 00:00:00 2001
+From 4f40b3e2d3fa97add575cfd398fc76595d2c2141 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 7 Feb 2012 11:01:13 +0100
-Subject: [PATCH 19/22] beaglebone: use P8_6 (gpio1_3) as w1 bus
+Subject: [PATCH 19/26] beaglebone: use P8_6 (gpio1_3) as w1 bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,18 +9,18 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 31 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index c31c0aa..538466d 100644
+index 9294af5..88f07e3 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -37,6 +37,7 @@
- #include <linux/mfd/tps65217.h>
+@@ -38,6 +38,7 @@
  #include <linux/pwm_backlight.h>
+ #include <linux/reboot.h>
  #include <linux/pwm/pwm.h>
 +#include <linux/w1-gpio.h>
  
  /* LCD controller is similar to DA850 */
  #include <video/da8xx-fb.h>
-@@ -603,6 +604,11 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+@@ -615,6 +616,11 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -32,7 +32,7 @@ index c31c0aa..538466d 100644
  static struct pinmux_config tsc_pin_mux[] = {
  	{"ain0.ain0",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{"ain1.ain1",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
-@@ -1026,6 +1032,19 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -1038,6 +1044,19 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -52,7 +52,7 @@ index c31c0aa..538466d 100644
  /* LEDS - gpio1_21 -> gpio1_24 */
  
  #define BEAGLEBONE_USR1_LED  GPIO_TO_PIN(1, 21)
-@@ -1349,6 +1368,17 @@ static void dvileds_init(int evm_id, int profile )
+@@ -1375,6 +1394,17 @@ static void dvileds_init(int evm_id, int profile )
  		pr_err("failed to register BeagleBone DVI cape LEDS\n");
  }
  
@@ -70,7 +70,7 @@ index c31c0aa..538466d 100644
  static void rgmii1_init(int evm_id, int profile)
  {
  	setup_pin_mux(rgmii1_pin_mux);
-@@ -2228,6 +2258,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2290,6 +2320,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -79,5 +79,5 @@ index c31c0aa..538466d 100644
  };
  
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
index 9baf0c0..59b8607 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -1,7 +1,7 @@
-From 9d67d32b9f1132157cd96a2e126a5b667b3640f1 Mon Sep 17 00:00:00 2001
+From 89028c4350be00850cb58b9dcb82d93dcb6373c4 Mon Sep 17 00:00:00 2001
 From: Alessandro Zummo <a.zummo@towertech.it>
 Date: Thu, 9 Feb 2012 12:46:52 +0100
-Subject: [PATCH 20/22] beaglebone: add support for Towertech TT3201 CAN cape
+Subject: [PATCH 20/26] beaglebone: add support for Towertech TT3201 CAN cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -12,18 +12,18 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  4 files changed, 98 insertions(+), 19 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 538466d..36efca1 100644
+index 88f07e3..a30689f 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -38,6 +38,7 @@
- #include <linux/pwm_backlight.h>
+@@ -39,6 +39,7 @@
+ #include <linux/reboot.h>
  #include <linux/pwm/pwm.h>
  #include <linux/w1-gpio.h>
 +#include <linux/can/platform/mcp251x.h>
  
  /* LCD controller is similar to DA850 */
  #include <video/da8xx-fb.h>
-@@ -829,6 +830,15 @@ static struct pinmux_config d_can_ia_pin_mux[] = {
+@@ -841,6 +842,15 @@ static struct pinmux_config d_can_ia_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -39,7 +39,7 @@ index 538466d..36efca1 100644
  /* Module pin mux for uart2 */
  static struct pinmux_config uart2_pin_mux[] = {
  	{"spi0_sclk.uart2_rxd", OMAP_MUX_MODE1 | AM33XX_SLEWCTRL_SLOW |
-@@ -1788,6 +1798,44 @@ static void i2c1_init(int evm_id, int profile)
+@@ -1850,6 +1860,44 @@ static void i2c1_init(int evm_id, int profile)
  	return;
  }
  
@@ -84,7 +84,7 @@ index 538466d..36efca1 100644
  static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
  {
  	capecount++;
-@@ -1835,7 +1883,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1897,7 +1945,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		beaglebone_tsadcpins_free = 0;
  	}
  	
@@ -98,7 +98,7 @@ index 538466d..36efca1 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index fcb81ec..2de76e3 100644
+index 0f71646..25dcedb 100644
 --- a/arch/arm/mach-omap2/mux33xx.c
 +++ b/arch/arm/mach-omap2/mux33xx.c
 @@ -312,16 +312,16 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
@@ -316,5 +316,5 @@ index 330140e..b3e231c 100644
  	}
  error_probe:
 -- 
-1.7.9.4
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
deleted file mode 100644
index 2d37f2c..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6a1eef2a91f39da5bcca2e6b11f60298a9f15831 Mon Sep 17 00:00:00 2001
-From: "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
-Date: Tue, 24 Jan 2012 19:45:12 +0530
-Subject: [PATCH 21/22] ARM: OMAP2+: am33xx: fix serial mux warnings for
- am33xx
-
-The patch removes below warning in serial mux setup on AM335x platform
-
-[    0.162052] _omap_mux_get_by_name: Could not find signal
-uart1_cts.uart1_cts
-[    0.169437] omap_hwmod_mux_init: Could not allocate device mux entry
-[    0.176384] _omap_mux_get_by_name: Could not find signal
-uart2_cts.uart2_cts
-[    0.183735] omap_hwmod_mux_init: Could not allocate device mux entry
-[    0.190663] _omap_mux_get_by_name: Could not find signal
-uart3_cts_rctx.uart3_cts_rctx
-[    0.198926] omap_hwmod_mux_init: Could not allocate device mux entry
-
-Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
----
- arch/arm/mach-omap2/serial.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-omap2/serial.c b/arch/arm/mach-omap2/serial.c
-index ad5bed3..bfa8ae3 100644
---- a/arch/arm/mach-omap2/serial.c
-+++ b/arch/arm/mach-omap2/serial.c
-@@ -409,7 +409,8 @@ void __init omap_serial_board_init(struct omap_uart_port_info *info)
- 		bdata.pads = NULL;
- 		bdata.pads_cnt = 0;
- 
--		if (cpu_is_omap44xx() || cpu_is_omap34xx())
-+		if (cpu_is_omap44xx() || (cpu_is_omap34xx() &&
-+							!cpu_is_am33xx()))
- 			omap_serial_fill_default_pads(&bdata);
- 
- 		if (!info)
--- 
-1.7.9.4
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
similarity index 84%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index 748386a..0067a5e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -1,18 +1,18 @@
-From a0bf4fec50d8a0690e6f4ded292d24fb00d9e01a Mon Sep 17 00:00:00 2001
+From 6f8cb102c35b2770f11da5fc4ad9585b529c0bf2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 12:01:35 +0100
-Subject: [PATCH 23/27] beaglebone: add more beagleboardtoys cape partnumbers
+Subject: [PATCH 21/26] beaglebone: add more beagleboardtoys cape partnumbers
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   25 ++++++++++++++++++++++++-
- 1 files changed, 24 insertions(+), 1 deletions(-)
+ 1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 36efca1..58a0e77 100644
+index a30689f..73d9dd9 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1883,11 +1883,34 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1945,11 +1945,34 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		beaglebone_tsadcpins_free = 0;
  	}
  	
@@ -49,5 +49,5 @@ index 36efca1..58a0e77 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
deleted file mode 100644
index 7615d69..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d03a78bdff2f490d20510d0a90214a0b75f81639 Mon Sep 17 00:00:00 2001
-From: "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
-Date: Mon, 27 Feb 2012 11:56:39 +0530
-Subject: [PATCH 22/22] ARM: OMAP2+: am335x: correct McASP0 pin mux detail
-
-McASP0 AXR3 pin mux-mode was incorrect specified in mux file. This
-patch corrects the same.
-
-Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
----
- arch/arm/mach-omap2/mux33xx.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
-index 2de76e3..25dcedb 100644
---- a/arch/arm/mach-omap2/mux33xx.c
-+++ b/arch/arm/mach-omap2/mux33xx.c
-@@ -351,7 +351,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
- 		"mcasp0_axr1", NULL, NULL, "mcasp1_axr0",
- 		NULL, NULL, NULL, "gpio3_20"),
- 	_AM33XX_MUXENTRY(MCASP0_AHCLKX, 0,
--		"mcasp0_ahclkx", "mcasp0_axr3",	NULL, "mcasp1_axr1",
-+		"mcasp0_ahclkx", NULL, "mcasp0_axr3", "mcasp1_axr1",
- 		NULL, NULL, NULL, "gpio3_21"),
- 	_AM33XX_MUXENTRY(XDMA_EVENT_INTR0, 0,
- 		"xdma_event_intr0", NULL, NULL, NULL,
--- 
-1.7.9.4
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
similarity index 87%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index 4d44ae0..7b8d242 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -1,18 +1,19 @@
-From 58f1b0546b2831d9ed15e8bf43f709085a60b2e9 Mon Sep 17 00:00:00 2001
+From fd358035f83d5edab1130ea569be580960a0dce7 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 13:32:43 +0100
-Subject: [PATCH 24/27] beaglebone: add gpio-keys for lcd7, add notes for missing functionality for other capes
+Subject: [PATCH 22/26] beaglebone: add gpio-keys for lcd7, add notes for
+ missing functionality for other capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   79 +++++++++++++++++++++++++++++++++
- 1 files changed, 79 insertions(+), 0 deletions(-)
+ 1 file changed, 79 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 58a0e77..7a2b851 100644
+index 73d9dd9..a3d7846 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -980,6 +980,73 @@ static void volume_keys_init(int evm_id, int profile)
+@@ -992,6 +992,73 @@ static void volume_keys_init(int evm_id, int profile)
  		pr_err("failed to register matrix keypad (2x3) device\n");
  }
  
@@ -86,7 +87,7 @@ index 58a0e77..7a2b851 100644
  /*
  * @evm_id - evm id which needs to be configured
  * @dev_cfg - single evm structure which includes
-@@ -1881,6 +1948,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1943,6 +2010,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: Registering PWM backlight for LCD cape\n");
  		enable_ehrpwm1(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -95,7 +96,7 @@ index 58a0e77..7a2b851 100644
  	}
  	
  	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
-@@ -1889,6 +1958,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1951,6 +2020,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -106,7 +107,7 @@ index 58a0e77..7a2b851 100644
  	}
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
-@@ -1898,11 +1971,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1960,11 +2033,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: initializing battery cape\n");
@@ -125,5 +126,5 @@ index 58a0e77..7a2b851 100644
  	}
  	
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
similarity index 75%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
index 7e93d61..332b862 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
@@ -1,18 +1,18 @@
-From 18a371473e99ca637dafe68d9d77ebae4585b873 Mon Sep 17 00:00:00 2001
+From 2eb2e497cb55889497801ac263d7aa309656ff89 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 14:26:37 +0100
-Subject: [PATCH 25/27] beaglebone: add enter key for lcd7 cape
+Subject: [PATCH 23/26] beaglebone: add enter key for lcd7 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
+ 1 file changed, 9 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 7a2b851..ed2ff18 100644
+index a3d7846..e77bcd6 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -986,6 +986,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
+@@ -998,6 +998,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
  	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
  	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
  	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
@@ -20,7 +20,7 @@ index 7a2b851..ed2ff18 100644
  	{NULL, 0},
  };
  
-@@ -1023,6 +1024,14 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1035,6 +1036,14 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
  	},
@@ -36,5 +36,5 @@ index 7a2b851..ed2ff18 100644
  
  static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
index 2d8270e..44ebfda 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
@@ -1,18 +1,18 @@
-From ac98d63f016be414cbb91d283b0ef48f3c7c5b92 Mon Sep 17 00:00:00 2001
+From d76d09ea8918a1aa315b44d4e12b71a522545da8 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 15:15:06 +0100
-Subject: [PATCH 26/26] beaglebone: add gpio-keys for lcd
+Subject: [PATCH 24/26] beaglebone: add gpio-keys for lcd
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   82 +++++++++++++++++++++++++++++++--
- 1 files changed, 78 insertions(+), 4 deletions(-)
+ 1 file changed, 78 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index ed2ff18..badee96 100644
+index e77bcd6..ed2ea68 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1056,6 +1056,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
+@@ -1068,6 +1068,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
  		pr_err("failed to register gpio keys for LCD7 cape\n");
  }
  
@@ -95,7 +95,7 @@ index ed2ff18..badee96 100644
  /*
  * @evm_id - evm id which needs to be configured
  * @dev_cfg - single evm structure which includes
-@@ -1967,10 +2043,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2029,10 +2105,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -109,5 +109,5 @@ index ed2ff18..badee96 100644
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
similarity index 78%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
index 330078e..8fa656a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
@@ -1,18 +1,18 @@
-From 06132a893d83cf2dc128ad9b37b56be6a6d4714c Mon Sep 17 00:00:00 2001
+From e979180175348c0118f7e461fefa44dcc78e124a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 26 Mar 2012 20:28:56 +0200
-Subject: [PATCH 27/28] beaglebone: fix direction of gpio-keys
+Subject: [PATCH 25/26] beaglebone: fix direction of gpio-keys
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   20 ++++++++++----------
- 1 files changed, 10 insertions(+), 10 deletions(-)
+ 1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 5318c41..fdeed59 100644
+index ed2ea68..ed03e14 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -995,7 +995,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1007,7 +1007,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_LEFT,
  		.gpio                   = GPIO_TO_PIN(1, 16),
@@ -21,7 +21,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "left",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1003,7 +1003,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1015,7 +1015,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_RIGHT,
  		.gpio                   = GPIO_TO_PIN(1, 17),
@@ -30,7 +30,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "right",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1011,7 +1011,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1023,7 +1023,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_UP,
  		.gpio                   = GPIO_TO_PIN(1, 19),
@@ -39,7 +39,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "up",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1019,7 +1019,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1031,7 +1031,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_DOWN,
  		.gpio                   = GPIO_TO_PIN(3, 16),
@@ -48,7 +48,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "down",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1027,7 +1027,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1039,7 +1039,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_ENTER,
  		.gpio                   = GPIO_TO_PIN(3, 19),
@@ -57,7 +57,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "enter",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1071,7 +1071,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1083,7 +1083,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_LEFT,
  		.gpio                   = GPIO_TO_PIN(1, 16),
@@ -66,7 +66,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "left",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1079,7 +1079,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1091,7 +1091,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_RIGHT,
  		.gpio                   = GPIO_TO_PIN(1, 17),
@@ -75,7 +75,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "right",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1087,7 +1087,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1099,7 +1099,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_UP,
  		.gpio                   = GPIO_TO_PIN(3, 19),
@@ -84,7 +84,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "up",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1095,7 +1095,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1107,7 +1107,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_DOWN,
  		.gpio                   = GPIO_TO_PIN(1, 28),
@@ -93,7 +93,7 @@ index 5318c41..fdeed59 100644
  		.desc                   = "down",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1103,7 +1103,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1115,7 +1115,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_ENTER,
  		.gpio                   = GPIO_TO_PIN(0, 7),
@@ -103,5 +103,5 @@ index 5318c41..fdeed59 100644
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
similarity index 83%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
index 22e8cdf..ecae4d6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
@@ -1,7 +1,7 @@
-From ef33c4aefb684a67d1983803688a03826d33b80f Mon Sep 17 00:00:00 2001
+From a40eb4d0e3ca83642a3035f7385de0ddf9421b08 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 29 Feb 2012 17:25:22 +0100
-Subject: [PATCH 28/28] beaglebone: fix 3.5" lcd cape support
+Subject: [PATCH 26/26] beaglebone: fix 3.5" lcd cape support
 
 * proper timings
 * fix gpio conflict
@@ -10,13 +10,13 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
  drivers/video/da8xx-fb.c              |   14 +++++++++++
- 2 files changed, 55 insertions(+), 1 deletions(-)
+ 2 files changed, 55 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index fdeed59..f9057cc 100644
+index ed03e14..74a7e91 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -211,6 +211,29 @@ struct da8xx_lcdc_platform_data bbtoys7_pdata = {
+@@ -214,6 +214,29 @@ struct da8xx_lcdc_platform_data bbtoys7_pdata = {
  	.type			= "TFC_S9700RTWV35TR_01B",
  };
  
@@ -46,7 +46,7 @@ index fdeed59..f9057cc 100644
  static const struct display_panel dvi_panel = {
  	WVGA,
  	16,
-@@ -1461,6 +1484,23 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+@@ -1486,6 +1509,23 @@ static void bbtoys7lcd_init(int evm_id, int profile)
  	return;
  }
  
@@ -70,7 +70,7 @@ index fdeed59..f9057cc 100644
  #define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
  
  static void dvi_init(int evm_id, int profile)
-@@ -2039,7 +2079,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2101,7 +2141,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: initializing LCD cape\n");
@@ -80,10 +80,10 @@ index fdeed59..f9057cc 100644
  		tsc_init(0,0);
  		beaglebone_tsadcpins_free = 0;
 diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
-index dea8936..312c72c 100644
+index b01f15b..86b19ac 100644
 --- a/drivers/video/da8xx-fb.c
 +++ b/drivers/video/da8xx-fb.c
-@@ -285,6 +285,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+@@ -286,6 +286,20 @@ static struct da8xx_panel known_lcd_panels[] = {
  		.pxl_clk = 56000000,
  		.invert_pxl_clk = 0,
  	},
@@ -105,5 +105,5 @@ index dea8936..312c72c 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.2.5
+1.7.9.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 8a6b905..605a324 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -345,7 +345,7 @@ CONFIG_MACH_OMAP3_BEAGLE=y
 # CONFIG_MACH_OMAP_ZOOM3 is not set
 # CONFIG_MACH_CM_T35 is not set
 # CONFIG_MACH_CM_T3517 is not set
-CONFIG_MACH_IGEP0020=y
+# CONFIG_MACH_IGEP0020 is not set
 # CONFIG_MACH_IGEP0030 is not set
 # CONFIG_MACH_SBC3530 is not set
 # CONFIG_MACH_OMAP_3630SDP is not set
@@ -481,10 +481,10 @@ CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
 # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
-# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
@@ -493,7 +493,9 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 #
 # ARM CPU frequency scaling drivers
 #
-# CONFIG_CPU_IDLE is not set
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_LADDER=y
+CONFIG_CPU_IDLE_GOV_MENU=y
 
 #
 # Floating point emulation
@@ -518,15 +520,20 @@ CONFIG_BINFMT_MISC=y
 #
 # Power management options
 #
-# CONFIG_SUSPEND is not set
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_PM_SLEEP=y
 CONFIG_PM_RUNTIME=y
 CONFIG_PM=y
 CONFIG_PM_DEBUG=y
 # CONFIG_PM_ADVANCED_DEBUG is not set
+# CONFIG_PM_TEST_SUSPEND is not set
+CONFIG_CAN_PM_TRACE=y
 # CONFIG_APM_EMULATION is not set
 CONFIG_ARCH_HAS_OPP=y
 CONFIG_PM_OPP=y
 CONFIG_PM_CLK=y
+CONFIG_CPU_PM=y
 CONFIG_ARCH_SUSPEND_POSSIBLE=y
 CONFIG_ARM_CPU_SUSPEND=y
 CONFIG_NET=y
@@ -936,7 +943,8 @@ CONFIG_STANDALONE=y
 CONFIG_PREVENT_FIRMWARE_BUILD=y
 CONFIG_FW_LOADER=y
 CONFIG_FIRMWARE_IN_KERNEL=y
-CONFIG_EXTRA_FIRMWARE=""
+CONFIG_EXTRA_FIRMWARE="am335x-pm-firmware.bin"
+CONFIG_EXTRA_FIRMWARE_DIR="firmware"
 # CONFIG_DEBUG_DRIVER is not set
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
@@ -1443,6 +1451,7 @@ CONFIG_SERIO_LIBPS2=y
 CONFIG_VT=y
 CONFIG_CONSOLE_TRANSLATIONS=y
 CONFIG_VT_CONSOLE=y
+CONFIG_VT_CONSOLE_SLEEP=y
 CONFIG_HW_CONSOLE=y
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_UNIX98_PTYS=y
@@ -2565,11 +2574,10 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
 CONFIG_USB_MUSB_TI81XX=y
 # CONFIG_USB_MUSB_BLACKFIN is not set
 # CONFIG_USB_MUSB_UX500 is not set
-CONFIG_USB_TI_CPPI41_DMA_HW=y
-# CONFIG_MUSB_PIO_ONLY is not set
+CONFIG_MUSB_PIO_ONLY=y
 # CONFIG_USB_INVENTRA_DMA is not set
 # CONFIG_USB_TI_CPPI_DMA is not set
-CONFIG_USB_TI_CPPI41_DMA=y
+# CONFIG_USB_TI_CPPI41_DMA is not set
 # CONFIG_USB_TUSB_OMAP_DMA is not set
 # CONFIG_USB_UX500_DMA is not set
 # CONFIG_USB_RENESAS_USBHS is not set
@@ -3411,7 +3419,7 @@ CONFIG_KEYS=y
 # CONFIG_KEYS_DEBUG_PROC_KEYS is not set
 # CONFIG_SECURITY_DMESG_RESTRICT is not set
 CONFIG_SECURITY=y
-# CONFIG_SECURITYFS is not set
+CONFIG_SECURITYFS=y
 # CONFIG_SECURITY_NETWORK is not set
 # CONFIG_SECURITY_PATH is not set
 # CONFIG_SECURITY_TOMOYO is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
index 20d590a..5215d44 100755
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
@@ -7,7 +7,8 @@ set -e
 # don't use builtin 'echo' from /bin/sh
 export ECHO="$(which echo)"
 
-git tag -f beaglebone-v3.2 09e9651bcf2ee8d86685f2a8075bc6557b1d3b91
+#git tag -f beaglebone-v3.2 09e9651bcf2ee8d86685f2a8075bc6557b1d3b91
+git tag -f beaglebone-v3.2 88dcc46017b970660ff113c1bb4e7d832c5a3693
 
 TAG="beaglebone-v3.2"
 EXTRATAG=""
@@ -19,13 +20,13 @@ git reset --hard ${TAG}
 rm -Rf export
 
 previous=${TAG}
-PATCHSET="3.2.1 3.2.2 3.2.3 3.2.4 3.2.5 3.2.6 3.2.7 3.2.8 3.2.9 3.2.10 3.2.11 3.2.12 3.2.13 beaglebone"
+PATCHSET="3.2.1 3.2.2 3.2.3 3.2.4 3.2.5 3.2.6 3.2.7 3.2.8 3.2.9 3.2.10 3.2.11 3.2.12 3.2.13 3.2.14 beaglebone"
 
 # apply patches
 for patchset in ${PATCHSET} ; do
 	for patch in $(ls -1 $PATCHPATH/$patchset/* | sort -n) ; do
 		$ECHO -n "$patch: "
-		git am -q $patch && echo applied
+		git am -q $patch && echo applied || exit 1
 	done
 	git tag "${TAG}-${patchset}${EXTRATAG}" -f
 done
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 9375372..082c73c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,16 +11,21 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
+SRCREV = "88dcc46017b970660ff113c1bb4e7d832c5a3693"
 MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=http;branch=${BRANCH} \
+	file://am335x-pm-firmware.bin \
 	file://defconfig"
 
 SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
 
+do_compile_prepend() {
+	cp ${WORKDIR}/am335x-pm-firmware.bin ${S}/firmware/
+}
+
 PATCHES_OVER_PSP = " \
 	file://3.2.1/0001-MAINTAINERS-stable-Update-address.patch \
 	file://3.2.1/0002-Documentation-Update-stable-address.patch \
@@ -183,24 +188,23 @@ PATCHES_OVER_PSP = " \
 	file://3.2.2/0110-cx88-fix-don-t-duplicate-xc4000-entry-for-radio.patch \
 	file://3.2.2/0111-tuner-Fix-numberspace-conflict-between-xc4000-and-pt.patch \
 	file://3.2.2/0112-tracepoints-module-Fix-disabling-tracepoints-with-ta.patch \
-	file://3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch \
-	file://3.2.2/0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch \
-	file://3.2.2/0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch \
-	file://3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch \
-	file://3.2.2/0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch \
-	file://3.2.2/0118-rt2800pci-fix-spurious-interrupts-generation.patch \
-	file://3.2.2/0119-xfs-fix-endian-conversion-issue-in-discard-code.patch \
-	file://3.2.2/0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch \
-	file://3.2.2/0121-score-fix-off-by-one-index-into-syscall-table.patch \
-	file://3.2.2/0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch \
-	file://3.2.2/0123-kprobes-initialize-before-using-a-hlist.patch \
-	file://3.2.2/0124-proc-clear_refs-do-not-clear-reserved-pages.patch \
-	file://3.2.2/0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch \
-	file://3.2.2/0126-iwlagn-check-for-SMPS-mode.patch \
-	file://3.2.2/0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch \
-	file://3.2.2/0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch \
-	file://3.2.2/0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch \
-	file://3.2.2/0130-Linux-3.2.2.patch \
+	file://3.2.2/0113-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch \
+	file://3.2.2/0114-x86-UV2-Fix-BAU-destination-timeout-initialization.patch \
+	file://3.2.2/0115-x86-UV2-Work-around-BAU-bug.patch \
+	file://3.2.2/0116-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch \
+	file://3.2.2/0117-rt2800pci-fix-spurious-interrupts-generation.patch \
+	file://3.2.2/0118-xfs-fix-endian-conversion-issue-in-discard-code.patch \
+	file://3.2.2/0119-i2c-eg20t-modified-the-setting-of-transfer-rate.patch \
+	file://3.2.2/0120-score-fix-off-by-one-index-into-syscall-table.patch \
+	file://3.2.2/0121-cifs-lower-default-wsize-when-unix-extensions-are-no.patch \
+	file://3.2.2/0122-kprobes-initialize-before-using-a-hlist.patch \
+	file://3.2.2/0123-proc-clear_refs-do-not-clear-reserved-pages.patch \
+	file://3.2.2/0124-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch \
+	file://3.2.2/0125-iwlagn-check-for-SMPS-mode.patch \
+	file://3.2.2/0126-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch \
+	file://3.2.2/0127-SHM_UNLOCK-fix-long-unpreemptible-section.patch \
+	file://3.2.2/0128-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch \
+	file://3.2.2/0129-Linux-3.2.2.patch \
 	file://3.2.3/0001-ALSA-hda-Fix-buffer-alignment-regression-with-Nvidia.patch \
 	file://3.2.3/0002-ALSA-hda-Fix-silent-outputs-from-docking-station-jac.patch \
 	file://3.2.3/0003-eCryptfs-Sanitize-write-counts-of-dev-ecryptfs.patch \
@@ -812,12 +816,10 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
 	file://beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
 	file://beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
-	file://beaglebone/0021-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch \
-	file://beaglebone/0022-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch \
-	file://beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch \
-	file://beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch \
-	file://beaglebone/0025-beaglebone-add-enter-key-for-lcd7-cape.patch \
-	file://beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch \
-	file://beaglebone/0027-beaglebone-fix-direction-of-gpio-keys.patch \
-	file://beaglebone/0028-beaglebone-fix-3.5-lcd-cape-support.patch \
+	file://beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch \
+	file://beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch \
+	file://beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch \
+	file://beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch \
+	file://beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch \
+	file://beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch \
 "
-- 
1.7.2.5


