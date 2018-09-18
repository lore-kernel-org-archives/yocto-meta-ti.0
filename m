Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98D6BE00B43; Mon, 17 Sep 2018 17:26:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB1BDE00AE0
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 17:26:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8I0QkPW111759
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 19:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537230406;
	bh=uWRPeMg1NocrBwutrlaqCaAxeeXbqjN4nTZby8K1VRM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZSom6PWRerRt2MBeCyn1CPexNz3AcfrrW6AAuPcw1S29xEqxLoA8YdYmyJaA1EXe3
	SjSIAie2bsda4AsDXkEIdMuRYkjn7TEq2tVkYqPbdf8C97uZWAYzI0gRl6G4BH7CKD
	4Lrj8iBMHUYwkouBcWiURpLWcjzBWu5vOUHrXgfA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8I0QjXg030414
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2018 19:26:45 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 19:26:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 19:26:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8I0QjAG030943;
	Mon, 17 Sep 2018 19:26:45 -0500
Date: Mon, 17 Sep 2018 20:25:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20180918002524.GH12296@beryl>
References: <1536958026-18761-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536958026-18761-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] swtools: common tools for xdc-based component build
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
X-List-Received-Date: Tue, 18 Sep 2018 00:26:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please send the patches as an ordered series. Thanks.


On Fri, Sep 14, 2018 at 04:47:06PM -0400, Jianzhong Xu wrote:
> swtools: common tools for xdc-based component build
> 
> Add SWTOOLS which is needed to build xdc-based processor libs such as
> DSPLIB, MATHLIB, etc from source.
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/includes/ti-paths.inc  |  2 ++
>  recipes-ti/swtools/swtools_git.bb | 44 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-ti/swtools/swtools_git.bb
> 
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> index a401264..f797a2d 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -39,6 +39,7 @@ export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
>  export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
>  export SYSBIOS_INSTALL_DIR_RECIPE    = "${installdir}/ti-sysbios-tree"
>  export SYSLINK_INSTALL_DIR_RECIPE    = "${installdir}/ti-syslink-tree"
> +export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
>  export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
>  export VICPLIB_INSTALL_DIR_RECIPE    = "${installdir}/ti-vicplib-tree"
>  export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
> @@ -97,6 +98,7 @@ export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
>  export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>  export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
>  export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> +export SWTOOLS_INSTALL_DIR         = "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
>  export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
>  export MATHLIB_C66_INSTALL_DIR     = "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
>  export IMGLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> new file mode 100644
> index 0000000..425a069
> --- /dev/null
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "TI Software Tools"
> +HOMEPAGE = "https://git.ti.com/ep-processor-libraries/swtools"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d"
> +
> +require ../includes/ti-paths.inc
> +
> +DEPENDS = "ti-cgt6x-native \
> +           ti-sysbios \
> +           ti-xdctools-native"
> +
> +PV = "5_0_8"
> +PR = "r0"
> +S = "${WORKDIR}/git"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "881267836907de650edadc56b8e57ab45428021d"
> +
> +export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
> +export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
> +export C66CODEGENTOOL  = "${CGTOOLS_INSTALL_DIR}"
> +
> +PATH_append = ":${XDC_INSTALL_DIR}"
> +
> +XDCPATH .= "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"
> +
> +export XDCPATH
> +
> +do_compile() {
> +	cd ${S}/ti/mas/swtools
> +	xdc
> +}
> +
> +do_install() {
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +	install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +	cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev = "arch staticdev"
> +ALLOW_EMPTY_${PN} = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

