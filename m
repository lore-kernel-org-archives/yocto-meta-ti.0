Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52558C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:59:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1445.1714672749262014853
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I8k6dWLk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442Hx5q3096572;
	Thu, 2 May 2024 12:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714672745;
	bh=V//8ceXdaoGaLR38/2/buTBEUGlkSNHJLBP+Gv86ETg=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=I8k6dWLkajAQjWv12kHqNjR4Zb/OURJ0mYmvl3yf4pkgI/Fp4xxonQe32oGF0UIA/
	 XxE2Iyed3Hiabs01Lcc2COdGqWPc8IvaJXeeAaILTmtbmOJU3ED2n/qpGZucX0LTBj
	 rDVt23itS9bRqjqKARK1Dpxn2d+N5z92vTu47tzs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442Hx5Si005824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 12:59:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 12:59:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 12:59:04 -0500
Received: from localhost ([10.249.35.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442Hx4E5039687;
	Thu, 2 May 2024 12:59:04 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 May 2024 12:59:04 -0500
Message-ID: <D0ZCRCEXXZ4Q.3UR3RFHQ2ARMA@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/3] ti-img-rogue-*: add ddk
 24.1 recipes for ltsprep
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.17.0
References: <17CB8455266768D4.4497@lists.yoctoproject.org>
 <20240502030152.GT28791@denix.org>
In-Reply-To: <20240502030152.GT28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 17:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17631

On Wed May 1, 2024 at 10:01 PM CDT, Denys Dmytriyenko wrote:
> Reformatted to be a diff against the previous version to spot the actual=
=20
> changes and spot any issues. See below.
>
>
> On Wed, May 01, 2024 at 08:26:19PM -0400, Denys Dmytriyenko wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Add these recipes but lock them behind ltsprep tags because they requir=
e
> > device tree changes that does not work on the current default kernel fo=
r
> > this layer.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  ....6512818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
> >  ....6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} | 10 +++++++-=
--
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >  copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3=
.6512818.bb =3D> ti-img-rogue-driver_24.1.6554834.bb} (94%)
> >  copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_=
23.3.6512818.bb =3D> ti-img-rogue-umlibs_24.1.6554834.bb} (94%)
> >=20
> > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_24.1.6554834.bb
> > similarity index 94%
> > copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
3.3.6512818.bb
> > copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.=
1.6554834.bb
> > index 02ec9fe9..a1b76d27 100644
> > --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.=
6512818.bb
> > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.=
6554834.bb
> > @@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-d=
river"
> >  LICENSE =3D "MIT | GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D=
0403c7dea01a2b8232261e805325fac2"
> > =20
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> >  inherit module
> > =20
> >  PROVIDES =3D "virtual/gpudriver"
> > @@ -22,7 +24,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rog=
ue-driver.git;protocol=3Dhttps;
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > -SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
> > +SRCREV =3D "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> > diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_24.1.6554834.bb
> > similarity index 94%
> > copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_23.3.6512818.bb
> > copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs=
_24.1.6554834.bb
> > index a0a9a295..df426d1a 100644
> > --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
3.3.6512818.bb
> > +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.1.6554834.bb
> > @@ -3,6 +3,8 @@ HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-u=
mlibs"
> >  LICENSE =3D "TI-TFL"
> >  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58=
f99e3baa03de5207e76f"
> > =20
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> >  inherit bin_package
> > =20
> >  INHIBIT_DEFAULT_DEPS =3D ""
> > @@ -14,7 +16,7 @@ PR =3D "r3"
> > =20
> >  BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > -SRCREV =3D "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
> > +SRCREV =3D "e473234158c736248cf71a60080b7faf76fca561"
> >  S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD=
}"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> > @@ -109,7 +111,7 @@ python __anonymous() {
> >          mlprefix =3D d.getVar("MLPREFIX")
> >          pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
> >          d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> > -        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
> > +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
> >          d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-=
umlibs" + suffix)
> >  }
> > =20
> > @@ -133,6 +135,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
> >  # optional tools and tests
> >  FILES:${PN}-tools =3D "${bindir}/"
> >  RDEPENDS:${PN}-tools =3D "python3-core ${PN}"
>
> ^^^
>
> > +INSANE_SKIP:${PN}-tools =3D "ldflags"
> > +RDEPENDS:${PN}-tools =3D "libdrm"
>
> This overrides/replaces earlier RDEPENDS

Good catch.

> > =20
> >  # required firmware
> >  FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
> > @@ -142,4 +146,4 @@ RRECOMMENDS:${PN} +=3D " \
> >      ${PN}-tools \
> >  "
> > =20
> > -INSANE_SKIP:${PN} +=3D "already-stripped dev-so"
> > +INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
>
> Why is ldflags QA check needs to be skipped now?

QA was tripping up on new issues. We are now using the Yocto toolchains wit=
h
some other tricks to produce these binaries. This provides enough metadata =
to
trigger extra stages in the qa checks. One of these checks an internal hash
variable that is not currently being set by the IMG build system, so it wil=
l
fail.

