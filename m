Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CE2C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:14:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11085.1698423237988286081
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 09:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hxe/u2zw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RGDuM5019962;
	Fri, 27 Oct 2023 11:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698423236;
	bh=Vxb6bjUMotVOeVBokkSKL0fvhFfy8RKAXMjSi1U/IR8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Hxe/u2zwMfhBL0ZYUo+GBVXTsWUq1nVlJT6Mg284pwHJqt36oKbZEl9EBly9TBK1+
	 goTx89U8Rl5dqNlzCFEyiTspicz9daQRpZe/0mEpHM59NtXbyZF3XYvLIqc3rzvPyB
	 pp6wpXWpUvlvSSJH1q4PlMLU0rcravwdZXcVoX4Y=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RGDuLt024969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 11:13:56 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 11:13:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 11:13:56 -0500
Received: from [10.250.38.120] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RGDuHV017112;
	Fri, 27 Oct 2023 11:13:56 -0500
Message-ID: <4e25ed89-bd93-43c1-b40c-c85a0f679708@ti.com>
Date: Fri, 27 Oct 2023 11:13:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Add Support for
 am62pxx-evm
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231026223930.5086-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231026223930.5086-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 16:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17211

On 10/26/23 5:39 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Chirag Shilwant <c-shilwant@ti.com>
> 
> - Add A53 and R5 machine configurations for am62pxx-evm.
> - Add firmware overrides.
> - Add u-boot overrides.
> - Add cnm-wave support.
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>   .../conf/machine/am62pxx-evm-k3r5.conf        | 11 +++++++++++
>   meta-ti-bsp/conf/machine/am62pxx-evm.conf     | 13 +++++++++++++
>   meta-ti-bsp/conf/machine/include/am62pxx.inc  | 19 +++++++++++++++++++
>   .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  5 +++++
>   .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 ++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 ++
>   .../recipes-security/optee/optee-os-ti.inc    |  1 +
>   .../ti-rtos-bin/ti-rtos-firmware.bb           | 19 +++++++++++++++++++
>   9 files changed, 73 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62pxx-evm.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/am62pxx.inc
> 
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> new file mode 100644
> index 00000000..33254bf2
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62PX EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62px"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62px_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> new file mode 100644
> index 00000000..c0c62592
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM62PX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62PX EVM
> +
> +require conf/machine/include/am62pxx.inc
> +
> +KERNEL_DEVICETREE_PREFIX = "ti/k3-am62p5"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am62p5-sk.dtb \
> +"
> +
> +UBOOT_MACHINE = "am62px_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> new file mode 100644
> index 00000000..d61ad62b
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> @@ -0,0 +1,19 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY:append = ":am62pxx"
> +
> +MACHINE_FEATURES += "screen gpu"
> +
> +require conf/machine/include/mesa-pvr.inc
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""
> +
> +# Default tiboot3.bin on AM62Px is for HS-FS
> +IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
> +
> +TFA_BOARD = "lite"
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +OPTEEMACHINE = "k3-am62px"

Not a valid machine, did you mean "k3-am62x"?

[...]

>   FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -56,6 +57,7 @@ IPC_FW_LIST = ""
>   IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
>   IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
>   IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
>  +IPC_FW_LIST:am62pxx =  "                            ${MCU_2_0_FW}"

Alignment seems wrong here and in some other spots, remove a space if you copied
the line from the shorter am62xx.

Andrew

