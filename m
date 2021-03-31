Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.885.1617229400940124295
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 15:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6658640BFF;
	Wed, 31 Mar 2021 22:23:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ARreoehsBcJ; Wed, 31 Mar 2021 22:23:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E15C40BA9;
	Wed, 31 Mar 2021 22:23:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 048F7174567; Wed, 31 Mar 2021 18:23:17 -0400 (EDT)
Date: Wed, 31 Mar 2021 18:23:17 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [dunfell/master][PATCH 2/7] conf/machine: am65xx: Document boot images as legacy mode
Message-ID: <20210331222317.GF23013@denix.org>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-3-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210331165133.3746-3-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 11:51:28AM -0500, Nishanth Menon wrote:
> We use the default IMAGE_BOOT_FILES configuration which matches up with
> legacy boot configuration. Document the same to allow folks to
> understand by just looking at the SoC include file.

May want to add one extra comment below.


> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  conf/machine/include/am65xx.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 684fea45b6d7..bb5911f7b041 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -23,6 +23,7 @@ KERNEL_DEVICETREE = " \
>  
>  BBMULTICONFIG += "k3r5-sr2"
>  
> +# Use default IMAGE_BOOT_FILES_LEGACY files

+# Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0

>  IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
>  do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
