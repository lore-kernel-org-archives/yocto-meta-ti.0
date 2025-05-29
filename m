Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242C4C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:23:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2733.1748550211152430442
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 13:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vR1yqpPp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: praneeth@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TKNR8G2473824;
	Thu, 29 May 2025 15:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748550207;
	bh=OhIGqaAllHf6lNL6u33aypvKnb/mvXIrQOGyZK5x/yE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vR1yqpPpGljBw4PFvJ2+QPFPZknYdSoL/pyrFVkGHUMq9ARD2x6sGJ0Kxx4sTCP8S
	 pP/iM1C52sIklGlYWHClSVMc+rpfz+U7Nzt0WC9KAY3Qn85eqjux+mUChjLkN1ovoe
	 Ie5CmQaM+tfxifrVaaly2W7jjlFHmWdw8MG+BVpc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TKNRUO280744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 15:23:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 15:23:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 15:23:27 -0500
Received: from [10.247.21.125] (ltpw0eb5ja.dhcp.ti.com [10.247.21.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TKNRvv2091600;
	Thu, 29 May 2025 15:23:27 -0500
Message-ID: <cbe4f229-549a-4749-9192-c318c9fd6308@ti.com>
Date: Thu, 29 May 2025 15:23:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger:
 cicd.scarthgap.202505230901
To: Denys Dmytriyenko <denis@denix.org>, "Brnich, Brandon" <b-brnich@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250523190054.691771-1-lcpdbld@list.ti.com>
 <20250529194538.GV18383@denix.org>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20250529194538.GV18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 20:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18612



On 5/29/2025 2:45 PM, Denys Dmytriyenko wrote:
> Apparently, this went unnoticed, as nobody usually reviews CI/CD updates...
> 
> 
> On Fri, May 23, 2025 at 02:00:54PM -0500, LCPD Automation Script via lists.yoctoproject.org wrote:
>> Updated the value(s) for:
>>    cnm-wave-fw: LIC_FILES_CHKSUM
>>    ti-linux-fw: CNM_WAVE521_FW_VERSION,TI_LINUX_FW_SRCREV
>>    u-boot-ti-staging_2025.01: SRCREV
>>    k3conf: SRCREV
>>    linux-ti-staging_6.12: PV,SRCREV
>>
>> Changelogs:
>>    ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=bffa52a1b8d3318ec86814047025e7c5edf7b7b0..d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7
>>    u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=98b6b3f5a259be864e8db92f4925c3c19c3482a4..3d024809613c2a8f1d69258554ab8954d26537f5
>>    k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=e4a814ff42ef357ee453b6f2f809ecdfa624aa8c..ea9938bf9cafd9c0cb05ef060a713ab4ac72270f
>>    linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=013211ccdf5ec33e19652be631b820bc5f6b86a4..d95b7f80f66d104525e6beb002d82a9505b28131
>>
>> Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb      | 2 +-
>>   meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 4 ++--
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
>>   meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb           | 2 +-
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 4 ++--
>>   5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> index 43624183..6a65992f 100644
>> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
>> @@ -5,7 +5,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>   inherit update-alternatives
>>   
>>   LICENSE = "BSD-3-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
>> +LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36"
> 
> What are the actual changes in the license that caused the checksum update?
> 
> Did the license change from BSD-3-Clause to something else? Was the package
> re-licensed under something else, say more restrictive, or even commercial?

There was a update in License file adding more restrictive language 
primarily on wave633c codec fw ( not present on TI parts)

Ref: 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENCE.cnm?id=c97a2ef501be047a901764735147a278999c8ff0 



> 
> Sure, I'm imagining a worst-case scenario, but the whole purpose of this
> LIC_FILES_CHKSUM variable is to catch such cases. So, whenever it changes,
> there should be an explanation in the commit message detailing the reason
> for the license checksum change.
> 
> Moreover, in master there's now a mandatory tag required to explain such a
> change:
> https://docs.yoctoproject.org/next/contributor-guide/recipe-style-guide.html#license-updates
> 
> In OE-Core this gets checked by test_lic_files_chksum_modified_not_mentioned
> Patchtest case and the patch gets automatically rejected w/o this tag:
> https://wiki.yoctoproject.org/wiki/Patchtest
> 
> I would argue that CI/CD should not even try to modify LIC_FILES_CHKSUM
> variable in automated fashion - this was designed to be consciously updated
> by a human...
> 
> 
>>   PV = "${CNM_WAVE521_FW_VERSION}"
>>   PR = "${INC_PR}.1"
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 925f81fe..adc7afa1 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -13,12 +13,12 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.15.04"
>>   GOODIX_FW_VERSION = "1.0.0.0"
>>   CADENCE_MHDP_FW_VERSION = "2.1.0"
>>   IMG_DEC_FW_VERSION = "1.0"
>> -CNM_WAVE521_FW_VERSION = "1.0.7"
>> +CNM_WAVE521_FW_VERSION = "1.0.8"
>>   TI_DM_FW_VERSION = "11.00.09"
>>   TI_SYSFW_VERSION = "11.00.07"
>>   TI_HSM_DEMO_FW_VERSION = "11.00.09"
>>   
>> -TI_LINUX_FW_SRCREV ?= "bffa52a1b8d3318ec86814047025e7c5edf7b7b0"
>> +TI_LINUX_FW_SRCREV ?= "d5a6aed56d76f7a8a7729f0d0b4655b7e623e1c7"
>>   SRCREV = "${TI_LINUX_FW_SRCREV}"
>>   
>>   BRANCH ?= "ti-linux-firmware"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> index fb5dfa73..99a2c8fc 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> @@ -6,4 +6,4 @@ PR = "r0"
>>   
>>   BRANCH = "ti-u-boot-2025.01"
>>   
>> -SRCREV = "98b6b3f5a259be864e8db92f4925c3c19c3482a4"
>> +SRCREV = "3d024809613c2a8f1d69258554ab8954d26537f5"
>> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> index 8e83a1aa..8691e523 100644
>> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
>> @@ -10,7 +10,7 @@ PV = "0.3+git"
>>   COMPATIBLE_MACHINE = "k3"
>>   
>>   BRANCH ?= "master"
>> -SRCREV = "e4a814ff42ef357ee453b6f2f809ecdfa624aa8c"
>> +SRCREV = "ea9938bf9cafd9c0cb05ef060a713ab4ac72270f"
>>   
>>   SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
>>   
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> index 535a96f8..f399c207 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> @@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH ?= "ti-linux-6.12.y"
>>   
>> -SRCREV ?= "013211ccdf5ec33e19652be631b820bc5f6b86a4"
>> -PV = "6.12.23+git"
>> +SRCREV ?= "d95b7f80f66d104525e6beb002d82a9505b28131"
>> +PV = "6.12.24+git"
>>   
>>   # Special configuration for remoteproc/rpmsg IPC modules
>>   module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>> -- 
>> 2.43.5

