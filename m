Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF838C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:37:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.60881.1749479851556939182
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 07:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xRKvJrS+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559EbTj02010418;
	Mon, 9 Jun 2025 09:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749479849;
	bh=XfJOcdT3tHeZ4Tv++3/230UdQPse7XYbrDGghJqlrmQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xRKvJrS+gHMBh8LB/fP3mUJvdsveob0XAvxsoK9X4iuSXH87lDeavMQG49EZ3a/Cu
	 muYmCmDlkKlrIkzvjUubD+m9W34YFA2nKOMvzkj1VSqKJozlwEP/ozsmHCyl2mrzQU
	 zidqMLMCTjBb7QxipwhkIzkaVY67/Ahx3Bl35Xew=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559EbTmI155775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 09:37:29 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 09:37:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 09:37:28 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559EbSBK1406515;
	Mon, 9 Jun 2025 09:37:28 -0500
Message-ID: <241aed51-1993-42d4-8aba-49d7864ac2d3@ti.com>
Date: Mon, 9 Jun 2025 09:37:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] meta-ti-bsp: ti-rtos-fw: Update IPC firmwares
 for am62dxx
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <khasim@ti.com>
References: <20250609092640.1751993-1-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250609092640.1751993-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jun 2025 14:37:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18629



On 6/9/2025 4:26 AM, Paresh Bhagat wrote:
> Previously, AM62d build reused AM62a's IPC firmwares. Now that
> dedicated AM62d IPC firmwares are being pushed to ti-linux-firmware
> repo, package the new IPC firmwares.

So... question for Andrew (and anyone else)...

This recipe is for the ipc-rtos-echo-test-fw, so that implies that this 
recipes installs only that.  Should this commit add in a different 
firmware, or should commit make it so that this recipe adds nothing for 
am62d and then a new recipe for the new file?

Thoughts?

I know we previously accepted a commit that did this same kind of thing, 
but now I'm rethinking that.


> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
> Boot logs
> https://gist.github.com/paresh-bhagat12/6fef215c80fa03c8ea55952f46328b83
> 
>   .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 25 +++++++++++--------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 1fe67be8..d43e8a8c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -20,7 +20,7 @@ PLAT_SFX:am65xx = "am65xx"
>   PLAT_SFX:am64xx = "am64xx"
>   PLAT_SFX:am62xx = "am62xx"
>   PLAT_SFX:am62axx = "am62axx"
> -PLAT_SFX:am62dxx = "am62axx"
> +PLAT_SFX:am62dxx = "am62dxx"
>   PLAT_SFX:am62pxx = "am62pxx"
>   
>   FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
> @@ -39,6 +39,7 @@ INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
>   MCU_1_0_FW =       "ipc_echo_test_mcu1_0_release_strip.xer5f"
>   MCU_1_1_FW =       "ipc_echo_test_mcu1_1_release_strip.xer5f"
>   MCU_2_0_FW =       "ipc_echo_test_mcu2_0_release_strip.xer5f"
> +MCU_2_0_FW:am62dxx = "ipc_rpmsg_echo_linux.mcu-r5f0_0.release.strip.out"

Any reason not to add more spaces to all of the other lines so that 
everything continues to line up?


>   MCU_2_1_FW =       "ipc_echo_test_mcu2_1_release_strip.xer5f"
>   MCU_3_0_FW =       "ipc_echo_test_mcu3_0_release_strip.xer5f"
>   MCU_3_1_FW =       "ipc_echo_test_mcu3_1_release_strip.xer5f"
> @@ -48,6 +49,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
>   C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
>   C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
>   C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
> +C7X_1_FW:am62dxx = "ipc_rpmsg_echo_linux.c75ss0-0.release.strip.out"
>   C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
>   C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
>   C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
> @@ -98,13 +100,6 @@ do_install:prepend:am62axx() {
>           )
>   }
>   
> -# Update the am62dxx ipc binaries to be consistent with other platforms
> -do_install:prepend:am62dxx() {
> -        ( cd ${S}/${IPC_FW_DIR}; \
> -                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
> -        )
> -}
> -
>   do_install() {
>       # IPC Firmware
>       for FW_NAME in ${IPC_FW_LIST}
> @@ -149,8 +144,8 @@ ALTERNATIVE:${PN}:am62axx = "\
>                       "
>   
>   ALTERNATIVE:${PN}:am62dxx = "\
> -                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
> -                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> +                    am62d-mcu-r5f0_0-fw   am62d-mcu-r5f0_0-fw-sec \
> +                    am62d-c75_x-fw        am62d-c75_x-fw-sec \
>                       "
>   
>   ALTERNATIVE:${PN}:j721e = "\
> @@ -243,6 +238,11 @@ ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmwar
>   ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
>   ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
>   
> +ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw-sec"
> +ALTERNATIVE_LINK_NAME[am62d-c75_x-fw]     = "${nonarch_base_libdir}/firmware/am62d-c75_x-fw"
> +ALTERNATIVE_LINK_NAME[am62d-c75_x-fw-sec] = "${nonarch_base_libdir}/firmware/am62d-c75_x-fw-sec"
> +
>   ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
>   ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw-sec"
>   ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
> @@ -364,6 +364,11 @@ ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_F
>   ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
>   ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
>   
> +ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
> +ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
> +ALTERNATIVE_TARGET[am62d-c75_x-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
> +ALTERNATIVE_TARGET[am62d-c75_x-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
> +
>   ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
>   ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
>   ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

