Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793EECCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 20:08:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22853.1761077286696969856
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 13:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1FC8C40C6C;
	Tue, 21 Oct 2025 20:08:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyCDfZ9vS0qH; Tue, 21 Oct 2025 20:08:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EAFC4407DA;
	Tue, 21 Oct 2025 20:08:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AE9B516B5EB; Tue, 21 Oct 2025 16:08:03 -0400 (EDT)
Date: Tue, 21 Oct 2025 16:08:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 ->
 2025.10
Message-ID: <20251021200803.GV3125@denix.org>
References: <20251021200247.52202-1-denis@denix.org>
 <20251021200514.2190304-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021200514.2190304-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Oct 2025 20:08:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19152

On Tue, Oct 21, 2025 at 03:05:14PM -0500, PRC Automation via lists.yoctoproject.org wrote:
> meta-ti / na / 20251021200247.52202-1-denis
> 
> PRC Results: FAIL
> 
> =========================================================
>   check-yocto-patches: FAIL
> =========================================================
> Patches
> ----------------------------------------
> FAIL - [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
>     ERROR: Invalid branch specifier: "patch". (META-3)

:facepalm:


>         patch:30
>             Subject: [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
>     
>     WARN: Commit message does not include file/recipe name: u-boot-bb.org: upgrade 2025.07 -> 2025.10. (COMMIT-MESSAGE-2)
>         patch
> WARN - [master][PATCH 2/2] linux-bb.org: update to 6.12.43
>     WARN: Commit message does not include file/recipe name: linux-bb.org: update to 6.12.43. (COMMIT-MESSAGE-2)
>         patch
> 
> 
> 

