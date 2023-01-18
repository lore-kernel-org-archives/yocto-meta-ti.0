Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAEBC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 19:28:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.26078.1674070099272457006
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 11:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hurk3DZB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30IJSDV4031055;
	Wed, 18 Jan 2023 13:28:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674070093;
	bh=nhVGMwNSTh+g7PBo5y6aO98J/U95cjP0TAnwYGib4Qg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hurk3DZBfXH1KPIhC+s60vTfbnYFqzYRHnr1NnuFB77F5jLDWECHUVNIRe3WzmOxR
	 4yNChk258r3qzZ8QuPtOapUHYUMVQMp2rUGSsE3EiwYn+1Gy0oYKIoLy2mrJ1lKcEB
	 /QkxWeYWcgHFROJqEvja1IwiG9H2HjtKzNDAJRNA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30IJSDjJ012985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jan 2023 13:28:13 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 18
 Jan 2023 13:28:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 18 Jan 2023 13:28:13 -0600
Received: from [10.250.34.171] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30IJSC4J016231;
	Wed, 18 Jan 2023 13:28:12 -0600
Message-ID: <c0991227-de85-79a1-45a9-76fbce3f3e96@ti.com>
Date: Wed, 18 Jan 2023 13:28:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH 7/7] conf: machine: Rework
 do_image_wic dependencies
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-7-afd@ti.com> <20230118183615.GH22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230118183615.GH22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jan 2023 19:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15586



On 1/18/2023 12:36, Denys Dmytriyenko wrote:
> On Wed, Dec 07, 2022 at 03:43:12PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> The WIC image for K3 depends on the TI-SCI firmware, on AM65x and J721e
>> also the bootloader. Make this clear by only depending on firmware in
>> the base k3.inc file, then adding the bootloader dependency in AM65x and
>> J721e specific includes.
>>
>> Remove unneeded overrides from the evm level files.
>>
>> Remove do_image_tar dependencies as the tar files do not include
>> the bootloader nor TI-SCI firmware, only the boot partition of
>> the WIC file needs these.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index 12ee0c90..6322fe46 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -9,6 +9,17 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>>   
>> +# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
>> +do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
>> +
>> +# Default sysfw.itb on J721e is for SR1.1
>> +BBMULTICONFIG += "k3r5-sr1-1"
> 
> There's a slight problem - k3r5-sr1-1 multiconfig previously only applied to
> the HS j721e-hs-evm device, but not the GP j721e-evm, see below.
> 
> Hence there's no corresponding k3r5 config j721e-evm-k3r5-sr1-1.conf exists,
> only the one for the HS - j721e-hs-evm-k3r5-sr1-1.conf
> 
> Since you moved the above BBMULTICONFIG line into the common j721e.inc, it now
> breaks with the error:
> 
> MACHINE=j721e-evm-k3r5-sr1-1 is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.
> 
> I can re-spin this series with a fix, so it's easier for Ryan to apply...

I literally just ran into this while doing the test builds and added the 
missing file.  Please feel free to redo the patch series and I'll 
reapply everything.


> 
>> +do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> +IMAGE_BOOT_FILES += "sysfw.itb"
>> +
>> +# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
>> +IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>> +
>>   TFA_BOARD = "generic"
>>   
>>   OPTEEMACHINE = "k3-j721e"
> 
> <snip>
> 
>> diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
>> index d28d16d1..fe28e6f5 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
>> @@ -7,9 +7,6 @@ require conf/machine/include/j721e.inc
>>   SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>   
>> -# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
>> -IMAGE_BOOT_FILES += "sysfw.itb"
>> -
>>   KERNEL_DEVICETREE = " \
>>       ti/k3-j721e-common-proc-board.dtb \
>>       ti/k3-j721e-common-proc-board-infotainment.dtbo \
>> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> index 9ef7b86a..acd5ca18 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
>> @@ -18,10 +18,3 @@ SPL_BINARY = "tispl.bin_HS"
>>   UBOOT_BINARY = "u-boot.img_HS"
>>   UBOOT_SYMLINK = "u-boot.img"
>>   SYSFW_SYMLINK = ""
>> -
>> -BBMULTICONFIG += "k3r5-sr1-1"
>> -
>> -# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
>> -IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
>> -do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

