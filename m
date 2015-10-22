Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89E1FE00A81; Wed, 21 Oct 2015 20:54:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4038BE00A73
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 20:54:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9M3sUpG031909
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 22:54:30 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9M3sUWC020997
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2015 22:54:30 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 21 Oct 2015 22:54:30 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] pa-lld: Update to new version 3.0.1.5
Thread-Index: AQHRCqRthEYLCsUC50STcaV51Dl5YJ5zopMAgADPbGA=
Date: Thu, 22 Oct 2015 03:54:30 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905824183C@DLEE11.ent.ti.com>
References: <1445282948-9210-1-git-send-email-sam.nelson@ti.com>
	<20151019210628.GH5620@edge>
In-Reply-To: <20151019210628.GH5620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] pa-lld: Update to new version 3.0.1.5
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
X-List-Received-Date: Thu, 22 Oct 2015 03:54:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, October 19, 2015 5:06 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] pa-lld: Update to new version 3.0.1.5
>=20
> On Mon, Oct 19, 2015 at 03:29:08PM -0400, Sam Nelson wrote:
> > - Add script to create device independent symbolic link to actual
> >   device library
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/pa-lld/pa-lld.inc    |    6 +++---
> >  recipes-bsp/pa-lld/pa-lld_git.bb |   14 ++++++++++++++
> >  2 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-bsp/pa-lld/pa-lld.inc
> > b/recipes-bsp/pa-lld/pa-lld.inc index 7d922fb..b8ade64 100644
> > --- a/recipes-bsp/pa-lld/pa-lld.inc
> > +++ b/recipes-bsp/pa-lld/pa-lld.inc
> > @@ -6,9 +6,9 @@ COMPATIBLE_MACHINE =3D "keystone"
> >  BRANCH =3D "master"
> >  SRC_URI =3D "git://git.ti.com/keystone-rtos/pa-
> lld.git;destsuffix=3Dgit/ti/drv/pa;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > -# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.04"
> > -SRCREV =3D "92de8879be3712af684bd031ca0ed291c05d6050"
> > -PV =3D "03.00.01.04"
> > +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.05A"
> > +SRCREV =3D "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
> > +PV =3D "03.00.01.05"
> >  PR =3D "r1"
> >
> >  BASEDIR =3D "${WORKDIR}/git"
> > diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb
> > b/recipes-bsp/pa-lld/pa-lld_git.bb
> > index 63e34ad..a264be2 100644
> > --- a/recipes-bsp/pa-lld/pa-lld_git.bb
> > +++ b/recipes-bsp/pa-lld/pa-lld_git.bb
> > @@ -4,6 +4,13 @@ DEPENDS =3D "common-csl-ip rm-lld"
> >
> >  include pa-lld.inc
> >
> > +SRC_URI +=3D "file://init_pa.sh"
> > +
> > +inherit update-rc.d
> > +
> > +INITSCRIPT_NAME =3D "init_pa.sh"
> > +INITSCRIPT_PARAMS =3D "defaults 10"
> > +
> >  do_compile () {
> >  #   Now build the lld in the updated directory
> >  	make -f makefile_armv7 DEVICE=3Dk2h clean lib
> > PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > @@ -12,4 +19,11 @@ do_compile () {
> >
> >  do_install () {
> >  	make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > INSTALL_INC_BASE_DIR=3D${D}${includedir}
> > INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > +#   Set the generic device library symbolic link
> > +    cd ${D}${libdir}
> > +    ln -sf libpa.so.1.0.0 libpa_device.so.1
> > +    ln -sf libpa_device.so.1 libpa_device.so
>=20
> Do this instead of the above 3 lines:
>    ln -sf libpa.so.1.0.0 ${D}${libdir}/libpa_device.so.1
>    ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
Sounds good. I will replace.
>=20
> BTW, why are the lib names different (libpa vs. libpa_device)?
libpa_device is a common symbolic link.
libpa and libpa2 are the different version of PA chosen run time based on t=
he platform.
>=20
>=20
> > +#   Copy init scripts
> > +    install -d ${D}${sysconfdir}/init.d/
> > +    install -c -m 755 ${WORKDIR}/${INITSCRIPT_NAME}
> > +${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> >  }
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

