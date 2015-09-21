Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDF85E00CCC; Mon, 21 Sep 2015 09:43:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4AF0E00AF2
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 09:43:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8LGh0Lt000361
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 11:43:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LGh0jp019335
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 11:43:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 11:43:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LGh0vS000933;
	Mon, 21 Sep 2015 11:43:00 -0500
Date: Mon, 21 Sep 2015 12:42:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20150921164244.GF30229@edge>
References: <1442421520-8125-1-git-send-email-h-gou@ti.com>
	<20150917202046.GH18085@edge>
	<2E957F12D11D904590FA9AF86D366BD926ABC114@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926ABC114@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dspdce-fw: add recipe to build dspdce-fw from git source
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
X-List-Received-Date: Mon, 21 Sep 2015 16:43:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 17, 2015 at 06:03:55PM -0400, Gou, Hongmei wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, September 17, 2015 4:21 PM
> > To: Gou, Hongmei
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] dspdce-fw: add recipe to build dspdce-fw
> > from git source
> > 
> > What's the version? The recipe is not versioned and you don't set PV...
> 
> The version would be 1.00.00.06. Will sync up with automotive team to apply 
> the tag, and add PV in the v2 patch.
> 
> > 
> > Also, is it really machine-specific? It is only compatible with DRA7 and AM57,
> > but it doesn't seem to differentiate between them in the build steps.
> 
> Yes, this is machine-specific and compatible with DRA7 and AM57 only. The 
> build steps for DRA7 and AM57 are common.

If the build steps are common for those 2 machines and those are the only 
compatible machines, why make it machine-specific? You'd end up building it 
twice unnecessarily.


> > --
> > Denys
> > 
> > 
> > On Wed, Sep 16, 2015 at 12:38:40PM -0400, Hongmei Gou wrote:
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 54
> > ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > >
> > > diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-
> > bsp/dspdce-fw/dspdce-fw_git.bb
> > > new file mode 100644
> > > index 0000000..79ba68c
> > > --- /dev/null
> > > +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > > @@ -0,0 +1,54 @@
> > > +DESCRIPTION = "Firmware for DSP for an example application called
> > copycodectest"
> > > +LICENSE = "TI-TSPA"
> > > +LIC_FILES_CHKSUM =
> > "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6e
> > d75f22b1a2b7544b1c809d"
> > > +
> > > +COMPATIBLE_MACHINE = "dra7xx"
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +
> > > +SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> > > +SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +require recipes-ti/includes/ti-paths.inc
> > > +require recipes-ti/includes/ti-staging.inc
> > > +
> > > +PR = "r0"
> > > +
> > > +DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-
> > components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> > > +
> > > +export HWVERSION="ES10"
> > > +export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
> > > +
> > > +export XDCVERSION="ti-xdctools-tree"
> > > +export BIOSVERSION="ti-sysbios-tree"
> > > +export IPCVERSION="ti-ipc-tree"
> > > +export CEVERSION="ti-codec-engine-tree"
> > > +export FCVERSION="ti-framework-components-tree"
> > > +export XDAISVERSION="ti-xdais-tree"
> > > +export OSALVERSION="ti-osal-tree"
> > > +
> > > +export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> > > +export C66XCGTOOLSPATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-
> > c6x"
> > > +
> > > +do_configure() {
> > > +    cd ${S}
> > > +    make unconfig
> > > +    make vayu_config
> > > +}
> > > +
> > > +do_compile() {
> > > +    cd ${S}
> > > +    make dspbin
> > > +}
> > > +
> > > +TARGET = "dra7-dsp1-fw.xe66"
> > > +
> > > +do_install() {
> > > +        mkdir -p ${D}${base_libdir}/firmware
> > > +        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}
> > > +}
> > > +
> > > +INSANE_SKIP_${PN} = "arch"
> > > +
> > > +FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

