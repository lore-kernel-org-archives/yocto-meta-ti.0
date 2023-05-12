Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C26C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 03:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15561.1683860456883002499
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 20:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A1E840C93;
	Fri, 12 May 2023 03:00:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FW1vWasZVa_S; Fri, 12 May 2023 03:00:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D12140C24;
	Fri, 12 May 2023 03:00:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 747D91638CA; Thu, 11 May 2023 23:00:04 -0400 (EDT)
Date: Thu, 11 May 2023 23:00:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	Meta-TI List <meta-ti@lists.yoctoproject.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti] [kirkstone-next][PATCH] meta-ti: conf:
 am62xx-lp-evm: Fix DT and DT prefixes
Message-ID: <20230512030004.GD9226@denix.org>
References: <20230505083824.27085-1-a-bhatia1@ti.com>
 <20230506014021.GI9226@denix.org>
 <b2ab2c02-05ab-b09a-a97e-8764846ca0f4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2ab2c02-05ab-b09a-a97e-8764846ca0f4@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 May 2023 03:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16525

On Thu, May 11, 2023 at 10:02:23AM +0530, Aradhya Bhatia wrote:
> Hi Denys
> 
> Thank you for reviewing the patch.
> 
> On 06-May-23 07:10, Denys Dmytriyenko wrote:
> > Couple minor comments regarding the subject tags:
> > 
> > 1. You want to specify the target release branch, such as "kirkstone", not the 
> > intermediate branches, like "*-wip" or "*-next".
> > 
> Yup, noted!
> 
> > 2. We want to keep master up-to-date and in most cases the change is quite 
> > straightforward and applies to both master and kirkstone, so it's best to 
> > specify that in the tag as "master/kirkstone". And testing against those 
> > branches is highly recommended! :)
> 
> Understood! This patch was tested for kirkstone, but not for master
> branch.
> 
> After your comment, I checked, and this patch does apply cleanly on
> master as well. However, I have not been able to find proper configs for
> oe-layer setup for the master branch, and manually changing the
> kirkstone config to point to master did not help either.
> 
> Do you have any suggestions on how I could test the patch on master?

If you use oe-layersetup scripts, then there are arago-kirkstone-config.txt 
and arago-master-config.txt config files available. Let us know if you see any 
issues.

-- 
Denys

