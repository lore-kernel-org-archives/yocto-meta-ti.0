Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2184.1630352752243785171
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 12:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZDix5Eg1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17UJjpJW119413;
	Mon, 30 Aug 2021 14:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1630352751;
	bh=68dfVRQ/DWiBTGerGiD0HScNe15yYylV7/LL1pUSLME=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ZDix5Eg1BTQlPahnnpOkny0Enr/xbtKClaQ5Z52avqU8JpyIWPZf7KXOufxFbeNKe
	 4TSd8QOhQhBlRfZ/5qqBrOVNW1PP35PTJQttvkqTDjyjwTZRVZO9Jm956CuUMK0Lls
	 wVtst6KwnyCDrtOz0mA3bcqaqk1fffu5rB3Ezkcg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17UJjpt7009787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Aug 2021 14:45:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 30
 Aug 2021 14:45:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 30 Aug 2021 14:45:50 -0500
Received: from [10.250.32.100] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17UJjoDw015879;
	Mon, 30 Aug 2021 14:45:50 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Sinthu Raja <sinthu.raja@ti.com>
References: <20210830082442.4064-1-sinthu.raja@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <7d85dd2a-8f4e-c983-d844-78b02e648f17@ti.com>
Date: Mon, 30 Aug 2021 14:45:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210830082442.4064-1-sinthu.raja@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/30/2021 3:24 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Update to the latest commit of ti-u-boot-2021.01
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> index 53a95f201..6901dcb50 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>   
>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>   
> -PR = "r11"
> +PR = "r12"
>   
>   BRANCH = "ti-u-boot-2021.01"
>   
> -SRCREV = "53e79d0e89f975eeb874366dd9a92f68b3a599d1"
> +SRCREV = "d77252021a85c72d7ff9a4e151b81c4b4b9e1205"

NAK
We are not making any intermediate update to u-boot commit id.
All the commit ID are tied to core sdk releases.
If you want to use the latest or use the above commit ID please
use bleeding or bbappend respectively.

> 
