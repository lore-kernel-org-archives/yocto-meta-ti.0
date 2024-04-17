Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B63AC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:37:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23439.1713382665634286241
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 12:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D5DEB40C7B;
	Wed, 17 Apr 2024 19:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZiREE4MUbzq; Wed, 17 Apr 2024 19:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7BF040A0B;
	Wed, 17 Apr 2024 19:37:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E0B2163F21; Wed, 17 Apr 2024 15:37:43 -0400 (EDT)
Date: Wed, 17 Apr 2024 15:37:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Katu Txakur <katutxakurra@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] gpiochip order unexpected, device tree gpio0 becomes
 /dev/gpiochip3
Message-ID: <20240417193743.GS28791@denix.org>
References: <Ku97.1713361142125953430.tHf7@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ku97.1713361142125953430.tHf7@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 19:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17590

On Wed, Apr 17, 2024 at 06:39:02AM -0700, Katu Txakur wrote:
> Hi,
> 
> I've built a, Yocto scarthgap, core-image-minimal for the 
> machine=beaglebone. When I booted what it's defined as gpio0 in the device 
> tree, it becomes /dev/gpiochip3. The rest are in order.
> This also happened using the beaglebone-yocto machine.
> This also happened using the beaglebone-yocto machine in Yocto kirkstone 
> branch.

man udev

| udev supplies the system software with device events, manages permissions 
| of device nodes and may create additional symlinks in the /dev/ directory, 
| or renames network interfaces. The kernel usually just assigns unpredictable 
| device names based on the order of discovery. Meaningful symlinks or network 
| device names provide a way to reliably identify devices based on their 
| properties or current configuration. 

You can check which bus, device or address a specific dev node corresponds to:

udevadm info /dev/gpiochip3

More details are in the corresponding entries of the virtual /sys filesystem.

-- 
Denys

