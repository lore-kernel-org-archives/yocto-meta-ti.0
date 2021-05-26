Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3068.1622002916280913091
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 May 2021 21:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A0AE940A3D;
	Wed, 26 May 2021 04:21:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvFyabjw0KMj; Wed, 26 May 2021 04:21:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AD6140A28;
	Wed, 26 May 2021 04:21:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B90081745EF; Wed, 26 May 2021 00:21:50 -0400 (EDT)
Date: Wed, 26 May 2021 00:21:50 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: yogeshs@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210526042150.GI1528@denix.org>
References: <20210524224036.13526-1-yogeshs@ti.com>
 <20210525015139.GB1528@denix.org>
 <20210525115552.5kqo5mcdwonarnjc@retriever>
MIME-Version: 1.0
In-Reply-To: <20210525115552.5kqo5mcdwonarnjc@retriever>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 06:55:52AM -0500, Nishanth Menon wrote:
> On 21:51-20210524, Denys Dmytriyenko wrote:
> > On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
> > > Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> > > compile dtbs with symbols. This fixes the issue where the dtbs
> > > are build without symbols causing issue with overlays.
> > > 
> > > Enabling overlay support increases the size of the dtb, hence
> > > it is done at a platform level rather than globally to allow custom
> > > boards disable it from local.conf to reduce size.
> > > 
> 
> ^^
> 
> > > Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> > > ---
> > >  conf/machine/am335x-evm.conf                  | 2 ++
> > >  conf/machine/am335x-hs-evm.conf               | 2 ++
> > >  conf/machine/am437x-evm.conf                  | 2 ++
> > >  conf/machine/am437x-hs-evm.conf               | 2 ++
> > >  conf/machine/am57xx-evm.conf                  | 2 ++
> > >  conf/machine/am57xx-hs-evm.conf               | 3 +++
> > >  conf/machine/am65xx-evm.conf                  | 2 ++
> > >  conf/machine/am65xx-hs-evm.conf               | 2 ++
> > >  conf/machine/dra7xx-evm.conf                  | 2 ++
> > >  conf/machine/dra7xx-hs-evm.conf               | 3 +++
> > >  conf/machine/j7-evm.conf                      | 2 ++
> > >  conf/machine/j7-hs-evm.conf                   | 2 ++
> > >  conf/machine/j7200-evm.conf                   | 2 ++
> > >  conf/machine/k2g-evm.conf                     | 2 ++
> > >  conf/machine/k2g-hs-evm.conf                  | 2 ++
> > 
> > First question:
> > If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine 
> > configs, should it instead be done in SoC include files, like ti33x.inc, 
> > k3.inc or even ti-soc.inc?
> 
> You would want the default behavior as default dtb, not the bloated
> symbol loaded overlay capable dtb, no?

Well, but from the list above the only machines missing are AM64 and legacy 
K2 HK/L/E. And since the assignment is weak (?=), it can still be changed 
from local.conf, as the commit message says.

Anyway, if you don't think making it a bit more generic for ease of 
maintenance is not worth it, then I'm fine with current approach.


> > > +
> > > +def get_extra_dtc_args(d):
> > > +    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
> > > +        return "DTC_FLAGS=-@"
> > > +    else:
> > > +        return ""
> > > +
> > > +EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
> > 
> > Second question:
> > Are there any specific future plans for EXTRA_DTC_ARGS? As it seems to be 
> > an unused intermediary variable right now - you can directly append to 
> > KERNEL_EXTRA_ARGS here...
> 
> dtc changes are always incoming, does'nt make sense to keep that
> separated out?

Fair enough.

Acked-by: Denys Dmytriyenko <denys@konsulko.com>

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
