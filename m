Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAAA5E00A5C; Fri, 28 Apr 2017 11:09:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E954E00A9B
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:09:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SI90AW002258
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 13:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493402940;
	bh=tGMUbo0H7I+xAYhclCCj3WF48Tc4RL4RGAx2fFI5Gmw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GQgs+6o3neMjynXmsjuDRJhY7Pf/AbyZq4XUSs/VdUOzbS+t5T47PkT5Mq7dkporW
	t+y9aL6RhSBLrx8YlWboW0kX1NNfAZPgB7Q2NqapovxfGNWw7EuY1xX/vPTYk8Xg+i
	PqxHo9A/b6ZANQCzvnMF893qiR3CPUV7c6xSLFrE=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SI90qr004554
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 13:09:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 13:08:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SI8xus004781;
	Fri, 28 Apr 2017 13:09:00 -0500
Date: Fri, 28 Apr 2017 14:08:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Sobota, Justin" <jsobota@ti.com>
Message-ID: <20170428180859.GL31608@edge>
References: <1493331034-13464-1-git-send-email-jsobota@ti.com>
	<20170428002250.GI31608@edge>
	<311ECDE3E284F649854AED0B108A0CE14C092A75@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <311ECDE3E284F649854AED0B108A0CE14C092A75@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/morty][PATCH] Resolve host contamination warnings
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
X-List-Received-Date: Fri, 28 Apr 2017 18:09:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Justin,

See below.


