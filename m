Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00777C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:41:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1546.1742316063215025285
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 09:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qy9eEUUW;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IGex0c068418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 11:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742316059;
	bh=vR0Kh+ylL98OcntJ0oTr0E4e/ozvxRAmZvcOrJMQPFc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qy9eEUUWhgEIwdEo3HuFaoAGfz9SlT5TxQLJmsbYphOeNZw8x5y1ycOTTsiteI1PV
	 3w9XEi1lgTpz7bWbLaJ17ZJk+gVT2/fAEcjLpNDp/kvz7G5bDqKlyGEZzwz3i8hbfR
	 8DMGh/c2Roo+DgLen0SqeLBcZAokWc5dc065L18I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IGex3D059771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 11:40:59 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 11:40:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 11:40:59 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IGewBx078586;
	Tue, 18 Mar 2025 11:40:59 -0500
Message-ID: <de9f240e-25db-4aaa-a10a-75abba69765c@ti.com>
Date: Tue, 18 Mar 2025 11:40:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] omap-a15.inc: don't include
 ipu1 firmware in the boot partition
To: Denys Dmytriyenko <denis@denix.org>, <a-limaye@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        "Kumar, Udit" <u-kumar1@ti.com>, "Padhi, Beleswar" <b-padhi@ti.com>,
        "CHAVDA,
 ANKIT" <a-chavda@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20250315020224.3100249-1-denis@denix.org>
 <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
 <20250318161810.GJ23729@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250318161810.GJ23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 16:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18401



On 3/18/2025 11:18 AM, Denys Dmytriyenko wrote:
> On Sat, Mar 15, 2025 at 10:29:18AM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
>>
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
>>
>> The fw binary is actually a requirement for AM57x boards to boot
>> now. U-Boot expects
>> the firmware to be present in the boot partition, and fails if not found.
>> (Beleswar can correct me if I'm mistaken).
> 
> Huh, interesting - do you know the version where this started?
> 
> If it is indeed a hard requirement to boot the platform now, another option
> is to get a prebuilt binary into ti-linux-firmware and pull it from there,
> instead of building it from sources using legacy tools...

That's what I was thinking...


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
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#18400): https://lists.yoctoproject.org/g/meta-ti/message/18400
>>> Mute This Topic: https://lists.yoctoproject.org/mt/111711244/6551054
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

