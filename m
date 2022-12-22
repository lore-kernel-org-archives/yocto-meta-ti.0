Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24210C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:48:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.59581.1671749284647090116
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05FED40BA9;
	Thu, 22 Dec 2022 22:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEDJJA8k5Hfd; Thu, 22 Dec 2022 22:48:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC40540027;
	Thu, 22 Dec 2022 22:47:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BFE301636B4; Thu, 22 Dec 2022 17:47:46 -0500 (EST)
Date: Thu, 22 Dec 2022 17:47:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Sapp, Randolph" <rs@ti.com>
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [meta-ti] [master][PATCH v2] meta-ti-bsp:
 Graphics recipe overhaul
Message-ID: <20221222224746.GC22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
 <MY9NMR.KA5B9Y124SPL2@ti.com>
 <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
 <J3EWMR.6Q68HWA4M8303@ti.com>
 <20221219213235.GX22689@denix.org>
 <7Q29NR.T2R7VR8YUI2B2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7Q29NR.T2R7VR8YUI2B2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15502

On Wed, Dec 21, 2022 at 10:49:19AM -0600, Sapp, Randolph wrote:
> On Mon, Dec 19 2022 at 16:32:35 -05:00:00, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >Can you please explain why existing machine feature cannot be
> >re-used and a
> >new one is needed here? Do you plan to use both side-by-side?
> 
> Yes, so gpu is a super generic machine feature. On our platforms
> this could mean anything from some minimal device with a tidss
> module that wants to do software rendering to a full blown device
> with rogue/sgx graphics processors. The gpu feature is required to
> build graphics libraries in either case, but if they are doing
> software rendering they won't need the rogue/sgx specific patches.
> The new machine feature makes this distinction clear and allows us
> to switch between rogue/sgx/swrast tooling as necessary.

Well, not exactly...

We originally created "sgx" machine feature in meta-ti to be used in 
downstream layers (as that was not a common upstream flag), as there 
was a need to mark platforms with accelerated 3D GFX core and SGX was 
the only one used in TI platforms back then.

As J721e was the first SoC with the Rogue core, there was still a need 
to indicate a presence of 3D graphics regarless of the driver, hence I 
made the flag more generic by renaming "sgx" into "gpu":
https://git.yoctoproject.org/meta-ti/commit/?id=0d9910c1710d9d4b2dd986403824ae05b6289e63

The thinking was that for any display and graphics capabilities w/o 
accelerated 3D (or software-rendered 3D), there's still a standard 
upstream machine feature called "screen", perfectly suited for that.

So, "gpu" flag specifically means HW-accelerated 3D graphics core, 
regardless of the model, generation or driver used. That covers 
SGX and Rogue now. You can still build Mesa and other graphics 
components w/o "gpu" flag for software rendering just fine.

-- 
Denys

