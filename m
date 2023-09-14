Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4921FEEAA72
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:58:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4554.1694721475603092720
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 12:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E441240C3A;
	Thu, 14 Sep 2023 19:57:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgl5duDsKxrp; Thu, 14 Sep 2023 19:57:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E13340A28;
	Thu, 14 Sep 2023 19:57:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B935E163CAA; Thu, 14 Sep 2023 15:57:51 -0400 (EDT)
Date: Thu, 14 Sep 2023 15:57:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: anthony@ajmartinez.com
Cc: meta-ti@lists.yoctoproject.org, Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [meta-ti] [PATCH] linux-bb.org: update to 5.10.168 for armv7a
 targets
Message-ID: <20230914195751.GP3359@denix.org>
References: <20230913164423.7867-1-anthony@ajmartinez.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913164423.7867-1-anthony@ajmartinez.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 19:58:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16979

On Wed, Sep 13, 2023 at 04:45:05PM +0000, Anthony Martinez via lists.yoctoproject.org wrote:
> Updates SRCREV, PV, and BRANCH for armv7a targets and fixes
> failure to mount /boot when using poky with systemd. The
> kernel selected supports VFAT without initramfs as noted
> here - https://lists.yoctoproject.org/g/meta-ti/message/16913
> 
> Removes defconfig patch setting LZMA, as the new kernel
> already defaults to LZ4.
> 
> Tested by running `bitbake core-image-base` with this patchset,
> and then booting a pair of Beaglebone Black devices from the
> resulting image. Prior to the change, systemd boots to a
> maintenance mode having failed to mount /boot. After the change,
> the system boots normally and /boot is mounted.
> 
> Suggested-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Anthony J. Martinez <anthony@ajmartinez.com>

Thanks!

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...h-default-kernel-compression-to-LZMA.patch | 29 -------------------
>  .../recipes-kernel/linux/linux-bb.org_git.bb  | 10 +++----
>  2 files changed, 4 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> deleted file mode 100644
> index 54dc8c91..00000000
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@konsulko.com>
> -Date: Fri, 7 Apr 2023 01:44:56 +0000
> -Subject: [PATCH] defconfig: switch default kernel compression to LZMA
> -
> -LZO compression and lzop tool haven't been maintained for long time and have
> -been removed in recent versions of OE-Core, even though Debian may still use
> -them. Switch to LZMA compression that is used by default in TI kernel config.
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -
> -Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ----
> - arch/arm/configs/bb.org_defconfig | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb.org_defconfig
> -index 6bf0fb860683..7c035735172d 100644
> ---- a/arch/arm/configs/bb.org_defconfig
> -+++ b/arch/arm/configs/bb.org_defconfig
> -@@ -1,5 +1,5 @@
> - # CONFIG_LOCALVERSION_AUTO is not set
> --CONFIG_KERNEL_LZO=y
> -+CONFIG_KERNEL_LZMA=y
> - CONFIG_SYSVIPC=y
> - CONFIG_POSIX_MQUEUE=y
> - CONFIG_NO_HZ_IDLE=y
> ---
> -2.25.1
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index e134fb84..f4c1775d 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -16,10 +16,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>  
>  S = "${WORKDIR}/git"
>  
> -# 5.10.162 version for 32-bit
> -SRCREV:armv7a = "982fde4eb381f98ec8be946e8d33dd0c9f9416ab"
> -PV:armv7a = "5.10.162+git${SRCPV}"
> -BRANCH:armv7a = "v5.10.162-ti-r59"
> +# 5.10.168 version for 32-bit
> +SRCREV:armv7a = "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
> +PV:armv7a = "5.10.168+git${SRCPV}"
> +BRANCH:armv7a = "v5.10.168-ti-r70"
>  
>  # 5.10.162 version for 64-bit
>  SRCREV:aarch64 = "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
> @@ -30,5 +30,3 @@ SRC_URI = " \
>      git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
>      file://defconfig \
>  "
> -
> -SRC_URI:append:armv7a = " file://0001-defconfig-switch-default-kernel-compression-to-LZMA.patch"
> -- 
> 2.30.2

