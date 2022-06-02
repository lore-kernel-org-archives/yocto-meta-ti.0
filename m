Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4489C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 17:31:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.465.1654191066587016749
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 10:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lDk12Spd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 252HV6ls002226
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654191066;
	bh=qF/nRXijiQBYggt2SluAN8TzsmqPXzhI7Kk6Xrgd3K4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lDk12Spdjj7YFFpvcJcT8FmkTUMzjDBkKvESP1eI9vVDzpFbisccNWuNGpwrhyJ6l
	 UF26vvjUs5m6g76cxpY1KpV9XwU+OAPzA7ugss8l3hsCKCyanju4yvDRw67y2DdZpk
	 qeRH3omYT/JU0Z5G3uKHu/ICkM41UgxiawgGczdI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 252HV5AB068468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:31:06 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Jun 2022 12:31:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Jun 2022 12:31:04 -0500
Received: from [10.250.32.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 252HV4Xk007294;
	Thu, 2 Jun 2022 12:31:04 -0500
Message-ID: <69ddca44-c8d5-dcef-2c85-cb27b4fd1a65@ti.com>
Date: Thu, 2 Jun 2022 12:31:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti] [dunfell PATCH 2/3] ti-rtos-firmware: Add j721s2 hs
 support
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>
References: <20220602172220.24096-1-j-choudhary@ti.com>
 <20220602172220.24096-3-j-choudhary@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220602172220.24096-3-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jun 2022 17:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14777

On 6/2/22 12:22 PM, Jayesh Choudhary wrote:
> Sign the DM firmware for j721s2 similar to j7200 hs.
> Duplicate all j721s2 entries for j721s2-hs as we cannot use same
> keyword for match between j721s2-evm and j721s2-hs-evm.


We have a fix for this in the master branch, we split j7 into
the different specific machines, so you can just use j721s2 to
target both GP and HS without duplicating everything.

Just to let you know for when you post the master branch
version of this series :)

Andrew


> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 0f2ba9af..19ea93f1 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -17,6 +17,7 @@ PLAT_SFX_j7 = "j721e"
>   PLAT_SFX_j7200-evm = "j7200"
>   PLAT_SFX_j7200-hs-evm = "j7200"
>   PLAT_SFX_j721s2-evm = "j721s2"
> +PLAT_SFX_j721s2-hs-evm = "j721s2"
>   PLAT_SFX_am65xx = "am65xx"
>   PLAT_SFX_am64xx = "am64xx"
>   PLAT_SFX_am62xx = "am62xx"
> @@ -67,6 +68,15 @@ do_install_prepend_j7200-hs-evm() {
>           )
>   }
>   
> +# J7 HS support
> +do_install_prepend_j721s2-hs-evm() {
> +        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> +        ( cd ${RTOS_DM_FW_DIR}; \
> +                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +        )
> +}
> +
>   # Update the am64xx ipc binaries to be consistent with other platforms
>   do_install_prepend_am64xx() {
>           ( cd ${RTOS_IPC_FW_DIR}; \
> @@ -147,6 +157,22 @@ do_install_j721s2-evm() {
>       # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
>   }
>   
> +do_install_j721s2-hs-evm() {
> +    install -d ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_2_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    # DM Firmware
> +    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> +    # ETH firmware
> +    # install -d ${LEGACY_ETH_FW_DIR}
> +    # install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
> +}
> +
>   do_install_am65xx() {
>       install -d ${LEGACY_IPC_FW_DIR}
>       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> @@ -234,6 +260,17 @@ ALTERNATIVE_${PN}_j721s2-evm = "\
>                       j721s2-c71_1-fw \
>                       "
>   
> +ALTERNATIVE_${PN}_j721s2-hs-evm = "\
> +                    j721s2-mcu-r5f0_0-fw \
> +                    j721s2-mcu-r5f0_1-fw \
> +                    j721s2-main-r5f0_0-fw \
> +                    j721s2-main-r5f0_1-fw \
> +                    j721s2-main-r5f1_0-fw \
> +                    j721s2-main-r5f1_1-fw \
> +                    j721s2-c71_0-fw \
> +                    j721s2-c71_1-fw \
> +                    "
> +
>   # Set up link names for the firmwares
>   
>   TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> @@ -277,6 +314,15 @@ TARGET_MAIN_R5FSS1_1_j721s2-evm = "j721s2-main-r5f1_1-fw"
>   TARGET_C7X_0_j721s2-evm = "j721s2-c71_0-fw"
>   TARGET_C7X_1_j721s2-evm = "j721s2-c71_1-fw"
>   
> +TARGET_MCU_R5FSS0_0_j721s2-hs-evm = "j721s2-mcu-r5f0_0-fw"
> +TARGET_MCU_R5FSS0_1_j721s2-hs-evm = "j721s2-mcu-r5f0_1-fw"
> +TARGET_MAIN_R5FSS0_0_j721s2-hs-evm = "j721s2-main-r5f0_0-fw"
> +TARGET_MAIN_R5FSS0_1_j721s2-hs-evm = "j721s2-main-r5f0_1-fw"
> +TARGET_MAIN_R5FSS1_0_j721s2-hs-evm = "j721s2-main-r5f1_0-fw"
> +TARGET_MAIN_R5FSS1_1_j721s2-hs-evm = "j721s2-main-r5f1_1-fw"
> +TARGET_C7X_0_j721s2-hs-evm = "j721s2-c71_0-fw"
> +TARGET_C7X_1_j721s2-hs-evm = "j721s2-c71_1-fw"
> +
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>   ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>   

