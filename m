Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.6207.1623112258557347919
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58F7140C4E;
	Tue,  8 Jun 2021 00:30:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFUz9bI-GSax; Tue,  8 Jun 2021 00:30:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 371D440BA9;
	Tue,  8 Jun 2021 00:30:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 934241745FB; Mon,  7 Jun 2021 20:30:54 -0400 (EDT)
Date: Mon, 7 Jun 2021 20:30:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Message-ID: <20210608003054.GR1528@denix.org>
References: <20210608000254.12042-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210608000254.12042-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Series looks good to me, including v2. Maybe better to specify sequence number 
[PATCH 01/04] to keep the order?

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


On Mon, Jun 07, 2021 at 07:02:51PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update to the latest commit of ti-u-boot-2021.01
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> index 437f6eba..4c3f0a47 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>  
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  BRANCH = "ti-u-boot-2021.01"
>  
> -SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
> +SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
