Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8246E007C1; Tue,  7 Oct 2014 11:58:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D514E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 11:58:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97Iw2mS022983
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 13:58:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97Iw2m7026610
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 13:58:02 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 7 Oct 2014 13:58:03 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] uio-module-drv: Add new recipe for user
	space io driver
Thread-Index: AQHP4l7N24trxXMyQUmYdSAvokIW3pwlTcyA//+uozA=
Date: Tue, 7 Oct 2014 18:58:01 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058068DAC@DLEE11.ent.ti.com>
References: <1412707498-10920-1-git-send-email-sam.nelson@ti.com>
	<20141007184901.GB1731@edge>
In-Reply-To: <20141007184901.GB1731@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] uio-module-drv: Add new recipe for user space io driver
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
X-List-Received-Date: Tue, 07 Oct 2014 18:58:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, October 07, 2014 2:49 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] uio-module-drv: Add new recipe for user
> space io driver
>=20
> On Tue, Oct 07, 2014 at 02:44:58PM -0400, Sam Nelson wrote:
> > - Provides User space IO driver for on-chip modules
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> Looks very good, thanks!
>=20
> I take it this is rather generic and not keystone specific, as you don't =
set
> COMPATIBLE_MACHINE, right?
[Sam] That is correct.
>=20
>=20
> > ---
> >  recipes-bsp/uio-module-drv/uio-module-drv_git.bb |   22
> ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> >
> > diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes=
-
> bsp/uio-module-drv/uio-module-drv_git.bb
> > new file mode 100644
> > index 0000000..c80dfc8
> > --- /dev/null
> > +++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION=3D"User space IO (UIO) driver for on-chip modules"
> > +
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2b7c96eb2aed7b0f6f922214dbde9016"
> > +
> > +BRANCH ?=3D "master"
> > +# This corresponds to version 01.00.01.00A
> > +SRCREV =3D "3bce5bfec7a7865e278410e3c4484f878b9038b6"
> > +PV =3D "1.0.1"
> > +
> > +SRC_URI =3D "git://git.ti.com/keystone-linux/uio-module-
> drv.git;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +# This package builds a kernel module, use kernel PR as base and appen=
d
> a local
> > +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +module_auto_load_uio-module-drv =3D "uio-module-drv"
> > +
> > +inherit module
> > +
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

