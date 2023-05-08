Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F44C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 15:38:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.111035.1683560339389324944
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 May 2023 08:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LLKsbqGr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 348FcuKs052792;
	Mon, 8 May 2023 10:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683560336;
	bh=7QAQ2d549F2z9VMHcDPsdRuN0H+3XaTZS9ON3mBjMN4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LLKsbqGrtMUjqZ0sApB19f+Yd9Rmc0BX+qnSkwXDnUbaRsaZmbvcRwPBY6Hqgijk3
	 0Hf3JCVViqP8pARRmb90F16dr8TEXD/WdJhJ5zouf5Vw8+850Uv36UxojXE0hMud1u
	 /uEQLCgNOD8WSAJTwM+zQXpPXCROHM468iZqXi48=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 348FcuXK014529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 May 2023 10:38:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 May 2023 10:38:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 May 2023 10:38:55 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 348Fctla008965;
	Mon, 8 May 2023 10:38:55 -0500
Message-ID: <f8a68f99-3f8b-28eb-12d1-1df6b0b3a348@ti.com>
Date: Mon, 8 May 2023 10:38:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: enable
 bxs/8xe apm
Content-Language: en-US, en-US-large
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230508153330.327470-1-rs@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230508153330.327470-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 May 2023 15:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16500

On 5/8/23 10:33, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the src revision to enable the following features on Jacinto:
> 	- Active power managment
> 	- Power island control via firmware
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> index f8489e80..daee230b 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
> @@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
>   
>   S = "${WORKDIR}/git"
>   
> -SRCREV = "b69b689252a1158bff205603288ad12b9482770b"
> +SRCREV = "84e164c11ee8c734c58594eca5e74b86a6e6c612"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"
>   TARGET_PRODUCT:j721s2 = "j721s2_linux"

Please note, this will break kernel 5.10 support until the following 
patch set is merged:
https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/list/?series=4147

And of course k6.1 has already taken the required patches into CICD so 
the current kernel module is broken until this patch is merged. Are you 
having fun? I know I am!

