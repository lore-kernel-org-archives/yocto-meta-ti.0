Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE9EC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 16:19:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.49890.1681143585228823769
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 09:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=poBsxOEc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AGJcxK079301;
	Mon, 10 Apr 2023 11:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681143578;
	bh=Q5kfPJJaBkIhEnxq65Iz8UHNedUxO/aUjHLzAd5IOao=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=poBsxOEctljcJQKEx6vnLLGFLQjyr0aS+cHFdgb9tzPLOTobI6vPrj96JvyRuMrNC
	 cuNJ7bpXd5Rsh1oOblrjUhJEmP2I2h4yHEN3Tj1QFmZwRwQWi3Zvgd1b6K3sLpQzja
	 t6hMPxMW7P5dn9YwgoQrn5Z/75ciklRmL3dCLW6Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AGJcAK105833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 11:19:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 11:19:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 11:19:37 -0500
Received: from [10.250.32.15] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AGJblA000414;
	Mon, 10 Apr 2023 11:19:37 -0500
Message-ID: <2aad79b8-1cd6-6f66-ae7e-92a6705f3fba@ti.com>
Date: Mon, 10 Apr 2023 11:19:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 1/5] linux-bb.org: update to
 5.10.162 and dedicated branches
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Robert Nelson
	<robertcnelson@gmail.com>
References: <20230407203636.3265548-1-denis@denix.org>
 <20230407203636.3265548-2-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230407203636.3265548-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Apr 2023 16:19:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16338



On 4/7/2023 15:36, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> * Update both 32 and 64-bit trees to 5.10.162
> * Switch from using a common branch that gets periodically rebased to using
>    dedicated per-merge branches
> * Patch 32-bit defconfig to use LZMA compression instead of LZO, that is
>    being deprecated in OE-Core
> 
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   ...h-default-kernel-compression-to-LZMA.patch | 30 +++++++++++++++++++
>   .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 ++++++-----
>   2 files changed, 40 insertions(+), 8 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> new file mode 100644
> index 00000000..f6bff39f
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZMA.patch
> @@ -0,0 +1,30 @@
> +From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Fri, 7 Apr 2023 01:44:56 +0000
> +Subject: [PATCH] defconfig: switch default kernel compression to LZMA
> +
> +LZO compression and lzop tool haven't been maintained for long time and have
> +been removed in recent versions of OE-Core, even though Debian may still use
> +them. Switch to LZMA compression that is used by default in TI kernel config.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +---
> + arch/arm/configs/bb.org_defconfig | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb.org_defconfig
> +index 6bf0fb860683..7c035735172d 100644
> +--- a/arch/arm/configs/bb.org_defconfig
> ++++ b/arch/arm/configs/bb.org_defconfig
> +@@ -1,5 +1,5 @@
> + # CONFIG_LOCALVERSION_AUTO is not set
> +-CONFIG_KERNEL_LZO=y
> ++CONFIG_KERNEL_LZMA=y
> + CONFIG_SYSVIPC=y
> + CONFIG_POSIX_MQUEUE=y
> + CONFIG_NO_HZ_IDLE=y
> +--
> +2.25.1
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index 2c459ce5..19664ba8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -15,18 +15,20 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
>   
>   S = "${WORKDIR}/git"
>   
> -# 5.10.145 version
> -SRCREV = "9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6"
> -PV = "5.10.145+git${SRCPV}"
> -BRANCH = "5.10"
> +# 5.10.162 version for 32-bit
> +SRCREV:armv7a = "982fde4eb381f98ec8be946e8d33dd0c9f9416ab"
> +PV:armv7a = "5.10.162+git${SRCPV}"
> +BRANCH:armv7a = "v5.10.162-ti-r59"
>   
> -# 5.10.153 version
> -SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
> -PV:k3 = "5.10.153+git${SRCPV}"
> -BRANCH:k3 = "5.10-arm64"
> +# 5.10.162 version for 64-bit
> +SRCREV:aarch64 = "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
> +PV:aarch64 = "5.10.162+git${SRCPV}"
> +BRANCH:aarch64 = "v5.10.162-ti-arm64-r99"
>   
>   SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH}"

There is an additional patch in SRC_URI on master.  Does that patch 
remain in the SRC_URI, or should it split out like the armv7a below? 
I'm leaving it in the SRC_URI for my initial testing, I am just looking 
for clarity.


> +SRC_URI:append:armv7a = " file://0001-defconfig-switch-default-kernel-compression-to-LZMA.patch"
> +
>   DEFCONFIG_NAME = "bb.org_defconfig"
>   KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16327): https://lists.yoctoproject.org/g/meta-ti/message/16327
> Mute This Topic: https://lists.yoctoproject.org/mt/98132751/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

