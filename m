Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF84C4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 17:12:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.79424.1670951535558599395
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 09:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qamdU5eq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BDHC9d2001016;
	Tue, 13 Dec 2022 11:12:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670951529;
	bh=M5KlyGxwN/N62iEImxt6YAUN9X5UBGEioi8C1+KBv9o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qamdU5equ9vALu6qpSNvn50hsGi/k8IsIMr+Il8ppOXMQHPEvX97IwnTZ+CdB/YaG
	 UqECOIaTzesikwTCno4hzi4ScfjLdKD4HcbPLQexDujKFKii2OAPzEG/WYy/Vbk3qI
	 N+s7Sd//63yPT2Td8tsITuZuGUViEYB6bXXVBUso=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BDHC9Z9127791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Dec 2022 11:12:09 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 13
 Dec 2022 11:12:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 13 Dec 2022 11:12:09 -0600
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BDHC8FV031565;
	Tue, 13 Dec 2022 11:12:08 -0600
Message-ID: <76a146b0-49ab-7d83-c680-4be55eb678d4@ti.com>
Date: Tue, 13 Dec 2022 11:12:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/7] conf: machine: Move
 TFA_BOARD and OPTEEMACHINE to the SoC level
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-6-afd@ti.com> <20221212225139.GM22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221212225139.GM22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 17:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15464

On 12/12/22 4:51 PM, Denys Dmytriyenko wrote:
> On Wed, Dec 07, 2022 at 03:43:11PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> These defines are specific to a SoC, not a SoC family (K3) nor
>> any specific board. Move these to the SoC level for all boards
>> to be consistent with boards already doing this correctly.
> 
> See the question below
> 
> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am64xx.inc | 1 +
>>   meta-ti-bsp/conf/machine/include/am65xx.inc | 2 ++
>>   meta-ti-bsp/conf/machine/include/j7200.inc  | 2 ++
>>   meta-ti-bsp/conf/machine/include/j721e.inc  | 6 ++++--
>>   meta-ti-bsp/conf/machine/include/j721s2.inc | 6 ++++--
>>   meta-ti-bsp/conf/machine/include/j784s4.inc | 6 ++++--
>>   meta-ti-bsp/conf/machine/include/k3.inc     | 1 -
>>   meta-ti-bsp/conf/machine/j721s2-evm.conf    | 1 -
>>   meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 ----
>>   9 files changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 7c46b630..f1a91991 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -32,4 +32,5 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>>   do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
>>   
>>   TFA_BOARD = "lite"
>> +
>>   OPTEEMACHINE = "k3-am64x"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 14e0d07f..88259717 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -37,4 +37,6 @@ IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
>>   do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>>   do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>>   
>> +TFA_BOARD = "generic"
>> +
>>   OPTEEMACHINE = "k3-am65x"
>> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
>> index 1eaf7806..d21e26cc 100644
>> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
>> @@ -1,4 +1,6 @@
>>   require conf/machine/include/k3.inc
>>   SOC_FAMILY:append = ":j7200"
>>   
>> +TFA_BOARD = "generic"
>> +
>>   OPTEEMACHINE = "k3-j721e"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
>> index 34569a01..12ee0c90 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -1,8 +1,6 @@
>>   require conf/machine/include/k3.inc
>>   SOC_FAMILY:append = ":j721e"
>>   
>> -OPTEEMACHINE = "k3-j721e"
>> -
>>   MACHINE_FEATURES += "gpu"
>>   
>>   PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
>> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +
>> +TFA_BOARD = "generic"
>> +
>> +OPTEEMACHINE = "k3-j721e"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> index 2a60458e..fc6493b8 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721s2.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
>> @@ -1,8 +1,6 @@
>>   require conf/machine/include/k3.inc
>>   SOC_FAMILY:append = ":j721s2"
>>   
>> -OPTEEMACHINE = "k3-j721e"
>> -
>>   MACHINE_FEATURES += "gpu"
>>   
>>   PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
>> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +
>> +TFA_BOARD = "generic"
>> +
>> +OPTEEMACHINE = "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> index e2f053ac..d268b810 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -1,8 +1,6 @@
>>   require conf/machine/include/k3.inc
>>   SOC_FAMILY:append = ":j784s4"
>>   
>> -OPTEEMACHINE = "k3-j721e"
>> -
>>   MACHINE_FEATURES += "gpu"
>>   
>>   PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
>> @@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
>>   PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +
>> +TFA_BOARD = "j784s4"
> 
> Just wanted to check that it is the correct TFA_BOARD used here. I know that
> you are simply moving the existing value from EVM to SOC config, but I still
> wonder that we have these inconsistent values for all the K3 platforms:
> 
> 1. generic
> 2. lite
> 3. j784s4
> 

This is exactly why I'm moving them all to the SOC config level, makes it
easier to check vs using EVM and K3 levels, here is the current mapping:

1. generic -> AM65x J721e J7200 J721s2
2. lite    -> AM64x AM62x
3. j784s4  -> J784s4

Not super intuitive, but I haven't gotten around to cleaning up
these names in TF-A yet.

Andrew

> 
>> +
>> +OPTEEMACHINE = "k3-j784s4"
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 84afd2e2..bd71becf 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -29,7 +29,6 @@ UBOOT_SUFFIX = "img"
>>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>>   
>>   TFA_PLATFORM = "k3"
>> -TFA_BOARD = "generic"
>>   
>>   # Use the expected value of the ubifs filesystem's volume name in the kernel
>>   # and u-boot.
>> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> index 37353df4..46d5dbf6 100644
>> --- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
>> @@ -7,7 +7,6 @@ require conf/machine/include/j721s2.inc
>>   SERIAL_CONSOLES = "115200;ttyS2"
>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>   TFA_K3_USART = "0x8"
>> -OPTEEMACHINE = "k3-j784s4"
>>   OPTEE_K3_USART = "0x8"
>>   
>>   KERNEL_DEVICETREE = " \
>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> index 10d8aad0..f8be7d18 100644
>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> @@ -7,7 +7,6 @@ require conf/machine/include/j784s4.inc
>>   SERIAL_CONSOLES = "115200;ttyS2"
>>   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>   TFA_K3_USART = "0x8"
>> -OPTEEMACHINE = "k3-j784s4"
>>   OPTEE_K3_USART = "0x8"
>>   
>>   KERNEL_DEVICETREE = " \
>> @@ -18,6 +17,3 @@ UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
>>   
>>   do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>>   do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
>> -
>> -TFA_BOARD = "j784s4"
>> -
>> -- 
>> 2.38.1
>>

