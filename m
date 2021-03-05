Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1245.1614974649028811982
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 12:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5918338C07CE
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4339C40BEC
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 20:04:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Wx3HXgrnCNb for <meta-ti@yoctoproject.org>;
	Fri,  5 Mar 2021 20:04:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 30FF740AB7
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 20:04:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 88711174525; Fri,  5 Mar 2021 15:04:05 -0500 (EST)
Date: Fri, 5 Mar 2021 15:04:05 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Subject: Re: [arago-commits] Praneeth Bajjuri : ti-rtos: Update path for firmwares on j7200
Message-ID: <20210305200405.GW4892@denix.org>
References: <20210305172351.2ADC4529B6@arago-project.org>
MIME-Version: 1.0
In-Reply-To: <20210305172351.2ADC4529B6@arago-project.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

Haven't seen this patch on the list yet...


On Fri, Mar 05, 2021 at 05:23:51PM +0000, Arago Project git wrote:
> Module: meta-ti
> Branch: dunfell-next
> Commit: b93298f444b7180c88f30b33240394a4e38241cb
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b93298f444b7180c88f30b33240394a4e38241cb
> 
> Author: Praneeth Bajjuri <praneeth@ti.com>
> Date:   Fri Mar  5 11:17:26 2021 -0600
> 
> ti-rtos: Update path for firmwares on j7200
> 
> Between j7200 firmware tags 07.03.00.10 to 07.03.00.16
> the downloadable weburl link changed
> from *processor-sdk-rtos-jacinto7 to processor-sdk-rtos-j7200

Ok, this actually explains what was going on and what Nishanth was trying to 
fix.


> This patch is to fix the recipe to pick the firmware from the
> expected location.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> 
>  DEFAULT_RTOS_WEBLINK = "undefined"
>  DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> +DEFAULT_RTOS_WEBLINK_j7200 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-j7200/firmware/${CORESDK_RTOS_VERSION}"

That won't work, need to use _j7200-evm, as there's no _j7200 override 
defined, as explained here:
https://lists.yoctoproject.org/g/meta-ti/message/13488


>  DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
>  DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"

-- 
Denys
