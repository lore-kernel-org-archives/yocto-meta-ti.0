Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85043E00C14; Tue, 29 Aug 2017 14:21:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C839DE00B8B
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 14:21:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TLLU6r010768
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 16:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504041690;
	bh=rUTQNKb57PCbJ70kyLqE+Ah5yTS3oj6QYM0FxA4CvTo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jh60QImmJVIB/HpjOwWTI/us5iSe1fZSUv9O3to8+0YqnGgR0OwqBJWozLBjnNFRk
	Gevj7JpdZ46wX8xs2U2nrjtK4wCc/ooMrAMEjlik2eOMuugI2gGJ5Bkq6Ehnx+edbt
	a9BGyzgsnllbR2BCNCe/J5ofez5HqRZxpWXQ+AGY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TLLU39031164
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 16:21:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 16:21:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 16:21:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TLLUZm009065;
	Tue, 29 Aug 2017 16:21:30 -0500
Date: Tue, 29 Aug 2017 17:21:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20170829212125.GR8304@edge>
References: <1499800168-27634-1-git-send-email-h-gou@ti.com>
	<20170824214755.GV28233@edge>
	<2E957F12D11D904590FA9AF86D366BD926D72BF8@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926D72BF8@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 29, 2017 at 02:43:41PM -0400, Gou, Hongmei wrote:
> Please see below inline.

Ok, makes sense.


> Besides, icss-emac-lld-test has dependencies on starterware for AM3/AM4, I 
> will upstream the recipes for starterware soon.

Why is there a different starterware vs. starterware-rtos? Isn't it 
RTOS-specific anyway and has nothing to do with Linux?


> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, August 24, 2017 5:48 PM
> > To: Gou, Hongmei
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] icss-emac-lld*: upstream version 1.0.0.7C with
> > recipes for linux user space
> > 
> > On Tue, Jul 11, 2017 at 03:09:28PM -0400, Hongmei Gou wrote:
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47
> > ++++++++++++++++++++++
> > >  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        | 22 ++++++++++
> > >  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     | 26 ++++++++++++
> > >  3 files changed, 95 insertions(+)
> > >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > >  create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > >
> > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-
> > bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > > new file mode 100644
> > > index 0000000..f62bf33
> > > --- /dev/null
> > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> > > @@ -0,0 +1,47 @@
> > > +DESCRIPTION = "TI ICSS-EMAC low level driver tests"
> > > +
> > > +DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
> > > +
> > > +DEPENDS_append_ti33x = " starterware"
> > > +DEPENDS_append_ti43x = " starterware"
> > > +
> > > +include icss-emac-lld.inc
> > > +
> > > +PR = "${INC_PR}.0"
> > > +
> > > +COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
> > 
> > What about am57xx-hs-evm? Or dra7xx-evm?
> 
> ICSS-EMAC LLD will not be supported for am57xx-hs-evm and dra7xx-evm.
>  
> > 
> > > +
> > > +EXTRA_OEMAKE += "-f makefile_armv7
> > PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
> > > +
> > > +do_compile_am57xx-evm () {
> > > +#   Build the tests
> > > +    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
> > > +    oe_runmake clean
> > > +    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
> > 
> > Wouldn't this remove the am571x binaries before building am572x ones?
> 
> The make clean operation in the current makefile is not removing the binaries, but only the library files.
> 
> > 
> > > +}
> > > +
> > > +do_compile_ti33x () {
> > > +#   Build the tests
> > > +    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
> > > +}
> > > +
> > > +do_compile_ti43x () {
> > > +#   Build the tests
> > > +    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
> > > +}
> > > +
> > > +do_install_am57xx-evm () {
> > > +#   Install the binary
> > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
> > DEVICE="am571x" TARGET="SOC_AM571x"
> > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
> > DEVICE="am572x" TARGET="SOC_AM572x"
> > > +}
> > > +
> > > +do_install_ti33x () {
> > > +#   Install the binary
> > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
> > DEVICE="am335x" TARGET="SOC_AM335x"
> > > +}
> > > +
> > > +do_install_ti43x () {
> > > +#   Install the binary
> > > +    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
> > DEVICE="am437x" TARGET="SOC_AM437x"
> > > +}
> > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-
> > emac-lld/icss-emac-lld.inc
> > > new file mode 100644
> > > index 0000000..8e2ffd4
> > > --- /dev/null
> > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> > > @@ -0,0 +1,22 @@
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> > "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d851651130
> > 4f11a28586d"
> > > +
> > > +COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
> > 
> > AM5 HS and K2G HS platforms will be missed.
> 
> Yes, this is intended as ICSS-EMAC LLD will not be supported for AM5HS and K2G HS.
>  
> > 
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +
> > > +ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
> > > +ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
> > > +ICSS_EMAC_LLD_GIT_BRANCH = "master"
> > > +ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
> > > +
> > > +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> > > +ICSS_EMAC_LLD_SRCREV =
> > "08cb0540eeab7721fe82b603cb6285393f314117"
> > > +
> > > +BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
> > > +SRC_URI =
> > "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFI
> > X};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> > > +
> > > +SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
> > > +PV = "01.00.00.07C"
> > > +INC_PR = "r0"
> > > +
> > > +S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> > > diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-
> > bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > new file mode 100644
> > > index 0000000..272529b
> > > --- /dev/null
> > > +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> > > @@ -0,0 +1,26 @@
> > > +DESCRIPTION = "TI ICSS-EMAC low level driver library"
> > > +
> > > +DEPENDS="common-csl-ip pruss-lld osal"
> > > +
> > > +include icss-emac-lld.inc
> > > +
> > > +PR = "${INC_PR}.0"
> > > +
> > > +COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
> > > +
> > > +TARGET_NAME_am57xx-evm = "SOC_AM572x"
> > > +TARGET_NAME_ti33x = "SOC_AM335x"
> > > +TARGET_NAME_ti43x = "SOC_AM437x"
> > > +
> > > +EXTRA_OEMAKE += "-f makefile_armv7
> > PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
> > > +
> > > +do_compile () {
> > > +#   Build the lib
> > > +    oe_runmake clean
> > > +    oe_runmake lib
> > > +}
> > > +
> > > +do_install () {
> > > +#   Install the lib
> > > +    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir}
> > INSTALL_LIB_BASE_DIR=${D}${libdir}
> > > +}
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

