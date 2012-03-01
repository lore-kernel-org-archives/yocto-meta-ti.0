Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 151AEE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 14:01:18 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M08003O37T580E1@vms173019.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 01 Mar 2012 16:00:45 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A10E420168; Thu,
	01 Mar 2012 17:00:41 -0500 (EST)
Date: Thu, 01 Mar 2012 17:00:41 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120301220041.GB24667@denix.org>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
	<1330591716-30218-2-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1330591716-30218-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] linux 3.0: enable 'option' serial for beagleboard
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
X-List-Received-Date: Thu, 01 Mar 2012 22:01:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 01, 2012 at 09:48:34AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Thanks, pushed.

> ---
>  .../linux/linux-3.0/beagleboard/defconfig          |    5 +++--
>  recipes-kernel/linux/linux_3.0.bb                  |    2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> index 5f2a7eb..5be7772 100644
> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> @@ -1,6 +1,6 @@
>  #
>  # Automatically generated make config: don't edit
> -# Linux/arm 3.0.14 Kernel Configuration
> +# Linux/arm 3.0.22 Kernel Configuration
>  #
>  CONFIG_ARM=y
>  CONFIG_HAVE_PWM=y
> @@ -2785,7 +2785,8 @@ CONFIG_USB_SERIAL_SIERRAWIRELESS=m
>  # CONFIG_USB_SERIAL_TI is not set
>  CONFIG_USB_SERIAL_CYBERJACK=m
>  # CONFIG_USB_SERIAL_XIRCOM is not set
> -# CONFIG_USB_SERIAL_OPTION is not set
> +CONFIG_USB_SERIAL_WWAN=m
> +CONFIG_USB_SERIAL_OPTION=m
>  CONFIG_USB_SERIAL_OMNINET=m
>  CONFIG_USB_SERIAL_OPTICON=m
>  CONFIG_USB_SERIAL_VIVOPAY_SERIAL=m
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
> index 65084fb..fac6348 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -10,7 +10,7 @@ PV = "3.0.22"
>  SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
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

