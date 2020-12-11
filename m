Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1709.1607644822238488291
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 16:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F36940BD6;
	Fri, 11 Dec 2020 00:00:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCnnnCg8AzJR; Fri, 11 Dec 2020 00:00:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5A4B640A03;
	Fri, 11 Dec 2020 00:00:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 93F90174507; Thu, 10 Dec 2020 19:00:15 -0500 (EST)
Date: Thu, 10 Dec 2020 19:00:15 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, d-gerlach@ti.com,
	s-anna@ti.com, dmurphy@ti.com
Subject: Re: [dunfell/master PATCH V4] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201211000015.GB24670@denix.org>
References: <20201210234957.9412-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201210234957.9412-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 05:49:57PM -0600, Nishanth Menon wrote:
> Update to v2.4 tag merge from upstream to keep TF-A in sync.
> 
> For major changes in trusted-firmware-a, See:
> https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> 
> TI specific fixups include:
>  - stub for shutdown (CPUs enter wfi)
>  - uart console is now configurable.
> 
> While at it, update to include PV_k3 as 2.4 and provide the license file
> checksum.
> 
> NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
> affect other platforms esp in a multi-BSP configuration.
> 
> Suggested-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>

Nice-to-have would be to explain the license checksum change and whether it 
affects the actual license. The checksum there is specifically to catch any 
changes to the license file and prevent re-licensing to pass unnoticed...


> ---
> Changes since v3:
> -  s/LIC_FILES_CHKSUM/LIC_FILES_CHKSUM_k3 coming right up..
> 
> Changes since v2:
>  - Update license file and checksum (Thanks Dan for catching my next
>    blunder)
> 
> Changes since v1 in v2:
>  - Update for PV_k3 (Thanks Denys) - I was'nt sure to pick a
>  "Reviewed-by" tag for your LGTM :).. so did'nt want to guess.
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 3c1862643086..c561fe2d7e76 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,8 @@
> +PV_k3 = "2.4"
> +LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  BRANCH_k3 = "ti-atf"
>  SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
> +SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> -- 
> 2.25.1.377.g2d2118b814c1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
