Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134C4C369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 01:49:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3138.1745372989594149634
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 18:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10CF040C37;
	Wed, 23 Apr 2025 01:49:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoPgQPeLnUcc; Wed, 23 Apr 2025 01:49:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9B8640A30;
	Wed, 23 Apr 2025 01:49:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 43CBC1668E6; Tue, 22 Apr 2025 21:49:45 -0400 (EDT)
Date: Tue, 22 Apr 2025 21:49:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: am62axx:
 Exclude tiboot3.bin for GP
Message-ID: <20250423014945.GC13634@denix.org>
References: <20250423013510.383906-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423013510.383906-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Apr 2025 01:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18494

On Wed, Apr 23, 2025 at 07:05:10AM +0530, Chirag Shilwant wrote:
> * The GP variant of AM62A SoC was only used internally
> for initial device bring-up and is not publicly available.
> Hence, drop it from IMAGE_BOOT_FILES to ensure
> tiboot3-am62ax-gp-evm.bin is not packaged inside vfat boot
> partition of wic image
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes in v2: Update commit message based on Denys feedback in v1
> 
> Link to v1 - https://lists.yoctoproject.org/g/meta-ti/message/18492
> 
>  meta-ti-bsp/conf/machine/include/am62axx.inc | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> index 98cea203..e5f827a9 100644
> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> @@ -10,9 +10,6 @@ TFA_K3_SYSTEM_SUSPEND = "1"
>  # Default tiboot3.bin on AM62A is for HS-FS
>  IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
>  
> -# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
> -IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
> -
>  # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
>  IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
>  
> -- 
> 2.34.1

