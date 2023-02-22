Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20FEC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 11:36:16 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.6613.1677065770980625415
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 03:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ee/z0YT2;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id m10so6320286vso.4
        for <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9LEZR+T42B6KlSFNNYlDyl2BnVdL1y7ambifCmUGj0=;
        b=Ee/z0YT2Gs0YXCNaaMnH0NsF5dt+XGflm6R6TN15LnZ5ItTQv93tm3c1S/vjL2ZLQb
         IihHsl6T4n6QqLW/h+dGfbINmDG5jTIKShYoFNYvB8qm2x8w+R0JUb5joHcsJhQTPhou
         Mr6zZJU+2z5UBRxQ0iHoW1itU4UyNU2X9oxYId89g+Gm93vYDg9NuKuSs1ZKYJgiiRus
         pd0fJTbkEHn0IJzIxmvV+SrnzN9S0J4vY5dlVPJQAE46jva4B+YLEqu2nrfQ10g5dk9I
         GY/urGu9bCgfctaCKfS929SIruCSa3AYPGx8Vc/fYcMAjYOWXoPjfrnp+TZCKqvOO271
         +ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9LEZR+T42B6KlSFNNYlDyl2BnVdL1y7ambifCmUGj0=;
        b=pp+u4qY0zRXZYzTfmDTRgqdGinC9sxFeqC64+P7KVzMf7JArCxRQrVgKZL/6PSvdsj
         xCANf3QfgLJ2g2dmH748/TDxotJ+YeAXLsN3MoDG+OxEqMGhN3i3Wr9nE/rkvDFDxPSA
         Fn7c4sjsUqeCJsDb5bYnU6jLnFUJtwgFVBtHTEEUw12FNWptzkpBW/wW8O763oTe35GI
         TyjVrhakUofPAyv2dRPaOp6alVb0qPlUEsB+VzsIq7Bn2yA3J6TqQVsTF+hQLysK9xY8
         rrZDcfo6eEgDtxWcojg/bmvEEY+oyKoMr8vUP8VcgKVRfru/nOQumEcz0y2fdECRZK/W
         b9YA==
X-Gm-Message-State: AO0yUKWfJbxbSn14Gcp5Z9Pos7wbK/5iq9ePOuss3d0yurNbavCgOS+o
	IDq5BZI4yzLGBsyhPSyH9U+Tg2RG165yuqanKLA=
X-Google-Smtp-Source: AK7set/tUVwUhefwio+QyS8GVrNyot87xcHtCFh/qAJX6SSqXARY55cjCvlcjzZT6ZOoydTVxQZ7MWsqFm6I7XjYuzg=
X-Received: by 2002:a1f:a30e:0:b0:3b7:5ff7:cfb8 with SMTP id
 m14-20020a1fa30e000000b003b75ff7cfb8mr1425735vke.11.1677065769915; Wed, 22
 Feb 2023 03:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20230130232007.2393097-1-rs@ti.com> <20230130232007.2393097-2-rs@ti.com>
 <CANPvuRkm6pxPOuchL0cwLkk-dx35PeMB8euNu7vRnsuSDFzZ2Q@mail.gmail.com>
 <20230221032115.GO22689@denix.org> <4L0GQR.OH649BQST1VF3@ti.com>
In-Reply-To: <4L0GQR.OH649BQST1VF3@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Feb 2023 11:35:58 +0000
Message-ID: <CANPvuRmPpMU8cgqypGd8bE+-aFs9rCvJYSxUsm591U5y4V3LDg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v7 1/3] meta-ti-bsp:
 graphics: Resolve dependency chain
To: "Sapp, Randolph" <rs@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, denys@ti.com, reatmon@ti.com, detheridge@ti.com, 
	afd@ti.com, meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Content-Type: multipart/alternative; boundary="0000000000007b197f05f5484db9"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 11:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15906

