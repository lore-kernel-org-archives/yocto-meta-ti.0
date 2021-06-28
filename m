Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.14568.1624902029610224499
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 10:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GgqsxVy5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15SHePjB005601;
	Mon, 28 Jun 2021 12:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624902025;
	bh=fekDgMD5/PBgcDDbKmLza2YzMKuv7ElPsObeCJ8j9T4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=GgqsxVy56cWR8BSWuAOzGOEthu6sZLQVpSBlIex3d5N6z5+ipygl0xBQe/+wOpdN+
	 QZjSZgunwO5T3DRYFv1XiyUIneh8aecIgqD6ztfEKYXEcMiJE14zy3ThMbOpgs/8M0
	 yQKYYi87B5rPr24jYXl9JHIksFm2P+Do/YjkV0n4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15SHeOq2064245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 12:40:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 12:40:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 12:40:23 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15SHeMZk081217;
	Mon, 28 Jun 2021 12:40:23 -0500
Subject: Re: [PATCH 1/2] prusw-fw: Update switch firmwares to 3.2.9 version
To: Vignesh Raghavendra <vigneshr@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <20210628144805.16996-1-vigneshr@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <5df72a60-9793-04b2-bae9-5164b510ee02@ti.com>
Date: Mon, 28 Jun 2021 12:40:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628144805.16996-1-vigneshr@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yogesh,Vignesh,

On 6/28/2021 9:48 AM, Vignesh Raghavendra wrote:
> From: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Update prueth switch firmwares to 3.2.9 version
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>   recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} (94%)
> 
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> similarity index 94%
> rename from recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
> rename to recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> index 17de58c2..3f5ef7e7 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
> +SRCREV = "dccfb2328354be2933a5a179b528ec8a18b92d3a"

Can we have once central recipe for ti-linux-firmware to pick the right 
SRCREV when firmware is integrated recipe-bsp/ti-linux-fw*/*.bb 
something like that, Instead of pointing to a different SRCREV in 
different bb recipe ?

I see 9 different recipe-bsp/<>/ locations potentially pointing to 
different SRCREV.


>   BRANCH ?= "ti-linux-firmware"
>   
>   SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> 
