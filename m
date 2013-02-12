Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 79FBAE006C9
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:55 -0800 (PST)
Received: by mail-oa0-f49.google.com with SMTP id j6so6874668oag.22
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=oOrTNi8OmDSWcUTce6j5My5BRPacDNon1d2QzjAtUas=;
	b=pd1Hb2x7hEk+AEBtu5mHe7jas/JeRPNrxmhfJ9BHt4g4izGVjFOW3+exBqep1DFXvh
	1fHAcupR1fbVgxLuFBQLEJicQKBIlGC9dCenXjTM/t32MoEMhr4i8xv/3SADuM3Sby+9
	O8XaKUW7N20f3C2iDsqJCMvbNd4zS3AAZ51Tn9Y9/0tMyP5z8zJtpz2B8wD4DYAHJS94
	GZxGDyACvDVLCHroJz1IvkJDy+9h9KAB6ed+354+wunMdWQJ6Xu/vgbHQCPG+6oWyUpP
	r3fsGIAeohiXgl6TE+5AdPm1XOJtIS6DS9fuY1Qen9+jIvLzCjN0usH5jrmsmNtgOaS+
	toJA==
X-Received: by 10.60.12.103 with SMTP id x7mr12490040oeb.56.1360631094739;
	Mon, 11 Feb 2013 17:04:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:53 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:38 -0600
Message-Id: <1360631082-29015-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360631082-29015-1-git-send-email-fcooper@ti.com>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 3/7] linux-omapl138-psp: Add latest linux-omapl138 patches
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
X-List-Received-Date: Tue, 12 Feb 2013 01:04:55 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add latest patches to linux-omapl138 that were added since this recipe was
  added to meta-ti.
* Update to latest am180x-evm defconfig
* Mimic the following commits from arago:

  linux-davinci: update to add mmc patches

    * Optimizations to reduce overhead on weak platforms

  linux: disable DMA for MUSB

    * For the am3517, am180x, and am335x devices the CPPI 4.1 DMA
      should NOT be used for the MUSB controller.  Using this DMA
      can cause the controller to lockup.
    * Updated the defconfigs to set the use of PIO mode
    * Added a patch to updated the PIO mode description to make it
      easier to determine when it can be used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 conf/machine/include/davinci.inc                   |    2 +-
 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 ++++
 ...mmc-davinci-Eliminate-spurious-interrupts.patch |   64 ++++++
 ...mmc-davinci-Poll-for-small-size-transfers.patch |   96 +++++++++
 .../linux-omapl138-psp-2.6.37/am180x-evm/defconfig |  224 +++++++++++++++-----
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb  |    7 +-
 6 files changed, 385 insertions(+), 52 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp-2.6.37/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp-2.6.37/0007-mmc-davinci-Eliminate-spurious-interrupts.patch
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp-2.6.37/0008-mmc-davinci-Poll-for-small-size-transfers.patch

diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 8019844..71eca70 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-arm926ejs.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r51"
+MACHINE_KERNEL_PR = "r52"
 
 
 KERNEL_IMAGETYPE = "uImage"
