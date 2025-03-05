Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE30DC282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:09:05 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.18824.1741194544219331955
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 09:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZRu27NK4;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525H93k53464774
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:09:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741194543;
	bh=97VDwwgS0UdJJXLrOqcx3F0gkLdaKDCGlVUiRXrhxNY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZRu27NK4ulLA/UxLxHNSXAqLZqkvS2f+wJ3XpW0BC3vfdpz/VL48PGu2EJOeXYKXB
	 PA8G/daBucSzgQoghY05KVmEh/yyGg5CohMkfXhhlMB7lz0jiSMUkDyHTP7pK+WPOs
	 ozR1wRgAWr1OIXLbSOUSLQF3xrdGa9WLzZWBpsX0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525H93bs018502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Mar 2025 11:09:03 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 11:09:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 11:09:03 -0600
Received: from [10.249.33.231] ([10.249.33.231])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525H93gi120807;
	Wed, 5 Mar 2025 11:09:03 -0600
Message-ID: <42e5b7ce-2eaf-4c5f-a4d7-f67bdc90060d@ti.com>
Date: Wed, 5 Mar 2025 11:09:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH v3 3/3] conf: machine:
 am57xx-evm : Enable gc320 machine feature for am57xx
To: <a-christidis@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250305165248.354807-1-a-christidis@ti.com>
 <20250305165248.354807-4-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250305165248.354807-4-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Mar 2025 17:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18354



On 3/5/2025 10:52 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> MACHINE_FEATURE gc320 already gets set on omap-a15.inc. But ti-bsp.inc file,
> removes the feature. So, remove that portion of functionality from ti-bsp, in
> order to allow the building of gc320.
> 
> Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index 32beacee..4f458d96 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -59,7 +59,7 @@ BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
>   
>   # GC320 support requires out-of-tree drivers not yet available in 6.12
> -MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
> +#MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"

I missed this on the last series...  Remove it, don't comment it out.


>   # ==========
>   # ti-6_6
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18352): https://lists.yoctoproject.org/g/meta-ti/message/18352
> Mute This Topic: https://lists.yoctoproject.org/mt/111531515/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

