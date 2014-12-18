Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A91D7E00B49; Thu, 18 Dec 2014 15:43:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69D2FE002F9
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 15:43:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBINhjBI004299
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:43:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBINhjJT015590
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:43:45 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 18 Dec 2014 17:43:45 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] pa-lld: Add recipes for PA low level
	driver and test code
Thread-Index: AQHQGxu5n3f4AhA0UU6HLdFOPTB5VpyWZq4A//+bt/A=
Date: Thu, 18 Dec 2014 23:43:44 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580ED22A@DLEE11.ent.ti.com>
References: <1418945906-17216-1-git-send-email-sam.nelson@ti.com>
	<20141218234132.GP29971@edge>
In-Reply-To: <20141218234132.GP29971@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] pa-lld: Add recipes for PA low level driver and test code
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
X-List-Received-Date: Thu, 18 Dec 2014 23:43:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, December 18, 2014 6:42 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] pa-lld: Add recipes for PA low level d=
river
> and test code
>=20
> On Thu, Dec 18, 2014 at 06:38:25PM -0500, Sam Nelson wrote:
> > - Provides low level driver for Packet accelerator module
> > - Supports k2h, k2k, k2l & k2e devices
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/pa-lld/pa-lld-test_git.bb |   28
> ++++++++++++++++++++++++++++
> >  recipes-bsp/pa-lld/pa-lld.inc         |   15 +++++++++++++++
> >  recipes-bsp/pa-lld/pa-lld_git.bb      |   15 +++++++++++++++
> >  3 files changed, 58 insertions(+)
> >  create mode 100644 recipes-bsp/pa-lld/pa-lld-test_git.bb
> >  create mode 100644 recipes-bsp/pa-lld/pa-lld.inc
> >  create mode 100644 recipes-bsp/pa-lld/pa-lld_git.bb
> >
> > diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld=
/pa-
> lld-test_git.bb
> > new file mode 100644
> > index 0000000..b70dadd
> > --- /dev/null
> > +++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION =3D "TI PA LLD unit test and example binaries"
>=20
> What's PA? At least you spelled out SA in the next patch... :)
>=20
[Sam] Packet accelerator module. I did add the following in the commit note=
s.
" - Provides low level driver for Packet accelerator module"
>=20
> > +
> > +DEPENDS =3D "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
> > +
> > +include pa-lld.inc
> > +
> > +DEVICELIST =3D "k2h k2k k2l k2e"
> > +
> > +CHOICELIST =3D "yes no"
> > +
> > +do_compile () {
> > +# Now build the lld unit test examples
> > +	for device in ${DEVICELIST}
> > +	do
> > +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> PA_SRC_DIR=3D${S}
> > +		for choice in ${CHOICELIST}
> > +		do
> > +			make -f makefile_armv7 tests examples
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
> > +		done
> > +	done
> > +}
> > +
> > +do_install () {
> > +	for device in ${DEVICELIST}
> > +	do
> > +		make -f makefile_armv7 installbin
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> > +	done
> > +}
> > diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.=
inc
> > new file mode 100644
> > index 0000000..e93ce15
> > --- /dev/null
> > +++ b/recipes-bsp/pa-lld/pa-lld.inc
> > @@ -0,0 +1,15 @@
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=3De8f6789acdcda76d02ed
> 9203fc2e603d"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +BRANCH =3D "master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/pa-
> lld.git;destsuffix=3Dgit/ti/drv/pa;protocol=3Dgit;branch=3D${BRANCH}"
> > +
> > +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.01"
> > +SRCREV =3D "55207930b4491f33776f2c4c2c0707a73c69314c"
> > +PV =3D "03.00.01.01"
> > +PR =3D "r0"
> > +
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/drv/pa"
> > diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-
> lld_git.bb
> > new file mode 100644
> > index 0000000..63e34ad
> > --- /dev/null
> > +++ b/recipes-bsp/pa-lld/pa-lld_git.bb
> > @@ -0,0 +1,15 @@
> > +DESCRIPTION =3D "TI PA LLD library"
> > +
> > +DEPENDS =3D "common-csl-ip rm-lld"
> > +
> > +include pa-lld.inc
> > +
> > +do_compile () {
> > +#   Now build the lld in the updated directory
> > +	make -f makefile_armv7 DEVICE=3Dk2h clean lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > +	make -f makefile_armv7 DEVICE=3Dk2l lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > +}
> > +
> > +do_install () {
> > +	make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> INSTALL_INC_BASE_DIR=3D${D}${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > +}
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

