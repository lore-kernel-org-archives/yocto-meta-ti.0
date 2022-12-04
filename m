Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40270C4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 22:56:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.728.1670194609278890991
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 14:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 294D140C2B;
	Sun,  4 Dec 2022 22:56:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EdzM488DwpEw; Sun,  4 Dec 2022 22:56:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D831D40A03;
	Sun,  4 Dec 2022 22:56:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C31E91636A5; Sun,  4 Dec 2022 17:56:34 -0500 (EST)
Date: Sun, 4 Dec 2022 17:56:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Manorit Chawdhry <m-chawdhry@ti.com>, meta-ti@lists.yoctoproject.org,
	Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] optee: update optee-client,
 optee-test, optee-examples to 3.19 tag
Message-ID: <20221204225634.GX22689@denix.org>
References: <20221202100452.1868797-1-m-chawdhry@ti.com>
 <b1812e45-6c73-4a2a-16a1-704393f35e3a@ti.com>
 <20221203154808.GV22689@denix.org>
 <811707e3-c815-000d-75a9-49fd4d4242e7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <811707e3-c815-000d-75a9-49fd4d4242e7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 04 Dec 2022 22:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15405

On Sat, Dec 03, 2022 at 11:04:00AM -0600, Ryan Eatmon wrote:
> 
> 
> On 12/3/2022 9:48, Denys Dmytriyenko wrote:
> >On Fri, Dec 02, 2022 at 08:04:52PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>
> >>
> >>On 12/2/2022 4:04, Manorit Chawdhry wrote:
> >>>optee-os was updated to 3.19 tag but the others were still outdated.
> >>>
> >>>Updates other optee components to 3.19 tag
> >>>
> >>>Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> >>>---
> >>>  recipes-security/optee/optee-client_%.bbappend   | 4 ++--
> >>>  recipes-security/optee/optee-examples_%.bbappend | 4 ++--
> >>>  recipes-security/optee/optee-test_%.bbappend     | 4 ++--
> >>>  3 files changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>>diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> >>>index 5675570a..6737ba92 100644
> >>>--- a/recipes-security/optee/optee-client_%.bbappend
> >>>+++ b/recipes-security/optee/optee-client_%.bbappend
> >>>@@ -1,2 +1,2 @@
> >>>-PV_ti-soc = "3.17.0+git${SRCPV}"
> >>>-SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
> >>>+PV_ti-soc = "3.19.0+git${SRCPV}"
> >>>+SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
> >>
> >>optee-client will not build against this SRCREV.  They added a call
> >>to pkg-config which is not readily available to the recipe without a
> >>change to your patch.
> >>
> >>You need to add:
> >>
> >>DEPENDS += "pkgconfig"
> >
> >You probably don't want a target pkgconfig, but a native one.
> >Do this instead:
> >
> >inherit pkgconfig
> 
> Actually, I thought that at first too and tried all variations of
> the native (inherit, depends, hosttools, etc...).  The only thing
> that actually made it work was the above.
> 
> In this case, pkg-config is not being called from configure, but
> from the Makefile.  The Makefile is trying to make sure that libuuid
> is installed for the target.  And the native would only make sure it
> is installed on the native side, where as pkgconfig for target looks
> in all of the places for the target library.  At least that was my
> understanding in reading online docs about it.
> 
> But depending on pkgconfig (for target) actually fixed the compile
> issue.  If you want to verify that or disprove it I would be most
> appreciative.  I spent a few hours banging my head on this one.

Looks like you've done your research - it's a bit strange use of pkgconfig 
by optee-client, not a basic normal use case I was referring to.

If the Makefile is trying to check if libuuid is installed, don't you need to 
also have it the DEPENDS?

And we'll see how meta-arm/master handles it soon enough, when updating to 
3.19 upstream...

-- 
Denys

