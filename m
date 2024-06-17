Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B9CC2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 16:13:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.60652.1718640777328005802
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 09:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OL4mq3eo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HGCrRT041874;
	Mon, 17 Jun 2024 11:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718640773;
	bh=2FXIdGu6EslXek59AdRwtqLiwLR6J5g5ma5uPT6lfA4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OL4mq3eoK/VMdLbdkXMf+h65gosMiJlUcwv6PvnokaTLjTgnqYC4m+qsTeDuQdN5b
	 pyftmLPUYPNi6VOkhVrBIq7b6XtPeT3Jl2pc4mdCG11KCqTqpcjrByn35/LjYg962I
	 SyEgL51ydq9ek+/iG1BiqHTX1byCzuC4/0H/T8Y4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HGCrr8111611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 11:12:53 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 11:12:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 11:12:53 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HGCrRn012334;
	Mon, 17 Jun 2024 11:12:53 -0500
Message-ID: <90e133d8-05d5-4462-b479-afa8fadfbce6@ti.com>
Date: Mon, 17 Jun 2024 11:12:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] conf: machine: Update
 am62xxsip-evm for multi-BSP support
To: Denys Dmytriyenko <denis@denix.org>, <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>
References: <20240617135532.151410-1-c-shilwant@ti.com>
 <20240617161107.GD5475@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240617161107.GD5475@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 16:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17760



On 6/17/2024 11:11 AM, Denys Dmytriyenko wrote:
> On Mon, Jun 17, 2024 at 07:25:32PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
>> Update am62xxsip-evm machine configuration to support
>> TI kernel 6.1 & ti-u-boot-2023.04
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> v2: In commit message, s/ti-u-boot-2024.04/ti-u-boot-2023.04
> 
> Were am62p DM firmware changes supposed to be included here?

He already sent a v3 that removed those.

> 
>>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
>>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
>>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb     | 1 +
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc     | 6 ++++++
>>   4 files changed, 13 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> index c35edc6e..55bc530b 100644
>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>> @@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
>>   SYSFW_SUFFIX = "hs-fs"
>>   
>>   UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
>> +
>> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
>> +
>> +UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> index 38fe04c9..8104329e 100644
>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> @@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
>>   "
>>   
>>   UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
>> +
>> +UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> index 1ad236ce..3453725e 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
>> @@ -37,6 +37,7 @@ DM_FW_DIR = "ti-dm/${PLAT_SFX}"
>>   INSTALL_DM_FW_DIR  = "${nonarch_base_libdir}/firmware/${DM_FW_DIR}"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
>>   
>>   DM_FW_LIST = ""
>>   DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index bad8371f..0a52eded 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -37,6 +37,7 @@ DEPENDS:append:k3 = " ti-sci-fw"
>>   DEPENDS:append:k3r5 = " ti-sci-fw"
>>   
>>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>> +DM_FIRMWARE:am62pxx = "${@oe.utils.conditional("DISPLAY_CLUSTER_ENABLE", "1", "dss_display_share.wkup-r5f0_0.release.strip.out", "ipc_echo_testb_mcu1_0_release_strip.xer5f", d)}"
>>   
>>   PLAT_SFX = ""
>>   PLAT_SFX:j721e = "j721e"
>> @@ -68,8 +69,13 @@ COMPATIBLE_MACHINE = "(ti-soc)"
>>   
>>   BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
>>   
>> +TI_DM="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE}"
>> +
>>   EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
>>   
>> +# Use TI_DM argument only for am62pxx which has two DM firmwares in ti-linux-firmware
>> +EXTRA_OEMAKE:append:am62pxx = " TI_DM=${TI_DM}"
>> +
>>   PROVIDES += "u-boot"
>>   PKG:${PN} = "u-boot"
>>   PKG:${PN}-dev = "u-boot-dev"
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

