Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF5EC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 08:48:58 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.43368.1745830129585699024
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 01:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y9y+R8eZ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53S8mjj13352232
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 03:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745830125;
	bh=Nq8wkNVa7aG03rcbO5H+nQnrlGmQswAyJnG163GiN20=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y9y+R8eZAArie+veSLMk7Fz5KyTIMdcTxRingjuRjzg6b+ICXzYAGG8AQnjMGCJmu
	 yIUiH6KLuuW7NxY+ZaRntT1ZIvQna1pmwW2/J5x5+L640jxSlO9RaJgYsurewdhu0H
	 8DUWnBH497MoOcFooE8uI9ogLvuGksOIpZxZ/otE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53S8mji3129044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 03:48:45 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 03:48:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 03:48:44 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53S8mgSd046690;
	Mon, 28 Apr 2025 03:48:43 -0500
Message-ID: <cfa1de82-add1-4791-bcdb-573159af20b8@ti.com>
Date: Mon, 28 Apr 2025 14:18:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] recipes-bsp: u-boot: Fix
 PACKAGECONFIG[dm] arguments
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Andrew
	<afd@ti.com>, Neha <n-francis@ti.com>
References: <20250425204857.3271868-1-c-shilwant@ti.com>
 <20250426160457.GN13634@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250426160457.GN13634@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Apr 2025 08:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18517


On 26/04/25 21:34, Denys Dmytriyenko wrote:
> On Sat, Apr 26, 2025 at 02:18:57AM +0530, Chirag Shilwant wrote:
>> * As observed in the u-boot makefile [0][1], the argument
>> anticipated by u-boot binman is "TI_DM" instead of "DM".
>> Hence, fix the same in meta-ti-bsp.
> Was it always "TI_DM", or was it "DM" initially in TI U-boot and later got
> changed tp "TI_DM" in upstream?


As per [0] which added the TI_DM support in U-Boot, I see it was always 
TI_DM.
So, it was [1] where we added it as DM under meta-ti-bsp improperly

[0]: 
https://github.com/u-boot/u-boot/commit/23d2ef91efa40d525a4a5557704184bcfd64ca16

[1]: 
https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc?id=b21d29d94694ac49b97a1f4ba428c7d8cd6fb64a

--
Chirag


>
>
>> * The behavior went unnoticed until now because "ti-dm"
>> was still being sourced from BINMAN_INDIRS, which referred
>> to "ti-linux-firmware" and the PACKAGECONFIG[dm] feature
>> was redundant.
>>
>> [0]: https://github.com/u-boot/u-boot/blob/v2025.01/Makefile#L1408
>>
>> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2025.01#n1409
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 9a74b840..e337f84f 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -63,7 +63,7 @@ PLAT_SFX:am62pxx = "am62pxx"
>>   PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>>   PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>>   PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
>> -PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>> +PACKAGECONFIG[dm] = "TI_DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
>>   
>>   PACKAGECONFIG:append:aarch64 = " atf optee"
>>   PACKAGECONFIG:append:j721e = " dm"
>> -- 
>> 2.34.1

