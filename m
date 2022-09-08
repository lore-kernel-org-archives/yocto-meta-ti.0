Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F0C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 20:25:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1147.1662668703444262887
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 13:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D62E740D1F;
	Thu,  8 Sep 2022 20:25:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gO0Qycp7W3Gj; Thu,  8 Sep 2022 20:25:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA7FF40D0A;
	Thu,  8 Sep 2022 20:25:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C1CDB1749CE; Thu,  8 Sep 2022 16:24:59 -0400 (EDT)
Date: Thu, 8 Sep 2022 16:24:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Radoslav Pesek <radoslav.pesek@microstep-mis.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] devtool modify linux-ti-mainline gives
 defconfig_builder.sh: not found
Message-ID: <20220908202459.GM18429@denix.org>
References: <b88b1eb3-8dc5-e1ef-3697-1e7d05e5b850@microstep-mis.com>
 <fda6f93c-257c-88c5-4ec3-d793e78552a6@microstep-mis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda6f93c-257c-88c5-4ec3-d793e78552a6@microstep-mis.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Sep 2022 20:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15010

Sorry for the delay, finally had a chance to look into this. Could you please 
try this patch:

https://patchwork.yoctoproject.org/project/ti/patch/20220908202054.3800302-1-denis@denix.org/


On Fri, Aug 19, 2022 at 04:16:44PM +0200, Radoslav Pesek wrote:
> Hello,
> 
> I'm trying to update kernel configuration using devtool modify
> linux-ti-mainline, but when I do devtool menuconfig
> linux-ti-mainline or devtool build linux-ti-mainline (or anything
> that involves configure step, I guess), I get:
> 
> /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/5.15+git999-r22b/temp/run.do_configure.23628:
> 118: /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/5.15+git999-r22b/ti-upstream-tools/config/defconfig_builder.sh:
> not found
> 
> Building kernel works flawlessly running bitbake linux-ti-mainline.
> 
> The configure step seems to delete original source tree under /home/radoslavp/oe_bbb/build_bbb/tmp-glibc/work/beaglebone-oe-linux-gnueabi/linux-ti-mainline/
> where ti-upstream-tools normally resides and replaces it with
> 5.15+git999-r22b, where it is missing - for some reason it's not
> unpacked there or under workspace/sources where the source tree is
> moved after devtool modify. Not sure if this is expected (I'm
> beginner regarding yocto).
> 
> I'm on dunfell, last commit. I made my own distro, maybe I'm missing
> something somewhere.
> 
> Thanks for any hint, google didn't help,
> 
> Rado.
> 
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

