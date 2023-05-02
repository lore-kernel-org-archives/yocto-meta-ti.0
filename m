Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AEAC77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:59:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5631.1683068352668906482
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 15:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CPCsPS5C;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342Mx7R6091356;
	Tue, 2 May 2023 17:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683068347;
	bh=GMV3JdStCsA8r8QmLuQjerY0TwHqVFOIlRym378j0SM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CPCsPS5ClLjMgKj1mk36A8rF/0QiaHK7rcV9uGe473UA1pig/nWf2VrBaqqHbYKnU
	 DQfIvpliibhYoa0i6cgDxKRib4K1kxXwkdHGgM2wAj5mPb1LG7pgN3mO2e+nfmYD4e
	 bNq1s+NjwTBZxeMtqeTJXvEfXOw8Tq3WCbYFs0aY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342Mx7h5116588
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 17:59:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 17:59:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 17:59:06 -0500
Received: from [10.249.32.181] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342Mx6ws074335;
	Tue, 2 May 2023 17:59:06 -0500
Message-ID: <0a08e0a2-1ba4-d003-7be9-0109ddf63fe8@ti.com>
Date: Tue, 2 May 2023 17:59:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti][master/kirkstone][PATCH]
 all: http to https everything
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Randolph Sapp <rs@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230428002809.1930898-1-rs@ti.com>
 <3d1cd334-740c-936e-ad61-3c02131dfd09@ti.com>
 <20230428015903.GS9226@denix.org>
 <7f53699d-3fac-da19-2340-89cca2c668d0@ti.com>
 <20230502190921.GB9226@denix.org>
 <927650ff-ff22-d64a-2aa4-988de3f0a8fb@ti.com>
 <20230502224753.GE9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230502224753.GE9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 22:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16477



On 5/2/2023 17:47, Denys Dmytriyenko wrote:
> On Tue, May 02, 2023 at 04:49:28PM -0500, Randolph Sapp wrote:
>> On 5/2/23 14:09, Denys Dmytriyenko wrote:
>>> On Fri, Apr 28, 2023 at 11:24:11AM -0500, Randolph Sapp wrote:
>>>> On 4/27/23 20:59, Denys Dmytriyenko wrote:
>>>>> On Thu, Apr 27, 2023 at 07:31:16PM -0500, Randolph Sapp wrote:
>>>>>> On 4/27/23 19:28, rs@ti.com wrote:
>>>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>>>
>>>>>>> All of the software-dl links 302 to https urls anyway. Just jump
>>>>>>> straight to the secure version.
>>>>>>>
>>>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>>>> ---
>>>
>>> <snip>
>>>
>>>
>>>>>>> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>>>> index f0992aa7..77d23b6d 100644
>>>>>>> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>>>> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>>>> @@ -11,7 +11,7 @@ require ../includes/ti-eula-unpack.inc
>>>>>>>   S = "${WORKDIR}/cgt470_${PV}"
>>>>>>> -SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>>>>>>> +SRC_URI = "https://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>>>>>>
>>>>>> Don't actually merge this. Wanted to take this opportunity to ask
>>>>>> what on earth theses SRC_URIs are. What do these mean, what's the
>>>>>> story?
>>>>>
>>>>> Heh, these were placeholders for "clickwrap" packages, which at some point
>>>>> long time ago TI Legal considered a "great" way to distribute software...
>>>>> Basically, there was no direct download URL - you must have downloaded them
>>>>> manually by filling out an online form and signing some sort of an agreement,
>>>>> which would trigger the download. Then you "install the source into the local
>>>>> downloads dir" (hence the name) by copying what you've downloaded manually
>>>>> into your ${DL_DIR} and Bitbake would be able to find it there regardless of
>>>>> the actual SRC_URI.
>>>>>
>>>>
>>>> Oh cool, I hate it. (Thanks for the explanation, I just really don't
>>>> like this idea.) Can we drop these (install methods or packages if
>>>> necessary) or will policy not allow it?
>>>
>>> Nobody likes it on the engineering side! :) But it was forced back in the day
>>> by sales/marketing/legal and took a lot of effort to convince everyone that
>>> this clickwrap stuff doesn't bring much benefit, but causes damage...
>>>
>>> Since then most if not all of TI packages dropped clickwrap and allowed direct
>>> download. Hence you don't see a lot of these weird URLs in recipes any more.
>>>
>>> Not sure about CodeGen Tool for TMS470 MCU and if there were newer releases or
>>> if it's still active - nobody cared to update this recipe in over 10 years.
>>> Other CGT recipes for ARM, PRU, C6x, C7x etc. in that recipes-ti/devtools
>>> directory were kept mostly up to date, but not for TMS470. Not sure if there
>>> are any downstream users anymore, maybe time to remove it...
>>>
>>
>> I'll add a patch to drop codegen then. It'll be a little bit of a
>> scream test but I'm sure it's fine. The C7 / C6 components I know
>> still have a few dependents in meta-arago though, so I don't think
>> those can be dropped. Will see if there is a non-clickwrapped source
>> for those yet.
> 
> Ah, there's still an older C6x CGT 7.4.16 that is clickwrapped - at some point
> there was one component remaining that required it, while everything else got
> migrated to C6x CGT 8.x, which enabled direct download and we have a recipe
> for version 8.3.2 already. And the recipe for older 7.x was specifically in
> its own namespace to allow both of them in the same build, until the last
> dependency for it goes away.
> 
> C7x CGT never was clickwrapped, as the arch is newer than those dark times :)
> 
> BTW, assuming that meta-arago is the only consumer of meta-ti components is
> not very safe.

Agreed.  We are already toying around with supporting OpenBMC which 
absolutely does not use arago.


> But I think dropping CGT for TMS740 and old CGT 7.x for C6x
> should be fine and those are the only remaining clickwrapped recipes.
> 
> IIRC, TMS740 arch was an old ARM MCU, so generic ARM CGT should probably also
> work, I guess.
> 
> 
>>>> Also, is this URI
>>>> functionality baked into the http fetcher or is this just leaning on
>>>> bitbake being unable to resolve the domain and then falling back on
>>>> the local copy?
>>>
>>> This is basic Bitbake fetcher functionality and is well documented. High level
>>> order of operations to locate sources:
>>>
>>> 1. Check if you already have them in your local DL_DIR
>>> 2. Go through the list of configured PREMIRRORS to locate the sources there
>>> 3. Actually hit the upstream SRC_URI and try to download the original src
>>> 4. If everything else fails, check through the list of "post" MIRRORS
>>>
>>> So, requiring user to pre-download the sources manually and placing them in
>>> their local DL_DIR per the original documentation would shortcut the process
>>> at step 1.
>>>
>>> Otherwise it would break at step 3 (and 4) and hopefully the weird URL would
>>> give user some clues or at least force to read the docs...
>>>
>>> There's nothing special about the URL, besides the convention that .local is
>>> reserved - https://en.wikipedia.org/wiki/.local - and the entire name
>>> suggesting to install the sources in local dir :)
>>>
>>
>> Ah, alright. At least this isn't that bad then. I still don't like
>> the idea of being able to reach steps 3&4 in this case as it will
>> check http sources. Local is reserved but it's still not a great
>> idea to allow this fetch to go through, even if *ideally* it should
>> fail to resolve.
> 
> You can try adding do_fetch[network] = "0" to that recipe...
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

