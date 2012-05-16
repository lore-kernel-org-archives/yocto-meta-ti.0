Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0268EE01206
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 06:27:05 -0700 (PDT)
Received: by weyr3 with SMTP id r3so580049wey.35
	for <meta-ti@yoctoproject.org>; Wed, 16 May 2012 06:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Zch1rOQoXKTrlrNVOsndvgkgK7pSLDdwCkIKkicLZTA=;
	b=DtvGKYuANpchc0dohv+/1Q7C/ouAjxfE9TTqb0rfg/8zBUMBwDjTYlZwWI9nkk78bR
	TTSYupWXxeD7tBJmLYl4xvqNHc2pzvuWxw/Rd6BH5a/KDpPw2bLGUeR8ZeMw0zZsTOVg
	zXIAbh28xD3HQCzTG8+JFK8HfJml+3O13v/8aywpRNXAPDe1MlauwWySJXB74xpy32hT
	b65ERltXGr+sLkA21sTdowKFD/Okopu71bwYvbW0J6N2KMdK/IH5rSINtUkB5AsyoPX1
	0cB3mi0PJgYTPjyfErrPB6A2PgzWY+JPSFv3HRVCcrb5txKjCW18bAEp70htgJEGaOG1
	fLFw==
Received: by 10.180.74.7 with SMTP id p7mr7955817wiv.20.1337174824572;
	Wed, 16 May 2012 06:27:04 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id m1sm18463931wic.6.2012.05.16.06.27.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 06:27:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 16 May 2012 15:27:00 +0200
