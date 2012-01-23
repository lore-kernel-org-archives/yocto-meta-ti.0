Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E363E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 11:58:31 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LY9003ULOTC2W62@vms173011.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 23 Jan 2012 13:58:25 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 10DC620333; Mon,
	23 Jan 2012 14:58:24 -0500 (EST)
Date: Mon, 23 Jan 2012 14:58:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120123195824.GJ17838@denix.org>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<1327328309-15956-7-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1327328309-15956-7-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 6/7] omap3-sgx-modules: add 4.05.00.03
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2012 19:58:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 23, 2012 at 03:18:28PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ....16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} |   12 +++++-------
>  1 files changed, 5 insertions(+), 7 deletions(-)
>  copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_1.6.16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} (81%)
> 
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> similarity index 81%
> copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index f37299d..cb3aba7 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
>  TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
>  require ../../recipes-ti/includes/ti-eula-unpack.inc
>  
> -SGXPV = "4_03_00_02"
> -IMGPV = "1.6.16.3977"
> +SGXPV = "4_05_00_03"
>  BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
>  
>  inherit module
> @@ -15,12 +14,9 @@ MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
> -           file://Compile-fixes-for-38-kernel.patch \
> -           file://kernel-30.patch \
>            "
> -SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
> -SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
> -
> +SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
> +SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
>  S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
>  
>  PVRBUILD = "release"
> @@ -30,9 +26,11 @@ PACKAGE_STRIP = "no"
>  
>  TI_PLATFORM_omap3 = "omap3630"
>  TI_PLATFORM_ti816x = "ti81xx"
> +TI_PLATFORM_ti33x = "ti335x"


This seems slightly outdated - can you please merge the latest changes from 
Arago from few weeks ago to enable ti814x as well? Thanks.

-- 
Denys


>  MODULESLOCATION_omap3 = "dc_omap3430_linux"
>  MODULESLOCATION_ti816x = "dc_ti81xx_linux"
> +MODULESLOCATION_ti33x = "dc_ti335x_linux"
>  
>  MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

