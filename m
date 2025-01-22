Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4AEC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 19:36:36 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2818.1737574595930236293
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 11:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IIYhYpYP;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MJaWB61046203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 13:36:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737574592;
	bh=3sB/q85dw4BPIZ1SSDrHpp+8rxDfaupGRc6domV+zxc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IIYhYpYPCcnVqrM6Ds5WmoNgup+W1d47yJGEOsSeQZM0YQl16IpOWdwI4ownd2JaX
	 VKTE8AEb6Y/fzu119Y93YZ+aEcqEoVScyhAl4W5b0q9Pzv5re4wR8NuSf4J5K2wHzb
	 JQ0TwYbFEsS2CxS0k+J8p3JbS9KLAX+O6WYGCJmY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MJaWfB006873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 13:36:32 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 13:36:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 13:36:31 -0600
Received: from [10.249.32.65] ([10.249.32.65])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MJaWXo091345;
	Wed, 22 Jan 2025 13:36:32 -0600
Message-ID: <edcbfe6b-7370-4ad1-9629-1d38ff9e7e47@ti.com>
Date: Wed, 22 Jan 2025 13:36:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2 1/2] conf: machine:
 beagleplay*: Update defaults to mainline
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250122170732.20970-1-reatmon@ti.com>
 <20250122182922.GQ21836@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250122182922.GQ21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2025 19:36:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18219



On 1/22/2025 12:29 PM, Denys Dmytriyenko wrote:
> On Wed, Jan 22, 2025 at 11:07:31AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The defaults for UBOOT_MACHINE and SPL_BINARY are now aligned with the
>> mainline values and new ti-6_1 values for the previous defaults were
>> created to capture those.  Also updated the meta-beagle beagleplay since
>> it inherits the beagleplay-ti settings.
> 
> I have already sent my Tested-by for v1 - do I need to re-test v2 here? Are
> there any other changes besides the typo fix in the second patch?

Nope.  Just the typo.  No need to re-test.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-beagle/conf/machine/beagleplay-k3r5.conf    | 2 +-
>>   meta-beagle/conf/machine/beagleplay.conf         | 5 +----
>>   meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf | 6 ++----
>>   meta-ti-bsp/conf/machine/beagleplay-ti.conf      | 9 +++------
>>   4 files changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta-beagle/conf/machine/beagleplay-k3r5.conf b/meta-beagle/conf/machine/beagleplay-k3r5.conf
>> index 3e7f0c1b..f053c11e 100644
>> --- a/meta-beagle/conf/machine/beagleplay-k3r5.conf
>> +++ b/meta-beagle/conf/machine/beagleplay-k3r5.conf
>> @@ -6,6 +6,6 @@ require conf/machine/beagleplay-ti-k3r5.conf
>>   
>>   require conf/machine/include/beagle-bsp.inc
>>   
>> -UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_r5_defconfig"
>> +UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_r5_defconfig"
>>   
>>   UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_r5.config"
>> diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
>> index b1a463e1..bc0de3f0 100644
>> --- a/meta-beagle/conf/machine/beagleplay.conf
>> +++ b/meta-beagle/conf/machine/beagleplay.conf
>> @@ -6,13 +6,10 @@ require conf/machine/beagleplay-ti.conf
>>   
>>   require conf/machine/include/beagle-bsp.inc
>>   
>> -UBOOT_MACHINE:bsp-bb_org-6_6 = "am62x_beagleplay_a53_defconfig"
>> +UBOOT_MACHINE:bsp-bb_org-6_1 = "am62x_evm_a53_defconfig"
>>   
>>   UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 = "am625_beagleplay_a53.config"
>>   
>> -SPL_BINARY:bsp-bb_org-6_6 = "tispl.bin_unsigned"
>> -SPL_BINARYNAME:bsp-bb_org-6_6 = "tispl.bin"
>> -
>>   KERNEL_DEVICETREE:append:bsp-bb_org-6_1 = " \
>>   ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>>   ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>> index c27e0abc..72dc145b 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
>> @@ -8,9 +8,7 @@ SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>>   SYSFW_SUFFIX = "gp"
>>   
>> -UBOOT_MACHINE = "am62x_evm_r5_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_r5_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_r5_defconfig"
>> +UBOOT_MACHINE = "am62x_beagleplay_r5_defconfig"
>> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
>>   
>>   UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_r5.config"
>> -UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_r5.config"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
>> index 68d6dced..3824d867 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
>> @@ -19,15 +19,12 @@ TFA_K3_SYSTEM_SUSPEND = "1"
>>   
>>   OPTEEMACHINE = "k3-am62x"
>>   
>> -UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_6 = "am62x_beagleplay_a53_defconfig"
>> -UBOOT_MACHINE:bsp-ti-6_12 = "am62x_beagleplay_a53_defconfig"
>> +UBOOT_MACHINE = "am62x_beagleplay_a53_defconfig"
>> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
>>   
>>   UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am625_beagleplay_a53.config"
>> -UBOOT_CONFIG_FRAGMENTS:bsp-mainline = "beagleplay_a53.config"
>>   
>> -SPL_BINARY:bsp-ti-6_6 = "tispl.bin_unsigned"
>> -SPL_BINARYNAME:bsp-ti-6_6 = "tispl.bin"
>> +SPL_BINARY = "tispl.bin_unsigned"
>>   
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-am625-beagle \
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

