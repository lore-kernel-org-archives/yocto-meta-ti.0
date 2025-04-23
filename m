Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AD4C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.8559.1745414425525423796
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 06:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ywgy+5W2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: u-kumar1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53NDKMJ81548933
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 08:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745414422;
	bh=vvhBr3/Z5Vd+iPUG5GVCZ5bZTiqvbL8lFWielgJVZEI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ywgy+5W2wmEj/tQ8JaCckiuu5b9CY4bkZHbpP1JNyEgQb3cCUGCyTNz0ZGXnp1JND
	 V6qem94zkHkz7C4C+fecJ7o3KePFlXVaKPpyeX3kMD3vxjxZZEMJSltxHcrSg38Tq4
	 Z+NHEXnNTiScaXbRfOtspzfkJHpjjHJqgEIRhWSQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53NDKMtB095479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 08:20:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 08:20:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 08:20:21 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53NDKFZh041264;
	Wed, 23 Apr 2025 08:20:16 -0500
Message-ID: <56d4e2ac-8912-4ac7-be9d-d2bb71d62619@ti.com>
Date: Wed, 23 Apr 2025 18:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] omap-a15.inc: don't include
 ipu1 firmware in the boot partition
To: Denys Dmytriyenko <denis@denix.org>, <b-padhi@ti.com>
CC: <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        "CHAVDA, ANKIT" <a-chavda@ti.com>, Praneeth Bajjuri
	<praneeth@ti.com>
References: <20250315020224.3100249-1-denis@denix.org>
 <b7de1d68-1947-4ec3-b690-3cbafb84a8e8@ti.com>
 <20250318161810.GJ23729@denix.org>
 <00bc7e5d-070d-4883-855a-6359219296db@ti.com>
 <18355F7853CF1E08.27206@lists.yoctoproject.org>
 <20250423015332.GD13634@denix.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250423015332.GD13634@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Apr 2025 13:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18497


On 4/23/2025 7:23 AM, Denys Dmytriyenko wrote:
> On Fri, Apr 11, 2025 at 05:03:12PM -0400, Denys Dmytriyenko wrote:
>> Circling back to this...
>>
>> On Thu, Mar 20, 2025 at 02:29:14PM +0530, Beleswar Padhi via lists.yoctoproject.org wrote:
>>> On 18/03/25 21:48, Denys Dmytriyenko wrote:
>>>> On Sat, Mar 15, 2025 at 10:29:18AM +0530, Aniket Limaye via lists.yoctoproject.org wrote:
>>>>> On 3/15/2025 7:32 AM, Denys Dmytriyenko wrote:
>>>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>>>
>>>>>> This reverts commit c58af0b172660ef1248a3454af06251d872770b1.
>>>>>>
>>>>>> This adds an undesired dependency on meta-ti-extras - more details:
>>>>>> https://lists.yoctoproject.org/g/meta-ti/topic/110003435
>>>>>>
>>>>>> Cc: Aniket Limaye <a-limaye@ti.com>
>>>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com
>>>>>> ---
>>>>> The fw binary is actually a requirement for AM57x boards to boot
>>>>> now. U-Boot expects
>>>>> the firmware to be present in the boot partition, and fails if not found.
>>>>> (Beleswar can correct me if I'm mistaken).
>>>> Huh, interesting - do you know the version where this started?
>>> The firmware is required for Early boot of remote processors (IPU in
>>> this case) by U-Boot. Without the firmware, there won't be a system
>>> boot failure, only rproc boot will fail.
>>>
>>>
>>>> If it is indeed a hard requirement to boot the platform now, another option
>>>> is to get a prebuilt binary into ti-linux-firmware and pull it from there,
>>>> instead of building it from sources using legacy tools...
>>> This is great too. However, meta-ti should still have the deploy
>>> rule to pick the pre-built firmware and put it into the boot
>>> partition.
>>>
>>> Thanks,
>>> Beleswar
>> Thanks, Beleswar.
>>
>> Ryan, All,
>>
>> How should this be fixed?
> Ping.
>
> Since nobody's working on adding a prebuilt binary to ti-linux-firmware,
> then this should be reverted as is for now, IMHO.
>
Until, we don't have this fw in ti-linux-firmware,

need to get it through build :(

Thanks

Udit


>>>>> If we don't want to break this board, we need to maybe migrate the
>>>>> ti-ipc-rtos recipe from
>>>>> meta-ti-extras to meta-ti-bsp, since it is anyway a requirement for
>>>>> AM57X u-boot recipe.
>>>>> Denys, I also see that you mentioned that the ti-ipc-rtos recipe
>>>>> currently resides in extras
>>>>> due to the legacy recipes built from sources using old tools like
>>>>> XDC, SYS/BIOS and CGT...
>>>>> which cannot be easily moved to meta-ti-bsp.
>>>>>
>>>>> A temporary fix might be to somehow add these inside of
>>>>> meta-ti-extras/conf/layer.conf?
>>>>>
>>>>> However, I Ack the revert in case it is needed for now:
>>>>>
>>>>> Acked-by: Aniket Limaye <a-limaye@ti.com>
>>>>>
>>>>>
>>>>>>   meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +--
>>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>>>>> index a258decd..be086936 100644
>>>>>> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>>>>> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
>>>>>> @@ -48,6 +48,5 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
>>>>>>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>>>>>>   WKS_FILE ?= "sdimage-2part.wks"
>>>>>> -IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
>>>>>> +IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
>>>>>>   do_image_wic[depends] += "virtual/bootloader:do_deploy"
>>>>>> -do_image_wic[depends] += "ti-ipc-rtos:do_deploy"

