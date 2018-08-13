Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10BFEE00A54; Mon, 13 Aug 2018 11:32:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ABE0E006D8
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 11:32:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7DIWaVj005501
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 13:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534185156;
	bh=Mk8wmfMOLbnSvslYfR5QyYRZ04e385ZrCrKnN44hCLg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ITrWr/ArzRxm7HCZmCi7y+AptxSa9TTWJtpzeHDyHdT0xffKDpfAGp+QtXFocLFEU
	1iidhshmJ0UwC88rcfeChD5MsWvkL0SHflqDP/0QRHNpWiRr1t2kZc0hh3SD9AaF0+
	1SeXzo0hI0GIpzCyLEnfza9pIYcXeLrnbyTSZep4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7DIWZZv008893
	for <meta-ti@yoctoproject.org>; Mon, 13 Aug 2018 13:32:35 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 13 Aug 2018 13:32:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 13 Aug 2018 13:32:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7DIWZuY007699;
	Mon, 13 Aug 2018 13:32:35 -0500
Date: Mon, 13 Aug 2018 14:31:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20180813183130.GW2547@beryl>
References: <1533911012-21837-1-git-send-email-hzhang@ti.com>
	<a563d2ec8947454793dcafe2e471309e@ti.com>
	<20180811041351.GT2547@beryl>
	<5d234b472df94ac2a8e11292c3208d9f@ti.com>
