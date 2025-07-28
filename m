Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C06C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:36:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.90598.1753731364182787692
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A1BE740C56;
	Mon, 28 Jul 2025 19:36:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqxBnh3098j6; Mon, 28 Jul 2025 19:36:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 757D140800;
	Mon, 28 Jul 2025 19:36:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3241C16D17D; Mon, 28 Jul 2025 15:36:01 -0400 (EDT)
Date: Mon, 28 Jul 2025 15:36:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH] recipes-graphics: Add
 weston fix for SGX from meta-arago
Message-ID: <20250728193601.GL24899@denix.org>
References: <20250728173316.575613-1-afd@ti.com>
 <20250728193205.GK24899@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728193205.GK24899@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:36:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18844

On Mon, Jul 28, 2025 at 03:32:05PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 28, 2025 at 12:33:16PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> > This change is needed due to the SGX driver, any distro, not just Arago,
> > using a TI SoC with SGX will need this fix, so it should go in meta-ti.
> > 
> > Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@konsulko.com>

Though, you would need to submit a separate patch for master, as there was a 
fuzz-related update since scarthgap:

https://git.yoctoproject.org/meta-arago/commit/?id=39136769521719157dde1e13559ce5f75b9be52a


> > ---
> >  .../wayland/weston-ti-version.inc             |  7 ++
> >  ...equire-GL_EXT_unpack_subimage-commit.patch | 95 +++++++++++++++++++
> >  .../wayland/weston_13.0.%.bbappend            |  4 +
> >  3 files changed, 106 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> >  create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> >  create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> > 
> > diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> > new file mode 100644
> > index 00000000..fafef724
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> > @@ -0,0 +1,7 @@
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
> > +
> > +PR:append = ".ti-soc1"
> > +
> > +SRC_URI += " \
> > +        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
> > +"
> > diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> > new file mode 100644
> > index 00000000..ad252030
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> > @@ -0,0 +1,95 @@
> > +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
> > +From: Denys Dmytriyenko <denys@konsulko.com>
> > +Date: Thu, 6 Jul 2023 01:48:41 +0000
> > +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
> > +
> > +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
> > +
> > +That commit removed support for GPU drivers without GL_EXT_unpack_subimage
> > +which SGX does not support. Add back support for GPUs without this
> > +extension.
> > +
> > +Upstream-Status: Inappropriate [specific to TI SGX]
> > +
> > +Signed-off-by: Andrew Davis <afd@ti.com>
> > +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > +
> > +---
> > + libweston/renderer-gl/gl-renderer-internal.h |  2 ++
> > + libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
> > + 2 files changed, 26 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
> > +index 5032035..85616c9 100644
> > +--- a/libweston/renderer-gl/gl-renderer-internal.h
> > ++++ b/libweston/renderer-gl/gl-renderer-internal.h
> > +@@ -160,6 +160,8 @@ struct gl_renderer {
> > +	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
> > +	bool has_platform_base;
> > +
> > ++	bool has_unpack_subimage;
> > ++
> > +	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
> > +	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
> > +	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
> > +diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> > +index ccb41e6..38a0e0c 100644
> > +--- a/libweston/renderer-gl/gl-renderer.c
> > ++++ b/libweston/renderer-gl/gl-renderer.c
> > +@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> > + {
> > +	const struct weston_testsuite_quirks *quirks =
> > +		&surface->compositor->test_data.test_quirks;
> > ++	struct gl_renderer *gr = get_renderer(surface->compositor);
> > +	struct gl_surface_state *gs = get_surface_state(surface);
> > +	struct gl_buffer_state *gb = gs->buffer;
> > +	struct weston_paint_node *pnode;
> > +@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> > +
> > +	glActiveTexture(GL_TEXTURE0);
> > +
> > ++	if (!gr->has_unpack_subimage) {
> > ++		wl_shm_buffer_begin_access(buffer->shm_buffer);
> > ++		for (j = 0; j < gs->buffer->num_textures; j++) {
> > ++			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
> > ++			glTexImage2D(GL_TEXTURE_2D, 0,
> > ++				     gs->buffer->gl_format[j],
> > ++				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
> > ++				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
> > ++				     0,
> > ++				     gl_format_from_internal(gs->buffer->gl_format[j]),
> > ++				     gs->buffer->gl_pixel_type,
> > ++				     data + gs->buffer->offset[j]);
> > ++		}
> > ++		wl_shm_buffer_end_access(buffer->shm_buffer);
> > ++
> > ++		goto done;
> > ++	}
> > ++
> > +	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
> > +		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> > +		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> > +@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> > +	else
> > +		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
> > +
> > +-	if (gr->gl_version < gr_gl_version(3, 0) &&
> > +-	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
> > +-		weston_log("GL_EXT_unpack_subimage not available.\n");
> > +-		return -1;
> > +-	}
> > ++	if (gr->gl_version >= gr_gl_version(3, 0) ||
> > ++	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
> > ++		gr->has_unpack_subimage = true;
> > +
> > +	if (gr->gl_version >= gr_gl_version(3, 0) ||
> > +	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
> > +@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> > +		   gr_gl_version_minor(gr->gl_version));
> > +	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
> > +			    ec->read_format->drm_format_name);
> > ++	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
> > ++			    gr->has_unpack_subimage ? "yes" : "no");
> > +	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
> > +			    yesno(gr->has_pack_reverse));
> > +	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
> > diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> > new file mode 100644
> > index 00000000..cf4f530a
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> > @@ -0,0 +1,4 @@
> > +WESTON_TI_VERSION = ""
> > +WESTON_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
> > +
> > +require ${WESTON_TI_VERSION}
> > -- 
> > 2.39.2

