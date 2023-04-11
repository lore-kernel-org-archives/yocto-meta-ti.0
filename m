Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D88C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 23:29:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.30656.1681255779272915552
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 16:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QRQFo3PU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BNTY9E007708;
	Tue, 11 Apr 2023 18:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681255774;
	bh=PjUzZHMNSx/X+P/PMFra9ZwC4AgWm3pAS3IM73Dqgl8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QRQFo3PUHm5qRg2bVg68AXU42YzFt9ySeM92VemCIgcNyPga3WE/JxxdJyEPwV0l3
	 +g0jAzgF/JnAItYSCTEmfK9YYvQTmZjIQI4jnNi9rL+Th2YQB7s+OkxZ91QtChMRLX
	 PYR9OGfavZfhoQ0suUAEtT6KF7rOO29izMblWqg8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BNTYTv030957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 18:29:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 18:29:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 18:29:34 -0500
Received: from [10.249.35.219] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BNTXD6040729;
	Tue, 11 Apr 2023 18:29:33 -0500
Message-ID: <2392ca46-e762-cd93-3030-e8d2a616c585@ti.com>
Date: Tue, 11 Apr 2023 18:29:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-ti][master/kirkstone][PATCH v2] ti-sci-fw: Add SYSFW_SUFFIX
 to SYSFW_BINARY to match k3-image-gen
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230411225420.10044-1-reatmon@ti.com>
 <20230411230257.GH9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230411230257.GH9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 23:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16375



On 4/11/2023 18:02, Denys Dmytriyenko wrote:
> On Tue, Apr 11, 2023 at 05:54:20PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> k3_image_gen added the suffix to the sysfw binary to differentiate
>> between GP and HS binaries.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Split the IMAGE_BOOT_FILES for GP and HS.  This is not the final
>> form.  We will be re-working a lot of the platforms to follow the am62
>> model of building everything, but for LTS migration progress this is needed.
>>
>>   meta-ti-bsp/conf/machine/include/am65xx.inc   |  3 +-
>>   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 32 +++++++++----------
>>   2 files changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index edfc7c11..3f29076f 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -23,7 +23,8 @@ do_image_complete[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
>>   IMAGE_BOOT_FILES += "sysfw.itb"
>>   
>>   # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
>> -IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
>> +IMAGE_BOOT_FILES:am65xx-evm += "sysfw-am65x-gp-evm.itb"
>> +IMAGE_BOOT_FILES:am65xx-hs-evm += "sysfw-am65x-hs-evm.itb"
> 
> This is problematic ^^^
> 
> 1. Cannot mix override with += so should use only override, e.g.
> IMAGE_BOOT_FILES:append:am65xx-evm = " blah"

Valid point.  Still learning all of those nuances.

> 2. Should there be a default that is not GP or HS EVM? E.g. a customer
> board that is part of am65xx SoC family, but none of the EVM boards.

The real problem is that the gp and hs share the same file but the 
k3-image-gen change changed the name of the itb file...

I'm going to leave this in kirkstone-next for now for our LTS migration 
while I work on cleaning up the am65 platform in the spirit of the am62 
model.  Once I have that pass complete I can remove this patch before it 
gets out to kirkstone.

I'll try to have that new pass tomorrow.


> 
>>   TFA_BOARD = "generic"
>>   
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index cde768df..ee995fa5 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -55,26 +55,26 @@ SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>>   SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
>>   SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
>>   
>> -SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> +SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>>   SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>>   SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>>   SYSFW_SYMLINK ?= "sysfw.itb"
>>   
>> -SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -
>> -SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> -SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +
>> +SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>> +SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
>>   
>>   CFLAGS[unexport] = "1"
>>   LDFLAGS[unexport] = "1"
>> -- 
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16374): https://lists.yoctoproject.org/g/meta-ti/message/16374
>> Mute This Topic: https://lists.yoctoproject.org/mt/98208802/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

