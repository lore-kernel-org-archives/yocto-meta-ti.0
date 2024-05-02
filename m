Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2E4C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 18:16:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1838.1714673751437893735
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 11:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ubcCC62h;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442IFm6L102956;
	Thu, 2 May 2024 13:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714673748;
	bh=Fih9c86n8o47ivbvNprdQkVl0Qh8TYplChROvRJtzIc=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=ubcCC62hZiaVhFmbp9azftPL8L8E0H5TM/ZQEaROPwAHr1jy9LDQ7K3NW9BEkp7Ma
	 mV3LijPBq0wo17Hf8Y5jbq5vfpr/W08rpMqXmeaAq8OAyTey3fRDoCZ249S/mcuxwh
	 trmx3dcRhuezaTnlAX9HTs5wGVB3pCGVGiuSF2Fo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442IFlsb023211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 13:15:48 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 13:15:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 13:15:47 -0500
Received: from localhost ([10.249.35.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442IFl2Q022335;
	Thu, 2 May 2024 13:15:47 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 May 2024 13:15:47 -0500
Message-ID: <D0ZD452YQ013.2KHG2L807FBD4@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add
 recipe for 23.2.1
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.17.0
References: <20240430213821.3697267-1-rs@ti.com>
 <20240430213821.3697267-4-rs@ti.com> <20240501164707.GR28791@denix.org>
In-Reply-To: <20240501164707.GR28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 18:16:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17632

On Wed May 1, 2024 at 11:47 AM CDT, Denys Dmytriyenko wrote:
> On Tue, Apr 30, 2024 at 04:38:21PM -0500, Randolph Sapp via lists.yoctopr=
oject.org wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
> > This branch does not currently contain SGX patches so it is also being
> > masked by the ltsprep branding to prevent regressing those devices
> > currently.
> >=20
> > Please note that because this recipe is currently in
> > SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
> > switching away from the ltsprep tag.
>
> This is less specific to SIGGEN_EXCLUDERECIPES_ABISAFE and more generic t=
o=20
> any time you downgrade a component version while having a local sstate wi=
th=20
> a new version (and use a PR server as well) - it will show "Version going=
=20
> backwards" errors.


See, that's what I assumed, but because the error was specifically about th=
e
license stage, there was no generic [version-going-backwards] qa warning, a=
nd
the kernel wasn't suffering from the same issue I assumed it was related to
SIGGEN_EXCLUDERECIPES_ABISAFE trying to keep some artifacts around.

I did not get a chance to test it though. Do you know what the kernel does =
to
avoid this or is this? Is it some behavior handled specifically by the kern=
el
class? I asked Ryan about it when I first saw the error but he didn't know.


> > Please issue a clean to mesa and
> > ti-img-rogue-umlibs if you get warnings from either package's
> > do_create_runtime_spdx step.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >  .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.b=
b
> >=20
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/met=
a-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > new file mode 100644
> > index 00000000..c83ba87d
> > --- /dev/null
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > @@ -0,0 +1,59 @@
> > +# PowerVR Graphics require several patches that have not made their wa=
y
> > +# upstream yet. This allows us to build the shims we need without comp=
letely
> > +# clobbering mesa.
> > +
> > +DEFAULT_PREFERENCE =3D "-1"
> > +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}_${PV}:"
> > +
> > +require recipes-graphics/mesa/mesa.inc
> > +
> > +SUMMARY +=3D " (with PowerVR support for TI platforms)"
> > +
> > +LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9=
dc533a0735ef10"
> > +
> > +BRANCH =3D "powervr/${PV}"
> > +
> > +SRC_URI =3D " \
> > +    git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttp=
s;branch=3D${BRANCH} \
> > +    file://0001-meson.build-check-for-all-linux-host_os-combinations.p=
atch \
> > +    file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> > +    file://0001-gallium-Fix-build-with-llvm-17.patch \
> > +    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch=
 \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +PACKAGECONFIG:append =3D " \
> > +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-i=
mg-rogue-driver', 'pvr', '', d)} \
> > +    ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-s=
gx-ddk-km', 'sgx', '', d)} \
> > +"
> > +
> > +SRCREV =3D "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> > +
> > +PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
> > +PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER=
_ALIAS},"
> > +PACKAGECONFIG[sgx] =3D "-Dgallium-sgx-alias=3D${PVR_DISPLAY_CONTROLLER=
_ALIAS},"
> > +
> > +PACKAGECONFIG:remove =3D "video-codecs"
> > +PACKAGECONFIG[video-codecs] =3D ""
> > +PACKAGECONFIG:remove =3D "elf-tls"
> > +PACKAGECONFIG[elf-tls] =3D ""
> > +PACKAGECONFIG:remove =3D "xvmc"
> > +PACKAGECONFIG[xvmc] =3D ""
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr'=
, ',pvr', '', d)}"
> > +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'sgx'=
, ',sgx', '', d)}"
> > +
> > +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pvr'=
, ',pvr', '', d)}"
> > +
> > +do_install:append () {
> > +    # remove pvr custom pkgconfig
> > +    rm -rf ${D}${datadir}/pkgconfig
> > +}
> > +
> > +FILES:${PN}-dev +=3D "${datadir}/mesa/wayland-drm.xml"
> > +FILES:mesa-vulkan-drivers +=3D "${libdir}/libpvr_mesa_wsi.so"
> > +
> > +RRECOMMENDS:mesa-megadriver:append:class-target =3D " ${@d.getVar('PRE=
FERRED_PROVIDER_virtual/gpudriver')}"
> > --=20
> > 2.44.0
> >=20


