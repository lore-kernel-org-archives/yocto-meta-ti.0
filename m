Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFB6C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 13:55:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.102413.1747229039054836682
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 May 2025 06:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gs6Nv1tB;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: v-singh1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EDNux12592597
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 08:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747229036;
	bh=IvNZ3PPiUfd0SwAENw5HB0oInlnJgiHAEwLdUldkKX0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Gs6Nv1tBAzU/n9cXrQNqqzXsNM9XVB9HxZtiKwXAPHO+ISXpSF0vLXFrlYREGURHe
	 zZGhW0Q0fZzVAFC+IduA+5Hm+1Sj0i12ouIErsDFjd2DH9+ydle8g8RdkOLJYrI2qZ
	 aKlZyJ1RSWTrj7orkhSZ50WzoXhe/WjC37n5HAU8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EDNudG094221
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 08:23:56 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 08:23:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 08:23:56 -0500
Received: from [172.24.227.153] (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EDNrxS115680;
	Wed, 14 May 2025 08:23:53 -0500
Message-ID: <bcde9d47-c65c-4356-b440-d7a65bd4104e@ti.com>
Date: Wed, 14 May 2025 18:53:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v4] meta-ti-bsp : Add build support for am62dxx-evm
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250514123917.169544-1-p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
In-Reply-To: <20250514123917.169544-1-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 May 2025 13:55:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18560


On 14/05/25 18:09, Paresh Bhagat wrote:
> The AM62D SoC is a high-performance Digital Signal Processing (DSP)
> device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores, and
> a Cx7 DSP core with Matrix Multiplication Accelerator (MMA). It features
> a range of peripherals, including multichannel audio serial ports,
> Ethernet, UARTs, SPI, I2C, USB, and more.
>
> This SoC is part of K3-AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
>
> The EVM board is a low-cost, expandable platform designed for the AM62D2
> SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
> jacks, USB ports, and more.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>
> Boot logs
> https://gist.github.com/paresh-bhagat12/ec22dd51789f081bb5116c01c748aa3f
>
> Change log:
>      v3->v4:
>          - Update changes to follow alphabetical order.
>
>      v2->v3:
>          - Drop cnm-wave-fw for am62d.
>          - Package correct c7 firmware for am62d.
>
>      v1->v2:
>          - Drop MACHINE_FEATURES for screen, touchsereen.
>          - Update ti-rtos-echo-test-fw to package firmware for am62d.
>
>   meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf    | 11 +++++++++++
>   meta-ti-bsp/conf/machine/am62dxx-evm.conf         | 15 +++++++++++++++
>   meta-ti-bsp/conf/machine/include/am62dxx.inc      | 15 +++++++++++++++
>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb      |  3 +++
>   meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb    |  2 ++
>   .../ti-rtos-fw/ti-rtos-echo-test-fw.bb            | 14 ++++++++++++++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      |  2 ++
>   .../optee/optee-os-ti-overrides.inc               |  1 +
>   8 files changed, 63 insertions(+)
>   create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm.conf
>   create mode 100644 meta-ti-bsp/conf/machine/include/am62dxx.inc
>
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
> new file mode 100644
> index 00000000..00906420
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62D HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62D EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62dx"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62dx_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> new file mode 100644
> index 00000000..f2da559c
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: AM62DXX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62DXX EVM
> +
> +require conf/machine/include/am62dxx.inc
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62d2 \
i think this "am62d2" is not correct, am62dx may be the correct one. 
Please check
> +"
> +
> +KERNEL_DEVICETREE = ""
> +
> +FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
> +
> +UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> new file mode 100644
> index 00000000..ac4e8e17
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> @@ -0,0 +1,15 @@
> +require conf/machine/include/k3.inc
> +require conf/machine/include/mc_k3r5.inc
> +
> +SOC_FAMILY:append = ":am62dxx"
> +
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +# Default tiboot3.bin on AM62D is for HS-FS
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
> +
> +# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am62x"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index a7d15e30..da6ad2e3 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -31,6 +31,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
> @@ -52,6 +53,7 @@ DM_FW_LIST:am65xx =  ""
>   DM_FW_LIST:am64xx =  ""
>   DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
>   DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
> +DM_FW_LIST:am62dxx = "${DM_FIRMWARE}"
>   DM_FW_LIST:am62lxx = ""
>   DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
>   
> @@ -86,6 +88,7 @@ do_deploy() {
>   ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
> +ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
>   ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index cf9566dc..654d456c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -31,6 +31,7 @@ PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>   
>   ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
>   
> @@ -50,6 +51,7 @@ ETH_FW_LIST:am64xx =  ""
>   ETH_FW_LIST:am62xx =  ""
>   ETH_FW_LIST:am62pxx = ""
>   ETH_FW_LIST:am62axx = ""
> +ETH_FW_LIST:am62dxx = ""
>   
>   do_install() {
>       # ETH firmware
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 86e319c7..a5efecea 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -22,6 +22,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
>   FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
> @@ -59,6 +60,7 @@ IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} $
>   IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
>   IPC_FW_LIST:am62pxx = "                            ${MCU_2_0_FW}"
>   IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
> +IPC_FW_LIST:am62dxx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
>   IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
>   IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
>   IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
> @@ -98,6 +100,13 @@ do_install:prepend:am62axx() {
>           )
>   }
>   
> +# Update the am62dxx ipc binaries to be consistent with other platforms
> +do_install:prepend:am62dxx() {
> +        ( cd ${S}/${IPC_FW_DIR}; \
> +                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
> +        )
> +}
> +
>   do_install() {
>       # IPC Firmware
>       for FW_NAME in ${IPC_FW_LIST}
> @@ -141,6 +150,11 @@ ALTERNATIVE:${PN}:am62axx = "\
>                       am62a-c71_0-fw        am62a-c71_0-fw-sec \
>                       "
>   
> +ALTERNATIVE:${PN}:am62dxx = "\
> +                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
> +                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> +                    "
> +
>   ALTERNATIVE:${PN}:j721e = "\
>                       j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
>                       j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 57bf7a4e..63900be0 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -58,6 +58,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>   PLAT_SFX:am62lxx = "am62lxx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
> @@ -75,6 +76,7 @@ PACKAGECONFIG:append:j722s = " dm"
>   PACKAGECONFIG:append:j742s2 = " dm"
>   PACKAGECONFIG:append:am62xx = " dm"
>   PACKAGECONFIG:append:am62axx = " dm"
> +PACKAGECONFIG:append:am62dxx = " dm"
>   PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
>   PACKAGECONFIG:append:am62pxx = " dm"
>   
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index ae6cca74..c37cf768 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -9,6 +9,7 @@ EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile:append:k3() {

