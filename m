Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B73C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 23:17:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.14145.1665530214865918917
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 16:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D33F540D69;
	Tue, 11 Oct 2022 23:16:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AV5SGmndNSGs; Tue, 11 Oct 2022 23:16:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B1DBB40D62;
	Tue, 11 Oct 2022 23:16:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3B93E174A35; Tue, 11 Oct 2022 19:16:49 -0400 (EDT)
Date: Tue, 11 Oct 2022 19:16:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump the graphics
 recipes
Message-ID: <20221011231649.GE22689@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
 <20221011014403.GG30861@denix.org>
 <7YXLJR.BJWKMOUWUVN01@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7YXLJR.BJWKMOUWUVN01@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 23:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15147

On Tue, Oct 11, 2022 at 04:20:31PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> On Mon, Oct 10 2022 at 09:44:03 PM -0400, Denys Dmytriyenko
> <denis@denix.org> wrote:
> >Any useful changelog between the 2 SRCREVs, besides removal of BVNC?
> 
> Yeah, actually. Two main things. The default precision for GL
> fragmentation shaders was bumped up, which helps with some visual
> bugs in applications like glmark2. In addition to this, a firmware
> patch was added that should help some of the hardware recoveries
> clients were experiencing on am62.
> 
> This is roughly the latest commit message for the selected UM version.
> 
> KM was really only a Makefile cleanup because I was tired of trying
> to remember what platform had what BVNC and there were a few legacy
> variables being set that had no effect.

Should these be mentioned in the git commit message?

-- 
Denys

