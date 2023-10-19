Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495ECCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:00:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25473.1697716821691142415
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 05:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C88D540D75;
	Thu, 19 Oct 2023 12:00:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c6P7wzjjlhou; Thu, 19 Oct 2023 12:00:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3625740D13;
	Thu, 19 Oct 2023 12:00:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3B411163D0A; Thu, 19 Oct 2023 08:00:10 -0400 (EDT)
Date: Thu, 19 Oct 2023 08:00:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-mantena@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, vigneshr@ti.com,
	praneeth@ti.com, a-limaye@ti.com, u-kumar1@ti.com
Subject: Re: [meta-ti][kirkstone][PATCH 0/1] Update BBAI64 aarch64 target
 version
Message-ID: <20231019120010.GO2408@denix.org>
References: <20231019113938.1657179-1-p-mantena@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019113938.1657179-1-p-mantena@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Oct 2023 12:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17142

On Thu, Oct 19, 2023 at 05:09:37PM +0530, Prasanth Babu Mantena via lists.yoctoproject.org wrote:
> The following patch is to update the kernel version of linux-bb.org from 5.10 to 6.1 
> and is verified on BBAI64 board for successful booting of kernel.

NAK.

I'm sitting on the same changes for a few weeks now, waiting for the 
corresponding EEPROM fix in U-boot. Otherwise it doesn't boot. Was this 
tested with an old U-boot?


> The existing dtbs are added to the machine conf file. Further addition
> of dtb overlays to the tree requires them to be added to the machine conf
> file. I am not working on adding the overlays of BBAI64 to the kernel.
> 
> 
> Prasanth Babu Mantena (1):
>   linux-bb.org: update to 6.1.46 for aarch64 targets
> 
>  meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 72 ++++++-------------
>  .../recipes-kernel/linux/linux-bb.org_git.bb  |  8 +--
>  2 files changed, 24 insertions(+), 56 deletions(-)
> 
> -- 
> 2.33.3

