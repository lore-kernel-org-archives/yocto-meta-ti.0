Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3727CC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:11:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.101.1683043898273633824
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 09:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l+d/0IAs;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342GBYCG050291;
	Tue, 2 May 2023 11:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683043894;
	bh=zofWs5jiZReh47LccWeHZbNa1/0MvMxuy9s0L6QEJ1E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=l+d/0IAsMRdJTE746VPlz6BbMLJr4s/2gRhTygsMxHljCsHoZHE+c6xV/3htBPW5O
	 Bp5/Niumth5v2DNWjxM4atuJ1VhWqolq7LTQXQPIXzIveOYgtodHB7FSPRmS7nmfg/
	 IbY9g7onfWb/diaUSTS3ncAV7G5tombiKwh2W01s=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342GBYqN096688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 11:11:34 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 11:11:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 11:11:33 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342GBXmQ025353;
	Tue, 2 May 2023 11:11:33 -0500
Message-ID: <091df2bb-3261-c0d4-154c-21c3b8375102@ti.com>
Date: Tue, 2 May 2023 11:11:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti][kirkstone][PATCHv2 0/4]
 Enable vulkan proper
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230427210746.1915362-1-rs@ti.com>
 <20230427215039.GQ9226@denix.org>
 <f6e872f1-982f-6d3a-9554-1385b08b77e7@ti.com>
 <20230428014234.GR9226@denix.org>
 <5ea30022-f140-9203-c205-8d7562147d77@ti.com>
 <20230502034617.GY9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230502034617.GY9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 16:11:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16471

On 5/1/23 22:46, Denys Dmytriyenko wrote:
> On Fri, Apr 28, 2023 at 11:30:06AM -0500, Randolph Sapp wrote:
>> On 4/27/23 20:42, Denys Dmytriyenko wrote:
>>> On Thu, Apr 27, 2023 at 06:58:32PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
>>>> On 4/27/23 16:50, Denys Dmytriyenko wrote:
>>>>> On Thu, Apr 27, 2023 at 04:07:42PM -0500, rs@ti.com wrote:
>>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>>
>>>>>> Properly enable Vulkan with all WSI extensions enabled. Attempt some
>>>>>> light packaging changes to the graphics umlibs recipe so we can decrease
>>>>>> the number of check we have to skip, and the checks become a little more
>>>>>> targeted.
>>>>>>
>>>>>> This version uses a cairo append that conditionally tweaks PACKAGECONFIG
>>>>>> flags based on the GPU driver that is selected. We're using this driver
>>>>>> flag instead of a machine feature because the open source driver will
>>>>>> add a whole new set of preferred configs that will be optimized later.
>>>>>
>>>>> LGTM. Is it kirkstone-specific? Any plans for master?
>>>>
>>>> Actually, disregard that last response. It'll apply cleanly to
>>>> master if you also cherry-pick the following patches from kirkstone:
>>>> c994d48021664d328ced52829542a3b1b86c4e02
>>>> 2cc7895ebfea1df4afc2229f9762f129946b0b06
>>>> b86fb13fb9638635bf957156833bccc10ddf5393
>>>
>>> Can you please be more specific - none of these 3 commits exist in meta-ti nor
>>> meta-arago...
>>>
>>
>> Right, my bad. I meant this patch set:
>> https://lists.yoctoproject.org/g/meta-ti/message/16397
>>
>> Or these commits from kirkstone:
>> 16a8078a43eef297449a04d6861fd9811bfeb052
>> b9581a704648cb3ed70c6bcb28d5a1a89b08534d
>> c8ba8aaade90101f06164aec1b393d7c8b3aa201
> 
> Thanks. The original patches for these commits were marked specifically for
> kirkstone (same as this series) and I guess the assumption was that they won't
> apply to master and were skipped.
> 
> I just cherry-picked them for master and can confirm everything applies and
> builds cleanly - I just re-sent them to the list just in case. Once they are
> in, this Vulkan series can also be applied to master.
> 

Excellent, thanks Denys!

> 
>> I don't know where I got those previous hashes. Must have done
>> something goofy.
>>
>>
>>>
>>>> I must have incorrectly assumed those wouldn't apply to master when
>>>> I submitted them originally. My bad, they apply fine.
>>>>
>>>>>
>>>>>> Randolph Sapp (4):
>>>>>>    ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
>>>>>>    pvr-mesa: add new vulkan configuration options and wsi
>>>>>>    cairo: resolve opengl version
>>>>>>    ti-img-rogue-umlibs: package firmware separately
>>>>>>
>>>>>>   .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
>>>>>>   .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
>>>>>>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
>>>>>>   .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
>>>>>>   4 files changed, 37 insertions(+), 8 deletions(-)
>>>>>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend


