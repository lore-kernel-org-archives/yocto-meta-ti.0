Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44394CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 19:06:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.239678.1697569574928595648
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 12:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MQDPifYL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39HJ6Ao3128083;
	Tue, 17 Oct 2023 14:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697569570;
	bh=fT6ULPO2fat4OmztUVDgaOlIacDxwbHDR421IS8r+VI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MQDPifYLTI8/cOQ3wpp3RJ+l0yGRZFFCSYkZQQ65840AJvaVFVpMCaJ2XEV2kbOm/
	 tSWPYcMQ1uzr5spNmc6EDhIVgltWIQLxhKgLBsRmC5uoCbZorlh8rvb4XFZVySI4oO
	 Ea7ACAcDKQVLOycoJuwTuMLOr0hCkSMIvyCVfJuw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39HJ6AYH052798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Oct 2023 14:06:10 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 14:06:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 14:06:09 -0500
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39HJ69V0025427;
	Tue, 17 Oct 2023 14:06:09 -0500
Message-ID: <80abf130-77e9-4546-ab85-b857720f3684@ti.com>
Date: Tue, 17 Oct 2023 14:06:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-extras: recipes-ti: Update
 jailhouse SRC_URI to point to ti-jailhouse repo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <g-gupta@ti.com>
References: <20231017114107.3791996-1-p-bhagat@ti.com>
 <3a112273-5625-4685-96ef-d9ce22e4d388@ti.com>
 <20231017180712.GM2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231017180712.GM2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 19:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17138



On 10/17/2023 1:07 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 17, 2023 at 08:46:15AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 10/17/2023 6:41 AM, Paresh Bhagat wrote:
>>> The ti-jailhouse repo is synced with the Siemens/jailhouse
>>> at https://github.com/siemens/jailhouse. Use this for
>>> development and build for TI devices.
>>
>> Is this TI repo a perfect clone of the Siemens' repo?  Or is a loose
>> copy with patches from TI on top of it?
> 
> I don't see SRCREV being changed, which means it's a perfect clone as of now.
> In this case it doesn't make sense to deviate from upstream (yet?).

Good point.  But the question is in the long run.  If we want this repo 
to deviate with some of our custom patches then the three patches we are 
carrying should move to that repo.  That's why I was asking.


> 
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>>   meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> index 1c63b400..a96a7831 100644
>>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>> @@ -19,7 +19,7 @@ SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
>>>   BRANCH = "master"
>>>   SRC_URI = " \
>>> -    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
>>> +    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
>>>       file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
>>>       file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
>>>       file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

