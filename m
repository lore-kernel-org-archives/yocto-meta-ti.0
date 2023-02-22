Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E883C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:43:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3013.1677095023872787530
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E55B40C2E;
	Wed, 22 Feb 2023 19:43:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AD7sJAYnv2fJ; Wed, 22 Feb 2023 19:43:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BEDA40AC9;
	Wed, 22 Feb 2023 19:43:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 598F8163764; Wed, 22 Feb 2023 14:43:16 -0500 (EST)
Date: Wed, 22 Feb 2023 14:43:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 12/15] ti-rtos-firmware:
 Use defines to set firmware names
Message-ID: <20230222194316.GD22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-13-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-13-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15918

On Wed, Feb 15, 2023 at 01:33:52PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This allows us to change the name in one spot and avoid duplication.
> It also helps prevent hard to see changes/typos in the firmware names.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../ti-rtos-bin/ti-rtos-firmware.bb           | 385 +++++++++---------
>  1 file changed, 201 insertions(+), 184 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 56071a8c..396850b4 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -45,6 +45,23 @@ LEGACY_DM_FW_DIR  = "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> +MCU_1_0_FW = "ipc_echo_test_mcu1_0_release_strip.xer5f"
> +MCU_1_1_FW = "ipc_echo_test_mcu1_1_release_strip.xer5f"
> +MCU_2_0_FW = "ipc_echo_test_mcu2_0_release_strip.xer5f"
> +MCU_2_1_FW = "ipc_echo_test_mcu2_1_release_strip.xer5f"
> +MCU_3_0_FW = "ipc_echo_test_mcu3_0_release_strip.xer5f"
> +MCU_3_1_FW = "ipc_echo_test_mcu3_1_release_strip.xer5f"
> +MCU_4_0_FW = "ipc_echo_test_mcu4_0_release_strip.xer5f"
> +MCU_4_1_FW = "ipc_echo_test_mcu4_1_release_strip.xer5f"
> +C66_1_FW   = "ipc_echo_test_c66xdsp_1_release_strip.xe66"
> +C66_2_FW   = "ipc_echo_test_c66xdsp_2_release_strip.xe66"
> +C7X_1_FW   = "ipc_echo_test_c7x_1_release_strip.xe71"
> +C7X_2_FW   = "ipc_echo_test_c7x_2_release_strip.xe71"
> +C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
> +C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
> +
> +ETH_FW = "app_remoteswitchcfg_server_strip.xer5f"
> +
>  # J721e HS support
>  do_install:prepend:j721e-hs-evm() {
>          ( cd ${RTOS_DM_FW_DIR}; \
> @@ -53,25 +70,25 @@ do_install:prepend:j721e-hs-evm() {
>          )
>          (
>            cd ${RTOS_IPC_FW_DIR}; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> -                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> -                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> -                        ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> -                        ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_1_release_strip.xe66 \
> -                        ipc_echo_test_c66xdsp_1_release_strip.xe66.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_2_release_strip.xe66 \
> -                        ipc_echo_test_c66xdsp_2_release_strip.xe66.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> -                        ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
> +                        ${MCU_2_0_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
> +                        ${MCU_2_1_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_0_FW} \
> +                        ${MCU_3_0_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_1_FW} \
> +                        ${MCU_3_1_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C66_1_FW} \
> +                        ${C66_1_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C66_2_FW} \
> +                        ${C66_2_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_1_FW} \
> +                        ${C7X_1_FW}.signed; \
>          )
>          (
>            cd ${RTOS_ETH_FW_DIR}; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
> -                        app_remoteswitchcfg_server_strip.xer5f.signed;
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${ETH_FW} \
> +                        ${ETH_FW}.signed;
>          )
>  }
>  
> @@ -83,15 +100,15 @@ do_install:prepend:j7200-hs-evm() {
>          )
>          (
>            cd ${RTOS_IPC_FW_DIR}; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> -                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> -                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
> +                        ${MCU_2_0_FW}.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
> +                        ${MCU_2_1_FW}.signed; \
>          )
>          (
>            cd ${RTOS_ETH_FW_DIR}; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
> -                        app_remoteswitchcfg_server_strip.xer5f.signed;
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${ETH_FW} \
> +                        ${ETH_FW}.signed;
>          )
>  }
>  
> @@ -103,36 +120,36 @@ do_install:prepend:j721s2-hs-evm() {
>          )
>          (
>            cd ${RTOS_IPC_FW_DIR}; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> -                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> -                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> -                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> -                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> -                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> -            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_2_release_strip.xe71 \
> -                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_0_FW} \
> +                ${MCU_2_0_FW}.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_2_1_FW} \
> +                ${MCU_2_1_FW}.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_0_FW} \
> +                ${MCU_3_0_FW}.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${MCU_3_1_FW} \
> +                ${MCU_3_1_FW}.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_1_FW} \
> +                ${C7X_1_FW}.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${C7X_2_FW} \
> +                ${C7X_2_FW}.signed; \
>          )
>  }
>  
>  # Update the am64xx ipc binaries to be consistent with other platforms
>  do_install:prepend:am64xx() {
>          ( cd ${RTOS_IPC_FW_DIR}; \
> -                ln -s am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
> -                ln -s am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
> -                ln -s am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
> -                ln -s am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
> -                ln -s am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
> +                ln -s am64-main-r5f0_0-fw ${MCU_1_0_FW}; \
> +                ln -s am64-main-r5f0_1-fw ${MCU_1_1_FW}; \
> +                ln -s am64-main-r5f1_0-fw ${MCU_2_0_FW}; \
> +                ln -s am64-main-r5f1_1-fw ${MCU_2_1_FW}; \
> +                ln -s am64-mcu-m4f0_0-fw ${MCU_3_0_FW}; \
>          )
>  }
>  
>  # Update the am62xx ipc binaries to be consistent with other platforms
>  do_install:prepend:am62xx() {
>          ( cd ${RTOS_IPC_FW_DIR}; \
> -                ln -s am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
> +                ln -s am62-mcu-m4f0_0-fw ${MCU_2_0_FW}; \
>          )
>  }
>  
> @@ -143,141 +160,141 @@ do_install() {
>  
>  do_install:j721e() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_2_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      install -d ${LEGACY_ETH_FW_DIR}
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:append:j721e-hs-evm() {
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C66_2_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW}.signed ${LEGACY_IPC_FW_DIR}
>      # ETH firmware
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW}.signed ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:j7200-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      install -d ${LEGACY_ETH_FW_DIR}
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:j7200-hs-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
>      # Signed Firmwares
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      install -d ${LEGACY_ETH_FW_DIR}
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>      # ETH Signed firmware
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW}.signed ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:j721s2-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      # install -d ${LEGACY_ETH_FW_DIR}
> -    # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    # install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:j721s2-hs-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
>      # Signed firmware
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW}.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW}.signed ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      # install -d ${LEGACY_ETH_FW_DIR}
> -    # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    # install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:j784s4-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_4_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_4_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_2_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_3_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${C7X_4_FW} ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      install -d ${LEGACY_ETH_FW_DIR}
> -    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/${ETH_FW} ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install:am65xx() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
>  }
>  
>  do_install:am64xx() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_1_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_1_FW} ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_3_0_FW} ${LEGACY_IPC_FW_DIR}
>  }
>  
>  do_install:am62xx() {
>      install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/${MCU_2_0_FW} ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${LEGACY_DM_FW_DIR}
>  }
>  
>  
> @@ -287,7 +304,7 @@ do_deploy() {
>  
>  do_deploy:am62xx() {
>      install -d ${DEPLOYDIR}
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
> +    install -m 0644 ${RTOS_DM_FW_DIR}/${DM_FIRMWARE} ${DEPLOYDIR}
>  }
>  
>  # Set up names for the firmwares
> @@ -469,72 +486,72 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-f
>  
>  # Create the firmware alternatives
>  
> -ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -
> -ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> -
> -ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> -
> -ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
> -ALTERNATIVE_TARGET[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
> -ALTERNATIVE_TARGET[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> -
> -ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed"
> -ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed"
> -ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> -
> -ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> -ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> -
> -ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> -
> -ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> -ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
> -
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> -ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> -ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
> -
> -ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f"
> -ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> -ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71"
> -ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71"
> -ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_0_FW}"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +
> +ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_0_FW}"
> +ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> +ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> +
> +ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> +
> +ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
> +ALTERNATIVE_TARGET[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_1_FW}"
> +ALTERNATIVE_TARGET[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C66_2_FW}"
> +ALTERNATIVE_TARGET[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
> +
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_1_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C66_2_FW}.signed"
> +ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
> +
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/ethfw/${ETH_FW}"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/${ETH_FW}.signed"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +
> +ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
> +ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
> +ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
> +
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}.signed"
> +ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}.signed"
> +
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE}"
> +ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_1_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_2_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_3_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_0_FW}"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${base_libdir}/firmware/pdk-ipc/${MCU_4_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_1_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_2_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_3_FW}"
> +ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/${C7X_4_FW}"
>  
>  ALTERNATIVE_PRIORITY = "10"
>  
> -- 
> 2.39.1

