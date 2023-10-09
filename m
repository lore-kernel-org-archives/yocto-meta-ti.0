Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF8BCD6133
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 20:03:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.73892.1696881830220891205
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 13:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 48AC440C81;
	Mon,  9 Oct 2023 20:03:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MfqA1Y3w6ds1; Mon,  9 Oct 2023 20:03:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B44940C3E;
	Mon,  9 Oct 2023 20:03:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E66B2163CD8; Mon,  9 Oct 2023 16:03:43 -0400 (EDT)
Date: Mon, 9 Oct 2023 16:03:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: praneeth@ti.com
Cc: Ravi Gunasekaran <r-gunasekaran@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com, srk@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH v3 0/2] Remove PRU Ethernet
 firmwares for legacy devices
Message-ID: <20231009200343.GC2408@denix.org>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <41d3e554-c95b-470a-97a5-04e46aa5fca1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41d3e554-c95b-470a-97a5-04e46aa5fca1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 20:03:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17083

On Mon, Oct 09, 2023 at 12:23:08PM -0500, praneeth via lists.yoctoproject.org wrote:
> 
> 
> On 10/9/2023 2:09 AM, Ravi Gunasekaran wrote:
> >Linux kernel 6.1 does not have support for PRU-ICSSM driver.
> >So remove packaging of all the PRU-ICSSM firmwares for kernel 6.1
> >based SDKs.
> >
> >In the v2 version, it was suggested to have the changes in the SDK layer.
> >But after discussion with meta-ti(Ryan) and meta-processor-sdk(Gyan)
> >maintainers, it was decided to introduce a new .inc file that removes the
> >packaging of the firmware and include it in the kernel recipes that don't
> >have support for PRU-ICSSM in meta-ti. This series attempts to take that
> >approach.
> >
> >The support for PRU-ICSSM driver will be available in mainline and TI kernel
> >towards the end of 2024. So until such time, this approach will be followed.
> >
> >v2:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908113836.12413-1-r-gunasekaran@ti.com/
> >v1:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908114439.13213-1-r-gunasekaran@ti.com/
> 
> For future reference, please do not post internal links.
> Instead, use https://lists.yoctoproject.org/g/meta-ti/messages

Or public Patchwork:
https://patchwork.yoctoproject.org/project/ti/patch/20230908114439.13213-1-r-gunasekaran@ti.com/

-- 
Denys

