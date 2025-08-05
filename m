Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E093C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 15:20:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1918.1754407229336611754
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 08:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wMNv4N8N;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575FKS3A4107308;
	Tue, 5 Aug 2025 10:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754407228;
	bh=e8J9YZJVfEAAW3+oeyfxhOAVSOwCUguN/pJ8ekHyYhw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=wMNv4N8Nvzxkz641lB7h6zu7RTNZT4c04YUlaBWc6oS72HMxiuyUlUEYP1rkYciku
	 aF1ntMS9os308P29ZXxuZJoi/AlMyPd2vUvCV9pnAZlMQHLWQSu6iI+PGcIb5+TcDm
	 x2pDxVqFExHp/ulgpV34Gh36+Oas+hRDquo3q4W4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575FKS9x3537516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 10:20:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 10:20:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 10:20:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575FKRmV2041220;
	Tue, 5 Aug 2025 10:20:27 -0500
Message-ID: <3388f320-3f3c-42a4-a760-9388e3d85d98@ti.com>
Date: Tue, 5 Aug 2025 10:20:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] recipes-graphics: Add weston fix for SGX
 from meta-arago
To: Daniel Schultz <D.Schultz@phytec.de>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
References: <20250731181617.195697-1-afd@ti.com>
 <9273e71a-ec94-437c-8484-9dad2c7a4033@phytec.de>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <9273e71a-ec94-437c-8484-9dad2c7a4033@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Aug 2025 15:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18889

On 8/5/25 9:56 AM, Daniel Schultz wrote:
> Hey,
> 
> I would like to report following issue with this patch:
> 
> | DEBUG: Executing shell function BUILDSPEC | error: line 4: Illegal char '-' (0x2d) in: Release: r0.ti-soc1 | Building target platforms: aarch64-phytec-linux | Building for target aarch64-phytec-linux | WARNING: exit code 1 from a shell command. | DEBUG: Python function do_package_rpm finished | DEBUG: Python function do_package_write_rpm finished
> 

Thanks for the report, it seems that - is not allowed in RPM version/distro
tags. "ti-soc1" might be better as "ti_soc1", or maybe that will mess with
Debian..

How about just "tisoc1", any objections?

Andrew

> Best regards,
> Daniel
> 
> On 7/31/25 11:16, Andrew Davis via lists.yoctoproject.org wrote:
>> This change is needed due to the SGX driver, any distro, not just Arago,
>> using a TI SoC with SGX will need this fix, so it should go in meta-ti.
>>
>> Signed-off-by: Andrew Davis<afd@ti.com>
>> ---
>>   .../wayland/weston-ti-version.inc             |  7 ++
>>   ...equire-GL_EXT_unpack_subimage-commit.patch | 95 +++++++++++++++++++
>>   .../wayland/weston_14.0.%.bbappend            |  4 +
>>   3 files changed, 106 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>   create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>> new file mode 100644
>> index 00000000..fafef724
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>> @@ -0,0 +1,7 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
>> +
>> +PR:append = ".ti-soc1"
>> +
>> +SRC_URI += " \
>> +file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
>> +"
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> new file mode 100644
>> index 00000000..fbe8f2bb
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> @@ -0,0 +1,95 @@
>> +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
>> +From: Denys Dmytriyenko<denys@konsulko.com>
>> +Date: Thu, 6 Jul 2023 01:48:41 +0000
>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>> +
>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>> +
>> +That commit removed support for GPU drivers without GL_EXT_unpack_subimage
>> +which SGX does not support. Add back support for GPUs without this
>> +extension.
>> +
>> +Upstream-Status: Inappropriate [specific to TI SGX]
>> +
>> +Signed-off-by: Andrew Davis<afd@ti.com>
>> +Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
>> +
>> +---
>> + libweston/renderer-gl/gl-renderer-internal.h |  2 ++
>> + libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
>> + 2 files changed, 26 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
>> +index 5032035..85616c9 100644
>> +--- a/libweston/renderer-gl/gl-renderer-internal.h
>> ++++ b/libweston/renderer-gl/gl-renderer-internal.h
>> +@@ -229,6 +229,8 @@ struct gl_renderer {
>> +	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
>> +	bool has_platform_base;
>> +
>> ++	bool has_unpack_subimage;
>> ++
>> +	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>> +	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>> +	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>> +diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
>> +index e694418b..2be6d621 100644
>> +--- a/libweston/renderer-gl/gl-renderer.c
>> ++++ b/libweston/renderer-gl/gl-renderer.c
>> +@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>> +	struct weston_surface *surface = pnode->surface;
>> +	const struct weston_testsuite_quirks *quirks =
>> +		&surface->compositor->test_data.test_quirks;
>> ++	struct gl_renderer *gr = get_renderer(surface->compositor);
>> +	struct weston_buffer *buffer = surface->buffer_ref.buffer;
>> +	struct gl_surface_state *gs = get_surface_state(surface);
>> +	struct gl_buffer_state *gb = gs->buffer;
>> +@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct weston_paint_node *pnode)
>> +
>> +	data = wl_shm_buffer_get_data(buffer->shm_buffer);
>> +
>> ++	if (!gr->has_unpack_subimage) {
>> ++		wl_shm_buffer_begin_access(buffer->shm_buffer);
>> ++		for (j = 0; j < gs->buffer->num_textures; j++) {
>> ++			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
>> ++			glTexImage2D(GL_TEXTURE_2D, 0,
>> ++				     gs->buffer->gl_format[j],
>> ++				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
>> ++				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
>> ++				     0,
>> ++				     gl_format_from_internal(gs->buffer->gl_format[j]),
>> ++				     gs->buffer->gl_pixel_type,
>> ++				     data + gs->buffer->offset[j]);
>> ++		}
>> ++		wl_shm_buffer_end_access(buffer->shm_buffer);
>> ++
>> ++		goto done;
>> ++	}
>> ++
>> +	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
>> +		wl_shm_buffer_begin_access(buffer->shm_buffer);
>> +
>> +@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *ec)
>> +	else
>> +		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
>> +
>> +-	if (gr->gl_version < gr_gl_version(3, 0) &&
>> +-	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
>> +-		weston_log("GL_EXT_unpack_subimage not available.\n");
>> +-		return -1;
>> +-	}
>> ++	if (gr->gl_version >= gr_gl_version(3, 0) ||
>> ++	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
>> ++		gr->has_unpack_subimage = true;
>> +
>> +	if (gr->gl_version >= gr_gl_version(3, 0) ||
>> +	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
>> +@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *ec)
>> +		   gr_gl_version_minor(gr->gl_version));
>> +	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
>> +			    ec->read_format->drm_format_name);
>> ++	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
>> ++			    gr->has_unpack_subimage ? "yes" : "no");
>> +	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
>> +			    yesno(gr->has_pack_reverse));
>> +	weston_log_continue(STAMP_SPACE "glReadPixels supports PBO: %s\n",
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>> new file mode 100644
>> index 00000000..cf4f530a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>> @@ -0,0 +1,4 @@
>> +WESTON_TI_VERSION = ""
>> +WESTON_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>> +
>> +require ${WESTON_TI_VERSION}
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18859):https://lists.yoctoproject.org/g/meta-ti/message/18859
>> Mute This Topic:https://lists.yoctoproject.org/mt/114471414/4454627
>> Group Owner:meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-ti/unsub [d.schultz@phytec.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 


