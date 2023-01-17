Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59871C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 15:32:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.199482.1673969553584466537
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 07:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fswyh+Fz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30HFWSen035457;
	Tue, 17 Jan 2023 09:32:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673969548;
	bh=LgPBmvs5o51/4me2I8F2Fs5jJGO3kLC+nwAXk4riOSs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fswyh+FzG5LuX9PFuz1bY90rHi1I4CX5gX3dLly1cZ5yOFd70B3a1huRWIIOxWCV0
	 e2iXc2jEu3r3mhtKgjY/VxF6SDW0ZFnpv0IzYcBRWqfcorr8YgSMvtqzkLKPVw4RE1
	 OymK/eiJjWvcKJ1LJ5xl7KHbakI/uAJjgsLdbxG8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30HFWSsu050532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Jan 2023 09:32:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 17
 Jan 2023 09:32:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 17 Jan 2023 09:32:27 -0600
Received: from [10.250.35.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30HFWRCn088133;
	Tue, 17 Jan 2023 09:32:27 -0600
Message-ID: <af3db8e5-bb0c-2cf3-735d-46b1c8274e48@ti.com>
Date: Tue, 17 Jan 2023 09:32:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH] am62xx: Add support for secure RTOS IPC
 Firmware images
To: Chirag Shilwant <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230112112755.10791-1-c-shilwant@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230112112755.10791-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 15:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15575



On 1/12/2023 5:27, Chirag Shilwant wrote:
> - Let's add support for secure RTOS IPC Firmware images for am62xx. This will sign RTOS IPC Firmware for all EVMs based on am62xx (i.e AM62X and AM62X-LP-EVM)
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 28 +++++++---------------
>   1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 47b29632..72d85a6b 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -174,20 +174,18 @@ do_install_prepend_am64xx() {
>           )
>   }
>   
> -# Update the am62xx ipc binaries to be consistent with other platforms
> -do_install_prepend_am62xx() {
> -        ( cd ${RTOS_IPC_FW_DIR}; \
> -                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
> -        )
> -}
> -

Why are we removing am62xx-lp-evm?  Is this part of the move to remove 
am62xx-lp-evm and merge everything into am62x-evm?


>   # AM62Q HS-SE support
> -do_install_prepend_am62xx-lp-evm() {
> +do_install_prepend_am62xx() {
>           export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>           ( cd ${RTOS_DM_FW_DIR}; \
>                   mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
>                   ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
>           )
> +        ( cd ${RTOS_IPC_FW_DIR}; \
> +                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
> +                    ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
> +        )
>   }
>   
>   #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
> @@ -361,13 +359,8 @@ do_install_am64xx() {
>   do_install_am62xx() {
>       install -d ${LEGACY_IPC_FW_DIR}
>       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> -    # DM Firmware
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
> -}
> -
> -do_install_am62xx-lp-evm() {
> -    install -d ${LEGACY_IPC_FW_DIR}
> -    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
> +    # Signed Firmware
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
>       # DM Firmware
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>   }
> @@ -389,11 +382,6 @@ do_deploy_am62xx() {
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
>   }
>   
> -do_deploy_am62xx-lp-evm() {
> -    install -d ${DEPLOYDIR}
> -    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
> -}
> -
>   do_deploy_am62axx() {
>       install -d ${DEPLOYDIR}
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

