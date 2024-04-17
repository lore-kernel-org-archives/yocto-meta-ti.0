Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02880C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:55:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22381.1713380103713288079
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1942240C7B;
	Wed, 17 Apr 2024 18:55:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-a173-FymHO; Wed, 17 Apr 2024 18:55:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC63840A0B;
	Wed, 17 Apr 2024 18:55:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F2746163F21; Wed, 17 Apr 2024 14:54:59 -0400 (EDT)
Date: Wed, 17 Apr 2024 14:54:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2 2/3] TODO: Add TODO list
Message-ID: <20240417185459.GQ28791@denix.org>
References: <20240417184031.17308-1-reatmon@ti.com>
 <20240417184031.17308-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417184031.17308-3-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17588

On Wed, Apr 17, 2024 at 01:40:30PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> In an attempt to try and better support non-LTS branches, we need to do
> a better job at not removing temporary patches too soon from master.
> This TODO file should allow us to better schedule the time when the
> patches can be safely removed.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  TODO | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 TODO
> 
> diff --git a/TODO b/TODO
> new file mode 100644
> index 00000000..e1aeba53
> --- /dev/null
> +++ b/TODO
> @@ -0,0 +1,9 @@
> +
> +This TODO list allows us to track certain actions and lists of patches that
> +need to be removed at a future date.
> +
> +
> +May 2024 - nanbield EOL
> +-----------------------
> +  - Remove python3-yamllint: Temporarily carry this new recipe
> +
> -- 
> 2.17.1