--0000000000007b197f05f5484db9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sapp, Randolph <rs@ti.com> escreveu no dia ter=C3=A7a, 21/02/2023 =C3=A0(s)=
 18:27:

> On Mon, Feb 20 2023 at 22:21:15 -05:00:00, Denys Dmytriyenko <
> denis@denix.org> wrote:
>
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend =
>
> b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend > new file mo=
de
> 100644 > index 00000000..912e9e9d > --- /dev/null > +++
> b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend > @@ -0,0 +1 =
@@
> > +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver=
',
> > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)} > diff --g=
it
> a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend >
> b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend > new file mode
> 100644 > index 00000000..912e9e9d > --- /dev/null > +++
> b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend > @@ -0,0 +1 @@ =
>
> +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',
> > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)} > diff --g=
it
> a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc >
> b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc > new file mode 100644 >
> index 00000000..17edee8d > --- /dev/null > +++
> b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc > @@ -0,0 +1,40 @@ > +#
> PowerVR Graphics require several patches that have not made their way > +=
#
> upstream yet. This allows us to build the shims we need without >
> completely > +# clobbering mesa. > + > +BRANCH =3D "powervr/kirkstone/22.=
0" >
> + > +SRC_URI =3D " \ > + git:// >
> gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D${=
BRANCH}
> <http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;bra=
nch=3D$%7BBRANCH%7D>
> > <
> http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;bran=
ch=3D$%7BBRANCH%7D>
> > \ > + >
> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> > + file://0002-meson.build-make-TLS-ELF-optional.patch \ > +
> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \ > +
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \ > +
> file://0001-util-format-Check-for-NEON-before-using-it.patch \ > + >
> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
> > +" > Having here all the patches in oe-core will stop working if someon=
e
> changes the main recipe. This already happens in the master branch of
> oe-core. IMO If these patches are needed they should be merged on the ti
> fork branch.
>
> The same exact comment was already provided offline in the past, along
> with a number of others, and there was supposed to be v8 coming... Not su=
re
> what happened and why unmodified v7 got merged...
>
>
> That's my bad. Got tunnel vision trying to get SGX opperational and forgo=
t
> about some of the suggested changes for v8. I'll submit a patch to resolv=
e
> that when I get SGX opperational. I believe the solution that seemed most
> applicable was to drop the patch commit and instead use the patch paths
> from oe-core directly.
>
> We didn't want to carry those patches in mesa since some of those are
> backports and distribution specific hacks for packaging. I want to keep
> mesa as vanilla as possible for multi-distro.
>

SRC_URI +=3D "git://
gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D${BR=
ANCH}
"
SRC_URI:remove =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz"

This currently does the job for me and with a broader mesa-gl_22.%.bbappend
but maybe mesa-gl_%.bbappend is even better.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007b197f05f5484db9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Sapp, Randolph &lt;<a href=3D"mailto:=
rs@ti.com">rs@ti.com</a>&gt; escreveu no dia ter=C3=A7a, 21/02/2023 =C3=A0(=
s) 18:27:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div i=
d=3D"m_-982767826742473280geary-body" dir=3D"auto">On Mon, Feb 20 2023 at 2=
2:21:15 -05:00:00, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org"=
 target=3D"_blank">denis@denix.org</a>&gt; wrote:<br><blockquote type=3D"ci=
te"><div style=3D"white-space:break-spaces">
<blockquote> &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22=
.0.%.bbappend
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 &gt; new file mode 100644
 &gt; index 00000000..912e9e9d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 &gt; @@ -0,0 +1 @@
 &gt; +require <a href=3D"mailto:$%7B@bb.utils.contains" target=3D"_blank">=
