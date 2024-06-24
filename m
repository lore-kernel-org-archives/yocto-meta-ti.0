Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF3C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:06:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.152147.1719259606926686371
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 13:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A2F4040CAF;
	Mon, 24 Jun 2024 20:06:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enm8cz61oUeU; Mon, 24 Jun 2024 20:06:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 809AF40BA8;
	Mon, 24 Jun 2024 20:06:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7E24B163FC6; Mon, 24 Jun 2024 16:06:39 -0400 (EDT)
Date: Mon, 24 Jun 2024 16:06:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, max.oss.09@gmail.com, meta-ti@lists.yoctoproject.org,
	detheridge@ti.com
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 0/2] gcc 14 and bsp
 provider fixup
Message-ID: <20240624200639.GH18231@denix.org>
References: <20240624181714.1293865-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624181714.1293865-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 20:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17804

On Mon, Jun 24, 2024 at 01:17:12PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Resolve some issues afer the new bsp-provider selection logic was added and add
> some patches to help with compilation flag checks in the KM.

FWIW, the new bsp-provider selection logic was not causing any new issues.

Anyone using meta-ti master and scarthgap from early February until late May 
were already exposed to this.

While 6.1 LTS was still the default, this change to 23.3 got merged on Feb 9:
https://git.yoctoproject.org/meta-ti/commit/?id=737807fc4360b7fe3cbe493a6104558c4658a046

Separate new 24.1 DDK for the 6.6 LTS was added on May 2, still disabled:
https://git.yoctoproject.org/meta-ti/commit/?id=d89907ec2322f23271917d75f052217dd8a2c27a

And then 6.6 LTS got flipped to become the default on May 23:
https://git.yoctoproject.org/meta-ti/commit/?id=d41d49cfdc6deee33a40ab44d453167c36462c89

When adding the BSP provider code and setting preferred versions, I did see 
the first commit that switched branches from 6.1 to 6.6, and I was considering 
reverting it (like you are proposing here with patch #1). But I didn't want to 
upset anyone and figured since this was already the default config for almost 
4 months (!) of using the updated 23.3 DDK with 6.1 LTS, I just left it alone.

So, the BSP provider logic just formalized all the existing defaults.


> This includes equivalent patches from the following post for GCC 14 compat:
> https://lists.yoctoproject.org/g/meta-ti/topic/106806264
> 
> Randolph Sapp (2):
>   ti-img-rogue-*_23.3: gcc 14 compat and branch sel
>   ti-img-rogue-driver_24.1: gcc 14 compat
> 
>  .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 4 ++--
>  .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb       | 2 +-
>  .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.45.1
> 

