Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327FDC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 14:59:03 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.14257.1654786739262225487
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 07:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fhPqRfyB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 259EwveC109269;
	Thu, 9 Jun 2022 09:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654786737;
	bh=EiIwHn0aEorYcF9ZB3/uuDDST6pwjyKe2cTBga3MMF0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fhPqRfyBZhZZauHExUaZE/2HeSEY+0sJqLFM4wInSzcSQ0keaP4ngNfExnnF033Hx
	 7PRmQJdxa9PhKEVBm5TxBAg1sRG8mEkiVle73YzsI5zh8OMs+ndEwan4ahZkCfM3qD
	 AS/FqqPgjh63mEtl4SQMOg02dmgxeInZ/854Wzek=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 259EwvMW062203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jun 2022 09:58:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Jun 2022 09:58:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Jun 2022 09:58:57 -0500
Received: from [10.250.32.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 259EwuBE033299;
	Thu, 9 Jun 2022 09:58:57 -0500
Message-ID: <0b8e5f6a-0508-c20c-ef09-393787a84395@ti.com>
Date: Thu, 9 Jun 2022 09:58:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v2] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220608200254.28768-1-afd@ti.com>
 <20220609134558.pmqxa4knolskceq4@ula0497581>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220609134558.pmqxa4knolskceq4@ula0497581>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jun 2022 14:59:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14810

On 6/9/22 8:45 AM, Manorit Chawdhry wrote:
> On 15:02-20220608, Andrew Davis wrote:
>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>
>> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
>> incomplete binaries in /boot and the naming of the binaries were not
>> correct.
>>
>> Fixes /boot partition for HS devices.
>>
>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>> [afd: Extended fix to all HS platforms]
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Hi, the builds are failing for this. Maybe try some clean builds?
> 


Had to completely remove all build and caches to get it to fail here,
odd would have expected only removing the build dir to show this issue.

This turned out a bit more involved than I was expecting, but think
I found a way to pull in the _HS version and do the rename without
effecting anything else.. sending v3.

Thanks,
Andrew


> Regards,
> Manorit
> 
>> ---
>>
>> Changes from v1:
>>   - Use signed u-boot.img file for HS
>>
>>   conf/machine/am64xx-hs-evm.conf | 2 --
>>   conf/machine/am65xx-hs-evm.conf | 2 --
>>   conf/machine/include/k3.inc     | 5 +++--
>>   conf/machine/j7-hs-evm.conf     | 2 --
>>   conf/machine/j7200-hs-evm.conf  | 2 --
>>   5 files changed, 3 insertions(+), 10 deletions(-)
>>
>> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
>> index 44e81463..c63d382e 100644
>> --- a/conf/machine/am64xx-hs-evm.conf
>> +++ b/conf/machine/am64xx-hs-evm.conf
>> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>>   UBOOT_DTBO_OFFSET =      "0x00010000"
>>   
>>   SPL_BINARY = "tispl.bin_HS"
>> -SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_BINARY = "u-boot.img_HS"
>> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>>   
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
>> index e4eebb6a..a28b45dc 100644
>> --- a/conf/machine/am65xx-hs-evm.conf
>> +++ b/conf/machine/am65xx-hs-evm.conf
>> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>>   UBOOT_DTBO_OFFSET =      "0x00010000"
>>   
>>   SPL_BINARY = "tispl.bin_HS"
>> -SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_BINARY = "u-boot.img_HS"
>> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>>   
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
>> index e0970698..f85e6b98 100644
>> --- a/conf/machine/include/k3.inc
>> +++ b/conf/machine/include/k3.inc
>> @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
>>   UBOOT_LOADADDRESS = "0x80008000"
>>   
>>   SPL_BINARY = "tispl.bin"
>> +SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_SUFFIX = "img"
>>   
>>   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>> @@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
>>   
>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>   
>> -IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
>> -IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>> +IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
>> +IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
>>   
>>   IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
>>   
>> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
>> index f2e3ccf5..c7766def 100644
>> --- a/conf/machine/j7-hs-evm.conf
>> +++ b/conf/machine/j7-hs-evm.conf
>> @@ -15,9 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>>   UBOOT_DTBO_OFFSET =      "0x00010000"
>>   
>>   SPL_BINARY = "tispl.bin_HS"
>> -SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_BINARY = "u-boot.img_HS"
>> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>>   
>>   BBMULTICONFIG += "k3r5-sr1-1"
>>   
>> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
>> index a5bd637e..93c0c0ce 100644
>> --- a/conf/machine/j7200-hs-evm.conf
>> +++ b/conf/machine/j7200-hs-evm.conf
>> @@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>>   UBOOT_DTBO_OFFSET =      "0x00010000"
>>   
>>   SPL_BINARY = "tispl.bin_HS"
>> -SPL_BINARYNAME = "tispl.bin"
>>   UBOOT_BINARY = "u-boot.img_HS"
>> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
>>   
>>   TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
>> -- 
>> 2.36.1
>>

