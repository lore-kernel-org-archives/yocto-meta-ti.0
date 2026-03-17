Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544A5FF6E90
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:28:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1531.1773786501080968254
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A66840C3A;
	Tue, 17 Mar 2026 22:28:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F56uDGZHjAIZ; Tue, 17 Mar 2026 22:28:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3858D40A20;
	Tue, 17 Mar 2026 22:28:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02ADE17A3B2; Tue, 17 Mar 2026 18:28:16 -0400 (EDT)
Date: Tue, 17 Mar 2026 18:28:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23
 compile fix from linux-stable
Message-ID: <20260317222815.GH11121@denix.org>
References: <20260317222406.1972700-1-reatmon@ti.com>
 <20260317222557.3882257-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317222557.3882257-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19750

On Tue, Mar 17, 2026 at 05:25:57PM -0500, PRC Automation via lists.yoctoproject.org wrote:
> meta-ti / na / 20260317222406.1972700-1-reatmon
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
> - Patch Series: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23 compile fix from linux-stable
> - Submitter: From: Ryan Eatmon <reatmon@ti.com>
> - Date: Date: Tue, 17 Mar 2026 17:24:06 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: db4527709c8b125dc20eee0bb76a93d0a5351a97
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master-wip
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: linux-bb.org_6.12: Backport C23 compile fix from linux-stable
> - Commit SHA: 9f6426914740d4aa5170bac2d1f7d5f0621135d9
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>   check-yocto-repo: PASS
> =========================================================
> master
> =====================
> PASS
> 
> 
> 
> =========================================================
>   yocto-check-layers: FAIL
> =========================================================
> master - FAIL
> =====================

> ERROR: Layer meta-ti-bsp is not compatible with the core layer which only 
> supports these series: wrynose (layer is compatible with whinlatter)

Bwha-ha-ha! This just got merged...

