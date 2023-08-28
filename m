Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DA4C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 20:45:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2645.1693255542083650630
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 13:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nQigv1Ma;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SKjc9p123404;
	Mon, 28 Aug 2023 15:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693255538;
	bh=7HPlWDw/vdps0zCfF5U9tjh9+0vWE2Z6LDclyW1Xgw4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nQigv1Ma7Jqg8aapQ0ffA4YF6EAEgx5X3Rb8NhD3JCnxh84AJlA5rEc86oT6nC/ye
	 jNUZgzr5qsQPnmvhw4mL+9r+wIqE8uGznbNdZx1aLaEs1l3LwWtsfz7YCpIfiTlVmQ
	 DTbbb7PZ5vuNLRj1oTsWI+vwz01ZDuHrABh9af2o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SKjcXt013050
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 15:45:38 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 15:45:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 15:45:38 -0500
Received: from [10.249.36.124] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SKjcvr090468;
	Mon, 28 Aug 2023 15:45:38 -0500
Message-ID: <5194f731-4fa3-5505-b331-74e9811e92b6@ti.com>
Date: Mon, 28 Aug 2023 15:45:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-umlibs: Add DEPENDS on
 BASE_DEFAULT_DEPS
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230828202211.22475-1-reatmon@ti.com>
 <20230828203915.GQ3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230828203915.GQ3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 20:45:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16897



On 8/28/2023 3:39 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 28, 2023 at 03:22:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent change to oe-core [1], has caused a pile of QA errors during
>> packaging for this binary package.  The effect of the change in oe-core
>> was to remove the dependency on the compiler and other compiler adjacent
>> libraries.  But the binary packages need some of the compiler tools as
>> part of the packaging flow (ie. objdump).
>>
>> Until the above gets reverted, this patch will fix the issue and can be
>> reverted itself once oe-core is fixed.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?h=master&id=d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727
> 
> Why not simply reset INHIBIT_DEFAULT_DEPS in the recipe?

Good question.  Let me try that.  It should work, but I want to be sure.



> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb          | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
>> index f748bd0f..73de93e5 100644
>> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
>> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
>> @@ -37,6 +37,8 @@ PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
>>   PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
>>   PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
>>   
>> +DEPENDS:prepend = "${BASE_DEFAULT_DEPS} "
>> +
>>   def get_file_list(package_list_var, d):
>>       file_list = []
>>       package_list = d.getVar(package_list_var)
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

