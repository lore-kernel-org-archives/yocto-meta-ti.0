Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C583E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:00:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.105080.1733760000727332970
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 08:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A09E240CBE;
	Mon,  9 Dec 2024 15:59:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijgTs7MHAF-Y; Mon,  9 Dec 2024 15:59:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E60040C6C;
	Mon,  9 Dec 2024 15:59:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A930C164109; Mon,  9 Dec 2024 10:59:56 -0500 (EST)
Date: Mon, 9 Dec 2024 10:59:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: matthias.schiffer@ew.tq-group.com
Cc: meta-ti@lists.yoctoproject.org, oss@ew.tq-group.com
Subject: Re: [meta-ti] [master][PATCH] conf: machine: k3: use ARMv8-A as
 base arch
Message-ID: <20241209155956.GE23825@denix.org>
References: <20241114140801.1964528-1-matthias.schiffer@ew.tq-group.com>
 <806ad6edd0e2359aeabb6d4e41795b91b0b2023c.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <806ad6edd0e2359aeabb6d4e41795b91b0b2023c.camel@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 16:00:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18100

On Mon, Dec 09, 2024 at 10:38:56AM +0100, Matthias Schiffer via lists.yoctoproject.org wrote:
> On Thu, 2024-11-14 at 15:08 +0100, Matthias Schiffer wrote:
> > All K3 SoCs are Cortex-A53/A72, so arch-armv8a.inc is a more appropriate
> > common base than the very generic arch-arm64.inc. arch-armv8a.inc defaults
> > to enable the CRC extension (DEFAULTTUNE = "armv8a-crc") and allows for
> > easy addition of the ARMv8 crypto extensions by setting the tune to
> > "armv8a-crc-crypto".
> 
> Hi, any comments regarding this patch?

Matthias,

We've discussed this couple of weeks ago and decided to make a slightly 
different change that will also enable your use case as well.

Ryan got busy lately with master breakage, so I should probably send the 
change in for discussion.

-- 
Denys


> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> > index a296f64f..140564f7 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -3,7 +3,7 @@
> >  require conf/machine/include/ti-soc.inc
> >  SOC_FAMILY:append = ":k3"
> >  
> > -require conf/machine/include/arm/arch-arm64.inc
> > +require conf/machine/include/arm/arch-armv8a.inc
> >  
> >  require conf/machine/include/ti-bsp.inc
> >  

