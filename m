Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.188.1607637502840760986
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 13:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FL7tw2NI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BALwJ27121309;
	Thu, 10 Dec 2020 15:58:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607637499;
	bh=j6vb/n4ikf/ghDheKzCz88043ortrFUa7Ol0L5zzBsQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FL7tw2NIKBzkvIoBCBdcvyenBOTELNWlaOk8ff3RYl82LpP6jn04nZ1Yd1RKdGYwE
	 VcoGBWp2xWGQaGYrcGP5GeOXp1CCf9ugUFnA92JQUkOe5Z7lu4a+ZoY892lXb9yYfL
	 dCLQfA/GiR0m6Kw0gS5enjW8EveXBLtwNiZLRfwI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BALwJ85082696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 15:58:19 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 15:58:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 15:58:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BALwJli051177;
	Thu, 10 Dec 2020 15:58:19 -0600
Date: Thu, 10 Dec 2020 15:58:19 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201210215819.cunhtwhe643xjbgd@kahuna>
References: <20201210213348.30149-1-nm@ti.com>
 <75965ce5-23dc-19c3-4e88-993a13150cf1@ti.com>
 <20201210214525.GG19155@denix.org>
MIME-Version: 1.0
In-Reply-To: <20201210214525.GG19155@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:45-20201210, Denys Dmytriyenko wrote:
> On Thu, Dec 10, 2020 at 03:36:26PM -0600, Dan Murphy via lists.yoctoproject.org wrote:
> > Forward
> > 
> > 
> > 
> > -------- Forwarded Message --------
> > Subject: 	[dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
> > Date: 	Thu, 10 Dec 2020 15:33:48 -0600
> > From: 	Nishanth Menon <nm@ti.com>
> > To: 	meta-ti@lists.yoctoproject.org
> > CC: 	praneeth@ti.com, d-gerlach@ti.com, s-anna@ti.com,
> > dmurphy@ti.com, Nishanth Menon <nm@ti.com>
> > 
> > 
> > 
> > Update to v2.4 tag merge from upstream to keep TF-A in sync.
> > 
> > For major changes in trusted-firmware-a, See:
> > https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> > 
> > TI specific fixups include:
> > - stub for shutdown (CPUs enter wfi)
> > - uart console is now configurable.
> > 
> > While at it, update to include PV as 2.4
> > 
> > Suggested-by: Dan Murphy <dmurphy@ti.com>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > index 3c1862643086..08b2e04ff711 100644
> > --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > @@ -1,6 +1,7 @@
> > +PV = "2.4"
> 
> ^^^ This should be specific to a platform or SoC family.
> See how all other variables below are specific to K3 with _k3 override.
> Hence: PV_k3 = "2.4"

aha... ofcourse.. Gee thanks. V2 coming right up.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