${@bb.utils.contains</a>_any(&#39;PREFERRED_PROVIDER_virtual/gpudriver&#39;=
,
 &gt; &#39;ti-img-rogue-driver ti-sgx-ddk-km&#39;, &#39;pvr-mesa.inc&#39;, =
&#39;&#39;, d)}
 &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; new file mode 100644
 &gt; index 00000000..912e9e9d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; @@ -0,0 +1 @@
 &gt; +require <a href=3D"mailto:$%7B@bb.utils.contains" target=3D"_blank">=
${@bb.utils.contains</a>_any(&#39;PREFERRED_PROVIDER_virtual/gpudriver&#39;=
,
 &gt; &#39;ti-img-rogue-driver ti-sgx-ddk-km&#39;, &#39;pvr-mesa.inc&#39;, =
&#39;&#39;, d)}
 &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; new file mode 100644
 &gt; index 00000000..17edee8d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; @@ -0,0 +1,40 @@
 &gt; +# PowerVR Graphics require several patches that have not made their =
way
 &gt; +# upstream yet. This allows us to build the shims we need without
 &gt; completely
 &gt; +# clobbering mesa.
 &gt; +
 &gt; +BRANCH =3D &quot;powervr/kirkstone/22.0&quot;
 &gt; +
 &gt; +SRC_URI =3D &quot; \
 &gt; +    git://
 &gt; <a href=3D"http://gitlab.freedesktop.org/StaticRocket/mesa.git;protoc=
ol=3Dhttps;branch=3D$%7BBRANCH%7D" target=3D"_blank">gitlab.freedesktop.org=
/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D${BRANCH}</a>
 &gt; &lt;<a href=3D"http://gitlab.freedesktop.org/StaticRocket/mesa.git;pr=
otocol=3Dhttps;branch=3D$%7BBRANCH%7D" target=3D"_blank">http://gitlab.free=
desktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D$%7BBRANCH%7D</=
a>&gt;
 &gt; \
 &gt; +
 &gt; <a>file://0001-meson.build-check-for-all-linux-host_os-combinations.p=
atch</a> \
 &gt; +    <a>file://0002-meson.build-make-TLS-ELF-optional.patch</a> \
 &gt; +    <a>file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h</a> \
 &gt; +    <a>file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch</a> \
 &gt; +    <a>file://0001-util-format-Check-for-NEON-before-using-it.patch<=
/a> \
 &gt; +
 &gt; <a>file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.p=
atch</a> \
 &gt; +&quot;
 &gt;
=20
 Having here all the patches in oe-core will stop working if someone change=
s
 the main recipe.
 This already happens in the master branch of oe-core.
=20
 IMO If these patches are needed they should be merged on the ti fork branc=
h.
</blockquote>
The same exact comment was already provided offline in the past, along with=
=20
a number of others, and there was supposed to be v8 coming... Not sure what=
=20
happened and why unmodified v7 got merged...
</div></blockquote><div><br></div><div>That&#39;s my bad. Got tunnel vision=
 trying to get SGX opperational and forgot about some of the suggested chan=
ges for v8. I&#39;ll submit a patch to resolve that when I get SGX opperati=
onal. I believe the solution that seemed most applicable was to drop the pa=
tch commit and instead use the patch paths from oe-core directly.</div><div=
><br></div><div>We didn&#39;t want to carry those patches in mesa since som=
e of those are backports and distribution specific hacks for packaging. I w=
ant to keep mesa as vanilla as possible for multi-distro.</div></div></bloc=
kquote></div><div><br></div><div>SRC_URI +=3D &quot;git://<a href=3D"http:/=
/gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D${B=
RANCH}">gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branc=
h=3D${BRANCH}</a>&quot;<br>SRC_URI:remove =3D &quot;<a href=3D"https://mesa=
.freedesktop.org/archive/mesa-${PV}.tar.xz">https://mesa.freedesktop.org/ar=
chive/mesa-${PV}.tar.xz</a>&quot;<br></div><div><br></div><div>This current=
ly does the job for me and with a broader mesa-gl_22.%.bbappend but maybe m=
esa-gl_%.bbappend is even better.</div><div><br></div><div>Jose</div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
>Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div>

--0000000000007b197f05f5484db9--

