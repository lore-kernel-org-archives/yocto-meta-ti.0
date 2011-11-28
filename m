Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADA20E00305
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 27 Nov 2011 18:27:25 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVC00C7KMSZF8X0@vms173013.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Sun, 27 Nov 2011 20:27:12 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9454C14AF5D; Sun,
	27 Nov 2011 21:26:59 -0500 (EST)
Date: Sun, 27 Nov 2011 21:26:59 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111128022659.GA24182@denix.org>
References: <1322422715-10741-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1322422715-10741-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux 3.0: update to 3.0.11
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
X-List-Received-Date: Mon, 28 Nov 2011 02:27:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 27, 2011 at 08:38:35PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/machine/include/omap3.inc    |    2 +-
>  recipes-kernel/linux/linux_3.0.bb |    6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 1469f98..262e212 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r111"
> +MACHINE_KERNEL_PR = "r112"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
> index 93042b3..1e61628 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
>  
>  COMPATIBLE_MACHINE = "(beagleboard)"
>  
> -PV = "3.0.10"
> -# v3.0.10 tag
> -SRCREV_pn-${PN} = "c7e2ea59cdd74342d3614bee9fc42fa2fb5add7e"
> +PV = "3.0.11"
> +# v3.0.11 tag
> +SRCREV_pn-${PN} = "7a576d2dcd5807a7310032b380442eeba8c1c293"
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
>  MACHINE_KERNEL_PR_append = "a"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

