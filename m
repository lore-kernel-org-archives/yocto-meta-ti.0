Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2B33E00CFA; Fri, 13 May 2016 07:59:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C01ADE00CEB
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 07:59:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4DExQnB023784
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 09:59:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4DExQwU030046
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 09:59:26 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 13 May 2016 09:59:26 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] uio-module-drv: Update to 2.0.0.0 GA version
Thread-Index: AQHRrIped9KxS31dlkiOMNrF3og67Z+2E0YAgADjYMA=
Date: Fri, 13 May 2016 14:59:26 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490583B6F60@DLEE11.ent.ti.com>
References: <1463083843-10754-1-git-send-email-sam.nelson@ti.com>
	<20160512202422.GX16188@edge>
In-Reply-To: <20160512202422.GX16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] uio-module-drv: Update to 2.0.0.0 GA version
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
X-List-Received-Date: Fri, 13 May 2016 14:59:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, May 12, 2016 4:24 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] uio-module-drv: Update to 2.0.0.0 GA versi=
on
>=20
> On Thu, May 12, 2016 at 04:10:43PM -0400, Sam Nelson wrote:
> > Reformatted recipes to have one common PV between module and test
> > recipes
>=20
> I don't see you adding common PV anywhere...

Sorry. Will send updated patch.
>=20
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 3 ++-
> >  recipes-bsp/uio-module-drv/uio-module-drv.inc         | 4 ++--
> >  recipes-bsp/uio-module-drv/uio-module-drv_git.bb      | 3 +--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> > b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> > index 1080a91..3134a03 100644
> > --- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> > +++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> > @@ -1,7 +1,8 @@
> >  DESCRIPTION =3D "Test code for user space IO (UIO) driver"
> >
> >  include uio-module-drv.inc
> > -PV =3D "1.0.2.3"
> > +
> > +PR =3D "r1"
> >
> >  COMPATIBLE_MACHINE =3D "keystone"
> >  RDEPENDS_${PN} =3D "uio-module-drv"
> > diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> > b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> > index ed34a8a..8002504 100644
> > --- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> > +++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> > @@ -1,8 +1,8 @@
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2b7c96eb2aed7b0f6f922214dbde9016"
> >
> > -BRANCH =3D "linux4.1"
> > -# This corresponds to version 02.00.00.00_eng
> > +BRANCH =3D "master"
> > +# This corresponds to version 02.00.00.00
> >  SRCREV =3D "6a7eda36e390658593a5b8d87b0f00beb3997240"
> >
> >  SRC_URI =3D "git://git.ti.com/keystone-linux/uio-module-
> drv.git;protocol=3Dgit;branch=3D${BRANCH}"
> > diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> > b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> > index 401fdbe..15a7691 100644
> > --- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> > +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> > @@ -1,10 +1,9 @@
> >  DESCRIPTION=3D"User space IO (UIO) driver for on-chip modules"
> >
> >  include uio-module-drv.inc
> > -PV =3D "2.0.0.0+git${SRCPV}"
> >
> >  # This package builds a kernel module, use kernel PR as base and
> > append a local -MACHINE_KERNEL_PR_append =3D "c"
> > +MACHINE_KERNEL_PR_append =3D "d"
> >  PR =3D "${MACHINE_KERNEL_PR}"
> >
> >  module_auto_load_uio-module-drv =3D "uio-module-drv"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

