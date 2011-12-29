Return-Path: <pabigot@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCE23E01276
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 03:24:14 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by iapp10 with SMTP id p10so31843300iap.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=9FNf/2cPxVVBarq6MpBhSowdNMHu/hOnTEkXmDZem2Q=;
	b=bqgzRkJhPJf4xmRVYhpxDv7t5b9Ni7UNBIk1mwp4b38vyoLdYvKRPgL8ymOKB/hQT6
	jb7STax0HIDbWURol4uDVGlUi9hRKJm1D6RGFVB3XKUKUtnuSLFDnGK1h+rFvv880nyv
	CZA8loii5ivIREvs7IhOprNCCmXCTA52rK784=
Received: by 10.50.187.233 with SMTP id fv9mr40593950igc.24.1325157853915;
	Thu, 29 Dec 2011 03:24:13 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id rc7sm78719471igb.0.2011.12.29.03.24.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 03:24:12 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Thu, 29 Dec 2011 05:24:05 -0600
Message-Id: <1325157845-23185-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [PATCH v2] u-boot 2011.12rc1: OMAP MMC: Add delay before waiting for status
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
X-List-Received-Date: Thu, 29 Dec 2011 11:24:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Peter A. Bigot" <bigotp@acm.org>

Pending upstream patch from http://patchwork.ozlabs.org/patch/132795/ is
required to successfully boot on xM.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Acked-by: Tom Rini <tom.rini@gmail.com>
---
 ...P-MMC-Add-delay-before-waiting-for-status.patch |   45 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.12.bb               |    3 +-
 2 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch b/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch
new file mode 100644
index 0000000..b334639
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch
@@ -0,0 +1,45 @@
+From patchwork Thu Dec 22 09:56:35 2011
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 8bit
+Subject: [U-Boot] OMAP MMC: Add delay before waiting for status
+Date: Wed, 21 Dec 2011 23:56:35 -0000
+From: =?utf-8?q?Andreas_M=C3=BCller_=3Cschnitzeltony=40gmx=2Ede=3E?=
+X-Patchwork-Id: 132795
+Message-Id: <1324547795-19678-1-git-send-email-schnitzeltony@gmx.de>
+To: u-boot@lists.denx.de
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
+
+---
+drivers/mmc/omap_hsmmc.c |    4 ++++
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
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 5a19066..d776c38 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r0"
+PR = "r1"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
@@ -17,6 +17,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            file://2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch \
            file://2011.12/0004-omap4-common-mount-root-RO.patch \
            file://2011.12/0005-omap4-common-use-ext4-by-default.patch \
+           file://2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
           "
 
 # v2011.12 tag
-- 
1.7.6.4


