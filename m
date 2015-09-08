Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88EADE00BE7; Tue,  8 Sep 2015 15:37:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78E00E00B68
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 15:37:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t88MbcOO005569
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 17:37:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88MbchM024235
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 17:37:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Sep 2015 17:37:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88Mbc3i004641;
	Tue, 8 Sep 2015 17:37:38 -0500
Date: Tue, 8 Sep 2015 18:37:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150908223722.GG4305@edge>
References: <1441224270-14258-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1441224270-14258-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-osal: add the latest version of 1.24.00.09
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
X-List-Received-Date: Tue, 08 Sep 2015 22:37:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Pushed it to master/fido


On Wed, Sep 02, 2015 at 04:04:30PM -0400, Hongmei Gou wrote:
> * ti-osal is added for building dspdce-fw and ipumm-fw in Yocto
> 
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  recipes-ti/includes/ti-paths.inc      |  2 ++
>  recipes-ti/osal/ti-osal.inc           | 21 +++++++++++++++++++++
>  recipes-ti/osal/ti-osal_1.24.00.09.bb |  9 +++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 recipes-ti/osal/ti-osal.inc
>  create mode 100644 recipes-ti/osal/ti-osal_1.24.00.09.bb
> 
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index b902cbb..bd80fa1 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -44,6 +44,7 @@ export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
>  export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
>  export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
>  export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
> +export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
>  
>  # This is where the tools will end up in sysroot
>  export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
> @@ -78,6 +79,7 @@ export UIA_INSTALL_DIR        = "${STAGING_DIR_TARGET}${UIA_INSTALL_DIR_RECIPE}"
>  export XDAIS_INSTALL_DIR      = "${STAGING_DIR_TARGET}${XDAIS_INSTALL_DIR_RECIPE}"
>  export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
>  export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
> +export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
>  
>  DSPSUFFIX_omapl137 = "x674"
>  DSPSUFFIX_omapl138 = "x674"
> diff --git a/recipes-ti/osal/ti-osal.inc b/recipes-ti/osal/ti-osal.inc
> new file mode 100644
> index 0000000..09ee883
> --- /dev/null
> +++ b/recipes-ti/osal/ti-osal.inc
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "TI Operating System Abstraction Library (OSAL)"
> +HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal"
> +LICENSE = "BSD & EPL"
> +SECTION = "devel"
> +
> +require ../includes/ti-paths.inc
> +require ../includes/ti-staging.inc
> +
> +S = "${WORKDIR}/osal_${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/osal/${PV}/exports/osal_${PV}.tar.gz;name=osaltarball"
> +
> +do_install() {
> +    install -d ${D}${OSAL_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${OSAL_INSTALL_DIR_RECIPE}
> +}
> +
> +INSANE_SKIP_${PN}-dev = "staticdev"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN}-dev += "${OSAL_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/osal/ti-osal_1.24.00.09.bb b/recipes-ti/osal/ti-osal_1.24.00.09.bb
> new file mode 100644
> index 0000000..226458b
> --- /dev/null
> +++ b/recipes-ti/osal/ti-osal_1.24.00.09.bb
> @@ -0,0 +1,9 @@
> +require ti-osal.inc
> +
> +PV = "1_24_00_09"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://osal_${PV}_Manifest.html;md5=c110191994d011cee4cd02189ed3c9f4"
> +
> +SRC_URI[osaltarball.md5sum] = "a7ea85447fa0ff0f786d527a52fa6e8b"
> +SRC_URI[osaltarball.sha256sum] = "d14f1f43c8a7965e86add69bd813cea56ea7e38abeb55de3fdcdaf4a69f19bf3"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

