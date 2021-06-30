Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1181.1625013061413811233
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 17:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BDD9D40C90;
	Wed, 30 Jun 2021 00:31:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWVTpMp7RTEb; Wed, 30 Jun 2021 00:31:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7DC3840AB7;
	Wed, 30 Jun 2021 00:30:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1D81317461C; Tue, 29 Jun 2021 20:30:55 -0400 (EDT)
Date: Tue, 29 Jun 2021 20:30:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: praneeth@ti.com, yogeshs@ti.com, denys@konsulko.com,
	Tom Rini <trini@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.13
Message-ID: <20210630003055.GD1528@denix.org>
References: <20210629233703.26088-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210629233703.26088-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2021 at 06:37:03PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> And lets work with the latest kernel and while at it bump the system up
> to latest ti-upstream-tools repo to get:
> * AM65x SR1.0 overlay support
> * EFI configuration to allow for the eventual support
> * Few more cleanups for new architectures that have popped in.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> index 6770adcae3f7..5d043da7fee1 100644
> --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
>  BRANCH = "master"
>  TOOLS_BRANCH = "master"
>  
> -# 5.12 Mainline version
> -SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
> -PV = "5.12+git${SRCPV}"
> +# 5.13 Mainline version
> +SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
> +PV = "5.13+git${SRCPV}"

BTW, the "+git${SRCPV}" part is to append the specific SRCREV or git SHA of 
the kernel you are building to the resulting package version. That might be 
useful in tracking the kernel binary on the target to a specific SHA, as well 
as with binary feeds.

But if you only use official releases, you might want to drop it, as you'd 
trust that SRCREV you specify for 5.13 always corresponds to the release SHA 
in Linus' tree :) Just makes the package name and version much shorter...


>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "b"
> @@ -36,7 +36,7 @@ SRC_URI += " \
>      file://defconfig \
>  "
>  
> -SRCREV_ti-upstream-tools = "d59b7471d99b806e3dc22342c8f42d5bb33f8cce"
> +SRCREV_ti-upstream-tools = "c9b8150cb00a5beb7b7f3e42d0d817aa9392fabd"
>  SRCREV_FORMAT = "linux"
>  
>  KERNEL_DEVICETREE = ""
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
