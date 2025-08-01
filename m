Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDF7C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:47:25 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.89808.1754059644221867318
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 07:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ncijQKyR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571ElL3h3705081;
	Fri, 1 Aug 2025 09:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754059641;
	bh=F/7rVUdegcSJmYYMYyGoxoOiKRzMm5tasZLyXaaS9CM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ncijQKyRDVUgBzpFPKnkWGZAUoCS5t8PafI+wKCvk4MlojBQ6ccStqWT5EsGXLHj7
	 srUc3xCrhsQP7tblqGd/xRJLy6CplKi6kg7yDIYfYmpCLNyvNwn7vdMRL3SZKXtG76
	 1JRKmiZkU7Gv3alIG2Ec6wbjdr74m6LlGWmxaO8Q=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571ElLSo614249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 09:47:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 09:47:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 09:47:21 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571ElKlU238982;
	Fri, 1 Aug 2025 09:47:20 -0500
Message-ID: <748a17e6-7f5a-4a02-a4c9-39c20b3339e1@ti.com>
Date: Fri, 1 Aug 2025 09:47:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] linux-ti-*: Move KERNEL_BASE_CLASS
 default
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250801133958.22623-1-reatmon@ti.com>
 <20250801143927.GT24899@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250801143927.GT24899@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 14:47:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18877



On 8/1/2025 9:39 AM, Denys Dmytriyenko wrote:
> On Fri, Aug 01, 2025 at 08:39:58AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> If you are trying to build a TI kernel and not building a TI machine
> 
> Based on the original report, it breaks during parsing of meta-ti for any
> non-TI machine, not even trying to build a kernel...

Good point.


> 
>> then KERNEL_BASE_CLASS is not defined and you get a parse error.  Move
>> the default setting out of ti-soc.inc and into ti-kernel.inc.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/ti-soc.inc               | 3 ---
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 4 ++--
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 3 ++-
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 3 ++-
>>   meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc            | 2 ++
>>   5 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> index 3f11e31d..018e9bfb 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
>> @@ -12,9 +12,6 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
>>   # TI platforms all use devicetrees with overlays
>>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree"
>>   
>> -# All machines should start off pointing at the default base kernel class
>> -KERNEL_BASE_CLASS = "kernel"
>> -
>>   # Tell the kernel class to install the DTBs in the same directory structure as
>>   # the kernel
>>   KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index 51723fc0..92fb1e6c 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -3,10 +3,10 @@ SUMMARY = "Mainline Linux kernel for TI devices"
>>   LICENSE = "GPL-2.0-only"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   
>> -inherit ${KERNEL_BASE_CLASS}
>> -
>>   require recipes-kernel/linux/ti-kernel.inc
>>   
>> +inherit ${KERNEL_BASE_CLASS}
>> +
>>   DEPENDS += "gmp-native libmpc-native"
>>   
>>   KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> index 51e4b604..d36485fb 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> @@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
>>   LICENSE = "GPL-2.0-only"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   
>> +require recipes-kernel/linux/ti-kernel.inc
>> +
>>   inherit ${KERNEL_BASE_CLASS}
>>   
>>   require recipes-kernel/linux/setup-defconfig.inc
>> -require recipes-kernel/linux/ti-kernel.inc
>>   include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>>   
>>   DEPENDS += "gmp-native libmpc-native"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
>> index 321cdcbb..b6d882d8 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
>> @@ -3,10 +3,11 @@ SUMMARY = "Linux kernel for TI devices"
>>   LICENSE = "GPL-2.0-only"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   
>> +require recipes-kernel/linux/ti-kernel.inc
>> +
>>   inherit ${KERNEL_BASE_CLASS}
>>   
>>   require recipes-kernel/linux/setup-defconfig.inc
>> -require recipes-kernel/linux/ti-kernel.inc
>>   include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>>   
>>   DEPENDS += "gmp-native libmpc-native"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> index ef4ba4a1..32b6c95d 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> @@ -4,6 +4,8 @@ KERNEL_GIT_BRANCH ?= "branch=${BRANCH}"
>>   
>>   KERNEL_DEFCONFIG ?= "file://defconfig"
>>   
>> +KERNEL_BASE_CLASS ?= "kernel"
>> +
>>   KERNEL_REPRODUCIBILITY_PATCHES ?= ""
>>   
>>   SRC_URI = " \
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

