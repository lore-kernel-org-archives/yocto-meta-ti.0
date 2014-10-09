Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5452DE00857; Thu,  9 Oct 2014 04:07:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F8E3E00786
	for <meta-ti@yoctoproject.org>; Thu,  9 Oct 2014 04:07:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s99B7kl3030238
	for <meta-ti@yoctoproject.org>; Thu, 9 Oct 2014 06:07:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s99B7k3C017293
	for <meta-ti@yoctoproject.org>; Thu, 9 Oct 2014 06:07:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 9 Oct 2014 06:07:46 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] hyplnk-lld: Add new recipe for Hyperlink lld
Thread-Index: AQHP4xQ/21Z6ErNflEuM3m5oX0KPEJwm3JcA//+uIiA=
Date: Thu, 9 Oct 2014 11:07:44 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905806C399@DLEE11.ent.ti.com>
References: <1412785429-18554-1-git-send-email-sam.nelson@ti.com>
	<20141008184126.GU1731@edge>
In-Reply-To: <20141008184126.GU1731@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] hyplnk-lld: Add new recipe for Hyperlink lld
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
X-List-Received-Date: Thu, 09 Oct 2014 11:07:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, October 08, 2014 2:41 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] hyplnk-lld: Add new recipe for Hyperlink l=
ld
>=20
> Sam,
>=20
> This patch is not as clean as it could have been...
>=20
> First of all, I see it's split into 2 separate recipes - one to build a
> library and another to build a test/example app using that library. While
> there are some valid reasons for such split, like when one component buil=
ds
> both kernel and user-space parts, or when half of the component can be
> replaced by a different provider; it is probably not the best approach in=
 this
> case. It would be better to have a single recipe that builds everything a=
nd
> then packages its components into separate binary packages. Again, unless
> you
> envision building a test/example app w/o building its library, due to a
> replacement option. Or, if test/example app takes very long to build and =
is
> an optional piece and not being built by default... Please provide some m=
ore
> details here.
[Sam] The main reason the recipes are split is this: The test code is writt=
en such that it depends on libraries in the staging directory.
This is done intentionally to make the test code independent of the library=
.

>=20
> Next, I understand that you have to work with the provided Makefiles as i=
s,
> but usually for things like building the dynamic and static versions of t=
he
> library one would use separate Makefile targets and not the variable. Tha=
t
> way
> only dynamic, only static, or both can be done in one command, instead of
> calling the same command twice with the variable set to "yes" or "no" - n=
ot
> very effective.
>=20
[Sam]  This builds the test code : one binary is built to  test  with the s=
tatic library and another with the dynamic library.
Not sure what you are suggesting.

> Also, please try to follow OpenEmbedded coding guidelines, like using
> spaces
> around =3D sign. I.e. VAR =3D "VAL" instead of VAR=3D"VAL". I understand =
it's a
> nitpick and not critical, but still.
>=20
[Sam] I will correct this.
> And since I'm not commenting inline, please be specific when using Bitbak=
e
> variables vs. shell variables. I.e. in for-loops below, it should be $dev=
ice
> and $choice instead of ${device} and ${choice}. In this case those are sh=
ell
> variables and there is no reason to try to confuse Bitbake, although it w=
ould
> fail to resolve them and leave as is to pick by shell...
[Sam] I will fix this.
>=20
> One more - HYPLNK_SRC_DIR is not being passed to all make targets and
> when
> it's passed, it's sometimes ${S}, but sometimes ${PWD}. Please check the
> code
> and clean it up.
[Sam] I will clean this up and send updated patch.
>=20
> BTW, what does PDK_INSTALL_PATH variable specify? Is there any other
> dependency besides common-csl-ip?
[Sam] For the library:  PDK install path is used to access common-csl-ip.
For the test code it is used to access common-csl-ip and the hyplnk-lld lib=
rary.
>=20
> Thanks for your submission! Please work with me and we'll get it cleared
> quickly. Thanks.
>=20
> --
> Denys
>=20
>=20
> On Wed, Oct 08, 2014 at 12:23:49PM -0400, Sam Nelson wrote:
> > - Provides low level driver for Hyperlink module
> > - Test recipe is used to build tests and examples using
> >   the hyperlink library.
> > - Supports k2h, k2k & k2e
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   25
> +++++++++++++++++++++++++
> >  recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24
> ++++++++++++++++++++++++
> >  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   18 +++++++++++++++++=
+
> >  3 files changed, 67 insertions(+)
> >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> >  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> >
> > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-
> bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > new file mode 100755
> > index 0000000..49d11f0
> > --- /dev/null
> > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > @@ -0,0 +1,25 @@
> > +include hyplnk-lld.inc
> > +
> > +DEPENDS=3D"common-csl-ip hyplnk-lld"
> > +
> > +CHOICELIST =3D " yes \
> > +               no  \
> > +"
> > +
> > +do_compile () {
> > +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
> > +	for device in ${DEVICELIST}
> > +	do
> > +		for choice in ${CHOICELIST}
> > +		do
> > +			make -f makefile_armv7 tests examples
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> HYPLNK_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"${choice}"
> > +		done
> > +	done
> > +}
> > +
> > +do_install () {
> > +    for device in ${DEVICELIST}
> > +	do
> > +	    make -f makefile_armv7 installbin
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> HYPLNK_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > +	done
> > +}
> > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk=
-
> lld/hyplnk-lld.inc
> > new file mode 100644
> > index 0000000..4c8bb32
> > --- /dev/null
> > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "TI Hyperlink Low Level Driver"
> > +LICENSE =3D "BSD-3-Clause"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +LLDNAME=3D"hyplnk"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=3D623325cc19e
> 613a4e770fbb749922592"
> > +
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/hyplnk-
> lld.git;destsuffix=3Dgit/ti/drv/${LLDNAME};protocol=3Dgit;branch=3D${BRAN=
CH}"
> > +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
> > +SRCREV =3D "6910da379501984ecf27f8d23ba6fc6310fe387e"
> > +
> > +PV =3D "2.1.0"
> > +PR =3D "r0"
> > +
> > +DEVICELIST =3D " k2h \
> > +               k2k \
> > +               k2e \
> > +"
> > +
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
> > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyp=
lnk-
> lld/hyplnk-lld_git.bb
> > new file mode 100755
> > index 0000000..3b9bc8a
> > --- /dev/null
> > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> > @@ -0,0 +1,18 @@
> > +include hyplnk-lld.inc
> > +
> > +DEPENDS=3D"common-csl-ip"
> > +
> > +CHOICELIST =3D " yes \
> > +               no  \
> > +"
> > +do_compile () {
> > +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
> > +	for device in ${DEVICELIST}
> > +	do
> > +		make -f makefile_armv7 lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}  DEVICE=3D"${device}"
> > +	done
> > +}
> > +
> > +do_install () {
> > +	make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> INSTALL_INC_BASE_DIR=3D${D}/${includedir}
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

