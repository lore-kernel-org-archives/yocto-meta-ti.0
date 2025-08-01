Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC12AC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:43:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.89714.1754059401473297455
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 07:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XQALaoAt;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571EhINk3265346;
	Fri, 1 Aug 2025 09:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754059398;
	bh=jqOnPOqj0S9pjXyZIRowBY7yTWOp8siF0/zYf5gvLKo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XQALaoAtEi9ySiasXAWXE2Lsh2wa7VB3+rK1SYMyATaJGndMJArw38XCL3nMMh0nU
	 pxwtbd93wNc+vUBuvyh8FwLKvJ5+7d450Xj7fop5f3fTDNRZNiBEn5+U5vwF7YAxSe
	 CQ+K0i6svgXtD7vWu1IaQRq3UdX/5mYH6aUz8/+I=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571EhIY5840983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 09:43:18 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 09:43:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 09:43:17 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571EhEUJ234375;
	Fri, 1 Aug 2025 09:43:15 -0500
Message-ID: <b7f781e5-a3c4-429a-881f-27a623889fc8@ti.com>
Date: Fri, 1 Aug 2025 20:13:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH 2/2] ti-pka-fw: Update license
 to PKA-FW
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250801044441.1059527-1-b-padhi@ti.com>
 <20250801044441.1059527-3-b-padhi@ti.com>
 <5208b043-f58c-4abf-a98d-c8fda3bd1d5a@ti.com>
 <20250801143406.GS24899@denix.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250801143406.GS24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 14:43:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18876


On 8/1/2025 8:04 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 01, 2025 at 07:41:17AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>> On 7/31/2025 11:44 PM, Beleswar Padhi wrote:
>>> The PKA-FW license has been added to meta-ti. Point to that license in
>>> the PKA firmware recipe.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>>   meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>>> index 49ae0251..bd31726c 100644
>>> --- a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
>>> @@ -1,7 +1,7 @@
>>>   SUMMARY = "PKA prebuilt binary firmware image"
>>> -LICENSE = "TI-TFL & INSIDE Secure"
>>> -LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
>>> +LICENSE = "PKA-FW"
>>> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/PKA-FW;md5=251316268d8e7d1a546e5e6a08af6d9c"
>> Also, when changing the value in LIC_FILES_CHKSUM it is required
>> that you provide a line in the commit message:
>>
>> License-Update: reason
>>
>> Telling people in a short/brief manner the nature of the change.  In
>> this case you could get away with:
>>
>> License-Update: see commit message
>>
>> Is that right, Denys?
> Well, why so radical changes?
>
> Isn't it still "TI-TFL & INSIDE-Secure"?
>
> We already have TI-TFL license in meta-ti, we just need to add INSIDE-Secure
> file.


I was trying to keep everything same as done in ti-linux-firmware repo. 
They added a separate License file for PKA:
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware-next&id=a2f39386f89d5ad68a324a9371da3bb8dd20f7de

>
> And LIC_FILES_CHKSUM doesn't need to change, it should still point to the file
> in the firmware repository.

Then why add the LICENSE FILE here, if checksum is compared from the one 
in ti-linux-firmware repo? Thanks, Beleswar


