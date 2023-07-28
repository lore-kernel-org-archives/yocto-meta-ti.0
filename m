Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AE8C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 20:19:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.41478.1690575555726884230
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 13:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CdZltjID;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36SKJA5w039412;
	Fri, 28 Jul 2023 15:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690575550;
	bh=FSSKCUuk79uor4a2g59BAkGzec3YPXqgvajG9lGUzOA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CdZltjIDS6Q33cEj29wqU1LO3TbqaEsFeSAzY3xh7P7jiotMzibadCWtbwMocZuqb
	 vrVvf3+TR8X4nbwC5ksUX4vS+JNjiCuSqe7U/svMBAfK7301VeQWTdE/ZveCZx7FQd
	 PaZxmjaRfGRRzwJb8DyiAD3tD3ota0iurWLEj5xk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36SKJA8D014616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jul 2023 15:19:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jul 2023 15:19:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jul 2023 15:19:10 -0500
Received: from [10.249.33.128] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36SKJAuw022684;
	Fri, 28 Jul 2023 15:19:10 -0500
Message-ID: <6f1a998f-a6e9-1a35-f346-3b8576f33cf4@ti.com>
Date: Fri, 28 Jul 2023 15:19:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-next,conf/machine:
 Add support for new vendored dts dir
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230724204536.9382-1-reatmon@ti.com>
 <20230724211936.GP1518@denix.org>
 <a58b7cc2-c793-f9fa-5431-3c23c536b2e7@ti.com>
 <20230727222643.GT1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230727222643.GT1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Jul 2023 20:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16868



On 7/27/2023 5:26 PM, Denys Dmytriyenko wrote:
> On Tue, Jul 25, 2023 at 09:17:21AM -0500, Ryan Eatmon wrote:
>>
>> That's not true...  It will test all matching DTs in the upstream
>> kernel instead of just a fixed list.  But in the end, it is testing
>> DTs in the upstream kernel...
> 
> No, I didn't mean testing the actual DTs. I meant testing the static list of
> DTs in KERNEL_DEVICETREE making sure the list is correct and up to date.
> 
> I realize there's no easy solution to list 32bit DTs that would work with
> vendored and flat structures, so using auto-population by prefix makes sense.
> My comment was simply to state that it inadvertently affects 64bit platforms,
> as they are now also switched to dynamic list, so static list no longer being
> used and could easily go out of sync with relity...

Gotcha.  And I agree.  It's an unfortunate side effect.


