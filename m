Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.480.1617235010394073538
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rlWdzdZ9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNuhqG124286;
	Wed, 31 Mar 2021 18:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235003;
	bh=yAloWV+5N0QCjjWh5RIbdXku1pdJKZNNJ3OxWHyfDfA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rlWdzdZ9DkSeBq5Ptxc14QAcrS7cvmgt+1tywv3pn+2YhXNNxkLXAzL0PILe9zbN/
	 EQmvin0wYz7Z+pPpRTJzxm+81WmDTYVCptWJPRqZR8/FkZWRiRh7SYzTT7mcZ6+l4R
	 A14RU2uAhZHIRrU6lLqfyCIBv1x3Wc+NlnpqXSEk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNuhL1130914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:56:43 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:56:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:56:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNuhij091291;
	Wed, 31 Mar 2021 18:56:43 -0500
Date: Wed, 31 Mar 2021 18:56:43 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell/master][PATCH 5/7] conf/machine: am64xx: Consolidate image configuration to SoC include
Message-ID: <20210331235643.ln7wg4ucb6a7jxqk@preview>
References: <20210331165133.3746-1-nm@ti.com>
 <20210331165133.3746-6-nm@ti.com>
 <20210331223351.GI23013@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210331223351.GI23013@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:33-20210331, Denys Dmytriyenko wrote:
> On Wed, Mar 31, 2021 at 11:51:31AM -0500, Nishanth Menon wrote:
> > IMAGE type and dependencies can easily be centralized to SoC include
> > file. This is necessary to make sure that we don't do the duplication
> > and having multiple places to fix up.
> 
> I thought the plan was to soon merge am64xx-sk into am64xx-evm. But 
> regardless, having these vars set for the entire SoC family is best.
> 

yup. the merge of sk and evm is still TBD - I have heard of it
internally, though was'nt clear as to how it will be done since the
DDR is so different.. hopefully in some follow on series, I suppose..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
