Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9531AE0076C; Thu,  4 Sep 2014 08:41:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 480C0E006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 08:41:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBD00I64VK37370@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 04 Sep 2014 10:41:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 07D1720092; Thu,
	04 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 04 Sep 2014 11:40:50 -0400
Message-id: <1409845250-16306-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] linux-ti-staging: merge audio/display changes, drop local SGX-related patches
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
X-List-Received-Date: Thu, 04 Sep 2014 15:41:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...HACK-drm-fb_helper-enable-panning-support.patch | 51 ------------
 ...lcdc-add-vsync-callback-for-use-in-omaplf.patch | 96 ---------------------
 ...fix-the-ping-pong-dma-tearing-issue-seen-.patch | 97 ----------------------
 recipes-kernel/linux/linux-ti-staging_3.14.bb      | 12 +--
 4 files changed, 2 insertions(+), 254 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch
deleted file mode 100644
index e760248..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d9d8fea4c60b3a44e8660408eb9337413b108b15 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Thu, 24 Jul 2014 11:49:28 -0500
-Subject: [PATCH 1/6] HACK: drm/fb_helper: enable panning support
-
-Increase the size of the buffer that is created in the fbdev emulation
-helpers.  And fill in the var structure with the amount that was allocated.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- drivers/gpu/drm/drm_fb_cma_helper.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
-index 61b5a47..2e2c489 100644
---- a/drivers/gpu/drm/drm_fb_cma_helper.c
-+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
-@@ -25,6 +25,12 @@
- #include <drm/drm_fb_cma_helper.h>
- #include <linux/module.h>
- 
-+/*
-+ * number of buffers to allocate from CMA pool, often increased for
-+ * double/triple buffering
-+ */
-+#define DRM_NUM_FBDEV_BUFFERS 3
-+
- struct drm_fb_cma {
- 	struct drm_framebuffer		fb;
- 	struct drm_gem_cma_object	*obj[4];
-@@ -265,7 +271,7 @@ static int drm_fbdev_cma_create(struct drm_fb_helper *helper,
- 	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
- 
- 	mode_cmd.width = sizes->surface_width;
--	mode_cmd.height = sizes->surface_height;
-+	mode_cmd.height = sizes->surface_height * DRM_NUM_FBDEV_BUFFERS;
- 	mode_cmd.pitches[0] = sizes->surface_width * bytes_per_pixel;
- 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
- 		sizes->surface_depth);
-@@ -304,7 +310,7 @@ static int drm_fbdev_cma_create(struct drm_fb_helper *helper,
- 	}
- 
- 	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->depth);
--	drm_fb_helper_fill_var(fbi, helper, fb->width, fb->height);
-+	drm_fb_helper_fill_var(fbi, helper, fb->width, sizes->surface_height);
- 
- 	offset = fbi->var.xoffset * bytes_per_pixel;
- 	offset += fbi->var.yoffset * fb->pitches[0];
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch
deleted file mode 100644
index d154508..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From eaf6ac95a81612250d6bd5e2ed9da41e52aac444 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 11 Jul 2014 09:15:25 -0500
-Subject: [PATCH 2/6] HACK: drm/tilcdc: add vsync callback for use in omaplfb
- for gpu
-
-Add a vsync callback registration API that is identical to what was done
-for da8xx-fb.c.
-
-Need to find if there is a better way using the DRM infrastructure from
-kernel space.  Either that or change the userspace window manager stuff in
-the gpu libraries to make use of the DRM provided syncronization
-mechanisms.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 34 ++++++++++++++++++++++++++++++++++
- drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  5 +++++
- 2 files changed, 39 insertions(+)
-
-diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-index 4b6b139..bf94a0f 100644
---- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-@@ -37,6 +37,10 @@ struct tilcdc_crtc {
- 	/* for deferred fb unref's: */
- 	struct drm_flip_work unref_work;
- };
-+
-+static vsync_callback_t vsync_cb_handler;
-+static void *vsync_cb_arg;
-+
- #define to_tilcdc_crtc(x) container_of(x, struct tilcdc_crtc, base)
- 
- static void unref_worker(struct drm_flip_work *work, void *val)
-@@ -576,6 +580,32 @@ out:
- 	pm_runtime_put_sync(dev->dev);
- }
- 
-+int register_vsync_cb(vsync_callback_t handler, void *arg, int idx)
-+{
-+	if ((vsync_cb_handler == NULL) && (vsync_cb_arg == NULL)) {
-+		vsync_cb_arg = arg;
-+		vsync_cb_handler = handler;
-+	} else {
-+		return -EEXIST;
-+	}
-+
-+	return 0;
-+}
-+EXPORT_SYMBOL(register_vsync_cb);
-+
-+int unregister_vsync_cb(vsync_callback_t handler, void *arg, int idx)
-+{
-+	if ((vsync_cb_handler == handler) && (vsync_cb_arg == arg)) {
-+		vsync_cb_handler = NULL;
-+		vsync_cb_arg = NULL;
-+	} else {
-+		return -ENXIO;
-+	}
-+
-+	return 0;
-+}
-+EXPORT_SYMBOL(unregister_vsync_cb);
-+
- irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
- {
- 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-@@ -610,6 +640,10 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
- 		tilcdc_crtc->event = NULL;
- 		if (event)
- 			drm_send_vblank_event(dev, 0, event);
-+
-+		if (vsync_cb_handler)
-+			vsync_cb_handler(vsync_cb_arg);
-+
- 		spin_unlock_irqrestore(&dev->event_lock, flags);
- 
- 		if (dirty && !tilcdc_crtc->dirty)
-diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
-index 0938036..05269be 100644
---- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
-+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
-@@ -170,4 +170,9 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
- int tilcdc_crtc_mode_valid(struct drm_crtc *crtc, struct drm_display_mode *mode);
- int tilcdc_crtc_max_width(struct drm_crtc *crtc);
- 
-+/* used by SGX OMAPLFB drvier */
-+typedef void (*vsync_callback_t)(void *arg);
-+int register_vsync_cb(vsync_callback_t handler, void *arg, int idx);
-+int unregister_vsync_cb(vsync_callback_t handler, void *arg, int idx);
-+
- #endif /* __TILCDC_DRV_H__ */
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch
deleted file mode 100644
index b3d0466..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7b4400287144101f8c7bdf2a9fa45c82859177e2 Mon Sep 17 00:00:00 2001
-From: Darren Etheridge <detheridge@ti.com>
-Date: Fri, 18 Jul 2014 16:21:46 -0500
-Subject: [PATCH 3/6] drm/tilcdc: fix the ping-pong dma tearing issue seen on
- buffer flipping
-
-Update the DMA pointers during the pan display ioctl.  Borrowed from
-da8xx_fb.c update the scanout buffers immediately so the DMA ping/pong
-doesn't end up out of sync with what we really want it to DMA.
-
-Signed-off-by: Darren Etheridge <detheridge@ti.com>
----
- drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 36 +++++++++++++++++++++++++++++++-----
- 1 file changed, 31 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-index bf94a0f..cdea159 100644
---- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
-@@ -30,6 +30,8 @@ struct tilcdc_crtc {
- 	int dpms;
- 	wait_queue_head_t frame_done_wq;
- 	bool frame_done;
-+	spinlock_t irq_lock;
-+	int dma_completed_channel;
- 
- 	/* fb currently set to scanout 0/1: */
- 	struct drm_framebuffer *scanout[2];
-@@ -102,10 +104,23 @@ static void update_scanout(struct drm_crtc *crtc)
- 			(crtc->mode.vdisplay * fb->pitches[0]);
- 
- 	if (tilcdc_crtc->dpms == DRM_MODE_DPMS_ON) {
--		/* already enabled, so just mark the frames that need
--		 * updating and they will be updated on vblank:
-+		/*
-+		 * already enabled, so just mark the frames that need
-+		 * updating and they will be updated on vblank
-+		 * and update the inactive DMA channel immediately
-+		 * to avoid any tearing due to the DMA already starting
-+		 * on the pending dma buffer when we hit the vblank IRQ
- 		 */
--		tilcdc_crtc->dirty |= LCDC_END_OF_FRAME0 | LCDC_END_OF_FRAME1;
-+		if (tilcdc_crtc->dma_completed_channel == 0) {
-+			tilcdc_crtc->dirty |= LCDC_END_OF_FRAME1;
-+			set_scanout(crtc, 0);
-+		}
-+
-+		if (tilcdc_crtc->dma_completed_channel == 1) {
-+			tilcdc_crtc->dirty |= LCDC_END_OF_FRAME0;
-+			set_scanout(crtc, 1);
-+		}
-+
- 		drm_vblank_get(dev, 0);
- 	} else {
- 		/* not enabled yet, so update registers immediately: */
-@@ -612,6 +627,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
- 	struct drm_device *dev = crtc->dev;
- 	struct tilcdc_drm_private *priv = dev->dev_private;
- 	uint32_t stat = tilcdc_read_irqstatus(dev);
-+	unsigned long irq_flags;
- 
- 	if ((stat & LCDC_SYNC_LOST) && (stat & LCDC_FIFO_UNDERFLOW)) {
- 		stop(crtc);
-@@ -627,11 +643,19 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
- 
- 		tilcdc_clear_irqstatus(dev, stat);
- 
--		if (dirty & LCDC_END_OF_FRAME0)
-+		spin_lock_irqsave(&tilcdc_crtc->irq_lock, irq_flags);
-+
-+		if (dirty & LCDC_END_OF_FRAME0) {
- 			set_scanout(crtc, 0);
-+			tilcdc_crtc->dma_completed_channel = 0;
-+		}
- 
--		if (dirty & LCDC_END_OF_FRAME1)
-+		if (dirty & LCDC_END_OF_FRAME1) {
- 			set_scanout(crtc, 1);
-+			tilcdc_crtc->dma_completed_channel = 1;
-+		}
-+
-+		spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, irq_flags);
- 
- 		drm_handle_vblank(dev, 0);
- 
-@@ -707,6 +731,8 @@ struct drm_crtc *tilcdc_crtc_create(struct drm_device *dev)
- 		goto fail;
- 	}
- 
-+	spin_lock_init(&tilcdc_crtc->irq_lock);
-+
- 	ret = drm_crtc_init(dev, crtc, &tilcdc_crtc_funcs);
- 	if (ret < 0)
- 		goto fail;
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 2a458b7..4a613ad 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -44,11 +44,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "0627fb95826dbcaac164f051d7d0a694e59d709a"
+SRCREV = "4247372d2f38f7346e34063d38ac4adb3fe053c2"
 PV = "3.14.17"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -59,15 +59,7 @@ KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
-# Patches necessary to make SGX graphics work with this kernel version
-SGX_PATCHES = "file://sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch \
-               file://sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch \
-               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch"
-
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
            file://non-smp.cfg \
           "
-
-SRC_URI_append_ti33x = " ${SGX_PATCHES}"
-SRC_URI_append_ti43x = " ${SGX_PATCHES}"
-- 
2.0.4


