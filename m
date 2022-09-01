Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDE4ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 16:20:18 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.14331.1662049210925925046
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=v8CY1E5i;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 281GK5e0038543;
	Thu, 1 Sep 2022 11:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662049205;
	bh=R17Y/Nci6QVktMlhVRRLwPFeOa2zjYb2uS9yL9eNKC0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=v8CY1E5ibDUyWpl8iTh4DcvYSKND1tw29ByocaI2qrMtojMtxMvmU6p55eiKpR0L7
	 n8zoA1QjwkhDIHU0DQONftyd71KDTB1pCdCvxMqA4ehPuoDApw0L2PWwuyfJREBVz3
	 lD1tCsmVHBjB8Z43bVdZLQQAdOu+92idLDQsOzys=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 281GK5cj084725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Sep 2022 11:20:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 1 Sep
 2022 11:20:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 1 Sep 2022 11:20:05 -0500
Received: from [10.250.34.212] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 281GK4D2014870;
	Thu, 1 Sep 2022 11:20:04 -0500
Message-ID: <bf8ba451-7715-7837-1bb8-7dfc659b0f26@ti.com>
Date: Thu, 1 Sep 2022 11:20:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH 1/3] meta-ti: Rename j7-evm to j721e-evm
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220831175315.15942-1-afd@ti.com>
 <20220831175315.15942-2-afd@ti.com>
 <f5281106-4ac9-a76b-1a3c-44d87e46733b@ti.com>
 <20220901161027.GK18429@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220901161027.GK18429@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 16:20:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14986

On 9/1/22 11:10 AM, Denys Dmytriyenko wrote:
> On Thu, Sep 01, 2022 at 10:31:42AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 8/31/2022 12:53, Andrew Davis wrote:
>>> In many places we use "j7" (the family name) when we should be using a
>>> specific SoC or EVM and vice-versa. For instance when including graphics
>>> drivers we add for all the "j7" family, but what we really want is only
>>> for some specific j7 SoCs.
>>>
>>> First step in untangling this is to make it clear that there is no SoC
>>> called "j7". There is a SoC called j721e with a j721e-evm.
>>>
>>> Fix up this naming here.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>   .../{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}  |  4 ++--
>>>   conf/machine/{j7-evm.conf => j721e-evm.conf}   |  4 ++--
>>>   ...sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} |  6 +++---
>>>   ...hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} |  4 ++--
>>>   .../{j7-hs-evm.conf => j721e-hs-evm.conf}      |  6 +++---
>>>   .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb     |  2 +-
>>>   .../ti-img-rogue-driver_1.15.6133109.bb        | 10 +++++-----
>>>   recipes-bsp/sciclient/sciclient-rtos_git.bb    |  6 +++---
>>>   .../viddec-test-app_1.0.0.bb                   |  2 +-
>>>   .../videnc-test-app_1.0.0.bb                   |  2 +-
>>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 +++++++++---------
>>>   .../trusted-firmware-a_%.bbappend              |  2 +-
>>>   .../ti-img-rogue-umlibs_1.15.6133109.bb        |  6 +++---
>>>   recipes-kernel/linux/kernel-rdepends.inc       |  4 ++--
>>>   recipes-security/optee/optee-os_%.bbappend     |  2 +-
>>>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     |  2 +-
>>>   16 files changed, 40 insertions(+), 40 deletions(-)
>>>   rename conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (81%)
>>>   rename conf/machine/{j7-evm.conf => j721e-evm.conf} (87%)
>>>   rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
>>>   rename conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (81%)
>>>   rename conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (85%)
>>>
>>> diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j721e-evm-k3r5.conf
>>> similarity index 81%
>>> rename from conf/machine/j7-evm-k3r5.conf
>>> rename to conf/machine/j721e-evm-k3r5.conf
>>
>>
>> So this changes the name of the yocto build machine label...  This
>> will be impactful to users used to building j7-evm and for our build
>> and testing scripts.  I will need to test this and work with Minas
>> to make changes on the testing side before I can merge it in.
> 
> Right. This was a good and timely change for kirkstone, but is it worth the
> effort for dunfell? Supposed to be a stable release branch and avoid breakages
> like this...
> 

I did consider that, but it seems we will be on dunfell for a little bit
longer than I expected. If we have plans to move to kirkstone in the
near future I'd have been okay with this fix only on kirkstone/master.

Holding off on valid fixes because we are waiting for a next version we
don't plan to switch to for a month+ is not a good strategy.

