Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD22C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 16:46:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.46390.1675097185533588149
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 08:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U3mdLGMi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30UGkOTN073376;
	Mon, 30 Jan 2023 10:46:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675097184;
	bh=BCmlucZ+xtHhORfv+fdhqSFa1jGsbUot2jCdVsce87I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U3mdLGMigdO0LNr1hNbwiA2mIGmj4LdugDWFqQbf3ML3Sj7+kJlyoohgBFF8ZmQbT
	 O4xlO/r+3/8pnu5TGJR9eyf3AO7UZCDNkVHqy1t3RlC9hKMzhY0dnAAGcaKCZwxre4
	 O6Mlyr9+B339pV3JSdF1dqpx+45tqatY52TSRMlE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30UGkO7d007531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Jan 2023 10:46:24 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 10:46:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 10:46:24 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30UGkOsj037159;
	Mon, 30 Jan 2023 10:46:24 -0600
Message-ID: <14e6d774-46af-3195-5ca9-0c3d17fc6c0f@ti.com>
Date: Mon, 30 Jan 2023 10:46:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [dunfell] conf: machine: j784s4: Add AM69 SK specific
 dtb and dtbo to KERNEL_DEVICETREE
Content-Language: en-US
To: Dasnavis Sabiya <sabiya.d@mistralsolutions.com>
CC: <denys@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dasnavis Sabiya <sabiya.d@ti.com>
References: <173DA23955EB1BF3.686@lists.yoctoproject.org>
 <CAAyKsAYWGaLQtjR3-netxteoU6uAwamPaxCOTzoCvx9MfuCbFQ@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAAyKsAYWGaLQtjR3-netxteoU6uAwamPaxCOTzoCvx9MfuCbFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 16:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15700



On 1/30/2023 3:52, Dasnavis Sabiya wrote:
> Hi Ryan,
> 
> On Thu, Jan 26, 2023 at 12:26 AM sabiya.d via lists.yoctoproject.org
> <sabiya.d=mistralsolutions.com@lists.yoctoproject.org> wrote:
>>
>> From: Dasnavis Sabiya <sabiya.d@ti.com>
>>
>> AM69 Starter Kit is a single board designed based on TI's AM69 SOC
>> providing advanced system integration in automotive ADAS applications,
>> autonomous mobile robot and edge AI applications. Add support
>> for the same to include the board dtb file into the root filesystem.
>>
>> Add DT overlays support for the following features on AM69 SK:
>> * Add DTBO entry to support OV5640 camera
>> * Add DTBO entry to support RPi(IMX219) camera
>> * Add DTBO entry for the DDR memory carveout.
>>
>> [1]:https://www.ti.com/lit/zip/spruj52
>>
> Could you please share your review comments on this patch?
> The commit ids of the corresponding kernel patches are:
> 297898231fc5d8d6147619f4bf24a50b3cb682a6
> 57538b947b75be5b4888057b9fad35ddea9cfb1b
> 53d5e1f9c3751b35017ea113cf6d371d352c2323
> 64e9808816e14c52120345ff0a8adbeda24c3f51

The patch has been accepted.  It is just waiting on a passing CI/CD 
build to release it to dunfell.  If you see your patch dunfell-next, 
then you know that it has been accepted.


> Regards,
> Dasnavis Sabiya
>> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
>> ---
>>   conf/machine/j784s4-evm.conf | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
>> index 96acca13..24fa3356 100644
>> --- a/conf/machine/j784s4-evm.conf
>> +++ b/conf/machine/j784s4-evm.conf
>> @@ -13,6 +13,10 @@ OPTEEMACHINE = "k3-j784s4"
>>   OPTEE_K3_USART = "0x8"
>>
>>   KERNEL_DEVICETREE = " \
>> +    ti/k3-am69-sk.dtb \
>> +    ti/k3-am69-sk-csi2-ov5640.dtbo \
>> +    ti/k3-am69-sk-ddr-mem-carveout.dtbo \
>> +    ti/k3-am69-sk-rpi-cam-imx219.dtbo \
>>       ti/k3-j784s4-evm.dtb \
>>   "
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15655): https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2fmessage%2f15655&c=E,1,L6rhkXmGmIsai64tKyhPu6WijXuiMb2CQ3VQrciLUZRQjhfIPzzHslH8vKUomlIRvFxQykzcu_xZrp_yDoe5EyrBA2TNPpxcTZBakE4Bre_cXxLoh8EI&typo=1
>> Mute This Topic: https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fmt%2f96527602%2f7432566&c=E,1,thzBvIyOl3fJ__vz9EAGaNAkIT0Wi1VddDYTNshkq89ZasS0oRdCiNTDA7G-dUFoeNrTpggo7NcvVnl76VFBAy9YYgs_vcBW2X5gQbxgBh4X&typo=1
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-ti%2funsub&c=E,1,F42hsLcudQPDxHl1HkwSTpkDI7k3wBcNyq4AgXTcSi7hllgV9uozJzYB-8YHLZjDeafmE15PxlGzj7Y51mKXe6Q9TWREm4_aK4lQx12nNLPeIliDL39ojpbiNxw,&typo=1 [sabiya.d@mistralsolutions.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

