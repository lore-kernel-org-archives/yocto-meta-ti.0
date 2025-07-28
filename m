Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E899C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:46:59 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.90457.1753732011584723687
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mDjtx2eG;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SJkonw2376418;
	Mon, 28 Jul 2025 14:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753732010;
	bh=UhYqG61Od2hTtRzVMYQT9EhzyknFdJI6sNw60Sc5TbM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mDjtx2eGWKwq+O8Aa8Tg+B2ZBltj71vHtqjWz6bi8bbYv3WIW7ngVkwNQ0CYby6w0
	 pQZn2grlH6KStcLVFjYq5lzPuO6EEwgZb05JUZkjkU/xmO+Ut0xUQ5xo4uSIbmKmN2
	 JUn3nb7JAKyrYWtWo/tBToni3Abc/s3S1qNVvqKg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SJko9J1280249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 14:46:50 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 14:46:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 14:46:49 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SJknZD2276149;
	Mon, 28 Jul 2025 14:46:49 -0500
Message-ID: <e6253965-dba1-4147-9075-69fc1b97689a@ti.com>
Date: Mon, 28 Jul 2025 14:46:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] recipes-graphics: Add weston
 fix for SGX from meta-arago
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728173316.575613-1-afd@ti.com>
 <a21f580a-20c1-4353-aa0f-d9dd85458ff9@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a21f580a-20c1-4353-aa0f-d9dd85458ff9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 56SJkonw2376418
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:46:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18846

On 7/28/25 2:35 PM, Ryan Eatmon wrote:
>=20
> As with the patch from meta-arago... NAK.
>=20
> weston has moved to 14.0 in master.
>=20
> Please submit the proper patch for master on both meta-arago and meta-t=
i.
>=20
>=20

Just noticed that, I'll send a version for master. This version (and the
one for meta-arago) does apply on scarthgap if you want to just take this
as the scarthgap-only version.

Andrew

