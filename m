Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7AECAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 19:19:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2428.1759432738417759920
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 12:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3AD8440C85;
	Thu,  2 Oct 2025 19:18:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RlF2qJ7WgkN; Thu,  2 Oct 2025 19:18:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 023D040C2E;
	Thu,  2 Oct 2025 19:18:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 51E9E1640DC; Thu,  2 Oct 2025 15:18:53 -0400 (EDT)
Date: Thu, 2 Oct 2025 15:18:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: bb@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Meta-TI <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH RFC] optee: use software PRNG for real-time
 kernel builds
Message-ID: <20251002191853.GE3125@denix.org>
References: <20251002-rtl-optee-hack-v1-1-efe08f733059@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-rtl-optee-hack-v1-1-efe08f733059@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 19:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19101

On Thu, Oct 02, 2025 at 07:28:27AM -0500, Bryan Brattlof via lists.yoctoproject.org wrote:
> The 4.7.0 release of OP-TEE is causing unacceptable latency issues with
> the real-time kernel. Migrate to software PRNG until they can be
> resolved in a later release.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Debugging a +30us latency regression has lead us to the hardware
> accelerated RNG drivers in OP-TEE. Falling back to software PRNG
> restores the context switch latency back to acceptable levels.
> 
> Because this only affects real-time kernels this is more an RFC
> until we can fix the firmware or find an alternative for the
> builds where latency is prioritized over random number generation

I don't see the change being specific to real-time kernel, which the commit 
message above imlies several times - is it intended?


> Happy Hacking
> ~Bryan
> ---
>  meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index 61a74a069886a24fbb518cf748be198d99a02cbe..5d00b8f6f8b045e660338c4a4d74001478a41aa0 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -6,12 +6,12 @@ EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  EXTRA_OEMAKE:append:k3 = " ${@ 'CFG_TZDRAM_START='+ d.getVar('OPTEE_K3_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
>  
> -EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62lxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62axx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:j722s = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
>  
>  do_compile:append:k3() {
>      cp ${B}/core/tee-pager_v2.bin ${B}/bl32.bin
> 
> ---
> base-commit: 69aaa6f1f8f608e22353d38ec6629ded743c4dec
> change-id: 20251002-rtl-optee-hack-515fab8e6a76
> 
> Best regards,
> -- 
> Bryan Brattlof <bb@ti.com>

