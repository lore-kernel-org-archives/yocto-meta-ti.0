Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1B0EE00AF8; Tue, 25 Apr 2017 16:19:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02163E00867
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 16:19:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PNJHkZ016771
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 18:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493162357;
	bh=v4/ZM0znVziVuaskGIXjQxuTvCac8HdHrjBgyBf2ZcI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ses96PSoW7gJe3AiIZzHBwacU0vbKmKRV2sqGCnjOtXw4Aud5sJWjHTeIOE8dPmTx
	CcJsibl7DXKxpSVziumP6TAGKcehaJsVQTA2RhEzW5k41lLG93FgC++8E08SMkMqEg
	bT8/MNWQ+bHOgdMxdIblkgCPDXTB2C1KqvD0/hAo=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PNJHEH017298
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 18:19:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 18:19:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PNJHq2011855;
	Tue, 25 Apr 2017 18:19:17 -0500
Date: Tue, 25 Apr 2017 19:19:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170425231916.GT31608@edge>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493119564-36769-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Tue, 25 Apr 2017 23:19:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

This looks much better!

I would have said there's no reason to split it into a recipe and .inc 
anymore, but we'll probably also need a -nativesdk recipe, so keeping .inc for 
now.

There are couple cosmetic nitpicks - there's no space between SUMMARY and = 
sign; and BINFILE variable is defined twice. I'll fix those on merge though.

-- 
Denys


On Tue, Apr 25, 2017 at 04:56:02PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  8 ++++++
>  recipes-ti/devtools/ti-cgt-arm.inc              | 35 +++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>  create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
> new file mode 100644
> index 0000000..c4fc7f0
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
> @@ -0,0 +1,8 @@
> +include ti-cgt-arm.inc
> +
> +LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
> +
> +BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
> +BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
> +
> +PR_append = "r2"
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> new file mode 100644
> index 0000000..8cc1ca4
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -0,0 +1,35 @@
> +SUMMARY= "TI ARM Code Generation Tools"
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
> +
> +inherit native
> +require recipes-ti/includes/ti-unpack.inc
> +require recipes-ti/includes/ti-staging.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +S = "${WORKDIR}/ti-cgt-arm-${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
> +
> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +do_install() {
> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +}
> +
> +SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
> +SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
> +
> +BINFILE_NAME = "cgt_arm_installer"
> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +
> +FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +INSANE_SKIP_${PN} += "arch staticdev"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

