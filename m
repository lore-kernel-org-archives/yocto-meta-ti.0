Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EDBC25B50
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 23:34:36 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2382.1674516867409413922
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 15:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SZd8yMvS;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NNYMAN034757;
	Mon, 23 Jan 2023 17:34:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674516862;
	bh=8+h5PocfswbiYegry0TL7IC2bEmGFD/7DFWQbr0BiY4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SZd8yMvSlsQa9HNMXQXiploPDiCy0u3gCtxYpEa8NKezoNDCCSv34nK47yEW9Qlmt
	 GSZFchma1msIac/TSZppgP73qi+ajhCnuZV9sGqDVNnyTQb1wy4GtHr5SiL+s/iY08
	 Q5Hvh4DBWJwGnA922Sw6zaVGxCijNLY8D8/PvlSI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NNYMiO075656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 17:34:22 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 17:34:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 17:34:21 -0600
Received: from [10.250.32.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NNYL4R026191;
	Mon, 23 Jan 2023 17:34:21 -0600
Message-ID: <5a842caf-c0c8-4d87-45a2-bca01aa8b0c0@ti.com>
Date: Mon, 23 Jan 2023 17:34:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH] am62xx: Add support for AM62xx HS-SE
 evm
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Sai
 Sree Kartheek Adivi <s-adivi@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Gyan
 Gupta <g-gupta@ti.com>
References: <20230123103242.563286-1-c-shilwant@ti.com>
 <20230123212620.GV22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230123212620.GV22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 23:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15637


I agree.


On 1/23/2023 15:26, Denys Dmytriyenko wrote:
> I think this should have been either a single patch or a patch series properly
> ordered with the other patch here:
> https://patchwork.yoctoproject.org/project/ti/patch/20230123102459.562886-1-c-shilwant@ti.com/
> 
> 
> On Mon, Jan 23, 2023 at 04:02:42PM +0530, Chirag Shilwant wrote:
>> - Add ti-sci-firmware overrides.
>> - Add support to sign ATF and OPTEE.
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 3 ++-
>>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
>>   recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 0fb3a832..7896c366 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -37,7 +37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
>>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>>   SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
>> -SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
>> +SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
>> +SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
>>   SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
>>   SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
>>   SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
>> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index a5eb9ff8..920cb737 100644
>> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
>>   	tfa_sign_k3hs
>>   }
>>   
>> +do_compile_append_am62xx-evm() {
>> +        tfa_sign_k3hs
>> +}
>> +
>>   do_compile_append_am62xx-lp-evm() {
>>           tfa_sign_k3hs
>>   }
>> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
>> index 83eb9c6a..91abbcee 100644
>> --- a/recipes-security/optee/optee-os_%.bbappend
>> +++ b/recipes-security/optee/optee-os_%.bbappend
>> @@ -72,6 +72,10 @@ do_compile_append_am64xx-evm() {
>>       optee_sign_k3hs
>>   }
>>   
>> +do_compile_append_am62xx-evm() {
>> +    optee_sign_k3hs
>> +}
>> +
>>   do_compile_append_am62xx-lp-evm() {
>>       optee_sign_k3hs
>>   }
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

