Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F220AC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 23:41:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.87689.1719013308142700209
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 16:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mT0pdY4q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LNff49045524;
	Fri, 21 Jun 2024 18:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719013301;
	bh=iBRk49GXyJJQX6zXA9mRnXLWAqylRdSHDRe+eDFotQs=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=mT0pdY4qfRkZPXyHl6GwnaUq0DvmoxhRb5MneLLW24wu7FWFxrIv88O3VwCKMO/VK
	 0xlHPMHkZv0XPaGFEZC3VcuUoP8wbsoOxnI0q5Yn4/XihmEzKLT7rGbGIdO6obrMlr
	 K92O4IoGE4gPunzkhL4O1P3CsYsaCkEffXHITB6k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LNffCL051290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 18:41:41 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 18:41:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 18:41:41 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LNff6J013548;
	Fri, 21 Jun 2024 18:41:41 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 21 Jun 2024 18:41:41 -0500
Message-ID: <D263CWRYKX4V.3GE2GCYVA30PC@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH]
 ti-img-rogue-driver_23.3.6512818: gcc 14 compat
From: Randolph Sapp <rs@ti.com>
To: Max Krummenacher <max.oss.09@gmail.com>, <denis@denix.org>,
        <reatmon@ti.com>
X-Mailer: aerc 0.17.0
References: <20240621201533.1531567-2-rs@ti.com>
 <7b58709f8ab387300f300e9d2dab96b81639d5cf.camel@gmail.com>
In-Reply-To: <7b58709f8ab387300f300e9d2dab96b81639d5cf.camel@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 23:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17799

On Fri Jun 21, 2024 at 5:41 PM CDT, Max Krummenacher wrote:
> Hello Randolph
>
> Am Freitag, dem 21.06.2024 um 15:15 -0500 schrieb rs@ti.com:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Bump this recipe to add a change to help with GCC 14 compatibility in
> > the check-cc script used to check compiler flags before use.
> >=20
> > Also ports some of the patches that were added to the kirkstone branch
> > post creation of what was supposed to be a temporary scarthgap branch.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >=20
> > Sorry for the delay. Needed to run some tests since there were some oth=
er
> > patches that had not been ported to the intermediary branch.
> >=20
> >  .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_23.3.6512818.bb
> > index 34c22cb2..7fbb0524 100644
> > --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.=
6512818.bb
> > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.=
6512818.bb
> > @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rog=
ue-driver.git;protocol=3Dhttps;
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> > -SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
> > +SRCREV =3D "97727f8606ca984527a470252c0bc3ada1bb3f92"
>
> This SHA is not (yet ?) in the repository.
> I tried with latest HEAD, i.e. 7b04fd4a24fe. That builds fine in my setup=
. Thanks for the quick fix.
>
> Max

Hold on. Just realized the bsp provider logic that's supposed to be selecti=
ng
this recipe thinks this is a compatible driver for kernel 6.1. It's not.

This branch was an intermediary branch for kernel 6.6. There were dt change=
s
made for AM62 that make it incompatible. Have to update the old kirkstone b=
ranch
and reset this recipe to point at that.

Thankfully that means I can finally delete the intermediary 6.6-23.3 branch
since that's not officially supported by anyone...

- Randolph

> > =20
> >  TARGET_PRODUCT:j721e =3D "j721e_linux"
> >  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"


