Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6BDC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 21:01:39 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.65497.1699045292604585659
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 14:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=batg/chF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3L1SSD029194;
	Fri, 3 Nov 2023 16:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699045288;
	bh=45k0eZ4RYhzhnK1/js1fdlrx450dxngmND1728utJE4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=batg/chFTNsVYiGr56LK3SyK9x9QX247h0AX8DWo6Xf7vsiHnreL4Yo0EMqRGBYYA
	 f0TbmEUHBXLO/kATDEbW2WZY5hldUf9/12Kix8ccjLFla6FpUyQYI3TkDHoKKXj2bp
	 mpCdjNIWn38eeAmKGN7tOKLdEX1VzsYi1CkfKBPU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3L1SYP025879
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 16:01:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 16:01:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 16:01:28 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3L1SqO113905;
	Fri, 3 Nov 2023 16:01:28 -0500
Message-ID: <480092a2-406e-4e56-a463-10e40134e1e0@ti.com>
Date: Fri, 3 Nov 2023 16:01:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH] k3r5: Use the ?= default assignment
 to allow for overrides
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Massimiliano Minella <massimiliano.minella@gmail.com>,
        <meta-ti@lists.yoctoproject.org>,
        Massimiliano Minella
	<massimiliano.minella@se.com>
References: <20231102104828.100681-1-massimiliano.minella@gmail.com>
 <20231103010853.GK2408@denix.org>
 <2e63846f-641d-42aa-b911-34445bd8fed6@ti.com>
 <20231103200520.GN2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231103200520.GN2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 21:01:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17238



On 11/3/2023 3:05 PM, Denys Dmytriyenko wrote:
> On Fri, Nov 03, 2023 at 11:23:47AM -0500, Ryan Eatmon wrote:
>>
>>
>> On 11/2/2023 8:08 PM, Denys Dmytriyenko wrote:
>>> On Thu, Nov 02, 2023 at 11:48:28AM +0100, Massimiliano Minella wrote:
>>>> From: Ryan Eatmon <reatmon@ti.com>
>>>>
>>>> Move to setting the values for PREFERRED_PROVIDER using the
>>>> ?= default assignment so that we can override the setting if
>>>> we would like to.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
>>>> ---
>>>>   meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>> index c5c03cbf..184d3a09 100644
>>>> --- a/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>> +++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
>>>> @@ -11,9 +11,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
>>>>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
>>>>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
>>>>   # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
>>>> -PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
>>>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
>>>> -PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>>>> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
>>>> +PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
>>>> +PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
>>>
>>> Being able to override u-boot for k3r5 makes sense.
>>>
>>> But allowing to change the kernel for k3r5 multiconfig that is now marked as
>>> baremetal is rather dubious...
>>>
>>> What kind of use-case requires it?
>>
>> I think the the use case that I created the original patch for was
>> the upstream testing.  We need to be able to change the kernel and
>> uboot versions for the testing not having the ?= was causing issues.
> 
> Please note this is specifically for k3r5, a baremetal config, where
> kernel is "neutered" by setting it to "linux-dummy". There are tons of
> implicit dependencies deep inside the OE on the kernel and all its pieces,
> modules, packages, and supporting components, which linux-dummy cuts out,
> making it a NOP.
> 
> There's no reason to ever change it even for upstream builds and testing.
> Not allowing it to be changed is a safeguard of sorts.
> 
> And since it is now being requested for backporting by Massimiliano, hence
> my question about the use-case...

Yep.  I'll take a look and see if it is needed for upstream...


> 
>> And since this patch is on master and thus will be coming to the
>> upcoming scarthgap branch shortly, I see no reason to not take it
>> for kirkstone.
>>
>> But if we want to rethink all of this, I'm not opposed.
>>
>>>
>>>>   SPL_SUFFIX = "bin"
>>>>   SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
>>>> -- 
>>>> 2.42.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

