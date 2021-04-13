Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3122.1618345704753725184
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 13:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DF5E40C53;
	Tue, 13 Apr 2021 20:28:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVVv7pbXXBWr; Tue, 13 Apr 2021 20:28:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74440409E0;
	Tue, 13 Apr 2021 20:28:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DC8601745B1; Tue, 13 Apr 2021 16:28:20 -0400 (EDT)
Date: Tue, 13 Apr 2021 16:28:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH 0/4] Initial migration to 2021LTS
Message-ID: <20210413202820.GN15937@denix.org>
References: <20210413044546.12409-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210413044546.12409-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 12, 2021 at 11:45:42PM -0500, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Initial Migration to 2021LTS.
> This series adds initial baseline update to 2021LTS i.e. 5.10 kernel
> and 2021.01 u-boot.

Thanks, looks good.

> Praneeth Bajjuri (4):
>   Revert "linux-ti-staging, u-boot-ti-staging: lower default preference"
>   ti-uboot-staging: Update to the latest ti-u-boot-2021.01
>   Revert "linux-ti-staging-5.10: With the kernel being AUTOREV'd remove
>     the minor version"
>   linux-ti-staging: Update 5.10 kernel to 5.10.21
> 
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 9 +++------
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
>  recipes-kernel/linux/linux-ti-staging_5.10.bb    | 6 ++----
>  3 files changed, 7 insertions(+), 12 deletions(-)
> 
> -- 
> 2.17.1
> 
