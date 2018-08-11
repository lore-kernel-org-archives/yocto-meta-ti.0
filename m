Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A24EE00874; Fri, 10 Aug 2018 21:15:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2593FE00848
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 21:14:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7B4ExNr023367
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 23:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533960899;
	bh=F3fzZDAewlUPxstr6ckwLbtKa4+qNbUvccHBsSLUT6w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dK5MLcyh/48S0bykLfQqiqHlRAI3EolNwMjx6ZP+D/af0S1VEuY+2G/QKrap71BVF
	mSlJaiQ+oSHMXNmJvQ9gbpjlsMb4FHhJc9zTIOt97WcfEQZhcSV0G8aovJkWitZ/G9
	3NCajeR7tWrtRVjOZqJWouTOpy4b1VzaCs2NPGG4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7B4ExGF006813
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2018 23:14:59 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 10 Aug 2018 23:14:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 10 Aug 2018 23:14:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7B4Exr7009029;
	Fri, 10 Aug 2018 23:14:59 -0500
Date: Sat, 11 Aug 2018 00:13:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20180811041351.GT2547@beryl>
References: <1533911012-21837-1-git-send-email-hzhang@ti.com>
	<a563d2ec8947454793dcafe2e471309e@ti.com>
MIME-Version: 1.0
In-Reply-To: <a563d2ec8947454793dcafe2e471309e@ti.com>
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
X-List-Received-Date: Sat, 11 Aug 2018 04:15:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 11, 2018 at 02:47:10AM +0000, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Zhang, Hao
> > Sent: Friday, August 10, 2018 10:24 AM
> > To: meta-ti@yoctoproject.org
> > Subject: [EXTERNAL] [meta-ti] [PATCH] recipes-ti: devtools: add GCC Linaro
> > toolchain 2017.11 v7.2.1
> > 
> > From: Hao Zhang <hzhang@ti.com>
> > 
> > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > ---
> >  recipes-ti/devtools/gcc-linaro-aarch64-native.bb | 24
> > ++++++++++++++++++++++++
> >  recipes-ti/devtools/gcc-linaro-native.bb         | 24
> > ++++++++++++++++++++++++
> >  recipes-ti/devtools/gcc-linaro.inc               | 12 ++++++++++++
> >  recipes-ti/includes/ti-paths.inc                 |  2 ++
> >  4 files changed, 62 insertions(+)
> >  create mode 100644 recipes-ti/devtools/gcc-linaro-aarch64-native.bb
> >  create mode 100644 recipes-ti/devtools/gcc-linaro-native.bb
> >  create mode 100644 recipes-ti/devtools/gcc-linaro.inc
> > 
> > diff --git a/recipes-ti/devtools/gcc-linaro-aarch64-native.bb b/recipes-
> > ti/devtools/gcc-linaro-aarch64-native.bb
> > new file mode 100644
> > index 0000000..6c0482d
> > --- /dev/null
> > +++ b/recipes-ti/devtools/gcc-linaro-aarch64-native.bb
> > @@ -0,0 +1,24 @@
> > +include recipes-ti/devtools/gcc-linaro.inc
> > +
> > +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
> > +S = "${WORKDIR}/${PACKAGE_DIR}"
> > +
> > +LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> > +
> > +inherit native
> > +require recipes-ti/includes/ti-paths.inc
> > +
> > +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-
> > ${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> > x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
> > +
> > +SRC_URI[gcc-linaro-aarch64.md5sum] =
> > "4972f8943820bdd2f577f498de78964b"
> > +SRC_URI[gcc-linaro-aarch64.sha256sum] =
> > "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4
> > c8"
> > +
> > +do_install() {
> > +    install -d ${D}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}
> > +    cp -r ${S}/. ${D}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}
> > +}
> > +
> > +FILES_${PN} = "${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}/*"
> > +
> > +INSANE_SKIP_${PN} = "already-stripped"
> > +
> > diff --git a/recipes-ti/devtools/gcc-linaro-native.bb b/recipes-ti/devtools/gcc-
> > linaro-native.bb
> > new file mode 100644
> > index 0000000..767c0c0
> > --- /dev/null
> > +++ b/recipes-ti/devtools/gcc-linaro-native.bb
> > @@ -0,0 +1,24 @@
> > +include recipes-ti/devtools/gcc-linaro.inc
> > +
> > +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
> > +S = "${WORKDIR}/${PACKAGE_DIR}"
> > +
> > +LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
> > +
> > +inherit native
> > +require recipes-ti/includes/ti-paths.inc
> > +
> > +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-
> > ${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-
> > x86_64_arm-eabi.tar.xz;name=gcc-linaro"
> > +
> > +SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
> > +SRC_URI[gcc-linaro.sha256sum] =
> > "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
> > +
> > +do_install() {
> > +    install -d ${D}${GCC_LINARO_TOOLCHAIN_RECIPE}
> > +    cp -r ${S}/. ${D}${GCC_LINARO_TOOLCHAIN_RECIPE}
> > +}
> > +
> > +FILES_${PN} = "${GCC_LINARO_TOOLCHAIN_RECIPE}/*"
> > +
> > +INSANE_SKIP_${PN} = "already-stripped"
> > +
> > diff --git a/recipes-ti/devtools/gcc-linaro.inc b/recipes-ti/devtools/gcc-
> > linaro.inc
> > new file mode 100644
> > index 0000000..6575fc5
> > --- /dev/null
> > +++ b/recipes-ti/devtools/gcc-linaro.inc
> > @@ -0,0 +1,12 @@
> > +DESCRIPTION = "Linaro GCC for ARM"
> > +HOMEPAGE = "https://launchpad.net/gcc-arm-embedded"
> > +SECTION = "devel"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > +LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-
> > License.html;md5=${LIC_CHKSUM}"
> > +
> > +PV = "7.2.1"
> > +PR = "r0"
> > +
> > +GCC_ARM_YEAR = "2017.11"
> > +
> > +
> > diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> > index 4f99d5e..ef2feae 100644
> > --- a/recipes-ti/includes/ti-paths.inc
> > +++ b/recipes-ti/includes/ti-paths.inc
> > @@ -56,6 +56,8 @@ export CG_XML_INSTALL_DIR_RECIPE     =
> > "${installdir}/ti-cg-xml-tree"
> >  export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
> >  export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
> >  export TI_CGT6X_7_INSTALL_DIR_RECIPE   = "${installdir}/cgt6x-7"
> > +export GCC_LINARO_TOOLCHAIN_RECIPE          = "${installdir}/gcc-linaro"
> > +export GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE  = "${installdir}/gcc-linaro-aarch64"

NAK

> Also need to add the following for completeness: 
> export GCC_LINARO_TOOLCHAIN        = "${STAGING_DIR_NATIVE}${GCC_LINARO_TOOLCHAIN_RECIPE}"
> export GCC_LINARO_AARCH64_TOOLCHAIN        = "${STAGING_DIR_NATIVE}${GCC_LINARO_AARCH64_TOOLCHAIN_RECIPE}"

NAK 

"GCC Linaro" name is confusing in this context.


> >  # This is where the tools will end up in sysroot
> >  export BIOS_INSTALL_DIR       =
> > "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

