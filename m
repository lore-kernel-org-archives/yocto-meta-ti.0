Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549BDC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 12:24:22 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.23851.1754483057890574432
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 05:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=fn3FF4f5;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576COFXD119972;
	Wed, 6 Aug 2025 07:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754483055;
	bh=2ip34vGk0fNWTmfYkTxG1zSPVbUE267OvKQs5zj/4Sc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=fn3FF4f5/Ex1KZfZn0F1aG960WJZsblGuRNuCabOpYPC05YfiPjy+MYI1OvIcjxrB
	 Yn/vuOH82vSRCvsaLpTN44bPYg8hIezaB42UI4d1/fDnemRRC2Rj5I36sb+0VKnUy+
	 7kGFVad2hkFZUyy7Qik/AoFpfuiIP02LjnswNnm4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576COFJp124293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 07:24:15 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 07:24:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 07:24:15 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576COFkg3516174;
	Wed, 6 Aug 2025 07:24:15 -0500
Message-ID: <3db11df3-7967-42fc-a620-75dc634702f6@ti.com>
Date: Wed, 6 Aug 2025 07:24:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] recipes-graphics: Add weston fix for SGX
 from meta-arago
To: Daniel Schultz <D.Schultz@phytec.de>, Andrew Davis <afd@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
References: <20250731181617.195697-1-afd@ti.com>
 <9273e71a-ec94-437c-8484-9dad2c7a4033@phytec.de>
 <3388f320-3f3c-42a4-a760-9388e3d85d98@ti.com>
 <fff6fa4e-7c86-4286-bc10-b19e51dbf5cb@phytec.de>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <fff6fa4e-7c86-4286-bc10-b19e51dbf5cb@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 576COFXD119972
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 12:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18895



On 8/5/2025 5:32 PM, Daniel Schultz wrote:
> On 8/5/25 08:20, Andrew Davis wrote:
>> On 8/5/25 9:56 AM, Daniel Schultz wrote:
>>> Hey,
>>>
>>> I would like to report following issue with this patch:
>>>
>>> | DEBUG: Executing shell function BUILDSPEC | error: line 4: Illegal
>>> char '-' (0x2d) in: Release: r0.ti-soc1 | Building target platforms:
>>> aarch64-phytec-linux | Building for target aarch64-phytec-linux |
>>> WARNING: exit code 1 from a shell command. | DEBUG: Python function
>>> do_package_rpm finished | DEBUG: Python function do_package_write_rpm
>>> finished
>>>
>>
>> Thanks for the report, it seems that - is not allowed in RPM
>> version/distro
>> tags. "ti-soc1" might be better as "ti_soc1", or maybe that will mess
>> with
>> Debian..
>>
>> How about just "tisoc1", any objections?
>=20
> tisoc1 sounds like safe solution. Especially if there are uncertainties
> about Debian.

Merged to master.


