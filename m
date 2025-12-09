Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B501D3B9B0
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:49:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2017.1765324179530717214
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 15:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F3C9A40C50;
	Tue,  9 Dec 2025 23:49:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEUyYNJ_Wnfr; Tue,  9 Dec 2025 23:49:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC3E1406B5;
	Tue,  9 Dec 2025 23:49:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8B0A617062B; Tue,  9 Dec 2025 18:49:36 -0500 (EST)
Date: Tue, 9 Dec 2025 18:49:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/4] u-boot: Remove defaults for
 UBOOT_SUFFIX and SPL_BINARY
Message-ID: <20251209234936.GK11121@denix.org>
References: <20251202223210.3816583-1-afd@ti.com>
 <20251202223210.3816583-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202223210.3816583-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 23:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19339

On Tue, Dec 02, 2025 at 04:32:08PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> These were set to the defaults we would expect from OMAP class U-Boot,
> but as all board families set these including the OMAP class MACHINEs
> we can remove these defaults. This helps in the cases that we do not
> want to define one of these, such as SPL_BINARY in the case of OMAP-L138
> which does not use SPL.

Isn't OMAP-L138 finally deprecated as of this year? I guess it's a good time 
to remove the entire machine config as well...


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/conf/machine/omapl138-lcdk.conf  | 1 -
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 3 ---
>  2 files changed, 4 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> index 458caaff..c1e47926 100644
> --- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> +++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
> @@ -6,7 +6,6 @@ require conf/machine/include/omapl138.inc
>  
>  UBOOT_MACHINE = "omapl138_lcdk_config"
>  UBOOT_SUFFIX = "ais"
> -SPL_BINARY = ""
>  
>  UBOOT_ENTRYPOINT = "0xc0008000"
>  UBOOT_LOADADDRESS = "0xc0008000"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index de4a37b4..277ec7fe 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -5,9 +5,6 @@ do_compile:prepend () {
>      echo ${scm_version} > ${S}/.scmversion
>  }
>  
> -UBOOT_SUFFIX ?= "img"
> -SPL_BINARY ?= "MLO"
> -
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>  require u-boot-mergeconfig.inc
> -- 
> 2.39.2