Message-Id: <1337174820-22414-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmMckbTVTxhW8Tw6dYsDzJN4dxQYWEW1ynAmFA1NjGJG6d5csZl9PzmWF0LCUAZ7OZs0VgU
Cc: denys@ti.com
Subject: [PATCH] linux-ti33x-psp 3.2: make st7735fb DMA safe
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
X-List-Received-Date: Wed, 16 May 2012 13:27:06 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...rking-WIP-changes-to-make-DMA-safe-and-ad.patch |  143 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
new file mode 100644
index 0000000..5e4b6b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
@@ -0,0 +1,143 @@
+From 783a66842e956b2eb9d7dc379848fbf79a370bc8 Mon Sep 17 00:00:00 2001
+From: Matt Porter <mporter@ti.com>
+Date: Wed, 28 Mar 2012 23:35:44 -0400
+Subject: [PATCH] st7735fb: Working WIP changes to make DMA safe and add
+ endian fix
+
+This removes the "from the stack" allocation of 1 byte buffers
+that was a temporary thing and isn't dma safe. Now vmallocs the
+user buffer to be deferred I/O safe and kmallocs a swapped
+shadow buffer to support the byte swabbing hack to fix userspace
+limitations.
+
+The buffer allocation and endian hack code needs some serious
+cleanup as on big endian systems if would fail miserably atm.
+However, the LE path works for the moment so people can do something
+with the driver.
+
+Signed-off-by: Matt Porter <mporter@ti.com>
+---
+ drivers/video/st7735fb.c |   49 ++++++++++++++++++++++++++++++----------------
+ include/video/st7735fb.h |    2 +
+ 2 files changed, 34 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/video/st7735fb.c b/drivers/video/st7735fb.c
+index 500cc88..0931ca2 100644
+--- a/drivers/video/st7735fb.c
++++ b/drivers/video/st7735fb.c
+@@ -145,11 +145,9 @@ static struct fb_var_screeninfo st7735fb_var __devinitdata = {
+ 
+ static int st7735_write(struct st7735fb_par *par, u8 data)
+ {
+-	u8 txbuf[2]; /* allocation from stack must go */
++	par->buf[0] = data;
+ 
+-	txbuf[0] = data;
+-
+-	return spi_write(par->spi, &txbuf[0], 1);
++	return spi_write(par->spi, par->buf, 1);
+ }
+ 
+ static void st7735_write_data(struct st7735fb_par *par, u8 data)
+@@ -243,16 +241,17 @@ static void st7735_reset(struct st7735fb_par *par)
+ static void st7735fb_update_display(struct st7735fb_par *par)
+ {
+ 	int ret = 0;
+-	u8 *vmem = par->info->screen_base;
+-
+-	/*
+-		TODO:
+-		Allow a subset of pages to be passed in
+-		(for deferred I/O).  Check pages against
+-		pan display settings to see if they
+-		should be updated.
+-	*/
+-	/* For now, just write the full 40KiB on each update */
++	u16 *vmem;
++#ifdef __LITTLE_ENDIAN
++	int i;
++	u16 *vmem16 = (u16 *)par->info->screen_base;
++	vmem = par->ssbuf;
++
++	for (i=0; i<WIDTH*HEIGHT*BPP/8/2; i++)
++		vmem[i] = swab16(vmem16[i]);
++#else
++	vmem = (u16 *)par->info->screen_base;
++#endif
+ 
+ 	/* Set row/column data window */
+ 	st7735_set_addr_win(par, 0, 0, WIDTH-1, HEIGHT-1);
+@@ -261,7 +260,7 @@ static void st7735fb_update_display(struct st7735fb_par *par)
+ 	st7735_write_cmd(par, ST7735_RAMWR);
+ 
+ 	/* Blast framebuffer to ST7735 internal display RAM */
+-	ret = st7735_write_data_buf(par, vmem, WIDTH*HEIGHT*BPP/8);
++	ret = st7735_write_data_buf(par, (u8 *)vmem, WIDTH*HEIGHT*BPP/8);
+ 	if (ret < 0)
+ 		pr_err("%s: spi_write failed to update display buffer\n",
+ 			par->info->fix.id);
+@@ -369,7 +368,7 @@ static struct fb_ops st7735fb_ops = {
+ };
+ 
+ static struct fb_deferred_io st7735fb_defio = {
+-	.delay		= HZ,
++	.delay		= HZ/20,
+ 	.deferred_io	= st7735fb_deferred_io,
+ };
+ 
+@@ -395,7 +394,11 @@ static int __devinit st7735fb_probe (struct spi_device *spi)
+ 		return -EINVAL;
+ 	}
+ 
+-	vmem = vzalloc(vmem_size);
++#ifdef __LITTLE_ENDIAN
++	vmem = (u8 *)vmalloc(vmem_size);
++#else
++	vmem = (u8 *)kmalloc(vmem_size, GFP_KERNEL);
++#endif
+ 	if (!vmem)
+ 		return retval;
+ 
+@@ -431,6 +434,14 @@ static int __devinit st7735fb_probe (struct spi_device *spi)
+ 	par->spi = spi;
+ 	par->rst = pdata->rst_gpio;
+ 	par->dc = pdata->dc_gpio;
++	par->buf = kmalloc(1, GFP_KERNEL);
++
++#ifdef __LITTLE_ENDIAN
++	/* Allocated swapped shadow buffer */
++	par->ssbuf = kmalloc(vmem_size, GFP_KERNEL);
++	if (!par->ssbuf)
++		return retval;
++#endif
+ 
+ 	retval = register_framebuffer(info);
+ 	if (retval < 0)
+@@ -457,7 +468,11 @@ fbreg_fail:
+ 	framebuffer_release(info);
+ 
+ fballoc_fail:
++#ifdef __LITTLE_ENDIAN
+ 	vfree(vmem);
++#else
++	kfree(vmem);
++#endif
+ 
+ 	return retval;
+ }
+diff --git a/include/video/st7735fb.h b/include/video/st7735fb.h
+index 250f036..e99cd05 100644
+--- a/include/video/st7735fb.h
++++ b/include/video/st7735fb.h
+@@ -36,6 +36,8 @@ struct st7735fb_par {
+ 	struct fb_info *info;
+ 	int rst;
+ 	int dc;
++	u16 *ssbuf;
++	u8 *buf;
+ };
+ 
+ struct st7735fb_platform_data {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 05772b4..bb26c70 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "j+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -967,5 +967,6 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch \
 	file://beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch \
 	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
+    file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 "
-- 
1.7.10


