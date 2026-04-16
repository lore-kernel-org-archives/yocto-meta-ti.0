Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE09F8A148
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 08:43:06 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8966.1776328981687398450
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 01:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=wwH9s1by;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8CB121F9E7;
	Thu, 16 Apr 2026 10:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776328978;
	bh=EAmOvIXYo46o5j3XSlNy77tLUcukmWTNZEKN2vdcmCM=; h=From:To:Subject;
	b=wwH9s1byCBXN0uXo58fDfDRT8Y9InBUTDpOnwk5rqikcxAP5M4N+B6JtfuvEBpG0W
	 5C7Rs2T8Wm+B2/zEefeK4k9lr6i6CtxvfywA8UZWVIO0qAyVNVlCNjx261gZYWyv7M
	 YnHyUuW5UTZPcxJa34sbQLEBUH8URPOAUBWpSJdO3X+AkkRaQxfzl9NHTBeGm+1wPA
	 POeFZzo1f4NkbjwQ0wZgZdh2sh1Tc4nHdJcoqTBwAnco5qpxALbmZN6vv8Oa9FYHTI
	 ShCjxBUfNGo1QqS5rcKt19Tdy+dTxu3u8LNOjFgcxeQTss2fwtswHyY0OM4nL3Grw4
	 ED9kiuyRLCbvw==
Date: Thu, 16 Apr 2026 10:42:54 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Denys Dmytriyenko <denis@denix.org>
Cc: afd@ti.com, Francesco Dolcini <francesco@dolcini.it>,
	Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
Message-ID: <20260416084254.GA27930@francesco-nb>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
 <20260415115820.GA26023@francesco-nb>
 <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
 <20260415211059.GD4186@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415211059.GD4186@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 08:43:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19856

On Wed, Apr 15, 2026 at 05:10:59PM -0400, Denys Dmytriyenko wrote:
> On Wed, Apr 15, 2026 at 09:43:31AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> > On 4/15/26 6:58 AM, Francesco Dolcini wrote:
> > >On Wed, Apr 15, 2026 at 01:41:04PM +0200, Franz Schnyder wrote:
> > >>From: Franz Schnyder <franz.schnyder@toradex.com>
> > >>
> > >>The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
> > >>include, which is therefore used for all the J784s4-based machines.
> > >>That firmware seems to be developed specifically for the EVM, as it
> > >>takes control of pins used for the Ethernet board setup on the EVM. On
> > >>non-EVM boards, like the Aquila-AM69, those signals are used for other
> > >>functions, so enabling the firmware in the SoC include is too broad
> > >>and breaks functionality.
> > >>
> > >>Move the machine-essential recommend from the SoC include
> > >>to the EVM configuration.
> > >>
> > >>Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > >
> > >This seems to be the 3rd time, in a relatively short time, in which
> > >we are affected by your decision to put into the SoC file, configuration
> > >that are not about the SOC
> > >
> > >  1 - the initramfs topic [https://lore.kernel.org/yocto-meta-ti/78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com/]
> > >  2 - the console uart [https://lore.kernel.org/yocto-meta-ti/4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com/]
> > 
> > I thought we solved this one by making the console selection more easily
> > updated in the board files. If we want to go one step further and remove
> > the defaults from the SoC level and always select the board specific UART
> > in each board config I wouldn't oppose that either.
> 
> I was going to reply to the end of the thread, but this entire section of the 
> discussion was completely removed, hence I will do it here.
> 
> We've discussed this quite a lot internally and we ended up going with what 
> Andrew is saying here.
> 
> There's this concept of "sane defaults" that covers most of the cases and it 
> makes sense to set them as such. We have tens of platforms using this default 
> UART configuration and it makes perfect sense to set it once, instead of 
> copying the same over and over again - it is a maintenance pitfall. But we 
> also make sure to allow very easy and effortless overriding of this default, 
> if, for some reason, a specific board implementation doesn't follow this 
> default.
> 
> There are lots and lots of similar examples when an upstream layer, including 
> OE-Core, sets a sane default that may not match your configuration, but as 
> long as it allows easy override downstream, it's not the end of the world.
> 
> 
> > >  3 - this firmware
> > >
> > 
> > This firmware was a miss on our part, we were not aware that it was
> > not generic for all boards using this SoC but instead does some EVM
> > specific pinmuxing. I've looked into the FW source and can see where
> > that happens, I'll work to see how we can fix that. In the mean time
> > I agree then we should move this firmware to the board level (as the
> > patch does).
> 
> Here I agree with Andrew - it was an oversight and if it does per-board 
> pinmuxing, then it belongs in a board config. That said, please address my 
> comment for the patch before merging.
> 
> 
> > >Can I ask TI once more to rethink this considering that meta-ti is used
> > >by users of your SoC, but not of your EVK/SK ?
> > >
> > 
> > We do think a lot about external users of meta-ti, we even made a whole
> > split out reference layer (meta-beagle) that we treat like a normal vendor
> > layer so that we can more easily identify when we are making bad assumptions
> > that only apply to our EVM/SK boards. Yes we do still sometimes get it wrong,
> > and so we are very happy that you are providing the feedback that you have
> > and helping point out those cases.
> > 
> > If I'm not mistaken the initramfs topic is the only outstanding case
> > where what goes in the SoC file vs board files is still open and we
> > should continue to try to find the best solution.
> 
> Again, there's been a lot of internal discussion and as Ryan mentioned 
> earlier, we do believe it is very easy to disable initramfs by several 
> different methods and hence still falls into a "sane default" bucket.
> 
> As an example, to extend what Andrew said, meta-beagle as a vendor layer 
> already had to deal with several such instances, showcasing how easy it is 
> to override meta-ti defaults, when you disagree with them:
> 
> https://git.yoctoproject.org/meta-ti/commit/?id=b07a909654ac542353a7108f7a82bd5e1e2d4a82
> https://git.yoctoproject.org/meta-ti/commit/?id=92c2198288fb19ce6f92084687b42f7d0af2adc7

Denys, I understand your need to avoid duplication, I understand and I
agree with it, and I just disagree on your solution and I think
that is just wrong from an architecture point of view.

Mixing the concept that is something is shared between multiple boards
to the fact that is a default at the SoC level is plain wrong.

There is no such thing as a default console uart in the TI SoC reference
manual.

And the concept of pushing the initramfs into something that depends on
the HW is event worst, this is purely a SW decision. Our machine are
used in setup with/without initramfs, and forcing it at the SoC
level is technically wrong.

With that said, you made very clear what is your decision, I can just be
as clear and state that this decision is making the life of us, a TI
customer, way more painful than it should be.

And we'll deal with it, no need to explain us how to work with OE, we
are aware of it and we can work-around it in our layers.

Francesco


