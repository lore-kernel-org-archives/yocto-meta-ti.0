Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71C7C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 20:40:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.12727.1658522405472450654
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 13:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F7z0B99v;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26MKe1V2068979;
	Fri, 22 Jul 2022 15:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658522401;
	bh=6s/cVHLT4ArVJ8t2SlnOYS3bbDlsmgMeo6mJC7DMMgU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F7z0B99vPbpfS3JpHpe2X2gW1IOFV3RWvE+UdgO1y5OgEPclWfRKG0VMNxpZp2x3V
	 urkPF2HHBgl2sEEun7UGLxK5ywbe9p+68E6cEdh7phEPMTT0xRPhuW0tzwBGcvDz1m
	 CPd+9UKkk2dT/rQd3X9KkLqhIIC2z6SoQHWDflKQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26MKe12c052611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Jul 2022 15:40:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Jul 2022 15:40:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Jul 2022 15:40:01 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26MKe1fh006277;
	Fri, 22 Jul 2022 15:40:01 -0500
Message-ID: <fed8c19f-2b86-7c0d-7a6f-e2c054133677@ti.com>
Date: Fri, 22 Jul 2022 15:40:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH v2] kernel u-boot: Fix formulation of
 LOCALVERSION
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220722020328.7150-1-reatmon@ti.com>
 <20220722185330.GQ18692@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220722185330.GQ18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Jul 2022 20:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14901



On 7/22/2022 13:53, Denys Dmytriyenko wrote:
> On Thu, Jul 21, 2022 at 09:03:28PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> devtool does not work with the current formulation of
>> the LOCALVERSION variables.  We need to use SRCPV to
>> avoid AUTOREV on bleeding builds, but there will be no
>> + in the string, so we cannot split on that.  Just
>> use SRCPV directly.
> 
> I guess the description is a bit off?

The description should still be valid because the code that is being 
replaced is doing a blind split and expecting that to work.  The new 
code works if the + is there or not.  I could rework the description if 
needed...


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: More testing showed the first pass caused some problems.
>>
>>   recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
>>   recipes-kernel/linux/setup-defconfig.inc | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
>> index e7c93335..1f8fb6de 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -1,6 +1,6 @@
>>   # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>>   # U-boot version string.  such as the commit id
>> -UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>> +UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
>>   
>>   UBOOT_SUFFIX ?= "img"
>>   SPL_BINARY ?= "MLO"
>> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
>> index 1e97acc0..df7d9ac8 100644
>> --- a/recipes-kernel/linux/setup-defconfig.inc
>> +++ b/recipes-kernel/linux/setup-defconfig.inc
>> @@ -1,6 +1,6 @@
>>   # KERNEL_LOCALVERSION can be set to add a tag to the end of the
>>   # kernel version string.  such as the commit id
>> -KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>> +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
>>   
>>   # Check the defconfig file and see if it points to an in kernel
>>   # defconfig that should be used, or if it is a complete config file
>> -- 
>> 2.17.1
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

