Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1259.1639098837933488967
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 17:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HYiCExIZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BA1DsIA023365;
	Thu, 9 Dec 2021 19:13:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639098834;
	bh=dYU6oXcfIFB+YMtRmwf5VR+pjs/EKYWvjCSZvSRzDng=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HYiCExIZuD7bkBZ+CWBo8k/XHioOC60w29cH1dSya7xgGKRuutZMq/3r8iSuKp01M
	 JBWSNZ8aA/apsrY4az0gidNUfTW9wlaUHrj/11r8Luxo53CLLzKUW/PUGTjPYhMu7s
	 EWccu0GbOr1vKTdfUkUs/C2N6n1STbNMqX+CPMWI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BA1DsdF065071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 19:13:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 19:13:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 19:13:54 -0600
Received: from [10.249.36.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BA1DrdC042705;
	Thu, 9 Dec 2021 19:13:53 -0600
Message-ID: <6275826b-7648-3208-8817-ef4c9815eb9c@ti.com>
Date: Thu, 9 Dec 2021 19:13:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [meta-ti] [dunfell/master PATCHv2] ti-sci-fw: Fix for k3-image-gen issue for combined boot images
To: Vignesh Raghavendra <vigneshr@ti.com>, <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20211209180713.6240-1-praneeth@ti.com>
 <75438b54-219c-ba27-b8d1-e06e9db89b1e@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <75438b54-219c-ba27-b8d1-e06e9db89b1e@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/9/2021 12:23 PM, Vignesh Raghavendra wrote:
> 
> 
> On 12/9/21 11:37 PM, praneeth via lists.yoctoproject.org wrote:
> [...]
>> @@ -0,0 +1,64 @@
>> +From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
>> +From: Yogesh Siraswar <yogeshs@ti.com>
>> +Date: Wed, 8 Dec 2021 17:50:19 -0600
>> +Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
>> + images
>> +
>> +Combined sysfw binaries used in tiboot.bin do not require signed images.
>> +This fixes issues with AM64x HS and J7200 HS boot images
>> +
>> +Upstream-Status: Submitted
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
> 
> No need to introduce COMBINED_BOOT_IMAGE or SIGN_BINARY.
> Use COMBINED_SYSFW_BRDCFG_LOADADDR like rest of Makefile does:

I had done that before I realized that J7200 doesn't use 
COMBINED_SYSFW_BRDCFG_LOADADDR. So now instead of checking multiple 
COMBINED variables I just cleaned it up for simplicity.

> 
> Entire patch can be replaced with below diff:
> 
> diff --git a/Makefile b/Makefile
> index 47b3b20..18e9eb5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -217,10 +217,12 @@ $(soc_objroot)/%.o: %.c
>   
>   # On HS board configuration binaries must be signed
>   ifdef HS
> +ifneq (,$(COMBINED_SYSFW_BRDCFG_LOADADDR))
>   %.bin.unsigned: %.o
>          $(CROSS_COMPILE)objcopy -S -O binary $< $@
>   %.bin: %.bin.unsigned
>          $(TI_SECURE_DEV_PKG)/scripts/secure-binary-image.sh $< $@
> +endif
>   else
>   %.bin: %.o
>          $(CROSS_COMPILE)objcopy -S -O binary $< $@
> 
> 
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
>>
>>
>>
>> 
>>
