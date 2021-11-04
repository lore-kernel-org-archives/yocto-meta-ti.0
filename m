Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1278.1636048459126386152
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 10:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D1C0A40C6C;
	Thu,  4 Nov 2021 17:54:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLXf3P_bxIAq; Thu,  4 Nov 2021 17:54:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7EA540C06;
	Thu,  4 Nov 2021 17:54:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 26DC91746B1; Thu,  4 Nov 2021 13:54:16 -0400 (EDT)
Date: Thu, 4 Nov 2021 13:54:16 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] mpm-transport: Do not use append with += operator
Message-ID: <20211104175416.GW10132@denix.org>
References: <20211104172934.4088591-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211104172934.4088591-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 04, 2021 at 10:29:34AM -0700, Khem Raj wrote:
> this is undefined behaviour, mant times devs used them together to get
> the missing space at the beginning of string which append/prepend needs
> but thats not intended behaviour
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> index 38aefc24..3b80af34 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -21,8 +21,8 @@ PR = "r0"
>  
>  CC += "-fcommon"
>  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> -EXTRA_OEMAKE:append:k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> -EXTRA_OEMAKE:append:k2e += "HYPLNK_TRANSPORT=true"
> +EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> +EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
>  INSANE_SKIP:${PN} += "ldflags"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.33.1
> 