diff --git a/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
new file mode 100644
index 0000000..ff1c430
--- /dev/null
+++ b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0001-musb-update-PIO-mode-help-information-in-Kconfig.patch
@@ -0,0 +1,44 @@
+From 10fbd32a96aedd644b6bf38888a2af64cc13a35f Mon Sep 17 00:00:00 2001
+From: Matt Porter <mporter@ti.com>
+Date: Mon, 5 Dec 2011 15:29:35 -0600
+Subject: [PATCH] musb: update PIO mode help information in Kconfig
+
+* Updated the Kconfig help information for the PIO mode for MUSB
+  to make it more clear to the customer when to select this option
+  and which devices currently have issues with this option.
+* This is in accordance with the findings for CPPI4.1 DMA usage
+  for MUSB
+
+Upstream-Status: Submitted
+    * Submitted to the PSP team using the lpr list
+
+Signed-off-by: Matt Porter <mporter@ti.com>
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ drivers/usb/musb/Kconfig |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
+index ee75cbc..d56f23d 100644
+--- a/drivers/usb/musb/Kconfig
++++ b/drivers/usb/musb/Kconfig
+@@ -107,10 +107,13 @@ config MUSB_PIO_ONLY
+	  All data is copied between memory and FIFO by the CPU.
+	  DMA controllers are ignored.
+
+-	  Do not select 'n' here unless DMA support for your SOC or board
+-	  is unavailable (or unstable).  When DMA is enabled at compile time,
+-	  you can still disable it at run time using the "use_dma=n" module
+-	  parameter.
++	  Select 'y' here if DMA support for your SOC or board
++	  is unavailable (or unstable). On CPPI 4.1 DMA based
++	  systems (AM335x, AM35x, and AM180x) DMA support is
++	  considered unstable and this option should be enabled
++	  in production. When DMA is enabled at compile time,
++	  you can still disable it at run time using the "use_dma=n"
++	  module parameter.
+
+ config USB_UX500_DMA_HW
+	select USB_UX500_DMA
+--
+1.7.0.4
diff --git a/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0007-mmc-davinci-Eliminate-spurious-interrupts.patch b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0007-mmc-davinci-Eliminate-spurious-interrupts.patch
new file mode 100644
index 0000000..11de26f
--- /dev/null
+++ b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0007-mmc-davinci-Eliminate-spurious-interrupts.patch
@@ -0,0 +1,64 @@
+From 568c76b4c8483ca912eb55f2d69398d1a162aabf Mon Sep 17 00:00:00 2001
+From: Ido Yariv <ido@wizery.com>
+Date: Wed, 21 Dec 2011 02:13:17 +0200
+Subject: [PATCH] mmc: davinci: Eliminate spurious interrupts *EXPERIMENTAL*
+
+The davinci mmc interrupt handler fills the fifo in a loop, as long as
+the DXRDY or DRRDY bits are set in the status register.
+
+If interrupts fire during this loop, they will be handled by the
+handler, but the PIC will still buffer these. As a result, the handler
+will be called again to serve these needlessly. In order to avoid these
+spurious interrupts, keep interrupts masked during the loop.
+---
+ drivers/mmc/host/davinci_mmc.c |   35 +++++++++++++++++++++++++++++------
+ 1 files changed, 29 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
+index 64a8325..8e3212e 100644
+--- a/drivers/mmc/host/davinci_mmc.c
++++ b/drivers/mmc/host/davinci_mmc.c
+@@ -1009,12 +1009,35 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
+	 * by read. So, it is not unbouned loop even in the case of
+	 * non-dma.
+	 */
+-	while (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))) {
+-		davinci_fifo_data_trans(host, rw_threshold);
+-		status = readl(host->base + DAVINCI_MMCST0);
+-		if (!status)
+-			break;
+-		qstatus |= status;
++	if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))) {
++		unsigned long im_val;
++
++		/*
++		 * If interrupts fire during the following loop, they will be
++		 * handled by the handler, but the PIC will still buffer these.
++		 * As a result, the handler will be called again to serve these
++		 * needlessly. In order to avoid these spurious interrupts,
++		 * keep interrupts masked during the loop.
++		 */
++		im_val = readl(host->base + DAVINCI_MMCIM);
++		writel(0, host->base + DAVINCI_MMCIM);
++
++		do {
++			davinci_fifo_data_trans(host, rw_threshold);
++			status = readl(host->base + DAVINCI_MMCST0);
++			if (!status)
++				break;
++			qstatus |= status;
++		} while (host->bytes_left &&
++			 (status & (MMCST0_DXRDY | MMCST0_DRRDY)));
++
++		/*
++		 * Assumption: if an interrupt is already pending, it will fire
++		 * when it is unmasked. This is also assumed when the MMCIM is
++		 * first set. Otherwise, writing to MMCIM after reading the
++		 * status is race-prone.
++		 */
++		writel(im_val, host->base + DAVINCI_MMCIM);
+	}
+
+	if (qstatus & MMCST0_DATDNE) {
+--
+1.7.7.4
diff --git a/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0008-mmc-davinci-Poll-for-small-size-transfers.patch b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0008-mmc-davinci-Poll-for-small-size-transfers.patch
new file mode 100644
index 0000000..e358f9f
--- /dev/null
+++ b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/0008-mmc-davinci-Poll-for-small-size-transfers.patch
@@ -0,0 +1,96 @@
+From 2323173abf87fa542d8434fa187dd67ed6048da2 Mon Sep 17 00:00:00 2001
+From: Ido Yariv <ido@wizery.com>
+Date: Sat, 24 Dec 2011 14:02:45 +0200
+Subject: [PATCH] mmc: davinci: Poll for small size transfers
+
+When initiating small size sdio transactions, it might be worth while to
+poll instead of waiting for an interrupt.
+
+While this optimization wastes CPU cycles, tests have shown that the
+interrupts handling and context switches' overhead is actually larger.
+
+Signed-off-by: Ido Yariv <ido@wizery.com>
+---
+ drivers/mmc/host/davinci_mmc.c |   25 ++++++++++++++++++++++---
+ 1 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
+index c5b540b..39be44a 100644
+--- a/drivers/mmc/host/davinci_mmc.c
++++ b/drivers/mmc/host/davinci_mmc.c
+@@ -152,6 +152,11 @@ module_param(rw_threshold, uint, S_IRUGO);
+ MODULE_PARM_DESC(rw_threshold,
+		"Read/Write threshold. Default = 32");
+
++static unsigned poll_threshold = 128;
++module_param(poll_threshold, uint, S_IRUGO);
++MODULE_PARM_DESC(poll_threshold,
++		 "Polling transaction size threshold. Default = 128");
++
+ static unsigned __initdata use_dma = 1;
+ module_param(use_dma, uint, 0);
+ MODULE_PARM_DESC(use_dma, "Whether to use DMA or not. Default = 1");
+@@ -184,6 +189,7 @@ struct mmc_davinci_host {
+	u32 rxdma, txdma;
+	bool use_dma;
+	bool do_dma;
++	bool active_request;
+
+	/* Scatterlist DMA uses one or more parameter RAM entries:
+	 * the main one (associated with rxdma or txdma) plus zero or
+@@ -212,6 +218,7 @@ struct mmc_davinci_host {
+	unsigned char		power_mode;
+ };
+
++static irqreturn_t mmc_davinci_irq(int irq, void *dev_id);
+
+ /* PIO only */
+ static void mmc_davinci_sg_to_buf(struct mmc_davinci_host *host)
+@@ -369,7 +376,16 @@ static void mmc_davinci_start_command(struct mmc_davinci_host *host,
+
+	writel(cmd->arg, host->base + DAVINCI_MMCARGHL);
+	writel(cmd_reg,  host->base + DAVINCI_MMCCMD);
+-	writel(im_val, host->base + DAVINCI_MMCIM);
++
++	host->active_request = true;
++	if (!host->do_dma && host->bytes_left <= poll_threshold) {
++		while (host->active_request) {
++			mmc_davinci_irq(0, host);
++			cpu_relax();
++		}
++	} else {
++		writel(im_val, host->base + DAVINCI_MMCIM);
++	}
+ }
+
+ /*----------------------------------------------------------------------*/
+@@ -684,8 +700,9 @@ mmc_davinci_prepare_data(struct mmc_davinci_host *host, struct mmc_request *req)
+	 * While we *could* change that, unusual block sizes are rarely
+	 * used.  The occasional fallback to PIO should't hurt.
+	 */
+-	if (host->use_dma && (host->bytes_left & (rw_threshold - 1)) == 0
+-			&& mmc_davinci_start_dma_transfer(host, data) == 0) {
++	if (host->use_dma && (host->bytes_left & (rw_threshold - 1)) == 0 &&
++	    host->bytes_left > poll_threshold &&
++	    mmc_davinci_start_dma_transfer(host, data) == 0) {
+		/* zero this to ensure we take no PIO paths */
+		host->bytes_left = 0;
+	} else {
+@@ -898,6 +915,7 @@ mmc_davinci_xfer_done(struct mmc_davinci_host *host, struct mmc_data *data)
+	if (!data->stop || (host->cmd && host->cmd->error)) {
+		mmc_request_done(host->mmc, data->mrq);
+		writel(0, host->base + DAVINCI_MMCIM);
++		host->active_request = false;
+	} else
+		mmc_davinci_start_command(host, data->stop);
+ }
+@@ -925,6 +943,7 @@ static void mmc_davinci_cmd_done(struct mmc_davinci_host *host,
+			cmd->mrq->cmd->retries = 0;
+		mmc_request_done(host->mmc, cmd->mrq);
+		writel(0, host->base + DAVINCI_MMCIM);
++		host->active_request = false;
+	}
+ }
+
+--
+1.7.7.4
diff --git a/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/defconfig b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/defconfig
index 3528214..e1d6477 100644
--- a/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/defconfig
+++ b/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux/arm 2.6.37 Kernel Configuration
-# Thu Apr  7 20:15:42 2011
+# Wed Mar 14 15:15:30 2012
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -114,7 +114,8 @@ CONFIG_COMPAT_BRK=y
 # CONFIG_SLAB is not set
 CONFIG_SLUB=y
 # CONFIG_SLOB is not set
-# CONFIG_PROFILING is not set
+CONFIG_PROFILING=y
+CONFIG_OPROFILE=y
 CONFIG_HAVE_OPROFILE=y
 # CONFIG_KPROBES is not set
 CONFIG_HAVE_KPROBES=y
@@ -138,7 +139,7 @@ CONFIG_MODVERSIONS=y
 # CONFIG_MODULE_SRCVERSION_ALL is not set
 CONFIG_BLOCK=y
 CONFIG_LBDAF=y
-# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BLK_DEV_BSG=y
 # CONFIG_BLK_DEV_INTEGRITY is not set
 
 #
@@ -363,7 +364,8 @@ CONFIG_ALIGNMENT_TRAP=y
 #
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE=""
+CONFIG_CMDLINE=" debug "
+# CONFIG_CMDLINE_FORCE is not set
 # CONFIG_XIP_KERNEL is not set
 # CONFIG_KEXEC is not set
 # CONFIG_AUTO_ZRELADDR is not set
@@ -481,6 +483,7 @@ CONFIG_IPV6_NDISC_NODETYPE=y
 # CONFIG_IPV6_TUNNEL is not set
 # CONFIG_IPV6_MULTIPLE_TABLES is not set
 # CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETLABEL is not set
 # CONFIG_NETWORK_SECMARK is not set
 # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
 CONFIG_NETFILTER=y
@@ -493,28 +496,119 @@ CONFIG_NETFILTER_ADVANCED=y
 # CONFIG_NETFILTER_NETLINK_QUEUE is not set
 # CONFIG_NETFILTER_NETLINK_LOG is not set
 CONFIG_NF_CONNTRACK=y
-CONFIG_NF_CONNTRACK_IPV4=y
-CONFIG_NF_CONNTRACK_PROC_COMPAT=y
+# CONFIG_NF_CONNTRACK_MARK is not set
+# CONFIG_NF_CONNTRACK_EVENTS is not set
+# CONFIG_NF_CT_PROTO_DCCP is not set
+# CONFIG_NF_CT_PROTO_SCTP is not set
+# CONFIG_NF_CT_PROTO_UDPLITE is not set
+# CONFIG_NF_CONNTRACK_AMANDA is not set
+# CONFIG_NF_CONNTRACK_FTP is not set
+# CONFIG_NF_CONNTRACK_H323 is not set
+# CONFIG_NF_CONNTRACK_IRC is not set
+# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
+# CONFIG_NF_CONNTRACK_PPTP is not set
+# CONFIG_NF_CONNTRACK_SANE is not set
+# CONFIG_NF_CONNTRACK_SIP is not set
+# CONFIG_NF_CONNTRACK_TFTP is not set
+# CONFIG_NF_CT_NETLINK is not set
 CONFIG_NETFILTER_XTABLES=y
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+# CONFIG_NETFILTER_XT_CONNMARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNBYTES is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
+# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
+# CONFIG_NETFILTER_XT_MATCH_HL is not set
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATE is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
 # CONFIG_IP_VS is not set
 
 #
 # IP: Netfilter Configuration
 #
 CONFIG_NF_DEFRAG_IPV4=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_NF_CONNTRACK_PROC_COMPAT=y
 # CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=y
+# CONFIG_IP_NF_MATCH_ADDRTYPE is not set
+# CONFIG_IP_NF_MATCH_AH is not set
+# CONFIG_IP_NF_MATCH_ECN is not set
+# CONFIG_IP_NF_MATCH_TTL is not set
 CONFIG_IP_NF_FILTER=y
+# CONFIG_IP_NF_TARGET_REJECT is not set
 CONFIG_IP_NF_TARGET_LOG=y
+# CONFIG_IP_NF_TARGET_ULOG is not set
 CONFIG_NF_NAT=y
 CONFIG_NF_NAT_NEEDED=y
-CONFIG_IP_NF_TARGET_MASQUERADE=y 
-CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
+# CONFIG_IP_NF_TARGET_NETMAP is not set
+# CONFIG_IP_NF_TARGET_REDIRECT is not set
+# CONFIG_NF_NAT_SNMP_BASIC is not set
+# CONFIG_NF_NAT_FTP is not set
+# CONFIG_NF_NAT_IRC is not set
+# CONFIG_NF_NAT_TFTP is not set
+# CONFIG_NF_NAT_AMANDA is not set
+# CONFIG_NF_NAT_PPTP is not set
+# CONFIG_NF_NAT_H323 is not set
+# CONFIG_NF_NAT_SIP is not set
+# CONFIG_IP_NF_MANGLE is not set
+# CONFIG_IP_NF_RAW is not set
+# CONFIG_IP_NF_SECURITY is not set
 # CONFIG_IP_NF_ARPTABLES is not set
 
 #
 # IPv6: Netfilter Configuration
 #
 # CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_NF_CONNTRACK_IPV6 is not set
 # CONFIG_IP6_NF_QUEUE is not set
 # CONFIG_IP6_NF_IPTABLES is not set
 # CONFIG_IP_DCCP is not set
@@ -538,6 +632,7 @@ CONFIG_IP_NF_IPTABLES=y
 # CONFIG_IEEE802154 is not set
 # CONFIG_NET_SCHED is not set
 # CONFIG_DCB is not set
+# CONFIG_DNS_RESOLVER is not set
 
 #
 # Network testing
@@ -546,31 +641,14 @@ CONFIG_IP_NF_IPTABLES=y
 # CONFIG_HAMRADIO is not set
 # CONFIG_CAN is not set
 # CONFIG_IRDA is not set
-CONFIG_BT=y
-CONFIG_BT_L2CAP=y
-CONFIG_BT_SCO=y
-CONFIG_BT_RFCOMM=y
-CONFIG_BT_RFCOMM_TTY=y
-CONFIG_BT_BNEP=y
-CONFIG_BT_BNEP_MC_FILTER=y
-CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_HIDP=y
-
-#
-# Bluetooth device drivers
-#
-CONFIG_BT_HCIUART=y
-CONFIG_BT_HCIUART_H4=y
-CONFIG_BT_HCIUART_LL=y
-
+# CONFIG_BT is not set
 # CONFIG_AF_RXRPC is not set
 CONFIG_WIRELESS=y
 CONFIG_WIRELESS_EXT=y
 CONFIG_WEXT_CORE=y
 CONFIG_WEXT_PROC=y
-CONFIG_WEXT_SPY=y
-CONFIG_WEXT_PRIV=y
 # CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT_SYSFS=y
 # CONFIG_LIB80211 is not set
 
 #
@@ -582,6 +660,7 @@ CONFIG_WEXT_PRIV=y
 #
 # CONFIG_WIMAX is not set
 CONFIG_RFKILL=y
+# CONFIG_RFKILL_INPUT is not set
 # CONFIG_NET_9P is not set
 # CONFIG_CAIF is not set
 # CONFIG_CEPH_LIB is not set
@@ -593,8 +672,9 @@ CONFIG_RFKILL=y
 #
 # Generic Driver Options
 #
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-# CONFIG_DEVTMPFS is not set
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_STANDALONE=y
 CONFIG_PREVENT_FIRMWARE_BUILD=y
 CONFIG_FW_LOADER=y
@@ -726,6 +806,7 @@ CONFIG_EEPROM_AT24=y
 #
 # Texas Instruments shared transport line discipline
 #
+# CONFIG_TI_ST is not set
 CONFIG_HAVE_IDE=y
 # CONFIG_IDE is not set
 
@@ -839,8 +920,8 @@ CONFIG_TI_DAVINCI_CPDMA=y
 # CONFIG_NETDEV_1000 is not set
 # CONFIG_NETDEV_10000 is not set
 CONFIG_WLAN=y
+# CONFIG_USB_ZD1201 is not set
 # CONFIG_HOSTAP is not set
-# CONFIG_HOSTAP_FIRMWARE is not set
 CONFIG_WL12XX_PLATFORM_DATA=y
 
 #
@@ -855,6 +936,7 @@ CONFIG_WL12XX_PLATFORM_DATA=y
 # CONFIG_USB_PEGASUS is not set
 # CONFIG_USB_RTL8150 is not set
 # CONFIG_USB_USBNET is not set
+# CONFIG_USB_HSO is not set
 # CONFIG_USB_IPHETH is not set
 # CONFIG_WAN is not set
 
@@ -882,7 +964,10 @@ CONFIG_INPUT_POLLDEV=y
 #
 # Userland interfaces
 #
-# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
 # CONFIG_INPUT_JOYDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_EVBUG is not set
@@ -905,7 +990,21 @@ CONFIG_KEYBOARD_GPIO=y
 # CONFIG_KEYBOARD_STOWAWAY is not set
 # CONFIG_KEYBOARD_SUNKBD is not set
 CONFIG_KEYBOARD_XTKBD=m
-# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MOUSE_SYNAPTICS_I2C is not set
 # CONFIG_INPUT_JOYSTICK is not set
 # CONFIG_INPUT_TABLET is not set
 CONFIG_INPUT_TOUCHSCREEN=y
@@ -935,7 +1034,18 @@ CONFIG_INPUT_TOUCHSCREEN=y
 # CONFIG_TOUCHSCREEN_TSC2004 is not set
 # CONFIG_TOUCHSCREEN_W90X900 is not set
 CONFIG_TOUCHSCREEN_TPS6507X=y
-# CONFIG_INPUT_MISC is not set
+CONFIG_INPUT_MISC=y
+# CONFIG_INPUT_AD714X is not set
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=y
+# CONFIG_INPUT_PCF8574 is not set
+# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
+# CONFIG_INPUT_ADXL34X is not set
 
 #
 # Hardware I/O ports
@@ -1218,10 +1328,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_FONTS is not set
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
-CONFIG_LOGO=y
-CONFIG_LOGO_LINUX_MONO=y
-CONFIG_LOGO_LINUX_VGA16=y
-CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_LOGO is not set
 CONFIG_SOUND=y
 # CONFIG_SOUND_OSS_CORE is not set
 CONFIG_SND=y
@@ -1251,7 +1358,7 @@ CONFIG_SND_DRIVERS=y
 CONFIG_SND_ARM=y
 CONFIG_SND_SPI=y
 CONFIG_SND_USB=y
-# CONFIG_SND_USB_AUDIO is not set
+CONFIG_SND_USB_AUDIO=y
 # CONFIG_SND_USB_UA101 is not set
 # CONFIG_SND_USB_CAIAQ is not set
 CONFIG_SND_SOC=y
@@ -1332,6 +1439,7 @@ CONFIG_USB=y
 # CONFIG_USB_DEVICEFS is not set
 CONFIG_USB_DEVICE_CLASS=y
 # CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_SUSPEND is not set
 # CONFIG_USB_OTG_WHITELIST is not set
 # CONFIG_USB_OTG_BLACKLIST_HUB is not set
 # CONFIG_USB_MON is not set
@@ -1368,13 +1476,10 @@ CONFIG_USB_MUSB_DA8XX=y
 # CONFIG_USB_MUSB_UX500 is not set
 CONFIG_USB_MUSB_HOST=y
 CONFIG_USB_MUSB_HDRC_HCD=y
-# CONFIG_MUSB_PIO_ONLY is not set
-# CONFIG_USB_INVENTRA_DMA_HW is not set
-# CONFIG_USB_TI_CPPI_DMA_HW is not set
-CONFIG_USB_TI_CPPI41_DMA_HW=y
+CONFIG_MUSB_PIO_ONLY=y
 # CONFIG_USB_INVENTRA_DMA is not set
 # CONFIG_USB_TI_CPPI_DMA is not set
-CONFIG_USB_TI_CPPI41_DMA=y
+# CONFIG_USB_TI_CPPI41_DMA is not set
 # CONFIG_USB_TUSB_OMAP_DMA is not set
 CONFIG_USB_MUSB_DEBUG=y
 
@@ -1549,8 +1654,6 @@ CONFIG_RTC_DRV_OMAP=y
 CONFIG_UIO=y
 # CONFIG_UIO_PDRV is not set
 # CONFIG_UIO_PDRV_GENIRQ is not set
-# CONFIG_UIO_SMX is not set
-# CONFIG_UIO_SERCOS3 is not set
 CONFIG_UIO_PRUSS=m
 # CONFIG_STAGING is not set
 
@@ -1571,7 +1674,7 @@ CONFIG_JBD=y
 CONFIG_FS_MBCACHE=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
-# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FS_POSIX_ACL=y
 # CONFIG_XFS_FS is not set
 # CONFIG_GFS2_FS is not set
 # CONFIG_OCFS2_FS is not set
@@ -1587,6 +1690,7 @@ CONFIG_INOTIFY_USER=y
 # CONFIG_QUOTACTL is not set
 CONFIG_AUTOFS4_FS=m
 # CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
 
 #
 # Caches
@@ -1619,12 +1723,13 @@ CONFIG_PROC_SYSCTL=y
 CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
-# CONFIG_TMPFS_POSIX_ACL is not set
+CONFIG_TMPFS_POSIX_ACL=y
 # CONFIG_HUGETLB_PAGE is not set
 # CONFIG_CONFIGFS_FS is not set
 CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_ADFS_FS is not set
 # CONFIG_AFFS_FS is not set
+# CONFIG_ECRYPT_FS is not set
 # CONFIG_HFS_FS is not set
 # CONFIG_HFSPLUS_FS is not set
 # CONFIG_BEFS_FS is not set
@@ -1764,6 +1869,8 @@ CONFIG_FRAME_POINTER=y
 CONFIG_HAVE_FUNCTION_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
 CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_RING_BUFFER=y
+CONFIG_RING_BUFFER_ALLOW_SWAP=y
 CONFIG_TRACING_SUPPORT=y
 # CONFIG_FTRACE is not set
 # CONFIG_DYNAMIC_DEBUG is not set
@@ -1779,9 +1886,15 @@ CONFIG_HAVE_ARCH_KGDB=y
 # Security options
 #
 CONFIG_KEYS=y
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
 # CONFIG_SECURITY_DMESG_RESTRICT is not set
 CONFIG_SECURITY=y
 # CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_NETWORK is not set
+# CONFIG_SECURITY_PATH is not set
+# CONFIG_SECURITY_TOMOYO is not set
+# CONFIG_SECURITY_APPARMOR is not set
+# CONFIG_IMA is not set
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_DEFAULT_SECURITY=""
 CONFIG_CRYPTO=y
@@ -1789,10 +1902,21 @@ CONFIG_CRYPTO=y
 #
 # Crypto core or helper
 #
-# CONFIG_CRYPTO_MANAGER is not set
-# CONFIG_CRYPTO_MANAGER2 is not set
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP2=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
 # CONFIG_CRYPTO_GF128MUL is not set
 # CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
 # CONFIG_CRYPTO_CRYPTD is not set
 # CONFIG_CRYPTO_AUTHENC is not set
 # CONFIG_CRYPTO_TEST is not set
@@ -1879,7 +2003,7 @@ CONFIG_CRYPTO_HW=y
 CONFIG_BITREVERSE=y
 CONFIG_GENERIC_FIND_LAST_BIT=y
 CONFIG_CRC_CCITT=m
-# CONFIG_CRC16 is not set
+CONFIG_CRC16=y
 CONFIG_CRC_T10DIF=m
 # CONFIG_CRC_ITU_T is not set
 CONFIG_CRC32=y
diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index ec472d7..d569a8f 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -28,4 +28,9 @@ PATCHES_OVER_PSP = " \
     file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
     file://0006-Add-wlan-and-BT-config-switches.patch \
     file://uio_pruss.patch \
-"
+    file://0007-mmc-davinci-Eliminate-spurious-interrupts.patch \
+    file://0008-mmc-davinci-Poll-for-small-size-transfers.patch \
+    "
+
+# Updated PIO mode for MUSB help description
+PATCHES_OVER_PSP += "file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
-- 
1.7.0.4


