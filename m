Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78575E0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 12:48:11 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVU00LT4PRKB8R0@vms173017.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Wed, 07 Dec 2011 14:47:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0455B14AF5D; Wed,
	07 Dec 2011 15:47:43 -0500 (EST)
Date: Wed, 07 Dec 2011 15:47:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111207204743.GU20602@denix.org>
References: <1323264470-29505-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1323264470-29505-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp 3.1: disable MUSB DMA for	beaglebone
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
X-List-Received-Date: Wed, 07 Dec 2011 20:48:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Dec 07, 2011 at 02:27:50PM +0100, Koen Kooi wrote:
> This trades "not working" for "slightly less performance" for a lot of use cases
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Since we are making a similar change to disable MUSB DMA in Arago:

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |    7 ++-----
>  recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> index fcff591..a762e6f 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
> @@ -2507,13 +2507,10 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
>  CONFIG_USB_MUSB_TI81XX=y
>  # CONFIG_USB_MUSB_BLACKFIN is not set
>  # CONFIG_USB_MUSB_UX500 is not set
> -# CONFIG_MUSB_PIO_ONLY is not set
> -# CONFIG_USB_INVENTRA_DMA_HW is not set
> -# CONFIG_USB_TI_CPPI_DMA_HW is not set
> -CONFIG_USB_TI_CPPI41_DMA_HW=y
> +CONFIG_MUSB_PIO_ONLY=y
>  # CONFIG_USB_INVENTRA_DMA is not set
>  # CONFIG_USB_TI_CPPI_DMA is not set
> -CONFIG_USB_TI_CPPI41_DMA=y
> +# CONFIG_USB_TI_CPPI41_DMA is not set
>  # CONFIG_USB_TUSB_OMAP_DMA is not set
>  # CONFIG_USB_UX500_DMA is not set
>  
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
> index 4668749..029b5c3 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
>  
>  BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
>  SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
> -MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

