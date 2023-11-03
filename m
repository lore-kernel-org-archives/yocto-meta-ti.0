Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B1CC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 16:25:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.57546.1699028701939123594
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 09:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A6ekeb3K;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GOwJe083559;
	Fri, 3 Nov 2023 11:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699028698;
	bh=ge9f1AdEwSWSomS29KgQM2OUewYMsENBfhktWToUPOk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A6ekeb3KN351WfTUhKWoyzPo21B+tNe8QIwYaXEfoiDUD6ouWxszcK6tEVoGLa3MV
	 PQn0tJKMZqnNMkvEQjsFhCr/LcDj7vnUZchmOAQu46hUaemYFw7YmoIkh84scxurA/
	 VG11YGow1B/lNaYlNs3rKN7+DPdwIIiB02AXt5sw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3GOw6h025962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 11:24:58 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 11:24:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 11:24:58 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GNl7h091875;
	Fri, 3 Nov 2023 11:24:58 -0500
Message-ID: <39ad6fa8-13c5-4344-9143-9a88f687e25e@ti.com>
Date: Fri, 3 Nov 2023 11:24:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][RFC] optee: Rework include files
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231102182046.25324-1-reatmon@ti.com>
 <20231103061917.GM2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231103061917.GM2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 16:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17236


I can make that change.  I'll send out another RFC with that change later.

On 11/3/2023 1:19 AM, Denys Dmytriyenko wrote:
> I like the -overrides naming. Not so sure about -srcrev one. Maybe -ver or
> -version?
> 
> 
> On Thu, Nov 02, 2023 at 01:20:46PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Minor rework of the TI include files used to override both SRCREV and
>> other settings in the optee recipes for TI SOC parts.  The intent is to
>> make it more clear when we are changing SRCREVs versus changing other
>> items, and allow for sharing the SRCREV changes for optee-os-tadevkit
>> which should track the optee-os SRCREV.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...optee-client-ti.inc => optee-client-ti-srcrev.inc} |  0
>>   .../recipes-security/optee/optee-client_%.bbappend    |  6 +++---
>>   ...e-examples-ti.inc => optee-examples-ti-srcrev.inc} |  0
>>   .../recipes-security/optee/optee-examples_%.bbappend  |  6 +++---
>>   .../optee/optee-os-tadevkit-ti-overrides.inc          |  1 +
>>   .../optee/optee-os-tadevkit_%.bbappend                | 11 ++++++++---
>>   .../{optee-os-ti.inc => optee-os-ti-overrides.inc}    |  8 --------
>>   ...ptee-os-tadevkit-ti.inc => optee-os-ti-srcrev.inc} |  2 --
>>   .../recipes-security/optee/optee-os_%.bbappend        | 11 ++++++++---
>>   .../{optee-test-ti.inc => optee-test-ti-srcrev.inc}   |  0
>>   .../recipes-security/optee/optee-test_%.bbappend      |  6 +++---
>>   11 files changed, 26 insertions(+), 25 deletions(-)
>>   rename meta-ti-bsp/recipes-security/optee/{optee-client-ti.inc => optee-client-ti-srcrev.inc} (100%)
>>   rename meta-ti-bsp/recipes-security/optee/{optee-examples-ti.inc => optee-examples-ti-srcrev.inc} (100%)
>>   create mode 100644 meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>>   rename meta-ti-bsp/recipes-security/optee/{optee-os-ti.inc => optee-os-ti-overrides.inc} (86%)
>>   rename meta-ti-bsp/recipes-security/optee/{optee-os-tadevkit-ti.inc => optee-os-ti-srcrev.inc} (87%)
>>   rename meta-ti-bsp/recipes-security/optee/{optee-test-ti.inc => optee-test-ti-srcrev.inc} (100%)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-srcrev.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-client-ti-srcrev.inc
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> index 08c5256b..71b85720 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI = ""
>> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
>> +OPTEE_TI_SRCREV = ""
>> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>>   
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_SRCREV}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-srcrev.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-examples-ti-srcrev.inc
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> index 08c5256b..71b85720 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI = ""
>> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
>> +OPTEE_TI_SRCREV = ""
>> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>>   
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_SRCREV}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>> new file mode 100644
>> index 00000000..df46e243
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti-overrides.inc
>> @@ -0,0 +1 @@
>> +EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> index 08c5256b..9f265932 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
>> @@ -1,4 +1,9 @@
>> -OPTEE_TI = ""
>> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
>> +OPTEE_TI_SRCREV = ""
>> +OPTEE_TI_SRCREV:ti-soc = "optee-os-ti-srcrev.inc"
>>   
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_SRCREV}
>> +
>> +OPTEE_TI_OVERRIDES = ""
>> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>> +
>> +require ${OPTEE_TI_OVERRIDES}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> similarity index 86%
>> rename from meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> index 6d192bbe..de13d282 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>> @@ -1,11 +1,3 @@
>> -PV = "4.0.0+git${SRCPV}"
>> -SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>> -
>> -# Fixes for pointing to 4.0.0 before upstream meta-arm
>> -FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
>> -SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
>> -SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
>> -
>>   # Use TI SECDEV for signing
>>   inherit ti-secdev
>>   
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
>> similarity index 87%
>> rename from meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
>> index 55453366..06472e34 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-srcrev.inc
>> @@ -5,5 +5,3 @@ SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
>>   SRC_URI:remove = "file://0002-core-Define-section-attributes-for-clang.patch"
>>   SRC_URI:append = " file://0002ti-core-Define-section-attributes-for-clang.patch"
>> -
>> -EXTRA_OEMAKE:remove = "CFG_MAP_EXT_DT_SECURE=y"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> index 08c5256b..eb29392b 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
>> @@ -1,4 +1,9 @@
>> -OPTEE_TI = ""
>> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
>> +OPTEE_TI_SRCREV = ""
>> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>>   
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_SRCREV}
>> +
>> +OPTEE_TI_OVERRIDES = ""
>> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>> +
>> +require ${OPTEE_TI_OVERRIDES}
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-srcrev.inc
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>> rename to meta-ti-bsp/recipes-security/optee/optee-test-ti-srcrev.inc
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> index 08c5256b..71b85720 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test_%.bbappend
>> @@ -1,4 +1,4 @@
>> -OPTEE_TI = ""
>> -OPTEE_TI:ti-soc = "${BPN}-ti.inc"
>> +OPTEE_TI_SRCREV = ""
>> +OPTEE_TI_SRCREV:ti-soc = "${BPN}-ti-srcrev.inc"
>>   
>> -require ${OPTEE_TI}
>> +require ${OPTEE_TI_SRCREV}
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

