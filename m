Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9491C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 00:17:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1678.1672964223977223605
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 16:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R3RbgiU7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3060H07K036268;
	Thu, 5 Jan 2023 18:17:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672964220;
	bh=lagYNYNVm+y9qbnsS/K5z6KFOxaVUS6Zwcm0YFlGSfk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R3RbgiU72vYT4gFDyf/z4b0oAJQY7ZNqxCNfFCogVhx8rKaTTyrlSHEOUV8iE0wSc
	 9i74HWoiA2GxM3j3vb517vyyPMuT9hX2Z4JeivvdVpY+/RRbXsznq7go93Lz7ERN1e
	 V9H06s/jG0Pd17Ze9FYgU+K2VmY5H/pnNV7OwILk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3060H0Aq071928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Jan 2023 18:17:00 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 5
 Jan 2023 18:17:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 5 Jan 2023 18:17:00 -0600
Received: from [10.247.24.212] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3060H0Pn021244;
	Thu, 5 Jan 2023 18:17:00 -0600
Message-ID: <1a082c8e-ed1b-335e-b36b-a8335f60dbff@ti.com>
Date: Thu, 5 Jan 2023 18:16:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62axx evm
 configuration
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <g-gupta@ti.com>, <s-adivi@ti.com>,
        "Gurudasani, Kamlesh"
	<k-gurudasani@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>, <m-chawdhry@ti.com>
References: <20221208201239.25465-1-p-bhagat@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20221208201239.25465-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Jan 2023 00:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15533

Paresh,

On 12/8/2022 2:12 PM, Paresh Bhagat wrote:
> Lets add the basic AM62Axx-evm configuration.
> - Add configurations.
> - Add firmware overrides.
> - Add u-boot overrides.
> - Add tifs-lpm-stub.
> - Add cnm-wave-fw.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   conf/machine/am62axx-evm-k3r5.conf            | 11 ++++++++
>   conf/machine/am62axx-evm.conf                 | 11 ++++++++
>   conf/machine/include/am62axx.inc              | 16 +++++++++++
>   recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  4 +--
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
>   .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  2 +-
>   recipes-bsp/u-boot/u-boot-ti.inc              |  1 +
>   recipes-kernel/linux/kernel-rdepends.inc      |  2 ++
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 27 +++++++++++++++++++

You might need to send a followup patch to update the remote core firmwares.

Please check reference patch: 
https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=f3733afe9c7de77b087da51c84bf5df0c4a14bb5

Error we see with bootup on a 62axx board currently is as follows
...
Failed to load '/lib/firmware/am62a-mcu-r5f0_0-fw-sec'
Failed to load '/lib/firmware/am62a-c71_0-fw-sec'
...


>   9 files changed, 72 insertions(+), 3 deletions(-)
>   create mode 100644 conf/machine/am62axx-evm-k3r5.conf
>   create mode 100644 conf/machine/am62axx-evm.conf
>   create mode 100644 conf/machine/include/am62axx.inc
> 
> diff --git a/conf/machine/am62axx-evm-k3r5.conf b/conf/machine/am62axx-evm-k3r5.conf
> new file mode 100644
> index 00000000..ca30537f
> --- /dev/null
> +++ b/conf/machine/am62axx-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62AXX EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62ax"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +
> +UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
> new file mode 100644
> index 00000000..4eb179f3
> --- /dev/null
> +++ b/conf/machine/am62axx-evm.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62AXX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62AXX EVM
> +
> +require conf/machine/include/am62axx.inc
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am62a7-sk.dtb \
> +"
> +
> +UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
> diff --git a/conf/machine/include/am62axx.inc b/conf/machine/include/am62axx.inc
> new file mode 100644
> index 00000000..383d1c3f
> --- /dev/null
> +++ b/conf/machine/include/am62axx.inc
> @@ -0,0 +1,16 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY_append = ":am62axx"
> +
> +MACHINE_FEATURES += "screen touchscreen"
> +
> +SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am62x"
> +OPTEEOUTPUTMACHINE = "k3"
> diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index c904ba62..fac7bb06 100644
> --- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
>   
>   CLEANBROKEN = "1"
>   
> -COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm"
> +COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -27,7 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGE
>   ALTERNATIVE_PRIORITY = "10"
>   
>   # Set up names for the firmwares
> -ALTERNATIVE_${PN}_j7 = "\
> +ALTERNATIVE_${PN} = "\
>                       wave521c_codec_fw.bin"
>   
>   do_install() {
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 79c39ee5..1b8530ec 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
>   
>   SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>   
> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> index 876036f2..30b2e315 100644
> --- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
>   
> -COMPATIBLE_MACHINE = "am62xx-evm|am62xx-lp-evm"
> +COMPATIBLE_MACHINE = "am62xx|am62axx"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 97f9fa2b..90f60980 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -34,6 +34,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
>   PACKAGECONFIG_append_aarch64 = " atf optee"
>   PACKAGECONFIG_append_j7 = " dm"
>   PACKAGECONFIG_append_am62xx = " dm"
> +PACKAGECONFIG_append_am62axx = " dm"
>   
>   COMPATIBLE_MACHINE = "(ti-soc)"
>   
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 08f3f462..86d678ee 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -53,8 +53,10 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm = " cnm-wave-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm = " cnm-wave-fw"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx = " cnm-wave-fw"
>   
>   # Add run-time dependency for TIFS Low Power Module stub
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-evm = " tifs-lpm-stub"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx = " tifs-lpm-stub"
>   
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 31212aae..59145740 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm = "j784s4"
>   PLAT_SFX_am65xx = "am65xx"
>   PLAT_SFX_am64xx = "am64xx"
>   PLAT_SFX_am62xx = "am62xx"
> +PLAT_SFX_am62axx = "am62axx"
>   
>   FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -354,6 +355,13 @@ do_install_am62xx() {
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>   }
>   
> +do_install_am62axx() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    # DM+IPC Firmware
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +}
>   
>   do_deploy() {
>       install -d ${DEPLOYDIR}
> @@ -364,6 +372,11 @@ do_deploy_am62xx() {
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
>   }
>   
> +do_deploy_am62axx() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
> +}
> +
>   # Set up names for the firmwares
>   ALTERNATIVE_${PN}_am65xx = "\
>                       am65x-mcu-r5f0_0-fw \
> @@ -382,6 +395,11 @@ ALTERNATIVE_${PN}_am62xx = "\
>                       am62-main-r5f0_0-fw \
>                       "
>   
> +ALTERNATIVE_${PN}_am62axx = "\
> +                    am62a-mcu-r5f0_0-fw \
> +                    am62a-c71_0-fw \
> +                    "
> +
>   ALTERNATIVE_${PN}_j7-hs-evm = "\
>                       j7-mcu-r5f0_0-fw \
>                       j7-mcu-r5f0_1-fw \
> @@ -514,6 +532,9 @@ TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
>   TARGET_MAIN_R5FSS0_0_am62xx = "am62-main-r5f0_0-fw"
>   TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
>   
> +TARGET_C7X_0_am62axx = "am62a-c71_0-fw"
> +TARGET_MCU_R5F0_0_am62axx = "am62a-mcu-r5f0_0-fw"
> +
>   TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
>   TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
>   TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
> @@ -619,6 +640,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MC
>   ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>   ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
>   
> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
> +ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5F0_0}"
> +
>   ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>   ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>   ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -699,6 +723,9 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_ec
>   ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>   ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
>   
> +ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> +ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/am62a-mcu-r5f0_0-fw"
> +
>   ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>   ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>   ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"

