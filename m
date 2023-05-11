Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7048CC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 15:36:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.242.1683819410380304985
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 08:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1CD9540C68;
	Thu, 11 May 2023 15:36:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_XyHx6nLhF4; Thu, 11 May 2023 15:36:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EABA840A77;
	Thu, 11 May 2023 15:36:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 58E431638CA; Thu, 11 May 2023 11:36:03 -0400 (EDT)
Date: Thu, 11 May 2023 11:36:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20230511153603.GX9226@denix.org>
References: <202305021517546e066d50@mail.local>
 <20230502194743.GD9226@denix.org>
 <202305111450394ec6a4fb@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305111450394ec6a4fb@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 15:36:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16510

On Thu, May 11, 2023 at 04:50:39PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> Did you make any progress? The plan is to disable testing meta-ti next
> week if this isn't fixed by then.

Yes, I have necessary patches I'm about to send out.


> On 02/05/2023 15:47:43-0400, Denys Dmytriyenko wrote:
> > On Tue, May 02, 2023 at 05:17:54PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > > Hello,
> > > 
> > > meta-ti is currently failing check-layer-nightly:
> > 
> > Yeah, I think I know what's going on and it's a bit more complicated... I'll 
> > take a look at it.

