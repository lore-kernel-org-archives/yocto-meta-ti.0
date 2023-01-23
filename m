Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA88BC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 22:24:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.596.1674512693730110082
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 14:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED4D040C13;
	Mon, 23 Jan 2023 22:24:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcMcG8JAZFFZ; Mon, 23 Jan 2023 22:24:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFE7C40A46;
	Mon, 23 Jan 2023 22:24:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E671163701; Mon, 23 Jan 2023 17:24:28 -0500 (EST)
Date: Mon, 23 Jan 2023 17:24:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: denys@ti.com, reatmon@ti.com, detheridge@ti.com,
	meta-ti@lists.yoctoproject.org, k-bhargav@ti.com
Subject: Re: [meta-ti] [master/kirkstone][PATCH] all: Graphics recipe
 overhaul
Message-ID: <20230123222428.GX22689@denix.org>
References: <20230119204026.1297616-1-rs@ti.com>
 <20230120182636.GP22689@denix.org>
 <SBSSOR.I33PHI6LU4AA@ti.com>
 <20230120221120.GR22689@denix.org>
 <115TOR.S0E6VS3VSAUV@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <115TOR.S0E6VS3VSAUV@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 22:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15636

On Fri, Jan 20, 2023 at 05:24:37PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> On Fri, Jan 20 2023 at 05:11:20 PM -0500, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >Well, there are pros and cons to both approaches. And I would be
> >more inclined
> >to agree with you that it is necessary to copy over the entire
> >Mesa recipes,
> >if you were trying to apply patches on top of the upstream
> >version. But, you
> >are completely changing SRC_URI and SRCREV anyway to point to your
> >own tree,
> >so it doesn't matter very much what underlying version of the
> >recipe you start
> >with. I do believe it would just work for the master with 22.2.3
> >version.
> >Sure, recipes sometimes change significantly and break your
> >bbappend, but
> >that's when it will be the time to consider carrying the full set
> >of older
> >version, sometime in the future.
> >
> >As an example, we've been carrying bbappends in meta-ti for
> >upstream optee and
> >trunsted-firmware-a recipes from meta-arm - sometimes we fall
> >behind and stick
> >to an older version, but sometimes we update to a newer version
> >earlier than
> >upstream. That's been working for several years and quite
> >successful for the
> >most part...
> >
> >On the other side of the spectrum, there's ltp-ddt recipe that is
> >based on top
> >of the upstream ltp recipe of a specific version. It's not exactly
> >a bbappend,
> >but close enough. When upstream upgrades to a newer version, we
> >end up copying
> >the specific previous version locally side-by-side. Later, when we
> >rebase
> >ltp-ddt and catch up with the ltp version upstream, we can remove the
> >duplicate.
> >
> >In other words, *IF* we end up duplicating Mesa recipes locally,
> >I'd argue we
> >should keep them unmodified and apply any modifications through
> >bbappend. If
> >needed, you can make it version-specific, e.g.
> >mesa_22.0.%.bbappend. That way
> >in kirkstone you only need this bbappend, but in
> >langdale/mickledore you may
> >end up having a local copy of *unmodified* mesa_22.0.3.bb from
> >kirkstone along
> >with this mesa_22.0.%.bbappend on top. In other words - if you
> >refrain from
> >modifying the local duplicates of upstream files and keep them
> >intact, it
> >would be much easier to maintain long term...
> 
> Well what do you recommend? Version pinning (through the copy in
> meta-ti) in addition to a bbappend, or just a version globed
> bbappend?

My recommendation would be to do a bbappend with partial version, i.e. 22.% or 
22.0.%

That will be quite easy to review and test against kirkstone.

And then for master or later releases, you can add a local verbatim copy of 
the required mesa recipes from upstream w/o modifications as a separate patch 
and commit, still leaving bbappend around to apply required modifications on 
top.

-- 
Denys

