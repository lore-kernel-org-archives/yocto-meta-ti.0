Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A69B1077611
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 20:00:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23345.1773864008647257487
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 13:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DDF9040CCC;
	Wed, 18 Mar 2026 20:00:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBQLjNE06npH; Wed, 18 Mar 2026 20:00:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D4DA40BD6;
	Wed, 18 Mar 2026 19:59:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 088C417A5D1; Wed, 18 Mar 2026 15:59:57 -0400 (EDT)
Date: Wed, 18 Mar 2026 15:59:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Shiva Tripathi <s-tripathi1@ti.com>
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com,
	jcormier@criticallink.com, praneeth@ti.com, kamlesh@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com, vigneshr@ti.com, afd@ti.com
Subject: Re: [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security
 layer for LUKS
Message-ID: <20260318195956.GO11121@denix.org>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
 <20260318145732.2115521-4-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318145732.2115521-4-s-tripathi1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 20:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19767

On Wed, Mar 18, 2026 at 08:27:32PM +0530, Shiva Tripathi wrote:
> Register dynamic-layers/security in layer.conf to conditionally
> build LUKS encryption support when meta-security layer is present.
> 
> Update ti-core-initramfs.inc to auto-enable initramfs generation
> when DISTRO_FEATURES contains 'luks'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  meta-ti-bsp/conf/layer.conf                            | 2 ++
>  meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index f78da573..ce2883ac 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -24,6 +24,8 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
>  
>  BBFILES_DYNAMIC += " \
>      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \

As I've previously mentioned, TPM components currently are provided by 
multiple layers:

1. meta-security/meta-tpm - a community set of layers, backed by YP, active
2. meta-secure-core/meta-tpm2 - WindRiver vendor set of layers, active
3. meta-measured - personal layer, no longer active for 4 years

Just to note that meta-arm already sets up dynamic-layer with own bbappend 
fixes for #2 meta-secure-core/meta-tpm2:
https://git.yoctoproject.org/meta-arm/tree/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools

But I'm fine for meta-ti to go with #1 meta-security/meta-tpm.

That said - have you tested your change? I'm afraid it won't work.

You are only setting up meta-security, which is a top-level layer, parsing 
only recipes*/*/*.bb and recipes*/*/*.bbappend - please note that TPM recipes 
reside in meta-tpm sub-layer called "tpm-layer":
https://git.yoctoproject.org/meta-security/tree/meta-tpm/conf/layer.conf


>  "
>  
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> index 9d3cc612..15c05e04 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -5,7 +5,7 @@
>  #   TI_CORE_INITRAMFS_ENABLED = "0"
>  #
>  #------------------------------------------------------------------------------
> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
>  
>  TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>  TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
> -- 
> 2.34.1

