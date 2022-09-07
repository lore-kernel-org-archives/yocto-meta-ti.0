Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1791EC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:04:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.8150.1662559452425667677
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 07:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Oxemhz8q;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 287E47gs060482;
	Wed, 7 Sep 2022 09:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662559447;
	bh=s8V+yADwHkS+jWnS4pldnvmERuL/eFig4CnIZ0OAoHU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Oxemhz8q4u7CRGZfRFi9LHEPA8GrJpL7x1Z5ikV9SsJ4DM3WsQE6A+kUn75C+YMjJ
	 3DT8HtBhHEfKQ61BznFIvJHjNSCgxgRLU+4h68T15O8noEI9I2G1FCbiM1Dljh7Phq
	 Jdzwp15gwvvl5f5bGw8Wziws3nYFxts7AMU5nWs0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 287E47bh083623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Sep 2022 09:04:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 7 Sep
 2022 09:04:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 7 Sep 2022 09:04:07 -0500
Received: from [10.250.32.221] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 287E46GD094576;
	Wed, 7 Sep 2022 09:04:07 -0500
Message-ID: <dfff2630-0903-c8f9-4be0-bec405058ce9@ti.com>
Date: Wed, 7 Sep 2022 09:04:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 2/2] conf: machine: am64xx: Move
 multi-config targets into base SoC include
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220906231119.29102-1-afd@ti.com>
 <20220906231119.29102-2-afd@ti.com> <20220907001055.GL18429@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220907001055.GL18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Sep 2022 14:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15002

On 9/6/22 7:10 PM, Denys Dmytriyenko wrote:
> On Tue, Sep 06, 2022 at 06:11:19PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> The supported device types depends on the SoC, not on any specific
>> board or EVM. Any board can be populated with any of the 3 supported
>> AM64x types. Move these into the AM64x common include.
> 
> The reason multiconfigs were originally added in the machine config, instead
> of a base SoC include, is because SR2.0 was initially only available for GP
> and not HS variant of AM65x.
> 

Ah, good to know. Okay, so if that has resolved I can go move the others
over too.

I'd like to get to the point where we can add machines with
much less effort than needed today. Users adding their own board I'm
guessing just modify the existing TI EVM machines due to that, instead
of adding their own machine definition, which would be more correct.

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   conf/machine/am64xx-evm.conf    | 26 +++++++-------------------
>>   conf/machine/include/am64xx.inc | 13 +++++++++++++
>>   2 files changed, 20 insertions(+), 19 deletions(-)
>>   rewrite conf/machine/am64xx-evm.conf (76%)
>>
>> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
>> dissimilarity index 76%
>> index d9afb08e..c6ba2a87 100644
>> --- a/conf/machine/am64xx-evm.conf
>> +++ b/conf/machine/am64xx-evm.conf
>> @@ -1,19 +1,7 @@
>> -#@TYPE: Machine
>> -#@NAME: AM64xx EVM
>> -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
>> -
>> -require conf/machine/include/am64xx.inc
>> -
>> -UBOOT_MACHINE = "am64x_evm_a53_defconfig"
>> -
>> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
>> -BBMULTICONFIG += "k3r5-gp"
>> -IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
>> -do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> -
>> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
>> -BBMULTICONFIG += "k3r5-sr2-hs-se"
>> -IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
>> -do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> +#@TYPE: Machine
>> +#@NAME: AM64xx EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
>> +
>> +require conf/machine/include/am64xx.inc
>> +
>> +UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> 
> This diff is very weird - the first 7 lines aren't changing, yet they are
> removed and then added back. Can you please check what went wrong and
> resubmit?
> 

Hmm, that is odd, I'm guessing git considered this a full file re-write..
I'll go mess with my format-patch settings and send again.

Thanks,
Andrew

> 
>> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
>> index 0b9a3e59..913d95e6 100644
>> --- a/conf/machine/include/am64xx.inc
>> +++ b/conf/machine/include/am64xx.inc
>> @@ -14,10 +14,23 @@ KERNEL_DEVICETREE = " \
>>       ti/k3-am642-evm-nand.dtbo \
>>   "
>>   
>> +# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>>   BBMULTICONFIG = "k3r5-sr2-hs-fs"
>>   do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>>   do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>>   
>> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
>> +BBMULTICONFIG += "k3r5-gp"
>> +IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
>> +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +
>> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
>> +BBMULTICONFIG += "k3r5-sr2-hs-se"
>> +IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
>> +do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>> +
>>   TFA_BOARD = "lite"
>>   OPTEEMACHINE = "k3-am64x"
>>   OPTEEOUTPUTMACHINE = "k3"
>> -- 
>> 2.36.1

