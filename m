Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFD1C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 19:16:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.22304.1672859758000611674
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 11:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K8aEoHQM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 304JFspB069204;
	Wed, 4 Jan 2023 13:15:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672859754;
	bh=LT992kC6oBIYrnc29nskA6F3DLOPOquXyWG1p9ox5yU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K8aEoHQMi1Fhi7+aKXxXzVwU58vWSVj1bA80gZBd2/jKorlVWZ7l4Dyw/oG6GPw+O
	 tkzibMntzq9uAfhd+ng5oCgjH8mYJtMRyw+5LUfrfu9RAlAm6LLVHr10tRFvs+F4kW
	 qN7IO8YCCahv7PeMZT72Pz950yUhyxW8VSWH66gI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 304JFsVl027866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jan 2023 13:15:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 4
 Jan 2023 13:15:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 4 Jan 2023 13:15:53 -0600
Received: from [10.250.33.81] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 304JFrRi030823;
	Wed, 4 Jan 2023 13:15:53 -0600
Message-ID: <f212d57f-b05b-4ed8-1d61-e383fa52861e@ti.com>
Date: Wed, 4 Jan 2023 13:15:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Move legacy HS
 signing classes into this layer
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230103175013.3937-1-afd@ti.com>
 <20230104024412.GG22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230104024412.GG22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 19:16:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15520

On 1/3/23 8:44 PM, Denys Dmytriyenko wrote:
> On Tue, Jan 03, 2023 at 11:50:13AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> These were in the meta-arago layer, but any distro should be able
>> to run on HS devices. So move the classes and setup to the BSP layer.
> 
> Well, the class itself hasn't been updated for long time, besides few fixes
> and the rename. I guess since it is used for legacy platforms, not much can be
> done...
> 

Right, wasn't sure if it was worth updating to match the latest in upstream,
but if it is not broke lets not fix it today..

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../classes/kernel-fitimage-legacyhs.bbclass  | 758 ++++++++++++++++++
>>   .../classes/uboot-sign-legacyhs.bbclass       | 131 +++
>>   meta-ti-bsp/conf/machine/am335x-hs-evm.conf   |  10 +
>>   meta-ti-bsp/conf/machine/am437x-hs-evm.conf   |  11 +
>>   meta-ti-bsp/conf/machine/am57xx-hs-evm.conf   |  11 +
>>   meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf   |  11 +
>>   6 files changed, 932 insertions(+)
>>   create mode 100644 meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
>>   create mode 100644 meta-ti-bsp/classes/uboot-sign-legacyhs.bbclass
> 
> <snip>
> 
> 
>> diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
>> index 7caa5bfd..aef0d3aa 100644
>> --- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
>> @@ -16,3 +16,13 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
>>   UBOOT_RD_ENTRYPOINT = "0x84000000"
>>   
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
>> +
>> +# FIT image for legacy secure devices
>> +KERNEL_CLASSES:append = " kernel-fitimage-legacyhs"
>> +KERNEL_IMAGETYPES:append = " fitImage"
> 
> Better use += here. Originally these were machine-specific appends in the
> distro config, but can and should be simply += here in the machine configs.
> As append and remove overrides are very hard to undo downstream.
> 
> Same comment for all 4 platforms, of course.
> 

Makes sense, will fix for v2.

Thanks,
Andrew

