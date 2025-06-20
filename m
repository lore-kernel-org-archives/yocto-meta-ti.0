Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E3CC7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 21:20:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7112.1750454410837129999
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 14:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bSZCJLXo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fmniKFWrvDhMDHjBkEauwHFeBMmJEdEMs2Xc0sYgv60=; b=bSZCJLXoSDz3yGdYU1inp2Kwzj
	53PeSGoY04qqD+4w7kLzw9pSOabEbcyimhF8G5ahIpoVIPo+fvjBN7AXJq5YR3LOCRTPKsDT0lKvd
	1e61lmtEG1AGcqmlii21P2HyyaM5rmuqzxk+Fp/iIfH9C6lyMttJQKBefrKw8WiR7UMEDBvPSJELA
	rGuPvHPeeyrT0Om0ViybCS0gOteXqY64tV7wt5XgCrqzoUggcNX3O3x8HH1FvL+U6qdfmvWs7WU1j
	9YYUIYHad97Z3yRUMMjTvzmlBQOg1roujJXRLcNKXeb3rGnHcD+N26/I+bmx5MvjfBnN0Fs/asdGm
	T2wA8GDQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:57652 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSj9W-00000000boJ-3urH;
	Fri, 20 Jun 2025 17:20:07 -0400
Date: Fri, 20 Jun 2025 17:19:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Jon Cormier <jcormier@criticallink.com>
cc: denis@denix.org, Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
In-Reply-To: <CADL8D3bd2uX_QzwOHZKDnwhRN9dsTZ3zOVv8MyBDJaDDGBSrcg@mail.gmail.com>
Message-ID: <2d0d7d2f-69fe-43f3-ddc4-dc77907c01b1@crashcourse.ca>
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca> <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com> <535c39ee-0174-b4ef-e3ef-5500cb493762@crashcourse.ca> <20250620184347.GI18383@denix.org>
 <CADL8D3bd2uX_QzwOHZKDnwhRN9dsTZ3zOVv8MyBDJaDDGBSrcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1680700882-1750454404=:2518381"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jun 2025 21:20:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18663

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1680700882-1750454404=:2518381
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jun 2025, Jon Cormier wrote:

> Likely you need to add wic to IMAGE_FSTYPES.
>
> IMAGE_FSTYPES += "wic wic.xz wic.bmap"

  "bitbake -e ..." shows that part of that is already set:

IMAGE_FSTYPES=" tar.xz wic.xz wic.bmap"

but i'll add "wic" to the list.

> On Fri, Jun 20, 2025 at 2:43 PM Denys Dmytriyenko via
> lists.yoctoproject.org <denis=denix.org@lists.yoctoproject.org> wrote:
> >
> > On Fri, Jun 20, 2025 at 12:27:47PM -0400, Robert P. J. Day wrote:
> > > On Thu, 19 Jun 2025, Andrew Davis wrote:
> > >
> > > > On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> > > > > is this the right place to ask about building for PocketBeagle 2?
> > > >
> > > > The Beagle forums and Discord channel are probably the best place,
> > > > but we are friendly here so let's see if we can help you out :)
> > > >
> > > > >    I'm trying to build a simple core-image-minimal for the
> > > > > PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> > > > > the master branches for all of meta-ti and meta-arm. (I'm using
> > > > > MACHINE "pocketbeagle2").
> > > > >
> > > > Why use walnascar for Poky but master for the other branches? You shouldn't
> > > > mix like that, if you want master then all branches should be master. Note
> > > > though that master is a moving target and there is no guarantee to build.
> > > >
> > > > We don't provide a walnascar branch for meta-ti, but if you want to set
> > > > all your layers back to scarthgap then you should have no issue building
> > > > for pocketbeagle2.
> > > >
> > > > Looking at the actual issue, seems to be some failure building re2c
> > > > which is provided by the oe-core layer, nothing specific to TI or
> > > > the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
> > > > May so I'd also guess you haven't updated your branches in a while,
> > > > start with that.
> > > >
> > > > Andrew
> > >
> > >   Thanks for your guidance ... I eventually got a build, despite
> > > weird, non-reproducible build errors. In the end, I built a
> > > core-image-minimal for the PocketBeagle2, but did not get a final SD
> > > card image, so I guess there's no .wks file that's associated with
> > > this particular build. I will keep poking around.
> >
> > # pre-expansion value:
> > #   "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
> > WKS_FILE="sdimage-2part.wks"
> >
> > --
> > Denys
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#18661): https://lists.yoctoproject.org/g/meta-ti/message/18661
> > Mute This Topic: https://lists.yoctoproject.org/mt/113723766/7902621
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@criticallink.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Jonathan Cormier
> Senior Software Engineer
>
> Voice:  315.425.4045 x222
>
> http://www.CriticalLink.com
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>
--8323329-1680700882-1750454404=:2518381--

