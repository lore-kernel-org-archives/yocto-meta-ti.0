Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AD5BE00C14; Tue, 29 Aug 2017 11:44:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2572E00B8B
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 11:43:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TIhlxt025070
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 13:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504032227;
	bh=KDRc1UlWyLfWGTYCks2svQEtludRRAKccHgpXBA3+to=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PbeKPCgy24RxAJiYkPWmSQ7x0gSpJc2tonXJtzRgTVfUwoLRMtvTm8hfTaciGHYx9
	Yu4vkSYWfWLjWJmndXbqwGUVT3mRP14U4+/4vOAAxzTMarmhsyhVnKdXhjvnZm4Mjg
	HPZ1m7YJL14sD6WaA7q3kbExEkkBWvqPCgK6wiMA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TIhg6H017023
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 13:43:42 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 29 Aug 2017 13:43:42 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] icss-emac-lld*: upstream version 1.0.0.7C
	with recipes for linux user space
Thread-Index: AQHTHSKnuMICX5s9pEuM8xjSP2edPqKbsM5A
Date: Tue, 29 Aug 2017 18:43:41 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D72BF8@DLEE08.ent.ti.com>
References: <1499800168-27634-1-git-send-email-h-gou@ti.com>
	<20170824214755.GV28233@edge>
In-Reply-To: <20170824214755.GV28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] icss-emac-lld*: upstream version 1.0.0.7C with recipes for linux user space
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
X-List-Received-Date: Tue, 29 Aug 2017 18:44:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see below inline.
Besides, icss-emac-lld-test has dependencies on starterware for AM3/AM4, I =
will upstream the recipes for starterware soon.

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, August 24, 2017 5:48 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] icss-emac-lld*: upstream version 1.0.0.7C =
with
> recipes for linux user space
>=20
> On Tue, Jul 11, 2017 at 03:09:28PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47
> ++++++++++++++++++++++
> >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        | 22 ++++++++++
> >  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     | 26 ++++++++++++
> >  3 files changed, 95 insertions(+)
> >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> >
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/reci=
pes-
> bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > new file mode 100644
> > index 0000000..f62bf33
> > --- /dev/null
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > @@ -0,0 +1,47 @@
> > +DESCRIPTION =3D "TI ICSS-EMAC low level driver tests"
> > +
> > +DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal"
> > +
> > +DEPENDS_append_ti33x =3D " starterware"
> > +DEPENDS_append_ti43x =3D " starterware"
> > +
> > +include icss-emac-lld.inc
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
>=20
> What about am57xx-hs-evm? Or dra7xx-evm?

ICSS-EMAC LLD will not be supported for am57xx-hs-evm and dra7xx-evm.
=20
>=20
> > +
> > +EXTRA_OEMAKE +=3D "-f makefile_armv7
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=3D${S}"
> > +
> > +do_compile_am57xx-evm () {
> > +#   Build the tests
> > +    oe_runmake tests DEVICE=3D"am571x" TARGET=3D"SOC_AM571x"
> > +    oe_runmake clean
> > +    oe_runmake tests DEVICE=3D"am572x" TARGET=3D"SOC_AM572x"
>=20
> Wouldn't this remove the am571x binaries before building am572x ones?

The make clean operation in the current makefile is not removing the binari=
es, but only the library files.

>=20
> > +}
> > +
> > +do_compile_ti33x () {
> > +#   Build the tests
> > +    oe_runmake tests DEVICE=3D"am335x" TARGET=3D"SOC_AM335x"
> > +}
> > +
> > +do_compile_ti43x () {
> > +#   Build the tests
> > +    oe_runmake tests DEVICE=3D"am437x" TARGET=3D"SOC_AM437x"
> > +}
> > +
> > +do_install_am57xx-evm () {
> > +#   Install the binary
> > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"am571x" TARGET=3D"SOC_AM571x"
> > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"am572x" TARGET=3D"SOC_AM572x"
> > +}
> > +
> > +do_install_ti33x () {
> > +#   Install the binary
> > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"am335x" TARGET=3D"SOC_AM335x"
> > +}
> > +
> > +do_install_ti43x () {
> > +#   Install the binary
> > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"am437x" TARGET=3D"SOC_AM437x"
> > +}
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/=
icss-
> emac-lld/icss-emac-lld.inc
> > new file mode 100644
> > index 0000000..8e2ffd4
> > --- /dev/null
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > @@ -0,0 +1,22 @@
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D
> "file://icss_emacDrv.h;beginline=3D1;endline=3D40;md5=3D88d270788c1d85165=
1130
> 4f11a28586d"
> > +
> > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g-evm"
>=20
> AM5 HS and K2G HS platforms will be missed.

Yes, this is intended as ICSS-EMAC LLD will not be supported for AM5HS and =
K2G HS.
=20
>=20
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +ICSS_EMAC_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/icss-emac.gi=
t"
> > +ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
> > +ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
> > +ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
> > +
> > +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> > +ICSS_EMAC_LLD_SRCREV =3D
> "08cb0540eeab7721fe82b603cb6285393f314117"
> > +
> > +BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
> > +SRC_URI =3D
> "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_DESTSUFFI
> X};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
> > +
> > +SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
> > +PV =3D "01.00.00.07C"
> > +INC_PR =3D "r0"
> > +
> > +S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-
> bsp/icss-emac-lld/icss-emac-lld_git.bb
> > new file mode 100644
> > index 0000000..272529b
> > --- /dev/null
> > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "TI ICSS-EMAC low level driver library"
> > +
> > +DEPENDS=3D"common-csl-ip pruss-lld osal"
> > +
> > +include icss-emac-lld.inc
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
> > +
> > +TARGET_NAME_am57xx-evm =3D "SOC_AM572x"
> > +TARGET_NAME_ti33x =3D "SOC_AM335x"
> > +TARGET_NAME_ti43x =3D "SOC_AM437x"
> > +
> > +EXTRA_OEMAKE +=3D "-f makefile_armv7
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} TARGET=3D${TARGET_NAME}"
> > +
> > +do_compile () {
> > +#   Build the lib
> > +    oe_runmake clean
> > +    oe_runmake lib
> > +}
> > +
> > +do_install () {
> > +#   Install the lib
> > +    oe_runmake install INSTALL_INC_BASE_DIR=3D${D}${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > +}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

