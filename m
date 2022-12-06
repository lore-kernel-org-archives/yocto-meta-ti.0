Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E0C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 20:30:26 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2489.1670358623800744259
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 12:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MIdhWobg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6KUMo3070290;
	Tue, 6 Dec 2022 14:30:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670358622;
	bh=/xDgCVqUOfIjDC45ybRpVDoxyJzGYpil34mibW8ivAo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MIdhWobgb3O1wGNEvoZ8z6brGIdCGZjaKT3ApQV0wxndBGswbaCELZ/HO7JW6MUN7
	 x3BRbdNhsbZHA8fC/D9T3NcrhafNfVJu1+wXKm0y6SlfhwcJ/T6n7UmVofOA3MJPO4
	 AQRFlRgJcWwpO6e538bdq7nVaOsZSQW/+M6zR2wA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6KUMuQ022396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Dec 2022 14:30:22 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 14:30:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 14:30:22 -0600
Received: from [128.247.81.102] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6KUL9a106817;
	Tue, 6 Dec 2022 14:30:22 -0600
Message-ID: <2e6c5227-69f3-f739-cd85-e9b11d352740@ti.com>
Date: Tue, 6 Dec 2022 14:30:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [dunfell][PATCH] conf: machine: am62xx: Add missing overlays for
 AM625 SK
Content-Language: en-US
To: Vibhore Vardhan <vibhore@ti.com>, Jai Luthra <j-luthra@ti.com>
CC: <a-bhatia1@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20221205114518.17263-1-a-bhatia1@ti.com>
 <56f7dbf8-a257-849e-9a2f-d7b886da2543@ti.com>
 <20221206085820.trzkdiz4nkcawv2a@metta>
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20221206085820.trzkdiz4nkcawv2a@metta>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 20:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15418



On 12/6/2022 2:58 AM, Vibhore Vardhan wrote:
> Hi,
> 
> On 14:00-20221206, Jai Luthra wrote:
>> Hi,
>>
>> Sorry my last reply didn't reach the list, sending it again -
>>
>> On 05/12/22 17:15, a-bhatia1@ti.com wrote:
>>> Add the overlay files, over AM625 SK, for the following:
>>>
>>> 1. Technexion OV5640 Camera
>>> 2. Enhanced Capture (ECAP)
>>> 3. HDMI Audio Output
>>> 4. MCAN Transceiver
>>> 5. Microtips OLDI Panel
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> For 1 & 3,
>>
>> Tested-by: Jai Luthra <j-luthra@ti.com>
> 
> For #2,
> 
> Tested-by: Vibhore Vardhan <vibhore@ti.com>
> 

For #4,

Tested-by: Judith Mendez <jm@ti.com>

>>> ---
>>>    conf/machine/am62xx-evm.conf | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
>>> index cbab26dd15c8..3d9e3b903487 100644
>>> --- a/conf/machine/am62xx-evm.conf
>>> +++ b/conf/machine/am62xx-evm.conf
>>> @@ -11,6 +11,11 @@ KERNEL_DEVICETREE = " \
>>>        ti/k3-am625-skeleton.dtb \
>>>        ti/k3-am625-sk-lpmdemo.dtb \
>>>        ti/k3-am625-sk-csi2-ov5640.dtbo \
>>> +    ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
>>> +    ti/k3-am625-sk-ecap-capture.dtbo \
>>> +    ti/k3-am625-sk-hdmi-audio.dtbo \
>>> +    ti/k3-am625-sk-mcan.dtbo \
>>> +    ti/k3-am625-sk-oldi-panel.dtbo \
>>>    "
>>>    UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>>
>> Thanks,
>> Jai

