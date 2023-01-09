Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67237C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:19:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.76425.1673281194874391415
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZcaS0wXZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309GJsde072492;
	Mon, 9 Jan 2023 10:19:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673281194;
	bh=yGpIsSMENR1nvtHg+RZNsmQ2+0gbMpgj2t+ItKzvmDY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZcaS0wXZ3M5RjO7YlTXuhJeDpdKIipMAQbc2+bN+FmGdckb6BY6F2M7wM+6ADBkEP
	 6vAlUzGSrt6SwQyLPbQyx+0wAP/sK191HbKisCttSut8u2F4FMeJJq09TRRPbUz5sE
	 3MoYVTPr9FTcwBHDPbE4R9EyufcXJOFkWuUC8x6E=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309GJsCJ086667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 10:19:54 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 10:19:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 10:19:53 -0600
Received: from [10.250.35.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309GJrnu019397;
	Mon, 9 Jan 2023 10:19:53 -0600
Message-ID: <176c06ef-ae8c-bfaf-20fe-5a20ae4a1e73@ti.com>
Date: Mon, 9 Jan 2023 10:19:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [[meta-ti][master/dunfell][PATCH]] conf: machine: j721s2: Add
 AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20221228112906.5301-1-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221228112906.5301-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:19:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15540



On 12/28/2022 5:29, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> AM68 Starter Kit is a low cost, small form factor board designed for
> TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
> for industrial applications. Add DTB entry for the same.
> 
> AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
> Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.
> 
> [1]:http://www.ti.com/lit/zip/spruj28
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   conf/machine/j721s2-evm.conf | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 6377c459..abdd9e03 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
>   OPTEE_K3_USART = "0x8"
>   
>   KERNEL_DEVICETREE = " \
> +    ti/k3-am68-sk-base-board.dtb \
> +    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
> +    ti/k3-am68-sk-rpi-cam-imx219.dtbo \

This file is not what made it into the kernel.  The file in the kernel is:

ti/k3-am68-sk-bb-rpi-cam-imx219.dts
               ^^

Fix this and resubmit the patch please.


> +    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>       ti/k3-j721s2-common-proc-board.dtb \
>       ti/k3-j721s2-gesi-exp-board.dtbo \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

