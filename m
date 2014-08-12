Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E7E7E0078E; Mon, 11 Aug 2014 18:05:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8DEFE004F2
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 18:04:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7C14ob7010487
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 20:04:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7C14ooi002884
	for <meta-ti@yoctoproject.org>; Mon, 11 Aug 2014 20:04:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 20:04:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7C14nD3001209;
	Mon, 11 Aug 2014 20:04:49 -0500
Date: Mon, 11 Aug 2014 21:04:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140812010448.GD23523@edge>
References: <1407804439-24568-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1407804439-24568-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: Updated staging tree commit. Pull in am57x evm support
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
X-List-Received-Date: Tue, 12 Aug 2014 01:05:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Heh, I was doing the same update here... Was testing my changes when you sent 
it.

On Mon, Aug 11, 2014 at 07:47:19PM -0500, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Update the commit of the 3.14 staging tree.
> * Add support for accelerated cryptos on am335x/am437x.
> * Adds HDMI audio support for Beaglebone Black
> * Brings in am57x evm support.
> * This also updates the base kernel to 3.14.16.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.14.bb |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> index 6088bee..37e6259 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -29,7 +29,8 @@ KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335
>  KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
> +KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb am57xx-beagle-x15.dtb"
> +KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb"
>  KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
>  KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
>  KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
> @@ -43,8 +44,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-3.14.y"
>  
> -SRCREV = "780f0589876618911eb9cd7ad5a83db249ad1638"
> -PV = "3.14.15"
> +SRCREV = "8f69b4c2243fb3b0d85fd2a0b575d5170d53dbea"
> +PV = "3.14.16"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

