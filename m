Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF211C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 15:13:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22628.1682694814297430368
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 08:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cDlBQkoP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33SFDQns104771;
	Fri, 28 Apr 2023 10:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682694806;
	bh=SxVW2T/MG6ZVPe7C/AH7DO4KGSCDJ4yrqI/jNq8nD0o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cDlBQkoP/L82pqecqnSP7tnbPkUyHAkxZO+knwmUsNAxytqjEMy9m//gvqLLf7ki8
	 PUjpn4IHO5BXhefEAaOjcSd/EXAXea6M90465HqdPVxu20B6bin1M5qDXdXLy2whh/
	 d6XQZNvNsN7oLc3o2EokVigxuOVoUuKefWhJojEM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33SFDQlZ066325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Apr 2023 10:13:26 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Apr 2023 10:13:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Apr 2023 10:13:26 -0500
Received: from [10.250.35.77] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33SFDQ42029468;
	Fri, 28 Apr 2023 10:13:26 -0500
Message-ID: <3276c7f1-37bc-c35b-5ffc-44c3e0296c42@ti.com>
Date: Fri, 28 Apr 2023 10:13:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][master/kirkstone][RFC 4/9] u-boot-bb.org: Remove this
 recipe
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230425172345.12293-1-afd@ti.com>
 <20230425172345.12293-5-afd@ti.com> <20230427203108.GO9226@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230427203108.GO9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Apr 2023 15:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16457

On 4/27/23 3:31 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 25, 2023 at 12:23:40PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> This will no longer build after we switch away from k3-image-gen. Remove
>> this version until it can be rebased on the latest U-Boot with binman
>> support.
> 
>> For now switch current users of this over to u-boot-ti v2021.01.
> 
> This comment is not very clear - aren't you also removing that here?
> 

Not here, I do that in the *next* patch :)

I usually sort my patches from least to most controversial, so the first
3-4 can be taken stopping here without breaking as much.

> Would it be possible to preserve at least Beagle build flows intact? Can
> the existing ti-sci-fw recipe that uses k3-image-gen be kept for now
> alongside the new one, e.g. move it to ti-sci-fw-legacy or something?
> 

I have found no such way :(

All the multiconf and deploy logic expects k3-image-gen and now needs
moved over to the new way. Supporting both would mean forking almost
everything removed by this series.

The benefit is not there IMHO since the beagle platforms should boot
almost exactly the same on our TI tree as the bb.org version.

Moving forward, bb.org will also have to make this migration as
k3-image-gen will soon be deprecated. When they do, if we still want
their fork in meta-ti we can bring it back in.

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/beagle-x15.conf      |  2 --
>>   .../conf/machine/beaglebone-ai64-k3r5.conf    |  3 ---
>>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf |  2 --
>>   meta-ti-bsp/conf/machine/beaglebone.conf      |  2 --
>>   meta-ti-bsp/conf/machine/beagleplay-k3r5.conf |  3 ---
>>   meta-ti-bsp/conf/machine/beagleplay.conf      |  2 --
>>   .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   | 24 -------------------
>>   7 files changed, 38 deletions(-)
>>   delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>>
>> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> index fb52245b..be27705c 100644
>> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
>> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
>> @@ -5,8 +5,6 @@
>>   require conf/machine/include/am57xx.inc
>>   
>>   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>>   
>>   KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
>>   
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> index 7c99b5d4..b893f380 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> @@ -4,9 +4,6 @@
>>   
>>   require conf/machine/include/k3r5.inc
>>   
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>> -
>>   SYSFW_SOC = "j721e"
>>   SYSFW_CONFIG = "evm"
>>   SYSFW_SUFFIX = "gp"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 304cbb62..bd5f541f 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -7,8 +7,6 @@ require conf/machine/include/j721e.inc
>>   UBOOT_MACHINE = "j721e_evm_a72_config"
>>   
>>   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>>   
>>   KERNEL_DEVICETREE = " \
>>   ti/k3-j721e-beagleboneai64.dtb \
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
>> index dceef1db..2d811d0d 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
>> @@ -5,8 +5,6 @@
>>   require conf/machine/include/ti33x.inc
>>   
>>   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>>   
>>   KERNEL_DEVICETREE_PREFIX = "am335x-bone"
>>   
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>> index c40615c9..f8f08d63 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
>> @@ -4,9 +4,6 @@
>>   
>>   require conf/machine/include/k3r5.inc
>>   
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>> -
>>   SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>>   SYSFW_SUFFIX = "gp"
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
>> index e8d25cd9..f4f6a49c 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -20,8 +20,6 @@ OPTEEMACHINE = "k3-am62x"
>>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"
>>   
>>   PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
>> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>> -PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>>   
>>   KERNEL_DEVICETREE = " \
>>   ti/k3-am625-beagleplay.dtb \
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>> deleted file mode 100644
>> index 4e4688aa..00000000
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -require u-boot-ti.inc
>> -
>> -SUMMARY = "BeagleBoard.org U-Boot"
>> -
>> -COMPATIBLE_MACHINE = "beagle.*"
>> -
>> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>> -
>> -PV = "2021.01"
>> -
>> -UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
>> -UBOOT_GIT_PROTOCOL = "https"
>> -BRANCH = "v2021.01-ti-08.05.00.005-SDK-8.5"
>> -SRCREV = "46ff4982b41067e5c93369bddd49b1541856d80b"
>> -
>> -BRANCH:beaglebone-ai64 = "v2021.01-ti-08.05.00.001"
>> -BRANCH:beaglebone-ai64-k3r5 = "v2021.01-ti-08.05.00.001"
>> -SRCREV:beaglebone-ai64 = "ea96725b5156135d5875415f75d2188f6f56622a"
>> -SRCREV:beaglebone-ai64-k3r5 = "ea96725b5156135d5875415f75d2188f6f56622a"
>> -
>> -BRANCH:beagleplay = "v2021.01-ti-BeaglePlay-Release"
>> -BRANCH:beagleplay-k3r5 = "v2021.01-ti-BeaglePlay-Release"
>> -SRCREV:beagleplay = "f036fbdc25941d7585182d2552c767edb9b04114"
>> -SRCREV:beagleplay-k3r5 = "f036fbdc25941d7585182d2552c767edb9b04114"
>> -- 
>> 2.39.2

