Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5487AC369CB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 00:40:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4358.1745455226820921539
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 17:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 847E740C6B;
	Thu, 24 Apr 2025 00:40:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07ihtE_t8Gbm; Thu, 24 Apr 2025 00:40:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 164CB40A30;
	Thu, 24 Apr 2025 00:40:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3D60C166993; Wed, 23 Apr 2025 20:40:17 -0400 (EDT)
Date: Wed, 23 Apr 2025 20:40:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, khasim@ti.com, v-singh1@ti.com, afd@ti.com
Subject: Re: [scarthgap][RFC] meta-ti-bsp : Add build support for
 am62dxx-evm
Message-ID: <20250424004017.GG13634@denix.org>
References: <20250423133624.2273605-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423133624.2273605-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Apr 2025 00:40:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18502

I noticed that AM62D re-uses all the firmware images from AM62A - is it 
expected? If so, what are the differences between them? Either a short 
summary in the commit log or a link to the part specification. Thanks.


On Wed, Apr 23, 2025 at 07:06:24PM +0530, Paresh Bhagat wrote:
> This commit adds Yocto build support for AM62D2-EVM, including kernel,
> U-Boot and root filesystem generation
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> 
> Boot logs : https://gist.github.com/paresh-bhagat12/ba7419eb1e7dbdf050a2099a39138985
> 
> Note : Kernel and U-boot support still pending.
> https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/patch/20250416164637.75591-1-p-bhagat@ti.com/
> https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/patch/20250416171321.156384-1-p-bhagat@ti.com/
> 
>  .../conf/machine/am62dxx-evm-k3r5.conf        | 11 ++++++++++
>  meta-ti-bsp/conf/machine/am62dxx-evm.conf     | 17 ++++++++++++++
>  meta-ti-bsp/conf/machine/include/am62dxx.inc  | 22 +++++++++++++++++++
>  .../cnm-wave-fw/cnm-wave-fw_git.bb            |  2 +-
>  meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  3 +++
>  .../recipes-bsp/ti-eth-fw/ti-eth-fw.bb        |  2 ++
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  2 ++
>  .../optee/optee-os-ti-overrides.inc           |  1 +
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 14 ++++++++++++
>  9 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm-k3r5.conf
>  create mode 100644 meta-ti-bsp/conf/machine/am62dxx-evm.conf
>  create mode 100644 meta-ti-bsp/conf/machine/include/am62dxx.inc
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
> index 00000000..163734c7
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
> @@ -0,0 +1,17 @@
> +#@TYPE: Machine
> +#@NAME: AM62DXX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62DXX EVM
> +
> +require conf/machine/include/am62dxx.inc
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am62d2 \
> +"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am62d2-evm.dtb \
> +"
> +
> +FIT_CONF_DEFAULT_DTB = "ti/k3-am62d2-evm.dtb"
> +
> +UBOOT_MACHINE = "am62dx_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> new file mode 100644
> index 00000000..22c839be
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
> @@ -0,0 +1,22 @@
> +require conf/machine/include/k3.inc
> +require conf/machine/include/mc_k3r5.inc
> +
> +SOC_FAMILY:append = ":am62dxx"
> +
> +# MACHINE_FEATURES += "screen touchscreen"
> +
> +TFA_K3_SYSTEM_SUSPEND = "1"
> +
> +# Default tiboot3.bin on AM62D is for HS-FS
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-fs-evm.bin"
> +
> +# Since default tiboot3.bin on AM62D is for HS-FS, add a version for GP
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-gp-evm.bin"
> +
> +# Since default tiboot3.bin on AM62D is for HS-FS, add a version for HS-SE
> +IMAGE_BOOT_FILES += "tiboot3-am62dx-hs-evm.bin"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am62x"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cnm-wave-fw"
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 43624183..9a9fcbd1 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
>  PV = "${CNM_WAVE521_FW_VERSION}"
>  PR = "${INC_PR}.1"
>  
> -COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|j742s2|am62axx|am62pxx"
> +COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|j742s2|am62axx|am62pxx|am62dxx"
>  
>  TARGET_WAVE521C = "wave521c_k3_codec_fw.bin"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 638138f4..d7eae77f 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -33,6 +33,7 @@ PLAT_SFX:am62xx = "am62xx"
>  PLAT_SFX:am62axx = "am62axx"
>  PLAT_SFX:am62lxx = "am62lxx"
>  PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"
>  
>  DM_FW_DIR = "ti-dm/${PLAT_SFX}"
>  
> @@ -51,6 +52,7 @@ DM_FW_LIST:am65xx =  ""
>  DM_FW_LIST:am64xx =  ""
>  DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
>  DM_FW_LIST:am62axx = "${DM_FIRMWARE}"
> +DM_FW_LIST:am62dxx = "${DM_FIRMWARE}"
>  DM_FW_LIST:am62lxx = ""
>  DM_FW_LIST:am62pxx = "${DM_FIRMWARE}"
>  
> @@ -85,6 +87,7 @@ do_deploy() {
>  ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
>  ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
>  ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
> +ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
>  ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
>  ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
>  ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index cf9566dc..654d456c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -31,6 +31,7 @@ PLAT_SFX:am64xx = "am64xx"
>  PLAT_SFX:am62xx = "am62xx"
>  PLAT_SFX:am62pxx = "am62pxx"
>  PLAT_SFX:am62axx = "am62axx"
> +PLAT_SFX:am62dxx = "am62axx"
>  
>  ETH_FW_DIR = "ti-eth/${PLAT_SFX}"
>  
> @@ -50,6 +51,7 @@ ETH_FW_LIST:am64xx =  ""
>  ETH_FW_LIST:am62xx =  ""
>  ETH_FW_LIST:am62pxx = ""
>  ETH_FW_LIST:am62axx = ""
> +ETH_FW_LIST:am62dxx = ""
>  
>  do_install() {
>      # ETH firmware
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 41d4abdd..e2d8fe3a 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -55,6 +55,7 @@ PLAT_SFX:am62xx = "am62xx"
>  PLAT_SFX:am62axx = "am62axx"
>  PLAT_SFX:am62lxx = "am62lxx"
>  PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"
>  
>  PACKAGECONFIG[ap-trusted-rom] = "BL1=${STAGING_DIR_HOST}/firmware/bl1.bin,,trusted-firmware-a"
>  PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
> @@ -72,6 +73,7 @@ PACKAGECONFIG:append:am62xx = " dm"
>  PACKAGECONFIG:append:am62axx = " dm"
>  PACKAGECONFIG:append:am62lxx = " ap-trusted-rom"
>  PACKAGECONFIG:append:am62pxx = " dm"
> +PACKAGECONFIG:append:am62dxx = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index ae6cca74..c37cf768 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -9,6 +9,7 @@ EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
>  EXTRA_OEMAKE:append:am62lxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>  EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>  EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62dxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>  EXTRA_OEMAKE:append:j722s = " CFG_TEE_CORE_LOG_LEVEL=1"
>  
>  do_compile:append:k3() {
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 00112017..ba564429 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -23,6 +23,7 @@ PLAT_SFX:am64xx = "am64xx"
>  PLAT_SFX:am62xx = "am62xx"
>  PLAT_SFX:am62axx = "am62axx"
>  PLAT_SFX:am62pxx = "am62pxx"
> +PLAT_SFX:am62dxx = "am62axx"
>  
>  FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>  require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -58,6 +59,7 @@ IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} $
>  IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
>  IPC_FW_LIST:am62pxx = "                            ${MCU_2_0_FW}"
>  IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
> +IPC_FW_LIST:am62dxx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
>  IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
>  IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
>  IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
> @@ -97,6 +99,13 @@ do_install:prepend:am62axx() {
>          )
>  }
>  
> +# Update the am62dxx ipc binaries to be consistent with other platforms
> +do_install:prepend:am62dxx() {
> +        ( cd ${S}/${IPC_FW_DIR}; \
> +                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
> +        )
> +}
> +
>  do_install() {
>      # IPC Firmware
>      for FW_NAME in ${IPC_FW_LIST}
> @@ -140,6 +149,11 @@ ALTERNATIVE:${PN}:am62axx = "\
>                      am62a-c71_0-fw        am62a-c71_0-fw-sec \
>                      "
>  
> +ALTERNATIVE:${PN}:am62dxx = "\
> +                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
> +                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> +                    "
> +
>  ALTERNATIVE:${PN}:j721e = "\
>                      j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
>                      j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
> -- 
> 2.34.1

