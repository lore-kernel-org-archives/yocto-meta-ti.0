Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0268C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:42:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.80516.1669999339962351109
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 08:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=X9lPF3fr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B2GgGiV130197;
	Fri, 2 Dec 2022 10:42:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669999336;
	bh=fjDNlluig9XMJ4hO+Bc9DG8QV+ACFPPL4hOEv+faOWE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=X9lPF3frl5OCFURSBkk3GpNfoNWNUcq5lXn4WePO4aOjuSVQ1xIp77ukA83VZZAjt
	 dZ7uvW3hMKv7Ls6oSFTolt+e7qf4CQfKOT260at6wmeRl0XqPHxeg/2lFXgEPwBcWM
	 XZOAbhvQAMlp0uTzEDTNRy/jrOXJxmMYZr/m1VTM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B2GgGAn011336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Dec 2022 10:42:16 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 10:42:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 10:42:15 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B2GgF7W079888;
	Fri, 2 Dec 2022 10:42:15 -0600
Message-ID: <5485ce2c-9beb-ef09-7001-3c309fd1dfef@ti.com>
Date: Fri, 2 Dec 2022 10:42:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti][master][PATCH] u-boot: Add lzop dependency
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221202145817.28581-1-reatmon@ti.com>
 <20221202161051.GU22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221202161051.GU22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 16:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15389



On 12/2/2022 10:10, Denys Dmytriyenko wrote:
> On Fri, Dec 02, 2022 at 08:58:17AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> It turns out we do need lzop for building dra7 and am57 in u-boot,
>> so add the dependency back in and add a layer dependency on
>> meta-oe(openembedded-layer).
> 
> Oh, no, please don't do that! This is a heavy dependency and meta-ti BSP has
> stayed away from it since the beginning of times.
> 
> It would be better to figure out why lzop is used for those platforms and
> change that, as LZOP is pretty much deprecated these days...

Ok.  I'll back this one out.  And look for an alternative solution.

> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/layer.conf                  | 1 +
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index 39e7f9eb..8bafa854 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -15,6 +15,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>>   
>>   LAYERDEPENDS_meta-ti-bsp = " \
>>       core \
>> +    openembedded-layer \
>>       meta-arm \
>>   "
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index d87dcbe1..5127e137 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>>   PV:append = "+git${SRCPV}"
>>   
>>   # u-boot needs devtree compiler to parse dts files
>> -DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
>> +DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

