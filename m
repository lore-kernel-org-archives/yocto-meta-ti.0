Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37144E00A1E; Fri, 29 May 2015 13:15:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A629E009A3
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 13:15:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TKFGn1015776
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:15:16 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKFGDU030376
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:15:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:15:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TKFFXd029803;
	Fri, 29 May 2015 15:15:15 -0500
Date: Fri, 29 May 2015 16:15:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529201515.GI16418@edge>
References: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
	<1432743617-24000-4-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432743617-24000-4-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] edma3-lld-rtos: Add the EDMA3 LLD RTOS package.
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
X-List-Received-Date: Fri, 29 May 2015 20:15:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

Same 2 questions:
are all deps are ready?
want to change packaging to ${PN}-dev?


On Wed, May 27, 2015 at 12:20:17PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |   75 +++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> new file mode 100644
> index 0000000..246d7a8
> --- /dev/null
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> @@ -0,0 +1,75 @@
> +require edma3-lld.inc
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +PR = "r0"
> +
> +DEPENDS = "ti-cgt6x-native ti-sysbios ti-xdctools"
> +
> +COMPATIBLE_MACHINE = "dra7xx|keystone"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PLATFORMLIST = ""
> +PLATFORMLIST_keystone = " \
> +        tci6636k2h-evm \
> +        tci6638k2k-evm \
> +        tci6630k2l-evm \
> +        c66ak2e-evm \
> +"
> +
> +PLATFORMLIST_dra7xx = " \
> +        tda2xx-evm \
> +        dra72x-evm \
> +        am571x-evm \
> +        am572x-evm \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +PARALLEL_MAKE = ""
> +
> +export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr"
> +export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export CGTOOLS = "${XDCCGROOT}"
> +export CGTOOLS_ELF = "${XDCCGROOT}"
> +export CODEGEN_PATH_DSP = "${XDCCGROOT}"
> +export CODEGEN_PATH_DSPELF = "${XDCCGROOT}"
> +export TMS470_CGTOOLS = "${XDCCGROOT}"
> +export UTILS_INSTALL_DIR = "${XDC_INSTALL_DIR}"
> +export XDCPATH = "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
> +export PATH := "${XDC_INSTALL_DIR}:${PATH}"
> +export ROOTDIR="${S}"
> +export INTERNAL_SW_ROOT="${S}"
> +export CROSSCC="${TARGET_PREFIX}gcc"
> +export CROSSAR="${TARGET_PREFIX}ar"
> +export CROSSLNK="${TARGET_PREFIX}gcc"
> +
> +
> +EXTRA_OEMAKE += " -C ${S}/packages TARGET=66 FORMAT=ELF"
> +
> +do_configure () {
> +    sed -i -e "s|^UTILS_INSTALL_DIR =.*$|UTILS_INSTALL_DIR = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
> +    sed -i -e "s|^bios_PATH =.*$|bios_PATH = ${SYSBIOS_INSTALL_DIR}|g" ${S}/makerules/env.mk
> +    sed -i -e "s|^xdc_PATH =.*$|xdc_PATH = ${XDC_INSTALL_DIR}|g" ${S}/makerules/env.mk
> +    sed -i -e "s|^CODEGEN_PATH_DSP =.*$|CODEGEN_PATH_DSP = ${XDCCGROOT}|g" ${S}/makerules/env.mk
> +    sed -i -e "s|^CODEGEN_PATH_DSPELF =.*$|CODEGEN_PATH_DSPELF = ${XDCCGROOT}|g" ${S}/makerules/env.mk
> +
> +    cd ${S}/packages
> +    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
> +}
> +
> +do_compile () {
> +    for p in ${PLATFORMLIST}
> +    do
> +        oe_runmake PLATFORM=${p}
> +    done
> +}
> +
> +do_install () {
> +    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
> +}
> +
> +INSANE_SKIP_${PN} = "arch"
> +
> +FILES_${PN} += "${EDMA3_LLD_INSTALL_DIR_RECIPE}"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

