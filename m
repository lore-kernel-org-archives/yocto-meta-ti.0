Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.261.1618506432622982690
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OEI+X/hZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FH76FL024461;
	Thu, 15 Apr 2021 12:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618506426;
	bh=vzYKUsabVHllyhWpP4biV22qJ+lFeGQh3Y3KN0J/2Hs=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=OEI+X/hZ0hOunbhKUKTyYKbn6kWLRvydKflWLmsJwD2G4BI1FP4xMFQzcepRLkCbt
	 T1zp42j7H+pF3sWk0GFQ1cl4tGWubFaeCi7cOnaKiju5TekQoqqLwS4pJ2uDcNkkyX
	 OHbpeH0uISF1wH3Lmfl1HIElm5zOQ7KsIe5gE/4w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FH76il080089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 12:07:06 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 12:07:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 12:07:06 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FH75ge054230;
	Thu, 15 Apr 2021 12:07:05 -0500
Subject: Re: [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210415051105.1626-1-praneeth@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <a60cd66e-9b51-a710-6a1b-b7074bf8126f@ti.com>
Date: Thu, 15 Apr 2021 12:07:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 4/15/2021 12:10 AM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> The current ti-linux-5.10.y integration branch doesnt have support for
> non base board dtb/o form the primary latest processor board on am65 and
> j7* evms yet.
> 
> Removing these dtb/o for enabling the builds to continue.
> Plan to add these blob and overlays back once the equivalent support is
> added in the integrated ti-linux-5.10.y kernel.
> 

Need your recommendation if this is the right approach to enable the 
builds at this early stage of LTS migration (and re-enable the overlays 
once the support is added in kernel).

> Praneeth Bajjuri (6):
>    Revert "conf: j7-evm: Add jailhouse dtbo"
>    Revert "j7-evm: add new k3-j721e-proc-board-tps65917.dtb"
>    Revert "j7-evm: add new infotainment DTBO file"
>    Revert "j7-evm: add k3-j721e-pcie-backplane.dtbo"
>    Revert "conf: machine: j7200-evm: Add Jailhouse overlay"
>    conf/machine: am65xx: Remove non-existent dtb* from 5.10
> 
>   conf/machine/include/am65xx.inc | 11 -----------
>   conf/machine/j7-evm.conf        |  4 ----
>   conf/machine/j7200-evm.conf     |  1 -
>   3 files changed, 16 deletions(-)
> 
