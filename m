Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B1C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:42:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.28253.1681249336606604977
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gXrwi+2i;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLgDQN026307;
	Tue, 11 Apr 2023 16:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681249333;
	bh=jNW/Qi6AHlWXcf3ASIZ3Ojhiqi5ygDClEzWHbqURZk4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gXrwi+2iuzDj1su7t3d301ZP5jrKmB3CDm8EAxCxlqkJfk1D8Ior5lAvo1Darh54S
	 N7UmXmlap+AbyuBwswUeGXUbdLlYYNjaBDGQYPkXsoRYwFUauQ61uocEvoN64et0SO
	 ZSvNnoiu2ISPi6w4cHtgekJ+axJiDNMrykzLH2Qw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLgDZE060746
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:42:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:42:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:42:12 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLgClw079094;
	Tue, 11 Apr 2023 16:42:12 -0500
Message-ID: <3226bd18-ab5d-bb80-4b3d-f64e07368f37@ti.com>
Date: Tue, 11 Apr 2023 16:42:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 4/5] linux-ti-next: Add
 defconfig for OMAP-L138
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230411174037.32244-1-afd@ti.com>
 <20230411174037.32244-4-afd@ti.com> <20230411195104.GY9226@denix.org>
 <d87090de-aa5f-e36a-63a2-dcbe11a9102c@ti.com>
 <20230411213258.GA9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230411213258.GA9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:42:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16361

On 4/11/23 4:32 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 11, 2023 at 04:14:47PM -0500, Andrew Davis wrote:
>> On 4/11/23 2:51 PM, Denys Dmytriyenko wrote:
>>> On Tue, Apr 11, 2023 at 12:40:36PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> Not sure if anyone is testing on this device with -next, but for
>>>> completeness add its defconfig.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> index b540e508..62831c9c 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>>>> @@ -20,6 +20,7 @@ PV = "6.1.0-rc1+git${SRCPV}"
>>>
>>> Should PV/SRCREV be bumped past 6.1-rc1?
>>>
>>
>> Someone should. But unless we automate then it will get stale again.
>>
>> It could be part of the build automation scripts when we start -next
>> testing..
> 
> And it already is - Arago Distro branding-next AUTOREVs it:
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/include/branding-next.inc#n4
> 
> It is done indirectly through the Distro/branding as recipes shouldn't default
> to AUTOREV. You don't want bitbake to hit kernel.org everytime the recipe gets
> parsed, even when you are not building it.
> 
> I know "next" will be getting stale very quickly and it's expected, but it may
> be nice to get it updated now, since you are changing it anyway...
> 

Sure, why not, will add a patch for v3

Andrew

