Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EBEC3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 07:19:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7300.1720509542289273624
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 00:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wcqEQ9/D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4697IxMd030463;
	Tue, 9 Jul 2024 02:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720509539;
	bh=O7dmRx9QazN1HPIhcl+A189QYs86JFrAX5yKODOsMLY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wcqEQ9/DIQ1akLdJ3JqQ0Ezl5rvRI8nQ9C6+U9xwCVo2JVKsB2jASA86fl1iQAsUJ
	 g7ixsB65foJ78BeKaNV0xli/to6lmO1HdZVASuBb03HsgflV+cpkU2cxexsZeUPb6q
	 +oLo9mdQQ/62s8wFDzgV+mNofwZAqefzYIhGyHCI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4697Ixnk009074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 02:18:59 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 02:18:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 02:18:58 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4697Itdb036051;
	Tue, 9 Jul 2024 02:18:56 -0500
Message-ID: <0b4fb757-2360-4b0a-b04c-ac31287bbdb3@ti.com>
Date: Tue, 9 Jul 2024 12:48:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denys@konsulko.com>,
        <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
 <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
 <297d188e-1904-4c4f-9e2f-a4b13a0eb367@ti.com>
 <7c683042-2573-40ba-bc0a-3b5181a15f00@ti.com>
 <ff14ecd5-84da-4492-97e1-e2347b8f7175@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <ff14ecd5-84da-4492-97e1-e2347b8f7175@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 07:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17838

Hi Siddharth,
On 09/07/24 11:01, Siddharth Vadapalli wrote:
> On Tue, Jul 09, 2024 at 09:55:41AM +0530, Chirag Shilwant wrote:
>> Hi Siddharth,
>> On 09/07/24 09:36, Siddharth Vadapalli wrote:
> [...]
>
>>> Since USB DFU is independent of Splash Screen, I agree that the above
>>> approach you have suggested is the right way to implement this. I will
>>> implement your suggestion in the v4 patch.
>>
>>
>>
>> Agreed with Ryan. This approach looks much cleaner. I would encourage you
>> to build test the case where both am62x_evm_prune_splashscreen.config &
>> am62x_r5_usbdfu.config
>> are passed to u-boot just to avoid last moment hiccups during final code
>> freeze stage :)
>>
> I have built and tested the combination:
> am62px_evm_r5_defconfig + am62x_r5_usbdfu.config +
> am62x_evm_prune_splashscreen.config
>
> I did not face any build errors and have also validated USB DFU
> functionatlity. Logs:
> https://gist.github.com/Siddharth-Vadapalli-at-TI/38331822c5f8ed0887225ecab51f3395

Thanks Siddharth for confirmation.
With Ryan's comments getting addressed in v4, you have my

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

>
> Regards,
> Siddharth.

