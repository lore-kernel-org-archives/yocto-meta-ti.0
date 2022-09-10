Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF81C6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 23:22:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.5064.1662852155126056426
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 16:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5DD1D40D4C;
	Sat, 10 Sep 2022 23:22:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBIGuqMBwlLf; Sat, 10 Sep 2022 23:22:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 34C3D40D4B;
	Sat, 10 Sep 2022 23:22:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BE0D21749CE; Sat, 10 Sep 2022 19:22:29 -0400 (EDT)
Date: Sat, 10 Sep 2022 19:22:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH 1/3] ti-rtos-firmware: j721e-hs-evm:
 add secure firmware images
Message-ID: <20220910232229.GP18429@denix.org>
References: <20220909055055.38394-1-m-chawdhry@ti.com>
 <20220909055055.38394-2-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909055055.38394-2-m-chawdhry@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 10 Sep 2022 23:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15018

On Fri, Sep 09, 2022 at 11:20:53AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Adds support for secure firmware images in J721E HS EVM.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 80 +++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 19ea93f1..78faeae3 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -14,6 +14,7 @@ inherit update-alternatives
>  
>  PLAT_SFX = ""
>  PLAT_SFX_j7 = "j721e"
> +PLAT_SFX_j7-hs-evm = "j721e"

In dunfell j7 above already covers j7-hs-evm


>  PLAT_SFX_j7200-evm = "j7200"
>  PLAT_SFX_j7200-hs-evm = "j7200"
>  PLAT_SFX_j721s2-evm = "j721s2"
> @@ -31,7 +32,7 @@ PV = "${CORESDK_RTOS_VERSION}"
>  CLEANBROKEN = "1"
>  PR = "${INC_PR}.0"
>  
> -# Secure Build 
> +# Secure Build
>  DEPENDS += "openssl-native"
>  
>  FILES_${PN} += "${base_libdir}"
> @@ -57,6 +58,28 @@ do_install_prepend_j7-hs-evm() {
>                  mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                  ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>          )
> +        (
> +          cd ${RTOS_IPC_FW_DIR}; \

Same comment about keeping the formatting intact.


> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> +                        ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> +                        ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> +                        ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> +                        ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_1_release_strip.xe66 \
> +                        ipc_echo_test_c66xdsp_1_release_strip.xe66.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c66xdsp_2_release_strip.xe66 \
> +                        ipc_echo_test_c66xdsp_2_release_strip.xe66.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> +                        ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> +        )
> +        (
> +          cd ${RTOS_ETH_FW_DIR}; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh app_remoteswitchcfg_server_strip.xer5f \
> +                        app_remoteswitchcfg_server_strip.xer5f.signed;
> +        )
>  }
>  
>  # J7 HS support
> @@ -117,6 +140,18 @@ do_install_j7() {
>      install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>  }
>  
> +do_install_append_j7-hs-evm() {
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    # ETH firmware
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f.signed ${LEGACY_ETH_FW_DIR}
> +}
> +
>  do_install_j7200-evm() {
>      install -d ${LEGACY_IPC_FW_DIR}
>      install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> @@ -223,6 +258,25 @@ ALTERNATIVE_${PN}_am62xx = "\
>                      am62-main-r5f0_0-fw \
>                      "
>  
> +ALTERNATIVE_${PN}_j7-hs-evm = "\
> +                    j7-mcu-r5f0_0-fw \
> +                    j7-mcu-r5f0_1-fw \
> +                    j7-main-r5f0_0-fw \
> +                    j7-main-r5f0_1-fw \
> +                    j7-main-r5f1_0-fw \
> +                    j7-main-r5f1_1-fw \
> +                    j7-c66_0-fw \
> +                    j7-c66_1-fw \
> +                    j7-c71_0-fw\
> +                    j7-main-r5f0_0-fw-sec \
> +                    j7-main-r5f0_1-fw-sec \
> +                    j7-main-r5f1_0-fw-sec \
> +                    j7-main-r5f1_1-fw-sec \
> +                    j7-c66_0-fw-sec \
> +                    j7-c66_1-fw-sec \
> +                    j7-c71_0-fw-sec \
> +                    "
> +
>  ALTERNATIVE_${PN}_j7 = "\
>                      j7-mcu-r5f0_0-fw \
>                      j7-mcu-r5f0_1-fw \
> @@ -295,6 +349,14 @@ TARGET_C66_0_j7 = "j7-c66_0-fw"
>  TARGET_C66_1_j7 = "j7-c66_1-fw"
>  TARGET_C7X_0_j7 = "j7-c71_0-fw"
>  
> +TARGET_MAIN_R5FSS0_0_SIGNED_j7-hs-evm = "j7-main-r5f0_0-fw-sec"
> +TARGET_MAIN_R5FSS0_1_SIGNED_j7-hs-evm = "j7-main-r5f0_1-fw-sec"
> +TARGET_MAIN_R5FSS1_0_SIGNED_j7-hs-evm = "j7-main-r5f1_0-fw-sec"
> +TARGET_MAIN_R5FSS1_1_SIGNED_j7-hs-evm = "j7-main-r5f1_1-fw-sec"
> +TARGET_C66_0_SIGNED_j7-hs-evm = "j7-c66_0-fw-sec"
> +TARGET_C66_1_SIGNED_j7-hs-evm = "j7-c66_1-fw-sec"
> +TARGET_C7X_0_SIGNED_j7-hs-evm = "j7-c71_0-fw-sec"
> +
>  TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
>  TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
> @@ -345,6 +407,14 @@ ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
>  ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
>  ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
>  
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C66_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> +
>  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> @@ -383,6 +453,14 @@ ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
>  ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
>  ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
>  
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66.signed"
> +ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66.signed"
> +ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> +
>  ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> -- 
> 2.34.1

