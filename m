Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1747C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 00:07:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.90748.1670976444957640409
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 16:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 68BB440C2B;
	Wed, 14 Dec 2022 00:07:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OWb0BbtYBaJ; Wed, 14 Dec 2022 00:07:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E24940A3F;
	Wed, 14 Dec 2022 00:07:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F8921636B0; Tue, 13 Dec 2022 19:07:09 -0500 (EST)
Date: Tue, 13 Dec 2022 19:07:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
Message-ID: <20221214000709.GP22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
 <MY9NMR.KA5B9Y124SPL2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MY9NMR.KA5B9Y124SPL2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 00:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15471

Hmm, some of the context of the original commenting is lost here. Any way to 
get the comments inline with the original patch preserved for reference?


On Fri, Dec 09, 2022 at 04:18:22PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com>
> wrote:
> >Since the UM driver now RDEPENDS on the KM, could we also drop this
> >last line everywhere?
> 
> Nope, we still need the one preferred provider line to indicate that
> rogue graphics are present. Now this could be replaced by a
> rogue-graphics machine feature instead if that's preferable, but
> something will need to signal the mesa switch.
> 
> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com>
> wrote:
> >Bash? Are we sure we need that?
> 
> Yes. The System V init script still needs it. Now could we look at
> removing that init script? Sure, so long as the device probe still
> works. What is actually taking care of that right now? It's not udev
> is it?
> 
> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com>
> wrote:
> >"ldflags already-stripped" should be the only skips we still need.
> 
> Dev-so is required because of some of the symbolic links that are
> shipped. I'm fine dropping arch unless that breaks something.

