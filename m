Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.5102.1608071482820618165
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 14:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E91140BEA;
	Tue, 15 Dec 2020 22:31:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHkPFv7KuHYx; Tue, 15 Dec 2020 22:31:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D793840A0B;
	Tue, 15 Dec 2020 22:31:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8930617450F; Tue, 15 Dec 2020 17:31:16 -0500 (EST)
Date: Tue, 15 Dec 2020 17:31:16 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Dan Murphy <dmurphy@ti.com>, Suman Anna <s-anna@ti.com>,
	meta-ti@lists.yoctoproject.org, Dave Gerlach <d-gerlach@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [dunfell/master PATCH V4] trusted-firmware-a: Update SRCREV for AM64X support
Message-ID: <20201215223116.GO24670@denix.org>
References: <20201215212214.32304-1-praneeth@ti.com>
 <20201215222029.8816-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201215222029.8816-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 04:20:29PM -0600, praneeth@ti.com wrote:
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
> ---
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
> index 79a403a9..99d573e8 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
>  
>  #IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"
>  
> +TFA_BOARD_am64xx-evm = "lite"

Copy/paste error - doesn't need a machine override here:

TFA_BOARD = "lite"


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

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
