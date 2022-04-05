Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7F3C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1018.1649195431504490515
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 14:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 40BDB40C2E;
	Tue,  5 Apr 2022 21:50:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt_aeWOCs1Kt; Tue,  5 Apr 2022 21:50:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 17CD140429;
	Tue,  5 Apr 2022 21:50:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F2B01748CE; Tue,  5 Apr 2022 17:50:25 -0400 (EDT)
Date: Tue, 5 Apr 2022 17:50:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: reatmon@ti.com, Yogesh Siraswar <yogeshs@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] Rename the am62xx-evm platform to
 am62xx-sk
Message-ID: <20220405215025.GI23554@denix.org>
References: <20220405170440.26628-1-reatmon@ti.com>
 <20220405173628.6w4urwkrpp4j7x52@splurge>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405173628.6w4urwkrpp4j7x52@splurge>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14595

On Tue, Apr 05, 2022 at 12:36:28PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> On 12:04-20220405, Ryan Eatmon via lists.yoctoproject.org wrote:
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> 
> Could we please add a commit message explaining reasoning?
> 
> This is overall, IMHO a bad idea. sk is ONE of the boards we will
> support with the same build. See am335x, 437x etc.. if we start spawning
> off per board builds, there is never an end to the confusion this will
> create.
> 
> So two choices:
> a) stick with evm as default (all encompasing builds) and exceptions as
> specific boards
> OR
> b) start building ever board as a separate yocto machine.
> 
> I strongly discourage (b), it just creates confusion!

I agree here. Historically, we've had SK (Starter Kit) boards in other SoC 
families in the past. But we tried to have a super-set platform in meta-ti to 
support as many of the board variants, as possible, usually named EVMs. I 
don't remember exactly, but I do believe there were one or two instances where 
SK or IDK or even a community board came before the EVM, but we still tried 
to keep the super-set under the EVM umbrella.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

