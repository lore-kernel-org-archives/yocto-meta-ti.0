Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4B59E006ED; Tue, 22 Jul 2014 08:14:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D9A1E00572
	for <meta-ti@yoctoproject.org>; Tue, 22 Jul 2014 08:14:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MFEMpe027414;
	Tue, 22 Jul 2014 10:14:22 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MFEMcs019019;
	Tue, 22 Jul 2014 10:14:22 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 22 Jul 2014 10:14:22 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
Thread-Index: AQHPpTu78DJiWU/dUkSW+eib0Zhp1pusLmLggABVagD//7A2kA==
Date: Tue, 22 Jul 2014 15:14:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E7A32@DFLE08.ent.ti.com>
References: <1405985363-21671-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6E78E6@DFLE08.ent.ti.com>
	<20140722145714.GY15788@edge>
In-Reply-To: <20140722145714.GY15788@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] u-boot: update to 2014.07 release version
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
X-List-Received-Date: Tue, 22 Jul 2014 15:14:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, July 22, 2014 9:57 AM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
>=20
> On Tue, Jul 22, 2014 at 02:54:38PM +0000, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Monday, July 21, 2014 6:29 PM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-bsp/u-boot/u-boot_2014.07.bb | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > b/recipes-bsp/u-boot/u- boot_2014.07.bb index 9da6f7d..593c445
> > > 100644
> > > --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> > > @@ -13,15 +13,14 @@ LIC_FILES_CHKSUM =3D
> > > "file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
> > >
> > >  # This is still an RC so set the PV accordingly to allow proper
> > > version  # ordering when the RC is dropped.
> > [Franklin] This comment can also be deleted.
>=20
> Right, missed that.
>=20
>=20
> > > -PV =3D "2014.04+2014.07-rc3"
> > > -PR =3D "r0"
> > [Franklin] If you're going to create a v2 anyway then it would be nice
> > to leave the PR
>=20
> I'm dropping it on purpose here.
[Franklin] Not a big deal since its functionally equivalent but you mind sh=
aring why?
>=20
>=20
> > > +PV =3D "2014.07"
> > >
> > >  SRC_URI =3D "git://git.denx.de/u-boot.git;protocol=3Dgit;branch=3D${=
BRANCH}"
> > >
> > >  BRANCH ?=3D "master"
> > >
> > > -# Corresponds to tag v2014.07-rc3
> > > -SRCREV =3D "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> > > +# Corresponds to tag v2014.07
> > > +SRCREV =3D "524123a70761110c5cf3ccc5f52f6d4da071b959"
> > >
> > >  SPL_BINARY =3D "MLO"
> > >  SPL_UART_BINARY =3D "u-boot-spl.bin"
> > > --
> > > 2.0.2
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

