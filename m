Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2461EC636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 23:41:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.31426.1676331664313044302
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 15:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yqpEvqfQ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DNf0IY032313;
	Mon, 13 Feb 2023 17:41:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676331660;
	bh=KE9kc330DzD/SrzZOcu121ZcZ4xEJ4sX9merGH6EDnE=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=yqpEvqfQuQ+qSOZLDusY9aYEDuvOXMUPJtfnlBwHumXU6yu8iKXrzzXrcBwWvX9c8
	 8YjmW0Uno+1G+Hpmz/2AN2Yp7xajDK6hrsz8aZnJdDWNdIpFHjv9UO/TkOYSNb9Opg
	 HAe7Hu3n8RRvWtGvWpoh/8lcrB17o7/uhbCA/PeM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DNf0as024122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 17:41:00 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 17:40:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Feb 2023 17:40:59 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31DNex8k050454;
	Mon, 13 Feb 2023 17:40:59 -0600
Message-ID: <4021b830-1d72-0a57-6a09-cb5df8452753@ti.com>
Date: Mon, 13 Feb 2023 17:40:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][dunfell][RFC PATCH v2] am62axx-evm: Add support for
 HS-FS and HS-SE platforms
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>
CC: <g-gupta@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20230210000834.24783-1-s-adivi@ti.com>
Content-Language: en-US
In-Reply-To: <20230210000834.24783-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 23:41:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15829



On 2/9/2023 18:08, Sai Sree Kartheek Adivi wrote:
> Add support for HS-FS and HS-SE along with GP platforms and make HS-FS default.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>   conf/machine/am62axx-evm-k3r5-gp.conf         | 21 +++++++++++++++++++
>   conf/machine/am62axx-evm-k3r5-hs-fs.conf      | 15 +++++++++++++
>   conf/machine/am62axx-evm-k3r5-hs-se.conf      | 20 ++++++++++++++++++
>   conf/machine/am62axx-evm-k3r5.conf            | 11 ----------
>   conf/machine/include/am62axx.inc              | 21 ++++++++++++++++---
>   conf/multiconfig/k3r5-hs-fs.conf              |  3 +++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  2 ++
>   .../trusted-firmware-a_%.bbappend             |  4 ++++
>   recipes-security/optee/optee-os_%.bbappend    |  4 ++++
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 16 ++++++++++++++
>   10 files changed, 103 insertions(+), 14 deletions(-)
>   create mode 100644 conf/machine/am62axx-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/am62axx-evm-k3r5-hs-fs.conf
>   create mode 100644 conf/machine/am62axx-evm-k3r5-hs-se.conf
>   delete mode 100644 conf/machine/am62axx-evm-k3r5.conf
>   create mode 100644 conf/multiconfig/k3r5-hs-fs.conf
> 
> diff --git a/conf/machine/am62axx-evm-k3r5-gp.conf b/conf/machine/am62axx-evm-k3r5-gp.conf
> new file mode 100644
> index 00000000..898af7e8
> --- /dev/null
> +++ b/conf/machine/am62axx-evm-k3r5-gp.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@NAME: AM62A GP EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62A GP EVM (R5F core)
> +
> +# Booting GP requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-gp"
> +
> +SYSFW_SOC = "am62ax"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +SYSFW_TIBOOT3_SYMLINK = ""

There are build errors with this patch.  k3-image-gen is configured to 
build sysfw for am62axx so two things need to occur.

1) You need an extra variable here to avoid the do_deploy duplication 
errors.

    SYSFW_SYMLINK = ""


2) I need to patch ti-sci-fw_git.bb to remove the collision on the 
sysfw.itb files deployed by the recipe.  I have already sent this patch 
to the list.


> +
> +UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
> +
> diff --git a/conf/machine/am62axx-evm-k3r5-hs-fs.conf b/conf/machine/am62axx-evm-k3r5-hs-fs.conf
> new file mode 100644
> index 00000000..2ecba7e4
> --- /dev/null
> +++ b/conf/machine/am62axx-evm-k3r5-hs-fs.conf
> @@ -0,0 +1,15 @@
> +#@TYPE: Machine
> +#@NAME: AM62A HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62A HS-FS EVM (R5F core)
> +
> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-hs-fs"
> +
> +SYSFW_SOC = "am62ax"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> +
> diff --git a/conf/machine/am62axx-evm-k3r5-hs-se.conf b/conf/machine/am62axx-evm-k3r5-hs-se.conf
> new file mode 100644
> index 00000000..76d01a0e
> --- /dev/null
> +++ b/conf/machine/am62axx-evm-k3r5-hs-se.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: AM62A HS-SE EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62A HS-SE EVM (R5F core)
> +
> +# Booting HS-SE requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-hs-se"
> +
> +SYSFW_SOC = "am62ax"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs" > +SYSFW_TIBOOT3_SYMLINK = ""

