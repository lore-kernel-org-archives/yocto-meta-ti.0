Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016ADC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 18:30:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.56266.1670351395694439920
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 10:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9078140B86;
	Tue,  6 Dec 2022 18:29:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0w5tbHMv3RD; Tue,  6 Dec 2022 18:29:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 701B140A28;
	Tue,  6 Dec 2022 18:29:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6D8221636A6; Tue,  6 Dec 2022 13:29:43 -0500 (EST)
Date: Tue, 6 Dec 2022 13:29:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: alexandre.belloni@bootlin.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20221206182943.GZ22689@denix.org>
References: <Y49uhpn5sKBKaElF@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y49uhpn5sKBKaElF@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 18:30:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15416

On Tue, Dec 06, 2022 at 05:32:06PM +0100, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#builders/121/builds/1046/steps/19/logs/stdio
> 
> Parsing recipes...ERROR: ParseError at /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could not include required file recipes-ti/includes/ti-paths.inc
> ERROR: Parsing halted due to errors, see error messages above

The fix is already queued up in patchwork:
https://patchwork.yoctoproject.org/project/ti/patch/20221118210749.2462011-1-denis@denix.org/

-- 
Denys

