Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D389E01444
	for <meta-ti@yoctoproject.org>; Wed,  6 Jun 2012 08:07:47 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id b16so2156657eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 06 Jun 2012 08:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Q17N0o4/zXVht+sk2iD6h0orJug9/8lkHnPQItWQxk4=;
	b=j7MkRvBQxjcjX+wyTwDbjXVrtAxfWGDZC/tkt3ozJRAWRZ0d+4HrmS215eh+QdqWnx
	7BuxMB+WBbSO/gB2CPkomXX7g3ut6fAWmDz2GYxPOM2Q3LU46ivEF1mgvnuoVYWmRwNV
	Wp1EmWtn9uPTEJFaHoe6Ho75dEt85jIbIQkApLArztRO99p8NaC9ih0TOTJ4Qco25goF
	m9D4EP0BbbV8BoTeOX0oi50+F4NT2j7d9VFNypbQXXJYC5SmcL4fQztrarrcW1c5gDWn
	aLbmkBeAl9XMJWkYkXUSjAJfuT6Tvxqkr2vZEAIwfUMbbTGcH9BvkrprZZ83IuKI/Hox
	xVEQ==
Received: by 10.14.96.10 with SMTP id q10mr9881505eef.14.1338995266633;
	Wed, 06 Jun 2012 08:07:46 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id h53sm376702eea.1.2012.06.06.08.07.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:07:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Jun 2012 17:07:28 +0200
Message-Id: <1338995250-10721-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
References: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlLdfoDkNPXvaXozeSb3LcnqU1RaaBZqfVagIRnm8yz3mlCNOHsSxkKLoYCnyKRlk9XYDaW
Cc: denys@ti.com
Subject: [PATCH 4/6] linux-ti33x-psp 3.2: backport PM and USB fixes from PSP
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
X-List-Received-Date: Wed, 06 Jun 2012 15:07:48 -0000

The complete patchset will get rebased to the tip of the PSP tree soon, but the conflicts take a lot of time to resolve.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-AM33XX-Add-missing-EMIF-register-offsets.patch |   61 +++
 ...33XX-PM-Get-rid-of-hardcoded-resume-addre.patch |   99 +++++
 ...33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch |  397 ++++++++++++++++++
 ...AM33XX-PM-Save-and-restore-EMIF-registers.patch |  241 +++++++++++
 ...33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch |   37 ++
 ...33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch |  139 +++++++
 ...-AM33XX-Update-the-sleep-code-to-handle-D.patch |  150 +++++++
 ...008-usb-musb-update-babble-workaround-fix.patch |  168 ++++++++
 ...81xx-print-the-usbss-revision-id-during-i.patch |   29 ++
 ...ppi41-enable-txfifo-empty-interrupt-logic.patch |  425 ++++++++++++++++++++
 ...ost-Flush-txfifo-only-if-TxPktRdy-bit-set.patch |   57 +++
 ...pi41-use-dsb-to-make-sure-PDs-are-updated.patch |   43 ++
 ...3-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch |   46 +++
 ...-usb-musb-host-fix-for-urb-error-handling.patch |   66 +++
 ...pi41-txdma-flushfifo-fixes-during-channel.patch |   50 +++
 ...6-usb-musb-cppi41-tx-dma-completion-fixes.patch |   41 ++
 ...st-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch |   30 ++
 ...-usb-musb-ti81xx-fix-role-switching-issue.patch |   65 +++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   20 +-
 19 files changed, 2163 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0001-ARM-OMAP-AM33XX-Add-missing-EMIF-register-offsets.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0002-ARM-OMAP-AM33XX-PM-Get-rid-of-hardcoded-resume-addre.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0003-ARM-OMAP-AM33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0004-ARM-OMAP-AM33XX-PM-Save-and-restore-EMIF-registers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0005-ARM-OMAP-AM33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0006-ARM-OMAP-AM33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0007-ARM-OMAP-PM-AM33XX-Update-the-sleep-code-to-handle-D.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0008-usb-musb-update-babble-workaround-fix.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0009-usb-musb-ti81xx-print-the-usbss-revision-id-during-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0010-usb-musb-cppi41-enable-txfifo-empty-interrupt-logic.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0011-usb-musb-host-Flush-txfifo-only-if-TxPktRdy-bit-set.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0012-usb-musb-cppi41-use-dsb-to-make-sure-PDs-are-updated.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0013-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0014-usb-musb-host-fix-for-urb-error-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0015-usb-musb-cppi41-txdma-flushfifo-fixes-during-channel.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0016-usb-musb-cppi41-tx-dma-completion-fixes.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0017-usb-musb-host-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0018-usb-musb-ti81xx-fix-role-switching-issue.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0001-ARM-OMAP-AM33XX-Add-missing-EMIF-register-offsets.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0001-ARM-OMAP-AM33XX-Add-missing-EMIF-register-offsets.patch
