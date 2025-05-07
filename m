Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FDEC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 13:18:43 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.8987.1746623919444856750
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 May 2025 06:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EluLLPk3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547DIaK8820040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 08:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746623916;
	bh=QEWDbxjGkxGHCdhpsI8kbddCKu4sLSEZavjOyG3e7N4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EluLLPk3R8s9ZGxCWDeWREcGg/KAXkWbmDhOeCcj+4B08bLN5aVOx7l+IW8IOD56G
	 kl3wJ3mFglev8sfMfXJ4JSezv091j1GlTIB+OpggdPmzJCN/Bp03Pt+ENbOKpy72S3
	 Dls6rQ1pa6szevwYQTm7WFWDfjZ8aA3HHSzaVnEE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547DIaPE114621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 08:18:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 08:18:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 08:18:35 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547DIXe9115534;
	Wed, 7 May 2025 08:18:34 -0500
Message-ID: <a8979da3-0256-4647-9b78-7437a6ab92ec@ti.com>
Date: Wed, 7 May 2025 18:48:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/1] recipes-bsp: Add
 DM_FIRMWARE override for am62pxx display cluster
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Andrew
 Davis <afd@ti.com>
References: <20250506091015.4049616-1-c-shilwant@ti.com>
 <20250506091015.4049616-2-c-shilwant@ti.com>
 <20250506211540.GG18383@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250506211540.GG18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 May 2025 13:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18541

+ Andrew

On 07/05/25 02:45, Denys Dmytriyenko wrote:
> On Tue, May 06, 2025 at 02:40:15PM +0530, Chirag Shilwant wrote:
>> * For AM62P display cluster usecase, we need to pick
>> "dss_display_share.wkup-r5f0_0.release.strip.out" from ti-linux-firmware [0]
>> Hence, pick the display cluster firmware only when DISPLAY_CLUSTER_ENABLE is set to 1.
>>
>> * When DISPLAY_CLUSTER_ENABLE is not set to 1, fallback to pick the "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>> DM firmware.
> Should a similar condition be added for am62axx to select between dm_edgeai_mcu1_0_release_strip.out
> and ipc_echo_testb_mcu1_0_release_strip.xer5f ?


Hmm, that's a good point. Apparently for AM62A, the TI SDK story is a 
bit different.
The major delta between the two DM firmwares is the inclusion of TIOVX, 
VPAC & Vision Apps stack
in dm_edgeai_mcu1_0_release_strip.out

As all spins of AM62A (i.e. AM62A3, AM62A7, AM62A7-Q1, etc) are sold as 
a Analytics processor [0],
we want customers to always use dm_edgeai_mcu1_0_release_strip.out by 
default &
hence the SDKs (& eventually meta-ti-bsp) to always pick the EdgeAI DM 
firmware.


Now, the answer to why upstream u-boot binman still uses 
ipc_echo_testb_mcu1_0_release_strip.xer5f
as default (OR why does ipc_echo_testb* exist) is nicely explained by 
Andrew at [1]

As highlighted in [1], we eventually want 
dm_edgeai_mcu1_0_release_strip.out to be our default in future even
in upstream as well but until then if we want meta-ti-bsp to support the 
ipc_echo_testb_mcu1_0_release_strip.xer5f
as well then my suggestion would be to have it other way 
around...something like below,

DM_FIRMWARE:am62axx = "${@oe.utils.conditional('USE_IPC_ECHO_TEST_DM', 
'1', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', 
'dm_edgeai_mcu1_0_release_strip.out', d)}"

This ensures that the additional local.conf step for setting 
"USE_IPC_ECHO_TEST_DM" is not needed for default offering
but only for users who intend to use the 
ipc_echo_testb_mcu1_0_release_strip.xer5fDM firmware.


For AM62P, both dss_display_share.wkup-r5f0_0.release.strip.out & 
ipc_echo_testb_mcu1_0_release_strip.xer5f
are delivered as a part of standard offering to customers [2] & hence we 
added the DISPLAY_CLUSTER_ENABLE
logic in meta-ti-bsp which helps in supporting both.


[0]: 
https://www.ti.com/microcontrollers-mcus-processors/arm-based-processors/overview.html

[1]: 
https://lore.kernel.org/all/534da8dc-f7bf-4ef3-b94d-3254a38b26a4@ti.com/

[2]: https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM62P/11.00.09.04



Chirag



>
>
>> [0]: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tree/ti-dm/am62pxx?h=11.00.12
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 1 +
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> index a7d15e30..eaa82a62 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -40,6 +40,7 @@ INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
>> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>>   
>>   DM_FW_LIST = ""
>>   DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 57bf7a4e..6b7e2bea 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -46,6 +46,7 @@ DEPENDS:append:j784s4 = " ti-hsm-demo-fw"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>   DM_FIRMWARE:am62axx = "dm_edgeai_mcu1_0_release_strip.out"
>> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'dss_display_share.wkup-r5f0_0.release.strip.out', 'ipc_echo_testb_mcu1_0_release_strip.xer5f', d)}"
>>   
>>   PLAT_SFX = ""
>>   PLAT_SFX:j721e = "j721e"
>> -- 
>> 2.34.1
>>

