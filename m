Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20E84E006CC
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 07:08:06 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pADF84In009940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:08:05 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pADF84ot024585
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:08:04 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pADF84Dh005281
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 09:08:04 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 13 Nov 2011 09:08:04 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pADF7dS8026973;	Sun, 13 Nov 2011 09:08:04 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 13 Nov 2011 09:09:09 -0600
Message-ID: <1321196950-9622-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, chase.maupin@ti.com
Subject: [PATCH] usb::musb::cppi41_dma: Check if scheduling is required after DMA
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
X-List-Received-Date: Sun, 13 Nov 2011 15:08:06 -0000
Content-Type: text/plain

After processing one DMA completion, checking if rescheduling is
required instead of scheduling another completion request if the
FIFO is non empty.

This fixes high CPU load issue seen with g_mass_storage on a beaglebone
and could potentially fix similar issues seen with other gadget drivers

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...pi41_dma-Check-if-scheduling-is-required-.patch |   42 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    3 +-
 2 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch
new file mode 100644
index 0000000..701c09d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch
@@ -0,0 +1,42 @@
+From b564457d26931a00f8c5645981a00c1eb78e9a90 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Sat, 12 Nov 2011 23:42:26 -0600
+Subject: [PATCH] usb::musb::cppi41_dma: Check if scheduling is required after DMA
+
+Even after TX DMA, data can still be in the FIFO and we would keep
+rescheduling the worker thread in a polling fashion taking up a lot
+of CPU if the controller was slow to respond. We check if rescheduling
+is required and sleep if so.
+
+This fixes high CPU load issue seen with g_mass_storage on a BeagleBone
+and could potentially fix similar issues seen with other gadget drivers.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/usb/musb/cppi41_dma.c |   10 ++++++++++
+ 1 files changed, 10 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index a24707c..e68c5d7 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -1319,6 +1319,16 @@ void txdma_completion_work(struct work_struct *data)
+ 	struct musb *musb = cppi->musb;
+ 	unsigned long flags;
+ 
++	/*
++	 * txdma worker thread can call schedule_work on itself and cause
++	 * itself to be scheduled immediately and because the data might still
++	 * be in FIFO if it hasn't been pushed out after DMA, it is possible for
++	 * the worker to consume lot of CPU when the controller is slow, so we
++	 * reschedule if necessary.
++	 */
++	if (need_resched())
++		cond_resched();
++
+ 	spin_lock_irqsave(&musb->lock, flags);
+ 	cppi41_check_fifo_empty(cppi);
+ 	spin_unlock_irqrestore(&musb->lock, flags);
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index c4cdfea..37f59ca 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-staging"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "q+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "r+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -35,6 +35,7 @@ PATCHES_OVER_PSP = " \
 	file://0003-arm-omap-mcspi-correct-memory-range-when-requesting-.patch \
 	file://0004-arm-omap-mcspi-follow-proper-pm_runtime-enable-disab.patch \
 	file://0005-arm-omap-mcspi-follow-proper-probe-remove-steps.patch \
+	file://0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch \
 	file://can/0001-can-d_can-Added-support-for-Bosch-D_CAN-controller.patch \
 	file://can/0002-can-d_can-Added-platform-data-for-am33xx-device.patch \
 	file://can/0003-can-d_can-DCAN-config-added-to-am335x_evm_defconfig.patch \
-- 
1.7.0.4


