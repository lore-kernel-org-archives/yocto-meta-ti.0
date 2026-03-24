Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC01FF54ADB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1995.1774370683224040183
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 09:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FB8940CB0;
	Tue, 24 Mar 2026 16:44:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXnSX5lcdmVd; Tue, 24 Mar 2026 16:44:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B8E440A30;
	Tue, 24 Mar 2026 16:44:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84DF117AB76; Tue, 24 Mar 2026 12:44:38 -0400 (EDT)
Date: Tue, 24 Mar 2026 12:44:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] weston: Update to 15.0.0
Message-ID: <20260324164438.GU11121@denix.org>
References: <20260324162004.3215160-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324162004.3215160-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 16:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19806

On Tue, Mar 24, 2026 at 11:20:04AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core has bumped the version to 15.0.0 [1].


> We need to adjust the bbappend version to % to better match future version 
> changes.

You shouldn't be doing this rename.


> Additionally, the patch needs to be updated to match the weston code
> changes.

The bbappend is version-specific on purpose exactly due to the fact that the 
patch won't apply against different versions - it has to be massaged every 
time there's a major version bump, we've done it many times before.


> [1] https://git.openembedded.org/openembedded-core/commit/?id=a1ed6fddd99171536e23d63a5d5b180019d672ad
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...equire-GL_EXT_unpack_subimage-commit.patch | 109 ++++++++----------
>  ...ston_14.0.%.bbappend => weston_%.bbappend} |   0
>  2 files changed, 51 insertions(+), 58 deletions(-)
>  rename meta-ti-bsp/recipes-graphics/wayland/{weston_14.0.%.bbappend => weston_%.bbappend} (100%)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> index fbe8f2bb..4b3b4a1f 100644
> --- a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> @@ -1,6 +1,6 @@
> -From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@konsulko.com>
> -Date: Thu, 6 Jul 2023 01:48:41 +0000
> +From 3cddacaa9ea3cfd75732ea9a84312fa68e0bfda7 Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Tue, 24 Mar 2026 10:52:59 -0500
>  Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>  
>  This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
> @@ -13,83 +13,76 @@ Upstream-Status: Inappropriate [specific to TI SGX]
>  
>  Signed-off-by: Andrew Davis <afd@ti.com>
>  Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> -
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>  ---
>   libweston/renderer-gl/gl-renderer-internal.h |  2 ++
> - libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
> - 2 files changed, 26 insertions(+), 5 deletions(-)
> + libweston/renderer-gl/gl-renderer.c          | 26 ++++++++++++++++----
> + 2 files changed, 23 insertions(+), 5 deletions(-)
>  
>  diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
> -index 5032035..85616c9 100644
> +index 1afffbda..dbf7b1c3 100644
>  --- a/libweston/renderer-gl/gl-renderer-internal.h
>  +++ b/libweston/renderer-gl/gl-renderer-internal.h
> -@@ -229,6 +229,8 @@ struct gl_renderer {
> -	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
> -	bool has_platform_base;
> -
> -+	bool has_unpack_subimage;
> +@@ -526,6 +526,8 @@ struct gl_renderer {
> + 	struct weston_log_scope *shader_scope;
> + 
> + 	struct dmabuf_allocator *allocator;
>  +
> -	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
> -	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
> -	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
> ++    bool has_unpack_subimage;
> + };
> + 
> + static inline uint32_t
>  diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> -index e694418b..2be6d621 100644
> +index 45a2a148..8b238208 100644
>  --- a/libweston/renderer-gl/gl-renderer.c
>  +++ b/libweston/renderer-gl/gl-renderer.c
> -@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
> -	struct weston_surface *surface = pnode->surface;
> -	const struct weston_testsuite_quirks *quirks =
> -		&surface->compositor->test_data.test_quirks;
> -+	struct gl_renderer *gr = get_renderer(surface->compositor);
> -	struct weston_buffer *buffer = surface->buffer_ref.buffer;
> -	struct gl_surface_state *gs = get_surface_state(surface);
> -	struct gl_buffer_state *gb = gs->buffer;
> -@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
> -
> -	data = wl_shm_buffer_get_data(buffer->shm_buffer);
> -
> +@@ -3021,6 +3021,22 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
> + 
> + 	data = wl_shm_buffer_get_data(buffer->shm_buffer);
> + 
>  +	if (!gr->has_unpack_subimage) {
>  +		wl_shm_buffer_begin_access(buffer->shm_buffer);
> -+		for (j = 0; j < gs->buffer->num_textures; j++) {
> -+			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
> -+			glTexImage2D(GL_TEXTURE_2D, 0,
> -+				     gs->buffer->gl_format[j],
> -+				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
> -+				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
> -+				     0,
> -+				     gl_format_from_internal(gs->buffer->gl_format[j]),
> -+				     gs->buffer->gl_pixel_type,
> -+				     data + gs->buffer->offset[j]);
> ++		for (j = 0; j < gb->num_textures; j++) {
> ++			glBindTexture(GL_TEXTURE_2D, gb->textures[j]);
> ++			gl_texture_2d_store(gr, 0, 0, 0,
> ++                        gb->pitch / pixel_format_hsub(buffer->pixel_format, j),
> ++				        buffer->height / pixel_format_vsub(buffer->pixel_format, j),
> ++					    gb->texture_format[j].external,
> ++					    gb->texture_format[j].type,
> ++					    data + gb->offset[j]);
>  +		}
>  +		wl_shm_buffer_end_access(buffer->shm_buffer);
>  +
>  +		goto done;
>  +	}
>  +
> -	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
> -		wl_shm_buffer_begin_access(buffer->shm_buffer);
> -
> -@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> -	else
> -		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
> -
> --	if (gr->gl_version < gr_gl_version(3, 0) &&
> --	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
> + 	if (gb->needs_full_upload || quirks->force_full_upload) {
> + 		wl_shm_buffer_begin_access(buffer->shm_buffer);
> + 
> +@@ -5171,11 +5187,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> + 	else
> + 		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
> + 
> +-	if (gr->gl_version < gl_version(3, 0) &&
> +-	    !gl_extensions_has(gr, EXTENSION_EXT_UNPACK_SUBIMAGE)) {
>  -		weston_log("GL_EXT_unpack_subimage not available.\n");
>  -		return -1;
>  -	}
> -+	if (gr->gl_version >= gr_gl_version(3, 0) ||
> ++	if (gr->gl_version >= gl_version(3, 0) ||
>  +	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
>  +		gr->has_unpack_subimage = true;
> -
> -	if (gr->gl_version >= gr_gl_version(3, 0) ||
> -	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
> -@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> -		   gr_gl_version_minor(gr->gl_version));
> -	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
> -			    ec->read_format->drm_format_name);
> + 
> + 	if (gl_extensions_has(gr, EXTENSION_OES_MAPBUFFER))
> + 		GET_PROC_ADDRESS(gr->unmap_buffer, "glUnmapBufferOES");
> +@@ -5303,6 +5317,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> + 		   gl_version_minor(gr->gl_version));
> + 	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
> + 			    ec->read_format->drm_format_name);
>  +	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
>  +			    gr->has_unpack_subimage ? "yes" : "no");
> -	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
> -			    yesno(gr->has_pack_reverse));
> -	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
> + 	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
> + 			    yesno(gl_extensions_has(gr, EXTENSION_ANGLE_PACK_REVERSE_ROW_ORDER)));
> + 	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
> +-- 
> +2.43.0
> +
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
> rename to meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
> -- 
> 2.43.0

