Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 096F2E009F5; Wed, 30 Aug 2017 15:51:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC5EBE0091D
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 15:51:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UMpb2x028486
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504133497;
	bh=WOpD693xmLw3O/sJNMHgMt8/ZPE4+nxIbL0kr54hpXE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=gdztgm57EJ21WpfVPJUEw4ukQKnRhlKwUNy51WHeVubP7hCv6are7xHgmsUHj2m2B
	Mst1AunDMARppPIADLmyuIgSUsaNAT9V+yXxugPYel7n+iNZ60/wXs1hllr2rCsLVE
	Nrd+fQXgAPp61A8JqN71NmOLjRkwJRTwaywHtkoI=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UMpbd0023670
	for <meta-ti@yoctoproject.org>; Wed, 30 Aug 2017 17:51:37 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Wed, 30 Aug 2017 17:51:36 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [EXTERNAL] Re: [meta-ti] [PATCH] icss-emac-lld*: upstream
	version 1.0.0.7C with recipes for linux user space
Thread-Index: AQHTIeKJ+mIFdFTzUk6bbPKuHFf10Q==
Date: Wed, 30 Aug 2017 22:51:36 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D73911@DLEE08.ent.ti.com>
References: <1499800168-27634-1-git-send-email-h-gou@ti.com>
	<20170824214755.GV28233@edge>
	<2E957F12D11D904590FA9AF86D366BD926D72BF8@DLEE08.ent.ti.com>
	<20170829212125.GR8304@edge>
	<2E957F12D11D904590FA9AF86D366BD926D73484@DLEE08.ent.ti.com>
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926D73484@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [PATCH] icss-emac-lld*: upstream version 1.0.0.7C with recipes for linux user space
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
X-List-Received-Date: Wed, 30 Aug 2017 22:51:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

The patch for starterware has been submitted. Please review.

