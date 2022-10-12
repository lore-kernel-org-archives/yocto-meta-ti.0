Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDA2C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 17:28:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47.1665595696411693020
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 10:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 948CE40DD3;
	Wed, 12 Oct 2022 17:28:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Hjz-nGthOH4; Wed, 12 Oct 2022 17:28:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 75A4140DC8;
	Wed, 12 Oct 2022 17:28:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C931F174A38; Wed, 12 Oct 2022 13:28:10 -0400 (EDT)
Date: Wed, 12 Oct 2022 13:28:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Sapp, Randolph" <rs@ti.com>
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump
 the graphics recipes
Message-ID: <20221012172810.GF22689@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
 <20221011014403.GG30861@denix.org>
 <7YXLJR.BJWKMOUWUVN01@ti.com>
 <20221011231649.GE22689@denix.org>
 <VAFNJR.UICQIQVLHTVW2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VAFNJR.UICQIQVLHTVW2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 17:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15159

On Wed, Oct 12, 2022 at 11:32:55AM -0500, Sapp, Randolph wrote:
> On Tue, Oct 11 2022 at 07:16:49 PM -0400, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >Should these be mentioned in the git commit message?
> 
> Depends on what we're actually trying to track in these commit
> messages. As far as I'm concerned these commit messages should only
> track changes to the recipes and reasoning, but if you believe they
> should also track upstream change notes then I will modify it
> accordingly.

And that's part of the reasoning. If those upstream change notes are public, 
you can simply link to them in git history. Otherwise it is recommended to 
provide a brief high level summary of the changes in the corresponding 
component.

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Denys

