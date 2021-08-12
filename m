Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.28367.1628802565532758528
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 14:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8400540C8E;
	Thu, 12 Aug 2021 21:09:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TE2-AQdKvgqa; Thu, 12 Aug 2021 21:09:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63E5340C1C;
	Thu, 12 Aug 2021 21:09:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E92CE174656; Thu, 12 Aug 2021 17:09:22 -0400 (EDT)
Date: Thu, 12 Aug 2021 17:09:22 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yogesh Siraswar <yogeshs@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] prusw-fw: Update switch firmwares to 3.2.9 version
Message-ID: <20210812210922.GA1528@denix.org>
References: <20210628144805.16996-1-vigneshr@ti.com>
 <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
 <168CD716D1640986.22485@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <168CD716D1640986.22485@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yogesh,

See our earlier discussion on linux-firmware and the comment about splitting 
individual FW binaries into own packages.


On Mon, Jun 28, 2021 at 03:54:11PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jun 28, 2021 at 12:40:22PM -0500, Bajjuri, Praneeth wrote:
> > Yogesh,Vignesh,
> > 
> > On 6/28/2021 9:48 AM, Vignesh Raghavendra wrote:
> > >From: Lokesh Vutla <lokeshvutla@ti.com>
> > >
> > >Update prueth switch firmwares to 3.2.9 version
> > >
> > >Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > >---
> > >  recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} | 2 +-
[snip]
> > 
> > Can we have once central recipe for ti-linux-firmware to pick the
> > right SRCREV when firmware is integrated
> > recipe-bsp/ti-linux-fw*/*.bb something like that, Instead of
> > pointing to a different SRCREV in different bb recipe ?
> > 
> > I see 9 different recipe-bsp/<>/ locations potentially pointing to
> > different SRCREV.
> 
> Individual FW recipes in meta-ti evolved over long time, being added one by 
> one, as they were coming from different places and not necessarily hosted in 
> a single repo in the beginning...
> 
> 
> Has anyone looked at upstreaming those FW images to main linux-firmware at 
> kernel.org?
> 
> There's a recipe for the upstream linux-firmware bundle in oe-core that 
> resides in recipes-kernel/linux-firmware/.
> 
> Until fully upstreamed, it might be possible to bbappend that recipe from 
> oe-core in meta-ti. But it tries to split up as much of individual FW images 
> as possible. That way one recipe with a single SRCREV produces multiple binary 
> packages that can be pulled into the image individually.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
