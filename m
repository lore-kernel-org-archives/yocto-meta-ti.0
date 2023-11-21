Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E407CC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 23:40:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14413.1700610005086446703
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 15:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 40C9240CA2;
	Tue, 21 Nov 2023 23:40:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaU8il-RIMYb; Tue, 21 Nov 2023 23:40:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E2F340C2C;
	Tue, 21 Nov 2023 23:40:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C080F163D6C; Tue, 21 Nov 2023 18:40:00 -0500 (EST)
Date: Tue, 21 Nov 2023 18:40:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: praneeth@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Nick Saulnier <nsaulnier@ti.com>
Subject: Re: [meta-ti] [kirkstone PATCH] pru-icss_git.bb: update to PSSP
 v6.3.0
Message-ID: <20231121234000.GE26739@denix.org>
References: <20231121232436.3701-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121232436.3701-1-praneeth@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Nov 2023 23:40:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17323

On Tue, Nov 21, 2023 at 05:24:36PM -0600, praneeth via lists.yoctoproject.org wrote:
> Upgrade to v6.3.0 version.
> 
> This release adds resources for using AM243x & AM64x PRU cores with cores
> running FreeRTOS:
>  * The RTOS Getting Started Labs
>  * Examples for using PRU GPIO and the broadside interface
>  * SORTE_G example (a custom networking interface)
> 
> Bug fixes:
>  * AM64x & AM65x header files, fix the names of extended sections to be in the
>    format of
>    ConstantsTableName_0x100
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index 6acce94b..4c76ccfd 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "3d0e311580d8967d0854ca789e9069e2810e9c1a"
> +SRCREV = "00a5efa5157feb84cb2e4bf50b481f7082acca82"
>  
> -PV = "6.2.0"
> -PR = "r1"
> +PV = "6.3.0"
> +PR = "r2"

Minor nitpick - when PV/version gets bumped, PR/revision gets reset back to 
r0. But better yet, just remove PR completely - it's no longer required to 
maintain it manually in a recipe...


>  require recipes-ti/includes/ti-paths.inc
>  
> -- 
> 2.17.1