Same as above.  Add:

    SYSFW_SYMLINK = ""

> +
> +UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am62axx-evm-k3r5.conf b/conf/machine/am62axx-evm-k3r5.conf
> deleted file mode 100644
> index ca30537f..00000000
> --- a/conf/machine/am62axx-evm-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM62AXX EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM62Axx EVM (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "am62ax"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "gp"
> -
> -UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
> diff --git a/conf/machine/include/am62axx.inc b/conf/machine/include/am62axx.inc
> index 383d1c3f..71a03e98 100644
> --- a/conf/machine/include/am62axx.inc
> +++ b/conf/machine/include/am62axx.inc
> @@ -8,9 +8,24 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
>   TFA_K3_SYSTEM_SUSPEND = "1"
>   
> -do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> -
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am62x"
>   OPTEEOUTPUTMACHINE = "k3"
> +
> +# Default tiboot3.bin on AM62Ax is for HS-FS
> +BBMULTICONFIG = "k3r5-hs-fs"
> +do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM62Ax is for HS-FS, add a version for GP
> +BBMULTICONFIG += "k3r5-gp"
> +IMAGE_BOOT_FILES += " tiboot3-am62ax-gp-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM62Ax is for HS-FS, add a version for HS-SE
> +BBMULTICONFIG += "k3r5-hs-se"
> +IMAGE_BOOT_FILES += " tiboot3-am62ax-hs-se-evm.bin"

This path is wrong.  It is based on the SYSFW_SUFFIX which is "hs" for 
this multiconfig.  Change to:

IMAGE_BOOT_FILES += " tiboot3-am62ax-hs-evm.bin"


> +do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +
> diff --git a/conf/multiconfig/k3r5-hs-fs.conf b/conf/multiconfig/k3r5-hs-fs.conf
> new file mode 100644
> index 00000000..c6d58ead
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-hs-fs.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append = "-hs-fs"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 7896c366..a9418514 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -42,6 +42,8 @@ SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
>   SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62axx-evm-k3r5-hs-fs = "fs"
> +SYSFW_PREFIX_am62axx-evm-k3r5-hs-se = "fs"
>   
>   SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>   
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 41071676..70406724 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -39,6 +39,10 @@ do_compile_append_am62xx-lp-evm() {
>           tfa_sign_k3hs
>   }
>   
> +do_compile_append_am62axx-evm() {
> +        tfa_sign_k3hs
> +}
> +
>   do_compile_append_j7-hs-evm() {
>   	tfa_sign_k3hs
>   }
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 91abbcee..8ef535cc 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -80,6 +80,10 @@ do_compile_append_am62xx-lp-evm() {
>       optee_sign_k3hs
>   }
>   
> +do_compile_append_am62axx-evm() {
> +    optee_sign_k3hs
> +}
> +
>   do_compile_append_j7-hs-evm() {
>       optee_sign_k3hs
>   }
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 72d85a6b..da7ff4e8 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -188,6 +188,20 @@ do_install_prepend_am62xx() {
>           )
>   }
>   
> +do_install_prepend_am62axx-evm() {
> +        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> +        ( cd ${RTOS_DM_FW_DIR}; \
> +                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +        )
> +        ( cd ${RTOS_IPC_FW_DIR}; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh am62a-mcu-r5f0_0-fw \
> +                    am62a-mcu-r5f0_0-fw.signed; \
> +                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_test_c7x_1_release_strip.xe71 \
> +                    ipc_echo_test_c7x_1_release_strip.xe71.signed; \
> +        )
> +}
> +
>   #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
>   do_install() {
>   
> @@ -369,8 +383,10 @@ do_install_am62axx() {
>       install -d ${LEGACY_IPC_FW_DIR}
>       # DM+IPC Firmware
>       install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/am62a-mcu-r5f0_0-fw.signed ${LEGACY_IPC_FW_DIR}
>       install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
>       install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
> +    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71.signed ${LEGACY_IPC_FW_DIR}
>   }
>   
>   do_deploy() {

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

