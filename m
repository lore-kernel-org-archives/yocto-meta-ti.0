Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.5953.1623110756083351951
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 17:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S3tuA6XX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15805t2v048924;
	Mon, 7 Jun 2021 19:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623110755;
	bh=md+1rThl38eon+LMDIf1GBjcjjUTONn9uz3/fANjMzo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=S3tuA6XXi/S2bdWoA/AuBXNx4AOTr8CabgRy3I/QLjaUqQSi9dbhwwLbCfp6MgXw2
	 x5V33yw2HOTkhmF67WlrGWRh/yV9ZdnHNzt5nlmUyNQD9JEXRGaBKqDbrj5Rkn+9bZ
	 diY0m4eud5WVDJBN/Pisz+tGNTVbrqTHV4UXArwA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15805tPn067930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 19:05:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 19:05:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 19:05:54 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15805sma000932;
	Mon, 7 Jun 2021 19:05:54 -0500
Subject: Re: [dunfell/master PATCH] conf: am65xx-evm: ReIntroduce display overlays for 5.10
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20210608000254.12042-1-praneeth@ti.com>
 <20210608000254.12042-3-praneeth@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <e8cdaab7-cb9a-614c-24b5-7ea1cc706094@ti.com>
Date: Mon, 7 Jun 2021 19:05:54 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210608000254.12042-3-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/7/2021 7:02 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> commit 9ea50db095f9 ("conf: am65xx-evm: Remove non-existent dtb* from 5.10")
> removed all non-existent dtb* for j7-evm as they were not
> available on linux 5.10 branch at that time.

Will send a V2, this commit message is not accurate.


> 
> This patch reintroduces following display overlays.
> - k3-am654-evm-tc358876.dtbo
> - k3-am654-evm-oldi-lcd1evm.dtbo
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   conf/machine/include/am65xx.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
> index 7cc3ddcc..8516ca4c 100644
> --- a/conf/machine/include/am65xx.inc
> +++ b/conf/machine/include/am65xx.inc
> @@ -15,6 +15,8 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am654-sr1.dtbo \
>       ti/k3-am654-pcie-usb2.dtbo \
>       ti/k3-am654-pcie-usb3.dtbo \
> +    ti/k3-am654-evm-tc358876.dtbo \
> +    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>   "
>   
>   BBMULTICONFIG += "k3r5-sr2"
> 
