Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8734C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 17:39:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.81196.1674236395246594635
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 09:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 025BE40C90;
	Fri, 20 Jan 2023 17:39:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuCfpaGRDFqs; Fri, 20 Jan 2023 17:39:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBA0640C06;
	Fri, 20 Jan 2023 17:39:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6B330163700; Fri, 20 Jan 2023 12:39:29 -0500 (EST)
Date: Fri, 20 Jan 2023 12:39:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org, khasim@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] ti-graphics: enable GPU for
 am62axx-evm
Message-ID: <20230120173929.GO22689@denix.org>
References: <20230120141852.21647-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120141852.21647-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 17:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15611

On Fri, Jan 20, 2023 at 07:48:52PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> 
> The am62axx device has no hardware accelerated GPU. But enabling "GPU"
> to allow applications get access to GPU rendering APIs.

This description doesn't make much sense...

Anyway, I know you are trying to enable software rendering in Mesa for this 
GPU-less platform. But hacking the MACHINE_FEATURES list to pretend this 
platform has a GPU is totally incorrect!

What you are trying to do here should be done on the distro side, not in BSP! 
If there are packagegroups that key off of this machine feature, they need to 
be adjusted to allow pulling necessary graphics stack pieces to enable this 
software rendering use case.


> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  conf/machine/am62axx-evm.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
> index e7a59d2e..7fcec3f7 100644
> --- a/conf/machine/am62axx-evm.conf
> +++ b/conf/machine/am62axx-evm.conf
> @@ -4,6 +4,8 @@
>  
>  require conf/machine/include/am62axx.inc
>  
> +MACHINE_FEATURES += "gpu"
> +
>  KERNEL_DEVICETREE = " \
>      ti/k3-am62a7-sk.dtb \
>      ti/k3-am62a7-fpdlink-ov2312-0-0.dtbo \
> -- 
> 2.17.1