On Fri, Apr 28, 2017 at 10:37:14AM -0400, Sobota, Justin wrote:
> Hmm...I rebased with latest from morty, including Karthik's patches which 
> touch two of the files in this patch, and the patch applied cleanly.
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, April 27, 2017 8:23 PM
> To: Sobota, Justin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [master/morty][PATCH] Resolve host contamination warnings
> 
> Does not apply - haven't checked what's wrong yet...
> 
> 
> On Thu, Apr 27, 2017 at 06:10:34PM -0400, Justin Sobota wrote:
> > Signed-off-by: Justin Sobota <jsobota@ti.com>
> > ---
> >  classes/ti-pdk.bbclass                                      | 2 +-
> >  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb                 | 5 +++--
> >  recipes-ti/bios/ti-sysbios.inc                              | 3 ++-
> >  recipes-ti/devtools/ti-cg-xml_2.41.00.bb                    | 3 ++-
> >  recipes-ti/dsplib/dsplib-c66x.inc                           | 3 ++-
> >  recipes-ti/framework-components/ti-framework-components.inc | 3 ++-
> >  recipes-ti/imglib/imglib-c66x.inc                           | 3 ++-
> >  recipes-ti/mathlib/mathlib-c66x.inc                         | 3 ++-
> >  recipes-ti/xdais/ti-xdais.inc                               | 3 ++-
> >  9 files changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass index 
> > fd7c3e7..d4dbb5f 100644
> > --- a/classes/ti-pdk.bbclass
> > +++ b/classes/ti-pdk.bbclass
> > @@ -89,7 +89,7 @@ do_compile() {
> >  
> >  do_install () {
> >      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
> > -    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> > +    find -name "*.tar" -exec tar xf {} --no-same-owner -C 
> > + ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
> >      
> >      if [ "${PDK_COMP_LINK_TEXT}" != "" ]
> >      then
> > diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb 
> > b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> > index 6a01d0b..63dca8f 100644
> > --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> > +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> > @@ -2,7 +2,7 @@ require edma3-lld.inc
> >  require recipes-ti/includes/ti-paths.inc  require 
> > recipes-ti/includes/ti-staging.inc
> >  
> > -PR = "${INC_PR}.0"
> > +PR = "${INC_PR}.1"
> >  
> >  DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"

ti-ccsv6-native got replaced with ti-cgt-arm-native ^^^^^^^^^^^^^^^^^^^^^^^^^


> >  
> > @@ -106,8 +106,9 @@ do_compile () {
> >  }
> >  
> >  do_install () {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  INSANE_SKIP_${PN}-dev = "arch ldflags"
> > diff --git a/recipes-ti/bios/ti-sysbios.inc 
> > b/recipes-ti/bios/ti-sysbios.inc index 408be78..53b55a5 100644
> > --- a/recipes-ti/bios/ti-sysbios.inc
> > +++ b/recipes-ti/bios/ti-sysbios.inc
> > @@ -15,8 +15,9 @@ BINFILE="bios_setuplinux_${PV}.bin"
> >  TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${SYSBIOS_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  ALLOW_EMPTY_${PN} = "1"
> > diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb 
> > b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> > index 115254e..a0387b7 100644
> > --- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> > +++ b/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> > @@ -25,8 +25,9 @@ TI_BIN_UNPK_CMDS=""
> >  TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${CG_XML_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${CG_XML_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  FILES_${PN} += "${CG_XML_INSTALL_DIR_RECIPE}"
> > diff --git a/recipes-ti/dsplib/dsplib-c66x.inc 
> > b/recipes-ti/dsplib/dsplib-c66x.inc
> > index 31acc1e..ce978db 100644
> > --- a/recipes-ti/dsplib/dsplib-c66x.inc
> > +++ b/recipes-ti/dsplib/dsplib-c66x.inc
> > @@ -16,8 +16,9 @@ TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
> >  TI_BIN_UNPK_CMDS = ""
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  ALLOW_EMPTY_${PN} = "1"
> > diff --git 
> > a/recipes-ti/framework-components/ti-framework-components.inc 
> > b/recipes-ti/framework-components/ti-framework-components.inc
> > index e111ec4..d3a1d75 100644
> > --- a/recipes-ti/framework-components/ti-framework-components.inc
> > +++ b/recipes-ti/framework-components/ti-framework-components.inc
> > @@ -11,8 +11,9 @@ S = "${WORKDIR}/framework_components_${PV}"
> >  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${FC_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  INSANE_SKIP_${PN} = "ldflags"
> > diff --git a/recipes-ti/imglib/imglib-c66x.inc 
> > b/recipes-ti/imglib/imglib-c66x.inc
> > index 3c76ad5..eb57598 100644
> > --- a/recipes-ti/imglib/imglib-c66x.inc
> > +++ b/recipes-ti/imglib/imglib-c66x.inc
> > @@ -18,8 +18,9 @@ TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
> >  TI_BIN_UNPK_CMDS = ""
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${IMGLIB_C66_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  ALLOW_EMPTY_${PN} = "1"
> > diff --git a/recipes-ti/mathlib/mathlib-c66x.inc 
> > b/recipes-ti/mathlib/mathlib-c66x.inc
> > index 1511337..7951e6c 100644
> > --- a/recipes-ti/mathlib/mathlib-c66x.inc
> > +++ b/recipes-ti/mathlib/mathlib-c66x.inc
> > @@ -18,8 +18,9 @@ TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
> >  TI_BIN_UNPK_CMDS = ""
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${MATHLIB_C66_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  ALLOW_EMPTY_${PN} = "1"
> > diff --git a/recipes-ti/xdais/ti-xdais.inc 
> > b/recipes-ti/xdais/ti-xdais.inc index a12ad64..24268b3 100644
> > --- a/recipes-ti/xdais/ti-xdais.inc
> > +++ b/recipes-ti/xdais/ti-xdais.inc
> > @@ -11,8 +11,9 @@ S = "${WORKDIR}/xdais_${PV}"
> >  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/${PV}/exports/xdais_${PV}.tar.gz;name=xdaistarball"
> >  
> >  do_install() {
> > +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >      install -d ${D}${XDAIS_INSTALL_DIR_RECIPE}
> > -    cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
> > +    cp ${CP_ARGS} ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
> >  }
> >  
> >  INHIBIT_PACKAGE_STRIP = "1"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

