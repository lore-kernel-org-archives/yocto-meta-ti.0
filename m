Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA743C00145
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 21:07:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.56166.1670879249751284824
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 13:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 56B0840BA9;
	Mon, 12 Dec 2022 21:07:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgtnF2RscXby; Mon, 12 Dec 2022 21:07:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 194DA40A3F;
	Mon, 12 Dec 2022 21:07:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 068F01636AE; Mon, 12 Dec 2022 16:07:13 -0500 (EST)
Date: Mon, 12 Dec 2022 16:07:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	g-gupta@ti.com, s-adivi@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62axx evm
 configuration
Message-ID: <20221212210712.GF22689@denix.org>
References: <20221208201239.25465-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208201239.25465-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 21:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15453

On Fri, Dec 09, 2022 at 01:42:39AM +0530, Paresh Bhagat wrote:
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

What are the changes between patch revisions? It helps to document here what 
was changed and which review comments got addressed.


>  conf/machine/am62axx-evm-k3r5.conf            | 11 ++++++++
>  conf/machine/am62axx-evm.conf                 | 11 ++++++++
>  conf/machine/include/am62axx.inc              | 16 +++++++++++
>  recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb    |  4 +--
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  1 +
>  .../tifs-lpm-stub/tifs-lpm-stub_git.bb        |  2 +-
>  recipes-bsp/u-boot/u-boot-ti.inc              |  1 +
>  recipes-kernel/linux/kernel-rdepends.inc      |  2 ++
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 27 +++++++++++++++++++
>  9 files changed, 72 insertions(+), 3 deletions(-)
>  create mode 100644 conf/machine/am62axx-evm-k3r5.conf
>  create mode 100644 conf/machine/am62axx-evm.conf
>  create mode 100644 conf/machine/include/am62axx.inc
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
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm"
> +COMPATIBLE_MACHINE = "j721s2-evm|j721s2-hs-evm|j784s4-evm|j784s4-hs-evm|am62axx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -27,7 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGE
>  ALTERNATIVE_PRIORITY = "10"
>  
>  # Set up names for the firmwares
> -ALTERNATIVE_${PN}_j7 = "\
> +ALTERNATIVE_${PN} = "\
>                      wave521c_codec_fw.bin"
>  
>  do_install() {
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 79c39ee5..1b8530ec 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -39,6 +39,7 @@ SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>  SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
>  SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
>  
>  SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>  
> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> index 876036f2..30b2e315 100644
> --- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "am62xx-evm|am62xx-lp-evm"
> +COMPATIBLE_MACHINE = "am62xx|am62axx"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 97f9fa2b..90f60980 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -34,6 +34,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
>  PACKAGECONFIG_append_aarch64 = " atf optee"
>  PACKAGECONFIG_append_j7 = " dm"
>  PACKAGECONFIG_append_am62xx = " dm"
> +PACKAGECONFIG_append_am62axx = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 08f3f462..86d678ee 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -53,8 +53,10 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-evm = " cnm-wave-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j784s4-hs-evm = " cnm-wave-fw"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx = " cnm-wave-fw"
>  
>  # Add run-time dependency for TIFS Low Power Module stub
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-evm = " tifs-lpm-stub"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62axx = " tifs-lpm-stub"
>  
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 31212aae..59145740 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -24,6 +24,7 @@ PLAT_SFX_j784s4-hs-evm = "j784s4"
>  PLAT_SFX_am65xx = "am65xx"
>  PLAT_SFX_am64xx = "am64xx"
>  PLAT_SFX_am62xx = "am62xx"
> +PLAT_SFX_am62axx = "am62axx"
>  
>  FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -354,6 +355,13 @@ do_install_am62xx() {
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>  }
>  
> +do_install_am62axx() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    # DM+IPC Firmware
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +}
>  
>  do_deploy() {
>      install -d ${DEPLOYDIR}
> @@ -364,6 +372,11 @@ do_deploy_am62xx() {
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
>  }
>  
> +do_deploy_am62axx() {
> +    install -d ${DEPLOYDIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
> +}
> +
>  # Set up names for the firmwares
>  ALTERNATIVE_${PN}_am65xx = "\
>                      am65x-mcu-r5f0_0-fw \
> @@ -382,6 +395,11 @@ ALTERNATIVE_${PN}_am62xx = "\
>                      am62-main-r5f0_0-fw \
>                      "
>  
> +ALTERNATIVE_${PN}_am62axx = "\
> +                    am62a-mcu-r5f0_0-fw \
> +                    am62a-c71_0-fw \
> +                    "
> +
>  ALTERNATIVE_${PN}_j7-hs-evm = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
> @@ -514,6 +532,9 @@ TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
>  TARGET_MAIN_R5FSS0_0_am62xx = "am62-main-r5f0_0-fw"
>  TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
>  
> +TARGET_C7X_0_am62axx = "am62a-c71_0-fw"
> +TARGET_MCU_R5F0_0_am62axx = "am62a-mcu-r5f0_0-fw"
> +
>  TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
>  TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
> @@ -619,6 +640,9 @@ ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MC
>  ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
>  
> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
> +ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5F0_0}"
> +
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -699,6 +723,9 @@ ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_ec
>  ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
>  
> +ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> +ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/am62a-mcu-r5f0_0-fw"
> +
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> -- 
> 2.17.1
> 

