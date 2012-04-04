Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21050E0044A
	for <meta-ti@yoctoproject.org>; Wed,  4 Apr 2012 10:48:36 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1Y003HAUS4U8Q1@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 04 Apr 2012 12:48:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A8E6520120; Wed,
	04 Apr 2012 13:48:02 -0400 (EDT)
Date: Wed, 04 Apr 2012 13:48:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120404174802.GA30445@denix.org>
References: <1333561418-4142-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1333561418-4142-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH] u-boot 2011.10rc: fix loading from /boot by adding ext4 support
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
X-List-Received-Date: Wed, 04 Apr 2012 17:48:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 04, 2012 at 07:43:38PM +0200, Koen Kooi wrote:
> This patchset was pulled from u-boot patchwork and aren't final, but testing on beaglebone shows it to work.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-bsp/u-boot/u-boot_2011.10rc.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> index 0102d15..48bc618 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
>  DEFAULT_PREFERENCE_ti33x = "99"
>  
>  PV = "2011.09+git"
> -PR = "r26"
> +PR = "r27"
>  
>  # SPL build
>  UBOOT_BINARY = "u-boot.img"
> @@ -24,6 +24,11 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
>             file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch \
>             file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
>             file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
> +           file://2011.09git/0011-ext2load-increase-read-speed.patch \
> +           file://2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch \
> +           file://2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch \
> +           file://2011.09git/0014-ext4fs-ls-load-support.patch \
> +           file://2011.09git/0015-am335x-switch-to-ext4-mode.patch \

Where are the patches?

>            "
>  
>  SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

