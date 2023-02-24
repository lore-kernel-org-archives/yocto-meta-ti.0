Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E40C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:14:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14508.1677233692097734631
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6ADDE40C46;
	Fri, 24 Feb 2023 10:14:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLVLigcwEt2t; Fri, 24 Feb 2023 10:14:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1466A40C06;
	Fri, 24 Feb 2023 10:14:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 06798163763; Fri, 24 Feb 2023 05:14:21 -0500 (EST)
Date: Fri, 24 Feb 2023 05:14:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Danny <dadleyy@gmail.com>, danny@sizethreestudios.com,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"denys@konsulko.com" <denys@konsulko.com>, reatmon@ti.com
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
Message-ID: <20230224101420.GL22689@denix.org>
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
 <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
 <174689B75462BC7D.19957@lists.yoctoproject.org>
 <CAOCHtYid579_w9-X1vRC7zO1emmpwCYvcLi5xFWOjMQsFRxm9w@mail.gmail.com>
 <CAOCHtYifHusHaeb7YmvRcgf7B8AfV2yyTdYAPCc3o8K5wkiyYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCHtYifHusHaeb7YmvRcgf7B8AfV2yyTdYAPCc3o8K5wkiyYA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:14:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15953

On Thu, Feb 23, 2023 at 01:23:50PM -0600, Robert Nelson wrote:
> On Thu, Feb 23, 2023 at 1:21 PM Robert Nelson <robertcnelson@gmail.com> wrote:
> >
> > Thinking this would fix both?
> >
> > ```
> > SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;tag=5.10.145-ti-r55"
> > SRCREV = "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
> > ```
> >
> > Another step could be to move 5.10.145-ti-r55 -> to a variable:
> >
> > lots of tags to choose from:
> > https://git.beagleboard.org/beagleboard/linux/-/tags
> 
> K3 only arm64 tags can be filtered via:
> 
> https://git.beagleboard.org/beagleboard/linux/-/tags?sort=updated_desc&search=ti-arm64
> 
> non arm64 are am335x/am57xx
> 
> Regards,
> -- 
> Robert Nelson
> https://rcn-ee.com/

Thanks, Robert. I'll take a look and update the recipe.

-- 
Denys

