Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53126C8302E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 10:16:29 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.36041.1751278580132270979
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jun 2025 03:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SboEZmmF;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55UAGHd43300149;
	Mon, 30 Jun 2025 05:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751278577;
	bh=qyLGPI4DKM2LDJCXq6Vbo6iGmqa5//73BV/+hgJs1qo=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=SboEZmmFfa8VD09DT/bBIom5VclYI1UFfjxZZWBMQ39HF7ctTIjzZddxELr0XmQ7u
	 5tK/HoIIJNTDsNPjDcPwLz279RkFEPCo2WA+w0eRGC23DNW/xTP63mLlfwxO5ygSpg
	 DY1lgc4P0tHwx6HpHccjrYB6k9bOhjQKozqDL+qM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55UAGHpv1799922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 30 Jun 2025 05:16:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 30
 Jun 2025 05:16:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 30 Jun 2025 05:16:17 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55UAGFCs3706864;
	Mon, 30 Jun 2025 05:16:16 -0500
Message-ID: <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
Date: Mon, 30 Jun 2025 15:46:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti-bsp: Split out
 ti-edgeai-fw from ti-rtos-echo-test-fw
To: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250627202436.582570-1-afd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250627202436.582570-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jun 2025 10:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18731

Hi Andrew,

On 28/06/25 01:54, Andrew Davis via lists.yoctoproject.org wrote:
> TI EdgeAI firmware is distinct from the other "echo test" firmware
> provided by ti-rtos-echo-test-fw. It belongs in its own package.
> Split out the EdgeAI firmware from the "echo test" firmware.


Looks like the corresponding meta-arago patch for adding ti-edgeai-fw in 
filesystem
is missing from the meta-arago lists.

We have added ti-rtos-echo-test-fw in following recipes, so similar 
should be done
for ti-edgeai-fw to ensure that CICD builds [0] have EdgeAI C7x IPC 
firmwares packaged.


~/source/meta-arago$ find . | grep -rn "ti-rtos-echo-test-fw"
meta-arago-test/recipes-core/packagegroups/ti-test.bb:117: 
ti-rtos-echo-test-fw \
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb:70: 
ti-rtos-echo-test-fw \
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb:61:UTILS:append:k3 
= " ti-rtos-echo-test-fw"



[0]: 
https://software-dl.ti.com/cicd-report/linux/index.html?section=platform&platform=am62axx



--
Chirag



> Give this a higher ALTERNATIVE_PRIORITY so that if both are installed
> the default will still be EdgeAI firmware for AM62A devices.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb    | 58 +++++++++++++++++++
>   .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 29 +++++-----
>   2 files changed, 72 insertions(+), 15 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
>
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> new file mode 100644
> index 00000000..67150968
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
> @@ -0,0 +1,58 @@
> +SUMMARY = "TI EdgeAI prebuilt binary firmware images"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
> +
> +COMPATIBLE_MACHINE = "am62axx"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit update-alternatives
> +
> +PLAT_SFX = ""
> +PLAT_SFX:am62axx = "am62axx"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${CORESDK_RTOS_VERSION}"
> +PR = "${INC_PR}.1"
> +
> +# Secure Build
> +inherit ti-secdev
> +
> +IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
> +
> +INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
> +
> +C7X_1_FW = "dsp_edgeai_c7x_1_release_strip.out"
> +
> +IPC_FW_LIST = ""
> +IPC_FW_LIST:am62axx = "${C7X_1_FW}"
> +
> +do_install() {
> +    # Sign Firmware
> +    for FW_NAME in ${IPC_FW_LIST}
> +    do
> +        ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
> +    done
> +
> +    # Install Firmware
> +    install -d ${D}${INSTALL_IPC_FW_DIR}
> +    for FW_NAME in ${IPC_FW_LIST}
> +    do
> +        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}        ${D}${INSTALL_IPC_FW_DIR}
> +        install -m 0644 ${S}/${IPC_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_IPC_FW_DIR}
> +    done
> +}
> +
> +ALTERNATIVE:${PN}:am62axx = "\
> +                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
> +                    "
> +
> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
> +
> +ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
> +ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
> +
> +ALTERNATIVE_PRIORITY = "20"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> index 7fffc9de..3e4db129 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
> @@ -36,21 +36,20 @@ IPC_FW_DIR = "ti-ipc/${PLAT_SFX}"
>   
>   INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
>   
> -MCU_1_0_FW =       "ipc_echo_test_mcu1_0_release_strip.xer5f"
> -MCU_1_1_FW =       "ipc_echo_test_mcu1_1_release_strip.xer5f"
> -MCU_2_0_FW =       "ipc_echo_test_mcu2_0_release_strip.xer5f"
> -MCU_2_1_FW =       "ipc_echo_test_mcu2_1_release_strip.xer5f"
> -MCU_3_0_FW =       "ipc_echo_test_mcu3_0_release_strip.xer5f"
> -MCU_3_1_FW =       "ipc_echo_test_mcu3_1_release_strip.xer5f"
> -MCU_4_0_FW =       "ipc_echo_test_mcu4_0_release_strip.xer5f"
> -MCU_4_1_FW =       "ipc_echo_test_mcu4_1_release_strip.xer5f"
> -C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
> -C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
> -C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
> -C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
> -C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
> -C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
> -C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
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
>   
>   IPC_FW_LIST = ""
>   IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18717): https://lists.yoctoproject.org/g/meta-ti/message/18717
> Mute This Topic: https://lists.yoctoproject.org/mt/113868641/7030289
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

