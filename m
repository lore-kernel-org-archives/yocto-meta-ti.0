Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBB7C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 13:30:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13062.1720531807077198586
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 06:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HEc9wsg6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469DU2t9101130;
	Tue, 9 Jul 2024 08:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720531802;
	bh=uUcNwWrL7X4jF15erbmbhnmuOvbV/zNu9DDinF4xxuc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HEc9wsg6DkFhgbMw8myXHrrj9u7kpV6A5aS2SkBP5nhdW9Rdbek7tkG11v2SSoHBk
	 kGSobYPCvcYfrSQMhZCLGZthjQpthHR2eeAvKVJHq/45mJmB+gH1oWKXmVeWdLIlxE
	 kW8Tqe8dei6fe4h/i02idgeWexGNDraio7QGAiE8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469DU1dp032304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 08:30:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 08:30:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 08:30:01 -0500
Received: from [10.250.34.81] ([10.250.34.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469DU1o6071842;
	Tue, 9 Jul 2024 08:30:01 -0500
Message-ID: <05036fb4-8973-4053-9493-e8bca1813c05@ti.com>
Date: Tue, 9 Jul 2024 08:30:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>,
        <srk@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
 <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
 <ae96a610-10c5-47fc-b001-1923878c46ac@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ae96a610-10c5-47fc-b001-1923878c46ac@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 13:30:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17846



On 7/9/2024 2:58 AM, Siddharth Vadapalli wrote:
> On Mon, Jul 08, 2024 at 09:04:43AM -0500, Ryan Eatmon wrote:
> 
> [...]
> 
>>> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>>> index 36915381..9b68e626 100644
>>> --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>>> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>>>    SYSFW_SUFFIX = "hs-fs"
>>>    UBOOT_MACHINE = "am62px_evm_r5_defconfig"
>>> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
>> For this one, there are already UBOOT_CONFIG_FRAGMENTS later in the file
>> that you are not taking into account by just setting the variable.  This
>> file is going to be a little more difficult to do correctly.
>>
>> Since we already have a setting with an override, I think the best plan
>> would be to rework the existing logic while adding your changes.  Add some
>> intermediate variables to construct the final value.  Something like this:
>>
>> BASE_FRAGMENTS = "am62x_r5_usbdfu.config"
>> BASE_FRAGMENTS:ti-bsp-6_1 = ""
>>
>> # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has
>> to be build
>> # along with the base defconfig mentioned in UBOOT_MACHINE. Refer
>> u-boot-mergeconfig.inc
>> # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
>> # Hence, disable the A53 based splash screen using the
>> am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
>> PRUNE_SPLASHSCREEN_FRAGMENT =
>> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',
>> 'am62x_evm_prune_splashscreen.config', '', d)}"
>> PRUNE_SPLASHSCREEN_FRAGMENT :bsp-ti-6_1 =
>> "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1',
>> 'am62px_evm_prune_splashscreen.config', '', d)}"
>>
>> UBOOT_CONFIG_FRAGMENTS = " $(BASE_FRAGMENTS) $(PRUNE_SPLASHSCREEN_FRAGMENT)"
> 
> I failed to notice it in my earlier response. The above file that you
> are referring to is different from the one that this patch modifies.
> This patch is updating:
> meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> while the file that you are referring to above is:
> meta-ti-bsp/conf/machine/am62pxx-evm.conf
> 
> So
> UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
> UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""
> is applicable to this as well, similar to other files.
> I will implement the above change uniformly across all files in the v4
> patch.

Good point.  I looked in the wrong file when I was looking in the files.


> [...]
> 
> Regards,
> Siddharth.

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

