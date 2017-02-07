Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9C81E00924; Tue,  7 Feb 2017 09:37:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47AC1E006C6
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2017 09:37:11 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v17HbBt8030871
	for <meta-ti@yoctoproject.org>; Tue, 7 Feb 2017 11:37:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17HbBZI006511
	for <meta-ti@yoctoproject.org>; Tue, 7 Feb 2017 11:37:11 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 11:37:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17HbBIO024141;
	Tue, 7 Feb 2017 11:37:11 -0600
Date: Tue, 7 Feb 2017 12:37:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20170207173709.GP25590@edge>
References: <1486477433-191487-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486477433-191487-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for-morty 1/1] ti-sgx-ddk-km: move to K4.9, enable parallel builds
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
X-List-Received-Date: Tue, 07 Feb 2017 17:37:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

Could you please rebase on top of this:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=16f6a2713d0e6ef4dcdbb7769b89979bdf751c11

-- 
Denys


On Tue, Feb 07, 2017 at 07:53:53PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> index ca5916e..984cab9 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> @@ -7,7 +7,7 @@ inherit module
>  
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
> -MACHINE_KERNEL_PR_append = "k"
> +MACHINE_KERNEL_PR_append = "l"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -20,19 +20,17 @@ RPROVIDES_${PN} = "omapdrm-pvr"
>  RREPLACES_${PN} = "omapdrm-pvr"
>  RCONFLICTS_${PN} = "omapdrm-pvr"
>  
> -BRANCH = "ti-img-sgx/${PV}/k4.4"
> +BRANCH = "ti-img-sgx/${PV}/k4.9"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "8d5305b03dce13f3a9a89328c69c762dcd3109a4"
> +SRCREV = "0086977380d3320d70a3abc78b95fa0641427073"
>  
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
>  TARGET_PRODUCT_ti43x = "ti437x"
>  
> -PARALLEL_MAKE = ""
> -
>  EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
>  
>  do_compile_prepend() {
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

