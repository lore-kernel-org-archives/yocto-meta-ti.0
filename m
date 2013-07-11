Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42BC5E013D6
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 10:12:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6BHC3ja024113
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 12:12:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6BHC3XT017472
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 12:12:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 12:12:02 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6BHC2Oq023351;
	Thu, 11 Jul 2013 12:12:03 -0500
Date: Thu, 11 Jul 2013 13:12:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130711171202.GI18647@edge>
References: <1373397456-967-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1373397456-967-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [master & danny][PATCH 2/2 v2] u-boot: Add memory alignment fix for armv7 for am37x and am3517
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
X-List-Received-Date: Thu, 11 Jul 2013 17:12:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Quick question: you said danny and master - don't you need it in dylan as 
well?

On Tue, Jul 09, 2013 at 02:17:36PM -0500, Franklin S. Cooper Jr wrote:
> * On am335x a memory alignment issue was found when using the Linaro toolchain.
> * A similar patch was applied for am335x that fixed this well documented issue.
> * Add a similar fix to am37x and am3517 since this is a generic armv7 issue.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> 
> Version 2 changes:
> Place patch in a single generic directory
> 
>  recipes-bsp/u-boot/u-boot-am3517_2011.09.bb        |    6 ++-
>  recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb      |    3 ++
>  .../u-boot/0001-armv7-Unaligned-access-fix.patch   |   30 ++++++++++++++++++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch
> 
> diff --git a/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb b/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
> index 6321406..06b8cf1 100644
> --- a/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot-am3517_2011.09.bb
> @@ -6,9 +6,11 @@ COMPATIBLE_MACHINE = "omap3"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r0+gitr${SRCPV}"
> +PR = "r1+gitr${SRCPV}"
>  
> -SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
> +           file://0001-armv7-Unaligned-access-fix.patch \
> +"
>  
>  BRANCH = "AM335XPSP_04.06.00.08"
>  
> diff --git a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
> index c25cf1e..1cd96b6 100644
> --- a/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-am37x_2012.04.01.bb
> @@ -6,6 +6,8 @@ COMPATIBLE_MACHINE = "am37x-evm|beagleboard"
>  
>  BRANCH ?= "master"
>  
> +PR = "r1+gitr${SRCPV}"
> +
>  # v2012.04.01
>  SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
>  
> @@ -33,6 +35,7 @@ SRC_URI += "file://0001-omap3_beagle-add-usbethaddr-setting-to-enable-networ.pat
>              file://0002-omap3evm-Make-the-board-start-at-800MHz.patch \
>              file://0003-beagleboard-Make-xM-rev-C-go-to-800MHz.patch \
>              file://0001-ARM-omap3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch \
> +            file://0001-armv7-Unaligned-access-fix.patch \
>              "
>  
>  SPL_BINARY = "MLO"
> diff --git a/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch b/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch
> new file mode 100644
> index 0000000..35307ac
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/0001-armv7-Unaligned-access-fix.patch
> @@ -0,0 +1,30 @@
> +From 40f1e7db785f477a2aa145a3b47bd498c48ad52d Mon Sep 17 00:00:00 2001
> +From: Steve Kipisz <s-kipisz2@ti.com>
> +Date: Fri, 14 Jun 2013 05:16:52 -0500
> +Subject: [PATCH] armv7:Unaligned access fix
> +
> +This fixes an unaligned access data abort introduced when using gcc 4.7
> +or higher. The Linaro toolchain uses gcc 4.7.3. This is documented in u-boot
> +doc/README.arm-unaligned-accesses.
> +
> +Signed-off-by: Steve Kipisz <s-kipisz2@ti.com>
> +---
> + arch/arm/cpu/armv7/config.mk |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/cpu/armv7/config.mk b/arch/arm/cpu/armv7/config.mk
> +index 9c3e2f3..9736da8 100644
> +--- a/arch/arm/cpu/armv7/config.mk
> ++++ b/arch/arm/cpu/armv7/config.mk
> +@@ -20,7 +20,7 @@
> + # Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> + # MA 02111-1307 USA
> + #
> +-PLATFORM_RELFLAGS += -fno-common -ffixed-r8 -msoft-float
> ++PLATFORM_RELFLAGS += -fno-common -ffixed-r8 -msoft-float -mno-unaligned-access
> + 
> + # If armv7-a is not supported by GCC fall-back to armv5, which is
> + # supported by more tool-chains
> +-- 
> +1.7.9.5
> +
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