> - Daniel
>=20
>>
>> Andrew
>>
>>> Best regards,
>>> Daniel
>>>
>>> On 7/31/25 11:16, Andrew Davis via lists.yoctoproject.org wrote:
>>>> This change is needed due to the SGX driver, any distro, not just
>>>> Arago,
>>>> using a TI SoC with SGX will need this fix, so it should go in meta-=
ti.
>>>>
>>>> Signed-off-by: Andrew Davis<afd@ti.com>
>>>> ---
>>>>  =C2=A0 .../wayland/weston-ti-version.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++
>>>>  =C2=A0 ...equire-GL_EXT_unpack_subimage-commit.patch | 95
>>>> +++++++++++++++++++
>>>>  =C2=A0 .../wayland/weston_14.0.%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +
>>>>  =C2=A0 3 files changed, 106 insertions(+)
>>>>  =C2=A0 create mode 100644
>>>> meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>>>  =C2=A0 create mode 100644
>>>> meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL_E=
XT_unpack_subimage-commit.patch
>>>>  =C2=A0 create mode 100644
>>>> meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>>>>
>>>> diff --git
>>>> a/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>>> b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>>> new file mode 100644
>>>> index 00000000..fafef724
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston-ti-version.inc
>>>> @@ -0,0 +1,7 @@
>>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/weston:"
>>>> +
>>>> +PR:append =3D ".ti-soc1"
>>>> +
>>>> +SRC_URI +=3D " \
>>>> +file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
>>>> +"
>>>> diff --git
>>>> a/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL=
_EXT_unpack_subimage-commit.patch
>>>> b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL=
_EXT_unpack_subimage-commit.patch
>>>>
>>>> new file mode 100644
>>>> index 00000000..fbe8f2bb
>>>> --- /dev/null
>>>> +++
>>>> b/meta-ti-bsp/recipes-graphics/wayland/weston/0001-Revert-require-GL=
_EXT_unpack_subimage-commit.patch
>>>> @@ -0,0 +1,95 @@
>>>> +From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2=
001
>>>> +From: Denys Dmytriyenko<denys@konsulko.com>
>>>> +Date: Thu, 6 Jul 2023 01:48:41 +0000
>>>> +Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>>>> +
>>>> +This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>>>> +
>>>> +That commit removed support for GPU drivers without
>>>> GL_EXT_unpack_subimage
>>>> +which SGX does not support. Add back support for GPUs without this
>>>> +extension.
>>>> +
>>>> +Upstream-Status: Inappropriate [specific to TI SGX]
>>>> +
>>>> +Signed-off-by: Andrew Davis<afd@ti.com>
>>>> +Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
>>>> +
>>>> +---
>>>> + libweston/renderer-gl/gl-renderer-internal.h |=C2=A0 2 ++
>>>> + libweston/renderer-gl/gl-renderer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29
>>>> ++++++++++++++++----
>>>> + 2 files changed, 26 insertions(+), 5 deletions(-)
>>>> +
>>>> +diff --git a/libweston/renderer-gl/gl-renderer-internal.h
>>>> b/libweston/renderer-gl/gl-renderer-internal.h
>>>> +index 5032035..85616c9 100644
>>>> +--- a/libweston/renderer-gl/gl-renderer-internal.h
>>>> ++++ b/libweston/renderer-gl/gl-renderer-internal.h
>>>> +@@ -229,6 +229,8 @@ struct gl_renderer {
>>>> +=C2=A0=C2=A0=C2=A0 PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_=
platform_window;
>>>> +=C2=A0=C2=A0=C2=A0 bool has_platform_base;
>>>> +
>>>> ++=C2=A0=C2=A0=C2=A0 bool has_unpack_subimage;
>>>> ++
>>>> +=C2=A0=C2=A0=C2=A0 PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>>>> +=C2=A0=C2=A0=C2=A0 PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>>>> +=C2=A0=C2=A0=C2=A0 PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>>>> +diff --git a/libweston/renderer-gl/gl-renderer.c
>>>> b/libweston/renderer-gl/gl-renderer.c
>>>> +index e694418b..2be6d621 100644
>>>> +--- a/libweston/renderer-gl/gl-renderer.c
>>>> ++++ b/libweston/renderer-gl/gl-renderer.c
>>>> +@@ -2523,6 +2523,7 @@ gl_renderer_flush_damage(struct
>>>> weston_paint_node *pnode)
>>>> +=C2=A0=C2=A0=C2=A0 struct weston_surface *surface =3D pnode->surfac=
e;
>>>> +=C2=A0=C2=A0=C2=A0 const struct weston_testsuite_quirks *quirks =3D
>>>> + &surface->compositor->test_data.test_quirks;
>>>> ++=C2=A0=C2=A0=C2=A0 struct gl_renderer *gr =3D get_renderer(surface=
->compositor);
>>>> +=C2=A0=C2=A0=C2=A0 struct weston_buffer *buffer =3D surface->buffer=
_ref.buffer;
>>>> +=C2=A0=C2=A0=C2=A0 struct gl_surface_state *gs =3D get_surface_stat=
e(surface);
>>>> +=C2=A0=C2=A0=C2=A0 struct gl_buffer_state *gb =3D gs->buffer;
>>>> +@@ -2550,6 +2551,24 @@ gl_renderer_flush_damage(struct
>>>> weston_paint_node *pnode)
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 data =3D wl_shm_buffer_get_data(buffer->shm_buff=
er);
>>>> +
>>>> ++=C2=A0=C2=A0=C2=A0 if (!gr->has_unpack_subimage) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_begin_acc=
ess(buffer->shm_buffer);
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < gs->b=
uffer->num_textures; j++) {
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 glTexImage2D(GL_TEXTURE_2D, 0,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_for=
mat[j],
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->pitch =
/
>>>> pixel_format_hsub(buffer->pixel_format, j),
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer->height /
>>>> pixel_format_vsub(buffer->pixel_format, j),
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
>>>> ++ gl_format_from_internal(gs->buffer->gl_format[j]),
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gs->buffer->gl_pix=
el_type,
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data + gs->buffer-=
>offset[j]);
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_end_acces=
s(buffer->shm_buffer);
>>>> ++
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>>>> ++=C2=A0=C2=A0=C2=A0 }
>>>> ++
>>>> +=C2=A0=C2=A0=C2=A0 if (gb->needs_full_upload || quirks->gl_force_fu=
ll_upload) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wl_shm_buffer_begin_acce=
ss(buffer->shm_buffer);
>>>> +
>>>> +@@ -4754,11 +4773,9 @@ gl_renderer_setup(struct weston_compositor *=
ec)
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ec->read_format =3D pixe=
l_format_get_info(DRM_FORMAT_ABGR8888);
>>>> +
>>>> +-=C2=A0=C2=A0=C2=A0 if (gr->gl_version < gr_gl_version(3, 0) &&
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !weston_check_egl_exten=
sion(extensions,
>>>> "GL_EXT_unpack_subimage")) {
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_log("GL_EXT_unpa=
ck_subimage not available.\n");
>>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>>> +-=C2=A0=C2=A0=C2=A0 }
>>>> ++=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extens=
ion(extensions,
>>>> "GL_EXT_unpack_subimage"))
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage=
 =3D true;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (gr->gl_version >=3D gr_gl_version(3, 0) ||
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 weston_check_egl_extensi=
on(extensions,
>>>> "GL_EXT_texture_type_2_10_10_10_REV"))
>>>> +@@ -4880,6 +4897,8 @@ gl_renderer_setup(struct weston_compositor *e=
c)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gr_gl_=
version_minor(gr->gl_version));
>>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "read-back forma=
t: %s\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ec->read_format->drm_format_name);
>>>> ++=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "wl_shm sub-ima=
ge to texture:
>>>> %s\n",
>>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gr->has_unpack_subimage ? "yes" : "no");
>>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "glReadPixels su=
pports y-flip:
>>>> %s\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 yesno(gr->has_pack_reverse));
>>>> +=C2=A0=C2=A0=C2=A0 weston_log_continue(STAMP_SPACE "glReadPixels su=
pports PBO: %s\n",
>>>> diff --git
>>>> a/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>>>> b/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>>>> new file mode 100644
>>>> index 00000000..cf4f530a
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-graphics/wayland/weston_14.0.%.bbappend
>>>> @@ -0,0 +1,4 @@
>>>> +WESTON_TI_VERSION =3D ""
>>>> +WESTON_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
>>>> +
>>>> +require ${WESTON_TI_VERSION}
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online
>>>> (#18859):https://lists.yoctoproject.org/g/meta-ti/message/18859
>>>> Mute This Topic:https://lists.yoctoproject.org/mt/114471414/4454627
>>>> Group Owner:meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe:https://lists.yoctoproject.org/g/meta-ti/unsub
>>>> [d.schultz@phytec.de]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

