Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5AEAE0140E
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:12 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so209796wib.5
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=CX9VMnMWDpKprrffTahE0s4S+c+c6Z7SwmvR4WVYNzE=;
	b=WQXKnvPhC1vYZ3BRltgrJZiZ2PyUVwGVvt0kkWVcBZ31bzkaesJ1Pa6kpZ13Pzi/39
	Yueq4jwEfRHX4Bg8l3bZC34qhapMWxu/D46D67gColPedFM0woGnFmAdw8sn8k8u7TNW
	OnbO+v7CRUGh062icg2cI3GDVNLn1MpIjJ+BsjEXZH8CczprmCICLwnSQkQp7QWtj4LF
	c4o1R4tH85x8EP1TonqtUxCMnnb5W7gpqj14ODQRlmQ74ujP5Y6jXCzcWYP3r6XG68ew
	671dF/sO82dAZbEGfcaAEIR372381FGdtRLWjgdPwef0lwJy4a6AN0RBWX0nC4ytkMdh
	g/jQ==
Received: by 10.180.85.69 with SMTP id f5mr7536541wiz.18.1336640411783;
	Thu, 10 May 2012 02:00:11 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm1934289wib.10.2012.05.10.02.00.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:31 +0200
Message-Id: <1336640375-20418-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmFCwKYWguh5v67ZyJvPPfeBYPcI/Qu8bnrN2BLEBsC6U1G6GBjfOPls8tlMOj9NGhynxdu
Cc: denys@ti.com
Subject: [PATCH v3 09/13] linux-ti335x-psp 3.2: add patch to disable heartbeat LED trigger on shutdown
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
X-List-Received-Date: Thu, 10 May 2012 09:00:13 -0000

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


