Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2792C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:44:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.57085.1718631845481514586
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 06:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FXr/Kh5k;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HDi36C125169;
	Mon, 17 Jun 2024 08:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718631844;
	bh=uLLeDILrTUrLmixQIv26sjbAftpHHtSUTy41XBOPFqQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FXr/Kh5kyXChSNRCsxEi86Dl9sHBiD1m6ac68Vz+IHq0cncFIUFnjnCCoqWUPJeQz
	 j/TL7zyBdLtYjjsJeI5XoQCCG1rcyfk0VnPAj7NcbuCrSAS0uyOKcs62mgQ5HqSC+q
	 lfkAVpx1r83oqFsaVkBvUrZOCfetELfZu12TCsnE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HDi3HK004118
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 08:44:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 08:44:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 08:44:03 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HDi3JM118146;
	Mon, 17 Jun 2024 08:44:03 -0500
Message-ID: <0c14016a-05fe-498f-821e-44a47dae09bd@ti.com>
Date: Mon, 17 Jun 2024 08:44:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 am62xxsip-evm for multi-BSP support
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>, Denys <denys@konsulko.com>
References: <20240617083351.4120728-1-c-shilwant@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240617083351.4120728-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 13:44:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17752



On 6/17/2024 3:33 AM, Chirag Shilwant wrote:
> Update am62xxsip-evm machine configuration to support
> TI kernel 6.1 & ti-u-boot-2024.04

uboot is 2023.04...  ---------^


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> index c35edc6e..55bc530b 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
> +
> +UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> index 38fe04c9..8104329e 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
>   "
>   
>   UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
> +
> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

