Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.842.1617229449468925246
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE91140C3A;
	Wed, 31 Mar 2021 22:24:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFE3lkwqLI0f; Wed, 31 Mar 2021 22:24:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA02540BA9;
	Wed, 31 Mar 2021 22:24:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 942B8174567; Wed, 31 Mar 2021 18:24:06 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:24:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 3/7] conf/machine: j7: Document boot images as legacy mode
Message-ID: <20210331222406.GG23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-4-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-4-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:29AM -0500, Nishanth Menon wrote:
> We use the default IMAGE_BOOT_FILES configuration which matches up with
> legacy boot configuration. Document the same to allow folks to
> understand by just looking at the SoC include file.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/include/j7.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/conf/machine/include/j7.inc b/conf/machine/include/j7.inc
> index c187f299f470..d3eda1a828aa 100644
> --- a/conf/machine/include/j7.inc
> +++ b/conf/machine/include/j7.inc
> @@ -4,6 +4,8 @@ SOC_FAMILY_append = ":j7"
>  OPTEEMACHINE = "k3-j721e"
>  OPTEEOUTPUTMACHINE = "k3"
>  
> +# Use default IMAGE_BOOT_FILES_LEGACY files
> +
>  # Set the list of device targets for ti-pdk class recipes
>  TI_PDK_LIMIT_SOCS = "j721e j7200"
>  TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
