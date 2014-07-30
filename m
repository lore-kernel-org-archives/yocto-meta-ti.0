Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C17C6E00862; Wed, 30 Jul 2014 11:29:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2541EE00781
	for <meta-ti@yoctoproject.org>; Wed, 30 Jul 2014 11:29:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6UITXfB009519;
	Wed, 30 Jul 2014 13:29:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6UITX9L007832;
	Wed, 30 Jul 2014 13:29:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 30 Jul 2014 13:29:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6UITVIv026661;
	Wed, 30 Jul 2014 13:29:32 -0500
Date: Wed, 30 Jul 2014 14:29:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140730182927.GW15788@edge>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6EE55D@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6EE55D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Wed, 30 Jul 2014 18:29:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 30, 2014 at 06:00:47PM +0000, Cooper Jr., Franklin wrote:
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> Although we really need to move away from having these kernel config 
> fragments within OE and not pushed back to the kernel. I understand the sgx 
> stuff is currently a work in progress but just something for the future 
> before we have an official "release".

All the other config fragments are in the kernel, BTW. This is an external 
patching, hence the external config fragments. Unless all the changes are 
accepted to the kernel, we can't have the config in there.


> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Tuesday, July 29, 2014 8:35 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to
> > make graphics work with 3.14
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg | 24 ++++++  ...HACK-drm-
> > fb_helper-enable-panning-support.patch | 51 ++++++++++++  ...lcdc-add-
> > vsync-callback-for-use-in-omaplf.patch | 96 +++++++++++++++++++++  ...fix-
> > the-ping-pong-dma-tearing-issue-seen-.patch | 97 ++++++++++++++++++++++
> > ...se-pdata-quirks-for-sgx-deassert_hardrese.patch | 86 +++++++++++++++++++
> >  .../sgx/0005-ARM-dts-am437x-add-SGX-node.patch     | 41 +++++++++
> >  .../0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch  | 42 ++++++++++
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb      | 20 +++--
> >  8 files changed, 452 insertions(+), 5 deletions(-)  create mode 100644 recipes-
> > kernel/linux/linux-ti-staging-3.14/sgx.cfg
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-
> > HACK-drm-fb_helper-enable-panning-support.patch
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-
> > HACK-drm-tilcdc-add-vsync-callback-for-use-in-omaplf.patch
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-
> > tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-.patch
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-
> > OMAP2-Use-pdata-quirks-for-sgx-deassert_hardrese.patch
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-
> > dts-am437x-add-SGX-node.patch
> >  create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-
> > dts-am33xx-add-DT-node-for-gpu.patch
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg b/recipes-
> > kernel/linux/linux-ti-staging-3.14/sgx.cfg
> > new file mode 100644
> > index 0000000..0291779
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx.cfg
> > @@ -0,0 +1,24 @@
> > +##################################################
> > +# SGX Graphics config options
> > +##################################################
> > +CONFIG_DMA_SHARED_BUFFER=y
> > +CONFIG_TI_ST=n
> > +CONFIG_INPUT_TOUCHSCREEN=y
> > +CONFIG_TOUCHSCREEN_ADS7846=y
> > +CONFIG_I2C_ALGOBIT=y
> > +CONFIG_MFD_TPS65218=n
> > +CONFIG_DRM=y
> > +CONFIG_DRM_KMS_HELPER=y
> > +CONFIG_DRM_KMS_FB_HELPER=y
> > +CONFIG_DRM_GEM_CMA_HELPER=y
> > +CONFIG_DRM_KMS_CMA_HELPER=y
> > +CONFIG_DRM_I2C_NXP_TDA998X=y
> > +CONFIG_DRM_TILCDC=y
> > +CONFIG_FB_SYS_FILLRECT=y
> > +CONFIG_FB_SYS_COPYAREA=y
> > +CONFIG_FB_SYS_IMAGEBLIT=y
> > +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> > +CONFIG_HDMI=y
> > +CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> > +CONFIG_SND_DAVINCI_SOC=m
> > +CONFIG_SND_SIMPLE_CARD=n
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-
> > fb_helper-enable-panning-support.patch b/recipes-kernel/linux/linux-ti-
> > staging-3.14/sgx/0001-HACK-drm-fb_helper-enable-panning-support.patch
> > new file mode 100644
> > index 0000000..e760248
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0001-HACK-drm-fb_he
> > +++ lper-enable-panning-support.patch
> > @@ -0,0 +1,51 @@
> > +From d9d8fea4c60b3a44e8660408eb9337413b108b15 Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Thu, 24 Jul 2014 11:49:28 -0500
> > +Subject: [PATCH 1/6] HACK: drm/fb_helper: enable panning support
> > +
> > +Increase the size of the buffer that is created in the fbdev emulation
> > +helpers.  And fill in the var structure with the amount that was allocated.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + drivers/gpu/drm/drm_fb_cma_helper.c | 10 ++++++++--
> > + 1 file changed, 8 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c
> > +b/drivers/gpu/drm/drm_fb_cma_helper.c
> > +index 61b5a47..2e2c489 100644
> > +--- a/drivers/gpu/drm/drm_fb_cma_helper.c
> > ++++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> > +@@ -25,6 +25,12 @@
> > + #include <drm/drm_fb_cma_helper.h>
> > + #include <linux/module.h>
> > +
> > ++/*
> > ++ * number of buffers to allocate from CMA pool, often increased for
> > ++ * double/triple buffering
> > ++ */
> > ++#define DRM_NUM_FBDEV_BUFFERS 3
> > ++
> > + struct drm_fb_cma {
> > + 	struct drm_framebuffer		fb;
> > + 	struct drm_gem_cma_object	*obj[4];
> > +@@ -265,7 +271,7 @@ static int drm_fbdev_cma_create(struct
> > drm_fb_helper *helper,
> > + 	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
> > +
> > + 	mode_cmd.width = sizes->surface_width;
> > +-	mode_cmd.height = sizes->surface_height;
> > ++	mode_cmd.height = sizes->surface_height *
> > DRM_NUM_FBDEV_BUFFERS;
> > + 	mode_cmd.pitches[0] = sizes->surface_width * bytes_per_pixel;
> > + 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes-
> > >surface_bpp,
> > + 		sizes->surface_depth);
> > +@@ -304,7 +310,7 @@ static int drm_fbdev_cma_create(struct
> > drm_fb_helper *helper,
> > + 	}
> > +
> > + 	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->depth);
> > +-	drm_fb_helper_fill_var(fbi, helper, fb->width, fb->height);
> > ++	drm_fb_helper_fill_var(fbi, helper, fb->width,
> > ++sizes->surface_height);
> > +
> > + 	offset = fbi->var.xoffset * bytes_per_pixel;
> > + 	offset += fbi->var.yoffset * fb->pitches[0];
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-
> > tilcdc-add-vsync-callback-for-use-in-omaplf.patch b/recipes-kernel/linux/linux-
> > ti-staging-3.14/sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-
> > omaplf.patch
> > new file mode 100644
> > index 0000000..d154508
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0002-HACK-drm-tilcd
> > +++ c-add-vsync-callback-for-use-in-omaplf.patch
> > @@ -0,0 +1,96 @@
> > +From eaf6ac95a81612250d6bd5e2ed9da41e52aac444 Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Fri, 11 Jul 2014 09:15:25 -0500
> > +Subject: [PATCH 2/6] HACK: drm/tilcdc: add vsync callback for use in
> > +omaplfb  for gpu
> > +
> > +Add a vsync callback registration API that is identical to what was
> > +done for da8xx-fb.c.
> > +
> > +Need to find if there is a better way using the DRM infrastructure from
> > +kernel space.  Either that or change the userspace window manager stuff
> > +in the gpu libraries to make use of the DRM provided syncronization
> > +mechanisms.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 34
> > +++++++++++++++++++++++++++++++++++
> > + drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  5 +++++
> > + 2 files changed, 39 insertions(+)
> > +
> > +diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +index 4b6b139..bf94a0f 100644
> > +--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > ++++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +@@ -37,6 +37,10 @@ struct tilcdc_crtc {
> > + 	/* for deferred fb unref's: */
> > + 	struct drm_flip_work unref_work;
> > + };
> > ++
> > ++static vsync_callback_t vsync_cb_handler; static void *vsync_cb_arg;
> > ++
> > + #define to_tilcdc_crtc(x) container_of(x, struct tilcdc_crtc, base)
> > +
> > + static void unref_worker(struct drm_flip_work *work, void *val) @@
> > +-576,6 +580,32 @@ out:
> > + 	pm_runtime_put_sync(dev->dev);
> > + }
> > +
> > ++int register_vsync_cb(vsync_callback_t handler, void *arg, int idx) {
> > ++	if ((vsync_cb_handler == NULL) && (vsync_cb_arg == NULL)) {
> > ++		vsync_cb_arg = arg;
> > ++		vsync_cb_handler = handler;
> > ++	} else {
> > ++		return -EEXIST;
> > ++	}
> > ++
> > ++	return 0;
> > ++}
> > ++EXPORT_SYMBOL(register_vsync_cb);
> > ++
> > ++int unregister_vsync_cb(vsync_callback_t handler, void *arg, int idx)
> > ++{
> > ++	if ((vsync_cb_handler == handler) && (vsync_cb_arg == arg)) {
> > ++		vsync_cb_handler = NULL;
> > ++		vsync_cb_arg = NULL;
> > ++	} else {
> > ++		return -ENXIO;
> > ++	}
> > ++
> > ++	return 0;
> > ++}
> > ++EXPORT_SYMBOL(unregister_vsync_cb);
> > ++
> > + irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)  {
> > + 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc); @@ -610,6
> > ++640,10 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
> > + 		tilcdc_crtc->event = NULL;
> > + 		if (event)
> > + 			drm_send_vblank_event(dev, 0, event);
> > ++
> > ++		if (vsync_cb_handler)
> > ++			vsync_cb_handler(vsync_cb_arg);
> > ++
> > + 		spin_unlock_irqrestore(&dev->event_lock, flags);
> > +
> > + 		if (dirty && !tilcdc_crtc->dirty)
> > +diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> > +b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> > +index 0938036..05269be 100644
> > +--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> > ++++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> > +@@ -170,4 +170,9 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc
> > +*crtc,  int tilcdc_crtc_mode_valid(struct drm_crtc *crtc, struct
> > +drm_display_mode *mode);  int tilcdc_crtc_max_width(struct drm_crtc
> > +*crtc);
> > +
> > ++/* used by SGX OMAPLFB drvier */
> > ++typedef void (*vsync_callback_t)(void *arg); int
> > ++register_vsync_cb(vsync_callback_t handler, void *arg, int idx); int
> > ++unregister_vsync_cb(vsync_callback_t handler, void *arg, int idx);
> > ++
> > + #endif /* __TILCDC_DRV_H__ */
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix-
> > the-ping-pong-dma-tearing-issue-seen-.patch b/recipes-kernel/linux/linux-ti-
> > staging-3.14/sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-
> > .patch
> > new file mode 100644
> > index 0000000..b3d0466
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0003-drm-tilcdc-fix
> > +++ -the-ping-pong-dma-tearing-issue-seen-.patch
> > @@ -0,0 +1,97 @@
> > +From 7b4400287144101f8c7bdf2a9fa45c82859177e2 Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Fri, 18 Jul 2014 16:21:46 -0500
> > +Subject: [PATCH 3/6] drm/tilcdc: fix the ping-pong dma tearing issue
> > +seen on  buffer flipping
> > +
> > +Update the DMA pointers during the pan display ioctl.  Borrowed from
> > +da8xx_fb.c update the scanout buffers immediately so the DMA ping/pong
> > +doesn't end up out of sync with what we really want it to DMA.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 36
> > ++++++++++++++++++++++++++++++++-----
> > + 1 file changed, 31 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +index bf94a0f..cdea159 100644
> > +--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > ++++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +@@ -30,6 +30,8 @@ struct tilcdc_crtc {
> > + 	int dpms;
> > + 	wait_queue_head_t frame_done_wq;
> > + 	bool frame_done;
> > ++	spinlock_t irq_lock;
> > ++	int dma_completed_channel;
> > +
> > + 	/* fb currently set to scanout 0/1: */
> > + 	struct drm_framebuffer *scanout[2];
> > +@@ -102,10 +104,23 @@ static void update_scanout(struct drm_crtc *crtc)
> > + 			(crtc->mode.vdisplay * fb->pitches[0]);
> > +
> > + 	if (tilcdc_crtc->dpms == DRM_MODE_DPMS_ON) {
> > +-		/* already enabled, so just mark the frames that need
> > +-		 * updating and they will be updated on vblank:
> > ++		/*
> > ++		 * already enabled, so just mark the frames that need
> > ++		 * updating and they will be updated on vblank
> > ++		 * and update the inactive DMA channel immediately
> > ++		 * to avoid any tearing due to the DMA already starting
> > ++		 * on the pending dma buffer when we hit the vblank IRQ
> > + 		 */
> > +-		tilcdc_crtc->dirty |= LCDC_END_OF_FRAME0 |
> > LCDC_END_OF_FRAME1;
> > ++		if (tilcdc_crtc->dma_completed_channel == 0) {
> > ++			tilcdc_crtc->dirty |= LCDC_END_OF_FRAME1;
> > ++			set_scanout(crtc, 0);
> > ++		}
> > ++
> > ++		if (tilcdc_crtc->dma_completed_channel == 1) {
> > ++			tilcdc_crtc->dirty |= LCDC_END_OF_FRAME0;
> > ++			set_scanout(crtc, 1);
> > ++		}
> > ++
> > + 		drm_vblank_get(dev, 0);
> > + 	} else {
> > + 		/* not enabled yet, so update registers immediately: */ @@ -
> > 612,6
> > ++627,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
> > + 	struct drm_device *dev = crtc->dev;
> > + 	struct tilcdc_drm_private *priv = dev->dev_private;
> > + 	uint32_t stat = tilcdc_read_irqstatus(dev);
> > ++	unsigned long irq_flags;
> > +
> > + 	if ((stat & LCDC_SYNC_LOST) && (stat & LCDC_FIFO_UNDERFLOW)) {
> > + 		stop(crtc);
> > +@@ -627,11 +643,19 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc
> > +*crtc)
> > +
> > + 		tilcdc_clear_irqstatus(dev, stat);
> > +
> > +-		if (dirty & LCDC_END_OF_FRAME0)
> > ++		spin_lock_irqsave(&tilcdc_crtc->irq_lock, irq_flags);
> > ++
> > ++		if (dirty & LCDC_END_OF_FRAME0) {
> > + 			set_scanout(crtc, 0);
> > ++			tilcdc_crtc->dma_completed_channel = 0;
> > ++		}
> > +
> > +-		if (dirty & LCDC_END_OF_FRAME1)
> > ++		if (dirty & LCDC_END_OF_FRAME1) {
> > + 			set_scanout(crtc, 1);
> > ++			tilcdc_crtc->dma_completed_channel = 1;
> > ++		}
> > ++
> > ++		spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, irq_flags);
> > +
> > + 		drm_handle_vblank(dev, 0);
> > +
> > +@@ -707,6 +731,8 @@ struct drm_crtc *tilcdc_crtc_create(struct drm_device
> > *dev)
> > + 		goto fail;
> > + 	}
> > +
> > ++	spin_lock_init(&tilcdc_crtc->irq_lock);
> > ++
> > + 	ret = drm_crtc_init(dev, crtc, &tilcdc_crtc_funcs);
> > + 	if (ret < 0)
> > + 		goto fail;
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-
> > Use-pdata-quirks-for-sgx-deassert_hardrese.patch b/recipes-
> > kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-
> > sgx-deassert_hardrese.patch
> > new file mode 100644
> > index 0000000..b0d5d40
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0004-ARM-OMAP2-Use-
> > +++ pdata-quirks-for-sgx-deassert_hardrese.patch
> > @@ -0,0 +1,86 @@
> > +From 761dbda366d46ff007e04c09dd2deeee5073d090 Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Fri, 25 Jul 2014 16:09:53 -0500
> > +Subject: [PATCH 4/6] ARM: OMAP2+: Use pdata-quirks for sgx
> > +deassert_hardreset
> > +
> > +Use pdata_quirks to provide platform data to the sgx driver.
> > +The data that is provided includes:
> > +
> > +1) Function pointers for the driver to use to reset the h/w block.
> > +2) The reset name that matches with what is used in hwmod.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + arch/arm/mach-omap2/pdata-quirks.c    | 12 ++++++++++++
> > + include/linux/platform_data/gfx-sgx.h | 22 ++++++++++++++++++++++
> > + 2 files changed, 34 insertions(+)
> > + create mode 100644 include/linux/platform_data/gfx-sgx.h
> > +
> > +diff --git a/arch/arm/mach-omap2/pdata-quirks.c
> > +b/arch/arm/mach-omap2/pdata-quirks.c
> > +index a1fb5aa..945dd61 100644
> > +--- a/arch/arm/mach-omap2/pdata-quirks.c
> > ++++ b/arch/arm/mach-omap2/pdata-quirks.c
> > +@@ -17,6 +17,7 @@
> > +
> > + #include <linux/platform_data/pinctrl-single.h>
> > + #include <linux/platform_data/iommu-omap.h>
> > ++#include <linux/platform_data/gfx-sgx.h>
> > +
> > + #include "am35xx.h"
> > + #include "common.h"
> > +@@ -63,6 +64,13 @@ static inline void legacy_init_wl12xx(unsigned
> > +ref_clock,  }  #endif
> > +
> > ++#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX) static
> > ++struct gfx_sgx_platform_data gfx_pdata = {
> > ++	.reset_name = "gfx",
> > ++	.deassert_reset = omap_device_deassert_hardreset, }; #endif
> > ++
> > + #ifdef CONFIG_MACH_NOKIA_N8X0
> > + static void __init omap2420_n8x0_legacy_init(void)  { @@ -270,6
> > ++278,10 @@ struct of_dev_auxdata omap_auxdata_lookup[] __initdata = {
> > + 	OF_DEV_AUXDATA("ti,am3517-emac", 0x5c000000, "davinci_emac.0",
> > + 		       &am35xx_emac_pdata),
> > + #endif
> > ++#if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
> > ++	OF_DEV_AUXDATA("ti,sgx", 0x56000000, "56000000.sgx",
> > ++			&gfx_pdata),
> > ++#endif
> > + #ifdef CONFIG_ARCH_OMAP4
> > + 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a100040,
> > "4a100040.pinmux", &pcs_pdata),
> > + 	OF_DEV_AUXDATA("ti,omap4-padconf", 0x4a31e040,
> > "4a31e040.pinmux",
> > +&pcs_pdata), diff --git a/include/linux/platform_data/gfx-sgx.h
> > +b/include/linux/platform_data/gfx-sgx.h
> > +new file mode 100644
> > +index 0000000..aa59b2c
> > +--- /dev/null
> > ++++ b/include/linux/platform_data/gfx-sgx.h
> > +@@ -0,0 +1,22 @@
> > ++/*
> > ++ * SGX Graphics Driver Platform Data
> > ++ *
> > ++ * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> > ++ *	Darren Etheridge <detheridge@ti.com>
> > ++ *
> > ++ * This program is free software; you can redistribute it and/or
> > ++modify
> > ++ * it under the terms of the GNU General Public License version 2 as
> > ++ * published by the Free Software Foundation.
> > ++ *
> > ++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> > ++ * kind, whether express or implied; without even the implied warranty
> > ++ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > ++ * GNU General Public License for more details.
> > ++ */
> > ++#include <linux/platform_device.h>
> > ++
> > ++struct gfx_sgx_platform_data {
> > ++	const char *reset_name;
> > ++
> > ++	int (*deassert_reset)(struct platform_device *pdev, const char
> > ++*name); };
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-
> > am437x-add-SGX-node.patch b/recipes-kernel/linux/linux-ti-staging-
> > 3.14/sgx/0005-ARM-dts-am437x-add-SGX-node.patch
> > new file mode 100644
> > index 0000000..e18581a
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0005-ARM-dts-am437x
> > +++ -add-SGX-node.patch
> > @@ -0,0 +1,41 @@
> > +From c921fe043facef3bd6649170fb6130f18e9367b7 Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Tue, 29 Jul 2014 16:27:59 -0500
> > +Subject: [PATCH 5/6] ARM: dts: am437x: add SGX node
> > +
> > +Add dt node to enable SGX PowerVR driver.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + arch/arm/boot/dts/am4372.dtsi | 8 ++++++++
> > + 1 file changed, 8 insertions(+)
> > +
> > +diff --git a/arch/arm/boot/dts/am4372.dtsi
> > +b/arch/arm/boot/dts/am4372.dtsi index d36af42..d963a60 100644
> > +--- a/arch/arm/boot/dts/am4372.dtsi
> > ++++ b/arch/arm/boot/dts/am4372.dtsi
> > +@@ -707,6 +707,13 @@
> > + 			dma-names = "tx", "rx";
> > + 		};
> > +
> > ++		sgx@0x56000000 {
> > ++			compatible = "ti,sgx";
> > ++			ti,hwmods = "gfx";
> > ++			reg = <0x56000000 0x1000000>;
> > ++			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> > ++		};
> > ++
> > + 		mcasp1: mcasp@4803C000 {
> > + 			compatible = "ti,am33xx-mcasp-audio";
> > + 			ti,hwmods = "mcasp1";
> > +@@ -891,6 +898,7 @@
> > + 				clocks = <&disp_clk>;
> > + 				clock-names = "fck";
> > + 			};
> > ++
> > + 		};
> > + 	};
> > + };
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-
> > am33xx-add-DT-node-for-gpu.patch b/recipes-kernel/linux/linux-ti-staging-
> > 3.14/sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch
> > new file mode 100644
> > index 0000000..d4d0f13
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-ti-staging-3.14/sgx/0006-ARM-dts-am33xx
> > +++ -add-DT-node-for-gpu.patch
> > @@ -0,0 +1,42 @@
> > +From 0ef34332c3400b211a047eaca751d00c97f5104c Mon Sep 17 00:00:00
> > 2001
> > +From: Darren Etheridge <detheridge@ti.com>
> > +Date: Fri, 18 Jul 2014 16:19:54 -0500
> > +Subject: [PATCH 6/6] ARM: dts: am33xx: add DT node for gpu
> > +
> > +Add the node into the am33xx.dtsi file for the SGX GPU that is found in
> > +some variants of the SoC.
> > +
> > +Signed-off-by: Darren Etheridge <detheridge@ti.com>
> > +---
> > + arch/arm/boot/dts/am33xx.dtsi | 8 +++++++-
> > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/arch/arm/boot/dts/am33xx.dtsi
> > +b/arch/arm/boot/dts/am33xx.dtsi index 2cfd694..df6ae9c 100644
> > +--- a/arch/arm/boot/dts/am33xx.dtsi
> > ++++ b/arch/arm/boot/dts/am33xx.dtsi
> > +@@ -109,7 +109,6 @@
> > + 		prcm: prcm@44e00000 {
> > + 			compatible = "ti,am3-prcm";
> > + 			reg = <0x44e00000 0x4000>;
> > +-
> > + 			prcm_clocks: clocks {
> > + 				#address-cells = <1>;
> > + 				#size-cells = <0>;
> > +@@ -822,6 +821,13 @@
> > + 			reg = <0x48310000 0x2000>;
> > + 			interrupts = <111>;
> > + 		};
> > ++
> > ++		sgx@0x56000000 {
> > ++			compatible = "ti,sgx";
> > ++			ti,hwmods = "gfx";
> > ++			reg = <0x56000000 0x1000000>;
> > ++			interrupts = <37>;
> > ++		};
> > + 	};
> > + };
> > +
> > +--
> > +1.9.1
> > +
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> > kernel/linux/linux-ti-staging_3.14.bb
> > index b505640..c223c88 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > @@ -3,8 +3,6 @@ DESCRIPTION = "Linux kernel for TI devices"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > 
> > -DEFAULT_PREFERENCE = "-1"
> > -
> >  inherit kernel
> > 
> >  require recipes-kernel/linux/linux-dtb.inc
> > @@ -49,7 +47,7 @@ SRCREV =
> > "b0fa4f08d72c8723219b5174b5749151b5acaee0"
> >  PV = "3.14.14"
> > 
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> > 
> >  KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
> > @@ -57,10 +55,22 @@ KERNEL_CONFIG_FRAGMENTS =
> > "${KERNEL_CONFIG_DIR}/audio_display.cfg ${KERNEL_CONFI
> >                             ${KERNEL_CONFIG_DIR}/connectivity.cfg
> > ${KERNEL_CONFIG_DIR}/ipc.cfg \
> >                             ${KERNEL_CONFIG_DIR}/power.cfg"
> > 
> > -KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
> > -KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
> > +KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg
> > ${WORKDIR}/sgx.cfg"
> > +KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg
> > ${WORKDIR}/sgx.cfg"
> > +
> > +# Patches necessary to make SGX graphics work with this kernel version
> > +SGX_PATCHES = "file://sgx/0001-HACK-drm-fb_helper-enable-panning-
> > support.patch \
> > +               file://sgx/0002-HACK-drm-tilcdc-add-vsync-callback-for-use-in-
> > omaplf.patch \
> > +               file://sgx/0003-drm-tilcdc-fix-the-ping-pong-dma-tearing-issue-seen-
> > .patch \
> > +               file://sgx/0004-ARM-OMAP2-Use-pdata-quirks-for-sgx-
> > deassert_hardrese.patch \
> > +               file://sgx/0005-ARM-dts-am437x-add-SGX-node.patch \
> > +               file://sgx/0006-ARM-dts-am33xx-add-DT-node-for-gpu.patch"
> > 
> >  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-
> > kernel.git;protocol=git;branch=${BRANCH} \
> >             file://defconfig \
> >             file://non-smp.cfg \
> > +           file://sgx.cfg \
> >            "
> > +
> > +SRC_URI_append_ti33x = " ${SGX_PATCHES}"
> > +SRC_URI_append_ti43x = " ${SGX_PATCHES}"
> > --
> > 2.0.2
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

