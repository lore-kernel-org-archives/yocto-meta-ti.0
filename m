Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213AEC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:10:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.968.1665691834111674897
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Cl6persq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKAWHn061009;
	Thu, 13 Oct 2022 15:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665691832;
	bh=EuOYZqKA4Jc/AOxBp+f1MWKKbv05UuN0Fgb2Oen3zHY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cl6persqkfvlP/c8vbsu2CG+Ez55gas99VOQiAHxmnzmPrLpcjPXAGeyrHqSYMGiB
	 2NyB85ovUiJQNVMJ7L37on0M5DXvx0PvZDcn2NJm2puU7F+uG3pEZRfbN/+UByprEx
	 N/TKQaSepsT98kOJNljSgv5miomyVb4FLIC5YktQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKAWl0024194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:10:32 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:10:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:10:32 -0500
Received: from [10.250.33.14] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKAVq7017711;
	Thu, 13 Oct 2022 15:10:31 -0500
Message-ID: <334f2a4e-d192-0989-ecc5-ff4b09666c66@ti.com>
Date: Thu, 13 Oct 2022 15:10:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][master][PATCH v2] u-boot: Change depends from lzop to
 lzo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20221013182602.9318-1-reatmon@ti.com>
 <20221013192440.GJ22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221013192440.GJ22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15167

On 10/13/22 2:24 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 13, 2022 at 01:26:02PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> lzop has disappeared from upstream master, but lzo is there.
> 
> lzop is actually a compression tool, while lzo is just a library.
> so, I don't believe this change is correct/complete.
> 

Do we use this? Might be better to just drop the DEPENDS.

Andrew

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Fixed typo lzpo -> lzop
>>
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index d29c80cf..88018541 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>>   PV:append = "+git${SRCPV}"
>>   
>>   # u-boot needs devtree compiler to parse dts files
>> -DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
>> +DEPENDS += "dtc-native bc-native lzo-native flex-native bison-native python3-setuptools-native"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   
>> -- 
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15164): https://lists.yoctoproject.org/g/meta-ti/message/15164
>> Mute This Topic: https://lists.yoctoproject.org/mt/94310494/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

