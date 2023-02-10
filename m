Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F3AC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 21:23:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6578.1676064228844115021
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 13:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F07F940C06;
	Fri, 10 Feb 2023 21:23:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSteL1ZRrOHQ; Fri, 10 Feb 2023 21:23:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CCDCF40BA8;
	Fri, 10 Feb 2023 21:23:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 26CE9163758; Fri, 10 Feb 2023 16:23:22 -0500 (EST)
Date: Fri, 10 Feb 2023 16:23:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/8] ti-rtos-firmware: Use a
 table instead of a list of copy commands
Message-ID: <20230210212322.GE22689@denix.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-6-afd@ti.com>
 <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 21:23:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15808

On Thu, Feb 09, 2023 at 07:29:46AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 2/7/2023 17:42, Andrew Davis wrote:
> >Using a table makes it easier to see what firmware is included with
> >each machine build. It also helps prevent errors here.
> 
> I like the table.  It makes it clearer to see what is available on
> which platform.  Nice change.

Yeah, nicely done!
With the change I just realized that J721e is the only K3 SoC/platform with 
C66 (and C7 at the same time) cores, interesting... :)


> >Since the same functions run across machines we now sign all the firmware
> >without needing to add a new signing function for each new machine.
> >
> >Another fix is that we install the DM firmware to the deploy directory
> >for all machines that use need it. This was added for J7x machines
> >but missed for AM62x.

