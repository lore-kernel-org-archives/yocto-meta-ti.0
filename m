Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40351C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 23:17:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.1938.1658445459243137126
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 16:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e8RHR91M;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26LNHbYa050790;
	Thu, 21 Jul 2022 18:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658445457;
	bh=y+JB2FK3J/IJGqJH9XORDjzzN/YPabG9IVKzFbCGCW4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e8RHR91MdfhK8Sm2VcnhrWnCzT1YAfKkWV7jlMjZj28Ay8I8SfUVriLqhQyKAPKSV
	 MIG72uEt4Q+wc6YLZxyBCZ70dN2BAM/OTGpk2fArDA54NhXjwVIoNHXsvbaXvt780t
	 yj/sMGpsnhi6njaZXnvBkLyg+PdeENl+VBYAewWQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26LNHbNM012373
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Jul 2022 18:17:37 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 18:17:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 18:17:37 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26LNHbO0020502;
	Thu, 21 Jul 2022 18:17:37 -0500
Message-ID: <58927aef-fb03-22d2-c8e8-31ed317bbd77@ti.com>
Date: Thu, 21 Jul 2022 18:17:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH] kernel u-boot: Fix formulation of
 LOCALVERSION
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220720210131.23272-1-reatmon@ti.com>
 <20220720210746.erktcfv3gvc2ocfo@lunacy>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220720210746.erktcfv3gvc2ocfo@lunacy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Jul 2022 23:17:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14896


Turns out this fix may not work either.  My tests builds are failing 
related to this string.  Expect a v2 once I figure it out.


On 7/20/2022 16:07, Nishanth Menon wrote:
> On 16:01-20220720, Ryan Eatmon via lists.yoctoproject.org wrote:
>> devtool does not work with the current formulation of
>> the LOCALVERSION variables.  We need to use SRCPV to
>> avoid AUTOREV on bleeding builds, but there will be no
>> + in the string, so we cannot split on that.  Just
>> use SRCPV directly.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Tested-by: Nishanth Menon <nm@ti.com>
> 
> 
> We will need to apply this to master as well - looks like we carried the
> bug there as well.
> 
>> ---
>>   recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
>>   recipes-kernel/linux/setup-defconfig.inc | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
>> index e7c93335..c2da2281 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -1,6 +1,6 @@
>>   # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>>   # U-boot version string.  such as the commit id
>> -UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>> +UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
>>   
>>   UBOOT_SUFFIX ?= "img"
>>   SPL_BINARY ?= "MLO"
>> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
>> index 1e97acc0..08e9b638 100644
>> --- a/recipes-kernel/linux/setup-defconfig.inc
>> +++ b/recipes-kernel/linux/setup-defconfig.inc
>> @@ -1,6 +1,6 @@
>>   # KERNEL_LOCALVERSION can be set to add a tag to the end of the
>>   # kernel version string.  such as the commit id
>> -KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>> +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
>>   
>>   # Check the defconfig file and see if it points to an in kernel
>>   # defconfig that should be used, or if it is a complete config file
>> -- 
>> 2.17.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14891): https://lists.yoctoproject.org/g/meta-ti/message/14891
>> Mute This Topic: https://lists.yoctoproject.org/mt/92514313/5513541
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [nm@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

