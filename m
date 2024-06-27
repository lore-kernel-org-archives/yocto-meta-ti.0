Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0989DC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 19:51:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1478.1719517905115201669
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 12:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02C8F40CD0;
	Thu, 27 Jun 2024 19:51:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKza8Y_xikYj; Thu, 27 Jun 2024 19:51:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4B8D640CB7;
	Thu, 27 Jun 2024 19:51:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 57E76163FCE; Thu, 27 Jun 2024 15:51:32 -0400 (EDT)
Date: Thu, 27 Jun 2024 15:51:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: vaishnav.a@ti.com
Cc: reatmon@ti.com, praneeth@ti.com, denys@konsulko.com,
	meta-ti@lists.yoctoproject.org, u-kumar1@ti.com, a-limaye@ti.com,
	m-chawdhry@ti.com, j-luthra@ti.com, r-ravikumar@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH 0/3] conf: machine:
 j784s4/am68/am69 : Pick reused CSI overlays
Message-ID: <20240627195132.GK18231@denix.org>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627083431.1096889-1-vaishnav.a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jun 2024 19:51:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17814

Does this apply to master?


On Thu, Jun 27, 2024 at 02:04:28PM +0530, Vaishnav Achath via lists.yoctoproject.org wrote:
> CSI2 connectivity of J721E SK, AM68 SK and AM69 SK is similar and
> the camera overlays can be reused, this series adds the necessary
> changes to pick the reused overlays across these platforms.
> 
> Thanks and Regards,
> Vaishnav
> 
> Vaishnav Achath (3):
>   conf: machine: j784s4-evm: Pick overlays for CSI2 and FPD-Link
>   conf: machine: am68-sk: Pick overlays for IMX219 and FPD-Link
>   conf: machine: am69-sk: Pick overlays for IMX219 and FPD-Link
> 
>  meta-ti-bsp/conf/machine/am68-sk.conf    | 2 ++
>  meta-ti-bsp/conf/machine/am69-sk.conf    | 3 +++
>  meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
>  3 files changed, 7 insertions(+)
> 
> -- 
> 2.34.1

