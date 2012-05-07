Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADED2E0140F
	for <meta-ti@yoctoproject.org>; Mon,  7 May 2012 09:01:14 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so4057600wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 07 May 2012 09:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=CX9VMnMWDpKprrffTahE0s4S+c+c6Z7SwmvR4WVYNzE=;
	b=ijDg+NQJEykYmrtGgIvo40WCqWPPqmcqSNezp40AwdPsmiaB/Se8HZeykO5Cu9ZUsn
	NuiVY0L5xb7w0zuAJSws8TYZDdx21f1bYRZodzgwQEcIJIBnVnHh51xr3x2egmpVJi19
	8MfHXVzl/vI/w+dK0DWJ+yFlsJRiVy1dh8/+UFglYwk01oyumtC63EYZtAozyNsIPgqm
	WBTzgkI9b/JoSWLjP6i1IoGnNyJ8KTFISc8NtpilmCNzGR+kzluY94YTAsKwCc5Uo9vl
	UwUWXj4F0yOukla6CidnBenyihlqJ0Kb9MfmvCkedDeu8PhwHjWCTzxHD/biFmC5bHcK
	Z9GA==
Received: by 10.216.140.102 with SMTP id d80mr1387791wej.80.1336406474305;
	Mon, 07 May 2012 09:01:14 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm22543768wix.8.2012.05.07.09.01.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 09:01:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  7 May 2012 18:00:50 +0200
Message-Id: <1336406451-5345-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
References: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlyGKGKvWrDbpn6tq+UcezmmT1r/tlD1USp3M70oENDr/MvRSx2PHDPhLhPQH1h8XzcxVkG
Cc: denys@ti.com
Subject: [PATCH v2 5/6] linux-ti335x-psp 3.2: add patch to disable heartbeat LED trigger on shutdown
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
X-List-Received-Date: Mon, 07 May 2012 16:01:15 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |   67 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
new file mode 100644
index 0000000..009f8fa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
@@ -0,0 +1,67 @@
+From fa1fff60e0f18032378fa97a6951c6f79e24507d Mon Sep 17 00:00:00 2001
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
+ 1 file changed, 26 insertions(+), 1 deletion(-)
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
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 2e75cc2..de3129d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -924,6 +924,7 @@ PATCHES_OVER_PSP = " \
 	file://3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch \
 	file://3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch \
 	file://3.2.16/0069-Linux-3.2.16.patch \
+	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-- 
1.7.10


