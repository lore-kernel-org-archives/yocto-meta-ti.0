Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFBBC7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 16:28:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.944.1750436876816869209
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 09:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=S/5vHtmu;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y6ttKLTgGvog2R4ry5/qY6wOp0reZB1HBGC/bJ71pQA=; b=S/5vHtmuqH1ooM7fQV39WfOYil
	euiCj6Ino4gC3samD/y3ttgiyTmA6hbWbRe9sRXs+614iWeCRe9U3/AxiHnNuEvShZCdstVa6TS7g
	YBCIGgo2iW6jUtcxEVOGAZDwETSSDd4ekeiGMX6pv0Jllgs9S/FhkxMxNowEhB/ICYzXILBCzRCiK
	AW1BLXl1JseBH92MPTv/A6Z+AkE/4lYyyFbiGrHoZoKV3hXKwoS5F/8xoqaw968DEc6Gv8xhLOP82
	OIkY+J/fOGaHWvx+rOCwhsbjEqxBDXUh5C1zBCw0+zkanIUA4hznhvBiZp/ppkoxp+oVI9bhh2x0p
	hgFm/OZg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37884 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSeam-0000000HFCT-3UP3;
	Fri, 20 Jun 2025 12:27:55 -0400
Date: Fri, 20 Jun 2025 12:27:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andrew Davis <afd@ti.com>
cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
In-Reply-To: <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
Message-ID: <535c39ee-0174-b4ef-e3ef-5500cb493762@crashcourse.ca>
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca> <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jun 2025 16:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18660

On Thu, 19 Jun 2025, Andrew Davis wrote:

> On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> > is this the right place to ask about building for PocketBeagle 2?
>
> The Beagle forums and Discord channel are probably the best place,
> but we are friendly here so let's see if we can help you out :)
>
> >    I'm trying to build a simple core-image-minimal for the
> > PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> > the master branches for all of meta-ti and meta-arm. (I'm using
> > MACHINE "pocketbeagle2").
> >
> Why use walnascar for Poky but master for the other branches? You shouldn't
> mix like that, if you want master then all branches should be master. Note
> though that master is a moving target and there is no guarantee to build.
>
> We don't provide a walnascar branch for meta-ti, but if you want to set
> all your layers back to scarthgap then you should have no issue building
> for pocketbeagle2.
>
> Looking at the actual issue, seems to be some failure building re2c
> which is provided by the oe-core layer, nothing specific to TI or
> the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
> May so I'd also guess you haven't updated your branches in a while,
> start with that.

From rpjday@crashcourse.ca Fri Jun 20 12:26:46 2025
Newsgroups:
Date: Fri, 20 Jun 2025 12:26:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andrew Davis <afd@ti.com>
cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
Fcc: sent-mail
In-Reply-To: <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
Message-ID: <dffe0fc6-b1fa-7ebe-67e9-4d5603cbe661@crashcourse.ca>
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca> <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
X-Reply-UID: (2 > )(1 1489744919 1857409)/home/rpjday/mbox
X-Reply-Mbox: inbox
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

On Thu, 19 Jun 2025, Andrew Davis wrote:

> On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> > is this the right place to ask about building for PocketBeagle 2?
>
> The Beagle forums and Discord channel are probably the best place,
> but we are friendly here so let's see if we can help you out :)
>
> >    I'm trying to build a simple core-image-minimal for the
> > PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> > the master branches for all of meta-ti and meta-arm. (I'm using
> > MACHINE "pocketbeagle2").
> >
> Why use walnascar for Poky but master for the other branches? You shouldn't
> mix like that, if you want master then all branches should be master. Note
> though that master is a moving target and there is no guarantee to build.
>
> We don't provide a walnascar branch for meta-ti, but if you want to set
> all your layers back to scarthgap then you should have no issue building
> for pocketbeagle2.
>
> Looking at the actual issue, seems to be some failure building re2c
> which is provided by the oe-core layer, nothing specific to TI or
> the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
> May so I'd also guess you haven't updated your branches in a while,
> start with that.
>
> Andrew

  Thanks for your guidance ... I eventually got a build, despite
weird, non-reproducible build errors. In the end, I built a
core-image-minimal for the PocketBeagle2, but did not get a final SD
card image, so I guess there's no .wks file that's associated with
this particular build. I will keep poking around.

rday

