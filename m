Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39915C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 22:38:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3702.1658356681499197842
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 15:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DDAAA40CF0;
	Wed, 20 Jul 2022 22:38:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anB0PeemRbp5; Wed, 20 Jul 2022 22:38:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B341440CE0;
	Wed, 20 Jul 2022 22:37:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4C28F1749AF; Wed, 20 Jul 2022 18:37:57 -0400 (EDT)
Date: Wed, 20 Jul 2022 18:37:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Message-ID: <20220720223757.GL18692@denix.org>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
 <20220719031841.GY18692@denix.org>
 <20220719132201.2r73plviktkkxnkf@wrecker>
 <20220719195102.GE18692@denix.org>
 <YthpZBoEnSaWxg5R@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YthpZBoEnSaWxg5R@x1>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 22:38:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14893

On Wed, Jul 20, 2022 at 01:45:24PM -0700, Drew Fustini wrote:
> On Tue, Jul 19, 2022 at 03:51:02PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Jul 19, 2022 at 08:22:01AM -0500, Nishanth Menon wrote:
> > > On 23:18-20220718, Denys Dmytriyenko wrote:
> > > > I was thinking that instead of keying off of ARAGO_BRAND=mainline, which 
> > > > is very specific to Arago distro, long term we should instead key off of 
> > > > PREFERRED_PROVIDER_virtual/kernel=linux-ti-mainline, that is specific to 
> > > > meta-ti... Thoughts?
> > > 
> > > 
> > > We'd want mainline kernel, u-boot, tf-a, optee ..... as many upstream
> > > components as possible. is there a way to create a virtual package group
> > > that points to all upstream base components?
> > > 
> > > I am looking for ways we can enable this beyond just arago brand.
> > 
> > My understanding is that tf-a and optee were initially forked for K3 
> > development, but these days are pretty much the same as upstream.
> > 
> > And optee is already pulling code from upstream, just pinning down to a 
> > specific version and doing some extra TI-specific signing on top.
> > 
> > As of tf-a, I'd recommend dropping git.ti.com fork completely and pulling 
> > from upstream, if possible.
> > 
> > But kernel/U-boot is a bit more involved. Those are done as multiple 
> > providers and require switching corresponding PREFERRED_PROVIDER 
> > variables.
> > 
> > Either way, for testing which kernel is being built (ti-staging or mainline) 
> > and which U-boot (ti-staging or mainline), checking PREFERRED_PROVIDER 
> > should be doable and Distro-agnostic.
> 
> Thank you for the suggestion.
> 
> Would the conditional then being something like this?
> 
>   ${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-mainline', '', 'dra71-evm-nand.dtb', d)}

LGTM. Thanks

-- 
Denys

