Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.319.1618506701047326252
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MxXKipDv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FHBeGD026228;
	Thu, 15 Apr 2021 12:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618506700;
	bh=vVsacGqIagGGB2JO/pl/H67h9m6UgDwazr/NaMMAlTk=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=MxXKipDvjalSRRdaIeq3F2jC1CGcRgsHecSdlATAfPNp8N792DXDnpzhUnq2ejmx7
	 S62jU0lfVdSZ6GepJ/vDKubarrrBWzP/3atIfOHaXznunf+8rdAET0/fniYgc7lha+
	 6SAw6/ppzQtugtSDDpkhCZcBUw0Uq9BqZrMiJVfo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FHBekd096133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 12:11:40 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 12:11:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 12:11:39 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FHBdYo016531;
	Thu, 15 Apr 2021 12:11:39 -0500
Subject: Re: [dunfell/master PATCH 0/6] am65x/j7*: Remove non-existent 5.10.y dtb*
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20210415051105.1626-1-praneeth@ti.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <4e41456e-91d2-e325-ef68-3dc16c24936b@ti.com>
Date: Thu, 15 Apr 2021 12:11:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



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

Will send a v2 shortly adding more platforms in same category ( removing 
non-existent dtb/o in meta-ti to match the kernel status)

> 
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
