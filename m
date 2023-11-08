Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C99C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:54:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.17512.1699458881451396433
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 07:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j+pzpamZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8FseVP102288
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 09:54:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699458880;
	bh=N3noB9KU1S7AlfWruXQxaBceFqi2lw0TZuQGFskYy+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j+pzpamZWP3i1OXXZn9ErzhtitbPalH7iKA97SM79R8RZ+IyTlZY59QfN0kuaWejK
	 czx4FWmcI1WkaGpBkMXf7n/WQimGLpmqTpXTNyrcaETMvCb1QfId98ulAuK+QYjMUC
	 Sc2912Adbgk1sykhQo0G/aP+j9MHW3GpmYxuYmuM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8Fsejt112097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 09:54:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 09:54:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 09:54:40 -0600
Received: from [10.247.22.64] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8Fsetb045791;
	Wed, 8 Nov 2023 09:54:40 -0600
Message-ID: <efb3f81e-0a77-4d27-8c0a-ac960fa527ff@ti.com>
Date: Wed, 8 Nov 2023 09:54:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH] conf: machine: am62*: extend picking common
 overlays by prefix
To: Jai Luthra <j-luthra@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Judith Mendez <jm@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
References: <20231107235316.29646-1-praneeth@ti.com>
 <kgov7kcyobeprifgp5unjgtlojlfquv5jrdrndcdfh4owikvhh@sng65qgpanzb>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <kgov7kcyobeprifgp5unjgtlojlfquv5jrdrndcdfh4owikvhh@sng65qgpanzb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 15:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17273



On 11/8/2023 1:07 AM, Jai Luthra wrote:
> Hi Praneeth,
> 
> Thanks for the patch.
> 
> On Nov 07, 2023 at 17:53:16 -0600, Praneeth Bajjuri wrote:
>> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix")
>> picks common HDMI and CSI overlays for am62 platform variants.
>>
>> Adding capability to extend the same prefix for common overlays for
>> am62 family in more generic way to include new mcan overlays added [1]
>>
>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3b01c392627f
>>
>> given the differences in SK-AM62-LP containing  B2B HDMI Samtec connector,
>> just added the kernel prefix to pick common mcan overlay.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am62axx-evm.conf   | 3 +--
>>   meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 3 +--
>>   meta-ti-bsp/conf/machine/am62xx-evm.conf    | 3 +--
>>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>>   4 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> index ef60e9d1..22f61401 100644
>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> @@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
>>   
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-am62a7 \
>> -    ti/k3-am62x-sk-csi2 \
>> -    ti/k3-am62x-sk-hdmi \
>> +    ti/k3-am62x-sk \
>>       ti/k3-fpdlink \
>>   "
>>   
>> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> index 931de953..5e0bab97 100644
>> --- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
>> @@ -6,8 +6,7 @@ require conf/machine/include/am62pxx.inc
>>   
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-am62p5 \
>> -    ti/k3-am62x-sk-csi2 \
>> -    ti/k3-am62x-sk-hdmi \
>> +    ti/k3-am62x-sk \
>>   "
>>   
>>   KERNEL_DEVICETREE = " \
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> index b60ba156..fadbc6f4 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> 
> I would guess we can also do this for am62xxsip-evm.conf.
> Or is MCAN not available on the SIP board for some reason?

Thanks for catching it.
Will send a v2 with sip


> 
> With that handled -
> Reviewed-by: Jai Luthra <j-luthra@ti.com>
> 
>> @@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
>>   
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-am625 \
>> -    ti/k3-am62x-sk-csi2 \
>> -    ti/k3-am62x-sk-hdmi \
>> +    ti/k3-am62x-sk \
>>   "
>>   
>>   KERNEL_DEVICETREE = " \
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index 0d2f89ca..afa5e061 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-am62-lp \
>>       ti/k3-am625-sk \
>>       ti/k3-am62x-sk-hdmi \
>> +    ti/k3-am62x-sk-mcan \
>>   "
>>   
>>   KERNEL_DEVICETREE = " \
>> -- 
>> 2.17.1
>>
> 
> Thanks,
> Jai

