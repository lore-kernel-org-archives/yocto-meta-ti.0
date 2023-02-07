Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129E4C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 22:44:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4840.1675809864500133789
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 14:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vta+waPm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317MiHHb119294;
	Tue, 7 Feb 2023 16:44:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675809857;
	bh=RWYCTrflTGjVyMzsIEm8+L2OKTKBJ8rlQxsfxsBhYGc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vta+waPmJ4P7/jd0F9/FVrDqhB1YsU8dvlpwwoe81fFrOavDoXkNm3Wm8KCG9oKL8
	 vK5vI484CMkaHT+MB/lZdbTuNe8dUiDlquYTGdyt8sjLI8qs9fjAUvBlpmWlzqR6lK
	 mVT1+Je6EDbqQcTSKmWfeRCO/LrnWJTorA5nskuQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317MiHxo070444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 16:44:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 16:44:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 16:44:17 -0600
Received: from [10.250.32.73] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317MiHcN059900;
	Tue, 7 Feb 2023 16:44:17 -0600
Message-ID: <0182b319-9f9f-342b-4ce2-d2ea50ffa7ca@ti.com>
Date: Tue, 7 Feb 2023 16:44:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master][PATCH] linux-bb.org: work around for too few
 arguments to function init_disassemble_info() error
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20230207142417.14353-1-reatmon@ti.com>
 <20230207173027.GU22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230207173027.GU22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15740



On 2/7/2023 11:30, Denys Dmytriyenko wrote:
> On Tue, Feb 07, 2023 at 08:24:17AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>> binutils 2.39 changed the signature of init_disassemble_info(),
>> which now causes perf and bpftool to fail to compile.
>>
>> Relevant binutils commit: [1]
>>
>> There is a proper fix in development upstream[2].
>> This is a work-around for older kernels.
>>
>> Inspired by a patch by Anton Antonov to fix this issue on meta-arm
>> kernels. [3]
>>
>> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=60a3da00bd5407f07d64dff82a4dae98230dfaac
>> [2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.156015-1-andres@anarazel.de/
>> [3] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> index 2e0f2448..35fb40cd 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
>> @@ -25,7 +25,8 @@ SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
>>   PV:k3 = "5.10.153+git${SRCPV}"
>>   BRANCH:k3 = "5.10-arm64"
>>   
>> -SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
>> +SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
>> +           file://init_disassemble_info-signature-changes-causes-compile-failures.patch"
> 
> Did you forget to add the patch?

No, the patch was introduced for the linux-ti-staging back in November. 
So the patch is already in the repo, this recipe just needs to include 
it in order to compile on master.

> 
>>   DEFCONFIG_NAME = "bb.org_defconfig"
>>   KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

