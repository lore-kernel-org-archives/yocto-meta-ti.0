Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13720E00B8B; Mon, 12 Jun 2017 18:56:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6716AE00B67
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 18:56:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5D1uCFU008692
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 20:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497318972;
	bh=S1qcyPstDwa1mzu7PiwEV6GNDSKRx6Q+A4026urMn8c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AFqeTTCCsihKDGVP7ozDiTolbEG8ontrRyjU8mVwyR1FxAYQCTY4BI8+bbm+qMX87
	+mvxkFluBOsRYeJy5p4LVQAzWvSFOkYcO//+Q8KD9ocwNisVT3YmT2nY1j5hcSCN3I
	3EfnSanO9rF+dOlOjqdjTudSk4978JwZSnGbiLEM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5D1uCZL011342
	for <meta-ti@yoctoproject.org>; Mon, 12 Jun 2017 20:56:12 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 20:56:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5D1uBE8000397;
	Mon, 12 Jun 2017 20:56:11 -0500
Date: Mon, 12 Jun 2017 21:56:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170613015610.GJ21219@edge>
References: <1496686180-21056-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1496686180-21056-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] starterware-rtos: added recipe for RTOS starterware
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
X-List-Received-Date: Tue, 13 Jun 2017 01:56:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Do you have any comments?


On Mon, Jun 05, 2017 at 01:09:40PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-bsp/starterware/starterware-rtos_git.bb | 46 +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
> 
> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
> new file mode 100644
> index 0000000..3fbe763
> --- /dev/null
> +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> @@ -0,0 +1,46 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x"
> +DEPENDS = "gcc-arm-none-eabi-native"
> +
> +require recipes-ti/includes/ti-staging.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
> +STARTERWARE_GIT_PROTOCOL = "git"
> +STARTERWARE_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.02A"
> +STARTERWARE_SRCREV = "d648ffc46a3508802ec5d4f70f3d0e8f970ce1fa"
> +
> +BRANCH = "${STARTERWARE_GIT_BRANCH}"
> +SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${STARTERWARE_SRCREV}"
> +PV = "02.01.01.02A"
> +PR = "r0"
> +
> +S = "${WORKDIR}/git"
> +
> +PARTNO_ti33x = "am335x"
> +PARTNO_ti43x = "am437x"
> +
> +export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
> +
> +do_compile() {
> +    cd build
> +    ./release_${PARTNO}.sh
> +}
> +
> +do_install() {
> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \;
> +}
> +
> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
> +
> +INSANE_SKIP_${PN} = "arch staticdev"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

