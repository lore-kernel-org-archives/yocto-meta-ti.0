Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA822C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:44:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1050.1751057084853807626
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4985440CBF;
	Fri, 27 Jun 2025 20:44:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi3Aye0FCo5W; Fri, 27 Jun 2025 20:44:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21EF340C37;
	Fri, 27 Jun 2025 20:44:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D376716ADC9; Fri, 27 Jun 2025 16:44:41 -0400 (EDT)
Date: Fri, 27 Jun 2025 16:44:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] meta-beagle:
 beagle-bsp.inc: Fix versions in comments
Message-ID: <20250627204441.GM18383@denix.org>
References: <20250627192454.575458-1-afd@ti.com>
 <20250627192454.575458-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627192454.575458-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:44:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18724

On Fri, Jun 27, 2025 at 02:24:54PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Minor comment changes, fix versions listed for some items.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-beagle/conf/machine/include/beagle-bsp.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

