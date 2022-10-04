Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D30C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:42:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.15389.1664912562588851141
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A34640D47;
	Tue,  4 Oct 2022 19:42:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuOASvdLl9Ln; Tue,  4 Oct 2022 19:42:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CA8640D42;
	Tue,  4 Oct 2022 19:42:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4A986174A19; Tue,  4 Oct 2022 15:42:38 -0400 (EDT)
Date: Tue, 4 Oct 2022 15:42:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH 61/65] conf: machine: Make
 multi-certificate image the default
Message-ID: <20221004194238.GZ18429@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
 <20220913035541.2364351-62-denis@denix.org>
 <91d1794f-ed22-7f0f-ad4a-b33ba93500f9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d1794f-ed22-7f0f-ad4a-b33ba93500f9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15106

On Tue, Oct 04, 2022 at 02:38:11PM -0500, Andrew Davis wrote:
> On 9/12/22 10:55 PM, Denys Dmytriyenko wrote:
> >From: Andrew Davis <afd@ti.com>
> >
> >Only the first two K3 devices do not support multi-cert boot so
> >lets make multi-cert the default and only add back sysfw.itb
> >for these two devices.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >Reviewed-by: lines be preserved?
> 
> By who?..

That's how the original patch got merged :)

https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=038148a6d018c971e15a89c80192179fc04cf170

I'm guessing patchwork picked up part of our discussion.

https://patchwork.yoctoproject.org/project/ti/patch/20220801214007.25463-1-afd@ti.com/


> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

