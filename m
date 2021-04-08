Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.8451.1617889458783257578
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 06:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sf61xfhg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 138DiIeo060737;
	Thu, 8 Apr 2021 08:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617889458;
	bh=XRwe0ka/EOzUiPcicTJoquv5Dfrgc1SgneD3Dcl+yns=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sf61xfhgp3i43L+wzz9Qn26h0i9krv+txy9CrKA/g4tiiV9qbW4YzPIymokHMi9+P
	 wAyF14IaR3RhdNAiHF1FDqnJLP4sMeljkE5XTvsSs5r/11D9VxDLsAb+tLPFijkvHz
	 tmwWn7SqWklMlM8HBZMpDokogBT0dPp9jnXPtP0k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 138DiIGO130371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Apr 2021 08:44:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Apr
 2021 08:44:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Apr 2021 08:44:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 138DiH8N008856;
	Thu, 8 Apr 2021 08:44:17 -0500
Date: Thu, 8 Apr 2021 08:44:17 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <sinthu.raja@mistralsolutions.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell/master PATCH 3/3] AM64x Unification: Update ti-sci-fw recipe
Message-ID: <20210408134409.u24qdeiindwia2hl@paralyses>
References: <20210408071654.63212-1-sinthu.raja@mistral.in>
MIME-Version: 1.0
In-Reply-To: <20210408071654.63212-1-sinthu.raja@mistral.in>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:46-20210408, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <x0257345@ti.com>
> 
> Updtae ti-sci-fw recipe to build for both SK and EVM compilation and
s/Updtae/Update/

> installation through one machine name


Why are we doing this? What happens to the wic file image? What is the
out of box experience for someone creating an SD image -> flash the
image then modify the sd card? how would that help?


if we are going to make things minimal, then we might just have a
headless_k3 and gui_k3 or something similar


Further, when people have their own boards, how are they supposed to add
support for their platforms?



-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