MIME-Version: 1.0
In-Reply-To: <5d234b472df94ac2a8e11292c3208d9f@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [PATCH] recipes-ti: devtools: add GCC Linaro toolchain 2017.11 v7.2.1
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
X-List-Received-Date: Mon, 13 Aug 2018 18:32:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 12, 2018 at 09:02:12AM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Saturday, August 11, 2018 12:14 AM
> > To: Nelson, Sam
> > Cc: Zhang, Hao; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [EXTERNAL] [PATCH] recipes-ti: devtools: add GCC
> > Linaro toolchain 2017.11 v7.2.1
> > 
> > On Sat, Aug 11, 2018 at 02:47:10AM +0000, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > bounces@yoctoproject.org] On Behalf Of Zhang, Hao
> > > > Sent: Friday, August 10, 2018 10:24 AM
> > > > To: meta-ti@yoctoproject.org
> > > > Subject: [EXTERNAL] [meta-ti] [PATCH] recipes-ti: devtools: add GCC
> > Linaro
> > > > toolchain 2017.11 v7.2.1
> > > >
> > > > From: Hao Zhang <hzhang@ti.com>
> > > >
> > > > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > > > ---
> > > >  recipes-ti/devtools/gcc-linaro-aarch64-native.bb | 24
> > > > ++++++++++++++++++++++++
> > > >  recipes-ti/devtools/gcc-linaro-native.bb         | 24
> > > > ++++++++++++++++++++++++
> > > >  recipes-ti/devtools/gcc-linaro.inc               | 12 ++++++++++++
> > > >  recipes-ti/includes/ti-paths.inc                 |  2 ++
> > > >  4 files changed, 62 insertions(+)
> > > >  create mode 100644 recipes-ti/devtools/gcc-linaro-aarch64-native.bb
> > > >  create mode 100644 recipes-ti/devtools/gcc-linaro-native.bb
> > > >  create mode 100644 recipes-ti/devtools/gcc-linaro.inc
> > > >
> > > > diff --git a/recipes-ti/devtools/gcc-linaro-aarch64-native.bb b/recipes-
> > > > ti/devtools/gcc-linaro-aarch64-native.bb
> > > > new file mode 100644
> > > > index 0000000..6c0482d
> > > > --- /dev/null
> > > > +++ b/recipes-ti/devtools/gcc-linaro-aarch64-native.bb
> > > > @@ -0,0 +1,24 @@
> > > > +include recipes-ti/devtools/gcc-linaro.inc
> > > > +
> > > > +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-
> > elf"
> > > > +S = "${WORKDIR}/${PACKAGE_DIR}"
> > > > +
> > > > +LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> > > > +
> > > > +inherit native
> > > > +require recipes-ti/includes/ti-paths.inc
> > > > +
> > > > +SRC_URI =
> > "https://releases.linaro.org/components/toolchain/binaries/7.2-
> > > > ${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> > > > x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
> > > > +
> > > > +SRC_URI[gcc-linaro-aarch64.md5sum] =
> > > > "4972f8943820bdd2f577f498de78964b"
> > > > +SRC_URI[gcc-linaro-aarch64.sha256sum] =
> > > >
> > "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4
> > > > c8"
> > > > +
> > > > +do_install() {
> > > > +    install -d ${D}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}
> > > > +    cp -r ${S}/. ${D}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}
> > > > +}
> > > > +
> > > > +FILES_${PN} = "${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}/*"
> > > > +
> > > > +INSANE_SKIP_${PN} = "already-stripped"
> > > > +
> > > > diff --git a/recipes-ti/devtools/gcc-linaro-native.bb b/recipes-
> > ti/devtools/gcc-
> > > > linaro-native.bb
> > > > new file mode 100644
> > > > index 0000000..767c0c0
> > > > --- /dev/null
> > > > +++ b/recipes-ti/devtools/gcc-linaro-native.bb
> > > > @@ -0,0 +1,24 @@
> > > > +include recipes-ti/devtools/gcc-linaro.inc
> > > > +
> > > > +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
> > > > +S = "${WORKDIR}/${PACKAGE_DIR}"
> > > > +
> > > > +LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> > > > +
> > > > +inherit native
> > > > +require recipes-ti/includes/ti-paths.inc
> > > > +
> > > > +SRC_URI =
> > "https://releases.linaro.org/components/toolchain/binaries/7.2-
> > > > ${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> > > > x86_64_arm-eabi.tar.xz;name=gcc-linaro"
> > > > +
> > > > +SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
> > > > +SRC_URI[gcc-linaro.sha256sum] =
> > > >
> > "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
> > > > +
> > > > +do_install() {
> > > > +    install -d ${D}${GCC_LINARO_TOOLCHAIN_RECIPE}
> > > > +    cp -r ${S}/. ${D}${GCC_LINARO_TOOLCHAIN_RECIPE}
> > > > +}
> > > > +
> > > > +FILES_${PN} = "${GCC_LINARO_TOOLCHAIN_RECIPE}/*"
> > > > +
> > > > +INSANE_SKIP_${PN} = "already-stripped"
> > > > +
> > > > diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc-
> > > > linaro.inc
> > > > new file mode 100644
> > > > index 0000000..6575fc5
> > > > --- /dev/null
> > > > +++ b/recipes-ti/devtools/gcc-linaro.inc
> > > > @@ -0,0 +1,12 @@
> > > > +DESCRIPTION = "Linaro GCC for ARM"
> > > > +HOMEPAGE = "https://launchpad.net/gcc-arm-embedded"
> > > > +SECTION = "devel"
> > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > > +LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-
> > > > License.html;md5=${LIC_CHKSUM}"
> > > > +
> > > > +PV = "7.2.1"
> > > > +PR = "r0"
> > > > +
> > > > +GCC_ARM_YEAR = "2017.11"
> > > > +
> > > > +
> > > > diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-
> > paths.inc
> > > > index 4f99d5e..ef2feae 100644
> > > > --- a/recipes-ti/includes/ti-paths.inc
> > > > +++ b/recipes-ti/includes/ti-paths.inc
> > > > @@ -56,6 +56,8 @@ export CG_XML_INSTALL_DIR_RECIPE     =
> > > > "${installdir}/ti-cg-xml-tree"
> > > >  export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
> > > >  export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
> > > >  export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
> > > > +export GCC_LINARO_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro"
> > > > +export GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-
> > linaro-aarch64"
> > 
> > NAK
> > 
> 
> > > Also need to add the following for completeness:
> > > export GCC_LINARO_TOOLCHAIN        =
> > "${STAGING_DIR_NATIVE}${GCC_LINARO_TOOLCHAIN_RECIPE}"
> > > export GCC_LINARO_AARCH64_TOOLCHAIN        =
> > "${STAGING_DIR_NATIVE}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}"
> > 
> > NAK
> > 
> > "GCC Linaro" name is confusing in this context.
> > 
> 
> Given the compiler referred here is GCC Linaro. I am not sure whether we can avoid using GCC Linaro it.
> Any alternate suggestions? Is GCC_ARM_LINARO_AARCH64_TOOLCHAIN_DIR acceptable?

My point is that we've been using Linaro GCC toolchain successfully to compile 
everything in our Linux SDKs for years - this addition has nothing to do with 
that and hence, confusing.

What you are adding here is "bare-metal" toolchain for RTOS, so please name it 
respectively, so it won't be confusing to Linux users. Thanks.


> > > >  # This is where the tools will end up in sysroot
> > > >  export BIOS_INSTALL_DIR       =
> > > > "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

