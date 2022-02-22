Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7033.1645490512776931454
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 16:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E49B740C2E;
	Tue, 22 Feb 2022 00:41:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYpmhNtWlgzO; Tue, 22 Feb 2022 00:41:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A945640951;
	Tue, 22 Feb 2022 00:41:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6C6F4174767; Mon, 21 Feb 2022 19:41:45 -0500 (EST)
Date: Mon, 21 Feb 2022 19:41:45 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: a-m1@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	devarsht@ti.com, nikhil.nd@ti.com, nsekhar@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Fix naming of u-boot.img
Message-ID: <20220222004145.GJ26229@denix.org>
References: <20220221081331.11263-1-a-m1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220221081331.11263-1-a-m1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 01:43:31PM +0530, Aparna M via lists.yoctoproject.org wrote:
> All the HS platforms generate the u-boot binary as u-boot.img_HS
> but the bootloader expects the binary to be named as u-boot.img
> 
> Due to this mismatch, script cannot find the required image to
> be added in the WIC image. Fix this by overwriting the
> UBOOT_IMAGE variable via conf file.

Can you please clarify which script cannot find the image? Thanks!
Also, how does it work for am65xx HS, j721e HS, j7200 HS? Why only am64xx HS?


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>  conf/machine/am64xx-hs-evm.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> index 44e81463..781b8318 100644
> --- a/conf/machine/am64xx-hs-evm.conf
> +++ b/conf/machine/am64xx-hs-evm.conf
> @@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
>  SPL_BINARY = "tispl.bin_HS"
>  SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_IMAGE = "u-boot.img"
> +IMAGE_BOOT_FILES = "${UBOOT_IMAGE}"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.17.1
