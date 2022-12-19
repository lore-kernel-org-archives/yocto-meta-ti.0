Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DDBC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 21:32:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.34882.1671485572009041285
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Dec 2022 13:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7271340C5D;
	Mon, 19 Dec 2022 21:32:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XO2mpLqyMXkq; Mon, 19 Dec 2022 21:32:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37BDF400CF;
	Mon, 19 Dec 2022 21:32:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4C6191636B0; Mon, 19 Dec 2022 16:32:35 -0500 (EST)
Date: Mon, 19 Dec 2022 16:32:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
Message-ID: <20221219213235.GX22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
 <MY9NMR.KA5B9Y124SPL2@ti.com>
 <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
 <J3EWMR.6Q68HWA4M8303@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <J3EWMR.6Q68HWA4M8303@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 Dec 2022 21:32:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15493

On Wed, Dec 14, 2022 at 02:26:07PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com>
> wrote:
> >On 12/9/22 4:18 PM, Sapp, Randolph wrote:
> >>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis
> >><afd@ti.com <mailto:afd@ti.com>> wrote:
> >>>Since the UM driver now RDEPENDS on the KM, could we also drop this
> >>>last line everywhere?
> >>
> >>Nope, we still need the one preferred provider line to indicate
> >>that rogue graphics are present. Now this could be replaced by a
> >>rogue-graphics machine feature instead if that's preferable, but
> >>something will need to signal the mesa switch.
> >>
> >
> >New machine feature sounds like the better route since it changes
> >the content of a package.
> >Using PREFERRED_PROVIDER for that doesn't seem right.
> 
> Fair enough, v4 will roll back to that method.

Can you please explain why existing machine feature cannot be re-used and a 
new one is needed here? Do you plan to use both side-by-side?


> On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com>
> wrote:
> >
> >>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis
> >><afd@ti.com <mailto:afd@ti.com>> wrote:
> >>>Bash? Are we sure we need that?
> >>
> >>Yes. The System V init script still needs it. Now could we look
> >>at removing that init script? Sure, so long as the device probe
> >>still works. What is actually taking care of that right now?
> >>It's not udev is it?
> >>
> >
> >The module/device probe is automatic now. At least for SGX that
> >script exists only
> >to run the single command "pvrsrvctl --start --no-module" which
> >loads some microcode.
> >We can have yocto build that service for us to run the command,
> >IIRC it will make
> >it into a systemd or sysv service for us based on what kinda
> >distro we are building.
> 
> If that's true rogue can drop it entirely. Updating to do that now.
> 
> On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com>
> wrote:
> >
> >>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis
> >><afd@ti.com <mailto:afd@ti.com>> wrote:
> >>>"ldflags already-stripped" should be the only skips we still need.
> >>
> >>Dev-so is required because of some of the symbolic links that
> >>are shipped. I'm fine dropping arch unless that breaks
> >>something.
> >>
> >>
> >
> >Ah, think that is /usr/lib/dri/pvr_dri.so, odd name, but yeah that
> >skip can
> >stay then. Lets try to drop "arch" at least.
> 
> Just found out the MIPS/RISC firmware bin trips the arch check so
> that has to stay.
> 
> If you don't mind, take a look at the v3 revision. I'm experimenting
> with using the binary_package class there. Not really sure how I
> feel about it, but it's at least less lines & steps than this
> revision.

