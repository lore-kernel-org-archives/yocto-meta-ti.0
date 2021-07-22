Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.7632.1626960229833541283
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 06:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RUri9b4k;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: grygorii.strashko@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MDNmx4019548;
	Thu, 22 Jul 2021 08:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626960228;
	bh=FqvlnSE2MPDKkeYVjW9AKOZeQTIeMjBEH+hxs23iBT4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=RUri9b4kUqLV1h/ufa966sdZUsnAQAoEdhjmN8M7baDfBlCM/i/F2jNpTUnOwdjQy
	 gBaZrVfn8mkQSUjR0XG+M79zuKAa1Yjgp8aM90ns4nyusjXD0PeTBRfZ7CIeG7ttwF
	 dnBK/Ro6Krv8jJcoWe/JctCo54HY0g33xmqIl84E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MDNm6i046822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 08:23:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 08:23:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 08:23:48 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MDNkqR067413;
	Thu, 22 Jul 2021 08:23:46 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH v3] ti-rtos-firmware: Add soft link to the rtos firmware binaries
To: <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Suman Anna
	<s-anna@ti.com>
References: <20210722061728.21100-1-yogeshs@ti.com>
From: "Grygorii Strashko" <grygorii.strashko@ti.com>
Message-ID: <1960a02f-3f1a-c583-8263-a6cc07b5edf8@ti.com>
Date: Thu, 22 Jul 2021 16:23:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722061728.21100-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 22/07/2021 09:17, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Changes for firmware update( eff643e5 ti-rtos-firmware: update the
> source to ti-linux-firmware) were in-complete without soft link.
> 1) Added soft link missing for the rtos firmware.
> 2) Updated the IPC am64x firmware name to be consistent with 7.3
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
> Changes from v2:
> 1) Fixed issue with HS build for J7 by using j7 instead of j7-evm.
>    So the same rule apply for j7-hs-evm.
> 2) Same changes for J7200 for future HS support
> 
> Changes from v1:
> 1) Fixed the j7-main-r5f0_0-fw and j7200-main-r5f0_0-fw soft link
> 2) Cleaned-up extra white space.
> 
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 187 ++++++++++++++++++---
>   1 file changed, 167 insertions(+), 20 deletions(-)

Tested on j721e-evm with updated IPC FW bins.
Tested-by: Grygorii Strashko <grygorii.strashko@ti.com>

> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e50cb933..84cd98a1 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -10,10 +10,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   INHIBIT_DEFAULT_DEPS = "1"
>   
>   inherit deploy
> +inherit update-alternatives
>   
>   PLAT_SFX = ""
>   PLAT_SFX_j7 = "j721e"
> -PLAT_SFX_j7200-evm = "j7200"
> +PLAT_SFX_j7200 = "j7200"
>   PLAT_SFX_am65xx = "am65xx"
>   PLAT_SFX_am64xx = "am64xx"
>   
> @@ -23,8 +24,7 @@ CORESDK_RTOS_VERSION ?= "08.00.00.26"
>   PV = "${CORESDK_RTOS_VERSION}"
>   
>   CLEANBROKEN = "1"
> -PR = "r1"
> -
> +PR = "r3"
>   
>   # Secure Build
>   DEPENDS += "openssl-native"
> @@ -39,13 +39,13 @@ RTOS_IPC_FW_DIR = "${S}/ti-ipc/${PLAT_SFX}"
>   
>   # For back-ward compatability keeping legacy firmware folder name
>   # TODO: fix this in next version
> -LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw"
> -LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc"
> -LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/ethfw"
> +LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw/"
> +LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc/"
> +LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/pdk-ipc/"
>   
>   DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>   
> -# Install
> +# J7 HS support
>   do_install_prepend_j7-hs-evm() {
>   	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>   	( cd ${RTOS_DM_FW_DIR}; \
> @@ -54,35 +54,182 @@ do_install_prepend_j7-hs-evm() {
>   	)
>   }
>   
> +# Update the am64xx ipc binaries to be consistent with other platforms
> +do_install_prepend_am64xx() {
> +        ( cd ${RTOS_IPC_FW_DIR}; \
> +                mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
> +                mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
> +                mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
> +                mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
> +        )
> +}
> +
> +#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>   do_install() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_ETH_FW_DIR}
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_ETH_FW_DIR}/." ${LEGACY_ETH_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_DM_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +
> +}
> +
> +do_install_j7() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    install -d ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +}
> +
> +do_install_j7200() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    install -d ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>   }
>   
>   do_install_am65xx() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>   }
>   
>   do_install_am64xx() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>   }
>   
> +# Set up names for the firmwares
> +ALTERNATIVE_${PN}_am65xx = "\
> +                    am65x-mcu-r5f0_0-fw \
> +                    am65x-mcu-r5f0_1-fw \
> +                    "
> +
> +ALTERNATIVE_${PN}_am64xx = "\
> +                    am64-main-r5f0_0-fw \
> +                    am64-main-r5f0_1-fw \
> +                    am64-main-r5f1_0-fw \
> +                    am64-main-r5f1_1-fw \
> +                    "
> +
> +ALTERNATIVE_${PN}_j7 = "\
> +                    j7-mcu-r5f0_0-fw \
> +                    j7-mcu-r5f0_1-fw \
> +                    j7-main-r5f0_0-fw \
> +                    j7-main-r5f0_1-fw \
> +                    j7-main-r5f1_0-fw \
> +                    j7-main-r5f1_1-fw \
> +                    j7-c66_0-fw \
> +                    j7-c66_1-fw \
> +                    j7-c71_0-fw\
> +                    "
> +
> +ALTERNATIVE_${PN}_j7200 = "\
> +                    j7200-mcu-r5f0_0-fw \
> +                    j7200-mcu-r5f0_1-fw \
> +                    j7200-main-r5f0_0-fw \
> +                    j7200-main-r5f0_1-fw \
> +                    "
> +
> +# Set up link names for the firmwares
> +
> +TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
> +
> +TARGET_MAIN_R5FSS0_0_am64xx = "am64-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
> +
> +TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j7 = "j7-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
> +TARGET_C66_0_j7 = "j7-c66_0-fw"
> +TARGET_C66_1_j7 = "j7-c66_1-fw"
> +TARGET_C7X_j7 = "j7-c71_0-fw"
> +
> +TARGET_MCU_R5FSS0_0_j7200 = "j7200-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j7200 = "j7200-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j7200 = "j7200-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j7200 = "j7200-main-r5f0_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> +
> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> +
> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
> +
> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +
> +# Create the firmware alternatives
> +
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> +
> +ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
> +
> +ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
> +ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
> +ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> +
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> +
> +ALTERNATIVE_PRIORITY = "10"
>   
>   # make sure that lib/firmware, and all its contents are part of the package
>   FILES_${PN} += "${base_libdir}/firmware"
>   
> -
> +# This is used to prevent the build system to_strip the executables
>   INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
>   INSANE_SKIP_${PN} += "arch"
>   
> +# we don't want to configure and build the source code
>   do_compile[noexec] = "1"
>   do_configure[noexec] = "1"
> 
> 
> 
> 
> 

-- 
Best regards,
grygorii
