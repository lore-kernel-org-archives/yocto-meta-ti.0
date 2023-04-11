Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA50C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 17:24:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.20860.1681233870293418240
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 10:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hNDjIS5D;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BHOMU8078575;
	Tue, 11 Apr 2023 12:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681233863;
	bh=oWKGwWpwkxuxZ5n5QLvh+PfpKjXABuydk/fAbWnu+SI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hNDjIS5Du4ssByv/mi8qoSYLRIOK5kSRs6nkeo+6gjZp68riMyxtKKRcQi1TkJG+g
	 psZBK1lSNVhR5mvy8/mc4ARm9Cbto0sSntuhGSjoTgKDgbuLS3SpDfIhPSrLNxuMMv
	 ITBT/aD03RSIleVSzo/AQr266zDmm9g9ymznHF6s=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BHOMtf111194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 12:24:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 12:24:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 12:24:22 -0500
Received: from [10.250.33.184] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BHOMhR063207;
	Tue, 11 Apr 2023 12:24:22 -0500
Message-ID: <e8d48c08-022a-f209-2f45-c7eaad28a466@ti.com>
Date: Tue, 11 Apr 2023 12:24:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] linux-ti-mainline: Use
 upstream configs with upstream kernel
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230405184714.26036-1-afd@ti.com>
 <20230405185842.GF9226@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230405185842.GF9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 17:24:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16343

On 4/5/23 1:58 PM, Denys Dmytriyenko wrote:
> On Wed, Apr 05, 2023 at 01:47:11PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Mainline should test the mainline kernel as it is, not with out-of-tree
>> changes like to the default configuration that one would get when using
>> a stock distro. Use only upstream configuration.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../recipes-kernel/linux/linux-ti-mainline/defconfig       | 1 -
>>   .../linux/linux-ti-mainline/dra7xx/defconfig               | 1 -
>>   .../recipes-kernel/linux/linux-ti-mainline/k3/defconfig    | 1 -
>>   .../linux/linux-ti-mainline/omapl138/defconfig             | 1 -
>>   .../recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig | 1 -
>>   .../recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig | 1 -
>>   meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb  | 7 +++++--
>>   7 files changed, 5 insertions(+), 8 deletions(-)
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
>>   delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
>> deleted file mode 100644
>> index d083d182..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_omap2_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
>> deleted file mode 100644
>> index dcb53bab..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/dra7xx/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_dra7x_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
>> deleted file mode 100644
>> index b9bc6137..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/k3/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_arm64_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
>> deleted file mode 100644
>> index b3467853..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/omapl138/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_omapl138_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
>> deleted file mode 100644
>> index 88f80fa9..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti33x/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_am3x_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
>> deleted file mode 100644
>> index 4b9daaf9..00000000
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline/ti43x/defconfig
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -use-tisdk-config=ti_sdk_am4x_release
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> index be278d73..3f4b560d 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
>> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>   inherit kernel
>>   
>>   DEFCONFIG_BUILDER = "${S}/ti-upstream-tools/config/defconfig_builder.sh"
> 
> Then this ^^^ variable is also not needed any more.
> 

ACK, will remove in v2

> Semms like you are pretty much abandoning the old ti-upstream-tools concept,
> which was supplying TI-specific defconfig fragments+script and DTB/DTBOs on
> top of mainline kernel. In that case mainline and next recipes will be the
> same, except for SRC_URI tree and SRCREV?
> 

Basically yes. For now I keep the ti-upstream-tools in the "mainline" builds
just for adding some DTBOs used in testing, I have a patch that removes it
completely, I'll add that patch for v2.

Andrew

> 
>> -require recipes-kernel/linux/setup-defconfig.inc
>>   require recipes-kernel/linux/kernel-rdepends.inc
>>   require recipes-kernel/linux/ti-kernel.inc
>>   
>> @@ -33,12 +32,16 @@ KERNEL_GIT_PROTOCOL = "https"
>>   SRC_URI += " \
>>       ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
>>       git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
>> -    file://defconfig \
>>   "
>>   
>>   SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
>>   SRCREV_FORMAT = "linux"
>>   
>> +DEFCONFIG_NAME = "multi_v7_defconfig"
>> +DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
>> +DEFCONFIG_NAME:k3 = "defconfig"
>> +KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>> +
>>   kernel_do_compile:append() {
>>   	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>>   	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>> -- 
>> 2.39.2

