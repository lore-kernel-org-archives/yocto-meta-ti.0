Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8170.1617888789669072422
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 06:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m4T2jZAU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 138DX8df103150;
	Thu, 8 Apr 2021 08:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617888788;
	bh=HVDjNJJZA9W5F5dhbkdEcDN/AMweX5ZJLI/cKg1auLs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m4T2jZAUEytP8nMZmSKLsTHik1k47Lie27oS7/c4maonOwciCJcVQ/aoD2K60twJK
	 HLHgcvKvRNx6eX+BtZ51BuMPTsXDv+iKVqIXQIdL6KjCAqxT3D/mhG9p48N95c4Ae5
	 hz4GFl7cXTZKIzifZkI1ocvfNjGQnridj5NEog8Q=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 138DX8Tj043329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Apr 2021 08:33:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Apr
 2021 08:33:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Apr 2021 08:33:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 138DX8A3093080;
	Thu, 8 Apr 2021 08:33:08 -0500
Date: Thu, 8 Apr 2021 08:33:08 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <sinthu.raja@mistralsolutions.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH 1/3] Remove AM64xx-SK entries
Message-ID: <20210408133148.quo5hovcsjlabjkf@zipping>
References: <20210408071514.76344-1-sinthu.raja@mistral.in>
MIME-Version: 1.0
In-Reply-To: <20210408071514.76344-1-sinthu.raja@mistral.in>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:45-20210408, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <x0257345@ti.com>
> 
>  Remove the AM64x SK conf files
>  Remove the AM64xx-SK entries from u-boot-ti and ti-sci-fw recipes
> 

Why are we removing these in patch #1 ? This wont be bisectable.


it is also a good practise to introduce a cover-letter when posting
multiple patches.


[...]


btw, the ti ID does'nt seem to work for me at least.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
