Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3E95E008E5; Thu,  3 Dec 2015 07:23:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E494E00888
	for <meta-ti@yoctoproject.org>; Thu,  3 Dec 2015 07:23:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB3FNbK1005085
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 09:23:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB3FNagZ009976
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 09:23:37 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 3 Dec 2015 09:23:36 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti]  [PATCH v3] dsplib-c66x: add version 3.4.0.0
Thread-Index: AQHRLUtfY4haPE/dfUKuNV5iLVoNjZ65Yhiw
Date: Thu, 3 Dec 2015 15:23:37 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B13D95@DLEE08.ent.ti.com>
References: <1449089447-2567-1-git-send-email-h-gou@ti.com>
	<20151202214935.GM6264@edge>
In-Reply-To: <20151202214935.GM6264@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3] dsplib-c66x: add version 3.4.0.0
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
X-List-Received-Date: Thu, 03 Dec 2015 15:23:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will make similar changes and submit v2 patch for mathlib and imglib afte=
r this one for dsplib is accepted.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, December 02, 2015 4:50 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v3] dsplib-c66x: add version 3.4.0.0
>=20
> And what about the other 2 - mathlib and imglib?
>=20
> On Wed, Dec 02, 2015 at 03:50:47PM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> > v3 changes:
> > * Remove c66x from COMPATIBLE_MACHINE
> > * Remove SRCIPK
> >
> >  recipes-ti/dsplib/dsplib-c66x.inc        | 26 ++++++++++++++++++++++++=
++
> >  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 +++++++++
> >  recipes-ti/includes/ti-paths.inc         |  2 ++
> >  3 files changed, 37 insertions(+)
> >  create mode 100644 recipes-ti/dsplib/dsplib-c66x.inc  create mode
> > 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >
> > diff --git a/recipes-ti/dsplib/dsplib-c66x.inc
> > b/recipes-ti/dsplib/dsplib-c66x.inc
> > new file mode 100644
> > index 0000000..31acc1e
> > --- /dev/null
> > +++ b/recipes-ti/dsplib/dsplib-c66x.inc
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "DSPLIB contains optimized general-purpose signal-
> processing routines for TI DSPs"
> > +HOMEPAGE =3D "http://www.ti.com/tool/sprc265"
> > +SECTION =3D "devel"
> > +LICENSE =3D "BSD-3-Clause"
> > +
> > +require ../includes/ti-paths.inc
> > +require ../includes/ti-staging.inc
> > +require ../includes/ti-unpack.inc
> > +
> > +COMPATIBLE_MACHINE =3D "omap-a15|keystone"
> > +
> > +SRC_URI =3D "http://software-
> dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};nam
> e=3Ddsplib"
> > +
> > +BINFILE =3D "dsplib_c66x_${PV}_Linux.bin"
> > +TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
> > +TI_BIN_UNPK_CMDS =3D ""
> > +
> > +do_install() {
> > +    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> > +    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> > +}
> > +
> > +ALLOW_EMPTY_${PN} =3D "1"
> > +FILES_${PN}-dev +=3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> > +
> > +INSANE_SKIP_${PN}-dev =3D "arch"
> > diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> > b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> > new file mode 100644
> > index 0000000..f1273f3
> > --- /dev/null
> > +++ b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> > @@ -0,0 +1,9 @@
> > +require dsplib-c66x.inc
> > +
> > +PV =3D "3_4_0_0"
> > +PR =3D "r1"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://packages/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md5=3D1773=
3f9e110
> 0f8a628512f47c4bf676a"
> > +
> > +SRC_URI[dsplib.md5sum] =3D "66785604729c153dcad5282097dee8bf"
> > +SRC_URI[dsplib.sha256sum] =3D
> "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
> > diff --git a/recipes-ti/includes/ti-paths.inc
> > b/recipes-ti/includes/ti-paths.inc
> > index ad4ff78..37feb93 100644
> > --- a/recipes-ti/includes/ti-paths.inc
> > +++ b/recipes-ti/includes/ti-paths.inc
> > @@ -49,6 +49,7 @@ export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =3D
> "${installdir}/ti-cgt-arm"
> >  export CCSV6_INSTALL_DIR_RECIPE           =3D "${installdir}/ccsv6"
> >  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =3D "${installdir}/gcc-arm-
> none-eabi"
> >  export TI_CGT_PRU_INSTALL_DIR_RECIPE      =3D "${installdir}/cgt-pru"
> > +export DSPLIB_C66_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-dsplib=
-c66x-
> tree"
> >
> >
> >  # This is where the tools will end up in sysroot
> > @@ -89,6 +90,7 @@ export M4_TOOLCHAIN_INSTALL_DIR    =3D
> "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTAL
> >  export CCSV6_INSTALL_DIR           =3D
> "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
> >  export GCC_ARM_NONE_TOOLCHAIN      =3D
> "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
> >  export TI_CGT_PRU_INSTALL_DIR      =3D
> "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> > +export DSPLIB_C66_INSTALL_DIR      =3D
> "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >
> >  DSPSUFFIX_omapl137 =3D "x674"
> >  DSPSUFFIX_omapl138 =3D "x674"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