>=20
>=20
> On 7/28/2025 12:33 PM, Andrew Davis wrote:
>> This change is needed due to the SGX driver, any distro, not just Arag=
o,
>> using a TI SoC with SGX will need this fix, so it should go in meta-ti.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../wayland/weston-ti-version.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++
>> =C2=A0 ...equire-GL_EXT_unpack_subimage-commit.patch | 95 ++++++++++++=
+++++++
>> =C2=A0 .../wayland/weston_13.0.%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +
>> =C2=A0 3 files changed, 106 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston-=
ti-version.inc
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston/=
0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/wayland/weston_=
13.0.%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.in=
c b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>> new file mode 100644
>> index 00000000..fafef724
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>> @@ -0,0 +1,7 @@
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/weston:"
>> +
>> +PR:append =3D ".ti-soc1"
>> +
>> +SRC_URI +=3D " \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Revert-require=
-GL_EXT_unpack_subimage-commit.patch \
>> +"
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-r=
equire-GL_EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics=
/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>> new file mode 100644
>> index 00000000..ad252030
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-=
GL_EXT_unpack_subimage-commit.patch
>> @@ -0,0 +1,95 @@
>> +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 200=
1
>> +From: Denys Dmytriyenko <denys@konsulko.com>
>> +Date: Thu, 6 Jul 2023 01:48:41 +0000
>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>> +
>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>> +
>> +That commit removed support for GPU drivers without GL_EXT_unpack_sub=
image
>> +which SGX does not support. Add back support for GPUs without this
>> +extension.
>> +
>> +Upstream-Status: Inappropriate [specific to TI SGX]
>> +
>> +Signed-off-by: Andrew Davis <afd@ti.com>
>> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> +
>> +---
>> + libweston/renderer-gl/gl-renderer-internal.h |=C2=A0 2 ++
>> + libweston/renderer-gl/gl-renderer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 ++++++++++++++++----
>> + 2 files changed, 26 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston=
/renderer-gl/gl-renderer-internal.h
>> +index 5032035..85616c9 100644
>> +--- a/libweston/renderer-gl/gl-renderer-internal.h
>> ++++ b/libweston/renderer-gl/gl-renderer-internal.h
>> +@@ -160,6 +160,8 @@ struct gl_renderer {
>> +=C2=A0=C2=A0=C2=A0 PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_pl=
atform_window;
>> +=C2=A0=C2=A0=C2=A0 bool has_platform_base;
>> +
>> ++=C2=A0=C2=A0=C2=A0 bool has_unpack_subimage;
>> ++
>> +=C2=A0=C2=A0=C2=A0 PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>> +=C2=A0=C2=A0=C2=A0 PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>> +=C2=A0=C2=A0=C2=A0 PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>> +diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer=
-gl/gl-renderer.c
>> +index ccb41e6..38a0e0c 100644
>> +--- a/libweston/renderer-gl/gl-renderer.c
>> ++++ b/libweston/renderer-gl/gl-renderer.c
>> +@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface =
*surface,
>> + {
>> +=C2=A0=C2=A0=C2=A0 const struct weston_testsuite_quirks *quirks =3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &surface->compositor->test=
_data.test_quirks;
>> ++=C2=A0=C2=A0=C2=A0 struct gl_renderer *gr =3D get_renderer(surface->=
compositor);
>> +=C2=A0=C2=A0=C2=A0 struct gl_surface_state *gs =3D get_surface_state(=
surface);
>> +=C2=A0=C2=A0=C2=A0 struct gl_buffer_state *gb =3D gs->buffer;
>> +=C2=A0=C2=A0=C2=A0 struct weston_paint_node *pnode;
>> +@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface=
 *surface,
>> +
>> +=C2=A0=C2=A0=C2=A0 glActiveTexture(GL_TEXTURE0);
>> +
>> ++=C2=A0=C2=A0=C2=A0 if (!gr->has_unpack_subimage) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_begin_acces=
s(buffer->shm_buffer);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < gs->buf=
fer->num_textures; j++) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
lBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
lTexImage2D(GL_TEXTURE_2D, 0,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_format=
[j],
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->pitch / p=
ixel_format_hsub(buffer->pixel_format, j),
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer->height / pixe=
l_format_vsub(buffer->pixel_format, j),
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gl_format_from_intern=
al(gs->buffer->gl_format[j]),
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_pixel_=
type,
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data + gs->buffer->of=
fset[j]);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_end_access(=
buffer->shm_buffer);
>> ++
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> ++=C2=A0=C2=A0=C2=A0 }
>> ++
>> +=C2=A0=C2=A0=C2=A0 if (gb->needs_full_upload || quirks->gl_force_full=
_upload) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glPixelStorei(GL_UNPACK_SK=
IP_PIXELS_EXT, 0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glPixelStorei(GL_UNPACK_SK=
IP_ROWS_EXT, 0);
>> +@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec=
)
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ec->read_format =3D pixel_=
format_get_info(DRM_FORMAT_ABGR8888);
>> +
>> +-=C2=A0=C2=A0=C2=A0 if (gr->gl_version < gr_gl_version(3, 0) &&
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !weston_check_egl_extensi=
on(extensions, "GL_EXT_unpack_subimage")) {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_log("GL_EXT_unpack=
_subimage not available.\n");
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> +-=C2=A0=C2=A0=C2=A0 }
>> ++=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extensio=
n(extensions, "GL_EXT_unpack_subimage"))
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage =3D=
 true;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extension=
(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
>> +@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr_gl_ve=
rsion_minor(gr->gl_version));
>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "read-back format:=
 %s\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ec->read_format->drm_format_name);
>> ++=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "wl_shm sub-image=
 to texture: %s\n",
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage ? "yes" : "no");
>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "glReadPixels supp=
orts y-flip: %s\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 yesno(gr->has_pack_reverse));
>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "wl_shm 10 bpc for=
mats: %s\n",
>> diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappe=
nd b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
>> new file mode 100644
>> index 00000000..cf4f530a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
>> @@ -0,0 +1,4 @@
>> +WESTON_TI_VERSION =3D ""
>> +WESTON_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>> +
>> +require ${WESTON_TI_VERSION}
>=20


