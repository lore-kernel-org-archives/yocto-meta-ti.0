Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82F5FE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 14:01:42 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M08008J77TH3U51@vms173003.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 01 Mar 2012 16:01:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 91C3D20168; Thu,
	01 Mar 2012 17:00:53 -0500 (EST)
Date: Thu, 01 Mar 2012 17:00:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120301220053.GC24667@denix.org>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
	<1330591716-30218-3-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1330591716-30218-3-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/3] linux 3.0: update to 3.0.23
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
X-List-Received-Date: Thu, 01 Mar 2012 22:01:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 01, 2012 at 09:48:35AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Thanks, pushed.

> ---
>  conf/machine/include/omap3.inc    |    2 +-
>  recipes-kernel/linux/linux_3.0.bb |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index b7d23af..8fc0903 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r116"
> +MACHINE_KERNEL_PR = "r117"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
> index fac6348..32ef963 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
>  
>  COMPATIBLE_MACHINE = "(beagleboard)"
>  
> -PV = "3.0.22"
> -# v3.0.22 tag
> -SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
> +PV = "3.0.23"
> +# v3.0.23 tag
> +SRCREV_pn-${PN} = "bf6a68d2a214e07f7c0d6538e00e17b826714160"
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "a"
>  
>  FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

