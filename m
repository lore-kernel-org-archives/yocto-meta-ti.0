Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1400.1624926586632176226
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GnnrzSyI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0TjQc108234;
	Mon, 28 Jun 2021 19:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926585;
	bh=j+CCV20df7WmzkgIXdYou8UngzxEcR9U9rUeVaJISBM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=GnnrzSyIg7/MSUrsAjpSH3WZ/LlMql1u4ESZxHxURqRd8YBdAXN2PNgWHBK3C5EX2
	 0u6HtAxu0WORgGhKZYAfDf/zRawFeosWthP0BD8G/UW73125eeEpXzn0Ladz/R9BaI
	 qRSeK2Ud3fc8GDi6rny2PjG/haZoOws+7tEXkQlE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0TjOZ068773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:29:45 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:29:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:29:45 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0TjqC118630;
	Mon, 28 Jun 2021 19:29:45 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH 0/4] Release 08.00.00.001 update
To: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210629002618.29822-1-yogeshs@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <9d4255d9-7ea0-eb52-4baa-3f3e9df7882b@ti.com>
Date: Mon, 28 Jun 2021 19:29:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629002618.29822-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/28/2021 7:26 PM, Yogesh Siraswar wrote:
> Update for 08.00.00.001 release tag

For all of the patches , the commitmsg is empty,
please provide some details

> 
> 
> Yogesh Siraswar (4):
>    ti-sci-fw: Update imggen to release 08.00.00.001 tag
>    u-boot-ti-staging: Update to 08.00.00.001 release tag
>    linux-ti-staging-rt: Update to 08.00.00.001 release tag
>    linux-ti-staging: Update to 08.00.00.001 release tag
> 
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc              | 2 +-
>   recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
>   recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
