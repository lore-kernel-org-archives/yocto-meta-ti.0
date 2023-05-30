Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C77C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 19:19:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3213.1685474342138770281
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 12:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d1n85dDk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UJIwj4090924;
	Tue, 30 May 2023 14:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685474338;
	bh=D1YMUiOK3kuMd6jh8gY49Fxh+85/AoHW950XnkPVMGs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d1n85dDkRo597H792j7dQ7d6inQJjFy/YBAn4ZdRWq8oOaBY7RqjLWsOMDitR+U6L
	 FrOCByh3ZHnS1bQUhLfbn36FA2FIuABtj44Q6fz+kMJi9bAkoyzvlsfzB3pA+6zZvP
	 ehXC4TxNk3MjDwihJ+ZCQsNn47eis2bXHSMKbHsw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UJIwaF021711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 14:18:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 14:18:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 14:18:57 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UJIvsc106724;
	Tue, 30 May 2023 14:18:58 -0500
Message-ID: <b6c4a274-cd7c-896f-6792-f4fd6c710ac2@ti.com>
Date: Tue, 30 May 2023 14:18:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/2] u-boot-ti: do_compile
 depends on the value of UBOOT_LOCALVERSION
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <17635F3EC543510A.6918@lists.yoctoproject.org>
 <20230530191708.GI9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230530191708.GI9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 19:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16636


Roger that.


On 5/30/2023 2:17 PM, Denys Dmytriyenko wrote:
> Scratch these - Richard suggested a different fix.
> 
> 
> On Sun, May 28, 2023 at 05:36:41PM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Explicitly mark do_compile as depending on the value of UBOOT_LOCALVERSION
>> variable. Similar patch was submitted to OE-Core for upstream version of
>> u-boot recipe:
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20230528171515.832179-1-denis@denix.org/
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 135f443b..4e645e4f 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -1,6 +1,7 @@
>>   # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>>   # U-boot version string.  such as the commit id
>>   UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
>> +do_compile[vardepvalue] = "${UBOOT_LOCALVERSION}"
>>   
>>   UBOOT_SUFFIX ?= "img"
>>   SPL_BINARY ?= "MLO"
>> -- 
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16635): https://lists.yoctoproject.org/g/meta-ti/message/16635
>> Mute This Topic: https://lists.yoctoproject.org/mt/99185909/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

