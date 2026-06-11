Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271DECD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:56:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46102.1781186189499977946
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 06:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=v4/yww3B;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XliizhTI3AxHSZtn9dhYFTnPA8GH/nWEQj9n1i/Hm94=; b=v4/yww3Bio+BCSHCu6nNH30TnX
	oC0BejOyPzPexUp9ujgaGf8Uh7ofsskjz5+PvxaNJvbY8a9hNpwEHB3FPeq+VX7uzRI2AD7zjNh1j
	jGYW2tJb+iWTPYSlU5bYfDjg6qYIdh9li2kFgkWt4/BDnqnDA/YVuia0zWRp29h0T7bmV0EZ7Fk2O
	CoSSopq25Q2Pmi+kiQzY2yRcMmb1HfeDgo7M39xEx2aPK7gq01W3MkGAt4E5swTVwXogub99CaIyS
	UMDwtg1LEWd0nPNt9GaCepC1CoJFKCqT9EyyLogRVJ+H1zQ8DEv7PXmy+MPUT++7d77/ZQoo1rEfM
	RhVz80aA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:53938 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXftP-0000000BkUl-07Po;
	Thu, 11 Jun 2026 09:56:27 -0400
Date: Thu, 11 Jun 2026 09:56:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Denys Dmytriyenko <denis@denix.org>
cc: meta-ti mailing list <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] want to clarify (simple) instructions to build for
 beagleplay
In-Reply-To: <20260611135132.GO23325@denix.org>
Message-ID: <1b7d0ed2-ee52-f8f4-e9d2-2121411725a5@crashcourse.ca>
References: <fae8ab1f-e451-9357-de74-ba776a3ca658@crashcourse.ca> <20260611135132.GO23325@denix.org>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 13:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20025

On Thu, 11 Jun 2026, Denys Dmytriyenko wrote:

> On Thu, Jun 11, 2026 at 09:19:07AM -0400, Robert P. J. Day wrote:
> >
> >   friend just got a beagleplay, asked me whether there was any
> > complication in building a simple core-image-minimal with yocto
> > project ... i did some quick research and, from what i read, it's as
> > simple as:
> >
> >   1) check out oe-core, meta-ti and meta-arm layers
> >   2) add all the relevant layers to bblayers.conf
> >   3) Set MACHINE = "beagleplay"
> >   4) "bitbake core-image-minimal"
> >
> > and one should get an appropriate wic image.
> >
> >   one question -- are the "master" branches safe for all of the above,
> > or should one play it safe and check out "wrynose" for all of the
> > above?
> >
> >   seems pretty straightforward.
> >
> > rday
>
> Robert,
>
> You had already asked this back in January:
>
> https://lists.yoctoproject.org/g/meta-ti/topic/117104047
>
> You can simply use genericarm64 w/o meta-ti layers, per Nishanth.
>
> My understanding is that genericarm64 uses pre-built FW binaries for
> low-level bootchain, such as SPL, ATF, OP-TEE, etc., while meta-ti
> builds those from sources.
>
> >From the kernel perspective, one uses vanilla upstream linux-yocto
> and the other uses patched TI kernel. From beagleplay perspective,
> the differences should be relatively minor.

  you're right, i'd forgotten about that, my bad.

rday

