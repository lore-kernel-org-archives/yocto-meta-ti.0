Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1401.1644264423547114345
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 12:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kVxX7rjn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217K719c049881;
	Mon, 7 Feb 2022 14:07:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644264421;
	bh=A2GIu9vfbYNy6XA2dHes4S87yxKr3nVm+rQeCowbXrc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=kVxX7rjnJOze1tCQWtOQrOimxUyjWpLYmMTiOkctlA9EdEufapD7sVogKLxA7K51F
	 3h1GP4KIP27/Y7yx46aAr0kpmQEDRHhiNJYa+rz+frMsGsqFdGMbgDarIrq3bQGH95
	 mL1U1k0wzqF+It3k8s9FOnwKba4HWEO5Gj+CjXkE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217K71Ar110883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 14:07:01 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 14:07:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 14:07:01 -0600
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217K70uo004224;
	Mon, 7 Feb 2022 14:07:00 -0600
Message-ID: <5ccc74db-39a5-51ec-e739-7e12730032d1@ti.com>
Date: Mon, 7 Feb 2022 14:07:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [meta-ti][dunfell][PATCH] ti-linux-fw: Bump to 08.02.00.001 release
To: Ryan Eatmon <reatmon@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220207195043.22226-1-reatmon@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220207195043.22226-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/7/2022 1:50 PM, Ryan Eatmon wrote:
> Updated the ti-linux-fw version for 08.02.00.001
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com> > ---
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 014e89c8..612e0689 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
>   IMG_DEC_FW_VERSION = "1.0"
>   CNM_WAVE521_FW_VERSION = "1.0.00"

Few more places needs recipe update.
https://git.yoctoproject.org/meta-ti/tree/recipes-bsp/ti-linux-fw/ti-linux-fw.inc?h=dunfell

How about
K3_IMAGE_GEN_SRCREV ?= "892c86501ff745dfde4d535923ce686f45700da3"

and

CORESDK_RTOS_VERSION = "08.02.00.04"

and

PV = "2022.01"

>   
> -TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
> +TI_LINUX_FW_SRCREV ?= "028414712b4ab3861dc4cc2aa14d7c5f5a37b521"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>   
>   BRANCH ?= "ti-linux-firmware"
