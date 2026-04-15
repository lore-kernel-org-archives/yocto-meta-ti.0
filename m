Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA717F433C4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 21:11:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5777.1776287465996226713
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 14:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B15940C8C;
	Wed, 15 Apr 2026 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrkAHMMenetl; Wed, 15 Apr 2026 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF0C940B96;
	Wed, 15 Apr 2026 21:10:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8611417BFAB; Wed, 15 Apr 2026 17:10:59 -0400 (EDT)
Date: Wed, 15 Apr 2026 17:10:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Francesco Dolcini <francesco@dolcini.it>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
Message-ID: <20260415211059.GD4186@denix.org>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
 <20260415115820.GA26023@francesco-nb>
 <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 21:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19853

On Wed, Apr 15, 2026 at 09:43:31AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 4/15/26 6:58 AM, Francesco Dolcini wrote:
> >+Andrew
> >
> >Hello Ryan,
> >
> >On Wed, Apr 15, 2026 at 01:41:04PM +0200, Franz Schnyder wrote:
> >>From: Franz Schnyder <franz.schnyder@toradex.com>
> >>
> >>The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
> >>include, which is therefore used for all the J784s4-based machines.
> >>That firmware seems to be developed specifically for the EVM, as it
> >>takes control of pins used for the Ethernet board setup on the EVM. On
> >>non-EVM boards, like the Aquila-AM69, those signals are used for other
> >>functions, so enabling the firmware in the SoC include is too broad
> >>and breaks functionality.
> >>
> >>Move the machine-essential recommend from the SoC include
> >>to the EVM configuration.
> >>
> >>Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> >
> >This seems to be the 3rd time, in a relatively short time, in which
> >we are affected by your decision to put into the SoC file, configuration
> >that are not about the SOC
> >
> >  1 - the initramfs topic [https://lore.kernel.org/yocto-meta-ti/78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com/]
> >  2 - the console uart [https://lore.kernel.org/yocto-meta-ti/4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com/]
> 
> I thought we solved this one by making the console selection more easily
> updated in the board files. If we want to go one step further and remove
> the defaults from the SoC level and always select the board specific UART
> in each board config I wouldn't oppose that either.

I was going to reply to the end of the thread, but this entire section of the 
discussion was completely removed, hence I will do it here.

We've discussed this quite a lot internally and we ended up going with what 
Andrew is saying here.

There's this concept of "sane defaults" that covers most of the cases and it 
makes sense to set them as such. We have tens of platforms using this default 
UART configuration and it makes perfect sense to set it once, instead of 
copying the same over and over again - it is a maintenance pitfall. But we 
also make sure to allow very easy and effortless overriding of this default, 
if, for some reason, a specific board implementation doesn't follow this 
default.

There are lots and lots of similar examples when an upstream layer, including 
OE-Core, sets a sane default that may not match your configuration, but as 
long as it allows easy override downstream, it's not the end of the world.


> >  3 - this firmware
> >
> 
> This firmware was a miss on our part, we were not aware that it was
> not generic for all boards using this SoC but instead does some EVM
> specific pinmuxing. I've looked into the FW source and can see where
> that happens, I'll work to see how we can fix that. In the mean time
> I agree then we should move this firmware to the board level (as the
> patch does).

Here I agree with Andrew - it was an oversight and if it does per-board 
pinmuxing, then it belongs in a board config. That said, please address my 
comment for the patch before merging.


> >Can I ask TI once more to rethink this considering that meta-ti is used
> >by users of your SoC, but not of your EVK/SK ?
> >
> 
> We do think a lot about external users of meta-ti, we even made a whole
> split out reference layer (meta-beagle) that we treat like a normal vendor
> layer so that we can more easily identify when we are making bad assumptions
> that only apply to our EVM/SK boards. Yes we do still sometimes get it wrong,
> and so we are very happy that you are providing the feedback that you have
> and helping point out those cases.
> 
> If I'm not mistaken the initramfs topic is the only outstanding case
> where what goes in the SoC file vs board files is still open and we
> should continue to try to find the best solution.

Again, there's been a lot of internal discussion and as Ryan mentioned 
earlier, we do believe it is very easy to disable initramfs by several 
different methods and hence still falls into a "sane default" bucket.

As an example, to extend what Andrew said, meta-beagle as a vendor layer 
already had to deal with several such instances, showcasing how easy it is 
to override meta-ti defaults, when you disagree with them:

https://git.yoctoproject.org/meta-ti/commit/?id=b07a909654ac542353a7108f7a82bd5e1e2d4a82
https://git.yoctoproject.org/meta-ti/commit/?id=92c2198288fb19ce6f92084687b42f7d0af2adc7

-- 
Denys

