Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8591.1621943757481154593
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 May 2021 04:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K5IMaszC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PBtqdC128924;
	Tue, 25 May 2021 06:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621943752;
	bh=aSxYBFeNrPqoFBfQ49CQeitZUJB0eSVI5hizncloaUU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K5IMaszCG8ZxkV4TNtc6odJzqozWKL8YcpwaZw+DIeM7Aam2gI03RvoSaVYfyFTJa
	 MgExgvztrITrPirhrMeE6kv5efpEaPW+24cSUMuQ55uzaMoucZWavkXNhPptSaHE+O
	 BQdlNfGHaY8bpI+7sLETZDOdnJ2ezVLzkbdp7xAw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PBtql4101485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 May 2021 06:55:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 06:55:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 06:55:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PBtqSC029359;
	Tue, 25 May 2021 06:55:52 -0500
Date: Tue, 25 May 2021 06:55:52 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master][PATCH V3] linux-ti-staging: Add extra dtc flags to support dtb overlays
Message-ID: <20210525115552.5kqo5mcdwonarnjc@retriever>
References: <20210524224036.13526-1-yogeshs@ti.com>
 <20210525015139.GB1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210525015139.GB1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 21:51-20210524, Denys Dmytriyenko wrote:
> On Mon, May 24, 2021 at 05:40:36PM -0500, Yogesh Siraswar via lists.yoctoproject.org wrote:
> > Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
> > compile dtbs with symbols. This fixes the issue where the dtbs
> > are build without symbols causing issue with overlays.
> > 
> > Enabling overlay support increases the size of the dtb, hence
> > it is done at a platform level rather than globally to allow custom
> > boards disable it from local.conf to reduce size.
> > 

^^

> > Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> > ---
> >  conf/machine/am335x-evm.conf                  | 2 ++
> >  conf/machine/am335x-hs-evm.conf               | 2 ++
> >  conf/machine/am437x-evm.conf                  | 2 ++
> >  conf/machine/am437x-hs-evm.conf               | 2 ++
> >  conf/machine/am57xx-evm.conf                  | 2 ++
> >  conf/machine/am57xx-hs-evm.conf               | 3 +++
> >  conf/machine/am65xx-evm.conf                  | 2 ++
> >  conf/machine/am65xx-hs-evm.conf               | 2 ++
> >  conf/machine/dra7xx-evm.conf                  | 2 ++
> >  conf/machine/dra7xx-hs-evm.conf               | 3 +++
> >  conf/machine/j7-evm.conf                      | 2 ++
> >  conf/machine/j7-hs-evm.conf                   | 2 ++
> >  conf/machine/j7200-evm.conf                   | 2 ++
> >  conf/machine/k2g-evm.conf                     | 2 ++
> >  conf/machine/k2g-hs-evm.conf                  | 2 ++
> 
> First question:
> If you are weakly assigning KERNEL_DTB_OVERLAY_SUPPORT in most of the machine 
> configs, should it instead be done in SoC include files, like ti33x.inc, 
> k3.inc or even ti-soc.inc?

You would want the default behavior as default dtb, not the bloated
symbol loaded overlay capable dtb, no?

[...]

> > +
> > +def get_extra_dtc_args(d):
> > +    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
> > +        return "DTC_FLAGS=-@"
> > +    else:
> > +        return ""
> > +
> > +EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
> 
> Second question:
> Are there any specific future plans for EXTRA_DTC_ARGS? As it seems to be 
> an unused intermediary variable right now - you can directly append to 
> KERNEL_EXTRA_ARGS here...

dtc changes are always incoming, does'nt make sense to keep that
separated out?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
