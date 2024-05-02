Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631CCC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:49:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1237.1714672156927157433
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I0ufqSu5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442HnDI8019410;
	Thu, 2 May 2024 12:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714672153;
	bh=3n/pF89Hk+tsFQPV0AFt0kgzLTUwZHZxt/ET6tcsYRM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=I0ufqSu5A07AQHsiOParEnLHQiT9uWPSrbSxHpsj0rGa5f17GmZto4XyV4MGmS3In
	 rqJkcWJXanWhqm7fALJnPDJIh2aeiV3pLsaWWn8R8K9vXJ3nJHherAJeWSu14iOrkc
	 FOIK6KZHrCB5mhZBAPWe8LlkMslM0Nrps4KMzo58=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442HnDrt010556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 12:49:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 12:49:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 12:49:13 -0500
Received: from localhost ([10.249.35.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442HnDDN023026;
	Thu, 2 May 2024 12:49:13 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 May 2024 12:49:13 -0500
Message-ID: <D0ZCJSP19XGP.20XFQ3HQIS1X6@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 3/3] mesa-pvr_23.2.1: add
 recipe for 23.2.1
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.17.0
References: <20240502002621.3456112-1-denis@denix.org>
 <17CB845523E152B6.4497@lists.yoctoproject.org>
 <20240502030616.GU28791@denix.org>
In-Reply-To: <20240502030616.GU28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 17:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17630

On Wed May 1, 2024 at 10:06 PM CDT, Denys Dmytriyenko wrote:
> On Wed, May 01, 2024 at 08:26:21PM -0400, Denys Dmytriyenko wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Add a recipe for mesa-pvr to use a newer branch based on mesa 23.2.1.
> > This branch does not currently contain SGX patches so it is also being
> > masked by the ltsprep branding to prevent regressing those devices
> > currently.
> >=20
> > Please note that because this recipe is currently in
> > SIGGEN_EXCLUDERECIPES_ABISAFE you may run into sstate errors when
> > switching away from the ltsprep tag. Please issue a clean to mesa and
> > ti-img-rogue-umlibs if you get warnings from either package's
> > do_create_runtime_spdx step.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  .../mesa/{mesa-pvr_22.3.5.bb =3D> mesa-pvr_23.2.1.bb}  | 12 ++++++----=
--
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >  copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr_22.3.5.bb =3D> mesa-p=
vr_23.2.1.bb} (83%)
> >=20
> > diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/met=
a-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > similarity index 83%
> > copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > index 5abd0793..c83ba87d 100644
> > --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
> > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> > @@ -2,23 +2,23 @@
> >  # upstream yet. This allows us to build the shims we need without comp=
letely
> >  # clobbering mesa.
> > =20
> > +DEFAULT_PREFERENCE =3D "-1"
> > +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}_${PV}:"
>
> This is wrong - ${PN}-${PV} is one of the default locations for patches,=
=20
> not ${PN}_${PV}.
>


Huh. Checking oe-core/meta/classes-global/base.bbclass and the documentatio=
n it
doesn't look like it but dumping the variables at runtime, you seem to be
right...

Wonder what's appending that. I'll spin up a new revision.


> > +
> >  require recipes-graphics/mesa/mesa.inc
> > =20
> >  SUMMARY +=3D " (with PowerVR support for TI platforms)"
> > =20
> >  LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D63779ec98d78d823a9=
dc533a0735ef10"
> > =20
> > -BRANCH =3D "powervr/kirkstone/${PV}"
> > +BRANCH =3D "powervr/${PV}"
> > =20
> >  SRC_URI =3D " \
> >      git://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=3Dhttp=
s;branch=3D${BRANCH} \
> >      file://0001-meson.build-check-for-all-linux-host_os-combinations.p=
atch \
> >      file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> > -    file://0001-util-format-Check-for-NEON-before-using-it.patch \
> > -    file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
> > -    file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.p=
atch \
> >      file://0001-gallium-Fix-build-with-llvm-17.patch \
> > -    file://0001-fix-gallivm-limit-usage-of-LLVMContextSetOpaquePoint.p=
atch \
> > +    file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch=
 \
> >  "
> > =20
> >  S =3D "${WORKDIR}/git"
> > @@ -28,7 +28,7 @@ PACKAGECONFIG:append =3D " \
> >      ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-s=
gx-ddk-km', 'sgx', '', d)} \
> >  "
> > =20
> > -SRCREV =3D "1be98ba80452ebe38546a7fca26b5a70f2629083"
> > +SRCREV =3D "b12290126ba6a154f0e8b0a8c8b2b0d64f98e427"
> > =20
> >  PVR_DISPLAY_CONTROLLER_ALIAS ??=3D "tidss"
> >  PACKAGECONFIG[pvr] =3D "-Dgallium-pvr-alias=3D${PVR_DISPLAY_CONTROLLER=
_ALIAS},"
> > --=20
> > 2.25.1


