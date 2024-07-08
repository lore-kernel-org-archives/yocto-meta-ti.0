Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B83C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 14:04:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.80500.1720447485716810232
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Jul 2024 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GiA0xpdj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468E4iYN043835;
	Mon, 8 Jul 2024 09:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720447484;
	bh=sK0AUISeVFRDnAMBXAkRsrR0GBI9IgshZADHScxaXo8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GiA0xpdjHjSLkHb3sYFydtQDx06lTsir8tatSu/qF9GG3DCj2+LHPxwmkWglkjdEj
	 qp1p70acGFAbSheNBF3ow5ip8doDzC5dr4/4G6tEZ+b/+dM/MAPHetI2jUaFs0Ovo1
	 vvJVg3Zwez8TVJZbdTaaQ4uoVQNUF5Pc56mhZ8cM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468E4iRr118544
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 09:04:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 09:04:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 09:04:43 -0500
Received: from [10.250.34.81] ([10.250.34.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468E4h3p055220;
	Mon, 8 Jul 2024 09:04:43 -0500
Message-ID: <390e677c-5027-4d0b-bf7c-78664ea12d88@ti.com>
Date: Mon, 8 Jul 2024 09:04:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v3] conf: machine:
 am62*-evm-k3r5.conf: apply fragment for enabling USB DFU
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <vigneshr@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20240708123653.2200919-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240708123653.2200919-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 14:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17833



On 7/8/2024 7:36 AM, Siddharth Vadapalli wrote:
> The config fragment "am62x_r5_usbdfu.config" is applicable to AM62x,
> AM62x-SIP, AM62x-LP-EVM, AM62Ax and AM62Px devices and enables USB DFU boot
> support at the R5 stage of boot.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> ff9bf7b9 CI/CD Auto-Merger: cicd.scarthgap.202407071800
> of scarthgap-next branch of meta-ti tree.
> 
> v2:
> https://lore.kernel.org/r/20240708060054.1985156-1-s-vadapalli@ti.com/
> Changes since v2:
> - Based on feedback from Chirag Shilwant <c-shilwant@ti.com> at:
>    https://lore.kernel.org/r/32db66e5-730c-42ec-9145-72abdf35b6d1@ti.com/
>    the subject-prefix has been updated to master/scarthgap and the config
>    fragment for USB DFU is being applied to AM62x SIP as well.
> 
> v1:
> https://lore.kernel.org/r/20240708052457.1974547-1-s-vadapalli@ti.com/
> Changes since v1:
> - As pointed out by Vignesh Raghavendra <vigneshr@ti.com> at:
>    https://lore.kernel.org/r/829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com/
>    the A53 defconfigs already include the "am62x_a53_usbdfu.config" config
>    fragment. Hence, they are not required in the am62*-evm.conf files and
>    have been dropped in this patch.
> - Commit message has been updated accordingly.
> 
> Regards,
> Siddharth.
> 
>   meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 1 +
>   meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 1 +
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 1 +
>   meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 +
>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> index 2af3317e..5ba8c27e 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
> @@ -9,3 +9,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"

This will not work with the new BSP system we have in meta-ti.  Since we 
are trying to have support for multiple kernel/uboot/graphics 
combinations we need to be aware of which of those other combinations 
that are present in the BSP file will or wont work with the setting we 
are trying to do.

In this case, I see am62x_r5_usbdfu.config in ti-u-boot-2024.04 and in 
upstream, but I do not see it in ti-u-boot-2023.04.  So the correct 
setting here would be:

UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = ""


> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> index 36915381..9b68e626 100644
> --- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62px_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
For this one, there are already UBOOT_CONFIG_FRAGMENTS later in the file 
that you are not taking into account by just setting the variable.  This 
file is going to be a little more difficult to do correctly.

Since we already have a setting with an override, I think the best plan 
would be to rework the existing logic while adding your changes.  Add 
some intermediate variables to construct the final value.  Something 
like this:

BASE_FRAGMENTS = "am62x_r5_usbdfu.config"
BASE_FRAGMENTS:ti-bsp-6_1 = ""

# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which 
has to be build
# along with the base defconfig mentioned in UBOOT_MACHINE. Refer 
u-boot-mergeconfig.inc
# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
# For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
# Hence, disable the A53 based splash screen using the 
am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
PRUNE_SPLASHSCREEN_FRAGMENT = 
"${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 
'am62x_evm_prune_splashscreen.config', '', d)}"
PRUNE_SPLASHSCREEN_FRAGMENT :bsp-ti-6_1 = 
"${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 
'am62px_evm_prune_splashscreen.config', '', d)}"

UBOOT_CONFIG_FRAGMENTS = " $(BASE_FRAGMENTS) $(PRUNE_SPLASHSCREEN_FRAGMENT)"


> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 548369ca..85c48334 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"

Same as the first comment.

> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index 52b69a72..24f96858 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -10,3 +10,4 @@ SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "hs-fs"
>   
>   UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"

Same as the first comment.

> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> index 55bc530b..b6045d89 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -13,3 +13,4 @@ UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
>   UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
>   
>   UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
> +UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"

For this one there is already a setting for bsp-ti-6_1 so this is 
technically ok.  But in general we should try and have the variables in 
"correct" order.  The setting of the default, followed by the overrides 
of the variable.  So:

UBOOT_CONFIG_FRAGMENTS = "am62x_r5_usbdfu.config"
UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

