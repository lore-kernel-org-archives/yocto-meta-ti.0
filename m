Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.795.1617236850971109284
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 17:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E9AF40C1C;
	Thu,  1 Apr 2021 00:27:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk0TrWsckuSm; Thu,  1 Apr 2021 00:27:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DD5E40429;
	Thu,  1 Apr 2021 00:27:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F2B53174567; Wed, 31 Mar 2021 20:27:27 -0400 (EDT)
Date: Wed, 31 Mar 2021 20:27:27 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH V2 5/8] conf/machine: j7200-evm: Switch to multi-certificate boot images
Message-ID: <20210401002727.GO23013@denix.org>
References: <20210331235736.30481-1-nm@ti.com>
 <20210331235736.30481-6-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331235736.30481-6-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 06:57:33PM -0500, Nishanth Menon wrote:
> Switch to using all of multi-certificate boot images. This allows us
> to create bootable images - in this case, we are missing tiboot3.bin
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes since V1:
> - Updated patch by dropping the tf-a dependency
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/13610
> 
>  conf/machine/j7200-evm.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> index 5a589f305c7c..5ee6c89c080e 100644
> --- a/conf/machine/j7200-evm.conf
> +++ b/conf/machine/j7200-evm.conf
> @@ -14,7 +14,8 @@ KERNEL_DEVICETREE = " \
>  
>  UBOOT_MACHINE = "j7200_evm_a72_config"
>  
> -IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> +# J7200 supports multi-certificate images, use the same
> +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
>  
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -- 
> 2.31.0
> 
