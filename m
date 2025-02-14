Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41841C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 23:14:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.34408.1739574881820121009
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 15:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DEB0B40DE2;
	Fri, 14 Feb 2025 23:14:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqaIPUUYNAPY; Fri, 14 Feb 2025 23:14:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AAF7C40DE0;
	Fri, 14 Feb 2025 23:14:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD8A416423E; Fri, 14 Feb 2025 18:14:36 -0500 (EST)
Date: Fri, 14 Feb 2025 18:14:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH] wic: sdimage-2part-efi: Add
 variable for adding bootloader options
Message-ID: <20250214231436.GV21608@denix.org>
References: <20250213165338.11294-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213165338.11294-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Feb 2025 23:14:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18319

On Thu, Feb 13, 2025 at 10:53:38AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> We have a need for some platforms to add kernel options to the bootloader
> during wic creation time.  Create a new variable and add that to the
> sdimage-2part-efi.wks.in file so that a machine can override it if
> needed.
> 
> Add an override for am64 to point the kernel at console=ttyS2.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/am64xx.inc | 2 ++
>  meta-ti-bsp/conf/machine/include/k3.inc     | 2 ++
>  meta-ti-bsp/wic/sdimage-2part-efi.wks.in    | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 49e996c8..56b56afe 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -34,3 +34,5 @@ TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am64x"
>  
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
> +
> +TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"

BTW, no whitespace around the assignment operators will be giving a QA warning 
some time soon... OE-Core has been cleaned up recently:
https://git.openembedded.org/openembedded-core/commit/?id=30ea609d3357fb3de911f2f6a5e6856c151b976a


> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index dd3cbeca..faf820a0 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -55,6 +55,8 @@ MACHINE_FEATURES += "efi"
>  
>  WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
>  
> +TI_WKS_BOOTLOADER_APPEND ?= ""
> +
>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  
>  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> index ca042be1..ae38daa7 100644
> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> @@ -3,6 +3,6 @@
>  # supports EFI.  Boot files are located in the first vfat partition with extra
>  # reserved space.  We cannot use a GPT here.
>  
> -bootloader --timeout=3 --append="rootfstype=ext4"
> +bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
>  part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>  part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> -- 
> 2.17.1

