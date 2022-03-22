Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93B1C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:58:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.136.1647979137971296974
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 12:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC63940C3E;
	Tue, 22 Mar 2022 19:58:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvMTgvAyOfvw; Tue, 22 Mar 2022 19:58:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BDB0140B13;
	Tue, 22 Mar 2022 19:58:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 810B1174837; Tue, 22 Mar 2022 15:58:52 -0400 (EDT)
Date: Tue, 22 Mar 2022 15:58:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 1/7] machine: Add am62xx evm
 configuration
Message-ID: <20220322195852.GN23554@denix.org>
References: <20220322181558.20684-1-reatmon@ti.com>
 <20220322181558.20684-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322181558.20684-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 19:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14536

On Tue, Mar 22, 2022 at 01:15:52PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Lets add the basic AM62xx-evm configuration.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  conf/machine/am62xx-evm-k3r5.conf      | 11 +++++++++++
>  conf/machine/am62xx-evm.conf           | 13 +++++++++++++
>  conf/machine/include/am62xx.inc        | 17 +++++++++++++++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 18 ++++++++++++++++++
>  recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 conf/machine/am62xx-evm-k3r5.conf
>  create mode 100644 conf/machine/am62xx-evm.conf
>  create mode 100644 conf/machine/include/am62xx.inc
> 
> diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-evm-k3r5.conf
> new file mode 100644
> index 00000000..724a8d4a
> --- /dev/null
> +++ b/conf/machine/am62xx-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +
> +UBOOT_MACHINE = "am62x_evm_r5_defconfig"
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> new file mode 100644
> index 00000000..600abb58
> --- /dev/null
> +++ b/conf/machine/am62xx-evm.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62XX EVM
> +
> +require conf/machine/include/am62xx.inc
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am625-sk.dtb \
> +    ti/k3-am625-sk-lpmdemo.dtb \
> +    ti/k3-am625-minimal.dtb \
> +"
> +
> +UBOOT_MACHINE = "am62x_evm_a53_defconfig"
> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
> new file mode 100644
> index 00000000..06bac922
> --- /dev/null
> +++ b/conf/machine/include/am62xx.inc
> @@ -0,0 +1,17 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY_append = ":am62xx"
> +
> +MACHINE_FEATURES += "screen touchscreen"
> +
> +SERIAL_CONSOLES = "115200;ttyS2"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +
> +# AM64 supports multi-certificate images, use the same

Typo in the comment?


> +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> +
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +
> +TFA_BOARD = "lite"
> +OPTEEMACHINE = "k3-am65x"

Is it still correct? Are there specific am64 and am62 machine names in 
optee-os?


> +OPTEEOUTPUTMACHINE = "k3"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 646833a7..099473b4 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -6,6 +6,7 @@ DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
> +DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
>  PR = "${INC_PR}.2"
> @@ -29,6 +30,7 @@ SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
> +SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
>  
>  SYSFW_SUFFIX ?= "unknown"
>  
> @@ -63,6 +65,7 @@ EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-s
>  EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  
>  do_compile() {
>  	cd ${WORKDIR}/imggen/
> @@ -170,4 +173,19 @@ do_deploy_am64xx-hs-evm-k3r5() {
>          install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
> +do_install_am62xx-evm-k3r5() {
> +	install -d ${D}/boot
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +do_deploy_am62xx-evm-k3r5() {
> +	install -d ${DEPLOYDIR}
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> +	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> +}
> +
>  addtask deploy before do_build after do_compile
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 7ed6c5b4..6098f989 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -69,6 +69,7 @@ SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
> +SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
>  
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> @@ -419,4 +420,9 @@ do_deploy_append_am64xx-hs-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
>  
> +do_deploy_append_am62xx-evm-k3r5 () {
> +	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> +	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +}
> +
>  TOOLCHAIN = "gcc"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

