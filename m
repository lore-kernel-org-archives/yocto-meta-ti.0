Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57751E00E95; Thu, 17 Sep 2015 13:21:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CF03E00E20
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 13:21:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HKL3Y2010021
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 15:21:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKL3nm028805
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 15:21:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 17 Sep 2015 15:21:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HKL2gm029593;
	Thu, 17 Sep 2015 15:21:02 -0500
Date: Thu, 17 Sep 2015 16:20:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150917202046.GH18085@edge>
References: <1442421520-8125-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1442421520-8125-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 17 Sep 2015 20:21:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What's the version? The recipe is not versioned and you don't set PV...

Also, is it really machine-specific? It is only compatible with DRA7 and AM57, 
but it doesn't seem to differentiate between them in the build steps.

-- 
Denys


On Wed, Sep 16, 2015 at 12:38:40PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 54 ++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> 
> diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> new file mode 100644
> index 0000000..79ba68c
> --- /dev/null
> +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> @@ -0,0 +1,54 @@
> +DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> +SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
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
> +TARGET = "dra7-dsp1-fw.xe66"
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

