Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1591.1619638787780924698
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 12:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 848FB38C0892
	for <meta-ti@yoctoproject.org>; Wed, 28 Apr 2021 19:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A72A540C34;
	Wed, 28 Apr 2021 19:39:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSMXgznmYN3Y; Wed, 28 Apr 2021 19:39:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 71BB140951;
	Wed, 28 Apr 2021 19:39:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 313661745CE; Wed, 28 Apr 2021 15:39:42 -0400 (EDT)
Date: Wed, 28 Apr 2021 15:39:42 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, yogeshs@ti.com, meta-ti@yoctoproject.org,
	lokeshvutla@ti.com
Subject: Re: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Message-ID: <20210428193942.GU15937@denix.org>
References: <20210428011137.2501-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210428011137.2501-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 27, 2021 at 08:11:37PM -0500, Nishanth Menon wrote:
> Update u-boot recipe to be on the bleeding upstream tag.
> 
> While at it, also update the u-boot source url to point to the new
> server as per [1].
> 
> While it may be redundant, lets document the usage of URI and
> PROTOCOL for those, who (cough), may get tripped otherwise.
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/a3bbd0b912f9afff745247fe9641961875322926
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes since V2:
> - Things actually builds :)
> -  Moaar documentation - could be redundant, but better help folks
>    along.. a few bytes dont really matter
> 
> V2: https://lists.yoctoproject.org/g/meta-ti/message/13683?p=,,,20,0,0,0::Created,,mainline,20,2,0,82119050
> V1: https://lists.yoctoproject.org/g/meta-ti/message/13682?p=,,,20,0,0,0::Created,,mainline,20,2,0,82118299
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index ee0b17640807..0d3f33ef8ff6 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,7 +4,15 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
>  PR = "r0"
>  
> -PV = "2020.10"
> -UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
> -UBOOT_GIT_PROTOCOL = "http"
> -SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
> +PV = "2021.04"
> +
> +# For the un-initiated:
> +# The actual URL you'd use with a git clone for example would be:
> +# https://source.denx.de/u-boot/u-boot.git/
> +# However, in the context of OE, we have to explicitly split things up:
> +# a) we want it to use git fetcher - hence git:// prefix in GIT_URI (if we
> +#  used https here, we'd endup attempting wget instead of git)
> +# b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
> +UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
> +UBOOT_GIT_PROTOCOL = "https"
> +SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
