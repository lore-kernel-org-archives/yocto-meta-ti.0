Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7ECC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:39:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.89373.1754059171590586532
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 07:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DEE8F40C82;
	Fri,  1 Aug 2025 14:39:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-OoYmySviyE; Fri,  1 Aug 2025 14:39:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4A8640A3D;
	Fri,  1 Aug 2025 14:39:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 61BE616D914; Fri,  1 Aug 2025 10:39:27 -0400 (EDT)
Date: Fri, 1 Aug 2025 10:39:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS
 default
Message-ID: <20250801143927.GT24899@denix.org>
References: <20250801133958.22623-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801133958.22623-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 14:39:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18875

On Fri, Aug 01, 2025 at 08:39:58AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> If you are trying to build a TI kernel and not building a TI machine

Based on the original report, it breaks during parsing of meta-ti for any 
non-TI machine, not even trying to build a kernel...


> then KERNEL_BASE_CLASS is not defined and you get a parse error.  Move
> the default setting out of ti-soc.inc and into ti-kernel.inc.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/ti-soc.inc               | 3 ---
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 4 ++--
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 3 ++-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 3 ++-
>  meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc            | 2 ++
>  5 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> index 3f11e31d..018e9bfb 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
> @@ -12,9 +12,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>  # TI platforms all use devicetrees with overlays
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>  
> -# All machines should start off pointing at the default base kernel class
> -KERNEL_BASE_CLASS = "kernel"
> -
>  # Tell the kernel class to install the DTBs in the same directory structure as
>  # the kernel
>  KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 51723fc0..92fb1e6c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -3,10 +3,10 @@ SUMMARY = "Mainline Linux kernel for TI devices"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
> -inherit ${KERNEL_BASE_CLASS}
> -
>  require recipes-kernel/linux/ti-kernel.inc
>  
> +inherit ${KERNEL_BASE_CLASS}
> +
>  DEPENDS += "gmp-native libmpc-native"
>  
>  KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> index 51e4b604..d36485fb 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
> @@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
> +require recipes-kernel/linux/ti-kernel.inc
> +
>  inherit ${KERNEL_BASE_CLASS}
>  
>  require recipes-kernel/linux/setup-defconfig.inc
> -require recipes-kernel/linux/ti-kernel.inc
>  include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>  
>  DEPENDS += "gmp-native libmpc-native"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index 321cdcbb..b6d882d8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
> +require recipes-kernel/linux/ti-kernel.inc
> +
>  inherit ${KERNEL_BASE_CLASS}
>  
>  require recipes-kernel/linux/setup-defconfig.inc
> -require recipes-kernel/linux/ti-kernel.inc
>  include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>  
>  DEPENDS += "gmp-native libmpc-native"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> index ef4ba4a1..32b6c95d 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -4,6 +4,8 @@ KERNEL_GIT_BRANCH ?= "branch=${BRANCH}"
>  
>  KERNEL_DEFCONFIG ?= "file://defconfig"
>  
> +KERNEL_BASE_CLASS ?= "kernel"
> +
>  KERNEL_REPRODUCIBILITY_PATCHES ?= ""
>  
>  SRC_URI = " \
> -- 
> 2.17.1

