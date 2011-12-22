Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 615F2E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 09:49:37 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWM00HXF9I5XQEB@vms173001.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 22 Dec 2011 11:49:23 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A2AD720334; Thu,
	22 Dec 2011 12:49:17 -0500 (EST)
Date: Thu, 22 Dec 2011 12:49:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111222174917.GC17606@denix.org>
References: <1324542026-29756-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324542026-29756-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux 3.0: update to 3.0.14
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
X-List-Received-Date: Thu, 22 Dec 2011 17:49:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 22, 2011 at 09:20:26AM +0100, Koen Kooi wrote:
> Also make oprofile a module to workaround an oprofile bug highlighted in 3.0.13

Can you point me to more details about the oprofile bug? Thanks.


> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  conf/machine/include/omap3.inc                     |    2 +-
>  .../linux/linux-3.0/beagleboard/defconfig          |    4 ++--
>  recipes-kernel/linux/linux_3.0.bb                  |    9 ++++-----
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 4530ae1..fc252ba 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r113"
> +MACHINE_KERNEL_PR = "r114"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> index 0b150c5..5f2a7eb 100644
> --- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> +++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
> @@ -1,6 +1,6 @@
>  #
>  # Automatically generated make config: don't edit
> -# Linux/arm 3.0.7 Kernel Configuration
> +# Linux/arm 3.0.14 Kernel Configuration
>  #
>  CONFIG_ARM=y
>  CONFIG_HAVE_PWM=y
> @@ -149,7 +149,7 @@ CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
>  # CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
> -CONFIG_OPROFILE=y
> +CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
>  # CONFIG_KPROBES is not set
>  CONFIG_HAVE_KPROBES=y
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
> index 38b90e9..d72826b 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
>  
>  COMPATIBLE_MACHINE = "(beagleboard)"
>  
> -PV = "3.0.12"
> -# v3.0.12 tag
> -SRCREV_pn-${PN} = "ac6766564c0305ca020fe747dfd7dbdf0881369d"
> +PV = "3.0.14"
> +# v3.0.14 tag
> +SRCREV_pn-${PN} = "6636552f1dd0d2e2be2f87605ea2cd3aa4d2e5b6"
>  
>  # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "a"
>  
>  FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
>  
> @@ -194,7 +194,6 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
>              file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch \
>              file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.patch \
>              file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.patch \
> -            file://beagle/0011-Revert-mfd-Fix-twl4030-dependencies-for-audio-codec.patch \
>              file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
>              file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
>              \
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

