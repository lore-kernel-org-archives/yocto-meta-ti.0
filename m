Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CCCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:16:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.903.1761250589038365367
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A44240C8A;
	Thu, 23 Oct 2025 20:16:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sC1VxJiqi0_g; Thu, 23 Oct 2025 20:16:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D39DB407DA;
	Thu, 23 Oct 2025 20:16:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2057D16D150; Thu, 23 Oct 2025 16:16:25 -0400 (EDT)
Date: Thu, 23 Oct 2025 16:16:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] packagegroup-ti-core-initramfs:
 ensure TI_INITRAMFS_KERNEL_MODULES is set
Message-ID: <20251023201625.GA3125@denix.org>
References: <20251023181013.25365-1-denis@denix.org>
 <20251023181525.3536647-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023181525.3536647-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:16:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19158

Hey, Ryan,

Something is wrong with PRC...


On Thu, Oct 23, 2025 at 01:15:25PM -0500, PRC Automation via lists.yoctoproject.org wrote:
> meta-ti / na / 20251023181013.25365-1-denis
> 
> PRC Results: FAIL
> 
> =========================================================
>   check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
>     WARN: Commit message does not include file/recipe name: packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set. (COMMIT-MESSAGE-2)

Well, packagegroup-ti-core-initramfs is actually the name of the recipe.


> =========================================================
>   check-yocto-repo: FAIL
> =========================================================
> master
> =====================
> FAIL
>     WARN: You might need a " " as the first character for the :append. (APPEND-2)
>         meta-ti-bsp/conf/machine/include/am62axx.inc:15
>             TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
>     
>     WARN: You might need a " " as the first character for the :append. (APPEND-2)
>         meta-ti-bsp/conf/machine/include/am62axx.inc:16
>             TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"

This is not in my patch, but is a valid concern - need to correct it for 
am62axx.inc, while other machines appending to this variable already use a 
leading space...

>     
>     
>     Code Summary
>     ============
>     
>     APPEND-2
>     -------------------------------------------
>       :append simply takes the specified string and concatenates it
>       directly to the variable.  Most of the time we want there to spaces
>       between entries.  This check flags us to check if the missing space
>       is actually needed.
> 
> 
> 

