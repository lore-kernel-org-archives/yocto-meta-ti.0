Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 871B6E00AF6; Fri, 28 Aug 2015 09:08:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42DFBE00AF6
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 09:08:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7SG8Y1N020604
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 11:08:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7SG8YTY021243
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 11:08:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 28 Aug 2015 11:08:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7SG8YmT010856;
	Fri, 28 Aug 2015 11:08:34 -0500
Date: Fri, 28 Aug 2015 12:08:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150828160819.GH26662@edge>
References: <1440731769-15759-1-git-send-email-h-gou@ti.com>
	<1440731769-15759-2-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1440731769-15759-2-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] omapdrm-pvr: add AM3 and AM4 which use null_window DRM
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
X-List-Received-Date: Fri, 28 Aug 2015 16:08:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 27, 2015 at 11:16:07PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     | 28 +++++++++++++++++-----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> index 665c3de..c99bd8b 100644
> --- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> +++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
> @@ -3,24 +3,40 @@ HOMEPAGE = "http://git.ti.com"
>  LICENSE = "MIT | GPLv2"
>  LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bfc03386bb4d8d9381b79d33898"
>  
> -inherit module
> +inherit module pkgconfig

Why do you need pkgconfig here?

The rest looks good, but we need to bump SRCREV for omap5/dra7 - see my other 
patch...


> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
>  
>  MACHINE_KERNEL_PR_append = "g"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -BRANCH = "dra7/k4.1"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BRANCH_omap-a15 = "dra7/k4.1"
> +BRANCH_ti33x = "am4/k4.1"
> +BRANCH_ti43x = "am4/k4.1"
>  
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "333ef031a98c0abdd49b6cfac61fbdd8c1d88518"
> +SRCREV_omap-a15 = "333ef031a98c0abdd49b6cfac61fbdd8c1d88518"
> +SRCREV_ti33x = "5b26357ef6243e65d431be380103a692bbdce309"
> +SRCREV_ti43x = "5b26357ef6243e65d431be380103a692bbdce309"
> +
> +PVR_NULLDRM_ti33x = "1"
> +PVR_NULLDRM_ti43x = "1"
> +PVR_NULLDRM_omap-a15 = "0"
> +
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
>  
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
> +DEVICE_SUB_DIR_omap-a15 = "omap5430"
> +DEVICE_SUB_DIR_ti33x = "omap335x"
> +DEVICE_SUB_DIR_ti43x = "omap437x"
>  
>  do_compile_prepend() {
> -    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap5430_linux
> +    cd ${S}/eurasia_km/eurasiacon/build/linux2/${DEVICE_SUB_DIR}_linux
>  }
>  
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_${DEVICE_SUB_DIR}_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

