Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.910.1617230034471293096
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EACF640C3A;
	Wed, 31 Mar 2021 22:33:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CliyLoJ-ZU0V; Wed, 31 Mar 2021 22:33:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C80C740BA9;
	Wed, 31 Mar 2021 22:33:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 86E1A174567; Wed, 31 Mar 2021 18:33:51 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:33:51 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 5/7] conf/machine: am64xx: Consolidate image configuration to SoC include
Message-ID: <20210331223351.GI23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-6-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-6-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:31AM -0500, Nishanth Menon wrote:
> IMAGE type and dependencies can easily be centralized to SoC include
> file. This is necessary to make sure that we don't do the duplication
> and having multiple places to fix up.

I thought the plan was to soon merge am64xx-sk into am64xx-evm. But 
regardless, having these vars set for the entire SoC family is best.


> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/am64xx-evm.conf    | 8 --------
>  conf/machine/am64xx-sk.conf     | 8 --------
>  conf/machine/include/am64xx.inc | 6 ++++++
>  3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index eda310a32b14..c6ba2a8735f3 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -4,12 +4,4 @@
>  
>  require conf/machine/include/am64xx.inc
>  
> -IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> -
>  UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> -
> -do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> -do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> -
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
> index 4cad8adcf1df..445ff72339d9 100644
> --- a/conf/machine/am64xx-sk.conf
> +++ b/conf/machine/am64xx-sk.conf
> @@ -4,16 +4,8 @@
>  
>  require conf/machine/include/am64xx.inc
>  
> -IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> -
>  UBOOT_MACHINE = "am64x_sk_a53_defconfig"
>  
> -do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> -do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> -
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -
>  KERNEL_DEVICETREE = " \
>      ti/k3-am642-sk.dtb \
>  "
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 20441d8a757f..3173319df354 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -10,6 +10,12 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm.dtb \
>  "
>  
> +IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> +do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> +do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
>  TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am65x"
>  OPTEEOUTPUTMACHINE = "k3"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
