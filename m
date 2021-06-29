Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1408.1624926495543110420
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vyxrYezA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0SEvn107549;
	Mon, 28 Jun 2021 19:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926494;
	bh=JzpaH/hDwGFlL5q26IZ17jZR+EEtkNBEYSfAV5al8YM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vyxrYezAvvY9F+hI1XFLpj2UcaF8G9eDmHlsoR4gsJp04w5sqtm+HUydkiEBTZdrC
	 TWAkEHthou061tf4kYPZKNxZl5cXu6V6Ys1qedRji9h35iYVBJ5scHHXb6LKgArw8C
	 ndhgTukCr8EYecBmhuEupIefidZFvxLegVoflq18=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0SEJw066512
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:28:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:28:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:28:14 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0SEbV052547;
	Mon, 28 Jun 2021 19:28:14 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH 1/4] ti-sci-fw: Update imggen to release 08.00.00.001 tag
To: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210629002618.29822-1-yogeshs@ti.com>
 <20210629002618.29822-2-yogeshs@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <c7d88a6b-f8dd-0565-29bd-65849b049ab4@ti.com>
Date: Mon, 28 Jun 2021 19:28:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629002618.29822-2-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/28/2021 7:26 PM, Yogesh Siraswar wrote:
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 7ec074c8..e6227632 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -7,7 +7,7 @@ PV = "2021.01a"

PV is 2021.05


>   
>   SRCREV = "0468c7a78cd26f9190d374e198e37c63c7660ba9"
>   BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
> +SRCREV_imggen = "b65ae80847f5a0d1885ed6e4de4d9d635544053c"
>   SRCREV_FORMAT = "imggen"
>   
>   SRC_URI = " \
> 
