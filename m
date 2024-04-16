Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6988C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 18:53:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29265.1713293576516338308
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 11:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 896E240C3A;
	Tue, 16 Apr 2024 18:52:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9Kxr3k0vcOk; Tue, 16 Apr 2024 18:52:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 010F940A2F;
	Tue, 16 Apr 2024 18:52:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BEE62163F19; Tue, 16 Apr 2024 14:52:50 -0400 (EDT)
Date: Tue, 16 Apr 2024 14:52:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: lcpdbld@list.ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger:
 cicd.master.202403080100
Message-ID: <20240416185250.GL28791@denix.org>
References: <1709895300-2024-1-git-send-email-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1709895300-2024-1-git-send-email-lcpdbld@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Apr 2024 18:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17570

Ryan,

Apparently, CI/CD scripting for master re-introduced SRCPV back, after it was 
removed...


On Fri, Mar 08, 2024 at 02:55:02AM -0800, LCPD Automation Script via lists.yoctoproject.org wrote:
> Updated the value(s) for:
>   ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
>   u-boot-ti-staging_2023.04: SRCREV
>   u-boot-ti-staging_2024.04: SRCREV
>   k3conf: SRCREV
>   linux-ti-staging-rt_6.1: PV,SRCREV
>   linux-ti-staging-rt_6.6: PV,SRCREV
>   linux-ti-staging_6.1: PV,SRCREV
>   linux-ti-staging_6.6: PV,SRCREV
> 
> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>

<snip>


> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> index b7426af..a4aa2cd 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
> @@ -8,8 +8,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
>  
>  BRANCH = "ti-rt-linux-6.1.y"
>  
> -SRCREV = "bdebf4319d95b46edd39be72d937d1e0086865fe"
> +SRCREV = "31dc6b6f9309afec8555a584ff1ea5e3f18a30e9"
>  
>  include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
>  
> -PV = "6.1.69+git"
> +PV = "6.1.80+git${SRCPV}"

^^^


> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
> index e4beba8..e3aedce 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
> @@ -10,8 +10,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.6:"
>  
>  BRANCH = "ti-rt-linux-6.6.y"
>  
> -SRCREV = "357d8fe8189aa5c61b4e311ef810f7e0a2c49be9"
> +SRCREV = "7a7ad8a0b720d8c9d7bf85b897814cf8500a4c50"
>  
>  include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
>  
> -PV = "6.6.14+git"
> +PV = "6.6.20+git${SRCPV}"

^^^


> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index ee7da38..e168c92 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH ?= "ti-linux-6.1.y"
>  
> -SRCREV ?= "77aa27cbdca359bf0735b36ada464ec65b520943"
> -PV = "6.1.69+git"
> +SRCREV ?= "a6174d6c4ff531039c677079321888a9a3f9951c"
> +PV = "6.1.80+git${SRCPV}"

^^^


>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR:append = "b"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> index e932645..34acd9c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
> @@ -25,8 +25,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH ?= "ti-linux-6.6.y"
>  
> -SRCREV ?= "cb84067eaf83e8287003bf17c3aed93ecd946a05"
> -PV = "6.6.14+git"
> +SRCREV ?= "249ce2af44d246bda52703d3066e21f56c0ddb12"
> +PV = "6.6.20+git${SRCPV}"

^^^


>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR:append = "b"
> -- 
> 1.8.3.1

