Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.882.1625077500025293011
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 11:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sjS3GrRo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15UIOwGu007740;
	Wed, 30 Jun 2021 13:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625077498;
	bh=WCNVwII9t21hMEeT/M5olV0+s4MnANbiF6wLvJCdhkU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=sjS3GrRoWf5FkLiwAPGhgd9mZzow2FPi+1wJbL1Mh45jGmheZ6kbIG109nUWd8L/c
	 8+itznoQ/loSjpNgcB2UuGRYscGYRxOYMHjq2HSo6VUZqFHe6ATvz86RS4kS121aOe
	 o6G3/Ji8//Y6I84SVlssf7u+IWCUMYbkO09pEjaE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15UIOwAp018611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Jun 2021 13:24:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 13:24:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 30 Jun 2021 13:24:58 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15UIOwhD096039;
	Wed, 30 Jun 2021 13:24:58 -0500
Subject: Re: [dunfell PATCH] ti-sci-fw: Update linux firmware repo to 08.00.00.001
To: Nishanth Menon <nm@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20210630180128.13766-1-nm@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <6fea8a00-fdba-0d84-11b0-6cf4002c47f9@ti.com>
Date: Wed, 30 Jun 2021 13:24:58 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630180128.13766-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/30/2021 1:01 PM, Nishanth Menon wrote:
> Just updating imggen to a configuration compatible with latest firmware
> should not have been accepted, we should have ensured that firmware
> commit has moved correspondingly as well. Fix the same, else we get a
> broken system.
> 
> Fixes: 406f5998227e ("ti-sci-fw: Update imggen to release 08.00.00.001 tag")
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
> 
> NOTE: NOTHING has gotten into master for the last 6 weeks, so I might as
> well not tag master - This is just going to creep back at us.
> 
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 9e22e461354d..966042820aac 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>   
>   PV = "2021.05"
>   
> -SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
> +SRCREV = "1e73d9387980f4d425742738968e55395c19e26c"
>   BRANCH ?= "ti-linux-firmware"
>   SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>   SRCREV_FORMAT = "imggen"
> 
