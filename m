Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97A4C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 16:37:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2756.1675874272728545205
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 08:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iLZcwH5F;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318GbqLj023838;
	Wed, 8 Feb 2023 10:37:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675874272;
	bh=CQtuTlf5AH/PtqnLLXdj+sZAUMi7KeFLQM52aG66g00=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iLZcwH5F2nco0SUXcGMWwKTJzaXNnqR5t8pKi60BOaaMjTiTMK+IgfPd1kzc3PrGR
	 LGjgFbGqK5GeYI4W+B8zCqmvDMvwkBMTQmrmGZvZMe4YXw8IX0U3BDdZoTN45D0pPm
	 0/PunKHb5m9zrcYjhmUCYfoVGPiQ26AoXvlWZkGU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318GbqF5100188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 10:37:52 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 10:37:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 10:37:51 -0600
Received: from [10.250.32.73] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318GbpXA025738;
	Wed, 8 Feb 2023 10:37:51 -0600
Message-ID: <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
Date: Wed, 8 Feb 2023 10:37:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230207151300.3223-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 16:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15750



On 2/7/2023 9:13, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The AM68 SK has PWM output pins connected to its RPi headers. Add
> overlay file to enable PWM pins.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes in v2:
> ==============
> Address review comment:
>   - Remove extra space
> 
> v1:https://lists.yoctoproject.org/g/meta-ti/message/15730
>   
>   conf/machine/j721s2-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 7c120dcc..f1127ed5 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>       ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>       ti/k3-am68-sk-fpdlink-fusion.dtbo \
> +    ti/k3-am68-sk-rpi-hdr-ehrpwm.dtbo \
>       ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>       ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>       ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \


This file does not exists in the kernel (yet?).  I'm assuming that you 
all have put in the patch for it and we are just playing a waiting game?

If that is the case, then I would appreciate (in the future) not 
submitting these patches to the meta-ti mailing list until the kernel 
.dtb changes have been accepted into the kernel.  This is the second 
patch in recent weeks that I'm having to sit on until the kernel catches 
up...

It makes it really hard to test these patches if the kernel part is not 
there, and I do not have the bandwidth to keep checking daily if the 
change has made it into the public/cicd branches.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

