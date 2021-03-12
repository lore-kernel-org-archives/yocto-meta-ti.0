Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.69.1615590713974070065
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 15:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 04E7938C082F
	for <meta-ti@yoctoproject.org>; Fri, 12 Mar 2021 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA06540BEA;
	Fri, 12 Mar 2021 23:11:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4DVv7X594Lv; Fri, 12 Mar 2021 23:11:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8186240B66;
	Fri, 12 Mar 2021 23:11:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 41E6C174541; Fri, 12 Mar 2021 18:11:43 -0500 (EST)
Date: Fri, 12 Mar 2021 18:11:43 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: nikhil.nd@ti.com, meta-ti@yoctoproject.org, praneeth@ti.com,
	lokeshvutla@ti.com, kishon@ti.com, nsekhar@ti.com, hnagalla@ti.com,
	saurabhnarang@ti.com
Subject: Re: [meta-ti][dunfell PATCH v2] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210312231143.GE4892@denix.org>
References: <20210310161337.31072-1-nikhil.nd@ti.com>
 <20210310171144.GW4892@denix.org>
 <20210310172222.qkssgid2arel3aky@sapling>
MIME-Version: 1.0
In-Reply-To: <20210310172222.qkssgid2arel3aky@sapling>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 11:22:22AM -0600, Nishanth Menon wrote:
> On 12:11-20210310, Denys Dmytriyenko wrote:
> > On Wed, Mar 10, 2021 at 09:43:37PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > 
> > Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> > 
> > 
> > > ---
> > > 
> > > Notes:
> > >     Changes from v1:
> > >     * Update the version in the recipe filename
> > > 
> > >  .../wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb}  | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >  rename recipes-bsp/wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb} (86%)
> > > 
> > > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > similarity index 86%
> > > rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > rename to recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > index a52ec898..50b6c297 100644
> > > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > > @@ -7,8 +7,7 @@ SRC_URI = " \
> > >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> > >  "
> 
> Just curious, is there a periodic upgrade plan in upstream [1] - last commit is
> [2] ?

Based on [3], I believe this is a question for Saurabh Narang <saurabhnarang@ti.com>
And would also like to hear the answer...


> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/ti-connectivity/wl18xx-fw-4.bin?id=d5f9eea5a251d43412b07f5295d03e97b89ac4a5

[3] https://git.ti.com/cgit/wilink8-wlan/wl18xx_fw/log/

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