Thanks,
Hongmei

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Gou, Hongmei
> Sent: Wednesday, August 30, 2017 10:18 AM
> To: Dmytriyenko, Denys
> Cc: meta-ti@yoctoproject.org
> Subject: [EXTERNAL] Re: [meta-ti] [PATCH] icss-emac-lld*: upstream versio=
n
> 1.0.0.7C with recipes for linux user space
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, August 29, 2017 5:21 PM
> > To: Gou, Hongmei
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] icss-emac-lld*: upstream version
> > 1.0.0.7C with recipes for linux user space
> >
> > On Tue, Aug 29, 2017 at 02:43:41PM -0400, Gou, Hongmei wrote:
> > > Please see below inline.
> >
> > Ok, makes sense.
> >
> >
> > > Besides, icss-emac-lld-test has dependencies on starterware for
> > > AM3/AM4, I will upstream the recipes for starterware soon.
> >
> > Why is there a different starterware vs. starterware-rtos? Isn't it
> > RTOS- specific anyway and has nothing to do with Linux?
>=20
> This is similar to common-csl-ip vs. common-csl-ip-rtos.
> starterware and starterware-rtos use the same source git repo. starterwar=
e
> used for Linux will only install the header files without compiling the l=
ibraries.
>=20
> >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Thursday, August 24, 2017 5:48 PM
> > > > To: Gou, Hongmei
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] [PATCH] icss-emac-lld*: upstream version
> > > > 1.0.0.7C
> > with
> > > > recipes for linux user space
> > > >
> > > > On Tue, Jul 11, 2017 at 03:09:28PM -0400, Hongmei Gou wrote:
> > > > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > > > ---
> > > > >  .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47
> > > > ++++++++++++++++++++++
> > > > >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        | 22 ++++++++=
++
> > > > >  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     | 26 ++++++++=
++++
> > > > >  3 files changed, 95 insertions(+)  create mode 100644
> > > > > recipes-bsp/icss-emac-lld/icss-emac-lld-
> > test_git.bb
> > > > >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > > > >  create mode 100644
> > > > > recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > > >
> > > > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > b/recipes-
> > > > bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > > > > new file mode 100644
> > > > > index 0000000..f62bf33
> > > > > --- /dev/null
> > > > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > > > > @@ -0,0 +1,47 @@
> > > > > +DESCRIPTION =3D "TI ICSS-EMAC low level driver tests"
> > > > > +
> > > > > +DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal"
> > > > > +
> > > > > +DEPENDS_append_ti33x =3D " starterware"
> > > > > +DEPENDS_append_ti43x =3D " starterware"
> > > > > +
> > > > > +include icss-emac-lld.inc
> > > > > +
> > > > > +PR =3D "${INC_PR}.0"
> > > > > +
> > > > > +COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
> > > >
> > > > What about am57xx-hs-evm? Or dra7xx-evm?
> > >
> > > ICSS-EMAC LLD will not be supported for am57xx-hs-evm and dra7xx-
> evm.
> > >
> > > >
> > > > > +
> > > > > +EXTRA_OEMAKE +=3D "-f makefile_armv7
> > > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=3D${S}"
> > > > > +
> > > > > +do_compile_am57xx-evm () {
> > > > > +#   Build the tests
> > > > > +    oe_runmake tests DEVICE=3D"am571x" TARGET=3D"SOC_AM571x"
> > > > > +    oe_runmake clean
> > > > > +    oe_runmake tests DEVICE=3D"am572x" TARGET=3D"SOC_AM572x"
> > > >
> > > > Wouldn't this remove the am571x binaries before building am572x
> ones?
> > >
> > > The make clean operation in the current makefile is not removing the
> > binaries, but only the library files.
> > >
> > > >
> > > > > +}
> > > > > +
> > > > > +do_compile_ti33x () {
> > > > > +#   Build the tests
> > > > > +    oe_runmake tests DEVICE=3D"am335x" TARGET=3D"SOC_AM335x"
> > > > > +}
> > > > > +
> > > > > +do_compile_ti43x () {
> > > > > +#   Build the tests
> > > > > +    oe_runmake tests DEVICE=3D"am437x" TARGET=3D"SOC_AM437x"
> > > > > +}
> > > > > +
> > > > > +do_install_am57xx-evm () {
> > > > > +#   Install the binary
> > > > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> > > > DEVICE=3D"am571x" TARGET=3D"SOC_AM571x"
> > > > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> > > > DEVICE=3D"am572x" TARGET=3D"SOC_AM572x"
> > > > > +}
> > > > > +
> > > > > +do_install_ti33x () {
> > > > > +#   Install the binary
> > > > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> > > > DEVICE=3D"am335x" TARGET=3D"SOC_AM335x"
> > > > > +}
> > > > > +
> > > > > +do_install_ti43x () {
> > > > > +#   Install the binary
> > > > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> > > > DEVICE=3D"am437x" TARGET=3D"SOC_AM437x"
> > > > > +}
> > > > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > > > > b/recipes-
> > bsp/icss-
> > > > emac-lld/icss-emac-lld.inc
> > > > > new file mode 100644
> > > > > index 0000000..8e2ffd4
> > > > > --- /dev/null
> > > > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > > > > @@ -0,0 +1,22 @@
> > > > > +LICENSE =3D "BSD-3-Clause"
> > > > > +LIC_FILES_CHKSUM =3D
> > > >
> >
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D88d270788c1d85165=
113
> > 0
> > > > 4f11a28586d"
> > > > > +
> > > > > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g-evm"
> > > >
> > > > AM5 HS and K2G HS platforms will be missed.
> > >
> > > Yes, this is intended as ICSS-EMAC LLD will not be supported for
> > > AM5HS
> > and K2G HS.
> > >
> > > >
> > > > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > +
> > > > > +ICSS_EMAC_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/icss-
> > emac.git"
> > > > > +ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
> > > > > +ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
> > > > > +ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
> > > > > +
> > > > > +# Below commit ID corresponds to
> > "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> > > > > +ICSS_EMAC_LLD_SRCREV =3D
> > > > "08cb0540eeab7721fe82b603cb6285393f314117"
> > > > > +
> > > > > +BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
> > > > > +SRC_URI =3D
> > > >
> >
> "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DESTSUFFI
> > > > X};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> > > > > +
> > > > > +SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
> > > > > +PV =3D "01.00.00.07C"
> > > > > +INC_PR =3D "r0"
> > > > > +
> > > > > +S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > > > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > > > b/recipes-
> > > > bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > > > new file mode 100644
> > > > > index 0000000..272529b
> > > > > --- /dev/null
> > > > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > > > @@ -0,0 +1,26 @@
> > > > > +DESCRIPTION =3D "TI ICSS-EMAC low level driver library"
> > > > > +
> > > > > +DEPENDS=3D"common-csl-ip pruss-lld osal"
> > > > > +
> > > > > +include icss-emac-lld.inc
> > > > > +
> > > > > +PR =3D "${INC_PR}.0"
> > > > > +
> > > > > +COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
> > > > > +
> > > > > +TARGET_NAME_am57xx-evm =3D "SOC_AM572x"
> > > > > +TARGET_NAME_ti33x =3D "SOC_AM335x"
> > > > > +TARGET_NAME_ti43x =3D "SOC_AM437x"
> > > > > +
> > > > > +EXTRA_OEMAKE +=3D "-f makefile_armv7
> > > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} TARGET=3D${TARGET_NAME}"
> > > > > +
> > > > > +do_compile () {
> > > > > +#   Build the lib
> > > > > +    oe_runmake clean
> > > > > +    oe_runmake lib
> > > > > +}
> > > > > +
> > > > > +do_install () {
> > > > > +#   Install the lib
> > > > > +    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir}
> > > > INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > > > > +}
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

