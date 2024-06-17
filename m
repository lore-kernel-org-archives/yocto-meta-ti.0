Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC568C27C6E
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:26:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.51845.1718612807634482458
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dkL7UkJK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45H8QhA2048056;
	Mon, 17 Jun 2024 03:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718612803;
	bh=xeGckPD04xr/AFrB2l4p2CFDUJEUJRCO5Yjmm93l53o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dkL7UkJKVRxIyH5F8yw/4kB+KvQTqcBSUvK0cpJRNX7JYKVn3SEEB3YruoH+0B3Rl
	 Sgx4QEeey1GygX6UrCcfWtBHRJd/qJAO2AohrNMo0tOGd5Xu7OamgkyRnij/NQ9UCL
	 vFMdNXoWN24XQRNiR4+7z9fXPwiV3sok56NR5YRo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45H8Qh11088366
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 03:26:43 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 03:26:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 03:26:43 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45H8QeNG018842;
	Mon, 17 Jun 2024 03:26:41 -0500
Message-ID: <522267a7-a5cc-43bc-a41a-c33675311da2@ti.com>
Date: Mon, 17 Jun 2024 13:56:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 UBOOT_MACHINE for am62xxsip-evm
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Gyan Gupta
	<g-gupta@ti.com>, Vignesh <vigneshr@ti.com>
References: <20240614070123.1155319-1-c-shilwant@ti.com>
 <20240614164146.GZ21287@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240614164146.GZ21287@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:26:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17749

Hi Denys,

On 14/06/24 22:11, Denys Dmytriyenko wrote:
> On Fri, Jun 14, 2024 at 12:31:23PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
>> Modify the U-Boot defconfig names for A53 and R5
>> machine configurations based on ti-u-boot-2024.04 [1]
>>
>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=df5181f8c6c41bf018ec043d565581b5d8a291c5
> If we get the multi-BSP support merged, this would have to be adjusted to NOT
> break builds with 2023.04 U-boot...
>
> Similar to beagleplay and beaglebone-ai64 changes here:
> https://patchwork.yoctoproject.org/project/ti/patch/20240613172254.770920-3-denis@denix.org/



Thanks Denys for the catch! I will send out a new patch on top of 
meta-ti "-next" branch to handle 2023.04 U-boot.
FYI, we can't handle u-boot-ti-mainline which is on 2024.01 [1], as it 
doesn't seem to have a fragment
similar to 2023.04 U-boot nor it has the latest am62xsip* def-configs 
[2]. Hence, I will send out
a patch only to support ti-u-boot-2023.04

[1]: 
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb#n16

[2]: 
https://source.denx.de/u-boot/u-boot/-/tree/866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e/configs



>
>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 7 +------
>>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 +-
>>   2 files changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> index 0daff2b9..c35edc6e 100644
>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> @@ -8,9 +8,4 @@ SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>>   SYSFW_SUFFIX = "hs-fs"
>>   
>> -UBOOT_MACHINE = "am62x_evm_r5_defconfig"
>> -
>> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
>> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
>> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> -UBOOT_CONFIG_FRAGMENTS = "am62xsip_sk_r5.config"
>> +UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> index b5dd18f1..38fe04c9 100644
>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> @@ -13,4 +13,4 @@ KERNEL_DEVICETREE = " \
>>       ti/k3-am625-sk.dtb \
>>   "
>>   
>> -UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>> +UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
>> -- 
>> 2.34.1

