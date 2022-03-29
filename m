Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C958C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 05:28:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3272.1648531730518543925
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 22:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 760CB40C1E;
	Tue, 29 Mar 2022 05:28:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueYebFCAdAuf; Tue, 29 Mar 2022 05:28:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4DFD040952;
	Tue, 29 Mar 2022 05:28:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 167961748B6; Tue, 29 Mar 2022 01:28:46 -0400 (EDT)
Date: Tue, 29 Mar 2022 01:28:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Darren Etheridge <detheridge@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move
 all platforms to ddk 1.15
Message-ID: <20220329052846.GU23554@denix.org>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
 <20220325220609.GJ23554@denix.org>
 <16DFC054FC61A9B3.21339@lists.yoctoproject.org>
 <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 05:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14570

On Fri, Mar 25, 2022 at 05:36:47PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 3/25/22 5:30 PM, Andrew F. Davis via lists.yoctoproject.org wrote:
> >On 3/25/22 5:06 PM, Denys Dmytriyenko wrote:
> >>On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> >>>On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
> >>>>On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
> >>>>>On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
> >>>>>>On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
> >>>>>>>Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> >>>>>>>
> >>>>>>>Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
> >>>>>>
> >>>>>>Overall looks good, please see inline below.

> >>Yeah, I think keeping each series of GPU (SGX, Rogue, Albiorix) in their own
> >>separate recipes would be fine. Or are you suggesting splitting even further
> >>into separate recipes for SGX530 vs SGX540, etc?
> >>
> >
> >
> >I'm suggesting even further. The driver/package for SGX530 is not compatible
> >and conflicts with the driver package for SGX540. So lets not have a single named
> >package (ti-sgx-ddk-um) that can have very different contents, that's just confusing.
> >
> 
> 
> Oh, and not separate recipes, separate packages, they can all be provided
> by the same one or two recipes.
> 
> ti-sgx-530-um
> ti-sgx-544-um
> ti-axe1-16m-um
> etc..
> 
> Then:
> 
> PREFERRED_PROVIDER_virtual/libgles2:am62xx = "ti-axe1-16m-um"

PREFERRED_PROVIDER specifies the build-time dependency, i.e. a recipe.

-- 
Denys

