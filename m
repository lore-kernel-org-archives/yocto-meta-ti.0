Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6EEC83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 15:10:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.11229.1752160197875299088
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jul 2025 08:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Om1MNFQg;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AF9rBn1543006;
	Thu, 10 Jul 2025 10:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752160193;
	bh=wcFuG4xxzQLl2cz78VLpb6vzHOG3SFrFftTOb5DwcsI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Om1MNFQgbca8NS2zbtbqDhUWL+Xfr9RW3mVbqQVBAK9j9bzdELRhGwhM9hsbLTEHq
	 Pkm3vs7x7QQyYYTq6bx47txxJWQlPDnzDatRCiNcP1s6W13nCR/QChrvVRf7+k9tJV
	 4nOQ8T2TRycU4iYR2+BzACsdYDnGLbH0J/WYjo44=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AF9rMH1342616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 10:09:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 10:09:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 10:09:52 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AF9qiA1556943;
	Thu, 10 Jul 2025 10:09:52 -0500
Message-ID: <a75ab3a1-9a01-4eb2-b666-f6c89ecb5132@ti.com>
Date: Thu, 10 Jul 2025 10:09:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] meta-ti-bsp:
 linux-ti-staging-rt_6.12.bb: Add AM57xx RT branch
To: Denys Dmytriyenko <denis@denix.org>
CC: Beleswar Padhi <b-padhi@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>,
        <afd@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250710093957.3740966-1-b-padhi@ti.com>
 <997eff48-8faf-4da4-ac90-29b49a5589e8@ti.com>
 <20250710150605.GV18383@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250710150605.GV18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Jul 2025 15:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18772



On 7/10/2025 10:06 AM, Denys Dmytriyenko wrote:
> On Thu, Jul 10, 2025 at 09:32:51AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 7/10/2025 4:39 AM, Beleswar Padhi wrote:
>>> While all other devices use the same branch for RT and non-RT builds,
>>> the AM57xx ARM32 devices have a separate branch for RT Kernel which is
>>> "ti-rt-linux-6.12.y-arm32". Update the BRANCH and SRCREV for am57xx
>>> device family for RT builds.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>> index 9e5c4ee4..e78f046d 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>> @@ -6,4 +6,7 @@ KERNEL_LOCALVERSION:append = "-rt"
>>>   # This will have priority over generic non-rt path
>>>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>>> +BRANCH:am57xx = "ti-rt-linux-6.12.y-arm32"
>>> +SRCREV:am57xx = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
>>
>> NAK.
>>
>> This is applies to all 32bit platforms, not just am57xx.  So the
>> mechanism needs to be done in a way to support that.
>>
>> BRANCH_32BIT = "ti-rt-linux-6.12.y-arm32"
>> SRCREV_32BIT = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
>>
>> BRANCH:ti33x = "${BRANCH_32BIT}"
>> BRANCH:ti43x = "${BRANCH_32BIT}"
>> BRANCH:am57xx = "${BRANCH_32BIT}"
>>
>> SRCREV:ti33x = "${SRCREV_32BIT}"
>> SRCREV:ti43x = "${SRCREV_32BIT}"
>> SRCREV:am57xx = "${SRCREV_32BIT}"
> 
> What about dra7xx? Why not simply use armv7a override?

We have "dropped" support for dra7xx, we do not build it or test it.

> Also, not sure about RT on omapl128, but that's armv5.

Same for omapl128.  We are not really supporting or testing it anymore.


So the list is just those three, which is why I suggested this path 
rather than the more generic one.

> 
>> Also, update the commit message to not be am57 specific.
>>
>> And in the subject, we don't need the meta-ti-bsp or the .bb:
>>
>> [master/scarthgap][PATCH] linux-ti-staging-rt_6.12: Add 32bit RT branch
>>
>> Keep the subject shorter when possible
>>
>>>   include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

