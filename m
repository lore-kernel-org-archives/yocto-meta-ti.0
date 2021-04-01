Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.659.1617235995924762798
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 17:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 525EA40C1C;
	Thu,  1 Apr 2021 00:13:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mt_7s1GpuNA; Thu,  1 Apr 2021 00:13:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 244B240429;
	Thu,  1 Apr 2021 00:13:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DB828174567; Wed, 31 Mar 2021 20:13:11 -0400 (EDT)
Date: Wed, 31 Mar 2021 20:13:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH V2 4/8] conf/machine: am64xx/j7200: Drop trusted-firmware deployment for tar wic
Message-ID: <20210401001311.GN23013@denix.org>
References: <20210331235736.30481-1-nm@ti.com>
 <20210331235736.30481-5-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331235736.30481-5-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 06:57:32PM -0500, Nishanth Menon wrote:
> wic and tar dependency on trusted firmware is wrong. It is u-boot build
> that depends on trusted firmware deployment and is correctly handled by
> u-boot recipe. No point in duplicating that dependency, so just clean it
> all up.
> 
> Reported-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> New patch
> - triggered from https://lists.yoctoproject.org/g/meta-ti/message/13610
> 
>  conf/machine/am64xx-evm.conf | 3 ---
>  conf/machine/am64xx-sk.conf  | 3 ---
>  conf/machine/j7200-evm.conf  | 3 ---
>  3 files changed, 9 deletions(-)
> 
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index eda310a32b14..788b15abab21 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -8,8 +8,5 @@ IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
>  
>  UBOOT_MACHINE = "am64x_evm_a53_defconfig"
>  
> -do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> -do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
> index 4cad8adcf1df..70c9c4f6ae7c 100644
> --- a/conf/machine/am64xx-sk.conf
> +++ b/conf/machine/am64xx-sk.conf
> @@ -8,9 +8,6 @@ IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
>  
>  UBOOT_MACHINE = "am64x_sk_a53_defconfig"
>  
> -do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> -do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  
> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> index dab6d8cb0cd8..5a589f305c7c 100644
> --- a/conf/machine/j7200-evm.conf
> +++ b/conf/machine/j7200-evm.conf
> @@ -16,8 +16,5 @@ UBOOT_MACHINE = "j7200_evm_a72_config"
>  
>  IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
>  
> -do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> -do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> -
>  do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
