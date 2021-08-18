Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.59429.1629314381819352139
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Aug 2021 12:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 65B4F40BA8;
	Wed, 18 Aug 2021 19:19:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eDSXQEo638Q; Wed, 18 Aug 2021 19:19:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4526A400CF;
	Wed, 18 Aug 2021 19:19:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9D87B174665; Wed, 18 Aug 2021 15:19:38 -0400 (EDT)
Date: Wed, 18 Aug 2021 15:19:38 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][PATCH] machines: Adjust to use new location of tune files in oe-core
Message-ID: <20210818191938.GK1528@denix.org>
References: <20210818181748.3887480-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210818181748.3887480-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Right, this has been in my pipeline as well, but I got distracted before 
finishing it up...

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

This is only for master.


On Wed, Aug 18, 2021 at 11:17:48AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/machine/include/davinci.inc  | 2 +-
>  conf/machine/include/k3r5.inc     | 2 +-
>  conf/machine/include/keystone.inc | 2 +-
>  conf/machine/include/omap-a15.inc | 2 +-
>  conf/machine/include/omap3.inc    | 2 +-
>  conf/machine/include/omap4.inc    | 2 +-
>  conf/machine/include/ti33x.inc    | 2 +-
>  conf/machine/include/ti43x.inc    | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
> index d2681740..b8d207de 100644
> --- a/conf/machine/include/davinci.inc
> +++ b/conf/machine/include/davinci.inc
> @@ -1,4 +1,4 @@
> -require conf/machine/include/tune-arm926ejs.inc
> +require conf/machine/include/arm/armv5/tune-arm926ejs.inc
> 
>  # Increase this everytime you change something in the kernel
>  MACHINE_KERNEL_PR = "r54"
> diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
> index 93f08c04..3cc79061 100644
> --- a/conf/machine/include/k3r5.inc
> +++ b/conf/machine/include/k3r5.inc
> @@ -5,7 +5,7 @@ SOC_FAMILY:append = ":k3r5"
> 
>  # The closest of existing tunes for Cortex-R5F
>  DEFAULTTUNE = "armv7athf"
> -require conf/machine/include/tune-cortexa8.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> 
>  # R5 runs early bootloader and loads SYSFW
>  # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
> index 83dca19d..851328ac 100644
> --- a/conf/machine/include/keystone.inc
> +++ b/conf/machine/include/keystone.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":keystone"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa15.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa15.inc
> 
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
> index 553835c8..57295a85 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":omap-a15"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa15.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa15.inc
> 
>  # Increase this everytime you change something in the kernel
>  MACHINE_KERNEL_PR = "r7"
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index ab069b00..6e0d8dbc 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":omap3"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa8.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> 
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> 
> diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
> index b6f43744..b8bd9d37 100644
> --- a/conf/machine/include/omap4.inc
> +++ b/conf/machine/include/omap4.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":omap4"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa9.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa9.inc
> 
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 3da2aba5..896328d9 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":ti33x"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa8.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa8.inc
> 
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> 
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index eaed1812..0f28cc91 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -2,7 +2,7 @@ require conf/machine/include/ti-soc.inc
>  SOC_FAMILY:append = ":ti43x"
> 
>  DEFAULTTUNE ?= "armv7athf-neon"
> -require conf/machine/include/tune-cortexa9.inc
> +require conf/machine/include/arm/armv7a/tune-cortexa9.inc
> 
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> 
> --
> 2.33.0

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
