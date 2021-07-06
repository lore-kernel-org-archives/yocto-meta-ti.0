Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11936.1625602557391744639
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 13:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B185B40C56;
	Tue,  6 Jul 2021 20:15:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7ssuZzsr2NT; Tue,  6 Jul 2021 20:15:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67B7D40B13;
	Tue,  6 Jul 2021 20:15:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 22DF517461F; Tue,  6 Jul 2021 16:15:51 -0400 (EDT)
Date: Tue, 6 Jul 2021 16:15:51 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: praneeth@ti.com, yogeshs@ti.com, denys@konsulko.com,
	Tom Rini <trini@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH V2] recipes-bsp: u-boot-ti-mainline: Update to v2021.07 release
Message-ID: <20210706201551.GT1528@denix.org>
References: <20210706201324.30338-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210706201324.30338-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 03:13:24PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> Update u-boot recipe to be on the latest official upstream tag.
> 
> This introduces initial support for AM64x which works with v5.13
> kernel tag.
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes since v1:
>  * commit message update to state it is the latest official upstream tag
>    instead of using "bleeding" which is misleading.

Thanks!


>  * Picked up Reviewed-by from v1
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/topic/84023012#13896
> 
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index 0d3f33ef8ff6..2db9899609d0 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
>  PR = "r0"
>  
> -PV = "2021.04"
> +PV = "2021.07"
>  
>  # For the un-initiated:
>  # The actual URL you'd use with a git clone for example would be:
> @@ -15,4 +15,4 @@ PV = "2021.04"
>  # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
>  UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
>  UBOOT_GIT_PROTOCOL = "https"
> -SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
> +SRCREV = "840658b093976390e9537724f802281c9c8439f5"
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
