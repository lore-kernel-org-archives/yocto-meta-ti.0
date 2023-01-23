Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E3CC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 21:26:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.55875.1674509207568916419
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 13:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80F8B40C13;
	Mon, 23 Jan 2023 21:26:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K71PYAu9ZjWG; Mon, 23 Jan 2023 21:26:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3D48A40952;
	Mon, 23 Jan 2023 21:26:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F167B163701; Mon, 23 Jan 2023 16:26:20 -0500 (EST)
Date: Mon, 23 Jan 2023 16:26:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] am62xx: Add support for AM62xx HS-SE
 evm
Message-ID: <20230123212620.GV22689@denix.org>
References: <20230123103242.563286-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123103242.563286-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 21:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15633

I think this should have been either a single patch or a patch series properly 
ordered with the other patch here:
https://patchwork.yoctoproject.org/project/ti/patch/20230123102459.562886-1-c-shilwant@ti.com/


On Mon, Jan 23, 2023 at 04:02:42PM +0530, Chirag Shilwant wrote:
> - Add ti-sci-firmware overrides.
> - Add support to sign ATF and OPTEE.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 3 ++-
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
>  recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 0fb3a832..7896c366 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -37,7 +37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
>  SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>  SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>  SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
> -SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
>  SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index a5eb9ff8..920cb737 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
>  	tfa_sign_k3hs
>  }
>  
> +do_compile_append_am62xx-evm() {
> +        tfa_sign_k3hs
> +}
> +
>  do_compile_append_am62xx-lp-evm() {
>          tfa_sign_k3hs
>  }
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 83eb9c6a..91abbcee 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -72,6 +72,10 @@ do_compile_append_am64xx-evm() {
>      optee_sign_k3hs
>  }
>  
> +do_compile_append_am62xx-evm() {
> +    optee_sign_k3hs
> +}
> +
>  do_compile_append_am62xx-lp-evm() {
>      optee_sign_k3hs
>  }
> -- 
> 2.34.1

