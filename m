Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.21870.1607636728188086995
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 13:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 94D6440BEC;
	Thu, 10 Dec 2020 21:45:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00aI_m9r0KND; Thu, 10 Dec 2020 21:45:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6BB0A40BE2;
	Thu, 10 Dec 2020 21:45:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2DF79174503; Thu, 10 Dec 2020 16:45:25 -0500 (EST)
Date: Thu, 10 Dec 2020 16:45:25 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: dmurphy@ti.com
Cc: meta-ti@lists.yoctoproject.org, nm@ti.com
Subject: Re: [meta-ti] [dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201210214525.GG19155@denix.org>
References: <20201210213348.30149-1-nm@ti.com>
 <75965ce5-23dc-19c3-4e88-993a13150cf1@ti.com>
MIME-Version: 1.0
In-Reply-To: <75965ce5-23dc-19c3-4e88-993a13150cf1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 03:36:26PM -0600, Dan Murphy via lists.yoctoproject.org wrote:
> Forward
> 
> 
> 
> -------- Forwarded Message --------
> Subject: 	[dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
> Date: 	Thu, 10 Dec 2020 15:33:48 -0600
> From: 	Nishanth Menon <nm@ti.com>
> To: 	meta-ti@lists.yoctoproject.org
> CC: 	praneeth@ti.com, d-gerlach@ti.com, s-anna@ti.com,
> dmurphy@ti.com, Nishanth Menon <nm@ti.com>
> 
> 
> 
> Update to v2.4 tag merge from upstream to keep TF-A in sync.
> 
> For major changes in trusted-firmware-a, See:
> https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> 
> TI specific fixups include:
> - stub for shutdown (CPUs enter wfi)
> - uart console is now configurable.
> 
> While at it, update to include PV as 2.4
> 
> Suggested-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git
> a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 3c1862643086..08b2e04ff711 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,7 @@
> +PV = "2.4"

^^^ This should be specific to a platform or SoC family.
See how all other variables below are specific to K3 with _k3 override.
Hence: PV_k3 = "2.4"

The reason is to not affect other platforms when using meta-ti in a multi-BSP 
distros.


> BRANCH_k3 = "ti-atf"
> SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
> +SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
> COMPATIBLE_MACHINE_k3 = "k3"
> TFA_BUILD_TARGET_k3 = "all"
> TFA_INSTALL_TARGET_k3 = "bl31"
> 
> -- 
> 2.25.1.377.g2d2118b814c1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
