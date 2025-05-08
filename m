Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F6FC3ABCA
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:13:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4392.1746731613984283888
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 May 2025 12:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0106740CC8;
	Thu,  8 May 2025 19:13:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiyGYRlC9lDL; Thu,  8 May 2025 19:13:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE74D40BA8;
	Thu,  8 May 2025 19:13:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0840C167B25; Thu,  8 May 2025 15:13:30 -0400 (EDT)
Date: Thu, 8 May 2025 15:13:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: sebastian.krahl@lacon.de, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup
 error
Message-ID: <20250508191329.GL18383@denix.org>
References: <20250506225349.GH18383@denix.org>
 <22590.1746596442506452473@lists.yoctoproject.org>
 <D9QZTXU4E67C.29PHLX3XMUQG3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9QZTXU4E67C.29PHLX3XMUQG3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 May 2025 19:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18547

On Thu, May 08, 2025 at 01:33:39PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> On Wed May 7, 2025 at 12:40 AM CDT, Sebastian via lists.yoctoproject.org wrote:
> > The actual target is to deploy a kiosk system running on chromium with a touch screen.
> >
> > At first I've tried to adopt my patches from kirkstone on scarthgap (device tree and uBoot) to setup the same configuration but it has failed at some missing libglesX.so.2 (haven't got the log at hand) and I was walking back to check when the diverge happens. So I've found out it is not specific related to my introduced chromium but it seems to be related to meta-ti.
> >
> > I'm not bound to X but I've hoped by using the core targets I'll get a window manager running like in kirkstone.
> >
> > I've attached the log from the debug output.
> >
> > Regards,
> >
> > Sebastian
> 
> [    3.524779] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11c332c)
> [    3.532676] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcdc on minor 0
> [    3.540717] tilcdc 4830e000.lcdc: [drm] Cannot find any crtc or sizes
> [    3.547695] tilcdc 4830e000.lcdc: [drm] Cannot find any crtc or sizes
> 
> These logs in particular are showing that tilcdc is loading and initializing the
> device but it's unable to detect any display. Nothing GFX related will be able
> to work, aside from offscreen rendering, in this case.
> 
> I'd double check overlays or other configurations depending on what connection
> method you are using for your display. You should probably take this to the
> beagleboard forums though as it seems to be more related to your particular
> setup.

I would also suggest trying to run a build for "am335x-evm" MACHINE, which 
is a superset for this SoC that also supports BeagleBone Black (and others). 
As that build uses the latest TI 6.12 BSP, so would be interesting to see if 
the display gets detected properly there.

-- 
Denys

