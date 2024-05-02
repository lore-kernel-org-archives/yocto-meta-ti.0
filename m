Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9451AC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 18:30:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2242.1714674644441060819
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 11:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K9vCPyXq;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442IUeYl106048;
	Thu, 2 May 2024 13:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714674640;
	bh=YQfLcm5nu65nDm8+cQwwBNRYgorK/z451SzG5uMcJ84=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=K9vCPyXqxwFZVdnfLThBOoy3M3J4fvTbRX4odHTydvZiPnS8qt0AZwaTkaGoG/Gvb
	 G1aPKlVV5qHCFFd9RLV+MQFZMUhZtusSA9tDb44pHwI8765y87+uPPYVzQLCosVx16
	 HSSoWuCJibDhE7R2EDnrnHw5wY204Uy+sz9iqPDQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442IUeil033874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 13:30:40 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 13:30:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Thu, 2 May
 2024 13:30:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 13:30:40 -0500
Received: from localhost ([10.249.35.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442IUdZb103734;
	Thu, 2 May 2024 13:30:40 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 May 2024 13:30:39 -0500
Message-ID: <D0ZDFJ3S2QWY.28B324X3VV6XF@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add
 recipe for 23.2.1
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.17.0
References: <20240502002621.3456112-1-denis@denix.org>
 <17CB845523E152B6.4497@lists.yoctoproject.org>
 <20240502030616.GU28791@denix.org> <D0ZCJSP19XGP.20XFQ3HQIS1X6@ti.com>
 <20240502182023.GV28791@denix.org>
In-Reply-To: <20240502182023.GV28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 18:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17634

On Thu May 2, 2024 at 1:20 PM CDT, Denys Dmytriyenko wrote:
> On Thu, May 02, 2024 at 12:49:13PM -0500, Randolph Sapp wrote:
> > On Wed May 1, 2024 at 10:06 PM CDT, Denys Dmytriyenko wrote:
> > > On Wed, May 01, 2024 at 08:26:21PM -0400, Denys Dmytriyenko wrote:
> > > > From: Randolph Sapp <rs@ti.com>
> > > >=20
> > > > Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.=
1.
> > > > This branch does not currently contain SGX patches so it is also be=
ing
> > > > masked by the ltsprep branding to prevent regressing those devices
> > > > currently.
> > > >=20
> > > > Please note that because this recipe is currently in
> > > > SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
> > > > switching away from the ltsprep tag. Please issue a clean to mesa a=
nd
> > > > ti-img-rogue-umlibs if you get warnings from either package's
> > > > do_create_runtime_spdx step.
> > > >=20
> > > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > > > ---
> > > >  .../mesa/{mesa-pvr_22.3.5.bb =3D> mesa-pvr_23.2.1.bb}  | 12 ++++++=
------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >  copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_22.3.5.bb =3D> me=
sa-pvr_23.2.1.bb} (83%)
> > > >=20
> > > > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b=
/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > > > similarity index 83%
> > > > copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > > > copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > > > index 5abd0793..c83ba87d 100644
> > > > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > > > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > > > @@ -2,23 +2,23 @@
> > > >  # upstream yet. This allows us to build the shims we need without =
completely
> > > >  # clobbering mesa.
> > > > =20
> > > > +DEFAULT_PREFERENCE =3D "-1"
> > > > +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}_${PV}:"
> > >
> > > This is wrong - ${PN}-${PV} is one of the default locations for patch=
es,=20
> > > not ${PN}_${PV}.
> > >
> >=20
> >=20
> > Huh. Checking oe-core/meta/classes-global/base.bbclass and the document=
ation it
> > doesn't look like it but dumping the variables at runtime, you seem to =
be
> > right...
> >=20
> > Wonder what's appending that. I'll spin up a new revision.
>
> P =3D "${PN}-${PV}"
> BP is "base" P w/o any prefixes/suffixes like "nativesdk-" or "-native"
> And base.bbclass adds both ${BP}, ${BPN} and files to FILESPATH (from mos=
t=20
> to least specific):
> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/b=
ase.bbclass#n59


Ah, rats. I didn't realize BP was "${PN}-${PV}", I figured it base the base
package name. Thanks for the info.


> > > >  require recipes-graphics/mesa/mesa.inc
> > > > =20
> > > >  SUMMARY +=3D " (with PowerVR support for TI platforms)"
> > > > =20
> > > >  LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d8=
23a9dc533a0735ef10"
> > > > =20
> > > > -BRANCH =3D "powervr/kirkstone/${PV}"
> > > > +BRANCH =3D "powervr/${PV}"
> > > > =20
> > > >  SRC_URI =3D " \
> > > >      git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3D=
https;branch=3D${BRANCH} \
> > > >      file://0001-meson.build-check-for-all-linux-host_os-combinatio=
ns.patch \
> > > >      file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch=
 \
> > > > -    file://0001-util-format-Check-for-NEON-before-using-it.patch \
> > > > -    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> > > > -    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-=
mu.patch \
> > > >      file://0001-gallium-Fix-build-with-llvm-17.patch \
> > > > -    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoi=
nt.patch \
> > > > +    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.p=
atch \
> > > >  "
> > > > =20
> > > >  S =3D "${WORKDIR}/git"
> > > > @@ -28,7 +28,7 @@ PACKAGECONFIG:append =3D " \
> > > >      ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', '=
ti-sgx-ddk-km', 'sgx', '', d)} \
> > > >  "
> > > > =20
> > > > -SRCREV =3D "1be98ba80452ebe38546a7fca26b5a70f2629083"
> > > > +SRCREV =3D "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> > > > =20
> > > >  PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
> > > >  PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTRO=
LLER_ALIAS},"
> > > > --=20
> > > > 2.25.1


