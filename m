Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EF4C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:43:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.58759.1670885024087786968
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 14:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BA7B40BA9;
	Mon, 12 Dec 2022 22:43:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j50TursrNAEP; Mon, 12 Dec 2022 22:43:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B84040A3F;
	Mon, 12 Dec 2022 22:43:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A9B0F1636AE; Mon, 12 Dec 2022 17:43:30 -0500 (EST)
Date: Mon, 12 Dec 2022 17:43:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 3/7] conf: machine: Use new
 J7 SoC names over specific board names
Message-ID: <20221212224330.GK22689@denix.org>
References: <20221207214312.21735-1-afd@ti.com>
 <20221207214312.21735-3-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207214312.21735-3-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 22:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15458

On Wed, Dec 07, 2022 at 03:43:08PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Now that we have SoC names, we can avoid adding features based on the
> board name. We expect folks to create their own boards based on these
> SoCs, and so using the TI made EVM board name everywhere adds extra churn
> when adding a new board. Plus it is more correct for most of these
> features as they depend on the SoC, not on the EVM board.
> 
> One other thing we do here is to not use the generic "j7" name,
> the current and future J7 devices are far to feature diverse
> to group at this level. Grouping like that will lead to the wrong
> things getting enabled as new J7 SoCs are added.

Heh, I had most of these similar cleanup changes already staged locally since 
my last sync-up with Dunfell, but didn't have time to finish them and submit.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../cnm-wave-fw/cnm-wave-fw_git.bb            |  3 +-
>  .../ti-img-encode-decode/vxd-dec-fw_git.bb    |  2 +-
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  5 ++-
>  .../recipes-kernel/linux/kernel-rdepends.inc  |  2 +-
>  .../linux/linux-ti-staging_5.10.bb            |  2 +-
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 39 +++++++++----------
>  .../ti-rtos-bin/ti-rtos-metadata.bb           |  6 +--
>  .../recipes-bsp/pru/pru-icss_git.bb           | 10 ++---
>  8 files changed, 34 insertions(+), 35 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 0e8ed897..e7aa9ef4 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -27,8 +27,7 @@ ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${nonarch_base_libdir}/firmware/cnm
>  ALTERNATIVE_PRIORITY = "10"
>  
>  # Set up names for the firmwares
> -ALTERNATIVE_${PN}:j7 = "\
> -                    wave521c_codec_fw.bin"
> +ALTERNATIVE_${PN} = "wave521c_codec_fw.bin"
>  
>  do_install() {
>  	install -d ${D}${nonarch_base_libdir}/firmware/cnm
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> index 7727e9af..bd103198 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -9,7 +9,7 @@ PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
> -COMPATIBLE_MACHINE = "j7"
> +COMPATIBLE_MACHINE = "j721e"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index 5127e137..6f5b6313 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -32,7 +32,10 @@ PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/b
>  PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
>  
>  PACKAGECONFIG:append:aarch64 = " atf optee"
> -PACKAGECONFIG:append:j7 = " dm"
> +PACKAGECONFIG:append:j721e = " dm"
> +PACKAGECONFIG:append:j7200 = " dm"
> +PACKAGECONFIG:append:j721s2 = " dm"
> +PACKAGECONFIG:append:j784s4 = " dm"
>  PACKAGECONFIG:append:am62xx = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 43cd31fe..54e6fdc6 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -26,7 +26,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cadence-mhdp-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cadence-mhdp-fw"
>  
>  # Add run-time dependency for Video Decoding firmware to the rootfs
> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 = " vxd-dec-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
>  
>  # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index bf230dbc..67b28b2a 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -42,4 +42,4 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> -KERNEL_MODULE_AUTOLOAD:append:j7 = " rpmsg_kdrv_switch"
> +KERNEL_MODULE_AUTOLOAD:append:j721e = " rpmsg_kdrv_switch"
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 0447bafe..9a6da088 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -13,13 +13,10 @@ inherit deploy
>  inherit update-alternatives
>  
>  PLAT_SFX = ""
> -PLAT_SFX:j7 = "j721e"
> -PLAT_SFX:j721e-hs-evm = "j721e"
> -PLAT_SFX:j7200-evm = "j7200"
> -PLAT_SFX:j7200-hs-evm = "j7200"
> -PLAT_SFX:j721s2-evm = "j721s2"
> -PLAT_SFX:j721s2-hs-evm = "j721s2"
> -PLAT_SFX:j784s4-evm = "j784s4"
> +PLAT_SFX:j721e = "j721e"
> +PLAT_SFX:j7200 = "j7200"
> +PLAT_SFX:j721s2 = "j721s2"
> +PLAT_SFX:j784s4 = "j784s4"
>  PLAT_SFX:am65xx = "am65xx"
>  PLAT_SFX:am64xx = "am64xx"
>  PLAT_SFX:am62xx = "am62xx"
> @@ -50,7 +47,7 @@ LEGACY_DM_FW_DIR  = "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> -# J7 HS support
> +# J721e HS support
>  do_install:prepend:j721e-hs-evm() {
>          export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
> @@ -81,7 +78,7 @@ do_install:prepend:j721e-hs-evm() {
>          )
>  }
>  
> -# J7 HS support
> +# J7200 HS support
>  do_install:prepend:j7200-hs-evm() {
>          export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
> @@ -102,7 +99,7 @@ do_install:prepend:j7200-hs-evm() {
>          )
>  }
>  
> -# J7 HS support
> +# J721s2 HS support
>  do_install:prepend:j721s2-hs-evm() {
>          export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>          ( cd ${RTOS_DM_FW_DIR}; \
> @@ -149,7 +146,7 @@ do_install() {
>  	:
>  }
>  
> -do_install:j7() {
> +do_install:j721e() {
>      install -d ${LEGACY_IPC_FW_DIR}
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> @@ -335,7 +332,7 @@ ALTERNATIVE:${PN}:j721e-hs-evm = "\
>                      j7-c71_0-fw-sec \
>                      "
>  
> -ALTERNATIVE:${PN}:j7 = "\
> +ALTERNATIVE:${PN}:j721e-evm = "\

Should this be a common list for all j721e platforms, not just the EVM?


>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
>                      j7-main-r5f0_0-fw \
> @@ -420,15 +417,15 @@ TARGET_MCU_M4FSS0_0:am64xx = "am64-mcu-m4f0_0-fw"
>  TARGET_MAIN_R5FSS0_0:am62xx = "am62-main-r5f0_0-fw"
>  TARGET_MCU_M4FSS0_0:am62xx = "am62-mcu-m4f0_0-fw"
>  
> -TARGET_MCU_R5FSS0_0:j7 = "j7-mcu-r5f0_0-fw"
> -TARGET_MCU_R5FSS0_1:j7 = "j7-mcu-r5f0_1-fw"
> -TARGET_MAIN_R5FSS0_0:j7 = "j7-main-r5f0_0-fw"
> -TARGET_MAIN_R5FSS0_1:j7 = "j7-main-r5f0_1-fw"
> -TARGET_MAIN_R5FSS1_0:j7 = "j7-main-r5f1_0-fw"
> -TARGET_MAIN_R5FSS1_1:j7 = "j7-main-r5f1_1-fw"
> -TARGET_C66_0:j7 = "j7-c66_0-fw"
> -TARGET_C66_1:j7 = "j7-c66_1-fw"
> -TARGET_C7X_0:j7 = "j7-c71_0-fw"
> +TARGET_MCU_R5FSS0_0:j721e = "j7-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1:j721e = "j7-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0:j721e = "j7-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1:j721e = "j7-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0:j721e = "j7-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1:j721e = "j7-main-r5f1_1-fw"
> +TARGET_C66_0:j721e = "j7-c66_0-fw"
> +TARGET_C66_1:j721e = "j7-c66_1-fw"
> +TARGET_C7X_0:j721e = "j7-c71_0-fw"
>  
>  TARGET_MAIN_R5FSS0_0_SIGNED:j721e-hs-evm = "j7-main-r5f0_0-fw-sec"
>  TARGET_MAIN_R5FSS0_1_SIGNED:j721e-hs-evm = "j7-main-r5f0_1-fw-sec"
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index be1ff013..ff715ce0 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -1,7 +1,7 @@
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
>  
> -COMPATIBLE_MACHINE = "ti-soc"
> +COMPATIBLE_MACHINE = "j721e|j7200|am65xx|am64xx"

Why?


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -10,8 +10,8 @@ INHIBIT_DEFAULT_DEPS = "1"
>  inherit nopackages deploy
>  
>  PLAT_SFX = ""
> -PLAT_SFX:j7 = "/j721e"
> -PLAT_SFX:j7200-evm = "/j7200"
> +PLAT_SFX:j721e = "/j721e"
> +PLAT_SFX:j7200 = "/j7200"
>  PLAT_SFX:am65xx = "/am65xx"
>  PLAT_SFX:am64xx = "/am64x"

This list seems incomplete. The whole concept of ti-rtos-metadata got shifted 
towards using ti-linux-firmware and probably needs a deeper cleanup.


> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index cb2f8cc2..e3b5290a 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -15,7 +15,7 @@ PR = "r0"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am62xx|am64xx|am65xx|j721e"

Should this be a separate commit? The below does cleanup j721e usage, but a 
stricter COMPATIBLE_MACHINE should probably have a dedicated explanation?
Are these restrictions due to HW specifics or simply SW enablement?


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES:prepend = " \
> @@ -43,7 +43,7 @@ PLATFORM:omap-a15 = "am572x"
>  PLATFORM:am62xx = "am62x"
>  PLATFORM:am64xx = "am64x"
>  PLATFORM:am65xx = "am65x"
> -PLATFORM:j7 = "j721e"
> +PLATFORM:j721e = "j721e"
>  
>  do_compile() {
>      for dir in ${SUBDIRS}
> @@ -155,7 +155,7 @@ do_install:append:am65xx() {
>      done
>  }
>  
> -do_install:append:j7() {
> +do_install:append:j721e() {
>      for i in 0 1
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> @@ -189,7 +189,7 @@ PRU_ICSS_ALTERNATIVES:omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_
>  PRU_ICSS_ALTERNATIVES:am62xx   = "am62x-pru0-fw am62x-pru1-fw"
>  PRU_ICSS_ALTERNATIVES:am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
>  PRU_ICSS_ALTERNATIVES:am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
> -PRU_ICSS_ALTERNATIVES:j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
> +PRU_ICSS_ALTERNATIVES:j721e    = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
>  
>  # Set up link names for the firmwares
>  ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "${nonarch_base_libdir}/firmware/am335x-pru0-fw"
> @@ -259,7 +259,7 @@ ALTERNATIVE:pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  # Only Halt firmware images are supported for the Tx_PRU cores
>  ALTERNATIVE:pru-icss-halt:append:am64xx = " am64x-txpru0_0-fw am64x-txpru0_1-fw am64x-txpru1_0-fw am64x-txpru1_1-fw"
>  ALTERNATIVE:pru-icss-halt:append:am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
> -ALTERNATIVE:pru-icss-halt:append:j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
> +ALTERNATIVE:pru-icss-halt:append:j721e  = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "${nonarch_base_libdir}/firmware/pru/PRU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "${nonarch_base_libdir}/firmware/pru/PRU_Halt.out"
> -- 
> 2.38.1

