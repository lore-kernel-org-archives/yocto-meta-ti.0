Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C07FE00596
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 09:38:58 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so643538wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 09:38:56 -0800 (PST)
Received: by 10.180.94.97 with SMTP id db1mr5314093wib.16.1327599536859;
	Thu, 26 Jan 2012 09:38:56 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n3sm14671207wiz.9.2012.01.26.09.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 09:38:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 26 Jan 2012 18:38:52 +0100
Message-Id: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux-ti33x-psp 3.1: add dto patch to fix problems with various sd cards
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
X-List-Received-Date: Thu, 26 Jan 2012 17:38:58 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   34 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.1/0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
new file mode 100644
index 0000000..4fe037e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -0,0 +1,34 @@
+From d12058d27dddf60b36f5b2142ee999e55bddfff6 Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH 38/38] omap_hsmmc: Set dto to max value of 14 to avoid SD
+ Card timeouts
+
+This fixes MMC errors due to timeouts on certain SD Cards following suggestions
+to set dto to 14 by Jason Kridner and Steven Kipisz
+
+Details of the issue:
+http://talk.maemo.org/showthread.php?p=1000707#post1000707
+
+This fix was originally proposed by Sukumar Ghoral of TI.
+---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index 35505bd..0be77ec 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -1574,6 +1574,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 			dto = 14;
+ 	}
+ 
++	/* Set dto to max value of 14 to avoid SD Card timeouts */
++	dto = 14;
++
+ 	reg &= ~DTO_MASK;
+ 	reg |= dto << DTO_SHIFT;
+ 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index 84e5c3b..591731c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -62,6 +62,7 @@ PATCHES_OVER_PSP = " \
 	file://0035-beaglebone-add-structs-for-DVI-cape-LEDs.patch\
 	file://0036-beaglebone-update-LCD-cape-partnumber.patch \
     file://0037-beaglebone-compare-complete-partnumber-not-the-first.patch \
+	file://0038-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
 	"
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.2.5


