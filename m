Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1917.1607646258623465632
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 16:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xyEWhBwT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BB0OETH045152;
	Thu, 10 Dec 2020 18:24:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607646254;
	bh=tuQNs89VUpnWz649443CrYI3DVZATqv8P+46HzjxsKw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xyEWhBwTp8dtfEZotXhd4aJ3s5oGfwsZgIWStI1/QZryxX32UDhw/M/e81DJrobV+
	 MNYM9/ZRKImNq4ZdCLgs26Mjl1ANbtOXX5QA9WWnXZAX0k2ZojksKAjYdVzrp2SKs+
	 zmZ7YM+btF6EoOsE090O915+kmoQZ1/y9xtCMXRg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BB0OEFw044766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 18:24:14 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 18:24:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 18:24:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BB0OE6f048665;
	Thu, 10 Dec 2020 18:24:14 -0600
Date: Thu, 10 Dec 2020 18:24:14 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <d-gerlach@ti.com>,
        <s-anna@ti.com>, <dmurphy@ti.com>
Subject: Re: [dunfell/master PATCH V4] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201211002414.iv6yhur7ndolchbi@kahuna>
References: <20201210234957.9412-1-nm@ti.com>
 <20201211000015.GB24670@denix.org>
 <20201211000418.daqqo6qhmnqtoxf5@kahuna>
 <20201211001524.GC24670@denix.org>
MIME-Version: 1.0
In-Reply-To: <20201211001524.GC24670@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:15-20201210, Denys Dmytriyenko wrote:
> On Thu, Dec 10, 2020 at 06:04:18PM -0600, Nishanth Menon wrote:
> > On 19:00-20201210, Denys Dmytriyenko wrote:
> > > On Thu, Dec 10, 2020 at 05:49:57PM -0600, Nishanth Menon wrote:
> > > > Update to v2.4 tag merge from upstream to keep TF-A in sync.
> > > > 
> > > > For major changes in trusted-firmware-a, See:
> > > > https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> > > > 
> > > > TI specific fixups include:
> > > >  - stub for shutdown (CPUs enter wfi)
> > > >  - uart console is now configurable.
> > > > 
> > > > While at it, update to include PV_k3 as 2.4 and provide the license file
> > > > checksum.
> > > > 
> > > > NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
> > > > affect other platforms esp in a multi-BSP configuration.
> > > > 
> > > > Suggested-by: Dan Murphy <dmurphy@ti.com>
> > > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > > 
> > > Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> > > 
> > > Nice-to-have would be to explain the license checksum change and whether it 
> > > affects the actual license. The checksum there is specifically to catch any 
> > > changes to the license file and prevent re-licensing to pass unnoticed...
> > > 
> > 
> > Hmm.. good idea.. but it was'nt present before.. so i could state
> > something as follows in the commit message:
> > 
> > ----
> > 
> > While at it, update to include PV_k3 as 2.4. We use PV_k3 instead of
> > PV since this allows meta-ti to not affect other platforms esp in a
> > multi-BSP configuration.
> > 
> > We also add LIC_FILES_CHKSUM_k3 to make sure that we don't let any
> > re-licensing in the project pass through unnoticed as that has to
> > be carefully examined for making sure we have all the right legal
> > compliance.
> 
> Right, but you don't explain what actually changed to cause the checksum 
> update...
> 
> E.g.: "checksum changed due to upstream commit XYZ to update the year, the 
> license itself is the same" or "checksum changed due to addition on SPDX 
> header in commit XYZ, no license change"
> 
> But you need to examine it yourself. Otherwise it could be: "the license has 
> changed from GPLv2 to GPLv3" and also update the actual LICENSE_k3 variable.
I did check..

https://github.com/ARM-software/arm-trusted-firmware/commits/master/license.rst

There is nothing changed since the original inception other
than document optimization, definitely nothing since commit
52c334fc361194e3896ea3b2529c10a06e586a5f

So, how about this reword:
----

While at it, update to include PV_k3 as 2.4. We use PV_k3 instead of
PV since this allows meta-ti to not affect other platforms esp in a
multi-BSP configuration.

We also add LIC_FILES_CHKSUM_k3 to make sure that we don't let any
re-licensing in the project pass through unnoticed as that has to
be carefully examined for making sure we have all the right legal
compliance - There has been no change compared to previous versions, but
we introduce this as a protection in case there is a change in the
future.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
