Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A774E00404; Wed,  2 Dec 2015 13:49:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98087E00404
	for <meta-ti@yoctoproject.org>; Wed,  2 Dec 2015 13:49:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB2Lnqqx021882
	for <meta-ti@yoctoproject.org>; Wed, 2 Dec 2015 15:49:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB2Lnqop021300
	for <meta-ti@yoctoproject.org>; Wed, 2 Dec 2015 15:49:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Dec 2015 15:49:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB2Lnp6q028088;
	Wed, 2 Dec 2015 15:49:51 -0600
Date: Wed, 2 Dec 2015 16:49:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20151202214935.GM6264@edge>
References: <1449089447-2567-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1449089447-2567-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3] dsplib-c66x: add version 3.4.0.0
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
X-List-Received-Date: Wed, 02 Dec 2015 21:49:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

And what about the other 2 - mathlib and imglib?

On Wed, Dec 02, 2015 at 03:50:47PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v3 changes:
> * Remove c66x from COMPATIBLE_MACHINE
> * Remove SRCIPK
> 
>  recipes-ti/dsplib/dsplib-c66x.inc        | 26 ++++++++++++++++++++++++++
>  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 +++++++++
>  recipes-ti/includes/ti-paths.inc         |  2 ++
>  3 files changed, 37 insertions(+)
>  create mode 100644 recipes-ti/dsplib/dsplib-c66x.inc
>  create mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> 
> diff --git a/recipes-ti/dsplib/dsplib-c66x.inc b/recipes-ti/dsplib/dsplib-c66x.inc
> new file mode 100644
> index 0000000..31acc1e
> --- /dev/null
> +++ b/recipes-ti/dsplib/dsplib-c66x.inc
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "DSPLIB contains optimized general-purpose signal-processing routines for TI DSPs"
> +HOMEPAGE = "http://www.ti.com/tool/sprc265"
> +SECTION = "devel"
> +LICENSE = "BSD-3-Clause"
> +
> +require ../includes/ti-paths.inc
> +require ../includes/ti-staging.inc
> +require ../includes/ti-unpack.inc
> +
> +COMPATIBLE_MACHINE = "omap-a15|keystone"
> +
> +SRC_URI = "http://software-dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=dsplib"
> +
> +BINFILE = "dsplib_c66x_${PV}_Linux.bin"
> +TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +do_install() {
> +    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN}-dev += "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev = "arch"
> diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> new file mode 100644
> index 0000000..f1273f3
> --- /dev/null
> +++ b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> @@ -0,0 +1,9 @@
> +require dsplib-c66x.inc
> +
> +PV = "3_4_0_0"
> +PR = "r1"
> +
> +LIC_FILES_CHKSUM = "file://packages/ti/dsplib/dsplib.h;beginline=9;endline=35;md5=17733f9e1100f8a628512f47c4bf676a"
> +
> +SRC_URI[dsplib.md5sum] = "66785604729c153dcad5282097dee8bf"
> +SRC_URI[dsplib.sha256sum] = "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index ad4ff78..37feb93 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -49,6 +49,7 @@ export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
>  export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
>  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
>  export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
> +export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
>  
>  
>  # This is where the tools will end up in sysroot
> @@ -89,6 +90,7 @@ export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTAL
>  export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
>  export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
>  export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> +export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
>  
>  DSPSUFFIX_omapl137 = "x674"
>  DSPSUFFIX_omapl138 = "x674"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

