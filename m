Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EA0C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:19:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.78456.1673284757933980246
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VS5O9Nt+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309HJEPj127579;
	Mon, 9 Jan 2023 11:19:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673284754;
	bh=leD8VYM/93A31AMKiMYyD/SR51i3vsA92hmT85wM/5M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VS5O9Nt+rqVPeP9V6h6+mif7SsONu6u79VwCJg6Rg7BH2L92LmD1bRjdOSNvbZUvu
	 lgTwN/YApvcR0zdnkmaZILfj3jIv3oaZJ44sGFkXTiAgk/OEYuVOi4nRpFbU6oyFeE
	 7YuDpTZZREzxvRYRiq8UwZLyENZF8jaO0MCOU5+g=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309HJEqd006928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 11:19:14 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 11:19:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 11:19:13 -0600
Received: from [10.250.35.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309HJDB0009879;
	Mon, 9 Jan 2023 11:19:13 -0600
Message-ID: <9429e0e0-5ca8-a706-c757-82079dc51341@ti.com>
Date: Mon, 9 Jan 2023 11:19:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [[meta-ti][master/dunfell][PATCH]] conf: machine: j721s2: Add
 AM68 SK specific dtb and dtbo to KERNEL_DEVICETREE
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Sinthu Raja <sinthu.raja@mistralsolutions.com>, <denys@ti.com>,
        <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20221228112906.5301-1-sinthu.raja@ti.com>
 <176c06ef-ae8c-bfaf-20fe-5a20ae4a1e73@ti.com>
 <20230109170137.GR22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230109170137.GR22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15542



On 1/9/2023 11:01, Denys Dmytriyenko wrote:
> On Mon, Jan 09, 2023 at 10:19:53AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> On 12/28/2022 5:29, Sinthu Raja wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> AM68 Starter Kit is a low cost, small form factor board designed for
>>> TI's AM68/J721S2 SoC[1] which is optimized to provide best in class performance
>>> for industrial applications. Add DTB entry for the same.
>>>
>>> AM68 SK features camera support with MIPI(OV5640) and RPi(IMX219) connectors.
>>> Add DTBO for the same. Also, add DTBO entry for the DDR memory carveout.
>>>
>>> [1]:http://www.ti.com/lit/zip/spruj28
>>>
>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>> ---
>>>   conf/machine/j721s2-evm.conf | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
>>> index 6377c459..abdd9e03 100644
>>> --- a/conf/machine/j721s2-evm.conf
>>> +++ b/conf/machine/j721s2-evm.conf
>>> @@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
>>>   OPTEE_K3_USART = "0x8"
>>>   KERNEL_DEVICETREE = " \
>>> +    ti/k3-am68-sk-base-board.dtb \
>>> +    ti/k3-am68-sk-bb-csi2-ov5640.dtb \
>>> +    ti/k3-am68-sk-rpi-cam-imx219.dtbo \
>>
>> This file is not what made it into the kernel.  The file in the kernel is:
>>
>> ti/k3-am68-sk-bb-rpi-cam-imx219.dts
>>                ^^
>>
>> Fix this and resubmit the patch please.
> 
> Please also avoid nested brackets in the Subject, otherwise you get this issue
> in the git history:
> https://git.yoctoproject.org/meta-ti/commit/?h=dunfell-wip&id=8e63da858658b7b6ac51803f943c1023248d178f
> 

Yes.  I forgot to mention that.  Thank you.


>>> +    ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>>>       ti/k3-j721s2-common-proc-board.dtb \
>>>       ti/k3-j721s2-gesi-exp-board.dtbo \
>>>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

