Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A84C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 16:43:32 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.14481.1741711405760497640
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 09:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=neeBhokQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGhMTq1347528
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 11:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741711402;
	bh=5LJCf3P/xf+TeRiOyBtj1dxJfVUNxOBN4JLFqUESk0Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=neeBhokQbSSxemP9L9EmYC6lzy94kmyVxTFwld9LLEVl7RiW8nCFX9T8mmrAYKZKz
	 y7Egab2XZxTu0NMjLK3heRGomGdZ/P2nbto6S47PPG4WqcF7G55bAvm6Xxgs2UXvuV
	 WUmaaipQPJnScJf9VlbMcgtaR0CSK5LgceeEBA2g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BGhMqv023142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 11:43:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 11:43:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 11:43:21 -0500
Received: from [10.249.33.140] ([10.249.33.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BGhLAj032696;
	Tue, 11 Mar 2025 11:43:21 -0500
Message-ID: <52517f1f-c7a7-490a-993f-e3e1c24ef0ea@ti.com>
Date: Tue, 11 Mar 2025 11:43:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap][PATCH 1/2] ti-bsp: ti-img-encode-decode:
 Add Recipe for Building VXE-VXD Out-of-Tree Module
To: Denys Dmytriyenko <denis@denix.org>, <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Darren Etheridge <detheridge@ti.com>
References: <20250306203749.794759-1-b-brnich@ti.com>
 <182A59C7642211D5.31492@lists.yoctoproject.org>
 <182B88F400236EE2.13955@lists.yoctoproject.org>
 <20250310202926.GS1879@denix.org>
 <20250310203953.odjau32sbqbulruq@udba0500997>
 <20250310211407.GT1879@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250310211407.GT1879@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Mar 2025 16:43:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18371



On 3/10/2025 4:14 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 10, 2025 at 03:39:53PM -0500, Brandon Brnich via lists.yoctoproject.org wrote:
>> Hi Denys,
>>
>> On 16:29-20250310, Denys Dmytriyenko wrote:
>>> On Mon, Mar 10, 2025 at 03:50:56PM -0400, Denys Dmytriyenko wrote:
>>>> On Thu, Mar 06, 2025 at 06:15:13PM -0500, Denys Dmytriyenko wrote:
>>>>> On Thu, Mar 06, 2025 at 02:37:48PM -0600, Brandon Brnich via lists.yoctoproject.org wrote:
>>>>>> During 10.0 LTS bringup, the decision was made that it would be the last LTS
>>>>>> that carried the IMG VXE and VXD driver in tree. Driver is now hosted on
>>>>>> git.ti.com. This recipe is responsible for pulling in the driver,
>>>>>> building it, and packaging it within the J721e SDK.
>>>>>>
>>>>>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>>>>>> ---
>>>>>>
>>>>>> This build was tested by changing the kernel to point towards latest
>>>>>> head that has relevant device tree changes and config options. Build is
>>>>>> successful with those changes and no warnings are present.
>>>>>>
>>>>>>   .../ti-vxe-vxd-driver_6.12.bb                 | 23 +++++++++++++++++++
>>>>>>   1 file changed, 23 insertions(+)
>>>>>>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
>>>>>> new file mode 100644
>>>>>> index 00000000..fa2d3792
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
>>>>>> @@ -0,0 +1,23 @@
>>>>>> +DESCRIPTION =  "Kernel drivers for the VXE384 and D5500 Video Accelerators found in the J721E TI SoC"
>>>>>
>>>>> Shorter SUMMARY is missing?
>>
>> Should I just change DESCRIPTION to SUMMARY? Why need both?
> 
> Sigh, I'm becoming a "broken record"...
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-SUMMARY
> SUMMARY - A short summary for the recipe, which is 72 characters or less.
> 
> This is mandatory.
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-DESCRIPTION
> DESCRIPTION - A long description for the recipe.
> 
> This is optional - SUMMARY is used if omitted.
> 
> 
>>>>>> +LICENSE = "GPL-2.0-only"
>>>>>> +LIC_FILES_CHKSUM = "file://README;beginline=11;endline=12;md5=ad10b552e357ac443ec5dd2e02912b1b"
>>>>>> +
>>>>>> +inherit module
>>>>>> +
>>>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>> +
>>>>>> +COMPATIBLE_MACHINE = "j721e"
>>>>>> +
>>>>>> +DEPENDS += "virtual/kernel"
>>>>>> +
>>>>>> +BRANCH = "scarthgap/k${PV}"
>>>>>> +
>>>>>> +SRC_URI = "git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
>>>>
>>>> Also, SRC_URI is incorrect - should be git://git.ti.com/git/multimedia/... for
>>>> https access (i.e. one level of /git/ is missing):
>>>>
>>>> WARNING: ti-vxe-vxd-driver-6.12-r0 do_fetch: Failed to fetch URL git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=scarthgap/k6.12, attempting MIRRORS if available
>>>>
>>>> Just do this to see other examples in meta-ti:
>>>>
>>>> $ grep 'git://git.ti.com' * -r
>>
>> Okay will also fix.
>>
>>>
>>> And it fails to build:
>>>
>>> | /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/encoder/vxe_enc.c:24:9: warning: "MAX" redefined
>>> |    24 | #define MAX(a, b, type) ({ \
>>> |       |         ^~~
>>> | In file included from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/kernel.h:28,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/arch/arm64/include/asm/cpufeature.h:26,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/arch/arm64/include/asm/processor.h:38,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/sched.h:13,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/ratelimit.h:6,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/dev_printk.h:16,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/device.h:15,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/dma-mapping.h:8,
>>> |                  from /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/encoder/vxe_enc.c:16:
>>> | /OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/include/linux/minmax.h:330:9: note: this is the location of the previous definition
>>> |   330 | #define MAX(a,b) __cmp(max,a,b)
>>> |       |         ^~~
>>> |   LD [M]  /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxe-enc.o
>>> |   LD [M]  /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxd-dec.o
>>> |   MODPOST /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/Module.symvers
>>> | ERROR: modpost: "vb2_dma_sg_memops" [/OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxe-enc.ko] undefined!
>>> | ERROR: modpost: "vb2_dma_sg_memops" [/OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/vxd-dec.ko] undefined!
>>> | make[4]: *** [/OE/arago-master/build/arago-tmp-default/work-shared/j721e-evm/kernel-source/scripts/Makefile.modpost:145: /OE/arago-master/build/arago-tmp-default/work/j721e_evm-oe-linux/ti-vxe-vxd-driver/6.12/git/Module.symvers] Error 1
>>>
>>
>> I added this in the notes section that the kernel commit needed to point
>> at the HEAD of TI's 6.12.y-cicd branch in order to build due to a config
>> issue. The driver built and was validated against Scarthgap.
> 
> This has been merged to master-wip, which is what I'm testing now. It seems
> required dependencies are not met.
> 
> 
>> This patch can already be found in scarthgap tree[0]. I will submit new
>> patch to fix up the other comments you have made.
>>
>> [0]: https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=scarthgap&id=296344c8ea44b958269352cd5a417adfd9df9857
> 
> This is unacceptable!!
> 
> The first comment was made the same day within couple of hours of the patch
> being posted to the list:
> https://patchwork.yoctoproject.org/project/ti/patch/20250306203749.794759-1-b-brnich@ti.com/
> 
> There should be AT LEAST 24-48 hours allowed for patch reviews and comments.
> There should NOT be any pressure applied on the maintainer to merge the
> patches immediately.

That's my fault.  I was the one rushing this.

Brandon, send in a second patch fixing all of the reported comments.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

