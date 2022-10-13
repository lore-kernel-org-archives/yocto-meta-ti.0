Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413E1C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:10:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.966.1665691820871374782
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QbURMTEE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKAF3x060966;
	Thu, 13 Oct 2022 15:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665691815;
	bh=LZMBl2yjJW59EIgjXcm8TxzNAjvVqn5sdJrUm7QTsoA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QbURMTEEGL+zDQ7Kfxg2aWeMI9cy347dHm3blsSU4ndvA6hnqn6D8Vd0YQFe6VIeK
	 9oSlthkyht3sHl2/owntVbfOeD1DXhMxwYSVCw5wQeOXxyrFX7wgCA1/g9yl2rDftP
	 Vx6IudSpvHZNIqCS2jIpP8u1Ex0As+ZTJwK9U4Lk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKAFkB024065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:10:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:10:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:10:15 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKAFiq002214;
	Thu, 13 Oct 2022 15:10:15 -0500
Message-ID: <99d8db27-d8be-f481-6943-81c7f4a59825@ti.com>
Date: Thu, 13 Oct 2022 15:10:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [meta-ti][master][PATCH] trusted-firmware-a: work around RWX
 permission error on segment
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20221013182215.8751-1-reatmon@ti.com>
 <20221013192640.GK22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221013192640.GK22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:10:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15166



On 10/13/2022 2:26 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 13, 2022 at 01:22:15PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Binutils 2.39 now warns when a segment has RXW permissions[1]:
>>
>>    aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX permissions
>>
>> However, TF-A passes --fatal-warnings to LD, so this is a build failure.
>>
>> There is a ticket filed upstream[2], so until that is resolved we can
>> disable this warning.
>>
>> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
>> [2] https://developer.trustedfirmware.org/T996
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> Signed-off-by: Jon Mason <jon.mason@arm.com>
>>
>> Adapted from the above patch[3] in meta-arm, but we cannot use that patch as
>> we are on an older SRCREV and the Makefile has changed.
>>
>> [3] https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-bsp?id=977c5222d8c2f6f6c7e522e480a6e4cd40ba32d7
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../files/rwx-segments-ti.patch               | 45 +++++++++++++++++++
>>   .../trusted-firmware-a_%.bbappend             |  3 ++
>>   2 files changed, 48 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
>> new file mode 100644
>> index 00000000..826a4b32
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
>> @@ -0,0 +1,45 @@
>> +Binutils 2.39 now warns when a segment has RXW permissions[1]:
>> +
>> +aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
>> +permissions
>> +
>> +However, TF-A passes --fatal-warnings to LD, so this is a build failure.
>> +
>> +There is a ticket filed upstream[2], so until that is resolved just
>> +remove --fatal-warnings.
>> +
>> +[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
>> +[2] https://developer.trustedfirmware.org/T996
>> +
>> +Upstream-Status: Inappropriate
>> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>> +
>> +
>> +Adapted from the above patch in meta-arm, but we cannot use that patch as
>> +we are on an older SRCREV and the Makefile has changed.
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 3941f8698..13bbac348 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -421,7 +421,7 @@ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
>> + # LD = gcc (used when GCC LTO is enabled)
>> + else ifneq ($(findstring gcc,$(notdir $(LD))),)
>> + # Pass ld options with Wl or Xlinker switches
>> +-TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
>> ++TF_LDFLAGS		+=	-O1
>> + TF_LDFLAGS		+=	-Wl,--gc-sections
>> + ifeq ($(ENABLE_LTO),1)
>> + 	ifeq (${ARCH},aarch64)
>> +@@ -439,7 +439,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
>> +
>> + # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
>> + else
>> +-TF_LDFLAGS		+=	--fatal-warnings -O1
>> ++TF_LDFLAGS		+=	-O1
>> + TF_LDFLAGS		+=	--gc-sections
>> + # ld.lld doesn't recognize the errata flags,
>> + # therefore don't add those in that case
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index 14463846..146dbec4 100644
>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -6,6 +6,9 @@ TFA_BUILD_TARGET:k3 = "all"
>>   TFA_INSTALL_TARGET:k3 = "bl31"
>>   TFA_SPD:k3 = "opteed"
>>   
>> +SRC_URI:k3 += "file://rwx-segments-ti.patch"
> 
> You want SRC_URI:append:k3 here.

Gotcha.  v2 incoming.

> 
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>> +
>>   EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>>   EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>>   
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

