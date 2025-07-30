Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62370C83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 18:11:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.42557.1753899082479206147
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 11:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dF7bqbkI;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UIBLsf2846845;
	Wed, 30 Jul 2025 13:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753899081;
	bh=GSgDgfO8KT7aPYPmvdNbtc/BDgu1bj+CXmCnWOD+2hM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dF7bqbkIYGuhUdwMTVIWZo2SblaHBMTWY04yZnvMFDBRx00vK3yH0XzgVRtMFqOq9
	 Yl7+XInsn51W4mpByZGIc8zlPro0JLSZqKD6219iPemZe4rE2q3iGrM6bvArDfYHgJ
	 6pgcLUe5CXtVYQsNbIImTp1wYIQLp0rIvjRA6PtQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UIBLhH3374610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 13:11:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 13:11:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 13:11:21 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UIBKn51656346;
	Wed, 30 Jul 2025 13:11:20 -0500
Message-ID: <d922f58f-dc0b-4c2e-a8f2-9c65f353783a@ti.com>
Date: Wed, 30 Jul 2025 13:11:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH v2] ti-pka-fw: Add a recipe to package
 prebuilt PKA firmware
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250730180302.7507-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250730180302.7507-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Jul 2025 18:11:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18857

On 7/30/25 1:03 PM, Beleswar Padhi wrote:
> Add a recipe to install the PKA firmware in root filesystem needed by
> sa2_ul driver for PKA operations across all K3 platforms.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. Use MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS to package PKA firmware from
> within meta-ti itself.
> 2. Update LICENCE name and LIC_FILES_CHKSUM to appropriate licence from
> ti-linux-firmware.
> 
> Link to v1:
> https://lore.kernel.org/all/20250730074831.2640806-1-b-padhi@ti.com/
> 
>   meta-ti-bsp/conf/machine/include/k3.inc       |  1 +
>   .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
>   .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    | 38 +++++++++++++++++++
>   3 files changed, 40 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 7ec6b51e..fdcf193d 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -40,6 +40,7 @@ UBI_VOLNAME = "rootfs"
>   
>   # List common SoC features, may need to add touchscreen for specific machines
>   MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
>   
>   IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>   
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 863d1a7e..7fe2c592 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -18,6 +18,7 @@ TI_DM_FW_VERSION = "11.01.09"
>   TI_SYSFW_VERSION = "11.01.05"
>   TI_HSM_DEMO_FW_VERSION = "11.00.09"
>   TAD5212_FW_VERSION = "1.0.0.0"
> +TI_PKA_FW_VERSION = "2.1.0"
>   
>   TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
>   SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> new file mode 100644
> index 00000000..588bbb5e
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "PKA prebuilt binary firmware image"
> +
> +LICENSE = "TI-TFL | INSIDE Secure"
> +LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
> +
> +COMPATIBLE_MACHINE = "k3"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

You don't need this line above, this package is not customized based
on the specific machine, works the same for all.

> +
> +inherit update-alternatives

No need for update-alternatives, this is the only firmware that
can be selected to run on the PKA IP. Drop this line and all
the "ALTERNATIVE*" lines below.

Andrew

> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${TI_PKA_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +PKA_FW_DIR = "ti-pka"
> +
> +INSTALL_PKA_FW_DIR = "${nonarch_base_libdir}/firmware/${PKA_FW_DIR}"
> +
> +PKA_FW_NAME = "eip29t2_2.1.0.bin"
> +
> +do_install() {
> +    # Install Firmware
> +    install -d ${D}${INSTALL_PKA_FW_DIR}
> +    install -m 0644 ${S}/${PKA_FW_DIR}/${PKA_FW_NAME} ${D}${INSTALL_PKA_FW_DIR}
> +}
> +
> +# Set up names for the firmwares
> +ALTERNATIVE:${PN} = "eip29t2_2.1.0.bin"
> +
> +# Set up link names for the firmware
> +ALTERNATIVE_LINK_NAME[eip29t2_2.1.0.bin] = "${nonarch_base_libdir}/firmware/${PKA_FW_NAME}"
> +
> +# Create the firmware alternative
> +ALTERNATIVE_TARGET[eip29t2_2.1.0.bin] = "${INSTALL_PKA_FW_DIR}/${PKA_FW_NAME}"
> +
> +ALTERNATIVE_PRIORITY = "10"


