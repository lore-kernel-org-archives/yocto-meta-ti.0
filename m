Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FEA9E006B0
	for <meta-ti@yoctoproject.org>; Fri, 13 Jan 2012 10:09:22 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LXR00JTU12UT404@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 13 Jan 2012 12:09:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9E5AA20370; Fri,
	13 Jan 2012 13:08:54 -0500 (EST)
Date: Fri, 13 Jan 2012 13:08:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20120113180854.GA31077@denix.org>
References: <1326399305-32405-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1326399305-32405-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V3] u-boot_2011.09, u-boot_2011.12: Always use gnu ld for LD
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
X-List-Received-Date: Fri, 13 Jan 2012 18:09:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 12, 2012 at 12:15:05PM -0800, Khem Raj wrote:
> u-boot wants GNU ld and cant link with gold
> so when default linker is gold we make sure
> that it still uses good old GNU ld

I guess as long as GNU ld is always present alongside gold and binutils 
installs it under ld.bfd, the patch should work.


> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../u-boot/0001-config-Always-use-GNU-ld.patch     |   43 ++++++++++++++++++++
>  recipes-bsp/u-boot/u-boot_2011.09.bb               |    3 +-
>  recipes-bsp/u-boot/u-boot_2011.12.bb               |    3 +-
>  3 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> 
> diff --git a/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> new file mode 100644
> index 0000000..2564d1d
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
> @@ -0,0 +1,43 @@
> +From dff01fc9346e6f4e3386536df309d2e78f03f3ee Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 21 Dec 2011 08:53:02 -0800
> +Subject: [PATCH] config: Always use GNU ld
> +
> +This patch makes sure that we always use the GNU ld. u-boot uses certain
> +construct e.g. OVERLAY which are not implemented in gold therefore it
> +always needs GNU ld for linking. It works well if default linker in
> +toolchain is GNU ld but in some cases we can have gold to be the
> +default linker and also ship GNU ld but not as default in such cases
> +its called $(PREFIX)ld.bfd, with this patch we make sure that if
> +$(PREFIX)ld.bfd exists than we use that for our ld. This way it
> +does not matter what the default ld is.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + config.mk |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/config.mk b/config.mk
> +index ddaa477..59b3e71 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -126,11 +126,13 @@ cc-option = $(strip $(if $(findstring $1,$(CC_OPTIONS)),$1,\
> + 		$(if $(call cc-option-sys,$1),$1,$2)))
> + endif
> + 
> ++exists_bfd_ld = $(shell if $(CROSS_COMPILE)ld.bfd -v >& /dev/null; \
> ++		then echo "$(1)"; else echo "$(2)"; fi; )
> + #
> + # Include the make variables (CC, etc...)
> + #
> + AS	= $(CROSS_COMPILE)as
> +-LD	= $(CROSS_COMPILE)ld
> ++LD	= $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd", "$(CROSS_COMPILE)ld")
> + CC	= $(CROSS_COMPILE)gcc
> + CPP	= $(CC) -E
> + AR	= $(CROSS_COMPILE)ar
> +-- 
> +1.7.5.4
> +
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
> index 74c8518..4a9d3cb 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
> @@ -1,6 +1,6 @@
>  require u-boot.inc
>  
> -PR = "r5"
> +PR = "r6"
>  
>  # SPL build
>  UBOOT_BINARY = "u-boot.img"
> @@ -32,6 +32,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
>             file://2011.09/0019-BeagleBoard-config-Really-switch-to-ttyO2.patch \
>             file://2011.09/0020-beagleboard-add-support-for-TCT-Beacon-board.patch \
>             file://2011.09/0021-beagleboard-add-support-for-scanning-loop-through-ex.patch \
> +           file://0001-config-Always-use-GNU-ld.patch \
>             file://fw_env.config \
>            "
>  
> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
> index d776c38..7554bad 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
> @@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
>  UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
>  
>  PV = "2011.12"
> -PR = "r1"
> +PR = "r2"
>  
>  # No patches for other machines yet
>  COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
> @@ -18,6 +18,7 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
>             file://2011.12/0004-omap4-common-mount-root-RO.patch \
>             file://2011.12/0005-omap4-common-use-ext4-by-default.patch \
>             file://2011.12/U-Boot-OMAP-MMC-Add-delay-before-waiting-for-status.patch \
> +           file://0001-config-Always-use-GNU-ld.patch \
>            "
>  
>  # v2011.12 tag
> -- 
> 1.7.5.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

