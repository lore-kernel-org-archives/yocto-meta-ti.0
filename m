Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.8784.1618500438817581992
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 08:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3ABEA40C81;
	Thu, 15 Apr 2021 15:27:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBFNe7P4XLVb; Thu, 15 Apr 2021 15:27:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0BB7B409E0;
	Thu, 15 Apr 2021 15:27:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C29A31745B4; Thu, 15 Apr 2021 11:27:14 -0400 (EDT)
Date: Thu, 15 Apr 2021 11:27:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, meta-ti@lists.yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [dunfell/master PATCH V2] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Message-ID: <20210415152714.GT15937@denix.org>
References: <20210415150810.18555-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210415150810.18555-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 10:08:10AM -0500, Nishanth Menon wrote:
> Update u-boot recipe to be on the bleeding upstream tag.
> 
> While at it, also update the u-boot source url to point to the new
> server as per [1].
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/a3bbd0b912f9afff745247fe9641961875322926
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Changes in v2:
> - Update the source URL to the latest url for upstream repos
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/message/13681
> 
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index ee0b17640807..8259579fc323 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
>  PR = "r0"
>  
> -PV = "2020.10"
> -UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
> +PV = "2021.04"
> +UBOOT_GIT_URI = "https://source.denx.de/u-boot/u-boot.git"

Won't work - bitbake chooses the correct fetcher by the protocol specifier. So 
in this case it will use wget and fail.


>  UBOOT_GIT_PROTOCOL = "http"

This is where the procol is specified for the git fetcher.


> -SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
> +SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
