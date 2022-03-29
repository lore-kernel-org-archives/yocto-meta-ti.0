Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC20DC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 04:50:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2876.1648529421754033608
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 21:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1252440C1E;
	Tue, 29 Mar 2022 04:50:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmvKbgJdQUHj; Tue, 29 Mar 2022 04:50:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF56A40952;
	Tue, 29 Mar 2022 04:50:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B23C11748B6; Tue, 29 Mar 2022 00:50:16 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:50:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 2/4] meta-ti-bsp: add SoC families for
 the J7 SoCs
Message-ID: <20220329045016.GO23554@denix.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325184151.16940-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325184151.16940-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 04:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14566

On Fri, Mar 25, 2022 at 01:41:49PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> This allows us to be more specific around what SoCs we support and
> lets us add features based on the SoC family not just at the EVM or
> whole J7family level.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

