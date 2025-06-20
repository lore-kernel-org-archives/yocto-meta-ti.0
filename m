Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469CFC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 18:44:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3907.1750445031789927659
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 11:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8536940CB6;
	Fri, 20 Jun 2025 18:43:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpdU7bf_19KH; Fri, 20 Jun 2025 18:43:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5961940CB5;
	Fri, 20 Jun 2025 18:43:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B36EA16A7E2; Fri, 20 Jun 2025 14:43:47 -0400 (EDT)
Date: Fri, 20 Jun 2025 14:43:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
Message-ID: <20250620184347.GI18383@denix.org>
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca>
 <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
 <535c39ee-0174-b4ef-e3ef-5500cb493762@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535c39ee-0174-b4ef-e3ef-5500cb493762@crashcourse.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jun 2025 18:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18661

On Fri, Jun 20, 2025 at 12:27:47PM -0400, Robert P. J. Day wrote:
> On Thu, 19 Jun 2025, Andrew Davis wrote:
> 
> > On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> > > is this the right place to ask about building for PocketBeagle 2?
> >
> > The Beagle forums and Discord channel are probably the best place,
> > but we are friendly here so let's see if we can help you out :)
> >
> > >    I'm trying to build a simple core-image-minimal for the
> > > PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> > > the master branches for all of meta-ti and meta-arm. (I'm using
> > > MACHINE "pocketbeagle2").
> > >
> > Why use walnascar for Poky but master for the other branches? You shouldn't
> > mix like that, if you want master then all branches should be master. Note
> > though that master is a moving target and there is no guarantee to build.
> >
> > We don't provide a walnascar branch for meta-ti, but if you want to set
> > all your layers back to scarthgap then you should have no issue building
> > for pocketbeagle2.
> >
> > Looking at the actual issue, seems to be some failure building re2c
> > which is provided by the oe-core layer, nothing specific to TI or
> > the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
> > May so I'd also guess you haven't updated your branches in a while,
> > start with that.
> >
> > Andrew
> 
>   Thanks for your guidance ... I eventually got a build, despite
> weird, non-reproducible build errors. In the end, I built a
> core-image-minimal for the PocketBeagle2, but did not get a final SD
> card image, so I guess there's no .wks file that's associated with
> this particular build. I will keep poking around.

# pre-expansion value:
#   "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
WKS_FILE="sdimage-2part.wks"

-- 
Denys

