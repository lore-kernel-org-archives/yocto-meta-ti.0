Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FAFCCF9F8
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 00:39:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1762216789535875921
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 16:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF64440C82;
	Tue,  4 Nov 2025 00:39:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7usXqgjFgGD; Tue,  4 Nov 2025 00:39:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A2079406B9;
	Tue,  4 Nov 2025 00:39:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ACB2416FC51; Mon,  3 Nov 2025 19:39:45 -0500 (EST)
Date: Mon, 3 Nov 2025 19:39:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] packagegroup-ti-core-initramfs: move
 cifs-utils to dynamic-layers
Message-ID: <20251104003945.GN3125@denix.org>
References: <20251103184043.3394912-1-denis@denix.org>
 <20251103184515.1898559-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103184515.1898559-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 00:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19222

On Mon, Nov 03, 2025 at 12:45:15PM -0600, PRC Automation via lists.yoctoproject.org wrote:
> meta-ti / na / 20251103184043.3394912-1-denis
> 
> PRC Results: FAIL
> 
> =========================================================
>   check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
> 
> 
> 
> =========================================================
>   apply-yocto-patch: PASS
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [master][PATCH] packagegroup-ti-core-initramfs: move cifs-utils to dynamic-layers
> - Submitter: From: Denys Dmytriyenko <denis@denix.org>
> From: Denys Dmytriyenko <denys@konsulko.com>
> - Date: Date: Mon,  3 Nov 2025 13:40:42 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: c6e9666c9ec7cc522ca4807ebfd67b9a9e48a022
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master-wip
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
> - Commit SHA: dec3f236ac32ab2ea80e6d0640fc38ad26dbe5da
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>   check-yocto-repo: FAIL
> =========================================================
> master
> =====================
> FAIL
>     WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
>         meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
>     
>     
>     Code Summary
>     ============
>     
>     GUARD-1
>     -------------------------------------------
>       To maintain Yocto Compatibility, we need to add a guard around the
>       .bbappend files for upstream recipes.  In the event that a layer
>       is simply included in a build, it should not make changes to the
>       recipe in a way that breaks the upstream recipe from doing what it
>       sets out to do.  In order for our .bbappends to actually make
>       changes, we need to gate them behind building something either the
>       Arago distribution or building a TI machine.

In this case the .bbappend is in the optional dynamic-layers and is against 
the non-upstream recipe that originates in meta-ti-bsp itself, so no YP Compat 
violations.

