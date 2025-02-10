Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC825C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 14:47:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.52714.1739198858268920053
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 06:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YiP9FskI;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AElaGJ059956
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 08:47:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739198856;
	bh=Yswd0K9Fffxiyit1CQSuQ1MwCD2gcgF253X6t773YuM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YiP9FskIllRjdCG2D7CB+J45U3ZKbpFqWUHQbjqdrZ44okGttTW+qPIf8LMYJjDwN
	 +Mbl99TZd3kJzWKI1xJ89PcBDs7LtEN3dQoaxY3Yf//cEP4BPuf4863HGuTFf+wNzo
	 z1pFiToWvg2hBTwpfohdZbdxx86/piBveO8Mzu/M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AElaBm091858
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 08:47:36 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 08:47:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 08:47:36 -0600
Received: from [10.249.32.250] ([10.249.32.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AElXJb015714;
	Mon, 10 Feb 2025 08:47:36 -0600
Message-ID: <40d9c41f-9ce1-4d58-a600-f22c6c6fd689@ti.com>
Date: Mon, 10 Feb 2025 08:47:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3] conf: machine: j722s: Add overlay
 to KERNEL_DEVICETREE_PREFIX
To: Anurag Dutta <a-dutta@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <c-shilwant@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250210110247.6520-1-a-dutta@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250210110247.6520-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 14:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18297


This patch will not apply as the first version of the patch was already 
accepted and promoted last week.  You really need to check the main prod 
branches before sending v2 and v3.


On 2/10/2025 5:02 AM, Anurag Dutta wrote:
> Add the overlay "k3-am625-sk-mcspi-loopback.dtso" to the j722s
> configuration so that SPI loopback tests can be carried out
> successfully.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> v3: Changelog:
> 1) Correction in changes
> 
> Link to v2: https://lore.kernel.org/all/20250210080101.75507-1-a-dutta@ti.com/
> 
> v2: Changelog:
> 1) Added the correct branch
> 2) Added the correct overlay with test results
> 
> Link to v1: https://lore.kernel.org/all/20250205073251.42414-1-a-dutta@ti.com/
> 
> Test_link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948
> 
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 2af0981e..52a6cfbd 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> +    ti/k3-am625-sk-mcspi-loopback \
>       ti/k3-v3link \
>   "
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

