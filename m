Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91C06E00DE4; Thu, 28 Apr 2016 09:36:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B105AE00DE1
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 09:36:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3SGaTtH028714
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 11:36:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3SGaTKJ018784
	for <meta-ti@yoctoproject.org>; Thu, 28 Apr 2016 11:36:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 28 Apr 2016 11:36:29 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] cmem: Update to new eng version 4.11.00.00_eng
Thread-Index: AQHRoLFgzqSy19IUnkiSpz/UXxjmo5+fv2AA///TYLA=
Date: Thu, 28 Apr 2016 16:36:29 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905839024B@DLEE11.ent.ti.com>
References: <1461781185-39246-1-git-send-email-sam.nelson@ti.com>
	<20160428140133.GI22291@edge>
In-Reply-To: <20160428140133.GI22291@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] cmem: Update to new eng version 4.11.00.00_eng
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
X-List-Received-Date: Thu, 28 Apr 2016 16:36:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. Changes are expected to be compatible.=20
But no testing done on older versions of kernel.
Sam
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, April 28, 2016 10:02 AM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] cmem: Update to new eng version
> 4.11.00.00_eng
>=20
> Does it keep compatibility with 4.1?
>=20
> On Wed, Apr 27, 2016 at 02:19:45PM -0400, Sam Nelson wrote:
> > Resolves issues with kernel version 4.4
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/cmem/cmem.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > index 19d333c..413f925 100644
> > --- a/recipes-bsp/cmem/cmem.inc
> > +++ b/recipes-bsp/cmem/cmem.inc
> > @@ -4,10 +4,10 @@ LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3D9b745e2765a6ba=
8a63
> 6c91aed4b02ac1"
> >
> >  BRANCH ?=3D "lu-next"
> > -# This corresponds to version 4.10.02.05_eng -SRCREV =3D
> > "8df44102413c2d653341c5b7e6caee882e206d8c"
> > +# This corresponds to version 4.11.00.00_eng SRCREV =3D
> > +"852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
> >
> > -PV =3D "4.10.02.05+git${SRCPV}"
> > +PV =3D "4.11.00.00+git${SRCPV}"
> >
> >  SRC_URI =3D "git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${=
BRANCH}"
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

