Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD6CEFC51
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:56:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5265.1728417393401881204
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 12:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tbmuAvno;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498JuTdO018828;
	Tue, 8 Oct 2024 14:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728417389;
	bh=EIwanlIw6UZ0FhzMY0Fy24Vc7lqf6qNKKOng+YLb3ow=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tbmuAvnoOBGJh0qWUVrF5J3dodp0ctHU7HUuI17aYxZ3BCKHdghkgY+U5m5jeiGiz
	 87WLQ23t/I04l2320FF8qZu54r3wYziAHxeO0lqu+omk0iikHWlmwus88/arBVDg2A
	 u+W3k8F4yh+z4XUnHpfs2LOrbbvT/yMW/RvmOTIo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498JuTXi030001;
	Tue, 8 Oct 2024 14:56:29 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 14:56:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 14:56:29 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498JuTN7011115;
	Tue, 8 Oct 2024 14:56:29 -0500
Message-ID: <2cbffc7a-25a4-4849-b111-1845ceb98a29@ti.com>
Date: Tue, 8 Oct 2024 14:56:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] optee: Update to v4.3.0
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241004190825.24897-1-reatmon@ti.com>
 <20241008190602.GI14676@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241008190602.GI14676@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 19:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17988



On 10/8/2024 2:06 PM, Denys Dmytriyenko wrote:
> I was wondering if OPTEE and TFA should also be made BSP-aware. Maybe even
> SYSFW and/or other FWs.
> 
> How much backward compatibility is ensured and tested here? Will 4.3.0 version
> here work with BSP 6.1?
> 

That's a good question...  And beyond my knowledge base.



> On Fri, Oct 04, 2024 at 02:08:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Update all of the components to the upstream 4.3.0 version.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
>>   .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
>>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>>   4 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> index 22a363f4..5f06fa03 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.2.0+git"
>> -SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
>> +PV = "4.3.0+git"
>> +SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> index 2d7a95bd..4d9897a7 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.2.0+git"
>> +PV = "4.3.0+git"
>>   SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> index 790f5f5f..a79e5702 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.2.0+git"
>> -SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
>> +PV = "4.3.0+git"
>> +SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> index fdfa420c..0b902d69 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.2.0+git"
>> -SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
>> +PV = "4.3.0+git"
>> +SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

