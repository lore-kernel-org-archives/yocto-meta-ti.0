Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9499FE007A0; Mon, 27 Oct 2014 10:00:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F0CCE007A0
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 10:00:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9RH08wU032265
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 12:00:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9RH08X4028758
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 12:00:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 27 Oct 2014 12:00:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9RH057T004365;
	Mon, 27 Oct 2014 12:00:06 -0500
Date: Mon, 27 Oct 2014 13:00:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20141027170005.GX25408@edge>
References: <1412785429-18554-1-git-send-email-sam.nelson@ti.com>
	<20141008184126.GU1731@edge>
	<4F9216F96E5DF9428610502835A9F4905806C399@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905806C399@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 27 Oct 2014 17:00:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 09, 2014 at 07:07:44AM -0400, Nelson, Sam wrote:
> > Sam,
> > 
> > This patch is not as clean as it could have been...
> > 
> > First of all, I see it's split into 2 separate recipes - one to build a
> > library and another to build a test/example app using that library. While
> > there are some valid reasons for such split, like when one component builds
> > both kernel and user-space parts, or when half of the component can be
> > replaced by a different provider; it is probably not the best approach in this
> > case. It would be better to have a single recipe that builds everything and
> > then packages its components into separate binary packages. Again, unless
> > you
> > envision building a test/example app w/o building its library, due to a
> > replacement option. Or, if test/example app takes very long to build and is
> > an optional piece and not being built by default... Please provide some more
> > details here.

> [Sam] The main reason the recipes are split is this: The test code is 
> written such that it depends on libraries in the staging directory.
> This is done intentionally to make the test code independent of the library.

Ok, I see. I guess we can do 2 separate recipes for now.


> > Next, I understand that you have to work with the provided Makefiles as is,
> > but usually for things like building the dynamic and static versions of the
> > library one would use separate Makefile targets and not the variable. That
> > way
> > only dynamic, only static, or both can be done in one command, instead of
> > calling the same command twice with the variable set to "yes" or "no" - not
> > very effective.

> [Sam] This builds the test code : one binary is built to test with the 
> static library and another with the dynamic library.
> Not sure what you are suggesting.

I was suggesting for whomever is responsible for the Makefile, to change the 
logic from using USEDYNAMIC_LIB="yes/no" variable to using the Makefile 
targets instead, such as tests_dynamic, tests_static, examples_dynamic and 
examples_static. This was it will be split by default as before, but you won't 
need to run a for-loop to call make twice, as you can call all the necessary 
targets in one go:
make tests_dynamic tests_static examples_dynamic examples_static VAR1 VAR2...


> > Also, please try to follow OpenEmbedded coding guidelines, like using
> > spaces
> > around = sign. I.e. VAR = "VAL" instead of VAR="VAL". I understand it's a
> > nitpick and not critical, but still.
> > 
> [Sam] I will correct this.
> > And since I'm not commenting inline, please be specific when using Bitbake
> > variables vs. shell variables. I.e. in for-loops below, it should be $device
> > and $choice instead of ${device} and ${choice}. In this case those are shell
> > variables and there is no reason to try to confuse Bitbake, although it would
> > fail to resolve them and leave as is to pick by shell...
> [Sam] I will fix this.
> > 
> > One more - HYPLNK_SRC_DIR is not being passed to all make targets and
> > when
> > it's passed, it's sometimes ${S}, but sometimes ${PWD}. Please check the
> > code
> > and clean it up.
> [Sam] I will clean this up and send updated patch.
> > 
> > BTW, what does PDK_INSTALL_PATH variable specify? Is there any other
> > dependency besides common-csl-ip?

> [Sam] For the library:  PDK install path is used to access common-csl-ip.
> For the test code it is used to access common-csl-ip and the hyplnk-lld 
> library.

And why is it pointing to the include path? Should it point to the base of 
staging dir, so both includes and libs are accesible?


