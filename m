Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 754D0E0049C
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:20:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r813Kh1R010484
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:20:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r813KhRF015016
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:20:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 31 Aug 2013 22:20:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r813KhsM008319	for
	<meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 22:20:43 -0500
Date: Sat, 31 Aug 2013 23:20:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130901032042.GB18322@edge>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-2-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1378005180-30928-2-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/5] ompa3-sgx-modules-x11: fix some build failures with latest versions
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
X-List-Received-Date: Sun, 01 Sep 2013 03:20:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 31, 2013 at 11:12:57PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * Do not hardcode kernel source location and name.
> * Fix some discrepancies between GFX SDK versions as related to DRM.

Also, I have couple more fixes pending for resolving build issues when 
building against recent kernels...


> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
> index d439d83..9134e61 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
> @@ -11,7 +11,7 @@ BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  DEFAULT_PREFERENCE = "-1"
> @@ -48,16 +48,16 @@ do_compile() {
>  	export PLAT_CC="${CC}"
>  	export PLAT_CPP="${CXX}"
>  	export PLAR_AR="${AR}"
> -	for kernelver in ${WORKDIR}/../../linux-ti-staging/* ; do
> +	for kernelver in ${WORKDIR}/../../${PREFERRED_PROVIDER_virtual/kernel}/* ; do
>  		cp -f $kernelver/git/drivers/gpu/drm/*.c ${S}/services4/3rdparty/linux_drm/
>  	done
>  	if [ $(echo -e "${KERNEL_VERSION}\n3.3" | sort --version-sort | head -1) = "3.3" ] ; then
>  		cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.3 \
> -			${S}/services4/3rdparty/linux_drm/Kbuild
> +			${S}/services4/3rdparty/linux_drm/Kbuild || true
>  	else 
>  		if [ $(echo -e "${KERNEL_VERSION}\n3.2" | sort --version-sort | head -1) = "3.2" ] ; then
>  			cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.2 \
> -				${S}/services4/3rdparty/linux_drm/Kbuild
> +				${S}/services4/3rdparty/linux_drm/Kbuild || true
>  		fi
>  	fi
>  	oe_runmake BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}
> -- 
> 1.8.3.2
> 

