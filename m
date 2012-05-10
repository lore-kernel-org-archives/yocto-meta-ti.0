Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D918E0141F
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:57 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so937547wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 01:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=tSZccfT5FznDbAURludXtZi4TkigvGEpaHpJXBPvZsc=;
	b=GKgkWBPAYsOEFE+cn6yQLFesglmuJazS//g7Joetu1nknsKufhuarmcKIJlnHzgH7o
	d2XouzrD5pJsaYj1wmcErhHS/1BNMVr2lLcRnaeBZ4Bnd9j4IJ7V9NhAgHj7/u+AcI2X
	biP66n8fAq9s+/lZW+6p4AzEciax2uyihPxjxC512ay6i7UjrWyT4gIV/rkeb8XE93cA
	lGBhhSSanzg3slKtsgWckckIKVdzdoQNOgmzB4zOxckZsE6xDlYzNrtt+Bds303zPgVX
	pnP2W6Ky6kQNisl96yVCgEyHergSwZYvVl7jj23YZoq7iSf2mJfouoN9atzbC9Eaypx/
	c6iA==
Received: by 10.180.100.2 with SMTP id eu2mr7689087wib.1.1336640397126;
	Thu, 10 May 2012 01:59:57 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j3sm3229766wiw.1.2012.05.10.01.59.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 01:59:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:26 +0200
Message-Id: <1336640375-20418-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnwbc9tb1SZNoWm4GxAoxIlE/t30V4RQpj6xtJpyIza4ptXX6fOqDtRQl77ZLQNQ0Che8AW
Cc: denys@ti.com
Subject: [PATCH v3 04/13] linux-mainline 3.2: shut down heartbeat LED on halt/reboot/panic
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
X-List-Received-Date: Thu, 10 May 2012 08:59:57 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |   67 ++++++++++++++++++++
 recipes-kernel/linux/linux-mainline_3.2.bb         |    3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch

diff --git a/recipes-kernel/linux/linux-mainline-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch b/recipes-kernel/linux/linux-mainline-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
new file mode 100644
index 0000000..241907e
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
@@ -0,0 +1,67 @@
+From d4369481800faa1ab93ab10c23626a5ce5fad5b5 Mon Sep 17 00:00:00 2001
+From: Alexander Holler <hol...@ahsoftware.de>
+Date: Wed, 25 Apr 2012 00:50:03 +0200
+Subject: [PATCH] leds: heartbeat: stop on shutdown, reboot or panic
+
+A halted kernel should not show a heartbeat.
+
+Signed-off-by: Alexander Holler <hol...@ahsoftware.de>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ drivers/leds/ledtrig-heartbeat.c |   27 ++++++++++++++++++++++++++-
+ 1 files changed, 26 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/leds/ledtrig-heartbeat.c b/drivers/leds/ledtrig-heartbeat.c
+index 759c0bb..31c234c 100644
+--- a/drivers/leds/ledtrig-heartbeat.c
++++ b/drivers/leds/ledtrig-heartbeat.c
+@@ -18,6 +18,7 @@
+ #include <linux/timer.h>
+ #include <linux/sched.h>
+ #include <linux/leds.h>
++#include <linux/reboot.h>
+ #include "leds.h"
+ 
+ struct heartbeat_trig_data {
+@@ -101,13 +102,37 @@ static struct led_trigger heartbeat_led_trigger = {
+ 	.deactivate = heartbeat_trig_deactivate,
+ };
+ 
++static int heartbeat_reboot_notifier(struct notifier_block *nb,
++				     unsigned long code, void *unused)
++{
++	led_trigger_unregister(&heartbeat_led_trigger);
++	return NOTIFY_DONE;
++}
++
++static struct notifier_block heartbeat_reboot_nb = {
++	.notifier_call = heartbeat_reboot_notifier,
++};
++
++static struct notifier_block heartbeat_panic_nb = {
++	.notifier_call = heartbeat_reboot_notifier,
++};
++
+ static int __init heartbeat_trig_init(void)
+ {
+-	return led_trigger_register(&heartbeat_led_trigger);
++	int rc = led_trigger_register(&heartbeat_led_trigger);
++	if (!rc) {
++		atomic_notifier_chain_register(&panic_notifier_list,
++					       &heartbeat_panic_nb);
++		register_reboot_notifier(&heartbeat_reboot_nb);
++	}
++	return rc;
+ }
+ 
+ static void __exit heartbeat_trig_exit(void)
+ {
++	unregister_reboot_notifier(&heartbeat_reboot_nb);
++	atomic_notifier_chain_unregister(&panic_notifier_list,
++					 &heartbeat_panic_nb);
+ 	led_trigger_unregister(&heartbeat_led_trigger);
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 72a06e3..3dda4f8 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,7 +10,7 @@ PV = "3.2.16"
 SRCREV_pn-${PN} = "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
@@ -73,6 +73,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://omap_fixes/0005-ARM-OMAP3-hwmod-data-disable-multiblock-reads-on-MMC.patch \
             file://omap_fixes/0006-OMAP-HWMOD-add-es3plus-to-am36xx-am35xx.patch \
             file://sgx/0001-Revert-OMAP-DSS2-remove-update_mode-from-omapdss-v3.2.patch \
+            file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
             \
             file://defconfig"
 
-- 
1.7.10


