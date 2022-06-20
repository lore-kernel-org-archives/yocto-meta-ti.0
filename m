Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E92C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 19:23:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24358.1655752982989882868
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 12:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6DD5740C47;
	Mon, 20 Jun 2022 19:23:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NPPIIGpjceQ; Mon, 20 Jun 2022 19:23:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4B01540951;
	Mon, 20 Jun 2022 19:22:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 66A1117497D; Mon, 20 Jun 2022 15:22:58 -0400 (EDT)
Date: Mon, 20 Jun 2022 15:22:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Message-ID: <20220620192258.GZ9834@denix.org>
References: <20220609145909.15483-1-afd@ti.com>
 <293f769d-d60e-4945-4f0b-fbed2dbbb4b7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293f769d-d60e-4945-4f0b-fbed2dbbb4b7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jun 2022 19:23:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14834

On Mon, Jun 20, 2022 at 02:11:55PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 6/9/2022 9:59, Andrew Davis wrote:
> >From: Manorit Chawdhry <m-chawdhry@ti.com>
> >
> >IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
> >incomplete binaries in /boot and the naming of the binaries were not
> >correct.
> >
> >Fixes /boot partition for HS devices.
> >
> >Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> >[afd: Extended fix to all HS platforms]
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >
> >Changes from v2:
> >  - Added UBOOT_SYMLINK to fix missing u-boot.img image
> >
> >  conf/machine/am64xx-hs-evm.conf | 3 +--
> >  conf/machine/am65xx-hs-evm.conf | 3 +--
> >  conf/machine/include/k3.inc     | 5 +++--
> >  conf/machine/j7-hs-evm.conf     | 3 +--
> >  conf/machine/j7200-hs-evm.conf  | 3 +--
> >  5 files changed, 7 insertions(+), 10 deletions(-)
> 
> 
> I am getting build errors for several of the HS platforms related to
> this change.  The meta-arago/meta-arago-distro/recipces-core/images/tisdk-core-bundle.bb
> recipe is failing because the u-boot-<MACHINE>.img file is not in
> the deploy/images directory.
> 
> When I drop the patch all of the builds work correctly.

Which platforms are failing?

-- 
Denys

