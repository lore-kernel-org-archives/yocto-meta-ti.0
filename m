Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.472.1617235036201913073
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HBKqt+dD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvDdP110139;
	Wed, 31 Mar 2021 18:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235033;
	bh=NrASUJtFTU5HgzbtRpshiS00yIVe4Iykm44aGRARIWY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HBKqt+dDXLrt2gyfRt5AJ+HxLCoTTVqJNiLNrCyp4eB3oD9m3u5gmm/nBfCLC49gs
	 gLCmJTYV6A7xf2mUtE+ptWB63jaaw+++vPIuubMFHwhheWzN5xW37NjOWcPHNjejhQ
	 mk40NcHoTGAsuHZoS7kz9TEoMaE57lhN1mOogxVY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNvDBl086758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvDW9003575;
	Wed, 31 Mar 2021 18:57:13 -0500
Date: Wed, 31 Mar 2021 18:57:13 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell/master][PATCH 2/7] conf/machine: am65xx: Document boot images as legacy mode
Message-ID: <20210331235713.x55uxwv2jnocqz3o@unmasked>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-3-nm@ti.com>
 <20210331222317.GF23013@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210331222317.GF23013@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:23-20210331, Denys Dmytriyenko wrote:
> On Wed, Mar 31, 2021 at 11:51:28AM -0500, Nishanth Menon wrote:
> > We use the default IMAGE_BOOT_FILES configuration which matches up with
> > legacy boot configuration. Document the same to allow folks to
> > understand by just looking at the SoC include file.
> 
> May want to add one extra comment below.


Updated in the upcoming V2 of this series.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
