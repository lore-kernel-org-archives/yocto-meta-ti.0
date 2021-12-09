Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15465.1639073325017807845
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 10:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DJvaEXBl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9I8e89043701;
	Thu, 9 Dec 2021 12:08:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639073320;
	bh=jpf0pS1ICRUNwnoglxt0nhykYLJkIyFwLbv56EkTvbU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DJvaEXBl53EiTxLvPAfoHNLZep9H07mUieLkj6LmEgPq7Kk36aPzjIGpvSrngjiBD
	 48y1DY3NgpHtqaMP7jOaxA7927u0brETCspfSf+4YBOc/T9e892x9D+whDV44RY2j3
	 br7tWo5dRoS3malpdn44dj2YajwkmIanRTFEThbQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9I8dL6045376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 12:08:39 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 12:08:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 12:08:39 -0600
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9I8dkx121976;
	Thu, 9 Dec 2021 12:08:39 -0600
Message-ID: <cd621a0a-a6c5-0110-50cc-3d25789bfb88@ti.com>
Date: Thu, 9 Dec 2021 12:08:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw: Fix for KIG issue for combined boot images
To: Denys Dmytriyenko <denis@denix.org>, <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20211209121802.2379-1-yogeshs@ti.com>
 <20211209132454.GZ18191@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211209132454.GZ18191@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/9/2021 7:24 AM, Denys Dmytriyenko wrote:
> On Thu, Dec 09, 2021 at 12:18:02PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> This is temporary fix for combined boot images for KIG in meta-ti till
>> the patch is integrated.
>>
>> Upstream-Status: Submitted
> 
> Upstream-Status goes into the patch file itself, not the commit message - see
> below.

Submitted v2:
https://lists.yoctoproject.org/g/meta-ti/message/14272

> 
> 
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> ---
>>   ...gning-of-binaries-for-combined-boot-.patch | 63 +++++++++++++++++++
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 ++
>>   2 files changed, 68 insertions(+)
>>   create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
>>
>> diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
>> new file mode 100644
>> index 00000000..93b0c325
>> --- /dev/null
>> +++ b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
>> @@ -0,0 +1,63 @@
>> +From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
>> +From: Yogesh Siraswar <yogeshs@ti.com>
>> +Date: Wed, 8 Dec 2021 17:50:19 -0600
>> +Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
>> + images
>> +
>> +Combined sysfw binaries used in tiboot.bin do not require signed images.
>> +This fixes issues with AM64x HS and J7200 HS boot images
> 
> Upstream-Status goes here.
> 
> 
>> +Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>> +---
>> + Makefile           | 8 +++++++-
>> + soc/am64x/Makefile | 1 +
>> + soc/j7200/Makefile | 1 +
>> + 3 files changed, 9 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 47b3b20..ab465df 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
>> + 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
>> + 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -o $@ -s $(SOC) -l $@.log
>> +
>> +-# On HS board configuration binaries must be signed
>> ++# On HS board configuration binaries must be signed unless it is combined boot image
>> + ifdef HS
>> ++ifndef COMBINED_BOOT_IMAGE
>> ++SIGN_BINARY=1
>> ++endif
>> ++endif
>> ++
>> ++ifdef SIGN_BINARY
>> + %.bin.unsigned: %.o
>> + 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
>> + %.bin: %.bin.unsigned
>> +diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
>> +index bfbe3e5..33ebbd0 100644
>> +--- a/soc/am64x/Makefile
>> ++++ b/soc/am64x/Makefile
>> +@@ -31,6 +31,7 @@
>> + #
>> +
>> + SBL_LOADADDDR ?= 0x70000000
>> ++COMBINED_BOOT_IMAGE = 1
>> + COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x7b000
>> + LOADADDR  ?= 0x44000
>> + SCIFS = sci
>> +diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
>> +index 3b754f7..0baef51 100644
>> +--- a/soc/j7200/Makefile
>> ++++ b/soc/j7200/Makefile
>> +@@ -31,6 +31,7 @@
>> + #
>> +
>> + SBL_LOADADDDR ?= 0x41c00000
>> ++COMBINED_BOOT_IMAGE = 1
>> + COMBINED_TIFS_BRDCFG_LOADADDR ?= 0x7f000
>> + COMBINED_DM_BRDCFG_LOADADDR ?= 0x41c80000
>> + LOADADDR ?= 0x40000
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index 6d48bf23..13ae1f6b 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -47,6 +47,11 @@ LD[unexport] = "1"
>>   
>>   do_configure[noexec] = "1"
>>   
>> +SRC_URI_append_j7200-hs-evm-k3r5 = "\
>> +	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
>> +SRC_URI_append_am64xx-hs-evm-k3r5 = "\
>> +	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
>> +
>>   EXTRA_OEMAKE = "\
>>       CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
>>       SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
>> -- 
>> 2.17.1
>>
> 
>>
>> 
>>
> 
> 
