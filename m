Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1219.1639601647956142246
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 12:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A4DF240C4E
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 20:54:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GuC559CIMQpn for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 20:54:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 956D5406B7
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 20:54:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 47AAA174719; Wed, 15 Dec 2021 15:54:06 -0500 (EST)
Date: Wed, 15 Dec 2021 15:54:06 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Re: [master][PATCH] prusw-fw-am65x-sr2: update with the new override syntax
Message-ID: <20211215205406.GP18191@denix.org>
References: <1638401898-24444-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1638401898-24444-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping. I don't believe this one made it in yet.


On Wed, Dec 01, 2021 at 06:38:18PM -0500, Denys Dmytriyenko wrote:
> This got accidentally merged from Dunfell with the old syntax, fix it.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> index 8cb450a..2d0d3f9 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> @@ -29,6 +29,6 @@ do_install() {
>  	done
>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES:${PN} = "${base_libdir}/firmware"
>  
> -INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP:${PN} = "arch"
> -- 
> 2.7.4
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
