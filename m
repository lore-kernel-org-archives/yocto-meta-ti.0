Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18DFDE00306
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 19:32:53 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAF3WrUo008582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 21:32:53 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAF3WqMq019306
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 21:32:53 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAF3WqfM012030
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 21:32:52 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 Nov 2011 21:32:52 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pAF3WoEa005430;	Mon, 14 Nov 2011 21:32:52 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 14 Nov 2011 21:34:23 -0600
Message-ID: <1321328063-4162-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] linux-ti33x-psp: Refresh musb patch
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
X-List-Received-Date: Tue, 15 Nov 2011 03:32:54 -0000
Content-Type: text/plain

This patch is rewritten to poll for the channel FIFO state without depending on a worker thread.

The v2 version fixes all the previous issues, and remains to be seen if it also fixes the issue of
100% CPU usage with a mac.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...pi41_dma-Check-if-scheduling-is-required-.patch |   68 ++++++++++++++++----
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
 2 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch
index 701c09d..db7a7f2 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0006-usb-musb-cppi41_dma-Check-if-scheduling-is-required-.patch
@@ -1,7 +1,7 @@
-From b564457d26931a00f8c5645981a00c1eb78e9a90 Mon Sep 17 00:00:00 2001
+From c5a0664fa68a8541c1400bf7330a072581b12c38 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Sat, 12 Nov 2011 23:42:26 -0600
-Subject: [PATCH] usb::musb::cppi41_dma: Check if scheduling is required after DMA
+Subject: [PATCH v2] usb::musb::cppi41_dma: Check if scheduling is required after DMA
 
 Even after TX DMA, data can still be in the FIFO and we would keep
 rescheduling the worker thread in a polling fashion taking up a lot
@@ -11,19 +11,64 @@ is required and sleep if so.
 This fixes high CPU load issue seen with g_mass_storage on a BeagleBone
 and could potentially fix similar issues seen with other gadget drivers.
 
+v2 changes:
+Avoid rescheduling a "worker", this process involves a lot of workqueue
+related crunching that is unnecessary. If we're polling, we might as well
+do it with minimum overhead, and giving other processes CPU time at the
+same time.
+
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
- drivers/usb/musb/cppi41_dma.c |   10 ++++++++++
- 1 files changed, 10 insertions(+), 0 deletions(-)
+ drivers/usb/musb/cppi41_dma.c |   30 ++++++++++++++++++------------
+ 1 files changed, 18 insertions(+), 12 deletions(-)
 
 diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
-index a24707c..e68c5d7 100644
+index a24707c..3ac58b1 100644
 --- a/drivers/usb/musb/cppi41_dma.c
 +++ b/drivers/usb/musb/cppi41_dma.c
-@@ -1319,6 +1319,16 @@ void txdma_completion_work(struct work_struct *data)
+@@ -1283,6 +1283,7 @@ void cppi41_check_fifo_empty(struct cppi41 *cppi)
+ 	for (index = 0; index < USB_CPPI41_NUM_CH; index++) {
+ 		void __iomem *epio;
+ 		u16 csr;
++		unsigned long flags;
+ 
+ 		tx_ch = &cppi->tx_cppi_ch[index];
+ 		if (tx_ch->tx_complete) {
+@@ -1299,29 +1300,34 @@ void cppi41_check_fifo_empty(struct cppi41 *cppi)
+ 			epio = tx_ch->end_pt->regs;
+ 			csr = musb_readw(epio, MUSB_TXCSR);
+ 
+-			if (csr & (MUSB_TXCSR_TXPKTRDY |
+-				MUSB_TXCSR_FIFONOTEMPTY))
+-				resched = 1;
+-			else {
+-				tx_ch->tx_complete = 0;
+-				musb_dma_completion(musb, index+1, 1);
++			while (1) {
++				csr = musb_readw(epio, MUSB_TXCSR);
++				if(!(csr & (MUSB_TXCSR_TXPKTRDY |
++					MUSB_TXCSR_FIFONOTEMPTY)))
++				break;
++				cond_resched();
+ 			}
++			tx_ch->tx_complete = 0;
++			spin_lock_irqsave(&musb->lock, flags);
++			musb_dma_completion(musb, index+1, 1);
++			spin_unlock_irqrestore(&musb->lock, flags);
+ 		}
+ 	}
+-
+-	if (resched)
+-		schedule_work(&cppi->txdma_work);
+ }
+ 
+ void txdma_completion_work(struct work_struct *data)
+ {
+ 	struct cppi41 *cppi = container_of(data, struct cppi41, txdma_work);
  	struct musb *musb = cppi->musb;
- 	unsigned long flags;
+-	unsigned long flags;
  
+-	spin_lock_irqsave(&musb->lock, flags);
 +	/*
 +	 * txdma worker thread can call schedule_work on itself and cause
 +	 * itself to be scheduled immediately and because the data might still
@@ -31,12 +76,11 @@ index a24707c..e68c5d7 100644
 +	 * the worker to consume lot of CPU when the controller is slow, so we
 +	 * reschedule if necessary.
 +	 */
-+	if (need_resched())
-+		cond_resched();
-+
- 	spin_lock_irqsave(&musb->lock, flags);
  	cppi41_check_fifo_empty(cppi);
- 	spin_unlock_irqrestore(&musb->lock, flags);
+-	spin_unlock_irqrestore(&musb->lock, flags);
+ }
+ 
+ /**
 -- 
 1.7.4.1
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index 37f59ca..556ad5a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-staging"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "r+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "s+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.4.1