> > Thanks for your submission! Please work with me and we'll get it cleared
> > quickly. Thanks.
> > 
> > --
> > Denys
> > 
> > 
> > On Wed, Oct 08, 2014 at 12:23:49PM -0400, Sam Nelson wrote:
> > > - Provides low level driver for Hyperlink module
> > > - Test recipe is used to build tests and examples using
> > >   the hyperlink library.
> > > - Supports k2h, k2k & k2e
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   25
> > +++++++++++++++++++++++++
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24
> > ++++++++++++++++++++++++
> > >  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   18 ++++++++++++++++++
> > >  3 files changed, 67 insertions(+)
> > >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > >  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> > >  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> > >
> > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-
> > bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > > new file mode 100755
> > > index 0000000..49d11f0
> > > --- /dev/null
> > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> > > @@ -0,0 +1,25 @@
> > > +include hyplnk-lld.inc
> > > +
> > > +DEPENDS="common-csl-ip hyplnk-lld"
> > > +
> > > +CHOICELIST = " yes \
> > > +               no  \
> > > +"
> > > +
> > > +do_compile () {
> > > +	make -f makefile_armv7 clean
> > PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
> > > +	for device in ${DEVICELIST}
> > > +	do
> > > +		for choice in ${CHOICELIST}
> > > +		do
> > > +			make -f makefile_armv7 tests examples
> > PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}"
> > HYPLNK_SRC_DIR=${S} USEDYNAMIC_LIB="${choice}"
> > > +		done
> > > +	done
> > > +}
> > > +
> > > +do_install () {
> > > +    for device in ${DEVICELIST}
> > > +	do
> > > +	    make -f makefile_armv7 installbin
> > PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="${device}"
> > HYPLNK_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
> > > +	done
> > > +}
> > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-
> > lld/hyplnk-lld.inc
> > > new file mode 100644
> > > index 0000000..4c8bb32
> > > --- /dev/null
> > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> > > @@ -0,0 +1,24 @@
> > > +DESCRIPTION = "TI Hyperlink Low Level Driver"
> > > +LICENSE = "BSD-3-Clause"
> > > +
> > > +COMPATIBLE_MACHINE = "keystone"
> > > +
> > > +LLDNAME="hyplnk"
> > > +
> > > +LIC_FILES_CHKSUM =
> > "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=623325cc19e
> > 613a4e770fbb749922592"
> > > +
> > > +BRANCH="master"
> > > +SRC_URI = "git://git.ti.com/keystone-rtos/hyplnk-
> > lld.git;destsuffix=git/ti/drv/${LLDNAME};protocol=git;branch=${BRANCH}"
> > > +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
> > > +SRCREV = "6910da379501984ecf27f8d23ba6fc6310fe387e"
> > > +
> > > +PV = "2.1.0"
> > > +PR = "r0"
> > > +
> > > +DEVICELIST = " k2h \
> > > +               k2k \
> > > +               k2e \
> > > +"
> > > +
> > > +BASEDIR = "${WORKDIR}/git"
> > > +S = "${BASEDIR}/ti/drv/${LLDNAME}"
> > > diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-
> > lld/hyplnk-lld_git.bb
> > > new file mode 100755
> > > index 0000000..3b9bc8a
> > > --- /dev/null
> > > +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> > > @@ -0,0 +1,18 @@
> > > +include hyplnk-lld.inc
> > > +
> > > +DEPENDS="common-csl-ip"
> > > +
> > > +CHOICELIST = " yes \
> > > +               no  \
> > > +"
> > > +do_compile () {
> > > +	make -f makefile_armv7 clean
> > PDK_INSTALL_PATH=${STAGING_INCDIR} HYPLNK_SRC_DIR=${PWD}
> > > +	for device in ${DEVICELIST}
> > > +	do
> > > +		make -f makefile_armv7 lib
> > PDK_INSTALL_PATH=${STAGING_INCDIR}  DEVICE="${device}"
> > > +	done
> > > +}
> > > +
> > > +do_install () {
> > > +	make -f makefile_armv7 install
> > PDK_INSTALL_PATH=${STAGING_INCDIR}
> > INSTALL_INC_BASE_DIR=${D}/${includedir}
> > INSTALL_LIB_BASE_DIR=${D}${libdir}
> > > +}
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