new file mode 100644
index 0000000..3300bc9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0001-ARM-OMAP-AM33XX-Add-missing-EMIF-register-offsets.patch
@@ -0,0 +1,61 @@
+From 824f30e3a045347806deedb75f16e96b057f430b Mon Sep 17 00:00:00 2001
+From: Vaibhav Bedia <vaibhav.bedia@ti.com>
+Date: Tue, 22 May 2012 16:25:53 +0530
+Subject: [PATCH 01/18] ARM: OMAP: AM33XX: Add missing EMIF register offsets
+
+Add a couple of missing register offsets in the EMIF
+header file. While here also fix the indentation issue.
+
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/plat-omap/include/plat/emif.h |   34 ++++++++++++++++----------------
+ 1 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/arch/arm/plat-omap/include/plat/emif.h b/arch/arm/plat-omap/include/plat/emif.h
+index 314c126..445cbb1 100644
+--- a/arch/arm/plat-omap/include/plat/emif.h
++++ b/arch/arm/plat-omap/include/plat/emif.h
+@@ -17,23 +17,23 @@
+ #define __EMIF_H
+ 
+ #define EMIF_MOD_ID_REV			(0x0)
+-#define EMIF4_0_SDRAM_STATUS            (0x04)
+-#define EMIF4_0_SDRAM_CONFIG            (0x08)
+-#define EMIF4_0_SDRAM_CONFIG2           (0x0C)
+-#define EMIF4_0_SDRAM_REF_CTRL          (0x10)
+-#define EMIF4_0_SDRAM_REF_CTRL_SHADOW   (0x14)
+-#define EMIF4_0_SDRAM_TIM_1             (0x18)
+-#define EMIF4_0_SDRAM_TIM_1_SHADOW      (0x1C)
+-#define EMIF4_0_SDRAM_TIM_2             (0x20)
+-#define EMIF4_0_SDRAM_TIM_2_SHADOW      (0x24)
+-#define EMIF4_0_SDRAM_TIM_3             (0x28)
+-#define EMIF4_0_SDRAM_TIM_3_SHADOW      (0x2C)
+-#define EMIF4_0_SDRAM_MGMT_CTRL         (0x38)
+-#define EMIF4_0_SDRAM_MGMT_CTRL_SHD     (0x3C)
+-#define EMIF4_0_DDR_PHY_CTRL_1          (0xE4)
+-#define EMIF4_0_DDR_PHY_CTRL_1_SHADOW   (0xE8)
+-#define EMIF4_0_DDR_PHY_CTRL_2          (0xEC)
+-#define EMIF4_0_IODFT_TLGC              (0x60)
++#define EMIF4_0_SDRAM_STATUS		(0x04)
++#define EMIF4_0_SDRAM_CONFIG		(0x08)
++#define EMIF4_0_SDRAM_CONFIG2		(0x0C)
++#define EMIF4_0_SDRAM_REF_CTRL		(0x10)
++#define EMIF4_0_SDRAM_REF_CTRL_SHADOW	(0x14)
++#define EMIF4_0_SDRAM_TIM_1		(0x18)
++#define EMIF4_0_SDRAM_TIM_1_SHADOW	(0x1C)
++#define EMIF4_0_SDRAM_TIM_2		(0x20)
++#define EMIF4_0_SDRAM_TIM_2_SHADOW	(0x24)
++#define EMIF4_0_SDRAM_TIM_3		(0x28)
++#define EMIF4_0_SDRAM_TIM_3_SHADOW	(0x2C)
++#define EMIF4_0_SDRAM_MGMT_CTRL		(0x38)
++#define EMIF4_0_SDRAM_MGMT_CTRL_SHADOW	(0x3C)
++#define EMIF4_0_IODFT_TLGC		(0x60)
++#define EMIF4_0_ZQ_CONFIG		(0xC8)
++#define EMIF4_0_DDR_PHY_CTRL_1		(0xE4)
++#define EMIF4_0_DDR_PHY_CTRL_1_SHADOW	(0xE8)
+ 
+ #define SELF_REFRESH_ENABLE(m)		(0x2 << 8 | (m << 4))
+ #define SELF_REFRESH_DISABLE		(0x0 << 8)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0002-ARM-OMAP-AM33XX-PM-Get-rid-of-hardcoded-resume-addre.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0002-ARM-OMAP-AM33XX-PM-Get-rid-of-hardcoded-resume-addre.patch
new file mode 100644
index 0000000..04f7120
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0002-ARM-OMAP-AM33XX-PM-Get-rid-of-hardcoded-resume-addre.patch
@@ -0,0 +1,99 @@
+From 29ed395e3c56764a994ed4528e10c8835359a34b Mon Sep 17 00:00:00 2001
+From: Vaibhav Bedia <vaibhav.bedia@ti.com>
+Date: Tue, 22 May 2012 12:02:02 +0530
+Subject: [PATCH 02/18] ARM: OMAP: AM33XX: PM: Get rid of hardcoded resume
+ address
+
+Instead of using a harcoded resume address in the IPC registers
+add a dynamically computed offset to the start of OCMC address.
+
+Note: This approach currently assumes that the suspend-resume code
+is the first block of code that is copied to internal RAM. Due to
+the initcall level used by the SRAM mapping code this holds true.
+Ideally the sram mapping code should provide an API for doing this.
+This will be done at a later point of time when the generic SRAM
+allocator gets merged in mainline kernel.
+
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/pm.h        |    1 +
+ arch/arm/mach-omap2/pm33xx.c    |    8 +++++++-
+ arch/arm/mach-omap2/pm33xx.h    |    2 +-
+ arch/arm/mach-omap2/sleep33xx.S |   16 +++-------------
+ 4 files changed, 12 insertions(+), 15 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/pm.h b/arch/arm/mach-omap2/pm.h
+index 68aeafc..f7a7500 100644
+--- a/arch/arm/mach-omap2/pm.h
++++ b/arch/arm/mach-omap2/pm.h
+@@ -100,6 +100,7 @@ extern void omap3_save_scratchpad_contents(void);
+ /* am33xx_do_wfi function pointer and size, for copy to SRAM */
+ extern void am33xx_do_wfi(void);
+ extern unsigned int am33xx_do_wfi_sz;
++extern unsigned int am33xx_resume_offset;
+ /* ... and its pointer from SRAM after copy */
+ extern void (*am33xx_do_wfi_sram)(void);
+ /* The resume location */
+diff --git a/arch/arm/mach-omap2/pm33xx.c b/arch/arm/mach-omap2/pm33xx.c
+index 70bcb42..c4c5187 100644
+--- a/arch/arm/mach-omap2/pm33xx.c
++++ b/arch/arm/mach-omap2/pm33xx.c
+@@ -217,7 +217,13 @@ static int am33xx_pm_begin(suspend_state_t state)
+ 
+ 	disable_hlt();
+ 
+-	am33xx_lp_ipc.resume_addr = DS_RESUME_ADDR;
++	/*
++	 * Populate the resume address as part of IPC data
++	 * The offset to be added comes from sleep33xx.S
++	 * Add 4 bytes to ensure that resume happens from
++	 * the word *after* the word which holds the resume offset
++	 */
++	am33xx_lp_ipc.resume_addr = (DS_RESUME_BASE + am33xx_resume_offset + 4);
+ 	am33xx_lp_ipc.sleep_mode  = DS_MODE;
+ 	am33xx_lp_ipc.ipc_data1	  = DS_IPC_DEFAULT;
+ 	am33xx_lp_ipc.ipc_data2   = DS_IPC_DEFAULT;
+diff --git a/arch/arm/mach-omap2/pm33xx.h b/arch/arm/mach-omap2/pm33xx.h
+index f72c28e..7b3504b 100644
+--- a/arch/arm/mach-omap2/pm33xx.h
++++ b/arch/arm/mach-omap2/pm33xx.h
+@@ -47,7 +47,7 @@ struct am33xx_padconf {
+ 
+ #define M3_TXEV_EOI			(AM33XX_CTRL_BASE + 0x1324)
+ #define A8_M3_IPC_REGS			(AM33XX_CTRL_BASE + 0x1328)
+-#define DS_RESUME_ADDR			0x40300340
++#define DS_RESUME_BASE			0x40300000
+ #define DS_IPC_DEFAULT			0xffffffff
+ #define M3_UMEM				0x44D00000
+ 
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index 69b49ea..9c57335 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -234,20 +234,10 @@ wait_emif_enable:
+ 	mov	r0, #7
+ 	ldmfd	sp!, {r4 - r11, pc}	@ restore regs and return
+ 
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
+-	nop
++ENTRY(am33xx_resume_offset)
++	.word . - am33xx_do_wfi
+ 
++ENTRY(am33xx_resume_from_deep_sleep)
+ 	/* Take the PLLs out of LP_BYPASS */
+ 	pll_lock	mpu, phys_mpu_clk_mode, phys_mpu_idlest
+ 	pll_lock	per, phys_per_clk_mode, phys_per_idlest
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0003-ARM-OMAP-AM33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0003-ARM-OMAP-AM33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch
new file mode 100644
index 0000000..ad402a0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0003-ARM-OMAP-AM33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch
@@ -0,0 +1,397 @@
+From 49b0e8259aec1ffb11e0d2be13fc89fc84162fac Mon Sep 17 00:00:00 2001
+From: Vaibhav Bedia <vaibhav.bedia@ti.com>
+Date: Tue, 22 May 2012 12:19:21 +0530
+Subject: [PATCH 03/18] ARM: OMAP: AM33XX: PM: Skip DDR PHY reconfiguration in
+ resume
+
+DDR PHY registers were earlier being reconfigured in the resume
+path. This is not necessary since these registers lie in the
+WKUP domain and retain their content across various low power
+state. Skipping the reconfiguration will also enabling in getting
+a single kernel image to work for boards with different memory
+types.
+
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/pm33xx.h    |   75 +------------
+ arch/arm/mach-omap2/sleep33xx.S |  245 +--------------------------------------
+ 2 files changed, 7 insertions(+), 313 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/pm33xx.h b/arch/arm/mach-omap2/pm33xx.h
+index 7b3504b..f52e54c 100644
+--- a/arch/arm/mach-omap2/pm33xx.h
++++ b/arch/arm/mach-omap2/pm33xx.h
+@@ -60,59 +60,6 @@ struct am33xx_padconf {
+ #define M3_STATE_MSG_FOR_LP		2
+ #define M3_STATE_MSG_FOR_RESET		3
+ 
+-/* DDR offsets */
+-#define DDR_CMD0_IOCTRL			(AM33XX_CTRL_BASE + 0x1404)
+-#define DDR_CMD1_IOCTRL			(AM33XX_CTRL_BASE + 0x1408)
+-#define DDR_CMD2_IOCTRL			(AM33XX_CTRL_BASE + 0x140C)
+-#define DDR_DATA0_IOCTRL		(AM33XX_CTRL_BASE + 0x1440)
+-#define DDR_DATA1_IOCTRL		(AM33XX_CTRL_BASE + 0x1444)
+-
+-#define DDR_IO_CTRL			(AM33XX_CTRL_BASE + 0x0E04)
+-#define VTP0_CTRL_REG			(AM33XX_CTRL_BASE + 0x0E0C)
+-#define DDR_CKE_CTRL			(AM33XX_CTRL_BASE + 0x131C)
+-#define DDR_PHY_BASE_ADDR		(AM33XX_CTRL_BASE + 0x2000)
+-
+-#define CMD0_CTRL_SLAVE_RATIO_0		(DDR_PHY_BASE_ADDR + 0x01C)
+-#define CMD0_CTRL_SLAVE_FORCE_0		(DDR_PHY_BASE_ADDR + 0x020)
+-#define CMD0_CTRL_SLAVE_DELAY_0		(DDR_PHY_BASE_ADDR + 0x024)
+-#define CMD0_DLL_LOCK_DIFF_0		(DDR_PHY_BASE_ADDR + 0x028)
+-#define CMD0_INVERT_CLKOUT_0		(DDR_PHY_BASE_ADDR + 0x02C)
+-
+-#define CMD1_CTRL_SLAVE_RATIO_0		(DDR_PHY_BASE_ADDR + 0x050)
+-#define CMD1_CTRL_SLAVE_FORCE_0		(DDR_PHY_BASE_ADDR + 0x054)
+-#define CMD1_CTRL_SLAVE_DELAY_0		(DDR_PHY_BASE_ADDR + 0x058)
+-#define CMD1_DLL_LOCK_DIFF_0		(DDR_PHY_BASE_ADDR + 0x05C)
+-#define CMD1_INVERT_CLKOUT_0		(DDR_PHY_BASE_ADDR + 0x060)
+-
+-#define CMD2_CTRL_SLAVE_RATIO_0		(DDR_PHY_BASE_ADDR + 0x084)
+-#define CMD2_CTRL_SLAVE_FORCE_0		(DDR_PHY_BASE_ADDR + 0x088)
+-#define CMD2_CTRL_SLAVE_DELAY_0		(DDR_PHY_BASE_ADDR + 0x08C)
+-#define CMD2_DLL_LOCK_DIFF_0		(DDR_PHY_BASE_ADDR + 0x090)
+-#define CMD2_INVERT_CLKOUT_0		(DDR_PHY_BASE_ADDR + 0x094)
+-
+-#define DATA0_RD_DQS_SLAVE_RATIO_0	(DDR_PHY_BASE_ADDR + 0x0C8)
+-#define DATA0_RD_DQS_SLAVE_RATIO_1	(DDR_PHY_BASE_ADDR + 0x0CC)
+-
+-#define DATA0_WR_DQS_SLAVE_RATIO_0	(DDR_PHY_BASE_ADDR + 0x0DC)
+-#define DATA0_WR_DQS_SLAVE_RATIO_1	(DDR_PHY_BASE_ADDR + 0x0E0)
+-
+-#define DATA0_WRLVL_INIT_RATIO_0	(DDR_PHY_BASE_ADDR + 0x0F0)
+-#define DATA0_WRLVL_INIT_RATIO_1	(DDR_PHY_BASE_ADDR + 0x0F4)
+-
+-#define DATA0_GATELVL_INIT_RATIO_0	(DDR_PHY_BASE_ADDR + 0x0FC)
+-#define DATA0_GATELVL_INIT_RATIO_1	(DDR_PHY_BASE_ADDR + 0x100)
+-
+-#define DATA0_FIFO_WE_SLAVE_RATIO_0	(DDR_PHY_BASE_ADDR + 0x108)
+-#define DATA0_FIFO_WE_SLAVE_RATIO_1	(DDR_PHY_BASE_ADDR + 0x10C)
+-
+-#define DATA0_WR_DATA_SLAVE_RATIO_0	(DDR_PHY_BASE_ADDR + 0x120)
+-#define DATA0_WR_DATA_SLAVE_RATIO_1	(DDR_PHY_BASE_ADDR + 0x124)
+-
+-#define DATA0_DLL_LOCK_DIFF_0		(DDR_PHY_BASE_ADDR + 0x138)
+-
+-#define DATA0_RANK0_DELAYS_0		(DDR_PHY_BASE_ADDR + 0x134)
+-#define DATA1_RANK0_DELAYS_0		(DDR_PHY_BASE_ADDR + 0x1D8)
+-
+ /* Temp placeholder for the values we want in the registers */
+ #define EMIF_READ_LATENCY	0x100005	/* Enable Dynamic Power Down */
+ #define EMIF_TIM1		0x0666B3C9
+@@ -124,28 +71,12 @@ struct am33xx_padconf {
+ #define EMIF_SDRAM		0x00004650
+ #define EMIF_PHYCFG		0x2
+ 
+-#define DDR2_DLL_LOCK_DIFF	0x0
+-#define DDR2_RD_DQS		0x12
+-#define DDR2_PHY_FIFO_WE	0x80
+-
+-#define DDR_PHY_RESET		(0x1 << 10)
+-#define DDR_PHY_READY		(0x1 << 2)
+-#define DDR2_RATIO		0x80
+-#define CMD_FORCE		0x00
+-#define CMD_DELAY		0x00
+-
+-#define DDR2_INVERT_CLKOUT	0x00
+-#define DDR2_WR_DQS		0x00
+-#define DDR2_PHY_WRLVL		0x00
+-#define DDR2_PHY_GATELVL	0x00
+-#define DDR2_PHY_WR_DATA	0x40
+-#define PHY_RANK0_DELAY		0x01
+-#define PHY_DLL_LOCK_DIFF	0x0
+-#define DDR_IOCTRL_VALUE	0x18B
+-
+ #define VTP_CTRL_READY		(0x1 << 5)
+ #define VTP_CTRL_ENABLE		(0x1 << 6)
+ #define VTP_CTRL_LOCK_EN	(0x1 << 4)
+ #define VTP_CTRL_START_EN	(0x1)
+ 
++#define DDR_IO_CTRL			(AM33XX_CTRL_BASE + 0x0E04)
++#define VTP0_CTRL_REG			(AM33XX_CTRL_BASE + 0x0E0C)
++
+ #endif
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index 9c57335..4c601b11 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -273,21 +273,9 @@ ENTRY(am33xx_resume_from_deep_sleep)
+ 	bic	r1, r1, #28
+ 	str	r1, [r0]
+ 
+-/*
+- * Instead of harcoding the EMIF and DDR PHY related settings
+- * in this file, the sane thing to do would have been to backup
+- * the register contents during suspend and restore it back in
+- * the resume path. However, due to the Si errata related to
+- * DDR PHY registers, these registers are read-only. So, we'll
+- * need to hardcode atleast the DDR PHY configuration over here.
+- * We _could_ back up the EMIF registers but in order to be
+- * consistent with the DDR setup procedure we skip this for now.
+- * The person updating the DDR PHY config values is expected
+- * to update the EMIF config values also.
+- */
+ 
+ config_vtp:
+-	ldr	r0, vtp0_addr
++	ldr	r0, phys_ddr_vtp_ctrl
+ 	ldr	r1, [r0]
+ 	mov	r2, #0x0	@ clear the register
+ 	str	r2, [r0]
+@@ -312,179 +300,6 @@ poll_vtp_ready:
+ 	tst	r1, #(1 << 5)
+ 	beq	poll_vtp_ready
+ 
+-cmd_macro_config:
+-	ldr	r0, ddr_phy_base
+-	ldr	r1, [r0]
+-	ldr	r2, ddr2_ratio_val
+-	mov	r3, r2
+-	@ TODO: Need to use proper variable here
+-	mov	r4, #0
+-	str	r3, [r0, #28]	@cmd0
+-	str	r4, [r0, #32]
+-	str	r4, [r0, #36]
+-	str	r4, [r0, #40]
+-	str	r4, [r0, #44]
+-	str	r3, [r0, #80]	@cmd1
+-	str	r4, [r0, #84]
+-	str	r4, [r0, #88]
+-	str	r4, [r0, #92]
+-	str	r4, [r0, #96]
+-	str	r3, [r0, #132]	@cmd2
+-	str	r4, [r0, #136]
+-	str	r4, [r0, #140]
+-	str	r4, [r0, #144]
+-	str	r4, [r0, #148]
+-
+-	mov	r3, #0x0
+-	bl	data_macro_config
+-	mov	r3, #0xa4
+-	bl	data_macro_config
+-	b	setup_rank_delays
+-
+-data_macro_config:
+-	ldr	r0, ddr_phy_base
+-	add	r0, r0, r3
+-rd_dqs:
+-	ldr	r1, data0_rd_dqs_slave_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #200]
+-	ldr	r1, data0_rd_dqs_slave_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #204]
+-wr_dqs:
+-	ldr	r1, data0_wr_dqs_slave_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #220]
+-	ldr	r1, data0_wr_dqs_slave_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #224]
+-wr_lvl:
+-	ldr	r1, data0_wr_lvl_init_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #240]
+-	ldr	r1, data0_wr_lvl_init_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #244]
+-gate_lvl:
+-	ldr	r1, data0_gate_lvl_init_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #248]
+-	ldr	r1, data0_gate_lvl_init_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #256]
+-we_slv:
+-	ldr	r1, data0_wr_lvl_slave_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #264]
+-	ldr	r1, data0_wr_lvl_slave_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #268]
+-wr_data:
+-	ldr	r1, data0_wr_data_slave_ratio0_val
+-	mov	r2, r1
+-	/* shift by 30, 20, 10 and orr */
+-	mov	r5, r2, lsl #10
+-	mov	r6, r2, lsl #20
+-	mov	r7, r2, lsl #30
+-	orr	r2, r2, r5
+-	orr	r2, r2, r6
+-	orr	r2, r2, r7
+-	/* Done with crazy bit ops. store it now */
+-	str	r2, [r0, #288]
+-	ldr	r1, data0_wr_data_slave_ratio1_val
+-	mov	r2, r1
+-	mov	r5, r2, lsr #2
+-	mov	r2, r5
+-	str	r2, [r0, #292]
+-dll_lock:
+-	ldr	r1, data0_dll_lock_diff_val
+-	mov	r2, r1
+-	str	r2, [r0, #312]
+-
+-setup_rank_delays:
+-	ldr	r1, data0_rank0_delay0_val
+-	mov	r2, r1
+-	str	r2, [r0, #308]
+-	ldr	r1, data1_rank0_delay1_val
+-	mov	r2, r1
+-	str	r2, [r0, #472]
+-
+-setup_io_ctrl:
+-	ldr	r0, control_base
+-	ldr	r1, ddr_ioctrl_val
+-	mov	r2, r1
+-	ldr	r4, ddr_cmd_offset
+-	mov	r3, r4
+-	str	r2, [r0, r3]	@cmd0 0x1404
+-	add	r3, r3, #4
+-	str	r2, [r0, r3]	@cmd1 0x1408
+-	add	r3, r3, #4
+-	str	r2, [r0, r3]	@cmd2 0x140c
+-	ldr	r4, ddr_data_offset
+-	mov	r3, r4
+-	str	r2, [r0, r3]	@data0 0x1440
+-	add	r3, r3, #4
+-	str	r2, [r0, r3]	@data1 0x1444
+-
+-misc_config:
+-	ldr	r1, ddr_io_ctrl_addr
+-	ldr	r2, [r1]
+-	and	r2, #0xefffffff
+-	str	r2, [r1]
+-	ldr	r1, ddr_cke_addr
+-	ldr	r2, [r1]
+-	orr	r2, #0x00000001
+-	str	r2, [r1]
+ 
+ config_emif_timings:
+ 	mov	r3, #1275068416	@ 0x4c000000
+@@ -628,61 +443,6 @@ module_disabled_val:
+ 	.word	0x30000
+ 
+ /* DDR related stuff */
+-vtp0_addr:
+-	.word	VTP0_CTRL_REG
+-vtp_enable:
+-	.word	VTP_CTRL_ENABLE
+-vtp_start_en:
+-	.word	VTP_CTRL_START_EN
+-vtp_ready:
+-	.word	VTP_CTRL_READY
+-
+-ddr_phy_base:
+-	.word	DDR_PHY_BASE_ADDR
+-ddr2_ratio_val:
+-	.word	DDR2_RATIO
+-data0_rd_dqs_slave_ratio0_val:
+-	.word	DDR2_RD_DQS
+-data0_rd_dqs_slave_ratio1_val:
+-	.word	DDR2_RD_DQS
+-data0_wr_dqs_slave_ratio0_val:
+-	.word	DDR2_WR_DQS
+-data0_wr_dqs_slave_ratio1_val:
+-	.word	DDR2_WR_DQS
+-data0_wr_lvl_init_ratio0_val:
+-	.word	DDR2_PHY_WRLVL
+-data0_wr_lvl_init_ratio1_val:
+-	.word	DDR2_PHY_WRLVL
+-data0_gate_lvl_init_ratio0_val:
+-	.word	DDR2_PHY_GATELVL
+-data0_gate_lvl_init_ratio1_val:
+-	.word	DDR2_PHY_GATELVL
+-data0_wr_lvl_slave_ratio0_val:
+-	.word	DDR2_PHY_FIFO_WE
+-data0_wr_lvl_slave_ratio1_val:
+-	.word	DDR2_PHY_FIFO_WE
+-data0_wr_data_slave_ratio0_val:
+-	.word	DDR2_PHY_WR_DATA
+-data0_wr_data_slave_ratio1_val:
+-	.word	DDR2_PHY_WR_DATA
+-data0_dll_lock_diff_val:
+-	.word	PHY_DLL_LOCK_DIFF
+-
+-data0_rank0_delay0_val:
+-	.word	PHY_RANK0_DELAY
+-data1_rank0_delay1_val:
+-	.word	PHY_RANK0_DELAY
+-
+-control_base:
+-	.word	AM33XX_CTRL_BASE
+-ddr_io_ctrl_addr:
+-	.word	DDR_IO_CTRL
+-ddr_ioctrl_val:
+-	.word	0x18B
+-ddr_cmd_offset:
+-	.word	0x1404
+-ddr_data_offset:
+-	.word	0x1440
+ virt_ddr_io_ctrl:
+ 	.word	AM33XX_CTRL_REGADDR(0x0E04)
+ phys_ddr_io_ctrl:
+@@ -691,6 +451,9 @@ virt_ddr_vtp_ctrl:
+ 	.word	AM33XX_CTRL_REGADDR(0x0E0C)
+ phys_ddr_vtp_ctrl:
+ 	.word	VTP0_CTRL_REG
++vtp_enable:
++	.word	VTP_CTRL_ENABLE
++
+ virt_ddr_io_pull1:
+ 	.word	AM33XX_CTRL_REGADDR(0x1440)
+ phys_ddr_io_pull1:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0004-ARM-OMAP-AM33XX-PM-Save-and-restore-EMIF-registers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0004-ARM-OMAP-AM33XX-PM-Save-and-restore-EMIF-registers.patch
new file mode 100644
index 0000000..a1c66ad
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0004-ARM-OMAP-AM33XX-PM-Save-and-restore-EMIF-registers.patch
@@ -0,0 +1,241 @@
+From 334c051e4d0b3214136dbee1b0a52e2d29747c0a Mon Sep 17 00:00:00 2001
+From: Vaibhav Bedia <vaibhav.bedia@ti.com>
+Date: Tue, 22 May 2012 12:24:55 +0530
+Subject: [PATCH 04/18] ARM: OMAP: AM33XX: PM: Save and restore EMIF registers
+
+The EMIF configuration parameters were earlier harcoded
+under the assumption that the person updating the DDR PHY
+configuration values will update the EMIF parameters also.
+
+Now that the DDR PHY reconfiguration has been dropped, this
+restriction can also go away by adopting a save and restore
+mechanism of these registers.
+
+At the same time switch to macros for EMIF register offsets
+to improve readability.
+
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/pm33xx.h    |   11 ---
+ arch/arm/mach-omap2/sleep33xx.S |  141 +++++++++++++++++++++------------------
+ 2 files changed, 75 insertions(+), 77 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/pm33xx.h b/arch/arm/mach-omap2/pm33xx.h
+index f52e54c..a40f4d4 100644
+--- a/arch/arm/mach-omap2/pm33xx.h
++++ b/arch/arm/mach-omap2/pm33xx.h
+@@ -60,17 +60,6 @@ struct am33xx_padconf {
+ #define M3_STATE_MSG_FOR_LP		2
+ #define M3_STATE_MSG_FOR_RESET		3
+ 
+-/* Temp placeholder for the values we want in the registers */
+-#define EMIF_READ_LATENCY	0x100005	/* Enable Dynamic Power Down */
+-#define EMIF_TIM1		0x0666B3C9
+-#define EMIF_TIM2		0x243631CA
+-#define EMIF_TIM3		0x0000033F
+-#define EMIF_SDCFG		0x41805332
+-#define EMIF_SDREF		0x0000081a
+-#define EMIF_SDMGT		0x80000000
+-#define EMIF_SDRAM		0x00004650
+-#define EMIF_PHYCFG		0x2
+-
+ #define VTP_CTRL_READY		(0x1 << 5)
+ #define VTP_CTRL_ENABLE		(0x1 << 6)
+ #define VTP_CTRL_LOCK_EN	(0x1 << 4)
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index 4c601b11..b7a1612 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -71,6 +71,26 @@ wait_pll_lock_\name:
+ 
+ 	str	r0, emif_addr_virt
+ 
++	/* Save EMIF configuration */
++	ldr	r1, [r0, #EMIF4_0_SDRAM_CONFIG]
++	str	r1, emif_sdcfg_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_REF_CTRL]
++	str	r1, emif_ref_ctrl_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_TIM_1]
++	str	r1, emif_timing1_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_TIM_2]
++	str	r1, emif_timing2_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_TIM_3]
++	str	r1, emif_timing3_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_MGMT_CTRL]
++	str	r1, emif_pmcr_val
++	ldr	r1, [r0, #EMIF4_0_SDRAM_MGMT_CTRL_SHADOW]
++	str	r1, emif_pmcr_shdw_val
++	ldr	r1, [r0, #EMIF4_0_ZQ_CONFIG]
++	str	r1, emif_zqcfg_val
++	ldr	r1, [r0, #EMIF4_0_DDR_PHY_CTRL_1]
++	str	r1, emif_rd_lat_val
++
+ 	/* Ensure that all the writes to DDR leave the A8 */
+ 	dsb
+ 	dmb
+@@ -302,58 +322,52 @@ poll_vtp_ready:
+ 
+ 
+ config_emif_timings:
+-	mov	r3, #1275068416	@ 0x4c000000
+-disable_sr:
+-	mov	r4, #0
+-	str	r4, [r3, #56]	@ 0x38
++	ldr	r3, emif_phys_addr
+ 	ldr	r4, emif_rd_lat_val
+-	mov	r2, r4
+ rd_lat:
+-	str	r2, [r3, #228]	@ 0xe4
+-	str	r2, [r3, #232]	@ 0xe8
+-	str	r2, [r3, #236]	@ 0xec
++	str	r4, [r3, #EMIF4_0_DDR_PHY_CTRL_1]
++	str	r4, [r3, #EMIF4_0_DDR_PHY_CTRL_1_SHADOW]
+ timing1:
+ 	ldr	r4, emif_timing1_val
+-	mov	r2, r4
+-	str	r2, [r3, #24]
+-	str	r2, [r3, #28]
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_1]
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_1_SHADOW]
+ timing2:
+ 	ldr	r4, emif_timing2_val
+-	mov	r2, r4
+-	str	r2, [r3, #32]
+-	str	r2, [r3, #36]	@ 0x24
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_2]
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_2_SHADOW]
+ timing3:
+ 	ldr	r4, emif_timing3_val
+-	mov	r2, r4
+-	str	r2, [r3, #40]	@ 0x28
+-	str	r2, [r3, #44]	@ 0x2c
+-sdcfg1:
+-	ldr	r4, emif_sdcfg_val
+-	mov	r2, r4
+-	str	r2, [r3, #8]
+-	str	r2, [r3, #12]
+-ref_ctrl_const:
+-	ldr	r4, emif_ref_ctrl_const_val
+-	mov	r2, r4
+-	str	r2, [r3, #16]
+-	str	r2, [r3, #20]
+-
+-	/* GEL had a loop with init value of 5000 */
+-	mov	r0, #0x1000
+-wait_loop1:
+-	subs	r0, r0, #1
+-	bne	wait_loop1
+-
+-ref_ctrl_actual:
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_3]
++	str	r4, [r3, #EMIF4_0_SDRAM_TIM_3_SHADOW]
++sdram_ref_ctrl:
+ 	ldr	r4, emif_ref_ctrl_val
+-	mov	r2, r4
+-	str	r2, [r3, #16]
+-	str	r2, [r3, #20]
+-sdcfg2:
++	str	r4, [r3, #EMIF4_0_SDRAM_REF_CTRL]
++	str	r4, [r3, #EMIF4_0_SDRAM_REF_CTRL_SHADOW]
++pmcr:
++	ldr	r4, emif_pmcr_val
++	str	r4, [r3, #EMIF4_0_SDRAM_MGMT_CTRL]
++pmcr_shdw:
++	ldr	r4, emif_pmcr_shdw_val
++	str	r4, [r3, #EMIF4_0_SDRAM_MGMT_CTRL_SHADOW]
++
++	/*
++	 * Output impedence calib needed only for DDR3
++	 * but since the initial state of this will be
++	 * disabled for DDR2 no harm in restoring the
++	 * old configuration
++	 */
++zqcfg:
++	ldr	r4, emif_zqcfg_val
++	str	r4, [r3, #EMIF4_0_ZQ_CONFIG]
++
++	/*
++	 * A write to SDRAM CONFIG register triggers
++	 * an init sequence and hence it must be done
++	 * at the end
++	 */
++sdcfg:
+ 	ldr	r4, emif_sdcfg_val
+-	mov	r2, r4
+-	str	r2, [r3, #8]
+-	str	r2, [r3, #12]
++	str	r4, [r3, #EMIF4_0_SDRAM_CONFIG]
+ 
+ 	/* Back from la-la-land. Kill some time for sanity to settle in */
+ 	mov	r0, #0x1000
+@@ -377,10 +391,8 @@ emif_addr_func:
+ emif_phys_addr:
+ 	.word	AM33XX_EMIF0_BASE
+ 
+-emif_pm_ctrl:
+-	.word EMIF4_0_SDRAM_MGMT_CTRL
+ ddr_start:
+-	.word PAGE_OFFSET
++	.word	PAGE_OFFSET
+ 
+ virt_mpu_idlest:
+ 	.word	AM33XX_CM_IDLEST_DPLL_MPU
+@@ -467,37 +479,34 @@ virt_ddr_io_pull3:
+ phys_ddr_io_pull3:
+ 	.word	AM33XX_CTRL_BASE + (0x1448)
+ 
+-ddr_cke_addr:
+-	.word	DDR_CKE_CTRL
+-emif_rd_lat_val:
+-	.word	EMIF_READ_LATENCY
+-emif_timing1_val:
+-	.word	EMIF_TIM1
+-emif_timing2_val:
+-	.word	EMIF_TIM2
+-emif_timing3_val:
+-	.word	EMIF_TIM3
+-emif_sdcfg_val:
+-	.word	EMIF_SDCFG
+-emif_ref_ctrl_const_val:
+-	.word	0x4650
+-emif_ref_ctrl_val:
+-	.word	EMIF_SDREF
+-
+ susp_io_pull:
+ 	.word	0x3FF00003
+ resume_io_pull1:
+ 	.word	0x18B
+ resume_io_pull2:
+ 	.word	0x18B
+-dyn_pd_val:
+-	.word	0x100000
+-susp_sdram_config:
+-	.word	0x40805332
+ susp_vtp_ctrl_val:
+ 	.word	0x10117
+ emif_addr_virt:
+ 	.word	0xDEADBEEF
++emif_rd_lat_val:
++	.word	0xDEADBEEF
++emif_timing1_val:
++	.word	0xDEADBEEF
++emif_timing2_val:
++	.word	0xDEADBEEF
++emif_timing3_val:
++	.word	0xDEADBEEF
++emif_sdcfg_val:
++	.word	0xDEADBEEF
++emif_ref_ctrl_val:
++	.word	0xDEADBEEF
++emif_zqcfg_val:
++	.word	0xDEADBEEF
++emif_pmcr_val:
++	.word	0xDEADBEEF
++emif_pmcr_shdw_val:
++	.word	0xDEADBEEF
+ 
+ 
+ ENTRY(am33xx_do_wfi_sz)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0005-ARM-OMAP-AM33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0005-ARM-OMAP-AM33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch
new file mode 100644
index 0000000..a8db01e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0005-ARM-OMAP-AM33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch
@@ -0,0 +1,37 @@
+From a7cfe5e7b86ebba4aa184b2612c4ecb70a01aa02 Mon Sep 17 00:00:00 2001
+From: "Satyanarayana, Sandhya" <sandhya.satyanarayana@ti.com>
+Date: Tue, 22 May 2012 12:33:20 +0530
+Subject: [PATCH 05/18] ARM: OMAP: AM33XX: PM: Wait correctly for the PLLs to
+ relock in the sleep code
+
+The PLL relock code was incorrectly exiting the loop
+before the PLLs relock. Since the PLLs relock within
+a couple of A8 assembly instruction execution this went
+unnoticed till now. The issue was noticed when validating
+the abort path of the suspend process wherein the
+incorrect check for PLL relock resulted in a lockup.
+
+Signed-off-by: Satyanarayana, Sandhya <sandhya.satyanarayana@ti.com>
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/sleep33xx.S |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index b7a1612..79a9e39 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -61,8 +61,8 @@ pll_lock_\name:
+ 	ldr	r0, \idlest_addr
+ wait_pll_lock_\name:
+ 	ldr	r1, [r0]
+-	tst	r1, #0x1
+-	bne	wait_pll_lock_\name
++	ands	r1, #0x1
++	beq	wait_pll_lock_\name
+ 	.endm
+ 
+ 	/* EMIF config for low power mode */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0006-ARM-OMAP-AM33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0006-ARM-OMAP-AM33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch
new file mode 100644
index 0000000..c0d0ef1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0006-ARM-OMAP-AM33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch
@@ -0,0 +1,139 @@
+From d3ec36ec2c36ecb234c5a575b713205473e6cab8 Mon Sep 17 00:00:00 2001
+From: Vaibhav Bedia <vaibhav.bedia@ti.com>
+Date: Tue, 22 May 2012 12:43:01 +0530
+Subject: [PATCH 06/18] ARM: OMAP: AM33XX: PM: Restore the PLLs to pre-suspend
+ state
+
+In some scenarios all the PLLs (especially Display) might not be
+in a locked state when the suspend process starts. Trying to relock
+a PLL in MN-bypass mode without a proper set of M and N values results
+into the PLLs never locking and the resume process hanging. Fix this
+by restoring the PLLs to the mode that they were in before the suspend
+process started.
+
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/sleep33xx.S |   57 +++++++++++++++++++++++++-------------
+ 1 files changed, 37 insertions(+), 20 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index 79a9e39..4db3a94 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -37,10 +37,11 @@
+ ENTRY(am33xx_do_wfi)
+ 	stmfd	sp!, {r4 - r11, lr}	@ save registers on stack
+ 
+-	.macro	pll_bypass, name, clk_mode_addr, idlest_addr
++	.macro	pll_bypass, name, clk_mode_addr, idlest_addr, pll_mode
+ pll_bypass_\name:
+ 	ldr	r0, \clk_mode_addr
+ 	ldr	r1, [r0]
++	str	r1, clk_mode_\pll_mode
+ 	bic	r1, r1, #(7 << 0)
+ 	orr	r1, r1, #0x5
+ 	str	r1, [r0]
+@@ -51,18 +52,21 @@ wait_pll_bypass_\name:
+ 	bne	wait_pll_bypass_\name
+ 	.endm
+ 
+-	.macro	pll_lock, name, clk_mode_addr, idlest_addr
++	.macro	pll_lock, name, clk_mode_addr, idlest_addr, pll_mode
+ pll_lock_\name:
+ 	ldr	r0, \clk_mode_addr
+-	ldr	r1, [r0]
+-	bic	r1, r1, #(7 << 0)
+-	orr	r1, r1, #0x7
++	ldr	r1, clk_mode_\pll_mode
+ 	str	r1, [r0]
++	and	r1, r1, #0x7
++	cmp	r1, #0x7
++	bne	pll_mode_restored_\name
+ 	ldr	r0, \idlest_addr
+ wait_pll_lock_\name:
+ 	ldr	r1, [r0]
+ 	ands	r1, #0x1
+ 	beq	wait_pll_lock_\name
++pll_mode_restored_\name:
++	nop
+ 	.endm
+ 
+ 	/* EMIF config for low power mode */
+@@ -154,11 +158,11 @@ wait_emif_disable:
+ 	str	r1, [r0]
+ 
+ 	/* Put the PLLs in bypass mode */
+-	pll_bypass	core, virt_core_clk_mode, virt_core_idlest
+-	pll_bypass	ddr, virt_ddr_clk_mode, virt_ddr_idlest
+-	pll_bypass	disp, virt_disp_clk_mode, virt_disp_idlest
+-	pll_bypass	per, virt_per_clk_mode, virt_per_idlest
+-	pll_bypass	mpu, virt_mpu_clk_mode, virt_mpu_idlest
++	pll_bypass	core, virt_core_clk_mode, virt_core_idlest, core_val
++	pll_bypass	ddr, virt_ddr_clk_mode, virt_ddr_idlest, ddr_val
++	pll_bypass	disp, virt_disp_clk_mode, virt_disp_idlest, disp_val
++	pll_bypass	per, virt_per_clk_mode, virt_per_idlest, per_val
++	pll_bypass	mpu, virt_mpu_clk_mode, virt_mpu_idlest, mpu_val
+ 
+ 	dsb
+ 	dmb
+@@ -176,15 +180,17 @@ wait_emif_disable:
+ 	nop
+ 	nop
+ 	nop
++	nop
++	nop
+ 
+ 	/* We come here in case of an abort */
+ 
+ 	/* Relock the PLLs */
+-	pll_lock	mpu_abt, virt_mpu_clk_mode, virt_mpu_idlest
+-	pll_lock	per_abt, virt_per_clk_mode, virt_per_idlest
+-	pll_lock	disp_abt, virt_disp_clk_mode, virt_disp_idlest
+-	pll_lock	ddr_abt, virt_ddr_clk_mode, virt_ddr_idlest
+-	pll_lock	core_abt, virt_core_clk_mode, virt_core_idlest
++	pll_lock	mpu_abt, virt_mpu_clk_mode, virt_mpu_idlest, mpu_val
++	pll_lock	per_abt, virt_per_clk_mode, virt_per_idlest, per_val
++	pll_lock	disp_abt, virt_disp_clk_mode, virt_disp_idlest, disp_val
++	pll_lock	ddr_abt, virt_ddr_clk_mode, virt_ddr_idlest, ddr_val
++	pll_lock	core_abt, virt_core_clk_mode, virt_core_idlest, core_val
+ 
+ 	/* Disable SRAM LDO ret mode */
+ 	ldr	r0, virt_sram_ldo_addr
+@@ -259,11 +265,11 @@ ENTRY(am33xx_resume_offset)
+ 
+ ENTRY(am33xx_resume_from_deep_sleep)
+ 	/* Take the PLLs out of LP_BYPASS */
+-	pll_lock	mpu, phys_mpu_clk_mode, phys_mpu_idlest
+-	pll_lock	per, phys_per_clk_mode, phys_per_idlest
+-	pll_lock	disp, phys_disp_clk_mode, phys_disp_idlest
+-	pll_lock	ddr, phys_ddr_clk_mode, phys_ddr_idlest
+-	pll_lock	core, phys_core_clk_mode, phys_core_idlest
++	pll_lock	mpu, phys_mpu_clk_mode, phys_mpu_idlest, mpu_val
++	pll_lock	per, phys_per_clk_mode, phys_per_idlest, per_val
++	pll_lock	disp, phys_disp_clk_mode, phys_disp_idlest, disp_val
++	pll_lock	ddr, phys_ddr_clk_mode, phys_ddr_idlest, ddr_val
++	pll_lock	core, phys_core_clk_mode, phys_core_idlest, core_val
+ 
+ 	/* Disable SRAM LDO ret mode */
+ 	ldr	r0, phys_sram_ldo_addr
+@@ -508,6 +514,17 @@ emif_pmcr_val:
+ emif_pmcr_shdw_val:
+ 	.word	0xDEADBEEF
+ 
++/* PLL CLKMODE before suspend */
++clk_mode_mpu_val:
++	.word	0xDEADBEEF
++clk_mode_per_val:
++	.word	0xDEADBEEF
++clk_mode_disp_val:
++	.word	0xDEADBEEF
++clk_mode_ddr_val:
++	.word	0xDEADBEEF
++clk_mode_core_val:
++	.word	0xDEADBEEF
+ 
+ ENTRY(am33xx_do_wfi_sz)
+ 	.word	. - am33xx_do_wfi
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0007-ARM-OMAP-PM-AM33XX-Update-the-sleep-code-to-handle-D.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0007-ARM-OMAP-PM-AM33XX-Update-the-sleep-code-to-handle-D.patch
new file mode 100644
index 0000000..37f1874
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0007-ARM-OMAP-PM-AM33XX-Update-the-sleep-code-to-handle-D.patch
@@ -0,0 +1,150 @@
+From db18037175f6b61dfe2be5e657f1b90fe29fd946 Mon Sep 17 00:00:00 2001
+From: "Satyanarayana, Sandhya" <sandhya.satyanarayana@ti.com>
+Date: Tue, 22 May 2012 13:40:34 +0530
+Subject: [PATCH 07/18] ARM: OMAP: PM: AM33XX: Update the sleep code to handle
+ DDR3
+
+DDR3 devices have a reset signal which is active low. When the
+system enters low power state this signal needs to be kept high
+to avoid a reset and hence a loss of memory content. DDR_IO_CTRL
+register in the control module gives s/w control over the reset
+line. Since the reset line is left open for DDR2 devices
+(some implementation might connect this but finally it becomes
+a NOP), there is no harm in setting the reset pin to high even
+for DDR2. This also enables us to have the same sequence for
+DDR2 and DDR3 devices.
+
+Signed-off-by: Satyanarayana, Sandhya <sandhya.satyanarayana@ti.com>
+Signed-off-by: Vaibhav Bedia <vaibhav.bedia@ti.com>
+---
+ arch/arm/mach-omap2/sleep33xx.S |   59 +++++++++++++++-----------------------
+ 1 files changed, 23 insertions(+), 36 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/sleep33xx.S b/arch/arm/mach-omap2/sleep33xx.S
+index 4db3a94..6e802da 100644
+--- a/arch/arm/mach-omap2/sleep33xx.S
++++ b/arch/arm/mach-omap2/sleep33xx.S
+@@ -104,13 +104,13 @@ pll_mode_restored_\name:
+ 	ldr	r2, [r1]
+ 	orr	r2, r2, #0xa0		@ a reasonable delay for entering SR
+ 	str	r2, [r1, #0]
++	str	r2, [r1, #4]		@ write to shadow register also
+ 
+ 	ldr	r2, ddr_start		@ do a dummy access to DDR
+ 	ldr	r3, [r2, #0]
+ 	ldr	r3, [r1, #0]
+ 	orr	r3, r3, #0x200		@ now set the LP MODE to Self-Refresh
+ 	str	r3, [r1, #0]
+-	str	r2, [r1, #4]		@ write to shadow register also
+ 
+ 	mov	r1, #0x1000		@ Give some time for the system to enter SR
+ wait_sr:
+@@ -130,6 +130,11 @@ wait_emif_disable:
+ 	cmp	r2, r3
+ 	bne	wait_emif_disable
+ 
++	/* DDR3 reset override and mDDR mode selection */
++	ldr	r0, virt_ddr_io_ctrl
++	mov	r1, #(0x9 << 28)
++	str	r1, [r0]
++
+ 	/* Weak pull down for DQ, DM */
+ 	ldr	r1, virt_ddr_io_pull1
+ 	ldr	r2, susp_io_pull
+@@ -144,13 +149,6 @@ wait_emif_disable:
+ 	ldr	r2, susp_vtp_ctrl_val
+ 	str	r2, [r1]
+ 
+-	/* IO to work in mDDR mode */
+-	ldr	r0, virt_ddr_io_ctrl
+-	ldr	r1, [r0]
+-	mov	r2, #1
+-	mov	r3, r2, lsl #28
+-	str	r3, [r0]
+-
+ 	/* Enable SRAM LDO ret mode */
+ 	ldr	r0, virt_sram_ldo_addr
+ 	ldr	r1, [r0]
+@@ -198,13 +196,6 @@ wait_emif_disable:
+ 	bic	r1, #1
+ 	str	r1, [r0]
+ 
+-	/* IO to work in DDR mode */
+-	ldr	r0, virt_ddr_io_ctrl
+-	ldr	r1, [r0]
+-	mov	r2, #0x0
+-	mov	r3, r2, lsl #28
+-	str	r3, [r0]
+-
+ 	/* Restore the pull for DQ, DM */
+ 	ldr	r1, virt_ddr_io_pull1
+ 	ldr	r2, resume_io_pull1
+@@ -214,6 +205,15 @@ wait_emif_disable:
+ 	ldr	r2, resume_io_pull2
+ 	str	r2, [r1]
+ 
++	/* Enable EMIF */
++	ldr	r1, virt_emif_clkctrl
++	mov	r2, #0x2
++	str	r2, [r1]
++wait_emif_enable:
++	ldr	r3, [r1]
++	cmp	r2, r3
++	bne	wait_emif_enable
++
+ 	/* Enable VTP */
+ config_vtp_abt:
+ 	ldr	r0, virt_ddr_vtp_ctrl
+@@ -241,14 +241,10 @@ poll_vtp_ready_abt:
+ 	tst	r1, #(1 << 5)
+ 	beq	poll_vtp_ready_abt
+ 
+-	/* Enable EMIF */
+-	ldr	r1, virt_emif_clkctrl
+-	mov	r2, #0x2
+-	str	r2, [r1]
+-wait_emif_enable:
+-	ldr	r3, [r1]
+-	cmp	r2, r3
+-	bne	wait_emif_enable
++	/* DDR3 reset override and mDDR mode clear */
++	ldr	r0, virt_ddr_io_ctrl
++	mov	r1, #0
++	str	r1, [r0]
+ 
+ 	/* Disable EMIF self-refresh */
+ 	ldr	r0, emif_addr_virt
+@@ -286,19 +282,6 @@ ENTRY(am33xx_resume_from_deep_sleep)
+ 	ldr	r2, resume_io_pull2
+ 	str	r2, [r1]
+ 
+-	/* Disable EMIF self-refresh */
+-	ldr	r0, emif_phys_addr
+-	add	r0, r0, #EMIF4_0_SDRAM_MGMT_CTRL
+-	ldr	r1, [r0]
+-	bic	r1, r1, #(0x7 << 7)
+-	str	r1, [r0]
+-
+-	/* Take out IO of mDDR mode */
+-	ldr	r0, phys_ddr_io_ctrl
+-	ldr	r1, [r0]
+-	bic	r1, r1, #28
+-	str	r1, [r0]
+-
+ 
+ config_vtp:
+ 	ldr	r0, phys_ddr_vtp_ctrl
+@@ -326,6 +309,10 @@ poll_vtp_ready:
+ 	tst	r1, #(1 << 5)
+ 	beq	poll_vtp_ready
+ 
++	/* DDR3 reset override and mDDR mode clear */
++	ldr	r0, phys_ddr_io_ctrl
++	mov	r1, #0
++	str	r1, [r0]
+ 
+ config_emif_timings:
+ 	ldr	r3, emif_phys_addr
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0008-usb-musb-update-babble-workaround-fix.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0008-usb-musb-update-babble-workaround-fix.patch
new file mode 100644
index 0000000..9b1ee97
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0008-usb-musb-update-babble-workaround-fix.patch
@@ -0,0 +1,168 @@
+From 6573dac17629de93ca32dca7fb656c550a4af00d Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 10:37:27 +0530
+Subject: [PATCH 08/18] usb: musb: update babble workaround fix
+
+Resetting of usb controller also resets the tx and rx fifo addresses of
+each endpoints and hence tx and rx fifo addresses need to be reconfigured.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/musb_core.c   |   19 ++++++++++---------
+ drivers/usb/musb/musb_core.h   |    1 +
+ drivers/usb/musb/musb_procfs.c |    1 +
+ drivers/usb/musb/ti81xx.c      |   11 +++++------
+ 4 files changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
+index db5afeb..5850889 100644
+--- a/drivers/usb/musb/musb_core.c
++++ b/drivers/usb/musb/musb_core.c
+@@ -1067,7 +1067,7 @@ static void musb_shutdown(struct platform_device *pdev)
+  */
+ 
+ /* mode 0 - fits in 2KB */
+-static struct musb_fifo_cfg __devinitdata mode_0_cfg[] = {
++static struct musb_fifo_cfg mode_0_cfg[] = {
+ { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, },
+ { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, },
+ { .hw_ep_num = 2, .style = FIFO_RXTX, .maxpacket = 512, },
+@@ -1076,7 +1076,7 @@ static struct musb_fifo_cfg __devinitdata mode_0_cfg[] = {
+ };
+ 
+ /* mode 1 - fits in 4KB */
+-static struct musb_fifo_cfg __devinitdata mode_1_cfg[] = {
++static struct musb_fifo_cfg mode_1_cfg[] = {
+ { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
+ { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
+ { .hw_ep_num = 2, .style = FIFO_RXTX, .maxpacket = 512, .mode = BUF_DOUBLE, },
+@@ -1085,7 +1085,7 @@ static struct musb_fifo_cfg __devinitdata mode_1_cfg[] = {
+ };
+ 
+ /* mode 2 - fits in 4KB */
+-static struct musb_fifo_cfg __devinitdata mode_2_cfg[] = {
++static struct musb_fifo_cfg mode_2_cfg[] = {
+ { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, },
+ { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, },
+ { .hw_ep_num = 2, .style = FIFO_TX,   .maxpacket = 512, },
+@@ -1095,7 +1095,7 @@ static struct musb_fifo_cfg __devinitdata mode_2_cfg[] = {
+ };
+ 
+ /* mode 3 - fits in 4KB */
+-static struct musb_fifo_cfg __devinitdata mode_3_cfg[] = {
++static struct musb_fifo_cfg mode_3_cfg[] = {
+ { .hw_ep_num = 1, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
+ { .hw_ep_num = 1, .style = FIFO_RX,   .maxpacket = 512, .mode = BUF_DOUBLE, },
+ { .hw_ep_num = 2, .style = FIFO_TX,   .maxpacket = 512, },
+@@ -1105,7 +1105,7 @@ static struct musb_fifo_cfg __devinitdata mode_3_cfg[] = {
+ };
+ 
+ /* mode 4 - fits in 16KB */
+-static struct musb_fifo_cfg __devinitdata mode_4_cfg[] = {
++static struct musb_fifo_cfg mode_4_cfg[] = {
+ { .hw_ep_num =  1, .style = FIFO_TX,   .maxpacket = 512,},
+ { .hw_ep_num =  1, .style = FIFO_RX,   .maxpacket = 512,},
+ { .hw_ep_num =  2, .style = FIFO_TX,   .maxpacket = 512,},
+@@ -1137,7 +1137,7 @@ static struct musb_fifo_cfg __devinitdata mode_4_cfg[] = {
+ 
+ 
+ /* mode 5 - fits in 8KB */
+-static struct musb_fifo_cfg __devinitdata mode_5_cfg[] = {
++static struct musb_fifo_cfg mode_5_cfg[] = {
+ { .hw_ep_num =  1, .style = FIFO_TX,   .maxpacket = 512, },
+ { .hw_ep_num =  1, .style = FIFO_RX,   .maxpacket = 512, },
+ { .hw_ep_num =  2, .style = FIFO_TX,   .maxpacket = 512, },
+@@ -1168,7 +1168,7 @@ static struct musb_fifo_cfg __devinitdata mode_5_cfg[] = {
+ };
+ 
+ /* mode 6 - fits in 32KB */
+-static struct musb_fifo_cfg __devinitdata mode_6_cfg[] = {
++static struct musb_fifo_cfg mode_6_cfg[] = {
+ { .hw_ep_num =  1, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE,},
+ { .hw_ep_num =  1, .style = FIFO_RX,   .maxpacket = 512, .mode = BUF_DOUBLE,},
+ { .hw_ep_num =  2, .style = FIFO_TX,   .maxpacket = 512, .mode = BUF_DOUBLE,},
+@@ -1275,11 +1275,11 @@ fifo_setup(struct musb *musb, struct musb_hw_ep  *hw_ep,
+ 	return offset + (maxpacket << ((c_size & MUSB_FIFOSZ_DPB) ? 1 : 0));
+ }
+ 
+-static struct musb_fifo_cfg __devinitdata ep0_cfg = {
++static struct musb_fifo_cfg ep0_cfg = {
+ 	.style = FIFO_RXTX, .maxpacket = 64,
+ };
+ 
+-static int __devinit ep_config_from_table(struct musb *musb)
++int ep_config_from_table(struct musb *musb)
+ {
+ 	const struct musb_fifo_cfg	*cfg;
+ 	unsigned		i, n;
+@@ -1370,6 +1370,7 @@ done:
+ 
+ 	return 0;
+ }
++EXPORT_SYMBOL(ep_config_from_table);
+ 
+ /*
+  * ep_config_from_hw - when MUSB_C_DYNFIFO_DEF is false
+diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
+index 87b6ff0..184c043 100644
+--- a/drivers/usb/musb/musb_core.h
++++ b/drivers/usb/musb/musb_core.h
+@@ -652,6 +652,7 @@ static inline const char *get_dma_name(struct musb *musb)
+ 		return "?dma?";
+ #endif
+ }
++extern int ep_config_from_table(struct musb *musb);
+ 
+ extern void musb_gb_work(struct work_struct *data);
+ /*-------------------------- ProcFS definitions ---------------------*/
+diff --git a/drivers/usb/musb/musb_procfs.c b/drivers/usb/musb/musb_procfs.c
+index e3aa42f..2db7eac 100644
+--- a/drivers/usb/musb/musb_procfs.c
++++ b/drivers/usb/musb/musb_procfs.c
+@@ -719,6 +719,7 @@ static int musb_proc_write(struct file *file, const char __user *buffer,
+ 		INFO("T: start sending TEST_PACKET\n");
+ 		INFO("D: set/read dbug level\n");
+ 		INFO("K/k: enable/disable babble workaround\n");
++		INFO("b: generate software babble interrupt\n");
+ 		break;
+ 
+ 	default:
+diff --git a/drivers/usb/musb/ti81xx.c b/drivers/usb/musb/ti81xx.c
+index d76a693..e3cf38b 100644
+--- a/drivers/usb/musb/ti81xx.c
++++ b/drivers/usb/musb/ti81xx.c
+@@ -813,8 +813,7 @@ int musb_simulate_babble(struct musb *musb)
+ 	mdelay(100);
+ 
+ 	/* generate s/w babble interrupt */
+-	musb_writel(reg_base, USB_IRQ_STATUS_RAW_1,
+-		MUSB_INTR_BABBLE);
++	musb_writel(reg_base, USB_IRQ_STATUS_RAW_1, MUSB_INTR_BABBLE);
+ 	return 0;
+ }
+ EXPORT_SYMBOL(musb_simulate_babble);
+@@ -828,7 +827,8 @@ void musb_babble_workaround(struct musb *musb)
+ 
+ 	/* Reset the controller */
+ 	musb_writel(reg_base, USB_CTRL_REG, USB_SOFT_RESET_MASK);
+-	udelay(100);
++	while ((musb_readl(reg_base, USB_CTRL_REG) & 0x1))
++		cpu_relax();
+ 
+ 	/* Shutdown the on-chip PHY and its PLL. */
+ 	if (data->set_phy_power)
+@@ -843,9 +843,8 @@ void musb_babble_workaround(struct musb *musb)
+ 		data->set_phy_power(musb->id, 1);
+ 	mdelay(100);
+ 
+-	/* save the usbotgss register contents */
+-	musb_platform_enable(musb);
+-
++	/* re-setup the endpoint fifo addresses */
++	ep_config_from_table(musb);
+ 	musb_start(musb);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0009-usb-musb-ti81xx-print-the-usbss-revision-id-during-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0009-usb-musb-ti81xx-print-the-usbss-revision-id-during-i.patch
new file mode 100644
index 0000000..fce35bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0009-usb-musb-ti81xx-print-the-usbss-revision-id-during-i.patch
@@ -0,0 +1,29 @@
+From 9a362c5b759686f056070b6cddfc7405782464a9 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Wed, 23 May 2012 15:32:37 +0530
+Subject: [PATCH 09/18] usb: musb: ti81xx: print the usbss revision id during
+ init
+
+This is to identify the id which can help in debugging.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/ti81xx.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/musb/ti81xx.c b/drivers/usb/musb/ti81xx.c
+index e3cf38b..f7b2f62 100644
+--- a/drivers/usb/musb/ti81xx.c
++++ b/drivers/usb/musb/ti81xx.c
+@@ -1069,6 +1069,8 @@ int ti81xx_musb_init(struct musb *musb)
+ 	if (!rev)
+ 		return -ENODEV;
+ 
++	pr_info("MUSB%d controller's USBSS revision = %08x\n", musb->id, rev);
++
+ 	if (is_host_enabled(musb))
+ 		setup_timer(&musb->otg_workaround, otg_timer,
+ 					(unsigned long) musb);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0010-usb-musb-cppi41-enable-txfifo-empty-interrupt-logic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0010-usb-musb-cppi41-enable-txfifo-empty-interrupt-logic.patch
new file mode 100644
index 0000000..761f4d6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0010-usb-musb-cppi41-enable-txfifo-empty-interrupt-logic.patch
@@ -0,0 +1,425 @@
+From a4d99c3c1e01b91b69c6939ba3ee708611869402 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Wed, 23 May 2012 15:25:32 +0530
+Subject: [PATCH 10/18] usb: musb: cppi41: enable txfifo empty interrupt logic
+
+Fixes the txdma early completion issue as the TxFIFO empty interrupt
+logic generates an interrupt when last byte from TxFIFO is
+transmitted out.
+
+The application issues fixed are -
+1) The isochronous gap issue seen due to txdma early completion and
+   thus a delay caused in scheduling of txdma workthread which polls
+   for txfifo empty status.
+
+2) The workthread is rescheduled once again when txfifo is empty to
+   make sure any miss of transfer of the data in internal cppififo.
+
+3) For non-isochronous tx request uses workthread to poll for txfifo
+   empty status if there is possiblity of data in internal cppififo
+   other wise the request is completed directly in the tx-dma isr
+   function.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/cppi41_dma.c  |  101 ++++++++++++++++++++++++++++++++++++++--
+ drivers/usb/musb/cppi41_dma.h  |    7 +++
+ drivers/usb/musb/musb_core.h   |   16 ++++++
+ drivers/usb/musb/musb_gadget.c |    1 +
+ drivers/usb/musb/musb_host.c   |    1 +
+ drivers/usb/musb/ti81xx.c      |   51 ++++++++++++++++++++-
+ drivers/usb/musb/ti81xx.h      |    3 +
+ 7 files changed, 174 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index 4761acd..3665d0f 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -101,6 +101,9 @@ struct cppi41_channel {
+ 	u8  inf_mode;
+ 	u8  tx_complete;
+ 	u8  hb_mult;
++	u8  txf_complete;
++	u8  txfifo_intr_enable;
++	u8  count;
+ };
+ 
+ /**
+@@ -132,6 +135,7 @@ struct cppi41 {
+ 	u32 teardown_reg_offs;		/* USB_TEARDOWN_REG offset */
+ 	u32 bd_size;
+ 	u8  inf_mode;
++	u8  txfifo_intr_enable;		/* txfifo empty interrupt logic */
+ };
+ 
+ struct usb_cppi41_info usb_cppi41_info[2];
+@@ -573,6 +577,9 @@ static unsigned cppi41_next_tx_segment(struct cppi41_channel *tx_ch)
+ 	u16 q_mgr = cppi_info->q_mgr;
+ 	u16 tx_comp_q = cppi_info->tx_comp_q[tx_ch->ch_num];
+ 	u8 en_bd_intr = cppi->en_bd_intr;
++	u8 is_isoc = 0;
++	struct musb_hw_ep *hw_ep = cppi->musb->endpoints + tx_ch->end_pt->epnum;
++	int xfer_type = hw_ep->xfer_type;
+ 
+ 	/*
+ 	 * Tx can use the generic RNDIS mode where we can probably fit this
+@@ -599,6 +606,12 @@ static unsigned cppi41_next_tx_segment(struct cppi41_channel *tx_ch)
+ 	    tx_ch->ch_num, tx_ch->dma_mode ? "accelerated" : "transparent",
+ 	    pkt_size, num_pds, tx_ch->start_addr + tx_ch->curr_offset, length);
+ 
++	if (xfer_type  == USB_ENDPOINT_XFER_ISOC)
++		is_isoc = 1;
++
++	if (is_isoc && cppi->txfifo_intr_enable && (length <= tx_ch->pkt_size))
++		tx_ch->txfifo_intr_enable = 1;
++
+ 	for (n = 0; n < num_pds; n++) {
+ 		struct cppi41_host_pkt_desc *hw_desc;
+ 
+@@ -640,6 +653,14 @@ static unsigned cppi41_next_tx_segment(struct cppi41_channel *tx_ch)
+ 		dev_dbg(musb->controller, "TX PD %p: buf %08x, len %08x, pkt info %08x\n", curr_pd,
+ 		    hw_desc->buf_ptr, hw_desc->buf_len, hw_desc->pkt_info);
+ 
++		/* enable tx fifo empty interrupt */
++		if (tx_ch->txfifo_intr_enable) {
++			dev_dbg(musb->controller, "txs(%p %d) enable txFintr\n",
++				curr_pd, hw_desc->orig_buf_len &
++					~CPPI41_PKT_INTR_FLAG);
++			txfifoempty_int_enable(cppi->musb, curr_pd->ep_num);
++		}
++
+ 		cppi41_queue_push(&tx_ch->queue_obj, curr_pd->dma_addr,
+ 				  USB_CPPI41_DESC_ALIGN, pkt_size);
+ 	}
+@@ -1211,6 +1232,8 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 		csr &= ~MUSB_TXCSR_DMAENAB;
+ 		musb_writew(epio, MUSB_TXCSR, csr);
+ 
++		cppi_ch->tx_complete = 0;
++		cppi_ch->txf_complete = 0;
+ 		/* Tear down Tx DMA channel */
+ 		usb_tx_ch_teardown(cppi_ch);
+ 
+@@ -1224,7 +1247,6 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 		csr |= MUSB_TXCSR_FLUSHFIFO | MUSB_TXCSR_H_WZC_BITS;
+ 		musb_writew(epio, MUSB_TXCSR, csr);
+ 		musb_writew(epio, MUSB_TXCSR, csr);
+-		cppi_ch->tx_complete = 0;
+ 	} else { /* Rx */
+ 		dprintk("Rx channel teardown, cppi_ch = %p\n", cppi_ch);
+ 
+@@ -1331,16 +1353,23 @@ void txdma_completion_work(struct work_struct *data)
+ 				 */
+ 				if (!tx_ch->end_pt) {
+ 					tx_ch->tx_complete = 0;
++					tx_ch->count = 0;
+ 					continue;
+ 				}
+ 
+ 				epio = tx_ch->end_pt->regs;
+ 				csr = musb_readw(epio, MUSB_TXCSR);
+ 
+-				if (csr & (MUSB_TXCSR_TXPKTRDY |
+-					MUSB_TXCSR_FIFONOTEMPTY)) {
++				if (!tx_ch->txfifo_intr_enable &&
++					(csr & (MUSB_TXCSR_TXPKTRDY |
++					MUSB_TXCSR_FIFONOTEMPTY))) {
+ 					resched = 1;
+ 				} else {
++					if (tx_ch->count > 0) {
++						tx_ch->count--;
++						resched = 1;
++						continue;
++					}
+ 					tx_ch->channel.status =
+ 						MUSB_DMA_STATUS_FREE;
+ 					tx_ch->tx_complete = 0;
+@@ -1363,6 +1392,38 @@ void txdma_completion_work(struct work_struct *data)
+ 
+ }
+ 
++void cppi41_handle_txfifo_intr(struct musb *musb, u16 usbintr)
++{
++	struct cppi41 *cppi;
++	struct cppi41_channel *tx_ch;
++	int index;
++
++	cppi = container_of(musb->dma_controller, struct cppi41, controller);
++	for (index = 0; (index < USB_CPPI41_NUM_CH) && usbintr; index++) {
++		if (usbintr & 1) {
++			tx_ch = &cppi->tx_cppi_ch[index];
++			if (tx_ch->txf_complete) {
++				/* disable txfifo empty interupt */
++				txfifoempty_int_disable(musb, index+1);
++				tx_ch->txf_complete = 0;
++				if (!tx_ch->txfifo_intr_enable)
++					dev_dbg(musb->controller,
++					"Bug, wrong TxFintr ep%d\n", index+1);
++				tx_ch->txfifo_intr_enable = 0;
++
++				tx_ch->channel.status =
++					MUSB_DMA_STATUS_FREE;
++
++				dev_dbg(musb->controller,
++					"txc: givback ep%d\n", index+1);
++				musb_dma_completion(musb, index+1, 1);
++			}
++		}
++		usbintr = usbintr >> 1;
++	}
++}
++EXPORT_SYMBOL(cppi41_handle_txfifo_intr);
++
+ /**
+  * cppi41_dma_controller_create -
+  * instantiate an object representing DMA controller.
+@@ -1386,6 +1447,7 @@ cppi41_dma_controller_create(struct musb  *musb, void __iomem *mregs)
+ 	cppi->controller.channel_abort = cppi41_channel_abort;
+ 	cppi->cppi_info = (struct usb_cppi41_info *)&usb_cppi41_info[musb->id];;
+ 	cppi->en_bd_intr = cppi->cppi_info->bd_intr_ctrl;
++	cppi->txfifo_intr_enable = musb->txfifo_intr_enable;
+ 	INIT_WORK(&cppi->txdma_work, txdma_completion_work);
+ 
+ 	/*
+@@ -1472,6 +1534,9 @@ static void usb_process_tx_queue(struct cppi41 *cppi, unsigned index)
+ 		    (tx_ch->transfer_mode && !tx_ch->zlp_queued))
+ 			cppi41_next_tx_segment(tx_ch);
+ 		else if (tx_ch->channel.actual_len >= tx_ch->length) {
++			void __iomem *epio;
++			u16 csr;
++
+ 			/*
+ 			 * We get Tx DMA completion interrupt even when
+ 			 * data is still in FIFO and not moved out to
+@@ -1480,8 +1545,34 @@ static void usb_process_tx_queue(struct cppi41 *cppi, unsigned index)
+ 			 * USB functionality. So far, we have obsered
+ 			 * failure with iperf.
+ 			 */
+-			tx_ch->tx_complete = 1;
+-			schedule_work(&cppi->txdma_work);
++			/* wait for tx fifo empty completion interrupt
++			 * if enabled other wise use the workthread
++			 * to poll fifo empty status
++			 */
++			epio = tx_ch->end_pt->regs;
++			csr = musb_readw(epio, MUSB_TXCSR);
++
++			if (tx_ch->txfifo_intr_enable) {
++				tx_ch->txf_complete = 1;
++				dev_dbg(musb->controller,
++				"wait for TxF-EmptyIntr ep%d\n", ep_num);
++			} else {
++				int residue;
++
++				residue = tx_ch->channel.actual_len %
++						tx_ch->pkt_size;
++
++				if (tx_ch->pkt_size > 128 && !residue) {
++					tx_ch->channel.status =
++						MUSB_DMA_STATUS_FREE;
++					musb_dma_completion(cppi->musb,
++						ep_num, 1);
++				} else {
++					tx_ch->tx_complete = 1;
++					tx_ch->count = 1;
++					schedule_work(&cppi->txdma_work);
++				}
++			}
+ 		}
+ 	}
+ }
+diff --git a/drivers/usb/musb/cppi41_dma.h b/drivers/usb/musb/cppi41_dma.h
+index bedf3bb..053a135 100644
+--- a/drivers/usb/musb/cppi41_dma.h
++++ b/drivers/usb/musb/cppi41_dma.h
+@@ -58,4 +58,11 @@ extern struct usb_cppi41_info usb_cppi41_info[];
+  */
+ void cppi41_completion(struct musb *musb, u32 rx, u32 tx);
+ 
++/**
++ * cppi41_handle_txfifo_intr - Handles tx fifo empty interupts
++ * @musb:	the controller
++ */
++void cppi41_handle_txfifo_intr(struct musb *musb, u16 usbintr);
++void txfifoempty_int_enable(struct musb *musb, u8 ep_num);
++void txfifoempty_int_disable(struct musb *musb, u8 ep_num);
+ #endif	/* _CPPI41_DMA_H_ */
+diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
+index 184c043..40f02ae 100644
+--- a/drivers/usb/musb/musb_core.h
++++ b/drivers/usb/musb/musb_core.h
+@@ -228,6 +228,8 @@ struct musb_platform_ops {
+ 		void __iomem *);
+ 	void (*dma_controller_destroy)(struct dma_controller *);
+ 	int (*simulate_babble_intr)(struct musb *musb);
++	void (*txfifoempty_intr_enable)(struct musb *musb, u8 ep_num);
++	void (*txfifoempty_intr_disable)(struct musb *musb, u8 ep_num);
+ };
+ 
+ /*
+@@ -278,6 +280,7 @@ struct musb_hw_ep {
+ 	struct musb_ep		ep_out;			/* RX */
+ 
+ 	u8			prev_toggle;		/* Rx */
++	u8			xfer_type;
+ };
+ 
+ static inline struct musb_request *next_in_request(struct musb_hw_ep *hw_ep)
+@@ -472,6 +475,7 @@ struct musb {
+ 	u64			*orig_dma_mask;
+ #endif
+ 	short			fifo_mode;
++	u8			txfifo_intr_enable;
+ };
+ 
+ static inline struct musb *gadget_to_musb(struct usb_gadget *g)
+@@ -562,6 +566,18 @@ extern irqreturn_t musb_interrupt(struct musb *);
+ 
+ extern void musb_hnp_stop(struct musb *musb);
+ 
++static inline void txfifoempty_int_enable(struct musb *musb, u8 ep_num)
++{
++	if (musb->ops->txfifoempty_intr_enable)
++		musb->ops->txfifoempty_intr_enable(musb, ep_num);
++}
++
++static inline void txfifoempty_int_disable(struct musb *musb, u8 ep_num)
++{
++	if (musb->ops->txfifoempty_intr_disable)
++		musb->ops->txfifoempty_intr_disable(musb, ep_num);
++}
++
+ static inline void musb_platform_set_vbus(struct musb *musb, int is_on)
+ {
+ 	if (musb->ops->set_vbus)
+diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
+index 305d843..47349ca 100644
+--- a/drivers/usb/musb/musb_gadget.c
++++ b/drivers/usb/musb/musb_gadget.c
+@@ -1020,6 +1020,7 @@ static int musb_gadget_enable(struct usb_ep *ep,
+ 		goto fail;
+ 	}
+ 	musb_ep->type = usb_endpoint_type(desc);
++	hw_ep->xfer_type = musb_ep->type;
+ 
+ 	/* check direction and (later) maxpacket size against endpoint */
+ 	if (usb_endpoint_num(desc) != epnum)
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index 80d83bd..c3629bd 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -246,6 +246,7 @@ musb_start_urb(struct musb *musb, int is_in, struct musb_qh *qh)
+ 	/* initialize software qh state */
+ 	qh->offset = 0;
+ 	qh->segsize = 0;
++	hw_ep->xfer_type = qh->type;
+ 
+ 	/* gather right source of data */
+ 	switch (qh->type) {
+diff --git a/drivers/usb/musb/ti81xx.c b/drivers/usb/musb/ti81xx.c
+index f7b2f62..7e21c25 100644
+--- a/drivers/usb/musb/ti81xx.c
++++ b/drivers/usb/musb/ti81xx.c
+@@ -568,7 +568,6 @@ int cppi41_enable_sched_rx(void)
+ 	cppi41_dma_sched_tbl_init(0, 0, dma_sched_table, 30);
+ 	return 0;
+ }
+-#endif /* CONFIG_USB_TI_CPPI41_DMA */
+ 
+ /*
+  * Because we don't set CTRL.UINT, it's "important" to:
+@@ -577,6 +576,33 @@ int cppi41_enable_sched_rx(void)
+  *	- use INTSET/INTCLR instead.
+  */
+ 
++void txfifoempty_intr_enable(struct musb *musb, u8 ep_num)
++{
++	void __iomem *reg_base = musb->ctrl_base;
++	u32 coremask;
++
++	if (musb->txfifo_intr_enable) {
++		coremask = musb_readl(reg_base, USB_CORE_INTR_SET_REG);
++		coremask |= (1 << (ep_num + 16));
++		musb_writel(reg_base, USB_CORE_INTR_SET_REG, coremask);
++		dev_dbg(musb->controller, "enable txF intr ep%d coremask %x\n",
++			ep_num, coremask);
++	}
++}
++
++void txfifoempty_intr_disable(struct musb *musb, u8 ep_num)
++{
++	void __iomem *reg_base = musb->ctrl_base;
++	u32 coremask;
++
++	if (musb->txfifo_intr_enable) {
++		coremask = (1 << (ep_num + 16));
++		musb_writel(reg_base, USB_CORE_INTR_CLEAR_REG, coremask);
++	}
++}
++
++#endif /* CONFIG_USB_TI_CPPI41_DMA */
++
+ /**
+  * ti81xx_musb_enable - enable interrupts
+  */
+@@ -889,6 +915,18 @@ static irqreturn_t ti81xx_interrupt(int irq, void *hci)
+ 	musb->int_usb =	(usbintr & USB_INTR_USB_MASK) >> USB_INTR_USB_SHIFT;
+ 
+ 	dev_dbg(musb->controller, "usbintr (%x) epintr(%x)\n", usbintr, epintr);
++
++	if (musb->txfifo_intr_enable && (usbintr & USB_INTR_TXFIFO_MASK)) {
++#ifdef CONFIG_USB_TI_CPPI41_DMA
++		dev_dbg(musb->controller,
++			"TxFIFOIntr %x\n", usbintr >> USB_INTR_TXFIFO_EMPTY);
++		cppi41_handle_txfifo_intr(musb,
++				usbintr >> USB_INTR_TXFIFO_EMPTY);
++		ret = IRQ_HANDLED;
++#endif
++	}
++	usbintr &= ~USB_INTR_TXFIFO_MASK;
++
+ 	/*
+ 	 * DRVVBUS IRQs are the only proxy we have (a very poor one!) for
+ 	 * AM3517's missing ID change IRQ.  We need an ID change IRQ to
+@@ -1108,6 +1146,13 @@ int ti81xx_musb_init(struct musb *musb)
+ 	/* set musb controller to host mode */
+ 	musb_platform_set_mode(musb, mode);
+ 
++#ifdef CONFIG_USB_TI_CPPI41_DMA
++	musb->txfifo_intr_enable = 1;
++	if (musb->txfifo_intr_enable)
++		printk(KERN_DEBUG "TxFifo Empty intr enabled\n");
++	else
++		printk(KERN_DEBUG "TxFifo Empty intr disabled\n");
++#endif
+ 	/* enable babble workaround */
+ 	INIT_WORK(&musb->work, evm_deferred_musb_restart);
+ 	musb->enable_babble_work = 0;
+@@ -1184,6 +1229,10 @@ static struct musb_platform_ops ti81xx_ops = {
+ 	.dma_controller_create	= cppi41_dma_controller_create,
+ 	.dma_controller_destroy	= cppi41_dma_controller_destroy,
+ 	.simulate_babble_intr	= musb_simulate_babble,
++#ifdef CONFIG_USB_TI_CPPI41_DMA
++	.txfifoempty_intr_enable = txfifoempty_intr_enable,
++	.txfifoempty_intr_disable = txfifoempty_intr_disable,
++#endif
+ };
+ 
+ static void __devexit ti81xx_delete_musb_pdev(struct ti81xx_glue *glue, u8 id)
+diff --git a/drivers/usb/musb/ti81xx.h b/drivers/usb/musb/ti81xx.h
+index e0dbd3e..d173b55 100644
+--- a/drivers/usb/musb/ti81xx.h
++++ b/drivers/usb/musb/ti81xx.h
+@@ -125,6 +125,9 @@
+ /* USB interrupt register bits */
+ #define USB_INTR_USB_SHIFT      0
+ #define USB_INTR_USB_MASK       (0x1ff << USB_INTR_USB_SHIFT) /* 8 Mentor */
++#define USB_INTR_TXFIFO_MASK     (0xffff << 16)
++#define USB_INTR_TXFIFO_EMPTY	17
++
+ 				/* interrupts and DRVVBUS interrupt */
+ #define USB_INTR_DRVVBUS        0x100
+ #define USB_INTR_RX_SHIFT       16
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0011-usb-musb-host-Flush-txfifo-only-if-TxPktRdy-bit-set.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0011-usb-musb-host-Flush-txfifo-only-if-TxPktRdy-bit-set.patch
new file mode 100644
index 0000000..cd7a96b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0011-usb-musb-host-Flush-txfifo-only-if-TxPktRdy-bit-set.patch
@@ -0,0 +1,57 @@
+From e5fad55642b91e45ed640c546dd10bd454b6e4df Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 15:42:53 +0530
+Subject: [PATCH 11/18] usb: musb: host: Flush txfifo only if TxPktRdy bit set
+
+This is needed as per mentor core documents.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/musb_host.c |   23 ++++++++++++-----------
+ 1 files changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index c3629bd..7545a65 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -133,25 +133,26 @@ static void musb_h_tx_flush_fifo(struct musb_hw_ep *ep)
+ 	struct musb	*musb = ep->musb;
+ 	void __iomem	*epio = ep->regs;
+ 	u16		csr;
+-	u16		lastcsr = 0;
+ 	int		retries = 1000;
+ 
+ 	csr = musb_readw(epio, MUSB_TXCSR);
+-	while (csr & MUSB_TXCSR_FIFONOTEMPTY) {
+-		if (csr != lastcsr)
+-			dev_dbg(musb->controller, "Host TX FIFONOTEMPTY csr: %02x\n", csr);
+-		lastcsr = csr;
+-		csr = MUSB_TXCSR_FLUSHFIFO;
++	while (csr & MUSB_TXCSR_TXPKTRDY) {
++		if (!(csr & MUSB_TXCSR_FIFONOTEMPTY))
++			return;
++		else
++			dev_dbg(musb->controller,
++				"Host TX FIFONOTEMPTY csr: %02x\n", csr);
++
++		csr |= MUSB_TXCSR_FLUSHFIFO;
+ 		musb_writew(epio, MUSB_TXCSR, csr);
+ 		csr = musb_readw(epio, MUSB_TXCSR);
+-		if (!(csr & MUSB_TXCSR_FIFONOTEMPTY))
+-			break;
++
+ 		if (retries-- < 1) {
+-			dev_dbg(musb->controller, "Could not flush host TX%d fifo: csr: %04x\n",
+-				ep->epnum, csr);
++			dev_dbg(musb->controller,
++				"Could not flush host TX%d fifo: csr: %04x\n",
++					ep->epnum, csr);
+ 			return;
+ 		}
+-		mdelay(1);
+ 	}
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0012-usb-musb-cppi41-use-dsb-to-make-sure-PDs-are-updated.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0012-usb-musb-cppi41-use-dsb-to-make-sure-PDs-are-updated.patch
new file mode 100644
index 0000000..0edb255
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0012-usb-musb-cppi41-use-dsb-to-make-sure-PDs-are-updated.patch
@@ -0,0 +1,43 @@
+From 946a82d6042097a0b3c5e072df75da9ffcbbc44c Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 15:45:45 +0530
+Subject: [PATCH 12/18] usb: musb: cppi41: use dsb() to make sure PDs are
+ updated to memory
+
+Before pushing the tx/rx cppi packet descriptors to respective input queues
+of TX/RX DMA channels, use memory barrier dsb() to make sure the descriptors
+contents are written to memory
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/cppi41_dma.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index 3665d0f..bf74cf3 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -653,6 +653,9 @@ static unsigned cppi41_next_tx_segment(struct cppi41_channel *tx_ch)
+ 		dev_dbg(musb->controller, "TX PD %p: buf %08x, len %08x, pkt info %08x\n", curr_pd,
+ 		    hw_desc->buf_ptr, hw_desc->buf_len, hw_desc->pkt_info);
+ 
++		/* make sure descriptor details are updated to memory*/
++		dsb();
++
+ 		/* enable tx fifo empty interrupt */
+ 		if (tx_ch->txfifo_intr_enable) {
+ 			dev_dbg(musb->controller, "txs(%p %d) enable txFintr\n",
+@@ -869,6 +872,10 @@ static unsigned cppi41_next_rx_segment(struct cppi41_channel *rx_ch)
+ 
+ 		if (en_bd_intr)
+ 			hw_desc->orig_buf_len |= CPPI41_PKT_INTR_FLAG;
++
++		/* make sure descriptor details are updated to memory*/
++		dsb();
++
+ 		/*
+ 		 * Push the free Rx packet descriptor
+ 		 * to the free descriptor/buffer queue.
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0013-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0013-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch
new file mode 100644
index 0000000..11f05c1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0013-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch
@@ -0,0 +1,46 @@
+From 4fbf77cebc6d141b9a74a92fd2b3f756908ef657 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Wed, 18 Apr 2012 00:16:03 +0530
+Subject: [PATCH 13/18] usb: musb: cppi41: fix zero byte OUT issue
+
+Fixes ZERO byte transfer in tx direction which was not being done in DMA mode.
+Used PIO mode for all zero byte tx transfer.
+---
+ drivers/usb/musb/musb_host.c |   12 +++++++++++-
+ 1 files changed, 11 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index 7545a65..8981586 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -761,6 +761,8 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
+ 	void __iomem		*epio = hw_ep->regs;
+ 	struct musb_qh		*qh = musb_ep_get_qh(hw_ep, !is_out);
+ 	u16			packet_sz = qh->maxpacket;
++	u8			use_dma = 1;
++	u16			csr;
+ 
+ 	dev_dbg(musb->controller, "%s hw%d urb %p spd%d dev%d ep%d%s "
+ 				"h_addr%02x h_port%02x bytes %d\n",
+@@ -772,9 +774,17 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
+ 
+ 	musb_ep_select(musb, mbase, epnum);
+ 
++	if (is_out && !len) {
++		use_dma = 0;
++		csr = musb_readw(epio, MUSB_TXCSR);
++		csr &= ~MUSB_TXCSR_DMAENAB;
++		musb_writew(epio, MUSB_TXCSR, csr);
++		hw_ep->tx_channel = NULL;
++	}
++
+ 	/* candidate for DMA? */
+ 	dma_controller = musb->dma_controller;
+-	if (is_dma_capable() && epnum && dma_controller) {
++	if (use_dma && is_dma_capable() && epnum && dma_controller) {
+ 		dma_channel = is_out ? hw_ep->tx_channel : hw_ep->rx_channel;
+ 		if (!dma_channel) {
+ 			dma_channel = dma_controller->channel_alloc(
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0014-usb-musb-host-fix-for-urb-error-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0014-usb-musb-host-fix-for-urb-error-handling.patch
new file mode 100644
index 0000000..8831c2c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0014-usb-musb-host-fix-for-urb-error-handling.patch
@@ -0,0 +1,66 @@
+From 984969ee49797eadbfd4ca72f1d55c6ac52b4db6 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 15:56:37 +0530
+Subject: [PATCH 14/18] usb: musb: host: fix for urb error handling
+
+Fixes below two issues related urb error handling
+
+1) Handling incomplete transfer when short packet not expected
+
+2) Do not start next urb when current urb has failed, this is
+   because stack will unlink/dequeue remaining urbs. Programming
+   the next urb will endup in urb completion because of expected
+   error (cause of current urb failure) interrupts and interfere
+   with urb dequeue initiated by stack and cause a crash.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+Signed-off-by: Visuvanadan Pasupathy <vichu@ti.com>
+---
+ drivers/usb/musb/musb_host.c |   24 +++++++++++++++++++++---
+ 1 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index 8981586..13520ee 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -481,7 +481,14 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
+ 		}
+ 	}
+ 
+-	if (qh != NULL && qh->is_ready) {
++	/* we should not start next urb when current urb
++	 * has failed, this is because stack will unlink/dequeue
++	 * remaining urbs. Programming the next urb will endup in
++	 * urb completion because of expected error (cause of current
++	 * urb failure) interrupts and interfere with urb dequeue
++	 * initiated by stack and cause a crash.
++	 */
++	if (status == 0 && qh != NULL && qh->is_ready) {
+ 		dev_dbg(musb->controller, "... next ep%d %cX urb %p\n",
+ 		    hw_ep->epnum, is_in ? 'R' : 'T', next_urb(qh));
+ 		musb_start_urb(musb, is_in, qh);
+@@ -1891,8 +1898,19 @@ finish:
+ 	urb->actual_length += xfer_len;
+ 	qh->offset += xfer_len;
+ 	if (done) {
+-		if (urb->status == -EINPROGRESS)
+-			urb->status = status;
++		if (urb->status == -EINPROGRESS) {
++			/* If short packet is not expected any transfer length
++			 * less than actual length is an error, hence
++			 * set urb status to -EREMOTEIO
++			 */
++			if ((urb->status == -EINPROGRESS)
++				&& (urb->transfer_flags & URB_SHORT_NOT_OK)
++				&& (urb->actual_length
++					< urb->transfer_buffer_length))
++				urb->status = -EREMOTEIO;
++			else
++				urb->status = status;
++		}
+ 		musb_advance_schedule(musb, urb, hw_ep, USB_DIR_IN);
+ 	}
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0015-usb-musb-cppi41-txdma-flushfifo-fixes-during-channel.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0015-usb-musb-cppi41-txdma-flushfifo-fixes-during-channel.patch
new file mode 100644
index 0000000..4bf3144
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0015-usb-musb-cppi41-txdma-flushfifo-fixes-during-channel.patch
@@ -0,0 +1,50 @@
+From a67c22912417f2b4c22f063767405992e702efbe Mon Sep 17 00:00:00 2001
+From: Ravi B <ravibabu@ti.com>
+Date: Thu, 10 May 2012 17:05:41 +0530
+Subject: [PATCH 15/18] usb: musb: cppi41: txdma flushfifo fixes during
+ channel abort
+
+This patch fixes the flushfifo sequence during tx dma channel
+abort, the txfifo should be flushed only when the TXPKTRDY bit
+is set in TXCSR register.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/cppi41_dma.c |   14 +++++++++-----
+ 1 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index bf74cf3..4367e4f 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -1198,7 +1198,7 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 	void __iomem *reg_base, *epio;
+ 	unsigned long pd_addr;
+ 	u32 csr, td_reg;
+-	u8 ch_num, ep_num;
++	u8 ch_num, ep_num, i;
+ 
+ 	cppi_ch = container_of(channel, struct cppi41_channel, channel);
+ 	ch_num = cppi_ch->ch_num;
+@@ -1250,10 +1250,14 @@ static int cppi41_channel_abort(struct dma_channel *channel)
+ 		musb_writel(reg_base, cppi->teardown_reg_offs, td_reg);
+ 
+ 		/* Flush FIFO of the endpoint */
+-		csr  = musb_readw(epio, MUSB_TXCSR);
+-		csr |= MUSB_TXCSR_FLUSHFIFO | MUSB_TXCSR_H_WZC_BITS;
+-		musb_writew(epio, MUSB_TXCSR, csr);
+-		musb_writew(epio, MUSB_TXCSR, csr);
++		for (i = 0; i < 2; ++i) {
++			csr  = musb_readw(epio, MUSB_TXCSR);
++			if (csr & MUSB_TXCSR_TXPKTRDY) {
++				csr |= MUSB_TXCSR_FLUSHFIFO |
++					MUSB_TXCSR_H_WZC_BITS;
++				musb_writew(epio, MUSB_TXCSR, csr);
++			}
++		}
+ 	} else { /* Rx */
+ 		dprintk("Rx channel teardown, cppi_ch = %p\n", cppi_ch);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0016-usb-musb-cppi41-tx-dma-completion-fixes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0016-usb-musb-cppi41-tx-dma-completion-fixes.patch
new file mode 100644
index 0000000..9798397
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0016-usb-musb-cppi41-tx-dma-completion-fixes.patch
@@ -0,0 +1,41 @@
+From 2e3ec89c3e6cf54d83479d7437696343463c90e5 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 16:03:02 +0530
+Subject: [PATCH 16/18] usb: musb: cppi41: tx dma completion fixes
+
+Use spinlock_irqsave/restore only during txdma completion giveback.
+
+Signed-off-by: Ravi B <ravibabu@ti.com>
+---
+ drivers/usb/musb/cppi41_dma.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/musb/cppi41_dma.c b/drivers/usb/musb/cppi41_dma.c
+index 4367e4f..ea83f9a 100644
+--- a/drivers/usb/musb/cppi41_dma.c
++++ b/drivers/usb/musb/cppi41_dma.c
+@@ -1354,7 +1354,6 @@ void txdma_completion_work(struct work_struct *data)
+ 			u16 csr;
+ 
+ 			tx_ch = &cppi->tx_cppi_ch[index];
+-			spin_lock_irqsave(&musb->lock, flags);
+ 			if (tx_ch->tx_complete) {
+ 				/* Sometimes a EP can unregister from a DMA
+ 				 * channel while the data is still in the FIFO.
+@@ -1384,10 +1383,12 @@ void txdma_completion_work(struct work_struct *data)
+ 					tx_ch->channel.status =
+ 						MUSB_DMA_STATUS_FREE;
+ 					tx_ch->tx_complete = 0;
++					spin_lock_irqsave(&musb->lock, flags);
+ 					musb_dma_completion(musb, index+1, 1);
++					spin_unlock_irqrestore(&musb->lock,
++						flags);
+ 				}
+ 			}
+-			spin_unlock_irqrestore(&musb->lock, flags);
+ 
+ 			if (!resched)
+ 				cond_resched();
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0017-usb-musb-host-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0017-usb-musb-host-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch
new file mode 100644
index 0000000..c291207
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0017-usb-musb-host-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch
@@ -0,0 +1,30 @@
+From c336629a155593e443ba21a0734b3c519a61e560 Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Thu, 24 May 2012 16:31:27 +0530
+Subject: [PATCH 17/18] usb: musb: host: Flush RxFIFO only when RxPktRdy is
+ set
+
+This need to be done as per mentor core documentations.
+
+Signed-off-by: Ajay Kumar Gupta <ajay.gupta@ti.com>
+---
+ drivers/usb/musb/musb_host.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
+index 13520ee..f56fde2 100644
+--- a/drivers/usb/musb/musb_host.c
++++ b/drivers/usb/musb/musb_host.c
+@@ -507,7 +507,8 @@ static u16 musb_h_flush_rxfifo(struct musb_hw_ep *hw_ep, u16 csr)
+ 	 * ignore dma (various models),
+ 	 * leave toggle alone (may not have been saved yet)
+ 	 */
+-	csr |= MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_RXPKTRDY;
++	if (csr & MUSB_RXCSR_RXPKTRDY)
++		csr |= MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_RXPKTRDY;
+ 	csr &= ~(MUSB_RXCSR_H_REQPKT
+ 		| MUSB_RXCSR_H_AUTOREQ
+ 		| MUSB_RXCSR_AUTOCLEAR);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0018-usb-musb-ti81xx-fix-role-switching-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0018-usb-musb-ti81xx-fix-role-switching-issue.patch
new file mode 100644
index 0000000..d923f08
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/psp/0018-usb-musb-ti81xx-fix-role-switching-issue.patch
@@ -0,0 +1,65 @@
+From f2ddff7377332c9e18878aaa84456d01fcf1d39e Mon Sep 17 00:00:00 2001
+From: Ajay Kumar Gupta <ajay.gupta@ti.com>
+Date: Fri, 25 May 2012 11:59:20 +0530
+Subject: [PATCH 18/18] usb: musb: ti81xx: fix role switching issue
+
+Fixing the role switching issue seen when followed steps below:
+
+a) Configure port in OTG mode
+b) Connect MSC device through micro-A-plug to std-A-receptacle
+c) MSC enumerated and works fine.
+d) Disconnect MSC device and let cable be connected to port
+e) Now disconnect cable also
+f) Connect port to host PC using micro-B plug to std-A plug.
+e) PC doesn't recognise the gadget driver.
+---
+ drivers/usb/musb/ti81xx.c |   26 +++++++++++++++++++++-----
+ 1 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/musb/ti81xx.c b/drivers/usb/musb/ti81xx.c
+index 7e21c25..6b0eb9e 100644
+--- a/drivers/usb/musb/ti81xx.c
++++ b/drivers/usb/musb/ti81xx.c
+@@ -708,6 +708,12 @@ static void otg_timer(unsigned long _musb)
+ 		devctl = musb_readb(mregs, MUSB_DEVCTL);
+ 		if (devctl & MUSB_DEVCTL_HM) {
+ 			musb->xceiv->state = OTG_STATE_A_IDLE;
++		} else if ((devctl & MUSB_DEVCTL_SESSION) &&
++				!(devctl & MUSB_DEVCTL_BDEVICE)) {
++			mod_timer(&musb->otg_workaround,
++					jiffies + POLL_SECONDS * HZ);
++			musb_writeb(musb->mregs, MUSB_DEVCTL, devctl &
++				~MUSB_DEVCTL_SESSION);
+ 		} else {
+ 			mod_timer(&musb->otg_workaround,
+ 					jiffies + POLL_SECONDS * HZ);
+@@ -976,11 +982,21 @@ static irqreturn_t ti81xx_interrupt(int irq, void *hci)
+ 						jiffies + POLL_SECONDS * HZ);
+ 			WARNING("VBUS error workaround (delay coming)\n");
+ 		} else if (is_host_enabled(musb) && drvvbus) {
+-			musb->is_active = 1;
+-			MUSB_HST_MODE(musb);
+-			musb->xceiv->default_a = 1;
+-			musb->xceiv->state = OTG_STATE_A_WAIT_VRISE;
+-			del_timer(&musb->otg_workaround);
++			if ((devctl & MUSB_DEVCTL_SESSION) &&
++				!(devctl & MUSB_DEVCTL_BDEVICE) &&
++				!(devctl & MUSB_DEVCTL_HM)) {
++				dev_dbg(musb->controller,
++					"Only micro-A plug is connected\n");
++			} else {
++				if (musb->is_active)
++					del_timer(&musb->otg_workaround);
++				else
++					musb->is_active = 1;
++
++				MUSB_HST_MODE(musb);
++				musb->xceiv->default_a = 1;
++				musb->xceiv->state = OTG_STATE_A_WAIT_VRISE;
++			}
+ 		} else {
+ 			musb->is_active = 0;
+ 			MUSB_DEV_MODE(musb);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index f279b24..e51de2a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -38,6 +38,24 @@ PATCHES_OVER_PSP = " \
 	file://usb/0004-usb-gadget-udc-core-fix-asymmetric-calls-in-remove_d.patch \
 	file://usb/0005-usb-gadget-udc-core-fix-wrong-call-order.patch \
 	file://usb/0006-usb-gadget-udc-core-fix-incompatibility-with-dummy-h.patch \
+	file://psp/0001-ARM-OMAP-AM33XX-Add-missing-EMIF-register-offsets.patch \
+	file://psp/0002-ARM-OMAP-AM33XX-PM-Get-rid-of-hardcoded-resume-addre.patch \
+	file://psp/0003-ARM-OMAP-AM33XX-PM-Skip-DDR-PHY-reconfiguration-in-r.patch \
+	file://psp/0004-ARM-OMAP-AM33XX-PM-Save-and-restore-EMIF-registers.patch \
+	file://psp/0005-ARM-OMAP-AM33XX-PM-Wait-correctly-for-the-PLLs-to-re.patch \
+	file://psp/0006-ARM-OMAP-AM33XX-PM-Restore-the-PLLs-to-pre-suspend-s.patch \
+	file://psp/0007-ARM-OMAP-PM-AM33XX-Update-the-sleep-code-to-handle-D.patch \
+	file://psp/0008-usb-musb-update-babble-workaround-fix.patch \
+	file://psp/0009-usb-musb-ti81xx-print-the-usbss-revision-id-during-i.patch \
+	file://psp/0010-usb-musb-cppi41-enable-txfifo-empty-interrupt-logic.patch \
+	file://psp/0011-usb-musb-host-Flush-txfifo-only-if-TxPktRdy-bit-set.patch \
+	file://psp/0012-usb-musb-cppi41-use-dsb-to-make-sure-PDs-are-updated.patch \
+	file://psp/0013-usb-musb-cppi41-fix-zero-byte-OUT-issue.patch \
+	file://psp/0014-usb-musb-host-fix-for-urb-error-handling.patch \
+	file://psp/0015-usb-musb-cppi41-txdma-flushfifo-fixes-during-channel.patch \
+	file://psp/0016-usb-musb-cppi41-tx-dma-completion-fixes.patch \
+	file://psp/0017-usb-musb-host-Flush-RxFIFO-only-when-RxPktRdy-is-set.patch \
+	file://psp/0018-usb-musb-ti81xx-fix-role-switching-issue.patch \
 	file://3.2.1/0001-MAINTAINERS-stable-Update-address.patch \
 	file://3.2.1/0002-Documentation-Update-stable-address.patch \
 	file://3.2.1/0003-firmware-Fix-an-oops-on-reading-fw_priv-fw-in-sysfs-.patch \
-- 
1.7.10


