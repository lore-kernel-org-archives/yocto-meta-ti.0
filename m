Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D00C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 20:17:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2832.1664223458341642276
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 13:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GkE5HItg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28QKHXiU126687;
	Mon, 26 Sep 2022 15:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664223453;
	bh=+HXw1BsFykf/BaBdKtmN2IrwaRMmmz/agzsp6kVQ7Q0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GkE5HItgJxRXWO2GrjpSP5YEluGmxoKAVOzhy3kRo68FyQ9G6fHtmLdeZz7c8EcFK
	 HNm8e3D64pGExgAGYGGDImyZ3hbgeGM+0eCSN4AvsqJpWk4dPd47jnAYE2XRy1TSjJ
	 M/3CGXMPanmMDtB5gRocNyTbVTAOd4Jzb1GxO01w=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28QKHX3h130904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Sep 2022 15:17:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 26
 Sep 2022 15:17:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 26 Sep 2022 15:17:32 -0500
Received: from [10.250.33.43] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28QKHWx7114702;
	Mon, 26 Sep 2022 15:17:32 -0500
Message-ID: <acb01a5b-96bb-a0e4-3333-bc555ed87bf5@ti.com>
Date: Mon, 26 Sep 2022 15:17:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][master/dunfell][PATCH] machine: Add j784s4-evm
 configuration.
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220926174026.17057-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220926174026.17057-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Sep 2022 20:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15095

On 9/26/22 12:40 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Adding support for j784s4-evm:
> - Add configurations.
> - Add firmware.
> - Add u-boot.
> - Add gpu support.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   conf/machine/j784s4-evm-k3r5.conf             | 11 +++
>   conf/machine/j784s4-evm.conf                  | 27 +++++++
>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  2 +-
>   .../ti-img-rogue-driver_1.15.6133109.bb       |  6 +-
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
>   .../ti-img-rogue-umlibs_1.15.6133109.bb       |  5 +-
>   recipes-kernel/linux/kernel-rdepends.inc      |  2 +
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 75 +++++++++++++++++++
>   8 files changed, 124 insertions(+), 5 deletions(-)
>   create mode 100644 conf/machine/j784s4-evm-k3r5.conf
>   create mode 100644 conf/machine/j784s4-evm.conf
> 
> diff --git a/conf/machine/j784s4-evm-k3r5.conf b/conf/machine/j784s4-evm-k3r5.conf
> new file mode 100644
> index 00000000..04feebc6
> --- /dev/null
> +++ b/conf/machine/j784s4-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "j784s4"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +
> +UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
> new file mode 100644
> index 00000000..957e5766
> --- /dev/null
> +++ b/conf/machine/j784s4-evm.conf
> @@ -0,0 +1,27 @@
> +#@TYPE: Machine
> +#@NAME: J784S4 EVM
> +#@DESCRIPTION: Machine configuration for the TI J784S4 EVM
> +
> +require conf/machine/include/j7.inc
> +
> +MACHINE_FEATURES += "gpu"
> +
> +SERIAL_CONSOLES = "115200;ttyS10"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +TFA_K3_USART = "0x8"
> +OPTEE_K3_USART = "0x8"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-j784s4-evm.dtb \
> +"
> +
> +UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
> +
> +# J721S2 supports multi-certificate images, use the same
> +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> +
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +TFA_BOARD = "j784s4"
> +
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 83619090..cca5704e 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>   
>   CLEANBROKEN = "1"
>   
> -COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm"
> +COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 3dbc87b6..1127c5d1 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
>   PR = "${MACHINE_KERNEL_PR}"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
> +COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|j784s4-evm|am62xx"


j784s4-evm.conf should include a j784s4.inc family file, then here
you'll only need |j784s4|. Makes it easier when adding machines
based on the j784s4 SoC.


>   
>   DEPENDS = "virtual/kernel"
>   
> @@ -26,17 +26,19 @@ SRC_URI = " \
>   
>   S = "${WORKDIR}/git"

...

> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -19,6 +19,7 @@ PLAT_SFX_j7200-evm = "j7200"
>   PLAT_SFX_j7200-hs-evm = "j7200"
>   PLAT_SFX_j721s2-evm = "j721s2"
>   PLAT_SFX_j721s2-hs-evm = "j721s2"
> +PLAT_SFX_j784s4-evm = "j784s4"
>   PLAT_SFX_am65xx = "am65xx"
>   PLAT_SFX_am64xx = "am64xx"
>   PLAT_SFX_am62xx = "am62xx"
> @@ -247,6 +248,26 @@ do_install_j721s2-hs-evm() {
>       # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>   }
>   
> +do_install_j784s4-evm() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    install -d ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +}
> +


I wonder if there is a way to better add these than just long lists,
this file's size is getting out of hand :/

Andrew


>   do_install_am65xx() {
>       install -d ${LEGACY_IPC_FW_DIR}
>       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> @@ -372,6 +393,21 @@ ALTERNATIVE_${PN}_j721s2-hs-evm = "\
>                       j721s2-c71_1-fw-sec \
>                       "
>   
> +ALTERNATIVE_${PN}_j784s4-evm = "\
> +                    j784s4-mcu-r5f0_0-fw \
> +                    j784s4-mcu-r5f0_1-fw \
> +                    j784s4-main-r5f0_0-fw \
> +                    j784s4-main-r5f0_1-fw \
> +                    j784s4-main-r5f1_0-fw \
> +                    j784s4-main-r5f1_1-fw \
> +                    j784s4-main-r5f2_0-fw \
> +                    j784s4-main-r5f2_1-fw \
> +                    j784s4-c71_0-fw \
> +                    j784s4-c71_1-fw \
> +                    j784s4-c71_2-fw \
> +                    j784s4-c71_3-fw \
> +                    "
> +
>   # Set up link names for the firmwares
>   
>   TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> @@ -442,6 +478,19 @@ TARGET_MAIN_R5FSS1_1_SIGNED_j721s2-hs-evm = "j721s2-main-r5f1_1-fw-sec"
>   TARGET_C7X_0_SIGNED_j721s2-hs-evm = "j721s2-c71_0-fw-sec"
>   TARGET_C7X_1_SIGNED_j721s2-hs-evm = "j721s2-c71_1-fw-sec"
>   
> +TARGET_MCU_R5FSS0_0_j784s4-evm = "j784s4-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j784s4-evm = "j784s4-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j784s4-evm = "j784s4-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j784s4-evm = "j784s4-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_j784s4-evm = "j784s4-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_j784s4-evm = "j784s4-main-r5f1_1-fw"
> +TARGET_MAIN_R5FSS2_0_j784s4-evm = "j784s4-main-r5f2_0-fw"
> +TARGET_MAIN_R5FSS2_1_j784s4-evm = "j784s4-main-r5f2_1-fw"
> +TARGET_C7X_0_j784s4-evm = "j784s4-c71_0-fw"
> +TARGET_C7X_1_j784s4-evm = "j784s4-c71_1-fw"
> +TARGET_C7X_2_j784s4-evm = "j784s4-c71_2-fw"
> +TARGET_C7X_3_j784s4-evm = "j784s4-c71_3-fw"
> +
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>   
> @@ -496,6 +545,19 @@ ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TA
>   ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
>   ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
>   
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
> +
>   # Create the firmware alternatives
>   
>   ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> @@ -552,6 +614,19 @@ ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc
>   ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
>   ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
>   
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> +ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
> +ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71"
> +ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71"
> +
>   ALTERNATIVE_PRIORITY = "10"
>   
>   # make sure that lib/firmware, and all its contents are part of the package
> 
> 

