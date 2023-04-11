Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075F8C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:25:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20736.1681233926092803517
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 10:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zVXmHRZY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BHPMUC078694;
	Tue, 11 Apr 2023 12:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681233922;
	bh=+Fu7lTqGWzZYiz4L1qyLlt6gpVwgQBtuIoa2haRKzkQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=zVXmHRZYTxzkNkvKtAj2fBThJDjOBZI3CAqz8XtU6cBqmbGAKkVvwLQQbe3jrV40u
	 ECQkqS4Dl4P1MjEpDeH5dVKEPzIxlCyGRZyFQt1wLcDm8Oq21ADbRdwvygeb9Un4+O
	 wJOIZHtuh2dgaidnNfGj3o3xKB1fCkDjOw9X4Hag=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BHPM8O034277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 12:25:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 12:25:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 12:25:21 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BHPLB1064659;
	Tue, 11 Apr 2023 12:25:21 -0500
Message-ID: <cddd774a-1019-a1c1-7713-03954816bbec@ti.com>
Date: Tue, 11 Apr 2023 12:25:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] linux-ti-mainline: Update
 to v6.2 mainline version
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230405184714.26036-1-afd@ti.com>
 <20230405184714.26036-2-afd@ti.com> <20230405190029.GG9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230405190029.GG9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 17:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16344

On 4/5/23 2:00 PM, Denys Dmytriyenko wrote:
> On Wed, Apr 05, 2023 at 01:47:12PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index 3f4b560d..eb8009df 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -16,12 +16,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>>   
>>   S = "${WORKDIR}/git"
>>   
>> +# 6.2 Mainline version
>>   BRANCH = "master"
>> -TOOLS_BRANCH = "master"
> 
> But you haven't removed ti-upstream-tools from SRC_URI, which uses it...
> 

ACK, have a patch going in last that does, but didn't send it, will merge
that all together in the last patch for v2

Andrew

> 
>> -
>> -# 5.15 Mainline version
>> -SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
>> -PV = "5.15+git${SRCPV}"
>> +SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
>> +PV = "6.2+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>>   MACHINE_KERNEL_PR:append = "b"
>> -- 
>> 2.39.2

