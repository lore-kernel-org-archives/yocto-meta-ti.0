Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D2BC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:52:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.52801.1681152740896095806
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 11:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1845A40C2E;
	Mon, 10 Apr 2023 18:52:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRLkqJFthL5H; Mon, 10 Apr 2023 18:52:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D60FD40301;
	Mon, 10 Apr 2023 18:52:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5DFDA1637FA; Mon, 10 Apr 2023 14:51:39 -0400 (EDT)
Date: Mon, 10 Apr 2023 14:51:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] patches: Add missing Upstream-Status
 to various patches
Message-ID: <20230410185139.GR9226@denix.org>
References: <20230410164134.14775-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410164134.14775-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 18:52:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16341

On Mon, Apr 10, 2023 at 11:41:34AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The check-layer command caught that we were missing the Upstream-Status
> on a few older patches, and I found a few new ones.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...0001-configs-Update-to-support-oe-core-fitImage-naming.patch | 2 ++
>  .../files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch     | 2 ++
>  ...ssemble_info-signature-changes-causes-compile-failures.patch | 2 ++
>  .../recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch       | 2 ++
>  .../wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch | 2 ++
>  .../0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch  | 2 ++
>  .../0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch      | 2 ++
>  7 files changed, 14 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> index 9a832312..31c7afc3 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
> @@ -7,6 +7,8 @@ In kirkstone and forward, the values in the fitImage have been
>  standardized to include both conf- and the vender subdir in the name of
>  the dtbs.  This patch updates u-boot to support that.
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>  ---
>   include/configs/am62x_evm.h       | 6 +++---
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> index 634b1588..063b4291 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
> @@ -24,6 +24,8 @@ Fix this by changing the entire enum definition to use BIT(x) in place
>  of (1<<x), which results in all values being seen as 'unsigned' and
>  fitting into an unsigned 32-bit type.
>  
> +Upstream-Status: Pending

This seems like a "Backport" instead...


>  Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
>  Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
>  Reported-by: Luis Machado <luis.machado@arm.com>
> diff --git a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> index 33dee03a..e1e04c34 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> +++ b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
> @@ -4,6 +4,8 @@ kernel we have to "adjust" the patch to match our files.
>  
>  [A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>  
>  
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
> index 71d5b2be..cb178ee6 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
> @@ -7,6 +7,8 @@ We build kernel outside of the source directory and the generated version.h
>  file ends up being in a separate directory from the rest of kernel headers.
>  Use another variable to point to the kernel build artifacts.
>  
> +Upstream-Status: Inappropriate [OE-specific]
> +
>  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>  
>  ---
> diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
> index a8db0770..bb05c6fe 100644
> --- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
> +++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>  Date: Fri, 10 Mar 2017 13:28:29 -0500
>  Subject: [PATCH] Add Makefile to install firmware files
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>  ---
>   Makefile | 9 +++++++++
> diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
> index c0719e34..cde01541 100644
> --- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
> +++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>  Date: Fri, 10 Nov 2017 17:02:39 -0500
>  Subject: [PATCH] print_stat.sh: replace /system/bin/sh with /bin/sh
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>  ---
>   testing/print_stat.sh | 2 +-
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
> index 1cc23b32..e52efa56 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
> @@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
>  Date: Sat, 15 Feb 2020 15:59:37 -0500
>  Subject: [PATCH] libbfd.h: suppress GCC9 -Wstringop-truncation
>  
> +Upstream-Status: Inappropriate [OE-specific]
> +
>  Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>  ---
>   gdbc6x/bfd/libbfd.h | 4 ++++
> -- 
> 2.17.1

