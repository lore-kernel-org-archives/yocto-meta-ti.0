Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1494.1607644038526149887
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 15:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bkoiJsf9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BANlETk037840;
	Thu, 10 Dec 2020 17:47:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607644034;
	bh=FIe4PYTrmHiWB/nPmwvtR6tB3j7FRFliOg7u0e2r3a8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bkoiJsf9kgXtIy5e9OPCQ5f2dzxtrO0oIN79pZfZ6fajt4787oi/tyHnlRM+w/hKQ
	 yA/ZZZ6S7hNFzmXjQlJV6asJy+Ckrj+YSSpJ8YgS4jS1bVBALqYSh2JjlmjDQ7Xxkm
	 KZIvUdlwGo4P6xLok8kdfzV5qm7Qr28/gezVOD6I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BANlEkv072191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 17:47:14 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 17:47:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 17:47:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BANlESR050356;
	Thu, 10 Dec 2020 17:47:14 -0600
Date: Thu, 10 Dec 2020 17:47:14 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <d-gerlach@ti.com>,
        <s-anna@ti.com>, <dmurphy@ti.com>
Subject: Re: [dunfell/master PATCH V3] trusted-firmware-a: Update to v2.4 merge
Message-ID: <20201210234714.mtzjudi33gms5oyh@kahuna>
References: <20201210231351.7637-1-nm@ti.com>
 <20201210233114.GA24670@denix.org>
MIME-Version: 1.0
In-Reply-To: <20201210233114.GA24670@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:31-20201210, Denys Dmytriyenko wrote:
> On Thu, Dec 10, 2020 at 05:13:51PM -0600, Nishanth Menon wrote:
> > Update to v2.4 tag merge from upstream to keep TF-A in sync.
> > 
> > For major changes in trusted-firmware-a, See:
> > https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
> > 
> > TI specific fixups include:
> >  - stub for shutdown (CPUs enter wfi)
> >  - uart console is now configurable.
> > 
> > While at it, update to include PV_k3 as 2.4 and provide the license file
> > checksum.
> > 
> > NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
> > affect other platforms esp in a multi-BSP configuration.
> > 
> > Suggested-by: Dan Murphy <dmurphy@ti.com>
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > 
> > Changes since v2:
> >  - Update license file and checksum (Thanks Dan for catching my next
> >    blunder)
> > 
> > Changes since v1 in v2:
> >  - Update for PV_k3 (Thanks Denys) - I was'nt sure to pick a
> >  "Reviewed-by" tag for your LGTM :).. so did'nt want to guess.
> 
> I didn't want to impose... :) But if you like, I can do a proper "Reviewed-by" 
> next time.

ROFL... that will help..
> 
> 
> >  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > index 3c1862643086..c561fe2d7e76 100644
> > --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > @@ -1,6 +1,8 @@
> > +PV_k3 = "2.4"
> > +LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> 
> Well, same thing here. You are changing an upstream recipe variable that 
> should only be changed for meta-ti platforms, or more specifically K3.
> 
> Think of it this way: a multi-BSP Distro has both meta-ti and meta-raspberrypi 
> layers setup. When building for a TI K3 platform, everything works, but when 
> building for RPi4, it's not a K3 platform and none of the TI customizations 
> come in play, except the license checksum update, which obviously fails.
> 
> Any .bbappend against an upstream recipe should be considerate of other 
> platforms in other BSP layers.


hehe.. I am getting the hard way into learning OE layers :).. Thanks for
looking out for us.

s/LIC_FILES_CHKSUM/LIC_FILES_CHKSUM_k3 coming right up..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
