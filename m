Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6672.1644290982137998827
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 19:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2804C40C2C;
	Tue,  8 Feb 2022 03:29:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKMxZdeDcHXU; Tue,  8 Feb 2022 03:29:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 00A9940B05;
	Tue,  8 Feb 2022 03:29:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B3AB8174743; Mon,  7 Feb 2022 22:29:37 -0500 (EST)
Date: Mon, 7 Feb 2022 22:29:37 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v3] ti-linux-fw: Bump to 08.02.00.001 release
Message-ID: <20220208032937.GY26229@denix.org>
References: <20220208032235.1915-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220208032235.1915-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 09:22:35PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Updated the ti-linux-fw version for 08.02.00.001
>   - Changed CORESDK_RTOS_VERSION version to 08.02.00.04
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Looks good.

Rviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v2: Added CORESDK_RTOS_VERSION change.
> v3: Add INC_PR change and changed TI_LINUX_FW_SRCREV to pick up a
> missing merge on that repository for this release.

Thank you! 


>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 014e89c8..5954cbd8 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -4,10 +4,10 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2022.01"
> -INC_PR = "r2"
> +INC_PR = "r3"
>  
>  # Firmware versions
> -CORESDK_RTOS_VERSION = "08.01.00.02"
> +CORESDK_RTOS_VERSION = "08.02.00.04"
>  SERDES_FW_VERSION = "3.3.0.2c"
>  NETCP_SA_FW_VERSION = "1.0.0"
>  NETCP_PA_FW_VERSION = "3.0.2.3"
> @@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
>  IMG_DEC_FW_VERSION = "1.0"
>  CNM_WAVE521_FW_VERSION = "1.0.00"
>  
> -TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
> +TI_LINUX_FW_SRCREV ?= "8810faf0c51a80554150e185122e43bee1553c37"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
>  
>  BRANCH ?= "ti-linux-firmware"
> -- 
> 2.17.1
> 
