Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BCBAE0075C
	for <meta-ti@yoctoproject.org>; Thu, 27 Feb 2014 10:20:00 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1O00KUV2WW8TD0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 27 Feb 2014 12:19:44 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 17AD72009B; Thu,
	27 Feb 2014 13:19:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 27 Feb 2014 13:19:43 -0500
Message-id: <1393525183-19296-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: latest performance, connectivity, audio and PM fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 18:20:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Most patches were merged in the kernel, remove locally

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...musb-musb_cppi41-Revert-the-Advisory-1.0..patch | 158 ---------------------
 ...ll-warning-in-CPUIDLE-code-with-CONFIG_SM.patch |  49 -------
 ...onfig-omap-Change-PREEMPTion-to-voluntary.patch |  33 -----
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |  11 +-
 4 files changed, 3 insertions(+), 248 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch b/recipes-kernel/linux/linux-ti-staging/0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch
deleted file mode 100644
index dcb3322..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From f576e148cd15f10224e4ce13b6773717682f9a5a Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Fri, 21 Feb 2014 09:05:48 -0600
-Subject: [PATCH 1/4] Revert "usb: musb: musb_cppi41: Revert the Advisory 1.0.13 workaround"
-
-This reverts commit c424ef3e2beb89488e7e597446b4c6bc8f1852c5.
----
- drivers/usb/musb/musb_cppi41.c |   96 +++++++++++++++++++++++++++++++++-------
- 1 files changed, 79 insertions(+), 17 deletions(-)
-
-diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
-index d02facc..01df8f9 100644
---- a/drivers/usb/musb/musb_cppi41.c
-+++ b/drivers/usb/musb/musb_cppi41.c
-@@ -31,6 +31,7 @@ struct cppi41_dma_channel {
- 	u8 port_num;
- 	u8 is_tx;
- 	u8 is_allocated;
-+	u8 usb_toggle;
- 
- 	dma_addr_t buf_addr;
- 	u32 total_len;
-@@ -55,6 +56,50 @@ struct cppi41_dma_controller {
- 	u32 auto_req;
- };
- 
-+static void save_rx_toggle(struct cppi41_dma_channel *cppi41_channel)
-+{
-+	u16 csr;
-+	u8 toggle;
-+
-+	if (cppi41_channel->is_tx)
-+		return;
-+	if (!is_host_active(cppi41_channel->controller->musb))
-+		return;
-+
-+	csr = musb_readw(cppi41_channel->hw_ep->regs, MUSB_RXCSR);
-+	toggle = csr & MUSB_RXCSR_H_DATATOGGLE ? 1 : 0;
-+
-+	cppi41_channel->usb_toggle = toggle;
-+}
-+
-+static void update_rx_toggle(struct cppi41_dma_channel *cppi41_channel)
-+{
-+	u16 csr;
-+	u8 toggle;
-+
-+	if (cppi41_channel->is_tx)
-+		return;
-+	if (!is_host_active(cppi41_channel->controller->musb))
-+		return;
-+
-+	csr = musb_readw(cppi41_channel->hw_ep->regs, MUSB_RXCSR);
-+	toggle = csr & MUSB_RXCSR_H_DATATOGGLE ? 1 : 0;
-+
-+	/*
-+	 * AM335x Advisory 1.0.13: Due to internal synchronisation error the
-+	 * data toggle may reset from DATA1 to DATA0 during receiving data from
-+	 * more than one endpoint.
-+	 */
-+	if (!toggle && toggle == cppi41_channel->usb_toggle) {
-+		csr |= MUSB_RXCSR_H_DATATOGGLE | MUSB_RXCSR_H_WR_DATATOGGLE;
-+		musb_writew(cppi41_channel->hw_ep->regs, MUSB_RXCSR, csr);
-+		dev_dbg(cppi41_channel->controller->musb->controller,
-+				"Restoring DATA1 toggle.\n");
-+	}
-+
-+	cppi41_channel->usb_toggle = toggle;
-+}
-+
- static bool musb_is_tx_fifo_empty(struct musb_hw_ep *hw_ep)
- {
- 	u8		epnum = hw_ep->epnum;
-@@ -217,6 +262,8 @@ static void cppi41_dma_callback(void *private_data)
- 		hw_ep->epnum, cppi41_channel->transferred,
- 		cppi41_channel->total_len);
- 
-+	update_rx_toggle(cppi41_channel);
-+
- 	if (cppi41_channel->transferred == cppi41_channel->total_len ||
- 			transferred < cppi41_channel->packet_sz)
- 		cppi41_channel->prog_len = 0;
-@@ -347,6 +394,7 @@ static bool cppi41_configure_channel(struct dma_channel *channel,
- 	struct dma_async_tx_descriptor *dma_desc;
- 	enum dma_transfer_direction direction;
- 	struct musb *musb = cppi41_channel->controller->musb;
-+	unsigned use_gen_rndis = 0;
- 
- 	dev_dbg(musb->controller,
- 		"configure ep%d/%x packet_sz=%d, mode=%d, dma_addr=0x%llx, len=%d is_tx=%d\n",
-@@ -359,26 +407,39 @@ static bool cppi41_configure_channel(struct dma_channel *channel,
- 	cppi41_channel->transferred = 0;
- 	cppi41_channel->packet_sz = packet_sz;
- 
--	/* RNDIS mode */
--	if (len > packet_sz) {
--		musb_writel(musb->ctrl_base,
--			    RNDIS_REG(cppi41_channel->port_num), len);
--		/* gen rndis */
--		cppi41_set_dma_mode(cppi41_channel,
--				    EP_MODE_DMA_GEN_RNDIS);
--
--		/* auto req */
--		cppi41_set_autoreq_mode(cppi41_channel,
-+	/*
-+	 * Due to AM335x' Advisory 1.0.13 we are not allowed to transfer more
-+	 * than max packet size at a time.
-+	 */
-+	if (cppi41_channel->is_tx)
-+		use_gen_rndis = 1;
-+
-+	if (use_gen_rndis) {
-+		/* RNDIS mode */
-+		if (len > packet_sz) {
-+			musb_writel(musb->ctrl_base,
-+				RNDIS_REG(cppi41_channel->port_num), len);
-+			/* gen rndis */
-+			cppi41_set_dma_mode(cppi41_channel,
-+					EP_MODE_DMA_GEN_RNDIS);
-+
-+			/* auto req */
-+			cppi41_set_autoreq_mode(cppi41_channel,
- 					EP_MODE_AUTOREG_ALL_NEOP);
--	} else {
--		musb_writel(musb->ctrl_base,
--			    RNDIS_REG(cppi41_channel->port_num), 0);
--		cppi41_set_dma_mode(cppi41_channel,
--				    EP_MODE_DMA_TRANSPARENT);
--		cppi41_set_autoreq_mode(cppi41_channel,
-+		} else {
-+			musb_writel(musb->ctrl_base,
-+					RNDIS_REG(cppi41_channel->port_num), 0);
-+			cppi41_set_dma_mode(cppi41_channel,
-+					EP_MODE_DMA_TRANSPARENT);
-+			cppi41_set_autoreq_mode(cppi41_channel,
- 					EP_MODE_AUTOREG_NONE);
-+		}
-+	} else {
-+		/* fallback mode */
-+		cppi41_set_dma_mode(cppi41_channel, EP_MODE_DMA_TRANSPARENT);
-+		cppi41_set_autoreq_mode(cppi41_channel, EP_MODE_AUTOREG_NONE);
-+		len = min_t(u32, packet_sz, len);
- 	}
--
- 	cppi41_channel->prog_len = len;
- 	direction = cppi41_channel->is_tx ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
- 	dma_desc = dmaengine_prep_slave_single(dc, dma_addr, len, direction,
-@@ -390,6 +451,7 @@ static bool cppi41_configure_channel(struct dma_channel *channel,
- 	dma_desc->callback_param = channel;
- 	cppi41_channel->cookie = dma_desc->tx_submit(dma_desc);
- 
-+	save_rx_toggle(cppi41_channel);
- 	dma_async_issue_pending(dc);
- 	return true;
- }
--- 
-1.7.0.4
-
diff --git a/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch b/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch
deleted file mode 100644
index f79b045..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 9b76ff20919fa939eed3fdffe05af8bcf1ec1ac5 Mon Sep 17 00:00:00 2001
-From: Santosh Shilimkar <santosh.shilimkar@ti.com>
-Date: Wed, 12 Feb 2014 16:42:39 -0500
-Subject: [PATCH 3/4] ARM: OMAP: Kill warning in CPUIDLE code with !CONFIG_SMP
-
-for non SMP build, NR_CPUS is 1 and hence the code complains with below
-warnings.
-
-arch/arm/mach-omap2/cpuidle44xx.c:207:8: warning: array subscript is above array bounds [-Warray-bounds]
-arch/arm/mach-omap2/cpuidle44xx.c:212:11: warning: array subscript is above array bounds [-Warray-bounds]
-
-Kill it by making array size fixed.
-
-Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
----
- arch/arm/mach-omap2/cpuidle44xx.c |    8 +++++---
- 1 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
-index 4c8982a..5e85f1e 100644
---- a/arch/arm/mach-omap2/cpuidle44xx.c
-+++ b/arch/arm/mach-omap2/cpuidle44xx.c
-@@ -23,6 +23,8 @@
- #include "prm.h"
- #include "clockdomain.h"
- 
-+#define MAX_CPUS	2
-+
- /* Machine specific information */
- struct idle_statedata {
- 	u32 cpu_state;
-@@ -48,11 +50,11 @@ static struct idle_statedata omap4_idle_data[] = {
- 	},
- };
- 
--static struct powerdomain *mpu_pd, *cpu_pd[NR_CPUS];
--static struct clockdomain *cpu_clkdm[NR_CPUS];
-+static struct powerdomain *mpu_pd, *cpu_pd[MAX_CPUS];
-+static struct clockdomain *cpu_clkdm[MAX_CPUS];
- 
- static atomic_t abort_barrier;
--static bool cpu_done[NR_CPUS];
-+static bool cpu_done[MAX_CPUS];
- static struct idle_statedata *state_ptr = &omap4_idle_data[0];
- 
- /* Private functions */
--- 
-1.7.0.4
-
diff --git a/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch b/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch
deleted file mode 100644
index 469a0c7..0000000
--- a/recipes-kernel/linux/linux-ti-staging/0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 54821ed9f986a0023bbc3fa08060e1f2c8efb6b5 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Mon, 24 Feb 2014 13:16:20 -0600
-Subject: [PATCH 1/2] ARM: config: omap: Change PREEMPTion to voluntary
-
-* Change the default PREEMPT mode to voluntary which reduces the
-  overhead and increases performance for many use cases such as
-  UDP networking and cryptography.
-* Based on recommendations from Joel Fernandes <joelf@ti.com>
-
-Signed-off-by: Joel Fernandes <joelf@ti.com>
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- arch/arm/configs/omap2plus_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
-index 3975b08..a34b45a 100644
---- a/arch/arm/configs/omap2plus_defconfig
-+++ b/arch/arm/configs/omap2plus_defconfig
-@@ -38,7 +38,7 @@ CONFIG_ARM_ERRATA_411920=y
- CONFIG_PCIE_DRA7XX=y
- CONFIG_SMP=y
- CONFIG_NR_CPUS=2
--CONFIG_PREEMPT=y
-+CONFIG_PREEMPT_VOLUNTARY=y
- CONFIG_CMA=y
- CONFIG_ZBOOT_ROM_TEXT=0x0
- CONFIG_ZBOOT_ROM_BSS=0x0
--- 
-1.8.3.2
-
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 9f39a72..7982c0d 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -36,22 +36,17 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "c559824b17bfc194cc072dac0720ac8e23373871"
+SRCREV = "83f0643caa2e8dabd42024bebfa4565eff347be7"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "i+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "j+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
 
-# Latest critical fixes
-SRC_URI += "file://0001-Revert-usb-musb-musb_cppi41-Revert-the-Advisory-1.0..patch \
-            file://0003-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch \
-            file://0004-ARM-config-omap-Change-PREEMPTion-to-voluntary.patch \
-            "
-
+# Disable SMP in defconfig on single-core platforms to reduce overhead
 SRC_URI_append_ti33x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
 SRC_URI_append_ti43x = "file://0005-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-- 
1.8.3.2


