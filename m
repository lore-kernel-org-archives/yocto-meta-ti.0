Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F48FC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 17:53:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.125217.1669658029890626884
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 09:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TRDmL7B9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ASHrjqH095665;
	Mon, 28 Nov 2022 11:53:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669658025;
	bh=mUsIpVA7UM/n3PqeXTG5R6rLD1RpyeDwC9pVTb4fTFo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TRDmL7B9exm6q0JdGxC1zutLzbMN/KcGb9Mf7ssR0mKr234lFh3TIvZIk28drBQaH
	 Q09kdNpi+1ZjKAia0GiaNawwDN3oLsKF5G16AwZrk1E3V0beE7Ka/iKzZ1ltsof8eo
	 a9MXfO9YCMg2spKlDS4bn04utyJk2X2YvPBjvQQU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ASHrjuE006675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Nov 2022 11:53:45 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 28
 Nov 2022 11:53:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 28 Nov 2022 11:53:45 -0600
Received: from [10.250.34.159] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ASHrjkI045115;
	Mon, 28 Nov 2022 11:53:45 -0600
Message-ID: <cdc2924e-14ef-7ac3-4e7d-0f40e5ba3553@ti.com>
Date: Mon, 28 Nov 2022 11:53:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging: work around for too
 few arguments to function init_disassemble_info() error
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20221128042919.16102-1-reatmon@ti.com>
 <20221128154023.GN22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221128154023.GN22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Nov 2022 17:53:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15372



On 11/28/2022 9:40, Denys Dmytriyenko wrote:
> On Sun, Nov 27, 2022 at 10:29:19PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
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
>>   ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>>   ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>>   ...ture-changes-causes-compile-failures.patch | 109 ++++++++++++++++++
>>   .../linux/linux-ti-staging_5.10.bb            |   1 +
>>   4 files changed, 328 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.10/init_disassemble_info-signature-changes-causes-compile-failures.patch
> 
> This is incorrect - you should not have 3 identical copies of the same patch.

Gotcha.  I see what I did wrong.  I'll get it fixed.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

