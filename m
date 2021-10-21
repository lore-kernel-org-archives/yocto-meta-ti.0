Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3853.1634849542083684746
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 13:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4C6540BEB;
	Thu, 21 Oct 2021 20:52:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYpBxhqoi0D4; Thu, 21 Oct 2021 20:52:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CBCAD40BA8;
	Thu, 21 Oct 2021 20:52:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 925261746A7; Thu, 21 Oct 2021 16:52:18 -0400 (EDT)
Date: Thu, 21 Oct 2021 16:52:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-sci-fw_git: Fix issue with using gp*.bin for TISCI firmware
Message-ID: <20211021205218.GD10132@denix.org>
References: <20211021070441.37565-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211021070441.37565-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2021 at 07:04:41AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> With ti-sysfs also hosting *gp-cert.bin for am64x hs-fs breaks gp.
> This patch removes * to directly reference the TISCI firmware
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
> 
> Change from v1:
> Previous version caused issue with the HS platforms.
> Added conditional statement for HS device.
> 
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index ca56e1de..a1a7446b 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -27,8 +27,9 @@ SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_SUFFIX ?= "unknown"
>  
>  SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
> +SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"

This kind of makes sense, but I'm afraid it could negatively affect 
SYSFW_HS_PATH and SYSFW_HS_INNER_CERT_PATH having * and passed to the 
Makefile:

EXTRA_OEMAKE_HS = " \
    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
"


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
