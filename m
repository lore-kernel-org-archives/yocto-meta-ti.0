Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.873.1626819488785664254
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 15:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CWXs0QOU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16KMI74X022527;
	Tue, 20 Jul 2021 17:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626819487;
	bh=VRwxBehJnflDQo+sA1gDuEfDxRiuqHHBkY5pajKqAmw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=CWXs0QOUipymhKdLbOk2I/VIJaTiijbqCXKJVWMcXS3FaG5mPMucILxhZDxO3cOmh
	 qvCGRno3YwnFOXUawwXMVTy8FjPFOsMWuiBw9m0opfKLQ464PgwyJOml5E8WW0Ul3s
	 e4Ws+b1VKNXcsI0rTKEECgweHc6QCn7Jxdbrr6YY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16KMI7lj073085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jul 2021 17:18:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Jul 2021 17:18:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 20 Jul 2021 17:18:07 -0500
Received: from [10.250.34.207] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16KMI6qX064981;
	Tue, 20 Jul 2021 17:18:07 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH] ti-rtos-firmware: Add soft link to the rtos firmware binaries
To: Yogesh Siraswar <yogeshs@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210720192415.15494-1-yogeshs@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <d09254b3-65e1-2dcd-b814-e737d7d67213@ti.com>
Date: Tue, 20 Jul 2021 17:18:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720192415.15494-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Yogesh,

On 7/20/21 2:24 PM, Yogesh Siraswar wrote:
> Changes for firmware update( eff643e5 ti-rtos-firmware: update the
> source to ti-linux-firmware) were in-complete without soft link.
> 1) Added soft link missing for the rtos firmware.
> 2) Updated the IPC am64x firmware name to be consistent with 7.3

I am guessing you will be moving away from overloading this recipe for next
release, and will do this cleanly.

> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 187 ++++++++++++++++++---
>  1 file changed, 167 insertions(+), 20 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e50cb933..f27e5004 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -10,6 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  INHIBIT_DEFAULT_DEPS = "1"
>  
>  inherit deploy
> +inherit update-alternatives
>  
>  PLAT_SFX = ""
>  PLAT_SFX_j7 = "j721e"
> @@ -23,7 +24,7 @@ CORESDK_RTOS_VERSION ?= "08.00.00.26"
>  PV = "${CORESDK_RTOS_VERSION}"
>  
>  CLEANBROKEN = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  
>  # Secure Build 
> @@ -39,13 +40,13 @@ RTOS_IPC_FW_DIR = "${S}/ti-ipc/${PLAT_SFX}"
>  
>  # For back-ward compatability keeping legacy firmware folder name
>  # TODO: fix this in next version
> -LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw"
> -LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc"
> -LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/ethfw"
> +LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw/"
> +LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc/"
> +LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/pdk-ipc/"
>  
>  DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  
> -# Install
> +# J7 HS support
>  do_install_prepend_j7-hs-evm() {
>  	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>  	( cd ${RTOS_DM_FW_DIR}; \
> @@ -54,35 +55,181 @@ do_install_prepend_j7-hs-evm() {
>  	)
>  }
>  
> +# Update the am64xx ipc binaries to be consistent with other platforms
> +do_install_prepend_am64xx() {
> +        ( cd ${RTOS_IPC_FW_DIR}; \
> +                mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
> +                mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
> +                mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
> +                mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \

Hmm, I am actually not sure if these are actually baremetal firmwares. We
originally had both baremetal and SYS/BIOS ones from PDK. Anyway, need to make
sure the IPC tests are ok with this name.

> +        )
> +}
> +
> +
> +

Unnecessary extra blank lines..

> +#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>  do_install() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_ETH_FW_DIR}
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_ETH_FW_DIR}/." ${LEGACY_ETH_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_DM_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +    install -d ${LEGACY_IPC_FW_DIR}
> +}
> +
> +
> +do_install_append_j7-evm() {
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
>  }
>  
> -do_install_am65xx() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +do_install_append_j7200-evm() {
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    install -d ${LEGACY_ETH_FW_DIR}
> +    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>  }
>  
> -do_install_am64xx() {
> -  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -  install -d ${LEGACY_IPC_FW_DIR}
> -  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
> +do_install_append_am65xx() {
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
>  }
>  
> +do_install_append_am64xx() {
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +}
> +
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
> +ALTERNATIVE_${PN}_j7200-evm = "\
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
> +TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j7200-evm = "j7200-main-r5f0_1-fw"
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
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
> +ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
> +ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
> +
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
> +
> +ALTERNATIVE_PRIORITY = "10"

I see that you have used some aspects of the prior ipc-lld recipe, but is this
actually installing EthFw (app_remoteswitchcfg_server_strip.xer5f) as the
default firmware for main_r5f0_0 on J721E and J7200? We had a different recipe
for EthFw before that used a higher ALTERNATIVE_PRIORITY to install that as the
default firmware for Main R5F0_0 firmware.

regards
Suman

>  
>  # make sure that lib/firmware, and all its contents are part of the package
>  FILES_${PN} += "${base_libdir}/firmware"
>  
> -
> +# This is used to prevent the build system to_strip the executables
>  INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
>  INSANE_SKIP_${PN} += "arch"
>  
> +# we don't want to configure and build the source code
>  do_compile[noexec] = "1"
>  do_configure[noexec] = "1"
> 

