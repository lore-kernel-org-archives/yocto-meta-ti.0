Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3819.1635198481144488250
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7EE2640C47;
	Mon, 25 Oct 2021 21:48:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NllE1IJ3h5nq; Mon, 25 Oct 2021 21:48:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6482C40AE9;
	Mon, 25 Oct 2021 21:47:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B1B1B1746AD; Mon, 25 Oct 2021 17:47:57 -0400 (EDT)
Date: Mon, 25 Oct 2021 17:47:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 0/4] Core-sdk 08.01.00.001 release
Message-ID: <20211025214757.GI10132@denix.org>
References: <20211025213140.17826-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211025213140.17826-1-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 09:31:36PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Updated the version for core-sdk 08.01.00.001 release

For the entire series:

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

> 
> Yogesh Siraswar (4):
>   ti-linux-fw: Bump to 08.01.00.001 release
>   u-boot-ti-staging: Bump to 08.01.00.001 release
>   linux-ti-staging-rt: Bump to 08.01.00.001 release
>   linux-ti-staging: Bump to 08.01.00.001 release
> 
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 10 +++++-----
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  |  4 ++--
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb |  2 +-
>  recipes-kernel/linux/linux-ti-staging_5.10.bb    |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
