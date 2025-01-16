Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB00DC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 20:44:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3324.1737060247553965975
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 12:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A3i+vfCJ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GKi12G210355
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 14:44:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737060241;
	bh=Hw2T6it0JDIUkd9EAkQwYYB9t6vJN2aDcyHafBNprmg=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=A3i+vfCJDriMyFDmB/2PxvGwdCy9p1ow1o+DDTHTWyLwujO3940YNdKBUqcWDt3nD
	 jPhympEYl79I5EIIPcSvRhJlSpwOMwDuzMephWTL4CPKqIE4lB/YuIIV3wdxGJx24X
	 pq13SSb1jfMgoYkj7b2KCDwGLrUILAacvXrJZyHo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GKi1r0096344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 14:44:01 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 14:44:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 14:44:01 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GKi0Gx033971;
	Thu, 16 Jan 2025 14:44:00 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jan 2025 14:44:00 -0600
Message-ID: <D73SGQ9AG7G6.1BKX0MHJV85I7@ti.com>
Subject: Re: [meta-ti][master][PATCH 1/4] ti-img-rogue-*: version
 24.1.6554834 -> 24.2.6643903
From: Randolph Sapp <rs@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <a-christidis@ti.com>,
        <detheridge@ti.com>, <linux@ew.tq-group.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250114015945.3554905-1-rs@ti.com>
 <20250114015945.3554905-2-rs@ti.com>
 <600d5483778f22a8330fc7150cf402558b12cb29.camel@ew.tq-group.com>
In-Reply-To: <600d5483778f22a8330fc7150cf402558b12cb29.camel@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jan 2025 20:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18201

On Thu Jan 16, 2025 at 8:16 AM CST, Matthias Schiffer wrote:
> On Mon, 2025-01-13 at 19:59 -0600, Randolph Sapp via lists.yoctoproject.o=
rg
> wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Bump the package version for DDK 24.2, this includes a few fixups from
> > IMG and support for a newer version of mesa.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
>
>
> A first test in our TQMa62xx BSP found that the build of ti-img-rogue-dri=
ver
> currently fails with ti-linux 6.12.y if CONFIG_TRACING is enabled in the =
kernel
> config.
>
> Without CONFIG_TRACING, the build is successful and the driver is working=
 as
> expected (tested with Weston + weston-simple-egl so far).
>
> Best,
> Matthias

Thanks for the report. Looking into this now.

- Randolph

> > ---
> >  ...er_24.1.6554834.bb =3D> ti-img-rogue-driver_24.2.6643903.bb} | 4 ++=
--
> >  ...bs_24.1.6554834.bb =3D> ti-img-rogue-umlibs_24.2.6643903.bb} | 4 ++=
--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24=
.1.6554834.bb =3D> ti-img-rogue-driver_24.2.6643903.bb} (93%)
> >  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlib=
s_24.1.6554834.bb =3D> ti-img-rogue-umlibs_24.2.6643903.bb} (98%)
> >=20
> > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_24.2.6643903.bb
> > similarity index 93%
> > rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_24.1.6554834.bb
> > rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_2=
4.2.6643903.bb
> > index 9007872f..eef940d6 100644
> > --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.=
6554834.bb
> > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.=
6643903.bb
> > @@ -13,13 +13,13 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|=
am62xx|am62pxx|j722s"
> > =20
> >  DEPENDS =3D "virtual/kernel"
> > =20
> > -BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> > +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> > =20
> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > -SRCREV =3D "707bb373902babf9ced5fd2f99139209ca0f605a"
> > +SRCREV =3D "51a23d9fba59a9aa9179793dfa6ee649fdd44015"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> > diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_24.2.6643903.bb
> > similarity index 98%
> > rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-um=
libs_24.1.6554834.bb
> > rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umli=
bs_24.2.6643903.bb
> > index 720a3cff..0de66b72 100644
> > --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.1.6554834.bb
> > +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.2.6643903.bb
> > @@ -12,9 +12,9 @@ COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|j742s2|am=
62xx|am62pxx|j722s"
> > =20
> >  PR =3D "r3"
> > =20
> > -BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> > +BRANCH =3D "linuxws/scarthgap/k6.12/${PV}"
> >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> > -SRCREV =3D "ba93a3e38c683ccb03a7cf8f2e7dffe2f9cbcf1c"
> > +SRCREV =3D "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
> >  S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD=
}"
> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18196): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/18196
> > Mute This Topic: https://lists.yoctoproject.org/mt/110600827/4454427
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [matthias.s=
chiffer@ew.tq-group.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


