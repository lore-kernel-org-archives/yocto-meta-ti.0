Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1191.1608083775210487905
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 17:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10C8540BF1;
	Wed, 16 Dec 2020 01:56:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dO59jZ7TaMVJ; Wed, 16 Dec 2020 01:56:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67CDC40A3C;
	Wed, 16 Dec 2020 01:56:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A969617450F; Tue, 15 Dec 2020 20:56:07 -0500 (EST)
Date: Tue, 15 Dec 2020 20:56:07 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Dan Murphy <dmurphy@ti.com>, Suman Anna <s-anna@ti.com>,
	meta-ti@lists.yoctoproject.org, Dave Gerlach <d-gerlach@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [dunfell/master PATCH V5] trusted-firmware-a: Update SRCREV for AM64X support
Message-ID: <20201216015607.GP24670@denix.org>
References: <20201216004908.31574-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201216004908.31574-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 06:49:08PM -0600, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update SRCREV to pick latest that includes AM64X support
> 
> commit 65dd16b4e ("ti: k3: Introduce lite device board support")
> adds support of AM64X platform in ti-atf branch.
> 
> This patch updates the SRCREV and also updates the BOARD to "lite" to
> build for the mentioned platform.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Suggested-by: Denys Dmytriyenko <denis@denix.org>
> Suggested-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
> Changes since V4:
> - Added Suggested-by of Dan and Denys for moving TFA_board definition to
>   am64xx.inc correctly.
> 
> Changes since V3:
> - moved TFA_BOARD definition to am64xx.inc
>  
> Changes since V2:
> - Update commit message adding more details on new platform
> 
> Changes since V1:
> - Update TFA_BOARD target name for AM64 as "lite"
> 
>  conf/machine/include/am64xx.inc                              | 1 +
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 79a403a9..de0ac634 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
>  
>  #IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"
>  
> +TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am65x"
>  OPTEEOUTPUTMACHINE = "k3"
>  
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 4942bf46..4852c560 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -2,7 +2,7 @@ PV_k3 = "2.4"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  BRANCH_k3 = "ti-atf"
>  SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
> +SRCREV_tfa_k3 = "65dd16b4ea5032752af62e94ca64cff41733a123"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> -- 
> 2.17.1
> 
