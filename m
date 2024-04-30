Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB5EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:04:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.27114.1714511037507898026
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 14:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lQiIr8IH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UL3sUJ095048;
	Tue, 30 Apr 2024 16:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714511034;
	bh=Ji69uaCNO4ScF0ireG0aHPayG+klX2b/2igzyswFq00=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lQiIr8IHTKZOrwgY1n3ulvDPWW6n4J4D8p33CKOHffimQf4bwf/Ncc1dUsicJEy6P
	 KDmoruG8I34SqluMwOCHkfpKyuGDLeX4aIdFIgETnypqbs8Drcxy4vIqQhavzwWrkX
	 xSxc9yLzIzn9nKV9tl34ApQXcpnl98r5vKpfU6u0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UL3sAS063215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 16:03:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 16:03:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 16:03:54 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UL3rl7081564;
	Tue, 30 Apr 2024 16:03:54 -0500
Message-ID: <0befc90e-4107-4a27-90c8-09caa961cce7@ti.com>
Date: Tue, 30 Apr 2024 16:03:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: am69-sk:
 Create a new am69.inc file
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240430195811.2512-1-reatmon@ti.com>
 <20240430204730.GQ28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240430204730.GQ28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 21:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17616



On 4/30/2024 3:47 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 30, 2024 at 02:58:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Reusing the j784s4.inc file presents problems as the am69-sk platform
>> does not support GP.  So copy the j784s4.inc to am69.inc and update
>> accordingly.
> 
> Any chance to get this as a diff against j784s4.inc to simplify the review?
> Maybe by playing with -C and -M options?

Here is the diff:

 > diff meta-ti-bsp/conf/machine/include/am69.inc 
meta-ti-bsp/conf/machine/include/j784s4.inc
9c9,12
< # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
---
 > # Default tiboot3.bin on J784S4 is for GP
 > IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
 >
 > # Since default tiboot3.bin on J784S4 is for GP, add a version for 
SR1.0 HS-FS
12c15
< # Since default tiboot3.bin on AM69 is for HS-FS, add a version for 
SR1.0 HS-SE
---
 > # Since default tiboot3.bin on J784S4 is for GP, add a version for 
SR1.0 HS-SE


Effectively removing a line and changing some of the comments.





> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Fix commit message.
>>
>>   meta-ti-bsp/conf/machine/am69-sk.conf     |  2 +-
>>   meta-ti-bsp/conf/machine/include/am69.inc | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-ti-bsp/conf/machine/include/am69.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
>> index 233a4618..6341a6fa 100644
>> --- a/meta-ti-bsp/conf/machine/am69-sk.conf
>> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
>> @@ -2,7 +2,7 @@
>>   #@NAME: AM69 SK
>>   #@DESCRIPTION: Machine configuration for the TI AM69 SK
>>   
>> -require conf/machine/include/j784s4.inc
>> +require conf/machine/include/am69.inc
>>   
>>   TFA_K3_USART = "0x8"
>>   OPTEE_K3_USART = "0x8"
>> diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
>> new file mode 100644
>> index 00000000..81be1397
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/am69.inc
>> @@ -0,0 +1,19 @@
>> +require conf/machine/include/k3.inc
>> +SOC_FAMILY:append = ":j784s4"
>> +
>> +MACHINE_FEATURES += "screen gpu"
>> +
>> +require conf/machine/include/mesa-pvr.inc
>> +PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
>> +
>> +# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
>> +IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
>> +
>> +# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
>> +IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
>> +
>> +TFA_BOARD = "j784s4"
>> +
>> +OPTEEMACHINE = "k3-j784s4"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

