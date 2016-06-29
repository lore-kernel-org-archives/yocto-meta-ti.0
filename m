Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 661DFE008A4; Wed, 29 Jun 2016 06:56:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D2D8E0086E
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 06:56:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDtXFW012081
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:55:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDufkT025868
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:56:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:56:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDueed020780;
	Wed, 29 Jun 2016 08:56:41 -0500
Date: Wed, 29 Jun 2016 09:56:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Justin Sobota <jsobota@ti.com>
Message-ID: <20160629135640.GC24597@edge>
References: <1467134594-1359-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467134594-1359-1-git-send-email-jsobota@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master/krogoth][PATCH v2] common-csl-ip: Bump version common-csl-ip-rtos: Move to new makefile support provided in ti-pdk.bbclass
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
X-List-Received-Date: Wed, 29 Jun 2016 13:56:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Was this a v2 patch? What were the changes since v1? The subject line is still 
wrong.


On Tue, Jun 28, 2016 at 01:23:14PM -0400, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   28 +++++++++-----------
>  recipes-bsp/common-csl-ip/common-csl-ip.inc        |    6 ++---
>  2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 43ea2ed..877b230 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -1,5 +1,5 @@
>  require common-csl-ip.inc
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -7,20 +7,16 @@ inherit ti-pdk
>  
>  DEPENDS_remove = "${PN}"
>  
> -XDCARGS_ti33x = "am335x"
> -XDCARGS_ti43x = "am437x"
> -XDCARGS_omap-a15 = "am571x am572x"
> -XDCARGS_k2hk-evm = "k2h k2k"
> -XDCARGS_k2l-evm = "k2l"
> -XDCARGS_k2e-evm = "k2e"
> -XDCARGS_k2g-evm = "k2g"
> +# Build with make instead of XDC
> +XDCMAKE = "0"
>  
> -do_configure_append() {
> -    # Create empty makefile
> -    # If libraries are supported for this device, then this will be overwritten
> -    cat > ${BUILD_DIR}/makefile << __EOF__
> -# Nothing to do
> -all:
> +LIMSOCS_ti33x = "am335x"
> +LIMSOCS_ti43x = "am437x"
> +LIMSOCS_omap-a15 = "am571x am572x"
> +LIMSOCS_k2hk-evm = "k2h k2k"
> +LIMSOCS_k2l-evm = "k2l"
> +LIMSOCS_k2e-evm = "k2e"
> +LIMSOCS_k2g-evm = "k2g"
>  
> -__EOF__
> -}
> +export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index 70d963b..77dfd1b 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>  
>  COMPATIBLE_MACHINE = "keystone|dra7xx"
>  
> -PV = "3.3.0.2C"
> +PV = "3.3.0.3C"
>  INC_PR = "r0"
>  
>  CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
>  CSL_GIT_BRANCH = "master"
>  CSL_GIT_DESTSUFFIX = "git"
>  
> -# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02C
> -CSL_SRCREV = "dc8aac00e86cd434865d750666ac551f2e238263"
> +# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03C"
> +CSL_SRCREV = "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
>  
>  BRANCH="${CSL_GIT_BRANCH}"
>  SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
> -- 
> 1.7.10.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

