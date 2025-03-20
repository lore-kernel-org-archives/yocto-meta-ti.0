Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A101C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:59:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2958.1742461160733817096
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 01:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klTgYG+0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52K8xI3L556345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 03:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742461158;
	bh=fY3uHMZMeJlEaoO6w/vm42ZWkuoF8IW4XM2Pqgdfjns=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=klTgYG+0Q0k25KVZZ11+2YWH1NHzTgnEWQfQUuSUrZeUkakftlHsLw/RmBDyRTneu
	 saK/qTsYOUWNq7O9px1CPduhAubfvYqLQ7Oz535kDnFIYXJwkaiBk5IT/VNJ1DKNXL
	 9WmCb+MKQbYH3Araelzj3IUC5FtDAG1ft/91euQw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52K8xIvi099759;
	Thu, 20 Mar 2025 03:59:18 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 03:59:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 03:59:18 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52K8xFp2105119;
	Thu, 20 Mar 2025 03:59:15 -0500
Message-ID: <00bc7e5d-070d-4883-855a-6359219296db@ti.com>
Date: Thu, 20 Mar 2025 14:29:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] omap-a15.inc: don't include
 ipu1 firmware in the boot partition
To: Denys Dmytriyenko <denis@denix.org>, <a-limaye@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        "Kumar, Udit" <u-kumar1@ti.com>, "CHAVDA, ANKIT" <a-chavda@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>
References: <20250315020224.3100249-1-denis@denix.org>
 <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
 <20250318161810.GJ23729@denix.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250318161810.GJ23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:59:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18414


On 18/03/25 21:48, Denys Dmytriyenko wrote:
> On Sat, Mar 15, 2025 at 10:29:18AM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
>> On 3/15/2025 7:32 AM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> This reverts commit c58af0b172660ef1248a3454af06251d872770b1.
>>>
>>> This adds an undesired dependency on meta-ti-extras - more details:
>>> https://lists.yoctoproject.org/g/meta-ti/topic/110003435
>>>
>>> Cc: Aniket Limaye <a-limaye@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
>>> ---
>> The fw binary is actually a requirement for AM57x boards to boot
>> now. U-Boot expects
>> the firmware to be present in the boot partition, and fails if not found.
>> (Beleswar can correct me if I'm mistaken).
> Huh, interesting - do you know the version where this started?
>
> If it is indeed a hard requirement to boot the platform now, another option
> is to get a prebuilt binary into ti-linux-firmware and pull it from there,
> instead of building it from sources using legacy tools...


This is great too. However, meta-ti should still have the deploy rule to 
pick the pre-built firmware and put it into the boot partition.

Thanks,
Beleswar

>
>
>> If we don't want to break this board, we need to maybe migrate the
>> ti-ipc-rtos recipe from
>> meta-ti-extras to meta-ti-bsp, since it is anyway a requirement for
>> AM57X u-boot recipe.
>> Denys, I also see that you mentioned that the ti-ipc-rtos recipe
>> currently resides in extras
>> due to the legacy recipes built from sources using old tools like
>> XDC, SYS/BIOS and CGT...
>> which cannot be easily moved to meta-ti-bsp.
>>
>> A temporary fix might be to somehow add these inside of
>> meta-ti-extras/conf/layer.conf?
>>
>> However, I Ack the revert in case it is needed for now:
>>
>> Acked-by: Aniket Limaye <a-limaye@ti.com>
>>
>>
>>>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>> index a258decd..be086936 100644
>>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>> @@ -48,6 +48,5 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
>>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>>   WKS_FILE ?= "sdimage-2part.wks"
>>> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
>>> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>>>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>>> -do_image_wic[depends] += "ti-ipc-rtos:do_deploy"

