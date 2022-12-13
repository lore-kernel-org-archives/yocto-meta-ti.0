Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6088C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 20:03:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.84578.1670961828996146442
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 12:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CMR+gYCx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BDK3iSb083868;
	Tue, 13 Dec 2022 14:03:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670961824;
	bh=MqL1q0NvZIYlGV8dS18fs4IvDfTA+UIE8C32yIKPVzA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CMR+gYCxxsFvNYuSAdQ9gnMhnvPv0sX8sKm0jX4MvDPCiGronxQGavdsAs1ggFqP3
	 JBlInjcuSwcldzuMOC+FLFXCzsYwXWyZwv8nulJsxsZnF8AWHd1TuOq6gxSjVSiYXn
	 /NuIZiUHwTBD5NkcEdU/VQ2HfwovoauZsmmxT2mY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BDK3ilH057227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Dec 2022 14:03:44 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 13
 Dec 2022 14:03:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 13 Dec 2022 14:03:43 -0600
Received: from [10.250.35.40] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BDK3hAG075724;
	Tue, 13 Dec 2022 14:03:43 -0600
Message-ID: <20d8ecea-39f8-d965-7a1b-d0e085031095@ti.com>
Date: Tue, 13 Dec 2022 14:03:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][dunfell][PATCH 1/2] Revert "conf: machine: k3: Add
 fitImage to the default kernel image types"
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
References: <20221213183818.206660-1-jose.quaresma@foundries.io>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221213183818.206660-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 20:03:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15467



On 12/13/2022 12:38, Jose Quaresma wrote:
> This reverts commit e6deeba806d2145fa16b0b5f444f2985e63e6366.
> 
> Currently building with am62xx-evm/am64xx-evm machine fails with:
> 
> | make[1]: *** No rule to make target 'fitImage'.  Stop.
> | make: *** [/build/tmp/work-shared/am62xx-evm/kernel-source/Makefile:185: __sub-make] Error 2
> | ERROR: oe_runmake failed

This is a little surprising as we build dunfell every night without 
issue.  Are you using the linux-ti-staging kernel in your build?


> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   conf/machine/include/k3.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 349f4fda..ef4f107f 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>   PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>   
>   KERNEL_IMAGETYPE = "Image"
> -KERNEL_IMAGETYPES = "Image fitImage"
> +KERNEL_IMAGETYPES = "Image"
>   
>   UBOOT_ARCH = "arm"
>   UBOOT_ENTRYPOINT = "0x80008000"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15465): https://lists.yoctoproject.org/g/meta-ti/message/15465
> Mute This Topic: https://lists.yoctoproject.org/mt/95650880/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

