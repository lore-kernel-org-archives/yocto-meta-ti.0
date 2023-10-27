Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EBBC25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:56:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6074.1698411404940555636
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 05:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c05E/Ajd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RCuhtl093229;
	Fri, 27 Oct 2023 07:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698411403;
	bh=+vACa5uH3vW23yDD9qIcUH3WVtKS4D2xGs6FRbk04jw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c05E/AjdzwrCYujQU2MYq8X2ZFTmv2hXlxej/hG4bVak9vKWKy8Yl6T6LDGHEPw9A
	 fYsdy8fEIiA5zUfif6WFZKBYqwzObYbLFHQxf6JeI8C4LP219kyDWME3jCa9coWMgw
	 w7V8IArrzXgledmiwLi6mf8aMhPV7GxUtCC/93cc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RCuhTW035413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 07:56:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 07:56:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 07:56:43 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RCuhqA063342;
	Fri, 27 Oct 2023 07:56:43 -0500
Message-ID: <8c23e232-c9c6-40a2-bd5a-afe1af85c9f7@ti.com>
Date: Fri, 27 Oct 2023 07:56:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH] optee: Update to upstream 4.0.0
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231026132915.1441-1-reatmon@ti.com>
 <20231027053102.7mfjuvkavx72c4zv@ula0497581>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231027053102.7mfjuvkavx72c4zv@ula0497581>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 12:56:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17208



On 10/27/2023 12:31 AM, Manorit Chawdhry wrote:
> Hi Ryan,
> 
> On 08:29-20231026, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Update all of the optee components to the upstream 4.0.0 version.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/recipes-security/optee/optee-client-ti.inc    | 4 ++--
>>   meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc  | 4 ++--
>>   .../recipes-security/optee/optee-os-tadevkit-ti.inc       | 5 +++--
>>   meta-ti-bsp/recipes-security/optee/optee-os-ti.inc        | 4 ++--
>>   meta-ti-bsp/recipes-security/optee/optee-test-ti.inc      | 8 ++++++--
>>   5 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>> index fef87d30..f64a90c3 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti.inc
>> @@ -1,5 +1,5 @@
>> -PV = "3.20.0+git${SRCPV}"
>> -SRCREV = "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
>> +PV = "4.0.0+git${SRCPV}"
>> +SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
>>   
>>   inherit pkgconfig
>>   DEPENDS += "util-linux"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>> index 7d119f0d..7a733f53 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti.inc
>> @@ -1,3 +1,3 @@
>> -PV = "3.20.0+git${SRCPV}"
>> -SRCREV = "a98d01e1b9168eaed96bcd0bac0df67c44a81081"
>> +PV = "4.0.0+git${SRCPV}"
>> +SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
>>   SRC_URI:remove = "file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> index 18820af1..c1354539 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit-ti.inc
>> @@ -1,2 +1,3 @@
>> -PV = "3.20.0+git${SRCPV}"
>> -SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
>> +PV = "4.0.0+git${SRCPV}"
>> +SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
> 
> If possible, can we pick the same SHA of optee-os itself for this
> through some include file? I don't think it makes sense to update the
> same SHA at two places for this tadevkit that I see always being in sync
> with optee-os only. Ig this had been the missing piece in my testing
> that I had missed updating that led to crashed for me. Upto you but just
> a suggestion.

I noticed that too.  Let me look into that.  I may go ahead and do the 
4.0.0 update and clean that up in a later patch.


> Regards,
> Manorit
>> +
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> index 19386295..763dd1d5 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti.inc
>> @@ -1,5 +1,5 @@
>> -PV = "3.20.0+git${SRCPV}"
>> -SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
>> +PV = "4.0.0+git${SRCPV}"
>> +SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
>>   
>>   # Use TI SECDEV for signing
>>   inherit ti-secdev
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>> index 43e0172d..b68caf0c 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti.inc
>> @@ -1,2 +1,6 @@
>> -PV = "3.19.0+git${SRCPV}"
>> -SRCREV = "ab9863cc187724e54c032b738c28bd6e9460a4db"
>> +PV = "4.0.0+git${SRCPV}"
>> +SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
>> +
>> +EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
>> +DEPENDS:append = " openssl"
>> +
>> -- 
>> 2.17.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17195): https://lists.yoctoproject.org/g/meta-ti/message/17195
>> Mute This Topic: https://lists.yoctoproject.org/mt/102199608/6945827
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11362175/6945827/309017070/xyzzy [m-chawdhry@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

