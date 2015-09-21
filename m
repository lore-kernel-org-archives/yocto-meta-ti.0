Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A85F4E00C55; Mon, 21 Sep 2015 09:48:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30899E00AF2
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 09:48:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8LGmDiE029490
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 11:48:13 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LGmDA1003123
	for <meta-ti@yoctoproject.org>; Mon, 21 Sep 2015 11:48:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 11:48:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8LGmDCa012030;
	Mon, 21 Sep 2015 11:48:13 -0500
Date: Mon, 21 Sep 2015 12:47:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150921164757.GG30229@edge>
References: <1442615226-27091-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1442615226-27091-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] dspdce-fw: add recipe to build dspdce-fw from git source
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
X-List-Received-Date: Mon, 21 Sep 2015 16:48:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 18, 2015 at 06:27:06PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> 
> v2 changes:
> 1) Added PV with "git", to be used to set PREFERRED_VERSION to choose compiling from git source
> 2) Modified TARGET file name (.dce added): allow the firmware to co-exist with OpenCL
> 
> ---
>  recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 57 ++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> 
> diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> new file mode 100644
> index 0000000..b249e55
> --- /dev/null
> +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> @@ -0,0 +1,57 @@
> +DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

As mentioned in another email ^^^


> +
> +SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> +
> +SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
> +
> +PV = "1.00.00.06+git${SRCREV}"

Don't use SRCREV here ^^^


> +
> +S = "${WORKDIR}/git"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +PR = "r0"
> +
> +DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> +
> +export HWVERSION="ES10"
> +export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
> +
> +export XDCVERSION="ti-xdctools-tree"
> +export BIOSVERSION="ti-sysbios-tree"
> +export IPCVERSION="ti-ipc-tree"
> +export CEVERSION="ti-codec-engine-tree"
> +export FCVERSION="ti-framework-components-tree"
> +export XDAISVERSION="ti-xdais-tree"
> +export OSALVERSION="ti-osal-tree"
> +
> +export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> +export C66XCGTOOLSPATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +
> +do_configure() {
> +    cd ${S}
> +    make unconfig
> +    make vayu_config
> +}
> +
> +do_compile() {
> +    cd ${S}
> +    make dspbin
> +}
> +
> +TARGET = "dra7-dsp1-fw.xe66.dce"
> +
> +do_install() {
> +        mkdir -p ${D}${base_libdir}/firmware
> +        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}
> +}
> +
> +INSANE_SKIP_${PN} = "arch"
> +
> +FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

