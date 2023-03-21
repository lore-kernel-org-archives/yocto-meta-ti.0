Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4D1C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 16:11:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.17901.1679415092486433213
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 09:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UXAJCdUe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LGBRaH041913;
	Tue, 21 Mar 2023 11:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679415087;
	bh=4HumplzgsNGKscJRP2V5c85giAS6FE7ARTAAD4Vr7zA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=UXAJCdUeci4OCf1nWOVWGP6wN+jzGI47bzNyPrS+9uVrY0//pH9WbK8gh3m2ADSVO
	 I838WB3vveHCwNOf20g8+OFSHkmg8tW0+8+Zraaa5lIHzP5RJ0JHYAWxvPMp7sbOb1
	 Q2jujMT5AJOUhFpzkNkLLfGx094A5viNv7RIrZg8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LGBRDG023692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Mar 2023 11:11:27 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 11:11:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 11:11:27 -0500
Received: from [10.250.32.15] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LGBR8Z108097;
	Tue, 21 Mar 2023 11:11:27 -0500
Message-ID: <5f879b75-202e-5131-629d-6342f919f9ba@ti.com>
Date: Tue, 21 Mar 2023 11:11:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti] [kirkstone][PATCH 11/54] machine: Add AM62Q HS-SE evm
 configuration
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20230320033840.1193963-1-denis@denix.org>
 <20230320033840.1193963-12-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230320033840.1193963-12-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 16:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16219



On 3/19/2023 22:37, Denys Dmytriyenko wrote:
> From: Chirag Shilwant <c-shilwant@ti.com>
> 
> Lets add the basic AM62Q HS-SE configuration.
> - Add configurations.
> - Add ti-sci-firmware overrides.
> - Add u-boot overrides.
> - Add optee overrides.
> - Add ti-rtos-firmware overrides.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../conf/machine/am62xx-lp-evm-k3r5-hs-se.conf   | 14 ++++++++++++++
>   meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 12 ++++++++++--
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      |  6 +++++-
>   meta-ti-bsp/conf/machine/include/am62xx-lp.inc   | 16 ++++++++++++++++
>   meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf     |  3 +++
>   .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       |  1 +
>   6 files changed, 49 insertions(+), 3 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/am62xx-lp.inc
>   create mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> new file mode 100644
> index 00000000..11e70342
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM62xx LPSK HS-SE EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-SE EVM (R5F core)
> +
> +# Booting HS-SE requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":k3r5-hs-se"
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +
> +UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index ca4ced5a..15ecc677 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -1,11 +1,19 @@
>   #@TYPE: Machine
> -#@NAME: AM62XX LP EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
> +#@NAME: AM62XX LP GP EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
>   
>   require conf/machine/include/k3r5.inc
> +SOC_FAMILY:append = ":k3r5-gp"
>   
>   SYSFW_SOC = "am62x"
>   SYSFW_CONFIG = "evm"
>   SYSFW_SUFFIX = "gp"
>   
> +SYSFW_TIBOOT3_SYMLINK = ""
> +
>   UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> index ec9ce596..be95f33a 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -2,7 +2,7 @@
>   #@NAME: AM62XX LP EVM
>   #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
>   
> -require conf/machine/include/am62xx.inc
> +require conf/machine/include/am62xx-lp.inc
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-am62x-lp-sk.dtb \
> @@ -11,4 +11,8 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am625-sk-csi2-ov5640.dtbo \
>   "
>   
> +SPL_BINARY = "tispl.bin_HS"
> +UBOOT_BINARY = "u-boot.img_HS"
> +UBOOT_SYMLINK = "u-boot.img"
> +
>   UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> new file mode 100644
> index 00000000..df113003
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
> @@ -0,0 +1,16 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY:append = ":am62xx"
> +
> +MACHINE_FEATURES += "screen touchscreen"
> +
> +SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +# Default tiboot3.bin on AM62x LP is for HS-SE
> +BBMULTICONFIG += "k3r5-hs-se"
> +do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am62x"
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf b/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
> new file mode 100644
> index 00000000..7e3d7dae
> --- /dev/null
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE:append = "-hs-se"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 37d022e9..77709689 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -39,6 +39,7 @@ SYSFW_PREFIX:j784s4-evm-k3r5 = "fs"
>   SYSFW_PREFIX:j784s4-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX:am62xx-evm-k3r5 = "fs"
>   SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"

Ooops.  We missed a dunfell to kirkstone syntax change.  No need to send 
an updated patch, I will just do a git fixup and address it.

Thanks for your hard work on these patch sync ups, Denys.  It is very 
much appreciated.


 >   SYSFW_PREFIX:am62axx-evm-k3r5 = "fs"
 >
>   SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16019): https://lists.yoctoproject.org/g/meta-ti/message/16019
> Mute This Topic: https://lists.yoctoproject.org/mt/97724610/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

