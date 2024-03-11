Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF733C54E60
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:35:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.61513.1710160535839835618
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 05:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=susx3GnD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BCZYws104418;
	Mon, 11 Mar 2024 07:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710160534;
	bh=CiGsZHtvOAERC9R9IV1S2bibFa4UQr+wmeTmrFS4yog=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=susx3GnDxukb/bmSM/V9WJitSwUmaALQk2j7gCBkLh2QzsZHR/FXVfa5EVViVpnK6
	 NdGAx+Fxf3NUJsNXtepI9iiWzoZ5raKhgjXAFMjF3YHf+sPu4jfijUYzs0yw/88zFm
	 4SIztJz9sXg9LUiyN3ZlcE5z8Gvo8cIkzDhVHXnU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BCZYGL010089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Mar 2024 07:35:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 07:35:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 07:35:34 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BCZXkh013975;
	Mon, 11 Mar 2024 07:35:34 -0500
Message-ID: <56ceda24-b8b5-4074-80bc-cd800ab18321@ti.com>
Date: Mon, 11 Mar 2024 07:35:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH] export ov10635 camera device tree overlay
Content-Language: en-US
To: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>
References: <20240311111359.1556157-1-u-kumar1@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240311111359.1556157-1-u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Mar 2024 12:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17507


We typically put the file grouping of the change in the commit message. 
For example:

conf: machine: am57xx: export ov10635 camera device tree overlay


On 3/11/2024 6:14 AM, Udit Kumar via lists.yoctoproject.org wrote:
> Adding ov10635 camera overlay in default build
> 
> 
> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> index 43a6a833..9a06e801 100644
> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
> @@ -29,6 +29,7 @@ KERNEL_DEVICETREE = " \
>       am57xx-beagle-x15-revc.dtb \
>       am5729-beagleboneai.dtb \
>       am571x-idk.dtb \
> +    ov10635.dtbo \

This change is not needed to get this overlay into the TI kernels.  This 
is already included in the KERNEL_DEVICETREE_PREFIX variable and is part 
of the builds.  The KERNEL_DEVICETREE is used to reference files that 
are upstreamed, which is seems on quick glance, that this overlay is not 
upstreamed.

Were you seeing a problem that this patch is seeking to resolve?


>       am572x-idk.dtb \
>       am574x-idk.dtb \
>   "
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17505): https://lists.yoctoproject.org/g/meta-ti/message/17505
> Mute This Topic: https://lists.yoctoproject.org/mt/104860956/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

