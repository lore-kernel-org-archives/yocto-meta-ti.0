Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1409.1614989840667102891
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 16:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E57CA40BEB;
	Sat,  6 Mar 2021 00:17:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6_YyJQmJi8B; Sat,  6 Mar 2021 00:17:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C741440A28;
	Sat,  6 Mar 2021 00:17:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 94F32174525; Fri,  5 Mar 2021 19:17:18 -0500 (EST)
Date: Fri, 5 Mar 2021 19:17:18 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: praneeth@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
Message-ID: <20210306001718.GY4892@denix.org>
References: <20210305232525.5790-1-praneeth@ti.com>
 <20210305232525.5790-2-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210305232525.5790-2-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 05:25:25PM -0600, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update 5.4 kernel to the latest commit SHA

Praneeth,

Is the stable automerger currently off? There haven't been stable merges for 
over a month. Is it due to the ongoing release?


> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index b6831c34..a9dac5af 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> -SRCREV = "f88a6c0071660458ed8985500ed5c4b5c8a7f372"
> +SRCREV = "6cd92cf89235d5ddb3c0104d02c0f3db48efdba4"
>  PV = "5.4.93+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 052c8971..37f387c3 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "d36781593d111abb7c56bbc7094ab6b5673d6a01"
> +SRCREV = "87c0425824b4169e4d697c4f6219243249a8c08b"
>  PV = "5.4.93+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -- 
> 2.17.1
