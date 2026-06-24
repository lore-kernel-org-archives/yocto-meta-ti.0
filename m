Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D332CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 21:00:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17572.1782334836291733374
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 14:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Dyrpsmib;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xKhVu2S7wU9x1n7kmSNgMpfU0fIhk5VwNjcsCSOkMZc=; b=Dyrpsmible6mGJh3mtoGh5gwJd
	2gwZAWo/A7S37IccVOs98IRYp8/OJf8k3+gjhnIYqJ7B0vsSAwASw9mTZ0PLzAuNu87qWA8saHWAG
	Ilarue2SNHozqGDk7gNHhUEgxuU4+N6JDsm+vKtDvFgEBFUMYcn0MU13oiwsuviShw/5VGV6Bto8S
	EqS4PqEYoW2CgXW2uktWp++NFiC03u9DBPswSDEUVn8OOHyQygs57HgkxpY0Uuz2F8ywMlc/khUod
	bf9hqFroY92zAeMTvOspjDT603yRnX5wHEZiNKgC6IwZGbr/ymlC3SzbOjapqM/fU5YH0/9tJ39aR
	ROVh/u8g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:55908 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcUhu-0000000GOrJ-1SML;
	Wed, 24 Jun 2026 17:00:34 -0400
Date: Wed, 24 Jun 2026 17:00:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Denys Dmytriyenko <denis@denix.org>
cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>, 
    Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-linux-fw: Remove default
 SUMMARY line
In-Reply-To: <20260624205433.GF10186@denix.org>
Message-ID: <7c6d01a2-b477-6e3e-61f7-ed2103a0451f@crashcourse.ca>
References: <20260624203026.1155961-1-afd@ti.com> <20260624203737.GD10186@denix.org> <883f620a-c9b3-4418-a180-ded5d0e07353@ti.com> <20260624205433.GF10186@denix.org>
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
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 21:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20087

On Wed, 24 Jun 2026, Denys Dmytriyenko wrote:

> On Wed, Jun 24, 2026 at 03:47:52PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> > On 6/24/26 3:37 PM, Denys Dmytriyenko wrote:
> > >On Wed, Jun 24, 2026 at 03:30:26PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> > >>All firmware that includes this helper should set their own SUMMARY line.
> > >>Currently all do (other than ti-adc-fw which we fix here), but they often
> > >>include this file after setting their own SUMMARY, so this common one
> > >>overwrites the correct one. Remove this default SUMMARY.
> > >
> > >How about flipping it the other way around?
> > >
> > >In the common .inc file we set:
> > >
> > >SUMMARY = "Prebuild binary firmware"
> > >
> > >And in specific firmware recioes we clarify:
> > >
> > >SUMMARY .= " for TI ADC PCM6240 configuration"
> > >
> > >That way it won't matter if the inclusion happens before or after setting the
> > >specific SUMMARY and it won't be completely empty (albeit generic) if someone
> > >forgets setting SUMMARY in the recipe.
> > >
> >
> > It might technically work, but I'd rather we throw a warning if someone forgets
> > their SUMMARY line rather than just taking a super generic fallback. If we allow
> > fallbacks like that what stops us from having
> >
> > SUMMARY = "Yocto recipe"
> >
> > in some main conf and hope recipes add
> >
> > SUMMARY .= " for Linux kernel on TI devices"
>
> There won't be any warning, as OE-Core has defaults for SUMMARY and
> DESCRIPTION:
>
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n276

  i literally added a note about that to the YP docs in the last few
days.

rday

