Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAD7AE008CE; Wed,  5 Nov 2014 07:58:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 371A4E00830
	for <meta-ti@yoctoproject.org>; Wed,  5 Nov 2014 07:58:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sA5FwPFK025626
	for <meta-ti@yoctoproject.org>; Wed, 5 Nov 2014 09:58:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sA5FwPWI012052
	for <meta-ti@yoctoproject.org>; Wed, 5 Nov 2014 09:58:25 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 5 Nov 2014 09:58:25 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] hyplnk-lld: Add new recipe for Hyperlink lld
Thread-Index: AQHP4xQ/21Z6ErNflEuM3m5oX0KPEJwm3JcA//+uIiCAHhHZgIAEbJlw
Date: Wed, 5 Nov 2014 15:58:24 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905808FDFF@DLEE11.ent.ti.com>
References: <1412785429-18554-1-git-send-email-sam.nelson@ti.com>
	<20141008184126.GU1731@edge>
	<4F9216F96E5DF9428610502835A9F4905806C399@DLEE11.ent.ti.com>
	<20141027170005.GX25408@edge>
In-Reply-To: <20141027170005.GX25408@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 05 Nov 2014 15:58:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, October 27, 2014 1:00 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] hyplnk-lld: Add new recipe for Hyperlink l=
ld
>=20
> On Thu, Oct 09, 2014 at 07:07:44AM -0400, Nelson, Sam wrote:
> > > Sam,
> > >
> > > This patch is not as clean as it could have been...
> > >
> > > First of all, I see it's split into 2 separate recipes - one to build=
 a
> > > library and another to build a test/example app using that library. W=
hile
> > > there are some valid reasons for such split, like when one component
> builds
> > > both kernel and user-space parts, or when half of the component can b=
e
> > > replaced by a different provider; it is probably not the best approac=
h in
> this
> > > case. It would be better to have a single recipe that builds everythi=
ng and
> > > then packages its components into separate binary packages. Again,
> unless
> > > you
> > > envision building a test/example app w/o building its library, due to=
 a
> > > replacement option. Or, if test/example app takes very long to build =
and
> is
> > > an optional piece and not being built by default... Please provide so=
me
> more
> > > details here.
>=20
> > [Sam] The main reason the recipes are split is this: The test code is
> > written such that it depends on libraries in the staging directory.
> > This is done intentionally to make the test code independent of the lib=
rary.
>=20
> Ok, I see. I guess we can do 2 separate recipes for now.
>=20
>=20
> > > Next, I understand that you have to work with the provided Makefiles =
as
> is,
> > > but usually for things like building the dynamic and static versions =
of the
> > > library one would use separate Makefile targets and not the variable.
> That
> > > way
> > > only dynamic, only static, or both can be done in one command, instea=
d
> of
> > > calling the same command twice with the variable set to "yes" or "no"=
 -
> not
> > > very effective.
>=20
> > [Sam] This builds the test code : one binary is built to test with the
> > static library and another with the dynamic library.
> > Not sure what you are suggesting.
>=20
> I was suggesting for whomever is responsible for the Makefile, to change =
the
> logic from using USEDYNAMIC_LIB=3D"yes/no" variable to using the Makefile
> targets instead, such as tests_dynamic, tests_static, examples_dynamic an=
d
> examples_static. This was it will be split by default as before, but you =
won't
> need to run a for-loop to call make twice, as you can call all the necess=
ary
> targets in one go:
> make tests_dynamic tests_static examples_dynamic examples_static VAR1
> VAR2...
>=20
>=20
[Sam] Ok. Understand your recommendation.=20
To modify it is going to take some time and I will follow up.
> > > Also, please try to follow OpenEmbedded coding guidelines, like using
> > > spaces
> > > around =3D sign. I.e. VAR =3D "VAL" instead of VAR=3D"VAL". I underst=
and it's a
> > > nitpick and not critical, but still.
> > >
> > [Sam] I will correct this.
> > > And since I'm not commenting inline, please be specific when using
> Bitbake
> > > variables vs. shell variables. I.e. in for-loops below, it should be =
$device
> > > and $choice instead of ${device} and ${choice}. In this case those ar=
e
> shell
> > > variables and there is no reason to try to confuse Bitbake, although =
it
> would
> > > fail to resolve them and leave as is to pick by shell...
> > [Sam] I will fix this.
> > >
> > > One more - HYPLNK_SRC_DIR is not being passed to all make targets and
> > > when
> > > it's passed, it's sometimes ${S}, but sometimes ${PWD}. Please check =
the
> > > code
> > > and clean it up.
> > [Sam] I will clean this up and send updated patch.
> > >
> > > BTW, what does PDK_INSTALL_PATH variable specify? Is there any other
> > > dependency besides common-csl-ip?
>=20
> > [Sam] For the library:  PDK install path is used to access common-csl-i=
p.
> > For the test code it is used to access common-csl-ip and the hyplnk-lld
> > library.
>=20
> And why is it pointing to the include path? Should it point to the base o=
f
> staging dir, so both includes and libs are accesible?
>=20
[Sam] The library is picked up directly using -lhyplnk, so only the include=
 path is getting used right now.
