Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF85FC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 14:02:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.41339.1666015369255767341
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rnUVAmDx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29HE2m0X048299
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 09:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666015368;
	bh=i3+1HOWmg8sXTtIQLoBE6hzoGS3rM3w7pI+X6jFNM8c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rnUVAmDx/jQo6I0/bBKzET8YAmOvvgQ/K42tjOZnBQCAWyN/fPWlyB3b7QsIPIhXS
	 aHT4DSFArnYnLi7dm/RCp4RwC0+e52k9twqMNOQ02y0Z+Y7k/HonnuOkXzH1/dve9S
	 YtT6Xw+LSgG5bA1mbUZi6B3F/TnpwnkV9SBFJevo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29HE2m4R048083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 09:02:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 17
 Oct 2022 09:02:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 17 Oct 2022 09:02:47 -0500
Received: from [10.250.33.68] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29HE2lCs017026;
	Mon, 17 Oct 2022 09:02:47 -0500
Message-ID: <2fe8d36c-7540-6400-00dd-e80596f3306f@ti.com>
Date: Mon, 17 Oct 2022 09:02:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][RFC dunfell][PATCH v2 2/6] ti-rtos-firmware: Add J784S4
 High Security support
Content-Language: en-US
To: Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
References: <20221012100941.153924-1-m-chawdhry@ti.com>
 <20221012100941.153924-3-m-chawdhry@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221012100941.153924-3-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 14:02:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15178

