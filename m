Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24.1617898987012668630
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 09:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AF3E40C3A;
	Thu,  8 Apr 2021 16:23:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oADh1EFWEBM6; Thu,  8 Apr 2021 16:23:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC9C240BE8;
	Thu,  8 Apr 2021 16:23:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 368861745A7; Thu,  8 Apr 2021 12:23:02 -0400 (EDT)
Date: Thu, 8 Apr 2021 12:23:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: sinthu.raja@mistralsolutions.com
Cc: meta-ti@lists.yoctoproject.org, Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: Re: [meta-ti] [dunfell/master PATCH 2/3] AM64x Unification: Update u-boot conf
Message-ID: <20210408162302.GF15937@denix.org>
References: <20210408071608.80232-1-sinthu.raja@mistral.in>
MIME-Version: 1.0
In-Reply-To: <20210408071608.80232-1-sinthu.raja@mistral.in>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 12:46:08PM +0530, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <x0257345@ti.com>
> 
>  Updtae u-boot recipe to build for both SK and EVM compilation and

Update ^^


> installation through one machine name
>  Update AM64x config file to add both defconfig files for SK and EVM
> 
> Signed-off-by: Sinthu Raja <x0257345@ti.com>
> ---
>  conf/machine/am64xx-evm-k3r5.conf | 11 ++++++++---
>  conf/machine/am64xx-evm.conf      |  6 +++++-
>  conf/machine/include/am64xx.inc   |  1 +
>  recipes-bsp/u-boot/u-boot-ti.inc  | 21 +++++++++++++++++++--
>  4 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
> index dfeaeb570..50a941aef 100644
> --- a/conf/machine/am64xx-evm-k3r5.conf
> +++ b/conf/machine/am64xx-evm-k3r5.conf
> @@ -8,7 +8,12 @@ SYSFW_SOC = "am64x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
>  
> -UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> +UBOOT_CONFIG ??= "evm sk"
> +UBOOT_CONFIG[evm] = "am64x_evm_a53_defconfig"
> +UBOOT_CONFIG[sk] = "am64x_sk_a53_defconfig"

So, you are replacing r5 defconfig with a53? That's definitely wrong!
You might want to reverse the order in UBOOT_CONFIG, as the default symlink 
points to the last one.


> +UBOOT_MACHINE = ""
> +
>  UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> -UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "tiboot3-am64x-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "tiboot3-am64x.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index eda310a32..53837ad19 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -6,7 +6,11 @@ require conf/machine/include/am64xx.inc
>  
>  IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
>  
> -UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> +UBOOT_MACHINE = ""
> +
> +UBOOT_CONFIG ??= "evm sk"
> +UBOOT_CONFIG[evm] = "am64x_evm_a53_defconfig"
> +UBOOT_CONFIG[sk] = "am64x_sk_a53_defconfig"
>  
>  do_image_wic[depends] += "trusted-firmware-a:do_deploy"
>  do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 20441d8a7..9bc9ddae2 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -8,6 +8,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm.dtb \
> +    ti/k3-am642-sk.dtb \
>  "
>  
>  TFA_BOARD = "lite"
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index ca0414c06..edfe27a18 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -398,8 +398,25 @@ do_deploy_append_j7200-evm-k3r5 () {
>  }
>  
>  do_deploy_append_am64xx-evm-k3r5 () {
> -	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> -	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +	if [ -n "${UBOOT_CONFIG}" ]
> +	then
> +		for config in ${UBOOT_MACHINE}; do
> +			i=$(expr $i + 1);
> +			for type in ${UBOOT_CONFIG}; do
> +				j=$(expr $j + 1);
> +				if [ $j -eq $i ]
> +				then
> +					mv ${DEPLOYDIR}/${type}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl-${type}.bin || true
> +					mv ${DEPLOYDIR}/${type}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl-${type}.bin || true
> +				fi
> +			done
> +			unset j
> +		done
> +		unset i
> +	else
> +		mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> +		mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +	fi
>  }
>  
>  TOOLCHAIN = "gcc"
> -- 
> 2.17.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
