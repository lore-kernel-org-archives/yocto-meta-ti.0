Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B64CC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:29:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.80735.1746548987175293038
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 09:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7752240CEA;
	Tue,  6 May 2025 16:29:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0rCArFOSiPH; Tue,  6 May 2025 16:29:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D68040CD3;
	Tue,  6 May 2025 16:29:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0FD0F1678F4; Tue,  6 May 2025 12:29:44 -0400 (EDT)
Date: Tue, 6 May 2025 12:29:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sebastian.krahl@lacon.de
Cc: meta-ti@lists.yoctoproject.org, rs@ti.com
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup
 error
Message-ID: <20250506162944.GC18383@denix.org>
References: <4weC.1746543468071238638.sYyH@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4weC.1746543468071238638.sYyH@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 16:29:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18535

+ Randolph

Unlike yocto-bsp, which uses vanilla mainline kernel with unaccelerated 
framebuffer, meta-ti by default enables accelerated graphics with out-of-tree 
drivers and user-space GLES libraries - SGX in case of Beaglebone and AM335x.

When meta-ti migrated from 6.1 kernel to 6.6, I believe X11 support was 
dropped. It should still be possible to fall back to unaccelerated framebuffer 
and get X11 working, but that's not something that is configured nor tested in 
meta-ti.


On Tue, May 06, 2025 at 07:57:48AM -0700, Sebastian via lists.yoctoproject.org wrote:
> I've tested meta-ti for kirkstone the xserver starts up correctly into an X 
> session.
> 
> With meta-ti for scarthgap it fails. As it looks for a /dev/fb device which 
> is not present.
> 
> Aside of this, with kirkstone and scarthgap in yocto-bsp and 
> beaglebone-yocto it works in both cases.
> 
> The framebuffer is filled up by the splash screen also in powering down.
> 
> What am I missing?
> 
> What info to supply?
> 
> Regards,
> 
> Sebastian

