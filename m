Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0247E006F9
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 12:58:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3MJwPSP009705
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 14:58:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3MJwPJn013724
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 14:58:25 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 22 Apr 2013 14:58:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 3/3] u-boot-am33x: Update u-boot recipe to
	2013.01.01
Thread-Index: AQHOP3WEEiGIplT4UEeWTIifHI9zTpji9JIA//+tldA=
Date: Mon, 22 Apr 2013 19:58:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C42E0D9@DFLE08.ent.ti.com>
References: <1366647702-24282-1-git-send-email-fcooper@ti.com>
	<1366647702-24282-3-git-send-email-fcooper@ti.com>
	<20130422193024.GA28316@denix.org>
In-Reply-To: <20130422193024.GA28316@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 3/3] u-boot-am33x: Update u-boot recipe to 2013.01.01
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
X-List-Received-Date: Mon, 22 Apr 2013 19:58:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 22, 2013 2:30 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 3/3] u-boot-am33x: Update u-boot recipe to
> 2013.01.01
>=20
> On Mon, Apr 22, 2013 at 11:21:42AM -0500, Franklin S. Cooper Jr wrote:
> > * Update to latest version of u-boot that supports the 3.2 kernel.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot-am33x_2012.10.bb    |   17 -----------------
> >  recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |   20
> ++++++++++++++++++++
> >  2 files changed, 20 insertions(+), 17 deletions(-)  delete mode
> > 100644 recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> >  create mode 100644 recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> >
> > diff --git a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > b/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > deleted file mode 100644
> > index 7320e02..0000000
> > --- a/recipes-bsp/u-boot/u-boot-am33x_2012.10.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -require u-boot-ti.inc
> > -
> > -DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
> > -
> > -COMPATIBLE_MACHINE =3D "ti33x|omap3"
>=20
> You are removing the old 2012.10 recipe that is also used for "omap3" SoC=
s.
> Since you are adding the new one only for "ti33x" SoCs, there won't be an=
y
> compatible u-boot for AM37x...

The COMPATIBLE_MACHINE is incorrect. It really should only be ti33x.=20

AM37x is using u-boot-am37x_2012.04.01 anyway.
I don't know why am3517 is using this u-boot.
I will need to add the proper 3517 u-boot recipe.

>=20
>=20
> > -
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -PR =3D "r7+gitr${SRCPV}"
> > -
> > -SRC_URI =3D "git://arago-project.org/git/projects/u-boot-
> am33x.git;protocol=3Dgit;branch=3D${BRANCH}"
> > -
> > -BRANCH =3D "amsdk-05.06.00.00"
> > -
> > -SRCREV =3D "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
> > -
> > -SPL_BINARY =3D "MLO"
> > diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb b/recipes-
> bsp/u-boot/u-boot-am33x_2013.01.01.bb
> > new file mode 100644
> > index 0000000..19ec34e
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
> > @@ -0,0 +1,20 @@
> > +require u-boot-ti.inc
> > +
> > +DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
> > +
> > +COMPATIBLE_MACHINE =3D "ti33x"
> > +
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> > +PR =3D "r5+gitr${SRCPV}"
> > +
> > +SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +# This version of u-boot is meant for 3.2 kernel which doesn't support
> device tree.
> > +BRANCH =3D "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
> > +
> > +# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
> > +SRCREV =3D "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
> > +
> > +# Set the name of the SPL that will built so that it is also packaged =
with u-
> boot.
> > +SPL_BINARY =3D "MLO"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

