Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C8FC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:46:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25721.1680183987585746113
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 06:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B22ED40C6C;
	Thu, 30 Mar 2023 13:46:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMywOGKM1yP6; Thu, 30 Mar 2023 13:46:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 940C240ACD;
	Thu, 30 Mar 2023 13:46:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6D5521637E5; Thu, 30 Mar 2023 09:45:49 -0400 (EDT)
Date: Thu, 30 Mar 2023 09:45:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: alexandre.belloni@bootlin.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <20230330134549.GX18050@denix.org>
References: <20230330131756f58d9658@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330131756f58d9658@mail.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 13:46:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16255

On Thu, Mar 30, 2023 at 03:17:56PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> Hello,
> 
> meta-ti is currently failing check-layer-nightly:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1264/steps/20/logs/stdio
> 
> ERROR: No recipes in default available for:
>   /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>   /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend

Thanks, this is being looked at already, hopefully will be addressed soon.

-- 
Denys

