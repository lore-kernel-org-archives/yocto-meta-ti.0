Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF324C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 15:17:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.54031.1739805433389055048
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 07:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ROLQyWzU;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HFH9Ci1497856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 09:17:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739805429;
	bh=+61q8rBynsEZcOupzuEvKsBjETdYMdR4M53rPP0NrN8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ROLQyWzUcBNZQ8rf2dYoRoKFPhzAPee4Rec0KOyJfOAreG73ux+8Oh1fwjLu9Ig7V
	 LZerY1nCWWjQSywkRDK6r8FNhdIXp+F1N+K1WN7Q3Y26PQ9hAZLjbU0G3itD8aFnS7
	 9lc+msXf+nKBIhTKCxqg6lvQy/nIywCnnio1sKzU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51HFH9rK005181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Feb 2025 09:17:09 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 09:17:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 09:17:08 -0600
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HFH8D8092289;
	Mon, 17 Feb 2025 09:17:08 -0600
Message-ID: <81355465-df25-450f-8e42-5a5213210041@ti.com>
Date: Mon, 17 Feb 2025 09:17:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] wic: sdimage-2part-efi: Add
 variable for adding bootloader options
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250213165338.11294-1-reatmon@ti.com>
 <20250214231436.GV21608@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250214231436.GV21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2025 15:17:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18324



On 2/14/2025 5:14 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 13, 2025 at 10:53:38AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> We have a need for some platforms to add kernel options to the bootloader
>> during wic creation time.  Create a new variable and add that to the
>> sdimage-2part-efi.wks.in file so that a machine can override it if
>> needed.
>>
>> Add an override for am64 to point the kernel at console=ttyS2.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/am64xx.inc | 2 ++
>>   meta-ti-bsp/conf/machine/include/k3.inc     | 2 ++
>>   meta-ti-bsp/wic/sdimage-2part-efi.wks.in    | 2 +-
>>   3 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> index 49e996c8..56b56afe 100644
>> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
>> @@ -34,3 +34,5 @@ TFA_BOARD = "lite"
>>   OPTEEMACHINE = "k3-am64x"
>>   
>>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
>> +
>> +TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
> 
> BTW, no whitespace around the assignment operators will be giving a QA warning
> some time soon... OE-Core has been cleaned up recently:
> https://git.openembedded.org/openembedded-core/commit/?id=30ea609d3357fb3de911f2f6a5e6856c151b976a

I figure I'll do a mass clean up of all of our files by script.


> 
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index dd3cbeca..faf820a0 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -55,6 +55,8 @@ MACHINE_FEATURES += "efi"
>>   
>>   WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks.in", "sdimage-2part.wks", d)}"
>>   
>> +TI_WKS_BOOTLOADER_APPEND ?= ""
>> +
>>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>>   
>>   SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
>> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> index ca042be1..ae38daa7 100644
>> --- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> +++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
>> @@ -3,6 +3,6 @@
>>   # supports EFI.  Boot files are located in the first vfat partition with extra
>>   # reserved space.  We cannot use a GPT here.
>>   
>> -bootloader --timeout=3 --append="rootfstype=ext4"
>> +bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
>>   part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>>   part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

