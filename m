Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C8C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 21:35:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.56871.1670880909563021084
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 13:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 00DC640BA9;
	Mon, 12 Dec 2022 21:35:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mALnG8cL5HmS; Mon, 12 Dec 2022 21:35:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D169E40A3F;
	Mon, 12 Dec 2022 21:35:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 486551636AE; Mon, 12 Dec 2022 16:34:57 -0500 (EST)
Date: Mon, 12 Dec 2022 16:34:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: change from
 do_image_wic/tar to do_image
Message-ID: <20221212213457.GH22689@denix.org>
References: <20221211190240.7246-1-reatmon@ti.com>
 <20221212181520.GE22689@denix.org>
 <e318a600-c9f5-7969-d809-0748eaa786c7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e318a600-c9f5-7969-d809-0748eaa786c7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 21:35:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15455

On Mon, Dec 12, 2022 at 01:24:29PM -0600, Ryan Eatmon wrote:
> 
> 
> On 12/12/2022 12:15, Denys Dmytriyenko wrote:
> >On Sun, Dec 11, 2022 at 01:02:40PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>When trying to support OpenBMC we found that our use of do_image_wic
> >>and do_image_tar for adding depends and mcdepends was too limiting.
> >>Moving to do_image is a higher level in the tree that means for any
> >>image type the dependencies will be correct.
> >
> >There might be some unexpected side effects, since do_image is too broard. Not
> >every image has a boot partition and should depend on the corresponding boot
> >files being deployed. Things like ramdisks, initramfs and such have different
> >flows and own dependencies. Also images that include other images, like guests
> >for VMs or hypervisors or even bootstrapping. All those could potentially have
> >issues due to a global do_image dependency - I've seen circular dependency
> >breakages in the past in those areas. Not all use cases are being tested by
> >default, so not easy to tell if this change is compltetely harmless...
> 
> I was worried something like that might be true.  But how are we
> supposed to know which images (present and future) that we need to
> add dependencies for in this case?

Yeah, that's a very good question. My thinking back then was that usually we 
only want "wic" format for a bootable whole-system images, hence I limited 
the dependency to do_image_wic (and the tar version was a by-product). Maybe 
your change is not as dangerous as I was imagining :) - definitely needs more 
thorough testing. Or we can come up with a completely different way of 
specifying those dependencies?

-- 
Denys

