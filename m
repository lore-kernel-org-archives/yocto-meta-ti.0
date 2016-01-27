Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77827E00852; Wed, 27 Jan 2016 12:31:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE8D9E0079A
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:31:36 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RKVZDG007817
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 14:31:35 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKVZpA021605
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 14:31:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 14:31:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RKVYX4002789;
	Wed, 27 Jan 2016 14:31:34 -0600
Date: Wed, 27 Jan 2016 15:31:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160127203119.GX11314@edge>
References: <1453903149-1261-1-git-send-email-j-stiffler@ti.com>
	<1453903149-1261-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1453903149-1261-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] multiprocmgr-rtos: Add RTOS package for multiprocmgr
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
X-List-Received-Date: Wed, 27 Jan 2016 20:31:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 27, 2016 at 08:59:09AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/includes/ti-paths.inc                 |  2 ++
>  recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 28 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> 
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index b660c11..31427a6 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -54,6 +54,7 @@ export MATHLIB_C66_INSTALL_DIR_RECIPE     = "${installdir}/ti-mathlib-c66x-tree"
>  export IMGLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-imglib-c66x-tree"
>  export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
>  export OMP_INSTALL_DIR_RECIPE        = "${installdir}/ti-omp-tree"
> +export MPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-mpm-tree"
>  
>  
>  # This is where the tools will end up in sysroot
> @@ -99,6 +100,7 @@ export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL
>  export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
>  export CG_XML_INSTALL_DIR     = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
>  export OMP_INSTALL_DIR        = "${STAGING_DIR_TARGET}${OMP_INSTALL_DIR_RECIPE}"
> +export MPM_INSTALL_DIR        = "${STAGING_DIR_TARGET}${MPM_INSTALL_DIR_RECIPE}"
>  
>  DSPSUFFIX_omapl137 = "x674"
>  DSPSUFFIX_omapl138 = "x674"
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> new file mode 100644
> index 0000000..b3ae720
> --- /dev/null
> +++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "TI Multiproc Manager(RTOS) for KeyStone II"
> +SUMMARY = "Provides download, debug and other utilities for other cores in the SOC like DSP"

^^^ Wrong use of DESCRIPTION vs SUMMARY.
SUMMARY is used to provide a short one-line (under 80 char?) description of 
the package. And DESCRIPTION is used for more detailed and longer description, 
if needed. DESCRIPTION is optional and is the same as SUMMARY when not set.


> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/multiprocmgr/multiprocmgr.inc
> +
> +DEPENDS = "ti-cgt6x-native"
> +
> +PR = "${INC_PR}.0"
> +
> +export LOCAL_SYSROOT="${STAGING_DIR_TARGET}"
> +export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +
> +do_compile() {
> +    make c66x
> +    make test_c66x
> +    sourceipk_do_create_srcipk
> +}
> +
> +do_install() {
> +    install -d ${D}${MPM_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${MPM_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
> +INSANE_SKIP_${PN}-dev = "arch"
> +
> +ALLOW_EMPTY_${PN} = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

