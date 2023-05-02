Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2A7C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:49:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3726.1683064173596345471
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 14:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fi3F0b4n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342LnTJ5117773;
	Tue, 2 May 2023 16:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683064169;
	bh=QCaj0VeDo36EOR+U8C4eWVNaJdbNS2/+Baf6aC1t1/A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fi3F0b4n673ubj+xTWm8GT7vTLJ12lWX1EIbDMpIdSslxKrAB2SH5FIpESY1SBpxi
	 5JNHlgae2h7s2DX1fvaRfmOe8WE9jQDcTX5VErsqQh/3i6jCFxqrycxQwVM3Q0Mu97
	 aOFh4tm4ksM/ITlqP8xyJYjOdpqb5z5AsuOlP1eg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342LnT8O026416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 16:49:29 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 16:49:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 16:49:28 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342LnSAP109524;
	Tue, 2 May 2023 16:49:28 -0500
Message-ID: <927650ff-ff22-d64a-2aa4-988de3f0a8fb@ti.com>
Date: Tue, 2 May 2023 16:49:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti][master/kirkstone][PATCH]
 all: http to https everything
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230428002809.1930898-1-rs@ti.com>
 <3d1cd334-740c-936e-ad61-3c02131dfd09@ti.com>
 <20230428015903.GS9226@denix.org>
 <7f53699d-3fac-da19-2340-89cca2c668d0@ti.com>
 <20230502190921.GB9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230502190921.GB9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 21:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16475

On 5/2/23 14:09, Denys Dmytriyenko wrote:
> On Fri, Apr 28, 2023 at 11:24:11AM -0500, Randolph Sapp wrote:
>> On 4/27/23 20:59, Denys Dmytriyenko wrote:
>>> On Thu, Apr 27, 2023 at 07:31:16PM -0500, Randolph Sapp wrote:
>>>> On 4/27/23 19:28, rs@ti.com wrote:
>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>
>>>>> All of the software-dl links 302 to https urls anyway. Just jump
>>>>> straight to the secure version.
>>>>>
>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>> ---
> 
> <snip>
> 
> 
>>>>> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>> index f0992aa7..77d23b6d 100644
>>>>> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>> +++ b/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
>>>>> @@ -11,7 +11,7 @@ require ../includes/ti-eula-unpack.inc
>>>>>   S = "${WORKDIR}/cgt470_${PV}"
>>>>> -SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>>>>> +SRC_URI = "https://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>>>>
>>>> Don't actually merge this. Wanted to take this opportunity to ask
>>>> what on earth theses SRC_URIs are. What do these mean, what's the
>>>> story?
>>>
>>> Heh, these were placeholders for "clickwrap" packages, which at some point
>>> long time ago TI Legal considered a "great" way to distribute software...
>>> Basically, there was no direct download URL - you must have downloaded them
>>> manually by filling out an online form and signing some sort of an agreement,
>>> which would trigger the download. Then you "install the source into the local
>>> downloads dir" (hence the name) by copying what you've downloaded manually
>>> into your ${DL_DIR} and Bitbake would be able to find it there regardless of
>>> the actual SRC_URI.
>>>
>>
>> Oh cool, I hate it. (Thanks for the explanation, I just really don't
>> like this idea.) Can we drop these (install methods or packages if
>> necessary) or will policy not allow it?
> 
> Nobody likes it on the engineering side! :) But it was forced back in the day
> by sales/marketing/legal and took a lot of effort to convince everyone that
> this clickwrap stuff doesn't bring much benefit, but causes damage...
> 
> Since then most if not all of TI packages dropped clickwrap and allowed direct
> download. Hence you don't see a lot of these weird URLs in recipes any more.
> 
> Not sure about CodeGen Tool for TMS470 MCU and if there were newer releases or
> if it's still active - nobody cared to update this recipe in over 10 years.
> Other CGT recipes for ARM, PRU, C6x, C7x etc. in that recipes-ti/devtools
> directory were kept mostly up to date, but not for TMS470. Not sure if there
> are any downstream users anymore, maybe time to remove it...
> 

I'll add a patch to drop codegen then. It'll be a little bit of a scream 
test but I'm sure it's fine. The C7 / C6 components I know still have a 
few dependents in meta-arago though, so I don't think those can be 
dropped. Will see if there is a non-clickwrapped source for those yet.

> 
>> Also, is this URI
>> functionality baked into the http fetcher or is this just leaning on
>> bitbake being unable to resolve the domain and then falling back on
>> the local copy?
> 
> This is basic Bitbake fetcher functionality and is well documented. High level
> order of operations to locate sources:
> 
> 1. Check if you already have them in your local DL_DIR
> 2. Go through the list of configured PREMIRRORS to locate the sources there
> 3. Actually hit the upstream SRC_URI and try to download the original src
> 4. If everything else fails, check through the list of "post" MIRRORS
> 
> So, requiring user to pre-download the sources manually and placing them in
> their local DL_DIR per the original documentation would shortcut the process
> at step 1.
> 
> Otherwise it would break at step 3 (and 4) and hopefully the weird URL would
> give user some clues or at least force to read the docs...
> 
> There's nothing special about the URL, besides the convention that .local is
> reserved - https://en.wikipedia.org/wiki/.local - and the entire name
> suggesting to install the sources in local dir :)
> 

Ah, alright. At least this isn't that bad then. I still don't like the 
idea of being able to reach steps 3&4 in this case as it will check http 
sources. Local is reserved but it's still not a great idea to allow this 
fetch to go through, even if *ideally* it should fail to resolve.

