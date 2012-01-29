Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5A0EE00599
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 29 Jan 2012 05:51:08 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so2872273wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 29 Jan 2012 05:51:07 -0800 (PST)
Received: by 10.181.13.113 with SMTP id ex17mr21906297wid.15.1327845066947;
	Sun, 29 Jan 2012 05:51:06 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q2sm12071567wiy.7.2012.01.29.05.51.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 05:51:05 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sun, 29 Jan 2012 14:51:00 +0100
Message-Id: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
Subject: [PATCH] u-boot 2011.12: fix beagleboard C4 memory detection
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
X-List-Received-Date: Sun, 29 Jan 2012 13:51:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test results (which emberassingly enough lack an actual C4):

BeagleBoard B6:

	OMAP3530-GP ES2.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
	OMAP3 Beagle board + LPDDR/NAND
	I2C:   ready
	DRAM:  128 MiB
	NAND:  256 MiB
	[..]
	Beagle Rev Ax/Bx

BeagleBoard C3:

	OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
	OMAP3 Beagle board + LPDDR/NAND
	I2C:   ready
	DRAM:  256 MiB
	NAND:  256 MiB
	[..]
	Beagle Rev C1/C2/C3

BeagleBoard C5:

	OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mHz
	OMAP3 Beagle board + LPDDR/NAND
	I2C:   ready
	DRAM:  256 MiB
	NAND:  512 MiB
	[..]
	Beagle Rev C4

BeagleBoard xM A:

	OMAP3630/3730-GP ES1.1, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
	OMAP3 Beagle board + LPDDR/NAND
	I2C:   ready
	DRAM:  512 MiB
	NAND:  0 MiB
	[..]
	Beagle xM Rev A

BeagleBoard xM C:

	OMAP3630/3730-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
	OMAP3 Beagle board + LPDDR/NAND
	I2C:   ready
	DRAM:  512 MiB
	NAND:  0 MiB
	[..]
	Beagle xM Rev C

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...7-disable-L2-cache-in-cleanup_before_linu.patch |   25 -----------
 ...ard-mount-rootfs-RO-instead-of-RW-at-boot.patch |    4 +-
 ...gleboard-add-support-for-TCT-Beacon-board.patch |    4 +-
 ...-add-support-for-scanning-loop-through-ex.patch |    4 +-
 .../2011.12/0004-omap4-common-mount-root-RO.patch  |    4 +-
 .../0005-omap4-common-use-ext4-by-default.patch    |    4 +-
 ...P-MMC-Add-delay-before-waiting-for-status.patch |   44 +++++++++++++++++++
 .../2011.12/0007-config-Always-use-GNU-ld.patch    |   43 +++++++++++++++++++
 ...7-disable-L2-cache-in-cleanup_before_linu.patch |   25 +++++++++++
 ...Beagleboard-Correct-memory-size-on-rev-C4.patch |   37 ++++++++++++++++
 ...0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch |   37 ++++++++++++++++
 ...P-MMC-Add-delay-before-waiting-for-status.patch |   45 --------------------
 recipes-bsp/u-boot/u-boot_2011.12.bb               |   11 +++--
 13 files changed, 203 insertions(+), 84 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch
 delete mode 100644 recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch b/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
