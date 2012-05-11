Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 660B6E01424
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C4A3252AAA; Fri, 11 May 2012 01:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015500.C4A3252AAA@arago-project.org>
Date: Fri, 11 May 2012 01:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: add patch to disable heartbeat LED trigger on shutdown
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
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ab70600459a12087a98676dd54c6b03469664fbc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ab70600459a12087a98676dd54c6b03469664fbc

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon May  7 13:39:56 2012 +0200

linux-ti335x-psp 3.2: add patch to disable heartbeat LED trigger on shutdown

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |   67 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 69 insertions(+), 1 deletions(-)

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


