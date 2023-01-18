Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89613C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 22:30:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.31408.1674081014636130530
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 14:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DpBH5ORK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30IMU83D038066;
	Wed, 18 Jan 2023 16:30:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674081008;
	bh=aRgK8alE1CRCMkaiz89It+wjd4B8Ym+0G5IZMg6fmn4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DpBH5ORKMtzNuj0rU0asm691caUaFryat9JtwVXakYMfnSkeeI6nHS9VUZnCuGDvO
	 8evHL7ugqzyZUxcLKBWjMw8lebQGwIJ2vi6A32jVkqDAjZ/I4kuc301uJ3UFRUeJE4
	 G+LzGYX5dWHohSOzsqhgrY9e/br82nUqxNj63nr8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30IMU86p030244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jan 2023 16:30:08 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 18
 Jan 2023 16:30:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 18 Jan 2023 16:30:08 -0600
Received: from [10.250.34.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30IMU74E008422;
	Wed, 18 Jan 2023 16:30:08 -0600
Message-ID: <22286775-1f42-b72f-3a31-fd998fadd96f@ti.com>
Date: Wed, 18 Jan 2023 16:30:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 7/7] conf: machine: Rework
 do_image_wic dependencies
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-7-afd@ti.com> <20230118183615.GH22689@denix.org>
 <c0991227-de85-79a1-45a9-76fbce3f3e96@ti.com>
 <173B82AA29E7A438.24231@lists.yoctoproject.org>
 <20230118210820.GJ22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230118210820.GJ22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jan 2023 22:30:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15589

On 1/18/23 3:08 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 18, 2023 at 03:55:29PM -0500, Denys Dmytriyenko wrote:
>> On Wed, Jan 18, 2023 at 01:28:12PM -0600, Ryan Eatmon wrote:
>>>
>>>
>>> On 1/18/2023 12:36, Denys Dmytriyenko wrote:
>>>> On Wed, Dec 07, 2022 at 03:43:12PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>>>>> The WIC image for K3 depends on the TI-SCI firmware, on AM65x and J721e
>>>>> also the bootloader. Make this clear by only depending on firmware in
>>>>> the base k3.inc file, then adding the bootloader dependency in AM65x and
>>>>> J721e specific includes.
>>>>>
>>>>> Remove unneeded overrides from the evm level files.
>>>>>
>>>>> Remove do_image_tar dependencies as the tar files do not include
>>>>> the bootloader nor TI-SCI firmware, only the boot partition of
>>>>> the WIC file needs these.
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
>>>>> index 12ee0c90..6322fe46 100644
>>>>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>>>>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>>>>> @@ -9,6 +9,17 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>>>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>>>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>>>>> +# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
>>>>> +do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
>>>>> +
>>>>> +# Default sysfw.itb on J721e is for SR1.1
>>>>> +BBMULTICONFIG += "k3r5-sr1-1"
>>>>
>>>> There's a slight problem - k3r5-sr1-1 multiconfig previously only applied to
>>>> the HS j721e-hs-evm device, but not the GP j721e-evm, see below.
>>>>
>>>> Hence there's no corresponding k3r5 config j721e-evm-k3r5-sr1-1.conf exists,
>>>> only the one for the HS - j721e-hs-evm-k3r5-sr1-1.conf
>>>>
>>>> Since you moved the above BBMULTICONFIG line into the common j721e.inc, it now
>>>> breaks with the error:
>>>>
>>>> MACHINE=j721e-evm-k3r5-sr1-1 is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.
>>>>
>>>> I can re-spin this series with a fix, so it's easier for Ryan to apply...
>>>
>>> I literally just ran into this while doing the test builds and added
>>> the missing file.  Please feel free to redo the patch series and
>>> I'll reapply everything.
>>
>> Well, it wasn't as simple as just adding the conf file...
>>
>> Anyway, I'm beginning to suspect that J721e SR1.1 is identical to SR1 for GP
>> devices and only differs for HS devices. See this code in the imggen Makefile:
>>

Your suspicion is correct, SR1.1 is a re-spin made to fix a ROM bug relating to HS,
and so SR1.1 GP chips are effectively the same as SR1.0 GP.

>> https://git.ti.com/cgit/k3-image-gen/k3-image-gen/tree/Makefile#n50
>>
>> ifeq ($(SOC_TYPE),gp)
>> ifeq ($(SOC), j721e_sr1_1)
>> override SOC = j721e
>> endif
>> endif
>>
>> So, basically it falls back to the same code path, meaning building both of
>> them is just a waste of time, moreover the filenames will need to be accounted
>> for, as it does not generate the required sysfw-j721e_sr1_1-evm.itb and
>> obviously fails to deploy...
> 
> Andrew, Ryan,
> 
> First of all, this patch set was not locally tested - shame on you, Andrew! :)
> 

Testing, what's that? Sounds like a maintainers' problem :D

> Second, do we want to go back to SR1.1 only for HS, or jump through the hoops
> to make it work for GP as well?
> 

I'd imagine there are very few SR1.0 HS chips left out there, and none went to
production, might be time we drop that support instead. Then just go back to
one type for J721e HS and call it the same for both GP and HS, drop all the
_sr1_1 postfixes or add them to GP (since it doesn't matter for GP).

Andrew

> 
>>>>> +do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>>>>> +IMAGE_BOOT_FILES += "sysfw.itb"
>>>>> +
>>>>> +# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
>>>>> +IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>>>>> +
>>>>>   TFA_BOARD = "generic"
>>>>>   OPTEEMACHINE = "k3-j721e"
>>>>
>>>> <snip>
>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>>> index d28d16d1..fe28e6f5 100644
>>>>> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>>> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
>>>>> @@ -7,9 +7,6 @@ require conf/machine/include/j721e.inc
>>>>>   SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>>>>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>>>> -# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
>>>>> -IMAGE_BOOT_FILES += "sysfw.itb"
>>>>> -
>>>>>   KERNEL_DEVICETREE = " \
>>>>>       ti/k3-j721e-common-proc-board.dtb \
>>>>>       ti/k3-j721e-common-proc-board-infotainment.dtbo \
>>>>> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>>>>> index 9ef7b86a..acd5ca18 100644
>>>>> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>>>>> +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>>>>> @@ -18,10 +18,3 @@ SPL_BINARY = "tispl.bin_HS"
>>>>>   UBOOT_BINARY = "u-boot.img_HS"
>>>>>   UBOOT_SYMLINK = "u-boot.img"
>>>>>   SYSFW_SYMLINK = ""
>>>>> -
>>>>> -BBMULTICONFIG += "k3r5-sr1-1"
>>>>> -
>>>>> -# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
>>>>> -IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>>>>> -do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>>>>> -do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"

