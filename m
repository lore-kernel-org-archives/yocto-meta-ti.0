Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0651AE00AB0; Thu, 29 Oct 2015 07:49:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB89E00A28
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 07:49:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9TEnlEp023659
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 09:49:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TEnlW7006545
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 09:49:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Oct 2015 09:49:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TEnlpq026635;
	Thu, 29 Oct 2015 09:49:47 -0500
Date: Thu, 29 Oct 2015 10:49:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151029144931.GD8780@edge>
References: <1446121633-4283-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1446121633-4283-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-cgt-pru: Add version 2.1.1
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
X-List-Received-Date: Thu, 29 Oct 2015 14:49:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 29, 2015 at 08:27:12AM -0400, Jacob Stiffler wrote:
> * Require for integrating the PRU package into the SDK

You can drop this comment. Or you can just repeat the recipe DESCRIPTION here 
in the commit message...
The rest looks good.


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt-pru_2.1.1.bb | 45 +++++++++++++++++++++++++++++++++
>  recipes-ti/includes/ti-paths.inc        |  3 +++
>  2 files changed, 48 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
> new file mode 100644
> index 0000000..3cffd24
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "TI PRU Code Generation Tools"
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +
> +LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-unpack.inc
> +
> +BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME = "cgt-pru-x86"
> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +BINFILE_class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME_class-target = "cgt-pru-arm"
> +
> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
> +
> +SRC_URI[cgt-pru-x86.md5sum] = "d9923acea12dc41fc975c381804bd5ed"
> +SRC_URI[cgt-pru-x86.sha256sum] = "bbea68a6e793156cfb4874777bfd41a32b20172d3a8f61db6aed33a697a58e30"
> +
> +SRC_URI[cgt-pru-arm.md5sum] = "3b97df4966715bdb50f9a9fc58fe6b24"
> +SRC_URI[cgt-pru-arm.sha256sum] = "819a4680296fabf1ae0d4e0184276f8ab5324621d35388026d1b678ea71040c9"
> +
> +do_install() {
> +    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
> +    cp -r ${S}/ti-cgt-pru_${PV}/. \
> +          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
> +}
> +
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D}
> +}
> +
> +FILES_${PN} += "${datadir}/ti/*"
> +
> +FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
> +                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
> +"
> +
> +INSANE_SKIP_${PN} += "arch staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index 8880591..ad4ff78 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -48,6 +48,8 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
>  export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
>  export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
>  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
> +export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
> +
>  
>  # This is where the tools will end up in sysroot
>  export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
> @@ -86,6 +88,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
>  export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>  export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
>  export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
> +export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
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

