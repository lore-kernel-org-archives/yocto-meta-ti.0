Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546D3C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:35:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.27916.1681248950967862006
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JDzYBp+g;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLZk8p024985;
	Tue, 11 Apr 2023 16:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681248946;
	bh=pmbkwaOe/2NVGbRyotMQQwuYGbsUUUN80uTkV4nEpE8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JDzYBp+g+TAjvqrp7hcEuJnDtqGuYLDBW1K4KXkzMOAvMIH78rVFK56mnd7hO8Dqs
	 rfSp4DwKrUp6DEfL2hI8fFj4M27gmoUC7gcRdDuWXnwTyD18ctmUaK9lDinDs6CJuu
	 novASHT5rE7v4yDwE/rlHWIjF5rJ3AvJVm90zktE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLZkXG008297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:35:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:35:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:35:46 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLZknB021616;
	Tue, 11 Apr 2023 16:35:46 -0500
Message-ID: <a4782392-4f36-556c-6677-e7c16b7e9257@ti.com>
Date: Tue, 11 Apr 2023 16:35:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 2/5] linux-ti-mainline:
 Remove ti-upstream-tools
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230411174037.32244-1-afd@ti.com>
 <20230411174037.32244-2-afd@ti.com> <20230411194916.GX9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230411194916.GX9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16360

On 4/11/23 2:49 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 11, 2023 at 12:40:34PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Mainline should test the mainline kernel as it is, not with out-of-tree
>> changes like new DTB/DTBOs. Use only upstream DTB/DTBOs. As that was the
>> last thing provided by ti-upstream-tools, remove it here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../recipes-kernel/linux/linux-ti-mainline_git.bb     | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index 7d948a85..d0f1b4e2 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -1,5 +1,5 @@
>>   SECTION = "kernel"
>> -SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
>> +SUMMARY = "Mainline Linux kernel for TI devices"
>>   LICENSE = "GPL-2.0-only"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   
>> @@ -15,9 +15,6 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -BRANCH = "master"
>> -TOOLS_BRANCH = "master"
>> -
>>   # 5.15 Mainline version
>>   SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
>>   PV = "5.15+git${SRCPV}"
>> @@ -28,12 +25,11 @@ PR = "${MACHINE_KERNEL_PR}"
>>   
>>   KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
>>   KERNEL_GIT_PROTOCOL = "https"
>> +KERNEL_GIT_BRANCH = "master"
>>   SRC_URI += " \
>> -    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
>> -    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
>> +	${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${KERNEL_GIT_BRANCH};name=linux \
>>   "
>>   
>> -SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
>>   SRCREV_FORMAT = "linux"
> 
> Remove SRCREV_FORMAT that is used for multi-SCM recipes, as well as

Way too many magic variables to keep track :)

> ";name=linux" from SRC_URI above.
> 

Ack

> 
>>   DEFCONFIG_NAME = "multi_v7_defconfig"
>> @@ -43,7 +39,6 @@ KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>>   
>>   kernel_do_compile:append() {
>>   	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> 
> Are you keeping "make dtbs" to build ALL DTBs from the kernel? Same story as
> with patch #5 for linux-ti-next - KERNEL_DEVICETREE has a list of upstreamed
> DTBs that will be built automatically, so above line can also be removed.

Sure, will remove for v3

> (though j784s4-evm has an empty KERNEL_DEVICETREE - nothing got upstreamed?)
> 

Looks like it needs updated..

Andrew

> 
>> -	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>>   }
>>   
>>   do_shared_workdir:prepend() {
>> -- 
>> 2.39.2

