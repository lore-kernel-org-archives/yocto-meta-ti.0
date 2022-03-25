Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B17C43219
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:39:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.147.1648237141308295279
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 12:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U8CgyAds;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PJcu6J094286;
	Fri, 25 Mar 2022 14:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648237136;
	bh=EhHoJDTSgXaZmgBJBnV8+hijWdYt4mXCJoCxp44N/ss=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U8CgyAdslJRVFzWpa3EuWGcgCwc0Yoelp28bIuWXt808rJMSfsToaI2Has9GHv1Wa
	 xx54QjfW1Zcrri53OokhmqxDnnEu40Wpqa2pir3wCrUSM2xc5zt1OxLLEXKn3z2g7B
	 SO+F615b9/Bfp8AgQJ9Qo/cuDFP1o9XPxKEPpUBM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PJcufn029185
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 14:38:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 14:38:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 14:38:56 -0500
Received: from [10.250.33.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PJctCf129361;
	Fri, 25 Mar 2022 14:38:55 -0500
Message-ID: <7a5d0d19-6c27-cb67-dcad-acc7ff5c9aec@ti.com>
Date: Fri, 25 Mar 2022 14:38:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-ti][master][PATCH 1/4] meta-ti: rename j7-evm to j721e-evm
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325192319.GF23554@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220325192319.GF23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 19:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14553

On 3/25/22 2:23 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:41:48PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> In many places we use "j7" the family when we should be using a
>> specific SoC or EVM and vice-versa. For instance when including
>> graphics drivers we add for all "j7" family, but what we really
>> want is only for some specific j7 SoC.
>>
>> First step in untangling this is to make it clear that there is
>> no SoC called j7. There is a SoC called j721e with a j721e-evm.
>>
>> Fix up this naming here.
> 
> Heh, I was actually thinking of finally making such change myself lately! :)
> 
> My main concern was about breaking downstream users of meta-ti who builds on
> top of j7-evm platform. But it is probably a good time to get it into master
> now, as recent layer restructuring already required downstream changes and
> adjustments.
> 


There are also some external docs on this that need updated but I can 
take a lead on that.


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> I looked over the changes in both patchsets and they seem fine.
> I'm going to do a quick test locally though.
> 


Thanks, that would be good, I have to admit my setup is not all the way 
back together yet so my testing here was very limited..

Andrew


> 
>> ---
>>   .../machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}     | 4 ++--
>>   meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf}  | 4 ++--
>>   ...s-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} | 6 +++---
>>   .../{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf}       | 4 ++--
>>   .../conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf}    | 8 ++++----
>>   meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 6 +++---
>>   .../trusted-firmware-a/trusted-firmware-a_%.bbappend      | 2 +-
>>   meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend    | 2 +-
>>   meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 2 +-
>>   9 files changed, 19 insertions(+), 19 deletions(-)
>>   rename meta-ti-bsp/conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (63%)
>>   rename meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf} (82%)
>>   rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
>>   rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (67%)
>>   rename meta-ti-bsp/conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (79%)
> 