On 10/12/22 5:09 AM, Manorit Chawdhry wrote:
> Sign the firmwares for j784s4 similar to j721s2 hs.
> Duplicate all j784s4 entries for j784s4-hs as we cannot use same
> keyword for match between j784s4-evm and j784s4-hs-evm.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 135 +++++++++++++++++++++
>   1 file changed, 135 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 68c93ae7..f3b7d416 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -20,6 +20,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
>   PLAT_SFX_j721s2-evm = "j721s2"
>   PLAT_SFX_j721s2-hs-evm = "j721s2"
>   PLAT_SFX_j784s4-evm = "j784s4"
> +PLAT_SFX_j784s4-hs-evm = "j784s4"
>   PLAT_SFX_am65xx = "am65xx"
>   PLAT_SFX_am64xx = "am64xx"
>   PLAT_SFX_am62xx = "am62xx"
> @@ -128,6 +129,38 @@ do_install_prepend_j721s2-hs-evm() {
>           )
>   }
>   
> +# J784S4 support
> +do_install_prepend_j784s4-hs-evm() {
> +        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> +        ( cd ${RTOS_DM_FW_DIR}; \
> +                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +        )
> +        (
> +          cd ${RTOS_IPC_FW_DIR}; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_0_release_strip.xer5f \
> +                ipc_echo_test_mcu2_0_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu2_1_release_strip.xer5f \
> +                ipc_echo_test_mcu2_1_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_0_release_strip.xer5f \
> +                ipc_echo_test_mcu3_0_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu3_1_release_strip.xer5f \
> +                ipc_echo_test_mcu3_1_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_0_release_strip.xer5f \
> +                ipc_echo_test_mcu4_0_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_mcu4_1_release_strip.xer5f \
> +                ipc_echo_test_mcu4_1_release_strip.xer5f.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> +                ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_2_release_strip.xe71 \
> +                ipc_echo_test_c7x_2_release_strip.xe71.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_3_release_strip.xe71 \
> +                ipc_echo_test_c7x_3_release_strip.xe71.signed; \
> +            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_4_release_strip.xe71 \
> +                ipc_echo_test_c7x_4_release_strip.xe71.signed; \
> +        )
> +}
> +
>   # Update the am64xx ipc binaries to be consistent with other platforms
>   do_install_prepend_am64xx() {
>           ( cd ${RTOS_IPC_FW_DIR}; \
> @@ -248,6 +281,37 @@ do_install_j721s2-hs-evm() {
>       # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>   }
>   
> +do_install_j784s4-hs-evm() {
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
> +    # Signed firmware
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu4_1_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_3_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_4_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    install -d ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +}
> +
>   do_install_j784s4-evm() {
>       install -d ${LEGACY_IPC_FW_DIR}
>       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> @@ -408,6 +472,31 @@ ALTERNATIVE_${PN}_j784s4-evm = "\
>                       j784s4-c71_3-fw \
>                       "
>   
> +ALTERNATIVE_${PN}_j784s4-hs-evm = "\
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
> +		    j784s4-main-r5f0_0-fw-sec \


Looks like a couple tabs snuck in on this line..

Other than that, this patch looks fine to me. Maybe one minor
thing you could do though, split this into two, one for adding the
normal firmware, second for adding the extra signed firmware.

Andrew


> +                    j784s4-main-r5f0_1-fw-sec \
> +                    j784s4-main-r5f1_0-fw-sec \
> +                    j784s4-main-r5f1_1-fw-sec \
> +                    j784s4-main-r5f2_0-fw-sec \
> +                    j784s4-main-r5f2_1-fw-sec \
> +                    j784s4-c71_0-fw-sec \
> +                    j784s4-c71_1-fw-sec \
> +                    j784s4-c71_2-fw-sec \
> +                    j784s4-c71_3-fw-sec \
> +                    "
> +
>   # Set up link names for the firmwares
>   
>   TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> @@ -491,6 +580,30 @@ TARGET_C7X_1_j784s4-evm = "j784s4-c71_1-fw"
>   TARGET_C7X_2_j784s4-evm = "j784s4-c71_2-fw"
>   TARGET_C7X_3_j784s4-evm = "j784s4-c71_3-fw"
>   
> +TARGET_MCU_R5FSS0_0_j784s4-hs-evm = "j784s4-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j784s4-hs-evm = "j784s4-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j784s4-hs-evm = "j784s4-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j784s4-hs-evm = "j784s4-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_j784s4-hs-evm = "j784s4-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_j784s4-hs-evm = "j784s4-main-r5f1_1-fw"
> +TARGET_MAIN_R5FSS2_0_j784s4-hs-evm = "j784s4-main-r5f2_0-fw"
> +TARGET_MAIN_R5FSS2_1_j784s4-hs-evm = "j784s4-main-r5f2_1-fw"
> +TARGET_C7X_0_j784s4-hs-evm = "j784s4-c71_0-fw"
> +TARGET_C7X_1_j784s4-hs-evm = "j784s4-c71_1-fw"
> +TARGET_C7X_2_j784s4-hs-evm = "j784s4-c71_2-fw"
> +TARGET_C7X_3_j784s4-hs-evm = "j784s4-c71_3-fw"
> +
> +TARGET_MAIN_R5FSS0_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_0-fw-sec"
> +TARGET_MAIN_R5FSS0_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f0_1-fw-sec"
> +TARGET_MAIN_R5FSS1_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_0-fw-sec"
> +TARGET_MAIN_R5FSS1_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f1_1-fw-sec"
> +TARGET_MAIN_R5FSS2_0_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_0-fw-sec"
> +TARGET_MAIN_R5FSS2_1_SIGNED_j784s4-hs-evm = "j784s4-main-r5f2_1-fw-sec"
> +TARGET_C7X_0_SIGNED_j784s4-hs-evm = "j784s4-c71_0-fw-sec"
> +TARGET_C7X_1_SIGNED_j784s4-hs-evm = "j784s4-c71_1-fw-sec"
> +TARGET_C7X_2_SIGNED_j784s4-hs-evm = "j784s4-c71_2-fw-sec"
> +TARGET_C7X_3_SIGNED_j784s4-hs-evm = "j784s4-c71_3-fw-sec"
> +
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>   
> @@ -558,6 +671,17 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${base_libdir}/firmware/${TARGET_C7X_1
>   ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${base_libdir}/firmware/${TARGET_C7X_2}"
>   ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/${TARGET_C7X_3}"
>   
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS2_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_0_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_1_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_2_SIGNED}"
> +ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/${TARGET_C7X_3_SIGNED}"
> +
>   # Create the firmware alternatives
>   
>   ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> @@ -627,6 +751,17 @@ ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_
>   ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71"
>   ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71"
>   
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_0_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu4_1_release_strip.xer5f.signed"
> +ALTERNATIVE_TARGET[j784s4-c71_0-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71.signed"
> +ALTERNATIVE_TARGET[j784s4-c71_1-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_2_release_strip.xe71.signed"
> +ALTERNATIVE_TARGET[j784s4-c71_2-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_3_release_strip.xe71.signed"
> +ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_4_release_strip.xe71.signed"
> +
>   ALTERNATIVE_PRIORITY = "10"
>   
>   # make sure that lib/firmware, and all its contents are part of the package

