Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7408AC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 22:31:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.442.1648247459152321219
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 15:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tmk8qorc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PMUrGL057833;
	Fri, 25 Mar 2022 17:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648247453;
	bh=PVaSSZP333IWplRsSCxDWZYnx2HNc8arKYM+Ft/ZgCA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tmk8qorcuCHsfn0sCWekacX/3GrusDKZe0nq2VFy1PZ/gxZYJj2JpRE0hK3o9u9lg
	 jcteJMNBToyyl62j1AwVTP2o7vX9CkQZzn90Ng/6sjetE5M5eOPCLEDd6N60cdecvU
	 xlvAeSFSOsE/OHPhYgUG3iaUOEtQ+sBgVgfUYsxY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PMUr07008439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 17:30:53 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 17:30:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 17:30:36 -0500
Received: from [10.250.33.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PMUa9s018819;
	Fri, 25 Mar 2022 17:30:36 -0500
Message-ID: <302157be-7c0a-2034-c8dc-ae87f26fa370@ti.com>
Date: Fri, 25 Mar 2022 17:30:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move all
 platforms to ddk 1.15
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
 <20220325220609.GJ23554@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220325220609.GJ23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 22:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14562

On 3/25/22 5:06 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
>>> On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
>>>> On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
>>>>> On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
>>>>>> Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
>>>>>>
>>>>>> Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
>>>>>
>>>>> Overall looks good, please see inline below.
>>>>>
>>>>>
>>>>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>>>>> ---
>>>>>>
>>>>>> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>>>>>> rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>>>>>> index a05de0f2..fbff6c51 100644
>>>>>> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>>>>>> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>>>>>> @@ -7,17 +7,17 @@ inherit module features_check
>>>>>>   REQUIRED_MACHINE_FEATURES = "gpu"
>>>>>> -MACHINE_KERNEL_PR_append = "b"
>>>>>> +MACHINE_KERNEL_PR_append = "a"
>>>>>>   PR = "${MACHINE_KERNEL_PR}"
>>>>>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>>> -COMPATIBLE_MACHINE = "j7"
>>>>>> +COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
>>>>>>   DEPENDS = "virtual/kernel"
>>>>>>   PROVIDES = "virtual/gpudriver"
>>>>>> -BRANCH = "1.13-5776728/linux-k5.10"
>>>>>> +BRANCH = "linuxws/dunfell/k5.10/${PV}"
>>>>>>   SRC_URI = " \
>>>>>>       git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>>>>>> @@ -26,15 +26,19 @@ SRC_URI = " \
>>>>>>   S = "${WORKDIR}/git"
>>>>>> -SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
>>>>>> +SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
>>>>>> -PVR_SOC = "j721e_linux"
>>>>>
>>>>> I was actually thinking of keeping PVR_SOC variable and moving it to
>>>>> corresponding machine configs.
>>>>>
>>>>
>>>>
>>>> PVR_SOC is a bit of a legacy name, especially since PVR is now IMG.
>>>
>>> PVR or PowerVR name is still used as an overall umbrella for all of
>>> Imagination's graphics, vision and AI chips, including SGX and Rogue/RGX:
>>> https://en.wikipedia.org/wiki/PowerVR
>>>
>>
>>
>> On the wiki page:
>>
>>> These GPUs are no longer called PowerVR, they are called IMG.[58]
>>
>> For their next gen GPUs they are distancing themselves from the PVR name,
>> the GPU in AM62xx is one such next gen GPU, so it's already not correct here
>> as is.
> 
> So, then why AM62xx is being added to Rogue driver/DDK? Should there be a
> separate Albiorix driver and DDK then?
> 


We asked IMG very nicely to not fork the DDK for each new gen of device (like
what happened with SGX -> Rogue), so now we have he same driver code base
supporting multiple generations of GPU. The name "Rogue" just stuck around.
We should probably rename some of this stuff to also be more generic.


> 
>>>> Thinking on this, the mapping between SoC family and the internal names
>>>> like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the version of this
>>>> driver. For instance in the next DDK I may want the target name to
>>>> go from "am62_linux" to "axb_128_linux", I would have to
>>>> change things here (update the SRCREV) AND in the machine config.
>>>
>>> 1. I totally agree that "axb_128_linux" makes more sense than "am62_linux".
>>> 2. Changes like that happen very rarely.
>>> 3. You can call it PVR_MODEL or PVR_PRODUCT if you want, instead of PVR_SOC.
>>>
>>>
>>>> Mapping here feels like the right spot to me. I'd even argue the same
>>>> for OPTEEMACHINE and the like, should go in the optee.bbappends with the
>>>> rest of our platform specific recipe fixups, etc.
>>>
>>> The number of overrides in the recipe will keep on growing, as each new
>>> platform will need to add own config. That's the whole point of the machine
>>> configuration file to have those defined centrally.
>>>
>>> The goal is to have a recipe as machine-agnostic and clean, as possible. Do
>>> not overwhelm it with tons of conditionals like that - any machine-specific
>>> configuration should be set in the machine config file.
>>>
>>
>>
>> Having all the fixups related to a package inside that package's definition sounds
>> more central to me, and easier to reason about. But I can see the argument both
>> ways.
>>
>> Maybe the better solution would be to splitup this(and the SGX) recipe. So we
>> get a package per GPU type. It's already how the bins are organized/shipped. Then
>> we just pick the right GPU package for our SoC in arago-prefs.inc. (again like
>> we already do to select between SGX/RGX)
> 
> Yeah, I think keeping each series of GPU (SGX, Rogue, Albiorix) in their own
> separate recipes would be fine. Or are you suggesting splitting even further
> into separate recipes for SGX530 vs SGX540, etc?
> 


I'm suggesting even further. The driver/package for SGX530 is not compatible
and conflicts with the driver package for SGX540. So lets not have a single named
package (ti-sgx-ddk-um) that can have very different contents, that's just confusing.

Andrew

