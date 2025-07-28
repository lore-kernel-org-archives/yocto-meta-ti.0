Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CD5C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:55:29 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.91049.1753732528062783073
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=iI/Tl03z;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SJtR4I2832544;
	Mon, 28 Jul 2025 14:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753732527;
	bh=I+aZH1kpYnIJvD6rKigJM25AcE+tjNPXjW7OiAT1hlA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=iI/Tl03zIOYvSXO9qA3xf/i38XgCh9S5/hRmTCFKbJ5A3zWKeu0yJXbe0x9F7ZXRG
	 dpjvK1LZ9KgZk8VLM75NNV81YoNj0f1aeDfoA2d5Ed6pFH32MEJLTlPFLXhNdBNsCZ
	 J0gkREWDynhzfP+qmHxF8RcKPgCqi/JGpDvgCwH4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SJtRYq2244070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 14:55:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 14:55:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 14:55:26 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SJtQ562284202;
	Mon, 28 Jul 2025 14:55:26 -0500
Message-ID: <a1e2d959-73c0-4fc6-b6b1-9151cc7ce8fa@ti.com>
Date: Mon, 28 Jul 2025 14:55:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH] recipes-graphics: Add weston
 fix for SGX from meta-arago
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250728173316.575613-1-afd@ti.com>
 <a21f580a-20c1-4353-aa0f-d9dd85458ff9@ti.com>
 <e6253965-dba1-4147-9075-69fc1b97689a@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e6253965-dba1-4147-9075-69fc1b97689a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56SJtR4I2832544
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18847



On 7/28/2025 2:46 PM, Andrew Davis wrote:
> On 7/28/25 2:35 PM, Ryan Eatmon wrote:
>>
>> As with the patch from meta-arago... NAK.
>>
>> weston has moved to 14.0 in master.
>>
>> Please submit the proper patch for master on both meta-arago and meta-=
ti.
>>
>>
>=20
> Just noticed that, I'll send a version for master. This version (and th=
e
> one for meta-arago) does apply on scarthgap if you want to just take th=
is
> as the scarthgap-only version.

That was my plan.


