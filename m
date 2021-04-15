Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8510.1618499119889931079
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 08:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cf6LxCmj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FF5GLn104464;
	Thu, 15 Apr 2021 10:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618499116;
	bh=TpaSIehq4YtKyWH9GNPQA7yviYzJNHq3LJoV509HVPg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cf6LxCmj+6EC1/VZvLfWpSXHj3yAJOZgMiT5lEFtN0Ce8oqIf2ScnTBu38n/L5NI5
	 nYjbtssJ0VxTXS+Bt4WlGP/q3uyg/9oT4QLkC7nrSQ3iwvVaqKo+g20c2Jmbx8qEc4
	 6Pm8WOC1vtnoPM3MaxiAcgBqnPX9PzdQj0FhQ5MQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FF5G4n008181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 10:05:16 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 10:05:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 10:05:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FF5Gn2127546;
	Thu, 15 Apr 2021 10:05:16 -0500
Date: Thu, 15 Apr 2021 10:05:15 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: <praneeth@ti.com>, <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Message-ID: <20210415150515.lns6z2djdhvm3ont@violator>
References: <20210415144143.11667-1-nm@ti.com>
 <e978682b-8e16-f3ba-4c9e-62128782ffae@ti.com>
MIME-Version: 1.0
In-Reply-To: <e978682b-8e16-f3ba-4c9e-62128782ffae@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:15-20210415, Lokesh Vutla wrote:
> 
> 
> On 15/04/21 8:11 pm, Nishanth Menon wrote:
> > Update u-boot recipe to be on the bleeding upstream tag.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> > index ee0b17640807..ccd2a009ca43 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> > +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> >  
> >  PR = "r0"
> >  
> > -PV = "2020.10"
> > +PV = "2021.04"
> >  UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
> 
> Can you also update the link to https://source.denx.de/u-boot/u-boot.git ?


aah, yes, thanks for pointing it out. v2 incoming.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
