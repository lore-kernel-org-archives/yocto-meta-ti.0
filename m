Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A97FC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 05:22:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3063.1648531322472462548
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 22:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 79CCF40C1E;
	Tue, 29 Mar 2022 05:22:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_x_hL21dXpB; Tue, 29 Mar 2022 05:22:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 534C040952;
	Tue, 29 Mar 2022 05:21:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 184FD1748B6; Tue, 29 Mar 2022 01:21:58 -0400 (EDT)
Date: Tue, 29 Mar 2022 01:21:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Darren Etheridge <detheridge@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move
 all platforms to ddk 1.15
Message-ID: <20220329052158.GT23554@denix.org>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 05:22:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14569

On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
> >On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
> >>On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
> >>>On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
> >>>>Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> >>>>
> >>>>Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
> >>>
> >>>Overall looks good, please see inline below.
> 
> >
> >>Thinking on this, the mapping between SoC family and the internal names
> >>like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the version of this
> >>driver. For instance in the next DDK I may want the target name to
> >>go from "am62_linux" to "axb_128_linux", I would have to
> >>change things here (update the SRCREV) AND in the machine config.
> >
> >1. I totally agree that "axb_128_linux" makes more sense than "am62_linux".
> >2. Changes like that happen very rarely.
> >3. You can call it PVR_MODEL or PVR_PRODUCT if you want, instead of PVR_SOC.
> >
> >
> >>Mapping here feels like the right spot to me. I'd even argue the same
> >>for OPTEEMACHINE and the like, should go in the optee.bbappends with the
> >>rest of our platform specific recipe fixups, etc.
> >
> >The number of overrides in the recipe will keep on growing, as each new
> >platform will need to add own config. That's the whole point of the machine
> >configuration file to have those defined centrally.
> >
> >The goal is to have a recipe as machine-agnostic and clean, as possible. Do
> >not overwhelm it with tons of conditionals like that - any machine-specific
> >configuration should be set in the machine config file.
> >
> 
> 
> Having all the fixups related to a package inside that package's definition sounds
> more central to me, and easier to reason about. But I can see the argument both
> ways.

Think of it from another perspective - if you keep all machine overrides for 
one varibale in the same recipe, a minor change to one specific override there 
will make the recipe as "modified" for all platforms and all builds would have 
to be redone.

But if that one variable is set in the machine config to a specific value, 
changing it for one platform won't affect other platforms and you'd only need 
to rebuild that changed platform.

For example - let's add a new .dtbo for am65xx-evm...

In first case you would modify an override in the kernel recipe:
recipes-kernel/linux/linux-ti-staging_5.10.bb:

 KERNEL_DEVICETREE_am64xx-evm = "..."
-KERNEL_DEVICETREE_am65xx-evm = "devtree.dtb overlay1.dtbo"
+KERNEL_DEVICETREE_am65xx-evm = "devtree.dtb overlay1.dtbo overlay2.dtbo"
 KERNEL_DEVICETREE_j721e-evm = "..."

So, you modified the kernel recipes, so now all platforms would have to 
rebuild the kernel and everything that depends on it. With all the variants 
(RT, non-RT, debug), brands and configs (nightly, RC, etc), that ends up in 
a lot of rebuilds in the farm (could be hundreds of rebuilds, if you count 
all permutations)!

In the second case, the .dtbo is added in the machine config:
conf/machine/am65xx-evm.conf:
-KERNEL_DEVICETREE = "devtree.dtb overlay1.dtbo"
+KERNEL_DEVICETREE = "devtree.dtb overlay1.dtbo overlay2.dtbo"

And the kernel recipe wasn't touched, so only am65xx-evm needs to be rebuilt. 
Even with permutations, it's just several rebuilds of the same platform.

The other point is that changes to the same variable more often happen one 
platform at a time (add a .dtbo, change defconfig or add a config fragment, 
even add a new platform), instead of changing globally for all platforms at 
the same time...


PS. There are some advanced Yocto techniques to remedy the above rebuilding 
of dependency tree to some extent, such as hash equivalence and such, but 
that's still a bit cutting edge, somewhat unstable and might not be ready for 
production yet.

-- 
Denys

