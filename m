Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7319.1622035131908695646
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 May 2021 06:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SmN20gSr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QDIlSY078014;
	Wed, 26 May 2021 08:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622035127;
	bh=f4R9E+XJzkCSkehbCE6KdGCh/O2S1BlWiYNOY6W0Ggg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SmN20gSrDMeL1Lig5/FhlPDVG8NCachtqKFotrHr+yXIT4FSqV+tAQTBuQsV+z7AD
	 oSPIkJA4jDosiapsK3sJpFYxN174yYTM6QUkppe1o4h/GRiYpOXJIhzefJLh4WJcmz
	 i/upNaDdu6ZY06uCcOqlkNSKMPv0mp0/4sWfBlqw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QDIkBj072088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 08:18:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 08:18:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 08:18:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QDIkI2121699;
	Wed, 26 May 2021 08:18:46 -0500
Date: Wed, 26 May 2021 08:18:46 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210526131846.fo5bood7l2zl2mfi@sanded>
References: <20210524224036.13526-1-yogeshs@ti.com>
 <20210525015139.GB1528@denix.org>
 <20210525115552.5kqo5mcdwonarnjc@retriever>
 <20210526042150.GI1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210526042150.GI1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 00:21-20210526, Denys Dmytriyenko wrote:
> On Tue, May 25, 2021 at 06:55:52AM -0500, Nishanth Menon wrote:
> > On 21:51-20210524, Denys Dmytriyenko wrote:
> > > On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
> > > > Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> > > > compile dtbs with symbols. This fixes the issue where the dtbs
> > > > are build without symbols causing issue with overlays.
> > > > 
> > > > Enabling overlay support increases the size of the dtb, hence
> > > > it is done at a platform level rather than globally to allow custom
> > > > boards disable it from local.conf to reduce size.
> > > > 
> > 
> > ^^
> > 
> > > > Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> > > > ---
> > > >  conf/machine/am335x-evm.conf                  | 2 ++
> > > >  conf/machine/am335x-hs-evm.conf               | 2 ++
> > > >  conf/machine/am437x-evm.conf                  | 2 ++
> > > >  conf/machine/am437x-hs-evm.conf               | 2 ++
> > > >  conf/machine/am57xx-evm.conf                  | 2 ++
> > > >  conf/machine/am57xx-hs-evm.conf               | 3 +++
> > > >  conf/machine/am65xx-evm.conf                  | 2 ++
> > > >  conf/machine/am65xx-hs-evm.conf               | 2 ++
> > > >  conf/machine/dra7xx-evm.conf                  | 2 ++
> > > >  conf/machine/dra7xx-hs-evm.conf               | 3 +++
> > > >  conf/machine/j7-evm.conf                      | 2 ++
> > > >  conf/machine/j7-hs-evm.conf                   | 2 ++
> > > >  conf/machine/j7200-evm.conf                   | 2 ++
> > > >  conf/machine/k2g-evm.conf                     | 2 ++
> > > >  conf/machine/k2g-hs-evm.conf                  | 2 ++
> > > 
> > > First question:
> > > If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine 
> > > configs, should it instead be done in SoC include files, like ti33x.inc, 
> > > k3.inc or even ti-soc.inc?
> > 
> > You would want the default behavior as default dtb, not the bloated
> > symbol loaded overlay capable dtb, no?
> 
> Well, but from the list above the only machines missing are AM64 and legacy 

^^^ Arrgh, good catch - we are indeed missing am64..

> K2 HK/L/E. And since the assignment is weak (?=), it can still be changed 
> from local.conf, as the commit message says.

I think we need to drop k2 platforms - they are just bitrotting..

> Anyway, if you don't think making it a bit more generic for ease of 
> maintenance is not worth it, then I'm fine with current approach.

Hmmm.. Your point is to get the weak assignment to allows the critical
mach confs to just override it with =

yeah, I am not exactly a fan of going overboard with entries in machine
file.

I guess I second your thought about including it in ti-soc.inc instead
of machine specific includes to prevent us from messing up and allowing
a little less optimal, but feature rich default.


btw, where do we document all these variables that need tweaking?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
