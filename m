Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 351C8E00546; Wed, 22 Aug 2018 16:13:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9420CE00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 16:13:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MNDU69104091
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 18:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534979610;
	bh=1okzlXXSGsmBUPGsdzQne8qbd4yXYTugkAJAKCiFxdY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=d/w25c4vc5ChaQON19UKH9x/kroAeY4B0TCESz5ztw/eFGbtIuKGNwIt1BaWmIzGH
	sjY5lulT3FrX+GiGR0h16+5/bVx/2U9eh5Z3nau4wgI3SrQnEo9/UqZWib3l07IT3c
	jarcURxhjXJvy3DQMgQlCghPj5jgbuDRWtcMq0uU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MNDTIm019477
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 18:13:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 18:13:29 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Wed, 22 Aug 2018 18:13:29 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH 2/4] common-csl-ip: Update to new
	version 05.01.00.00
Thread-Index: AQHUOmpGfRL3CbGYu0S1Pokq8f6kqaTMZpDA
Date: Wed, 22 Aug 2018 23:13:29 +0000
Message-ID: <6141e6d4ccd14acc8e813e2d13c7b133@ti.com>
References: <1534974652-28676-1-git-send-email-sam.nelson@ti.com>
	<1534974652-28676-2-git-send-email-sam.nelson@ti.com>
	<20180822224747.GK29422@beryl>
In-Reply-To: <20180822224747.GK29422@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.191.59]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH 2/4] common-csl-ip: Update to new version 05.01.00.00
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 23:13:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 22, 2018 6:48 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH 2/4] common-csl-ip: Update to new
> version 05.01.00.00
>=20
> On Wed, Aug 22, 2018 at 05:50:50PM -0400, Sam Nelson wrote:
> > Adds support for am65xx
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 2 +-
> >  recipes-bsp/common-csl-ip/common-csl-ip.inc         | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/reci=
pes-
> bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> > index 5f2dbd5..7da02a3 100644
> > --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> > +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> > @@ -2,7 +2,7 @@ require common-csl-ip.inc
> >  PR =3D "${INC_PR}.6"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > -COMPATIBLE_MACHINE_append =3D "|c66x"
> > +COMPATIBLE_MACHINE_append =3D "|c66x|am65xx-evm"
>=20
> k3?

Yes this is for K3.

>=20
>=20
> >  inherit ti-pdk
> >
> > diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-
> bsp/common-csl-ip/common-csl-ip.inc
> > index 8387095..ed8078d 100644
> > --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
> >
> >  COMPATIBLE_MACHINE =3D "keystone|dra7xx|ti33x|ti43x|omapl1"
> >
> > -PV =3D "03.03.00.11A"
> > +PV =3D "05.01.00.00"
> >  INC_PR =3D "r0"
> >
> >  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> > @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL =3D"git"
> >  CSL_GIT_BRANCH =3D "master"
> >  CSL_GIT_DESTSUFFIX =3D "git"
> >
> > -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-
> SDK.03.03.00.11A"
> > -CSL_SRCREV =3D "c7b021fd5e7efa2feb8f558b3a3fd63d5dee266f"
> > +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-
> SDK.05.01.00.00"
> > +CSL_SRCREV =3D "8db3d673101a504fd7fb36d6c9c4981e1e15ff50"
> >
> >  BRANCH=3D"${CSL_GIT_BRANCH}"
> >  SRC_URI =3D
> "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BRANCH};destsu
> ffix=3D${CSL_GIT_DESTSUFFIX}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

