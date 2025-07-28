Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71880C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:35:49 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.90194.1753731343848491340
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JJi1TYXw;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SJZgZY2830130;
	Mon, 28 Jul 2025 14:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753731342;
	bh=EmA+6R/icyrHWgSsKihNRSm4SKFjzkgz4gbXYAupSvQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JJi1TYXwrFgQqMk+fcsVFutb4UO8G5fJLzdeF203J8VctfrvY/dXaow4bSGhHuJcY
	 aUPsGr2o/ahAu0MCBy3oVq1UER04TUzqs/ghHlSyF3IcaAWV7unSVVmpcqKKm6BTof
	 v7kf1JT2g8DS54WOwK/5IafHB4K4+gXLWdAxrLhY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SJZg5Z2235935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 14:35:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 14:35:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 14:35:42 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SJZgJS2265346;
	Mon, 28 Jul 2025 14:35:42 -0500
Message-ID: <a21f580a-20c1-4353-aa0f-d9dd85458ff9@ti.com>
Date: Mon, 28 Jul 2025 14:35:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] recipes-graphics: Add weston
 fix for SGX from meta-arago
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728173316.575613-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250728173316.575613-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:35:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18843


As with the patch from meta-arago... NAK.

weston has moved to 14.0 in master.

Please submit the proper patch for master on both meta-arago and meta-ti.




On 7/28/2025 12:33 PM, Andrew Davis wrote:
> This change is needed due to the SGX driver, any distro, not just Arago,
> using a TI SoC with SGX will need this fix, so it should go in meta-ti.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../wayland/weston-ti-version.inc             |  7 ++
>   ...equire-GL_EXT_unpack_subimage-commit.patch | 95 +++++++++++++++++++
>   .../wayland/weston_13.0.%.bbappend            |  4 +
>   3 files changed, 106 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> new file mode 100644
> index 00000000..fafef724
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
> @@ -0,0 +1,7 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
> +
> +PR:append = ".ti-soc1"
> +
> +SRC_URI += " \
> +        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
> +"
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> new file mode 100644
> index 00000000..ad252030
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> @@ -0,0 +1,95 @@
> +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Thu, 6 Jul 2023 01:48:41 +0000
> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
> +
> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
> +
> +That commit removed support for GPU drivers without GL_EXT_unpack_subimage
> +which SGX does not support. Add back support for GPUs without this
> +extension.
> +
> +Upstream-Status: Inappropriate [specific to TI SGX]
> +
> +Signed-off-by: Andrew Davis <afd@ti.com>
> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +
> +---
> + libweston/renderer-gl/gl-renderer-internal.h |  2 ++
> + libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
> + 2 files changed, 26 insertions(+), 5 deletions(-)
> +
> +diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
> +index 5032035..85616c9 100644
> +--- a/libweston/renderer-gl/gl-renderer-internal.h
> ++++ b/libweston/renderer-gl/gl-renderer-internal.h
> +@@ -160,6 +160,8 @@ struct gl_renderer {
> +	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
> +	bool has_platform_base;
> +
> ++	bool has_unpack_subimage;
> ++
> +	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
> +	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
> +	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
> +diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> +index ccb41e6..38a0e0c 100644
> +--- a/libweston/renderer-gl/gl-renderer.c
> ++++ b/libweston/renderer-gl/gl-renderer.c
> +@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> + {
> +	const struct weston_testsuite_quirks *quirks =
> +		&surface->compositor->test_data.test_quirks;
> ++	struct gl_renderer *gr = get_renderer(surface->compositor);
> +	struct gl_surface_state *gs = get_surface_state(surface);
> +	struct gl_buffer_state *gb = gs->buffer;
> +	struct weston_paint_node *pnode;
> +@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> +
> +	glActiveTexture(GL_TEXTURE0);
> +
> ++	if (!gr->has_unpack_subimage) {
> ++		wl_shm_buffer_begin_access(buffer->shm_buffer);
> ++		for (j = 0; j < gs->buffer->num_textures; j++) {
> ++			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
> ++			glTexImage2D(GL_TEXTURE_2D, 0,
> ++				     gs->buffer->gl_format[j],
> ++				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
> ++				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
> ++				     0,
> ++				     gl_format_from_internal(gs->buffer->gl_format[j]),
> ++				     gs->buffer->gl_pixel_type,
> ++				     data + gs->buffer->offset[j]);
> ++		}
> ++		wl_shm_buffer_end_access(buffer->shm_buffer);
> ++
> ++		goto done;
> ++	}
> ++
> +	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
> +		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> +		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> +@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> +	else
> +		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
> +
> +-	if (gr->gl_version < gr_gl_version(3, 0) &&
> +-	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
> +-		weston_log("GL_EXT_unpack_subimage not available.\n");
> +-		return -1;
> +-	}
> ++	if (gr->gl_version >= gr_gl_version(3, 0) ||
> ++	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
> ++		gr->has_unpack_subimage = true;
> +
> +	if (gr->gl_version >= gr_gl_version(3, 0) ||
> +	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
> +@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> +		   gr_gl_version_minor(gr->gl_version));
> +	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
> +			    ec->read_format->drm_format_name);
> ++	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
> ++			    gr->has_unpack_subimage ? "yes" : "no");
> +	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
> +			    yesno(gr->has_pack_reverse));
> +	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> new file mode 100644
> index 00000000..cf4f530a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
> @@ -0,0 +1,4 @@
> +WESTON_TI_VERSION = ""
> +WESTON_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
> +
> +require ${WESTON_TI_VERSION}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

