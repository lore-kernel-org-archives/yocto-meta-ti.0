Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FBBC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 03:21:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.34611.1676949709809097045
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 19:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9532B40C30;
	Tue, 21 Feb 2023 03:21:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkPcLp3ZXTuB; Tue, 21 Feb 2023 03:21:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4215A409B0;
	Tue, 21 Feb 2023 03:21:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0AAEE163763; Mon, 20 Feb 2023 22:21:16 -0500 (EST)
Date: Mon, 20 Feb 2023 22:21:15 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: rs@ti.com, denys@ti.com, reatmon@ti.com, detheridge@ti.com, afd@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH v7 1/3] meta-ti-bsp: graphics:
 Resolve dependency chain
Message-ID: <20230221032115.GO22689@denix.org>
References: <20230130232007.2393097-1-rs@ti.com>
 <20230130232007.2393097-2-rs@ti.com>
 <CANPvuRkm6pxPOuchL0cwLkk-dx35PeMB8euNu7vRnsuSDFzZ2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRkm6pxPOuchL0cwLkk-dx35PeMB8euNu7vRnsuSDFzZ2Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 03:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15893

On Mon, Feb 20, 2023 at 11:06:28AM +0000, Jose Quaresma wrote:
> Randolph Sapp via lists.yoctoproject.org <rs=3Dti.com@lists.yoctoprojec=
t.org>
> escreveu no dia segunda, 30/01/2023 =E0(s) 23:20:
>=20
> > Patched mesa will now be configured based on what virtual/gpudriver
> > preferred provider is selected. The gpu drivers will now runtime
> > recommend the associated um components.
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---

<snip>

> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappen=
d
> > b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> > new file mode 100644
> > index 00000000..912e9e9d
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
> > @@ -0,0 +1 @@
> > +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriv=
er',
> > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> > b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> > new file mode 100644
> > index 00000000..912e9e9d
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
> > @@ -0,0 +1 @@
> > +require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriv=
er',
> > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> > b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> > new file mode 100644
> > index 00000000..17edee8d
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
> > @@ -0,0 +1,40 @@
> > +# PowerVR Graphics require several patches that have not made their =
way
> > +# upstream yet. This allows us to build the shims we need without
> > completely
> > +# clobbering mesa.
> > +
> > +BRANCH =3D "powervr/kirkstone/22.0"
> > +
> > +SRC_URI =3D " \
> > +    git://
> > gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps;branch=3D=
${BRANCH}
> > <http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttps=
;branch=3D$%7BBRANCH%7D>
> > \
> > +
> > file://0001-meson.build-check-for-all-linux-host_os-combinations.patc=
h \
> > +    file://0002-meson.build-make-TLS-ELF-optional.patch \
> > +    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> > +    file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch=
 \
> > +    file://0001-util-format-Check-for-NEON-before-using-it.patch \
> > +
> > file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patc=
h \
> > +"
> >
>=20
> Having here all the patches in oe-core will stop working if someone cha=
nges
> the main recipe.
> This already happens in the master branch of oe-core.
>=20
> IMO If these patches are needed they should be merged on the ti fork br=
anch.

The same exact comment was already provided offline in the past, along wi=
th=20
a number of others, and there was supposed to be v8 coming... Not sure wh=
at=20
happened and why unmodified v7 got merged...


> > +S =3D "${WORKDIR}/git"
> > +
> > +SRCREV =3D "44b82a7b6fa8a86243911b1b0d6a07b0fd8ecfba"
> > +
> > +PACKAGECONFIG:append =3D " \
> > +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver',
> > 'ti-img-rogue-driver', 'pvr', '', d)} \
> > +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver',
> > 'ti-sgx-ddk-km', 'sgx', '', d)} \
> > +"
> > +
> > +PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
> > +PACKAGECONFIG[pvr] =3D
> > "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER_ALIAS},"
> > +PACKAGECONFIG[sgx] =3D
> > "-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLER_ALIAS},"
> > +
> > +PV:append =3D "+pvr"
> > +
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pv=
r',
> > ',pvr', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sg=
x',
> > ',sgx', '', d)}"
> > +
> > +do_install:append () {
> > +    # remove pvr custom pkgconfig
> > +    rm -rf ${D}${datadir}/pkgconfig
> > +}
> > +
> > +RRECOMMENDS:mesa-megadriver:class-target:append =3D
> > "${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
> > --
> > 2.34.1