Let me know if have any suggestions.
>=20
> > > Thanks for your submission! Please work with me and we'll get it clea=
red
> > > quickly. Thanks.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Wed, Oct 08, 2014 at 12:23:49PM -0400, Sam Nelson wrote:
> > > > - Provides low level driver for Hyperlink module
> > > > - Test recipe is used to build tests and examples using
> > > >   the hyperlink library.
> > > > - Supports k2h, k2k & k2e
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   25
> > > +++++++++++++++++++++++++
> > > >  recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24
> > > ++++++++++++++++++++++++
> > > >  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   18 +++++++++++++=
+++++
> > > >  3 files changed, 67 insertions(+)
> > > >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > > >  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> > > >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> > > >
> > > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipe=
s-
> > > bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > > > new file mode 100755
> > > > index 0000000..49d11f0
> > > > --- /dev/null
> > > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > > > @@ -0,0 +1,25 @@
> > > > +include hyplnk-lld.inc
> > > > +
> > > > +DEPENDS=3D"common-csl-ip hyplnk-lld"
> > > > +
> > > > +CHOICELIST =3D " yes \
> > > > +               no  \
> > > > +"
> > > > +
> > > > +do_compile () {
> > > > +	make -f makefile_armv7 clean
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
> > > > +	for device in ${DEVICELIST}
> > > > +	do
> > > > +		for choice in ${CHOICELIST}
> > > > +		do
> > > > +			make -f makefile_armv7 tests examples
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> > > HYPLNK_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"${choice}"
> > > > +		done
> > > > +	done
> > > > +}
> > > > +
> > > > +do_install () {
> > > > +    for device in ${DEVICELIST}
> > > > +	do
> > > > +	    make -f makefile_armv7 installbin
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> > > HYPLNK_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > > > +	done
> > > > +}
> > > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hy=
plnk-
> > > lld/hyplnk-lld.inc
> > > > new file mode 100644
> > > > index 0000000..4c8bb32
> > > > --- /dev/null
> > > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> > > > @@ -0,0 +1,24 @@
> > > > +DESCRIPTION =3D "TI Hyperlink Low Level Driver"
> > > > +LICENSE =3D "BSD-3-Clause"
> > > > +
> > > > +COMPATIBLE_MACHINE =3D "keystone"
> > > > +
> > > > +LLDNAME=3D"hyplnk"
> > > > +
> > > > +LIC_FILES_CHKSUM =3D
> > >
> "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=3D623325cc19e
> > > 613a4e770fbb749922592"
> > > > +
> > > > +BRANCH=3D"master"
> > > > +SRC_URI =3D "git://git.ti.com/keystone-rtos/hyplnk-
> > >
> lld.git;destsuffix=3Dgit/ti/drv/${LLDNAME};protocol=3Dgit;branch=3D${BRAN=
CH}"
> > > > +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
> > > > +SRCREV =3D "6910da379501984ecf27f8d23ba6fc6310fe387e"
> > > > +
> > > > +PV =3D "2.1.0"
> > > > +PR =3D "r0"
> > > > +
> > > > +DEVICELIST =3D " k2h \
> > > > +               k2k \
> > > > +               k2e \
> > > > +"
> > > > +
> > > > +BASEDIR =3D "${WORKDIR}/git"
> > > > +S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
> > > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-
> bsp/hyplnk-
> > > lld/hyplnk-lld_git.bb
> > > > new file mode 100755
> > > > index 0000000..3b9bc8a
> > > > --- /dev/null
> > > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> > > > @@ -0,0 +1,18 @@
> > > > +include hyplnk-lld.inc
> > > > +
> > > > +DEPENDS=3D"common-csl-ip"
> > > > +
> > > > +CHOICELIST =3D " yes \
> > > > +               no  \
> > > > +"
> > > > +do_compile () {
> > > > +	make -f makefile_armv7 clean
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
> > > > +	for device in ${DEVICELIST}
> > > > +	do
> > > > +		make -f makefile_armv7 lib
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR}  DEVICE=3D"${device}"
> > > > +	done
> > > > +}
> > > > +
> > > > +do_install () {
> > > > +	make -f makefile_armv7 install
> > > PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > > INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> > > INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > > > +}
> > > > --
> > > > 1.7.9.5
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