> Andrew
>=20
>>
>>
>> On 7/28/2025 12:33 PM, Andrew Davis wrote:
>>> This change is needed due to the SGX driver, any distro, not just Ara=
go,
>>> using a TI SoC with SGX will need this fix, so it should go in meta-t=
i.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 .../wayland/weston-ti-version.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++
>>> =C2=A0 ...equire-GL_EXT_unpack_subimage-commit.patch | 95 +++++++++++=
++++++++
>>> =C2=A0 .../wayland/weston_13.0.%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +
>>> =C2=A0 3 files changed, 106 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_EX=
T_unpack_subimage-commit.patch
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc=20
>>> b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>> new file mode 100644
>>> index 00000000..fafef724
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>> @@ -0,0 +1,7 @@
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/weston:"
>>> +
>>> +PR:append =3D ".ti-soc1"
>>> +
>>> +SRC_URI +=3D " \
>>> +       =20
>>> file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
>>> +"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_=
EXT_unpack_subimage-commit.patch b/meta-ti-bsp/recipes-graphics/wayland/w=
eston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>> new file mode 100644
>>> index 00000000..ad252030
>>> --- /dev/null
>>> +++=20
>>> b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_=
EXT_unpack_subimage-commit.patch
>>> @@ -0,0 +1,95 @@
>>> +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 20=
01
>>> +From: Denys Dmytriyenko <denys@konsulko.com>
>>> +Date: Thu, 6 Jul 2023 01:48:41 +0000
>>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>>> +
>>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>>> +
>>> +That commit removed support for GPU drivers without=20
>>> GL_EXT_unpack_subimage
>>> +which SGX does not support. Add back support for GPUs without this
>>> +extension.
>>> +
>>> +Upstream-Status: Inappropriate [specific to TI SGX]
>>> +
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> +
>>> +---
>>> + libweston/renderer-gl/gl-renderer-internal.h |=C2=A0 2 ++
>>> + libweston/renderer-gl/gl-renderer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29 ++++++++++++++++----
>>> + 2 files changed, 26 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/libweston/renderer-gl/gl-renderer-internal.h=20
>>> b/libweston/renderer-gl/gl-renderer-internal.h
>>> +index 5032035..85616c9 100644
>>> +--- a/libweston/renderer-gl/gl-renderer-internal.h
>>> ++++ b/libweston/renderer-gl/gl-renderer-internal.h
>>> +@@ -160,6 +160,8 @@ struct gl_renderer {
>>> +=C2=A0=C2=A0=C2=A0 PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_p=
latform_window;
>>> +=C2=A0=C2=A0=C2=A0 bool has_platform_base;
>>> +
>>> ++=C2=A0=C2=A0=C2=A0 bool has_unpack_subimage;
>>> ++
>>> +=C2=A0=C2=A0=C2=A0 PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>>> +=C2=A0=C2=A0=C2=A0 PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>>> +=C2=A0=C2=A0=C2=A0 PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>>> +diff --git a/libweston/renderer-gl/gl-renderer.c=20
>>> b/libweston/renderer-gl/gl-renderer.c
>>> +index ccb41e6..38a0e0c 100644
>>> +--- a/libweston/renderer-gl/gl-renderer.c
>>> ++++ b/libweston/renderer-gl/gl-renderer.c
>>> +@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface=
=20
>>> *surface,
>>> + {
>>> +=C2=A0=C2=A0=C2=A0 const struct weston_testsuite_quirks *quirks =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &surface->compositor->tes=
t_data.test_quirks;
>>> ++=C2=A0=C2=A0=C2=A0 struct gl_renderer *gr =3D get_renderer(surface-=
>compositor);
>>> +=C2=A0=C2=A0=C2=A0 struct gl_surface_state *gs =3D get_surface_state=
(surface);
>>> +=C2=A0=C2=A0=C2=A0 struct gl_buffer_state *gb =3D gs->buffer;
>>> +=C2=A0=C2=A0=C2=A0 struct weston_paint_node *pnode;
>>> +@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct=20
>>> weston_surface *surface,
>>> +
>>> +=C2=A0=C2=A0=C2=A0 glActiveTexture(GL_TEXTURE0);
>>> +
>>> ++=C2=A0=C2=A0=C2=A0 if (!gr->has_unpack_subimage) {
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_begin_acce=
ss(buffer->shm_buffer);
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < gs->bu=
ffer->num_textures; j++) {
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
glTexImage2D(GL_TEXTURE_2D, 0,
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_format=
[j],
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->pitch /=20
>>> pixel_format_hsub(buffer->pixel_format, j),
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer->height /=20
>>> pixel_format_vsub(buffer->pixel_format, j),
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
>>> ++                    =20
>>> gl_format_from_internal(gs->buffer->gl_format[j]),
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_pixel_=
type,
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data + gs->buffer->of=
fset[j]);
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_end_access=
(buffer->shm_buffer);
>>> ++
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>>> ++=C2=A0=C2=A0=C2=A0 }
>>> ++
>>> +=C2=A0=C2=A0=C2=A0 if (gb->needs_full_upload || quirks->gl_force_ful=
l_upload) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glPixelStorei(GL_UNPACK_S=
KIP_PIXELS_EXT, 0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glPixelStorei(GL_UNPACK_S=
KIP_ROWS_EXT, 0);
>>> +@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *e=
c)
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ec->read_format =3D pixel=
_format_get_info(DRM_FORMAT_ABGR8888);
>>> +
>>> +-=C2=A0=C2=A0=C2=A0 if (gr->gl_version < gr_gl_version(3, 0) &&
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !weston_check_egl_extens=
ion(extensions,=20
>>> "GL_EXT_unpack_subimage")) {
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_log("GL_EXT_unpac=
k_subimage not available.\n");
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> +-=C2=A0=C2=A0=C2=A0 }
>>> ++=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extensi=
on(extensions,=20
>>> "GL_EXT_unpack_subimage"))
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage =
=3D true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extensio=
n(extensions,=20
>>> "GL_EXT_texture_type_2_10_10_10_REV"))
>>> +@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec=
)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr_gl_v=
ersion_minor(gr->gl_version));
>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "read-back format=
: %s\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ec->read_format->drm_format_name);
>>> ++=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "wl_shm sub-imag=
e to texture:=20
>>> %s\n",
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage ? "yes" : "no");
>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "glReadPixels sup=
ports y-flip:=20
>>> %s\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 yesno(gr->has_pack_reverse));
>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "wl_shm 10 bpc fo=
rmats: %s\n",
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend=20
>>> b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
>>> new file mode 100644
>>> index 00000000..cf4f530a
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_13.0.%.bbappend
>>> @@ -0,0 +1,4 @@
>>> +WESTON_TI_VERSION =3D ""
>>> +WESTON_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>>> +
>>> +require ${WESTON_TI_VERSION}
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

