Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBA1C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:23:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.8601.1751404980263197277
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 14:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g41uf7mC;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561LMwEX3421514;
	Tue, 1 Jul 2025 16:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751404978;
	bh=d3z3h+UsYSTUSfpdBNphgZZ45n4sKW5OJe+Sb/SGNZM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=g41uf7mCjYsc+dx9M0TZE2ZacUW/o4MiYjjBGmj5rXQmIO/zhsHW5JPE2AreYIowd
	 UXYdTdBO568Vv/bBNZBpToafuuFl8t0nsUQ39wqUftl/XXHv1X+5X/OKMrXXzhCZHn
	 kyrxa/Te6G4S3LPuYMmTORI9EH1gg2zgHVsY+IrU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561LMwtX602644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 16:22:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 16:22:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 16:22:58 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561LMwtc2247979;
	Tue, 1 Jul 2025 16:22:58 -0500
Message-ID: <939467da-b01f-4ee0-a339-8324bd848944@ti.com>
Date: Tue, 1 Jul 2025 16:22:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-bsp: conf:
 machine: Deploy all versions of tiboot3.bin
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250627193003.575911-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250627193003.575911-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 21:23:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18753



On 6/27/2025 2:30 PM, Andrew Davis wrote:
> For some version of U-Boot some versions of tiboot3.bin were not
> available. This has since been fixed and now all versions of U-Boot
> that are supported here have all versions of tiboot3.bin. Deploy
> these all here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/j7200.inc |  8 ++------
>   meta-ti-bsp/conf/machine/include/j721e.inc | 19 +++++++++----------
>   meta-ti-bsp/conf/machine/include/j722s.inc |  5 +----
>   3 files changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
> index 3cba71b6..e7ab409f 100644
> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
> @@ -7,14 +7,10 @@ SOC_FAMILY:append = ":j7200"
>   IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
>   
>   # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
> -IMAGE_SR1_HS_FS_FILES = "tiboot3-j7200-hs-fs-evm.bin"
> -IMAGE_SR1_HS_FS_FILES:bsp-mainline = ""
> -IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_FS_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j7200-hs-fs-evm.bin"
>   
>   # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
> -IMAGE_SR1_HS_SE_FILES = "tiboot3-j7200-hs-evm.bin"
> -IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
> -IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j7200-hs-evm.bin"
>   
>   # Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
>   IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
> index 30aa2a69..3a5a9af6 100644
> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
> @@ -15,22 +15,21 @@ IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
>   IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR1.1 HS-FS
> -IMAGE_SR1_1_HS_FS_FILES = "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j721e_sr1_1-hs-fs-evm.itb"
> -IMAGE_SR1_1_HS_FS_FILES:bsp-mainline = ""
> -IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_FS_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
> +IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-fs-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR1.1 HS-SE
> -IMAGE_SR1_1_HS_SE_FILES = "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_sr1_1-hs-evm.itb"
> -IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_SE_FILES}"
> +IMAGE_SR1_1_HS_SE_FILES = " "
> +IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
> +IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"

Andrew,

NAK.  This breaks the beaglebone-ai64 build.  The 
meta-beagle/conf/machine/beaglebone-ai64.conf clears the various IMAGE_* 
variables because the sysfw-j721e_sr1_1-hs-evm.itb file is not created 
in that flow.

So making this change does not jive with the beaglebone setup.  It looks 
like you need to also clean up those files so that they do not rely on 
the IMAGE_BOOT_FILES variable...

Not sure.  You wanted to do this, so you can negotiate with Denys on the 
best way to resolve this with your patch.



>   # Since default on J721e is for GP, add a version for SR2.0 HS-FS
> -IMAGE_SR2_HS_FS_FILES = "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_sr2-hs-fs-evm.itb"
> -IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_FS_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
> +IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
>   
>   # Since default on J721e is for GP, add a version for SR2.0 HS-SE
> -IMAGE_SR2_HS_SE_FILES = "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-hs-evm.itb"
> -IMAGE_SR2_HS_SE_FILES:bsp-mainline = ""
> -IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_SE_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-evm.bin"
> +IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-evm.itb"
>   
>   TFA_BOARD = "generic"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
> index e0b77d96..d49da340 100644
> --- a/meta-ti-bsp/conf/machine/include/j722s.inc
> +++ b/meta-ti-bsp/conf/machine/include/j722s.inc
> @@ -12,10 +12,7 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
>   IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
>   
>   # Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
> -IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
> -IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
> -IMAGE_SR1_HS_SE_FILES:bsp-next = ""
> -IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
> +IMAGE_BOOT_FILES += "tiboot3-j722s-hs-evm.bin"
>   
>   TFA_BOARD = "lite"
>   TFA_K3_SYSTEM_SUSPEND = "1"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

