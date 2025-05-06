Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECC9C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 22:54:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.826.1746572032928902993
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 15:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 55ED040CBD;
	Tue,  6 May 2025 22:53:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yJhblxUvTMu; Tue,  6 May 2025 22:53:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E13E40CBA;
	Tue,  6 May 2025 22:53:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E319E16793C; Tue,  6 May 2025 18:53:49 -0400 (EDT)
Date: Tue, 6 May 2025 18:53:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: sebastian.krahl@lacon.de, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup
 error
Message-ID: <20250506225349.GH18383@denix.org>
References: <4weC.1746543468071238638.sYyH@lists.yoctoproject.org>
 <20250506162944.GC18383@denix.org>
 <D9PEV9NDIIDO.AP7Z9507B59N@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9PEV9NDIIDO.AP7Z9507B59N@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 22:54:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18538

On Tue, May 06, 2025 at 04:55:20PM -0500, Randolph Sapp wrote:
> On Tue May 6, 2025 at 11:29 AM CDT, Denys Dmytriyenko wrote:
> > + Randolph
> >
> > Unlike yocto-bsp, which uses vanilla mainline kernel with unaccelerated 
> > framebuffer, meta-ti by default enables accelerated graphics with out-of-tree 
> > drivers and user-space GLES libraries - SGX in case of Beaglebone and AM335x.
> >
> > When meta-ti migrated from 6.1 kernel to 6.6, I believe X11 support was 
> > dropped. It should still be possible to fall back to unaccelerated framebuffer 
> > and get X11 working, but that's not something that is configured nor tested in 
> > meta-ti.
> 
> This was not a result of a kernel change, it was due to a Yocto lts version
> change. A lot of layers use a common PACKAGECONFIG pattern that configures
> packages to use Desktop GL instead of GLES when opengl and x11 distro features
> are enabled. Arago took a hard stance that we will disable x11 to avoid
> reconfiguring numerous packages for partial acceleration under x11. Users can
> try it, but they will need to be careful when configuring things.

I thought some x11 specifics were dropped over a year ago from umlibs/DDK, 
which is in meta-ti and not specific to Arago...

But in general I agree that this can be reconfigured with unaccelerated x11 
for anyone adventurous enough :)


> > On Tue, May 06, 2025 at 07:57:48AM -0700, Sebastian via lists.yoctoproject.org wrote:
> >> I've tested meta-ti for kirkstone the xserver starts up correctly into an X 
> >> session.
> >> 
> >> With meta-ti for scarthgap it fails. As it looks for a /dev/fb device which 
> >> is not present.
> 
> Can you elaborate on this? Missing framebuffer devices is actually a display
> controller related issue. If you have a splash screen then some fb device is
> being registered. What device is this for?

That's Beaglebone Black. But more logs from the reporter could be helpful.


> >> Aside of this, with kirkstone and scarthgap in yocto-bsp and 
> >> beaglebone-yocto it works in both cases.
> >> 
> >> The framebuffer is filled up by the splash screen also in powering down.
> >> 
> >> What am I missing?
> >> 
> >> What info to supply?
> >> 
> >> Regards,
> >> 
> >> Sebastian

