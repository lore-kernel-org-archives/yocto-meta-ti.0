Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E1DFE015FF
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 15:16:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KMG8Em007821;
	Fri, 20 Sep 2013 17:16:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KMG86j016223;
	Fri, 20 Sep 2013 17:16:08 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 17:16:08 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with
	platform-base and PMIC merged
Thread-Index: AQHOtkPwgaVMUFeAJUONItYoVSdF75nPIVRQgABipQD//6z+QA==
Date: Fri, 20 Sep 2013 22:16:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5584E2@DFLE08.ent.ti.com>
References: <1379710561-16000-1-git-send-email-denis@denix.org>,
	<8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>
	<1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
In-Reply-To: <1hnmpuqwd05i99mkxx408jea.1379715079255@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Fri, 20 Sep 2013 22:16:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Murphy, Dan
> Sent: Friday, September 20, 2013 5:11 PM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with pl=
atform-
> base and PMIC merged
>=20
> You should auto rev this branch.  It can change at any hour.  And so much=
 can
> be added.

[Franklin] This is done in meta-arago.
>=20
> Dan
>=20
> "Cooper Jr., Franklin" <fcooper@ti.com> wrote:
>=20
>=20
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, September 20, 2013 3:56 PM
> > To: meta-ti@yoctoproject.org
> > Cc: Murphy, Dan
> > Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with
> > platform-base and PMIC merged
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Cc: Dan Murphy <DMurphy@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> > kernel/linux/linux-ti-staging_git.bb
> > index 7d84cc4..694a164 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -31,11 +31,11 @@ S =3D "${WORKDIR}/git"
> >
> >  BRANCH =3D "ti-linux-3.12.y"
> >
> > -SRCREV =3D "b36f4be3de1b123d8601de062e7dbfc904f305fb"
> > -PV =3D "3.10+3.11-rc6"
> > +SRCREV =3D "351da8b4c2ff277b2d816a2108ada357a63fadbe"
> > +PV =3D "3.11+3.12-rc1"
> [Franklin] What does the 3.11+ mean?
> >
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> >
> >  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> > kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
> >             file://defconfig \
> > --
> > 1.8.3.2
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

