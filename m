Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA524C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 20:18:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.99582.1673641083332698471
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 12:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17C1F40C50;
	Fri, 13 Jan 2023 20:18:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oooujRobfcMV; Fri, 13 Jan 2023 20:18:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E0D9A40429;
	Fri, 13 Jan 2023 20:17:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BFDCF1636F8; Fri, 13 Jan 2023 15:17:40 -0500 (EST)
Date: Fri, 13 Jan 2023 15:17:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/7] conf: machine: Remove
 multi-certificate image comment
Message-ID: <20230113201740.GA22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <17324EC0684FFDBD.29066@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17324EC0684FFDBD.29066@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Jan 2023 20:18:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15565

Ping.

On Mon, Dec 19, 2022 at 04:23:04PM -0500, Denys Dmytriyenko wrote:
> Ryan,
> 
> I believe we are fine merging this series as is and addressing the remaining 
> cleanup items afterwards. Thanks.
> 
> -- 
> Denys
> 
> 
> On Wed, Dec 07, 2022 at 03:43:06PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> > Multi-cert is already now the default, no need to add a comment on that.
> > 
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> >  meta-ti-bsp/conf/machine/include/j7.inc | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/meta-ti-bsp/conf/machine/include/j7.inc b/meta-ti-bsp/conf/machine/include/j7.inc
> > index 4ea3a5d8..cf4cc440 100644
> > --- a/meta-ti-bsp/conf/machine/include/j7.inc
> > +++ b/meta-ti-bsp/conf/machine/include/j7.inc
> > @@ -3,5 +3,3 @@ SOC_FAMILY:append = ":j7"
> >  
> >  OPTEEMACHINE = "k3-j721e"
> >  OPTEEOUTPUTMACHINE = "k3"
> > -
> > -# Use default IMAGE_BOOT_FILES_LEGACY files
> > -- 
> > 2.38.1

