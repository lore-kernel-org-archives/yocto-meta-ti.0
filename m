Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC02C6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 23:21:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4973.1662852088192693803
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 16:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3754140D4C;
	Sat, 10 Sep 2022 23:21:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E55cmcs0lRI3; Sat, 10 Sep 2022 23:21:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F3C340D4B;
	Sat, 10 Sep 2022 23:21:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 059F31749CE; Sat, 10 Sep 2022 19:21:22 -0400 (EDT)
Date: Sat, 10 Sep 2022 19:21:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH 2/3] ti-rtos-firmware: j7200-hs-evm:
 add secure firmware images
Message-ID: <20220910232121.GO18429@denix.org>
References: <20220909055055.38394-1-m-chawdhry@ti.com>
 <20220909055055.38394-3-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909055055.38394-3-m-chawdhry@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 10 Sep 2022 23:21:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15017

On Fri, Sep 09, 2022 at 11:20:54AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Adds support for secure firmware images in J7200 HS EVM.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 78faeae3..f7a28218 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -89,6 +89,18 @@ do_install_prepend_j7200-hs-evm() {
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>          )
> +        (
> +          cd ${RTOS_IPC_FW_DIR}; \

Please keep formatting and indentation similar to existing code.



> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> +                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> +                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> +        )
> +        (
> +          cd ${RTOS_ETH_FW_DIR}; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
> +                        app_remoteswitchcfg_server_strip.xer5f.signed;
> +        )
>  }
>  
>  # J7 HS support
> @@ -169,11 +181,16 @@ do_install_j7200-hs-evm() {
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    # Signed Firmwares
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
>      # DM Firmware
>      install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>      # ETH firmware
>      install -d ${LEGACY_ETH_FW_DIR}
>      install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +    # ETH Signed firmware
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
>  }
>  
>  do_install_j721s2-evm() {
> @@ -301,6 +318,8 @@ ALTERNATIVE_${PN}_j7200-hs-evm = "\
>                      j7200-mcu-r5f0_1-fw \
>                      j7200-main-r5f0_0-fw \
>                      j7200-main-r5f0_1-fw \
> +                    j7200-main-r5f0_0-fw-sec \
> +                    j7200-main-r5f0_1-fw-sec \
>                      "
>  
>  ALTERNATIVE_${PN}_j721s2-evm = "\
> @@ -367,6 +386,9 @@ TARGET_MCU_R5FSS0_1_j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
>  TARGET_MAIN_R5FSS0_0_j7200-hs-evm = "j7200-main-r5f0_0-fw"
>  TARGET_MAIN_R5FSS0_1_j7200-hs-evm = "j7200-main-r5f0_1-fw"
>  
> +TARGET_MAIN_R5FSS0_0_SIGNED_j7200-hs-evm = "j7200-main-r5f0_0-fw-sec"
> +TARGET_MAIN_R5FSS0_1_SIGNED_j7200-hs-evm = "j7200-main-r5f0_1-fw-sec"
> +
>  TARGET_MCU_R5FSS0_0_j721s2-evm = "j721s2-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j721s2-evm = "j721s2-mcu-r5f0_1-fw"
>  TARGET_MAIN_R5FSS0_0_j721s2-evm = "j721s2-main-r5f0_0-fw"
> @@ -420,6 +442,9 @@ ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_M
>  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
>  
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> +
>  ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -466,6 +491,9 @@ ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
>  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
>  ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
>  
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> +
>  ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> -- 
> 2.34.1

