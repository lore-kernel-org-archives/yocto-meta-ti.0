Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4AFC77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 19:21:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19252.1681845702493763637
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 12:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6276140C85;
	Tue, 18 Apr 2023 19:21:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSHMKxh-ImLr; Tue, 18 Apr 2023 19:21:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 22EF640C2A;
	Tue, 18 Apr 2023 19:21:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B5B56163819; Tue, 18 Apr 2023 15:20:57 -0400 (EDT)
Date: Tue, 18 Apr 2023 15:20:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 5/6] meta-ti-bsp: Remove
 SGX driver from SIGGEN_EXCLUDERECIPES_ABISAFE
Message-ID: <20230418192057.GW9226@denix.org>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-5-afd@ti.com>
 <20230412204312.GJ9226@denix.org>
 <57e5d47d-3088-0df6-608b-35bb21f8c91f@ti.com>
 <20230412212519.GL9226@denix.org>
 <b13cd500-5d47-8e19-b3ac-64c07779b59b@ti.com>
 <20230414205407.GO9226@denix.org>
 <b93fc290-9371-c7dd-8620-972f07ddca08@ti.com>
 <9ea3e4f4-cfa0-6e11-b9e9-cec66c51a1fd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea3e4f4-cfa0-6e11-b9e9-cec66c51a1fd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 19:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16408

On Tue, Apr 18, 2023 at 09:09:04AM -0500, Ryan Eatmon wrote:
> 
> 
> On 4/14/2023 16:43, Andrew Davis wrote:
> >On 4/14/23 3:54 PM, Denys Dmytriyenko wrote:
> >>On Wed, Apr 12, 2023 at 04:28:45PM -0500, Andrew Davis wrote:
> >>>On 4/12/23 4:25 PM, Denys Dmytriyenko wrote:
> >>>>On Wed, Apr 12, 2023 at 04:08:50PM -0500, Andrew Davis wrote:
> >>>>>On 4/12/23 3:43 PM, Denys Dmytriyenko wrote:
> >>>>>>On Wed, Apr 12, 2023 at 01:42:41PM -0500, Andrew Davis
> >>>>>>via lists.yoctoproject.org wrote:
> >>>>>>>Neither of recipes nor their ABI is all that stable. OpenGL might be
> >>>>>>>slightly more stable, but that is not what these provide anymore.
> >>>>>>>Remove these.
> >>>>>>
> >>>>>>This is not what you think it is... :) Actually, Rogue
> >>>>>>recipes should be added
> >>>>>>to the list.
> >>>>>>
> >>>>>>This is specific to signatures/shared state. The ABI in
> >>>>>>this case is libgles
> >>>>>>and libegl (which are stable) and tells bitbake to avoid
> >>>>>>rebuilding generic
> >>>>>>apps depending on these packages between platfoms in the
> >>>>>>same architecture.
> >>>>>>
> >>>>>
> >>>>>These do not provide those API anymore, Mesa does. And
> >>>>>nothing should depend
> >>>>>on the KM package other than the UM libs.
> >>>>
> >>>>Still doesn't matter - if you have Mesa depend on these, you
> >>>>still need them
> >>>>listed in here to avoid rebuilding Mesa from one platform to
> >>>>another. And
> >>>>everything else downstream.
> >>>>
> >>>
> >>>We *want* Mesa to be rebuilt if these change, these do not
> >>>provide a stable ABI
> >>>anymore, it can and does change, sometimes between platforms
> >>>(SGX KM -> UM is
> >>>based on plat).
> >>
> >>The name of the variable may be confusing. It's not about
> >>rebuilding Mesa once
> >>you make changes to the KM/UM pieces - that will happen
> >>automatically if the
> >>dependencies are tracked properly.
> >>
> >>This variable is about re-use of the dependant generic packages.
> >>The issue it
> >>is trying to solve is when you have machine-specific packages
> >>early in the
> >>dependecy tree, everything down the dependency tree that depends on these
> >>packages will be treated as machine-specific, even if they are
> >>generic. Since
> >>bitbake will try to play safe here, you have to tell it otherwise.
> >>
> >>Again, this is not about rebuilds of a dependent component
> >>between changes.
> >>This is about rebuilds of a dependent component between
> >>different machines
> >>(platforms) w/o making any changes.
> >>
> >>For example, Wayland, Weston and all Qt5 modules are generic and
> >>should be
> >>re-used from shared state across all our Aarch64 platforms, but
> >>that's not the
> >>case and they are being rebuilt for each and every platform
> >>again and again.
> >>
> >>I've done some experiments locally - back when SGX/Rogue UM libs provided
> >>libgles, libegl, libgbm (which API/ABI are supposed to be stable!), you
> >>certainly wanted to have them listed in this
> >>SIGGEN_EXCLUDERECIPES_ABISAFE
> >>list. Now, those ABIs have shifted to Mesa and we do mark that package as
> >>machine-specific (I had to add PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>when redoing
> >>Reese's patches - see v8 changes section at [1]). With that in mind, this
> >>variable now has to list Mesa instead of individual UM packages
> >>- the patch
> >>is coming.
> >>
> >
> >So then we are saying the same thing, the UM libs should not be
> >listed here.
> >This patch should go in then, and another one that adds Mesa to the list
> >can go in after.
> >
> >If that is fine, then the first 5 patches in this series should be
> >good to go.
> 
> Denys, is there a follow on patch to this one that will correct your
> comments?  Should I hold off on applying this patch until your patch
> is ready, or go ahead and apply it so that you have a basis for your
> patch?

I can re-spin Andrew's patch with slight update in the commit message along 
with a new one to add Mesa.

-- 
Denys

