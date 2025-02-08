Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC84C0219B
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 12:39:02 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8105.1739018338408008828
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 08 Feb 2025 04:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L9PoVkRR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 518CcuvU4001644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 06:38:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739018337;
	bh=veUiLS+kG1oKeR5v8qWckGO0bN8xCgua3mGyCnPtJJM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L9PoVkRRZiQSFLCK4SbBevmeDQfrfpVmRhtq6QOWUtD9Kt7/98bzS3k7BRhyb9A4L
	 IbBykUtjw/XWoPSZZFIpOhY9ulVqaaJEoipQCKSWTBMyWdj/L3jHkX46RfZklrLE9M
	 WrqJPlNIkOynHt5QeN8Vg44dckbxdP9noZ/aDfgE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 518CcuCE003947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Feb 2025 06:38:56 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 8
 Feb 2025 06:38:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 8 Feb 2025 06:38:56 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 518CcrgF130437;
	Sat, 8 Feb 2025 06:38:54 -0600
Message-ID: <8f3de3ea-0e89-452f-aef5-015d2d61fb3a@ti.com>
Date: Sat, 8 Feb 2025 18:08:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] conf: machine: j722s: Add overlay to
 KERNEL_DEVICETREE_PREFIX
To: Anurag Dutta <a-dutta@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <u-kumar1@ti.com>
References: <20250205073251.42414-1-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250205073251.42414-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 08 Feb 2025 12:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18290


On 2/5/2025 1:02 PM, Anurag Dutta wrote:
> Add the overlay "k3-j7200-evm-mcspi-loopback.dtso" to the j722s
> configuration so that SPI loopback tests can be carried out
> successfully.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 2af0981e..8f42866c 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> +    ti/k3-j7200-evm-mcspi-loopback \

How do you see, this loopback working,

AFAIK , this SOC does not have mcu_spi2 and main_spi4


>       ti/k3-v3link \
>   "
>   