deleted file mode 100644
index ea94709..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9ac047a112d8c6fe25e71a78946dbe9d707abd98 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@opensdr.com>
-Date: Mon, 16 Jan 2012 09:45:11 -0500
-Subject: [PATCH] Revert "armv7: disable L2 cache in cleanup_before_linux()"
-
-This reverts commit dc7100f4080952798413fb63bb4134b22c57623a.
----
- arch/arm/cpu/armv7/cpu.c |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/arch/arm/cpu/armv7/cpu.c b/arch/arm/cpu/armv7/cpu.c
-index 662c496..091e3e0 100644
---- a/arch/arm/cpu/armv7/cpu.c
-+++ b/arch/arm/cpu/armv7/cpu.c
-@@ -65,7 +65,6 @@ int cleanup_before_linux(void)
- 	 * dcache_disable() in turn flushes the d-cache and disables MMU
- 	 */
- 	dcache_disable();
--	v7_outer_cache_disable();
- 
- 	/*
- 	 * After D-cache is flushed and before it is disabled there may
--- 
-1.7.6.5
-
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch b/recipes-bsp/u-boot/u-boot/2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch
index 07ab75b..02f91c5 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch
@@ -1,7 +1,7 @@
-From d0556964b6bd443e8b60d5c0b3326795a02cc8a7 Mon Sep 17 00:00:00 2001
+From e435374789db01c9499ec169b295496f039ec401 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 27 Nov 2011 14:43:58 +0100
-Subject: [PATCH 1/5] beagleboard: mount rootfs RO instead of RW at boot
+Subject: [PATCH 01/10] beagleboard: mount rootfs RO instead of RW at boot
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch b/recipes-bsp/u-boot/u-boot/2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch
index 5af34a1..df3a09e 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch
@@ -1,7 +1,7 @@
-From 28e5cc1f13d817f75638c72eae853e53510a1ab2 Mon Sep 17 00:00:00 2001
+From 7c1bb614d0235c69e118f0552cbf46047f557b8c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 8 Oct 2011 21:56:35 +0200
-Subject: [PATCH 2/5] beagleboard: add support for TCT Beacon board
+Subject: [PATCH 02/10] beagleboard: add support for TCT Beacon board
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
index 31c4063..71dd2bb 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
@@ -1,7 +1,7 @@
-From fe9c653a0b0a3fa49d269b697c2058a6a55aa42b Mon Sep 17 00:00:00 2001
+From c8c3b1adff56c49f20732846a7087e95f6916e61 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 27 Nov 2011 14:53:56 +0100
-Subject: [PATCH 3/5] beagleboard: add support for scanning loop-through expansionboards like the uLCD-lite
+Subject: [PATCH 03/10] beagleboard: add support for scanning loop-through expansionboards like the uLCD-lite
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0004-omap4-common-mount-root-RO.patch b/recipes-bsp/u-boot/u-boot/2011.12/0004-omap4-common-mount-root-RO.patch
index 0d3655d..ed340a0 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0004-omap4-common-mount-root-RO.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0004-omap4-common-mount-root-RO.patch
@@ -1,7 +1,7 @@
-From 90dfb660575f15ba736884139f35bfd4ba927468 Mon Sep 17 00:00:00 2001
+From e4ac25df241bc2f3e6e2b7116529e82dfa5aab00 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 8 Dec 2011 17:22:59 +0100
-Subject: [PATCH 4/5] omap4-common: mount root RO
+Subject: [PATCH 04/10] omap4-common: mount root RO
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0005-omap4-common-use-ext4-by-default.patch b/recipes-bsp/u-boot/u-boot/2011.12/0005-omap4-common-use-ext4-by-default.patch
index e28eae5..97dab04 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0005-omap4-common-use-ext4-by-default.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0005-omap4-common-use-ext4-by-default.patch
@@ -1,7 +1,7 @@
-From a1f9453f2450762249aa35bd5ae97150acc53eb2 Mon Sep 17 00:00:00 2001
+From 9e4679bdc5a2f3908f9d5e757c9706c0040e3643 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 8 Dec 2011 17:23:24 +0100
-Subject: [PATCH 5/5] omap4-common: use ext4 by default
+Subject: [PATCH 05/10] omap4-common: use ext4 by default
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch b/recipes-bsp/u-boot/u-boot/2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch
new file mode 100644
index 0000000..8429365
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch
@@ -0,0 +1,44 @@
+From 64e971ecd4bb1dec118b5687dfa7c57790922bba Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Wed, 21 Dec 2011 23:56:35 +0000
+Subject: [PATCH 06/10] OMAP MMC: Add delay before waiting for status
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Loading kernel from MMC created the following error message reproducable:
+
+| reading uImage
+| mmc_send_cmd: timedout waiting for stat!
+|
+| 2860468 bytes read
+
+Tested on overo with OMAP3530:
+* OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mHz
+  Die ID #470e000400000000040398d31402100c
+* OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
+  Die ID #112000040000000004035c140101b011
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ drivers/mmc/omap_hsmmc.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/omap_hsmmc.c b/drivers/mmc/omap_hsmmc.c
+index c38b9e6..ac91e5d 100644
+--- a/drivers/mmc/omap_hsmmc.c
++++ b/drivers/mmc/omap_hsmmc.c
+@@ -197,6 +197,10 @@ static int mmc_send_cmd(struct mmc *mmc, struct mmc_cmd *cmd,
+ 	unsigned int flags, mmc_stat;
+ 	ulong start;
+ 
++	/* Delay added before checking the status */
++	if (cmd->cmdidx == MMC_CMD_SEND_STATUS)
++		udelay(1); /* wait 1 us */
++
+ 	start = get_timer(0);
+ 	while ((readl(&mmc_base->pstate) & DATI_MASK) == DATI_CMDDIS) {
+ 		if (get_timer(0) - start > MAX_RETRY_MS) {
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch b/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
new file mode 100644
index 0000000..15f22b3
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0007-config-Always-use-GNU-ld.patch
@@ -0,0 +1,43 @@
+From 06fe8be6b5c70853c0e3fac93d7bba9cb3d0292f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2011 08:53:02 -0800
+Subject: [PATCH 07/10] config: Always use GNU ld
+
+This patch makes sure that we always use the GNU ld. u-boot uses certain
+construct e.g. OVERLAY which are not implemented in gold therefore it
+always needs GNU ld for linking. It works well if default linker in
+toolchain is GNU ld but in some cases we can have gold to be the
+default linker and also ship GNU ld but not as default in such cases
+its called $(PREFIX)ld.bfd, with this patch we make sure that if
+$(PREFIX)ld.bfd exists than we use that for our ld. This way it
+does not matter what the default ld is.
+
+Upstream-status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.mk |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index ddaa477..59b3e71 100644
+--- a/config.mk
++++ b/config.mk
+@@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1,$(CC_OPTIONS)),$1,\
+ 		$(if $(call cc-option-sys,$1),$1,$2)))
+ endif
+ 
++exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
++		then echo "$(1)"; else echo "$(2)"; fi; )
+ #
+ # Include the make variables (CC, etc...)
+ #
+ AS	= $(CROSS_COMPILE)as
+-LD	= $(CROSS_COMPILE)ld
++LD	= $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd", "$(CROSS_COMPILE)ld")
+ CC	= $(CROSS_COMPILE)gcc
+ CPP	= $(CC) -E
+ AR	= $(CROSS_COMPILE)ar
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch b/recipes-bsp/u-boot/u-boot/2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
new file mode 100644
index 0000000..9a13b69
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch
@@ -0,0 +1,25 @@
+From 076f5b5c65a0f0652f5ba8b5328c52c76e951aaa Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@opensdr.com>
+Date: Mon, 16 Jan 2012 09:45:11 -0500
+Subject: [PATCH 08/10] Revert "armv7: disable L2 cache in cleanup_before_linux()"
+
+This reverts commit dc7100f4080952798413fb63bb4134b22c57623a.
+---
+ arch/arm/cpu/armv7/cpu.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/cpu/armv7/cpu.c b/arch/arm/cpu/armv7/cpu.c
+index 662c496..091e3e0 100644
+--- a/arch/arm/cpu/armv7/cpu.c
++++ b/arch/arm/cpu/armv7/cpu.c
+@@ -65,7 +65,6 @@ int cleanup_before_linux(void)
+ 	 * dcache_disable() in turn flushes the d-cache and disables MMU
+ 	 */
+ 	dcache_disable();
+-	v7_outer_cache_disable();
+ 
+ 	/*
+ 	 * After D-cache is flushed and before it is disabled there may
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch b/recipes-bsp/u-boot/u-boot/2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch
new file mode 100644
index 0000000..be95db6
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch
@@ -0,0 +1,37 @@
+From 588d0e7259e17f302cb79d12ed0f47410a0d8697 Mon Sep 17 00:00:00 2001
+From: robertcnelson@gmail.com <robertcnelson@gmail.com>
+Date: Fri, 27 Jan 2012 07:09:42 +0000
+Subject: [PATCH 09/10] Beagleboard: Correct memory size on rev C4
+
+Beagleboard: Correct memory size on rev C4
+
+The logic for the rev C4 boards was missing one of the cases
+(variant with Micron NAND and 2x128MB).
+
+Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ board/ti/beagle/beagle.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
+index 5ea50d1..4555977 100644
+--- a/board/ti/beagle/beagle.c
++++ b/board/ti/beagle/beagle.c
+@@ -169,6 +169,13 @@ void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 *rfr_ctrl,
+ 			*ctrlb = NUMONYX_V_ACTIMB_165;
+ 			*rfr_ctrl = SDP_3430_SDRC_RFR_CTRL_165MHz;
+ 			break;
++		} else if (pop_mfr == NAND_MFR_MICRON && pop_id == 0xba) {
++			/* Beagleboard Rev C4, 512MB Nand/256MB DDR*/
++			*mcfg = MICRON_V_MCFG_165(128 << 20);
++			*ctrla = MICRON_V_ACTIMA_165;
++			*ctrlb = MICRON_V_ACTIMB_165;
++			*rfr_ctrl = SDP_3430_SDRC_RFR_CTRL_165MHz;
++			break;
+ 		} else if (pop_mfr == NAND_MFR_MICRON && pop_id == 0xbc) {
+ 			/* Beagleboard Rev C5, 256MB DDR */
+ 			*mcfg = MICRON_V_MCFG_200(256 << 20);
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch b/recipes-bsp/u-boot/u-boot/2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch
new file mode 100644
index 0000000..b9b61e5
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch
@@ -0,0 +1,37 @@
+From 351fcc22c10beb005f589584b91298269a81aa52 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@ti.com>
+Date: Wed, 18 Jan 2012 08:28:50 +0000
+Subject: [PATCH 10/10] OMAP3: Correct get_sdr_cs_offset mask
+
+OMAP3: Correct get_sdr_cs_offset mask
+
+The function get_sdr_cs_offset reads the CS_CFG register in the SDRC
+to determine where CS1 is mapped to.  make_cs1_contiguous() will set
+CS1 to follow after CS0.  The CS_CFG register has values in bits 9:8
+and 3:0 but we had erroneously been testing 5:4 and 3:0 resulting in
+incorrect offsets on platforms with less than 128MB as 3:0 describe
+128MB hunks and 9:8 describe 32MB offsets after the 128MB hunk.
+
+Tested-by: Grant Erickson <marathon96@gmail.com>
+Signed-off-by: Tom Rini <trini@ti.com>
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/cpu/armv7/omap3/sdrc.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/cpu/armv7/omap3/sdrc.c b/arch/arm/cpu/armv7/omap3/sdrc.c
+index a27b4b1..91f42c0 100644
+--- a/arch/arm/cpu/armv7/omap3/sdrc.c
++++ b/arch/arm/cpu/armv7/omap3/sdrc.c
+@@ -102,7 +102,7 @@ u32 get_sdr_cs_offset(u32 cs)
+ 		return 0;
+ 
+ 	offset = readl(&sdrc_base->cs_cfg);
+-	offset = (offset & 15) << 27 | (offset & 0x30) << 17;
++	offset = (offset & 15) << 27 | (offset & 0x300) << 17;
+ 
+ 	return offset;
+ }
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch b/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch
deleted file mode 100644
index b334639..0000000
--- a/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From patchwork Thu Dec 22 09:56:35 2011
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 8bit
-Subject: [U-Boot] OMAP MMC: Add delay before waiting for status
-Date: Wed, 21 Dec 2011 23:56:35 -0000
-From: =?utf-8?q?Andreas_M=C3=BCller_=3Cschnitzeltony=40gmx=2Ede=3E?=
-X-Patchwork-Id: 132795
-Message-Id: <1324547795-19678-1-git-send-email-schnitzeltony@gmx.de>
-To: u-boot@lists.denx.de
-
-Loading kernel from MMC created the following error message reproducable:
-
-| reading uImage
-| mmc_send_cmd: timedout waiting for stat!
-|
-| 2860468 bytes read
-
-Tested on overo with OMAP3530:
-* OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mHz
-  Die ID #470e000400000000040398d31402100c
-* OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
-  Die ID #112000040000000004035c140101b011
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
-
----
-drivers/mmc/omap_hsmmc.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/mmc/omap_hsmmc.c b/drivers/mmc/omap_hsmmc.c
-index c38b9e6..ac91e5d 100644
---- a/drivers/mmc/omap_hsmmc.c
-+++ b/drivers/mmc/omap_hsmmc.c
-@@ -197,6 +197,10 @@ static int mmc_send_cmd(struct mmc *mmc, struct mmc_cmd *cmd,
- 	unsigned int flags, mmc_stat;
- 	ulong start;
- 
-+	/* Delay added before checking the status */
-+	if (cmd->cmdidx == MMC_CMD_SEND_STATUS)
-+		udelay(1); /* wait 1 us */
-+
- 	start = get_timer(0);
- 	while ((readl(&mmc_base->pstate) & DATI_MASK) == DATI_CMDDIS) {
- 		if (get_timer(0) - start > MAX_RETRY_MS) {
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 4e50edb..3610837 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,13 +6,13 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r3"
+PR = "r4"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
 
 # Non-omap4 platforms need outer cache turned on
-CACHEFIX = "file://2011.12/0001-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
+CACHEFIX = "file://2011.12/0008-Revert-armv7-disable-L2-cache-in-cleanup_before_linu.patch"
 CACHEFIX_omap4 = ""
 
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
@@ -21,11 +21,14 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch \
            file://2011.12/0004-omap4-common-mount-root-RO.patch \
            file://2011.12/0005-omap4-common-use-ext4-by-default.patch \
-           file://2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
-           file://0001-config-Always-use-GNU-ld.patch \
+           file://2011.12/0006-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
+           file://2011.12/0007-config-Always-use-GNU-ld.patch \
            ${CACHEFIX} \
+           file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
+           file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
           "
 
+
 # v2011.12 tag
 SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
 
-- 
1.7.2.5


