Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFDCAE0044A
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 23:06:32 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1645513eaa.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 23:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=5GHqBb+cT9k2vttkyTHtmJH6Vev9HENLi48lvfU01NE=;
	b=eSEf6ZAHwFU314xFhddHsW8x1q65KH6yYf6z/eb/+3GwuE52RqZ/btD0dK63k+/dF3
	HIxIM0/U4sTP0zAnc4vb7x1j/W2WKwDkFhinN5bhYu4d4Bisl87Opi9SEObCaRrudFg2
	d6+p2MWMjgotAqis5BfOQ1X8x7u1//lYvOVdP/+pC6IKAKbnRmw3Xm4SQDFMSXjnBz+7
	WEapWBxH7xVlQjlGRqqXv3cc4LGYzPOm5nHUgTPpaYmh4kH/VA4wosFGIpDsBv7/NjTV
	x/GbMPno0tG4XUPT8MgszJgT/bnBn362OMi6b4UD1x/3ODoE9m+ncHtomPYLA9UyWll+
	q9eQ==
Received: by 10.213.28.195 with SMTP id n3mr1772831ebc.122.1337666791754;
	Mon, 21 May 2012 23:06:31 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z5sm101285031eem.3.2012.05.21.23.06.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 23:06:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 22 May 2012 08:06:24 +0200
Message-Id: <1337666786-29921-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkHNHHTPiGoOLniizwA+xV1AXo0iaWF06bXM/dkyk82gVwu2eGHAiTLSICnF7R45e/uEXu7
Cc: denys@ti.com
Subject: [PATCH v2 1/3] linux-ti33x-psp 3.2: silence useless omap4 hwmod warning
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
X-List-Received-Date: Tue, 22 May 2012 06:06:33 -0000

This fixes the last remaining debug print shown when booting with 'quiet'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0044-omap-hwmod-silence-st_shift-error.patch   |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
new file mode 100644
index 0000000..7991f0a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
@@ -0,0 +1,33 @@
+From 4119ec2ea20b7ae4095049e9f192c751559fbb87 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 16 May 2012 17:57:31 +0200
+Subject: [PATCH] omap hwmod: silence st_shift error
+
+During boot the following error is shown:
+
+	[    0.545227] omap_hwmod: wkup_m3: wkup_m3: hwmod data error: OMAP4 does not support st_shift
+
+Since this PSP tree will never run on omap4 remove the print so people will stop getting scared by it.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/omap_hwmod.c |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
+index bc14f9f..a050699 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.c
++++ b/arch/arm/mach-omap2/omap_hwmod.c
+@@ -1343,9 +1343,6 @@ static int _deassert_hardreset(struct omap_hwmod *oh, const char *name)
+ 	 * Note: cpu_is_omap34xx is true for am33xx device as well.
+ 	 */
+ 	if (cpu_is_omap44xx() || cpu_is_am33xx()) {
+-		if (ohri.st_shift)
+-			pr_err("omap_hwmod: %s: %s: hwmod data error: OMAP4 does not support st_shift\n",
+-			       oh->name, name);
+ 		ret = omap4_prminst_deassert_hardreset(ohri.rst_shift,
+ 				  oh->clkdm->pwrdm.ptr->prcm_partition,
+ 				  oh->clkdm->pwrdm.ptr->prcm_offs,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 97c1cd0..0fe3d4f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -968,6 +968,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch \
 	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
     file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
+	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
 "
-- 
1.7.10


