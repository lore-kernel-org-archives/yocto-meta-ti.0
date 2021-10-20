Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2048.1634757185794201046
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 12:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4571340C2B;
	Wed, 20 Oct 2021 19:13:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVPM_EBiNiBe; Wed, 20 Oct 2021 19:13:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2DEA140027;
	Wed, 20 Oct 2021 19:13:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EC8AC17469F; Wed, 20 Oct 2021 15:13:01 -0400 (EDT)
Date: Wed, 20 Oct 2021 15:13:01 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
Message-ID: <20211020191301.GX10132@denix.org>
References: <20211020045220.49228-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211020045220.49228-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 04:52:20AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
> This patch removes * to directly reference the TISCI firmware

But wouldn't it in turn break HS platforms? That * was there specifically due 
to HS having multiple .bin files that need to be packaged.


> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index ca56e1de..ef242476 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -28,7 +28,7 @@ SYSFW_SUFFIX ?= "unknown"
>  
>  SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
>  
> -SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}*.bin"
> +SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
>  
>  SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>  SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
