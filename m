Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67F7C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 23:08:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6451.1672873694811595710
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 15:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D1C9540AC9;
	Wed,  4 Jan 2023 23:08:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDbu9dDFfNVS; Wed,  4 Jan 2023 23:08:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9255E40027;
	Wed,  4 Jan 2023 23:08:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52E8C1636B9; Wed,  4 Jan 2023 18:07:52 -0500 (EST)
Date: Wed, 4 Jan 2023 18:07:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Sapp, Randolph" <rs@ti.com>
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [master][PATCH v2]
 meta-ti-bsp: Graphics recipe overhaul
Message-ID: <20230104230752.GO22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
 <MY9NMR.KA5B9Y124SPL2@ti.com>
 <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
 <J3EWMR.6Q68HWA4M8303@ti.com>
 <20221219213235.GX22689@denix.org>
 <7Q29NR.T2R7VR8YUI2B2@ti.com>
 <20221222224746.GC22689@denix.org>
 <2OBKNR.ERO28SJCKO2E2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2OBKNR.ERO28SJCKO2E2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 23:08:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15529

On Tue, Dec 27, 2022 at 12:36:02PM -0600, Sapp, Randolph wrote:
> On Thu, Dec 22 2022 at 17:47:46 -05:00:00, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >So, "gpu" flag specifically means HW-accelerated 3D graphics core,
> >regardless of the model, generation or driver used. That covers
> >SGX and Rogue now. You can still build Mesa and other graphics
> >components w/o "gpu" flag for software rendering just fine.
> 
> Thanks for the history lesson, but this use of the GPU flag has
> changed over the years. We have overrides *for some reason* to drop
> functionality of certain packages when GPU is not present -- even
> though software rasterization could still be used here (take a look
> at gstreamer). This is in addition to a rickety dependency chain
> that seems to completely drop all graphics tooling when "gpu" is not
> present (talk to the guys working on am62a right now).
> 
> The issue I am trying to solve with the new machine feature is there
> is a mix of packages/pkgconfigs that should be tweaked for each of
> the following conditions:
>  - sgx grahpics
>  - rogue graphics
>  - swrast grahpics
>  - no graphics
> 
> Where the following should occur:
>  - SGX grahpics should conflict with ROGUE (different umlibs, km,
> and mesa patches)
>  - Both SGX and ROGUE should pull in all the same packages as
> swrast, only mesa should be configured differently (unless some
> userspace tools have their own swrast tooling which is rare but not
> impossible)
>  - No graphics should do what dropping the GPU feature currently
> does -- completely remove all graphics libraries and swrast tools.
> 
> Now, if you believe "screen" should be used in place of the "gpu"
> machine feature in my current system; that's fine, I can update the
> configs accordingly but a new machine feature or something similar
> will be required to differentiate between SGX/RGX.

Please list all the machine features you plan to add/rename/remove in 
order to support all these use cases. Thanks.

-- 
Denys

