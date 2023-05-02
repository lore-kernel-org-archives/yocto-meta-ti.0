Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49287C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:38:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.73.1683056328162398739
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 12:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58D9340C61;
	Tue,  2 May 2023 19:38:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6EOF-Ad-VOP; Tue,  2 May 2023 19:38:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1672740C60;
	Tue,  2 May 2023 19:38:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A0BA2163893; Tue,  2 May 2023 15:38:00 -0400 (EDT)
Date: Tue, 2 May 2023 15:38:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Neha Malcom Francis <n-francis@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][RFC 4/9] u-boot-bb.org: Remove
 this recipe
Message-ID: <20230502193800.GC9226@denix.org>
References: <20230425172345.12293-1-afd@ti.com>
 <20230425172345.12293-5-afd@ti.com>
 <20230427203108.GO9226@denix.org>
 <3276c7f1-37bc-c35b-5ffc-44c3e0296c42@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3276c7f1-37bc-c35b-5ffc-44c3e0296c42@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 19:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16473

On Fri, Apr 28, 2023 at 10:13:26AM -0500, Andrew Davis wrote:
> On 4/27/23 3:31 PM, Denys Dmytriyenko wrote:
> >On Tue, Apr 25, 2023 at 12:23:40PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>This will no longer build after we switch away from k3-image-gen. Remove
> >>this version until it can be rebased on the latest U-Boot with binman
> >>support.
> >
> >>For now switch current users of this over to u-boot-ti v2021.01.
> >
> >This comment is not very clear - aren't you also removing that here?
> 
> Not here, I do that in the *next* patch :)
> 
> I usually sort my patches from least to most controversial, so the first
> 3-4 can be taken stopping here without breaking as much.
> 
> >Would it be possible to preserve at least Beagle build flows intact? Can
> >the existing ti-sci-fw recipe that uses k3-image-gen be kept for now
> >alongside the new one, e.g. move it to ti-sci-fw-legacy or something?
> 
> I have found no such way :(
> 
> All the multiconf and deploy logic expects k3-image-gen and now needs
> moved over to the new way. Supporting both would mean forking almost
> everything removed by this series.

But on the other hand, BBAI64 and BeaglePlay only support GP and don't set any 
additional multiconfigs besides the main k3r5. I feel like creating a separate 
ti-sci-fw-bb.org with k3-image-gen might be possible. But I haven't tried that 
myself yet...


> The benefit is not there IMHO since the beagle platforms should boot
> almost exactly the same on our TI tree as the bb.org version.
> 
> Moving forward, bb.org will also have to make this migration as
> k3-image-gen will soon be deprecated. When they do, if we still want
> their fork in meta-ti we can bring it back in.

The issue is that it will take time for bb.org to switch over to the latest TI 
6.1 kernel and 2023 U-boot with binman. Moreover, they only support Debian, so 
don't expect timely OE recipe updates. And in all this potentially long time 
there won't be any OE support for BB platforms. But there are active OE BB 
users here and I'm trying to find a way to not throw them under the bus...

-- 
Denys

