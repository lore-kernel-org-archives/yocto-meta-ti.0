Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6FEC636D6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 00:41:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.31026.1676940090434108463
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 16:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10F4740C30;
	Tue, 21 Feb 2023 00:41:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsV6_BDRkINH; Tue, 21 Feb 2023 00:41:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E92D240A3F;
	Tue, 21 Feb 2023 00:41:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D9065163760; Mon, 20 Feb 2023 19:41:01 -0500 (EST)
Date: Mon, 20 Feb 2023 19:41:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: alexandre.belloni@bootlin.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20230221004101.GN22689@denix.org>
References: <Y/P/D7aUrHpMi5mR@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/P/D7aUrHpMi5mR@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 00:41:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15887

On Tue, Feb 21, 2023 at 12:15:27AM +0100, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1191/steps/20/logs/stdio
> 
> ERROR: No recipes in default available for:
>   /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
>   /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend

Thank you for the report! I do believe there was an accidental merge of 
work-in-progress changes that were NOT meant to be merged to master branch. 
Sorry for the noise.

-- 
Denys