> 
>> On 7/24/2023 4:19 PM, Denys Dmytriyenko wrote:
>>> This has a negative side-effect of linux-ti-next never testing *upstreamed*
>>> DTs listed in KERNEL_DEVICETREE even on modern 64bit K3 platforms...
>>>
>>>
>>> On Mon, Jul 24, 2023 at 03:45:36PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> The latest kernel has made the change to add vendor subdirectories into
>>>> the arm 32bit dts directory.  This effectively breaks the
>>>> KERNEL_DEVICETREE settings in the machine configs for 32bit platforms,
>>>> so switch them over to using the PREFIX variable.  Also change the
>>>> linux-ti-next to use the PREFIX setting for KERNEL_DEVICETREE.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>>   meta-ti-bsp/conf/machine/am57xx-evm.conf      | 11 ++---------
>>>>   meta-ti-bsp/conf/machine/dra7xx-evm.conf      |  9 ++-------
>>>>   meta-ti-bsp/conf/machine/include/ti33x.inc    | 19 +++++--------------
>>>>   meta-ti-bsp/conf/machine/include/ti43x.inc    |  9 +++------
>>>>   meta-ti-bsp/conf/machine/omapl138-lcdk.conf   | 10 +++++-----
>>>>   .../recipes-kernel/linux/linux-ti-next_git.bb |  1 +
>>>>   6 files changed, 18 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>>> index 26b7f78c..4c13e9c2 100644
>>>> --- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
>>>> @@ -13,6 +13,7 @@ KERNEL_DEVICETREE_PREFIX = " \
>>>>       ti/am57 \
>>>>       ti/lcd \
>>>>       ti/ov10635 \
>>>> +    ti/omap/am57 \
>>>>   "
>>>>   KERNEL_DEVICETREE_DTBMERGE = " \
>>>> @@ -20,15 +21,7 @@ KERNEL_DEVICETREE_DTBMERGE = " \
>>>>       am57xx-evm-reva3.dtb \
>>>>   "
>>>> -KERNEL_DEVICETREE = " \
>>>> -    am57xx-beagle-x15.dtb \
>>>> -    am57xx-beagle-x15-revb1.dtb \
>>>> -    am57xx-beagle-x15-revc.dtb \
>>>> -    am5729-beagleboneai.dtb \
>>>> -    am571x-idk.dtb \
>>>> -    am572x-idk.dtb \
>>>> -    am574x-idk.dtb \
>>>> -"
>>>> +KERNEL_DEVICETREE = ""
>>>>   UBOOT_MACHINE = "am57xx_evm_config"
>>>> diff --git a/meta-ti-bsp/conf/machine/dra7xx-evm.conf b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>>>> index c47a1e80..410b8048 100644
>>>> --- a/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/dra7xx-evm.conf
>>>> @@ -12,15 +12,10 @@ KERNEL_DEVICETREE_PREFIX = " \
>>>>       dra7 \
>>>>       ti/dra7 \
>>>>       ti/lcd \
>>>> +    ti/omap/dra7 \
>>>>   "
>>>> -KERNEL_DEVICETREE = " \
>>>> -    dra7-evm.dtb \
>>>> -    dra71-evm.dtb \
>>>> -    dra72-evm.dtb \
>>>> -    dra72-evm-revc.dtb \
>>>> -    dra76-evm.dtb \
>>>> -"
>>>> +KERNEL_DEVICETREE = ""
>>>>   UBOOT_MACHINE = "dra7xx_evm_config"
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>> index f7f126f4..b73ab97a 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
>>>> @@ -19,22 +19,13 @@ PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
>>>>   KERNEL_IMAGETYPE = "zImage"
>>>> -KERNEL_DEVICETREE_PREFIX = "am335x"
>>>> -
>>>> -KERNEL_DEVICETREE = " \
>>>> -    am335x-evm.dtb \
>>>> -    am335x-evmsk.dtb \
>>>> -    am335x-icev2.dtb \
>>>> -    am335x-pocketbeagle.dtb \
>>>> -    am335x-bone.dtb \
>>>> -    am335x-boneblue.dtb \
>>>> -    am335x-bonegreen.dtb \
>>>> -    am335x-bonegreen-wireless.dtb \
>>>> -    am335x-boneblack.dtb \
>>>> -    am335x-boneblack-wireless.dtb \
>>>> -    am335x-sancloud-bbe.dtb \
>>>> +KERNEL_DEVICETREE_PREFIX = " \
>>>> +    am335x \
>>>> +    ti/omap/am335x \
>>>>   "
>>>> +KERNEL_DEVICETREE = ""
>>>> +
>>>>   UBOOT_ARCH = "arm"
>>>>   UBOOT_MACHINE = "am335x_evm_config"
>>>> diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
>>>> index a6af56e3..5f794682 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/ti43x.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
>>>> @@ -22,14 +22,11 @@ KERNEL_IMAGETYPE = "zImage"
>>>>   KERNEL_DEVICETREE_PREFIX = " \
>>>>       am437x \
>>>>       am43x \
>>>> +    ti/omap/am437x \
>>>> +    ti/omap/am43x \
>>>>   "
>>>> -KERNEL_DEVICETREE = " \
>>>> -    am437x-gp-evm.dtb \
>>>> -    am437x-sk-evm.dtb \
>>>> -    am437x-idk-evm.dtb \
>>>> -    am43x-epos-evm.dtb \
>>>> -"
>>>> +KERNEL_DEVICETREE = ""
>>>>   KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
>>>> diff --git a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>>>> index a8b08964..23b322ac 100644
>>>> --- a/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>>>> +++ b/meta-ti-bsp/conf/machine/omapl138-lcdk.conf
>>>> @@ -15,9 +15,9 @@ IMAGE_FSTYPES += "tar.xz"
>>>>   SERIAL_CONSOLES = "115200;ttyS2"
>>>> -KERNEL_DEVICETREE_PREFIX = "da850"
>>>> -
>>>> -KERNEL_DEVICETREE = " \
>>>> -    da850-evm.dtb \
>>>> -    da850-lcdk.dtb \
>>>> +KERNEL_DEVICETREE_PREFIX = " \
>>>> +    da850 \
>>>> +    ti/davinci/da850 \
>>>>   "
>>>> +
>>>> +KERNEL_DEVICETREE = ""
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> index 9138c7c5..8228f4ff 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>>>   inherit kernel
>>>>   require recipes-kernel/linux/ti-kernel.inc
>>>> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>>>>   DEPENDS += "gmp-native libmpc-native"
>>>> -- 
>>>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

