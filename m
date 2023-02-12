Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ACAC61DA4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 00:24:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2213.1676161487967393404
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 11 Feb 2023 16:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C638D40C53;
	Sun, 12 Feb 2023 00:24:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFfG7cnnrfGg; Sun, 12 Feb 2023 00:24:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB28B40BEC;
	Sun, 12 Feb 2023 00:24:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 74D87163715; Sat, 11 Feb 2023 19:24:22 -0500 (EST)
Date: Sat, 11 Feb 2023 19:24:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Philip Balister <philip@balister.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Difference between beaglebone-ai64 and
 beaglebone-ai64-k3r5
Message-ID: <20230212002422.GI22689@denix.org>
References: <ee179ffa-ba74-be38-e519-b12d64e5a3bf@balister.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee179ffa-ba74-be38-e519-b12d64e5a3bf@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 12 Feb 2023 00:24:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15815

On Sat, Feb 11, 2023 at 01:01:00PM -0500, Philip Balister wrote:
> I'm looking at the recent update to meta-ti/kirkstone that appears to
> add support for the beaglebone ai64 and I am curious why there are two
> machines added. I'm going to see if this works ASAP!

TI K3 family of SoCs utilize a heterogeneous multicore architecture, hence the 
bootflow is quite convoluted... You can read all the details from the official 
docs, also referenced from below links. But, basically, before getting into 
Linux on the main Aarch64 Cortex-A72 cores, it goes through init/boot and 
loads and runs different pieces on 32-bit MCU Cortex-R5F core.

Which means, from OE perspective, you need to be able to build 64-bit Linux 
stack as well as 32-bit bootloader and system firmware. And that means you 
need 2 different toolchains. That is done with OE multiconfig and as a 
byproduct, 2 machine configs. You normally don't use -k3r5 machine config 
directly, as it will be automatically handled by multiconfig dependencies to 
build the necessary MCU bootloader pieces...

You may want to check the first commit that introduced this split:
https://git.yoctoproject.org/meta-ti/commit/?id=f814840465358a6b5429ad20165742ac6e6e6a29

Also, the common k3r5.inc file is rather self-explanatory:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/include/k3r5.inc
https://patchwork.yoctoproject.org/project/ti/patch/20230211234205.3042518-1-denis@denix.org/

-- 
Denys

