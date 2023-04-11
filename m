Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6D8C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:41:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21280.1681234883812329058
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 10:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lv8Opsck;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BHfKXZ104490;
	Tue, 11 Apr 2023 12:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681234880;
	bh=IYKNsfhqphQd44+TIqtsxsxGnIR9ztr/tRQkIVQk6KY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lv8Opsck6jrhisTKXEbrVH8ctq5Fi7nHLmAl5qWX/g17rLL1G28tIUen4XwNqTswY
	 5asBKyGQymEwQshZ6Qgl4md9QxAZd5eZtM89QWPOkQkrHFhmfcybNSA5Ryj09R3Ycs
	 9jt3jIvC8HcU71s9sGGkzZG08OR4nJYQTZn3xlHU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BHfKHK007124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 12:41:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 12:41:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 12:41:20 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BHfJjO084419;
	Tue, 11 Apr 2023 12:41:20 -0500
Message-ID: <b7ade909-523e-451e-4dea-cbe3bd792d09@ti.com>
Date: Tue, 11 Apr 2023 12:41:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 4/4] linux-ti-next: Remove
 unneeded do_compile append
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230405184714.26036-1-afd@ti.com>
 <20230405184714.26036-4-afd@ti.com> <20230405190721.GH9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230405190721.GH9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 17:41:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16351

On 4/5/23 2:07 PM, Denys Dmytriyenko wrote:
> On Wed, Apr 05, 2023 at 01:47:14PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Looks to be a leftover copy/paste error from when we did more in this
>> append for other kernel build types. Not needed here so remove.
> 
> It isn't a copy/paste error - it used to build kernel DTBs prior to
> KERNEL_DEVICETREE getting populated with the list of built .dtb/.dtbo
> files. Now KERNEL_DEVICETREE contains a preset of upstream DTBs and
> the code can be removed, true.
> 

Ah, good to know, will update commit message.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> index 62831c9c..1e86ed97 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
>> @@ -23,7 +23,3 @@ DEFCONFIG_NAME = "multi_v7_defconfig"
>>   DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>>   DEFCONFIG_NAME:k3 = "defconfig"
>>   KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>> -
>> -kernel_do_compile:append() {
>> -	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> -}
>> -- 
>> 2.39.2

