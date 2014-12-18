Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AEE37E00B49; Thu, 18 Dec 2014 15:41:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32883E002F9
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 15:41:38 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBINfbPh015066
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:41:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBINfb7u003364
	for <meta-ti@yoctoproject.org>; Thu, 18 Dec 2014 17:41:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Dec 2014 17:41:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBINfZFt018527;
	Thu, 18 Dec 2014 17:41:36 -0600
Date: Thu, 18 Dec 2014 18:41:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141218234132.GP29971@edge>
References: <1418945906-17216-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1418945906-17216-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] pa-lld: Add recipes for PA low level driver and test code
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
X-List-Received-Date: Thu, 18 Dec 2014 23:41:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 18, 2014 at 06:38:25PM -0500, Sam Nelson wrote:
> - Provides low level driver for Packet accelerator module
> - Supports k2h, k2k, k2l & k2e devices
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/pa-lld/pa-lld-test_git.bb |   28 ++++++++++++++++++++++++++++
>  recipes-bsp/pa-lld/pa-lld.inc         |   15 +++++++++++++++
>  recipes-bsp/pa-lld/pa-lld_git.bb      |   15 +++++++++++++++
>  3 files changed, 58 insertions(+)
>  create mode 100644 recipes-bsp/pa-lld/pa-lld-test_git.bb
>  create mode 100644 recipes-bsp/pa-lld/pa-lld.inc
>  create mode 100644 recipes-bsp/pa-lld/pa-lld_git.bb
> 
> diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
> new file mode 100644
> index 0000000..b70dadd
> --- /dev/null
> +++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "TI PA LLD unit test and example binaries"

What's PA? At least you spelled out SA in the next patch... :)


> +
> +DEPENDS = "common-csl-ip pa-lld cppi-lld qmss-lld sa-lld"
> +
> +include pa-lld.inc
> +
> +DEVICELIST = "k2h k2k k2l k2e"
> +
> +CHOICELIST = "yes no"
> +
> +do_compile () {
> +# Now build the lld unit test examples
> +	for device in ${DEVICELIST}
> +	do
> +	make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S}
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} USEDYNAMIC_LIB="$choice"
> +		done
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" PA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
> +	done
> +}
> diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
> new file mode 100644
> index 0000000..e93ce15
> --- /dev/null
> +++ b/recipes-bsp/pa-lld/pa-lld.inc
> @@ -0,0 +1,15 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
> +
> +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.01"
> +SRCREV = "55207930b4491f33776f2c4c2c0707a73c69314c"
> +PV = "03.00.01.01"
> +PR = "r0"
> +
> +BASEDIR = "${WORKDIR}/git"
> +S = "${BASEDIR}/ti/drv/pa"
> diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
> new file mode 100644
> index 0000000..63e34ad
> --- /dev/null
> +++ b/recipes-bsp/pa-lld/pa-lld_git.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "TI PA LLD library"
> +
> +DEPENDS = "common-csl-ip rm-lld"
> +
> +include pa-lld.inc
> +
> +do_compile () {
> +#   Now build the lld in the updated directory
> +	make -f makefile_armv7 DEVICE=k2h clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> +	make -f makefile_armv7 DEVICE=k2l lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> +}
> +
> +do_install () {
> +	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +}
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

