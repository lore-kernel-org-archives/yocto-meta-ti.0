Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55EBC77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 14:09:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9969.1681826951054681386
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 07:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w6dhpWWw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33IE94nj036528;
	Tue, 18 Apr 2023 09:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681826944;
	bh=5VQljnQp+Uo/KEccXgrzR7vq7E/EIjGstvT4GV31qUc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w6dhpWWwFfh9ciJpjULQpbEfOtanRzhEUBSRUnB2GA8vETBUfzu8ATrX4vWHuPvud
	 IxMNGrcgsvykcDssrjKSydFV+gbmPBSJ8dqXdF806VZefrllfMMZ5ae1Vl06oxApVe
	 qBmSNE1krXn56LarcEj6GjUIAWbCjHqFJHPxYbiA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33IE94lZ011471
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 09:09:04 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 09:09:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 09:09:04 -0500
Received: from [10.249.35.219] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33IE94b7084727;
	Tue, 18 Apr 2023 09:09:04 -0500
Message-ID: <9ea3e4f4-cfa0-6e11-b9e9-cec66c51a1fd@ti.com>
Date: Tue, 18 Apr 2023 09:09:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 5/6] meta-ti-bsp: Remove SGX
 driver from SIGGEN_EXCLUDERECIPES_ABISAFE
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230412184242.29743-1-afd@ti.com>
 <20230412184242.29743-5-afd@ti.com> <20230412204312.GJ9226@denix.org>
 <57e5d47d-3088-0df6-608b-35bb21f8c91f@ti.com>
 <20230412212519.GL9226@denix.org>
 <b13cd500-5d47-8e19-b3ac-64c07779b59b@ti.com>
 <20230414205407.GO9226@denix.org>
 <b93fc290-9371-c7dd-8620-972f07ddca08@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <b93fc290-9371-c7dd-8620-972f07ddca08@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 14:09:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16406



On 4/14/2023 16:43, Andrew Davis wrote:
> On 4/14/23 3:54 PM, Denys Dmytriyenko wrote:
>> On Wed, Apr 12, 2023 at 04:28:45PM -0500, Andrew Davis wrote:
>>> On 4/12/23 4:25 PM, Denys Dmytriyenko wrote:
>>>> On Wed, Apr 12, 2023 at 04:08:50PM -0500, Andrew Davis wrote:
>>>>> On 4/12/23 3:43 PM, Denys Dmytriyenko wrote:
>>>>>> On Wed, Apr 12, 2023 at 01:42:41PM -0500, Andrew Davis via 
>>>>>> lists.yoctoproject.org wrote:
>>>>>>> Neither of recipes nor their ABI is all that stable. OpenGL might be
>>>>>>> slightly more stable, but that is not what these provide anymore.
>>>>>>> Remove these.
>>>>>>
>>>>>> This is not what you think it is... :) Actually, Rogue recipes 
>>>>>> should be added
>>>>>> to the list.
>>>>>>
>>>>>> This is specific to signatures/shared state. The ABI in this case 
>>>>>> is libgles
>>>>>> and libegl (which are stable) and tells bitbake to avoid 
>>>>>> rebuilding generic
>>>>>> apps depending on these packages between platfoms in the same 
>>>>>> architecture.
>>>>>>
>>>>>
>>>>> These do not provide those API anymore, Mesa does. And nothing 
>>>>> should depend
>>>>> on the KM package other than the UM libs.
>>>>
>>>> Still doesn't matter - if you have Mesa depend on these, you still 
>>>> need them
>>>> listed in here to avoid rebuilding Mesa from one platform to 
>>>> another. And
>>>> everything else downstream.
>>>>
>>>
>>> We *want* Mesa to be rebuilt if these change, these do not provide a 
>>> stable ABI
>>> anymore, it can and does change, sometimes between platforms (SGX KM 
>>> -> UM is
>>> based on plat).
>>
>> The name of the variable may be confusing. It's not about rebuilding 
>> Mesa once
>> you make changes to the KM/UM pieces - that will happen automatically 
>> if the
>> dependencies are tracked properly.
>>
>> This variable is about re-use of the dependant generic packages. The 
>> issue it
>> is trying to solve is when you have machine-specific packages early in 
>> the
>> dependecy tree, everything down the dependency tree that depends on these
>> packages will be treated as machine-specific, even if they are 
>> generic. Since
>> bitbake will try to play safe here, you have to tell it otherwise.
>>
>> Again, this is not about rebuilds of a dependent component between 
>> changes.
>> This is about rebuilds of a dependent component between different 
>> machines
>> (platforms) w/o making any changes.
>>
>> For example, Wayland, Weston and all Qt5 modules are generic and 
>> should be
>> re-used from shared state across all our Aarch64 platforms, but that's 
>> not the
>> case and they are being rebuilt for each and every platform again and 
>> again.
>>
>> I've done some experiments locally - back when SGX/Rogue UM libs provided
>> libgles, libegl, libgbm (which API/ABI are supposed to be stable!), you
>> certainly wanted to have them listed in this 
>> SIGGEN_EXCLUDERECIPES_ABISAFE
>> list. Now, those ABIs have shifted to Mesa and we do mark that package as
>> machine-specific (I had to add PACKAGE_ARCH = "${MACHINE_ARCH}" when 
>> redoing
>> Reese's patches - see v8 changes section at [1]). With that in mind, this
>> variable now has to list Mesa instead of individual UM packages - the 
>> patch
>> is coming.
>>
> 
> So then we are saying the same thing, the UM libs should not be listed 
> here.
> This patch should go in then, and another one that adds Mesa to the list
> can go in after.
> 
> If that is fine, then the first 5 patches in this series should be good 
> to go.

Denys, is there a follow on patch to this one that will correct your 
comments?  Should I hold off on applying this patch until your patch is 
ready, or go ahead and apply it so that you have a basis for your patch?


> Andrew

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

