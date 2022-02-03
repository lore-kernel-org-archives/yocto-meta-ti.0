Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1754.1643912835336747452
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 10:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 064D140C83;
	Thu,  3 Feb 2022 18:27:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVtlNjOBHfCq; Thu,  3 Feb 2022 18:27:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D01D940951;
	Thu,  3 Feb 2022 18:27:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 109AE174737; Thu,  3 Feb 2022 13:27:10 -0500 (EST)
Date: Thu, 3 Feb 2022 13:27:09 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] cnm-wave-fw: lock the compatiable machine to j721s2
Message-ID: <20220203182709.GK26229@denix.org>
References: <20220203030842.20992-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220203030842.20992-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch is incorrect - see below.


On Wed, Feb 02, 2022 at 09:08:42PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> The orignal recipe listed the compatible platforms to
> all of j7, but at this time it is limited to j721s2.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
>  recipes-kernel/linux/kernel-rdepends.inc   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 3dd0f4f4..0f09dbb6 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "j7"
> +COMPATIBLE_MACHINE = "j721s2"

There were no j721s2 SoC family defined, only j721s2-evm and j721s2-evm-k3r5 
machines.


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 2a6302af..adcf967a 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -44,4 +44,4 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>  
>  # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cnm-wave-fw"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2 = " cnm-wave-fw"

Same here.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
