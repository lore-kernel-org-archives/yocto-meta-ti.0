Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.449.1610061338248051231
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 15:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C8Bb0YxY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107NFbA0084174
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:15:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610061337;
	bh=9Iku9EKx/fKhCcvNxfUYnPze69kfEvFzWrZNjYrMqTo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=C8Bb0YxY0X6s5dYiIh+In0t67qA2EaM5fD69YtCM6R3xrMnefONjp7jehFU30j4/S
	 BJbGHVOs5aiFrccVTEuhHv/P1Zwq71wJZ+mUMc+aqPHkaFGDh2USzKH2Jk0MPQAffE
	 I3srl1BsNqIwDA1+JZnHsrHMg1aGX7GHkulqg4pc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107NFbs8125938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:15:37 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 17:15:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 17:15:37 -0600
Received: from [128.247.81.61] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107NFaYV076146;
	Thu, 7 Jan 2021 17:15:37 -0600
Subject: Re: [master/dunfell PATCH V2] ti-sci-fw: am64x: Update image gen and sysfw to v2020.12
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, suman Anna <s-anna@ti.com>
References: <20210107231438.18812-1-praneeth@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <30820829-d869-d4cd-36f1-55deb78e7a93@ti.com>
Date: Thu, 7 Jan 2021 17:15:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107231438.18812-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/7/21 5:14 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update the image gen and sysfw commit SHAs so that am64x picks
> v2020.12 version.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
> v2: update commit message
> 
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 174d9539..ae22b7a5 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -4,11 +4,11 @@ LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>   
>   PV = "2020.08b"
> -PV_am64xx-evm-k3r5 = "2020.23"
> +PV_am64xx-evm-k3r5 = "2020.12"
>   
> -SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
> +SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
>   BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
> +SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
>   SRCREV_FORMAT = "imggen"
>   
>   SRC_URI = " \
> 
