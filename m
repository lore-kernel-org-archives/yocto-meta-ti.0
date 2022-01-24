Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.209.1643045067773655630
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 09:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACE2540C93;
	Mon, 24 Jan 2022 17:24:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKlqiYg_jJbR; Mon, 24 Jan 2022 17:24:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7917440C22;
	Mon, 24 Jan 2022 17:24:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B1EF2174721; Mon, 24 Jan 2022 12:24:21 -0500 (EST)
Date: Mon, 24 Jan 2022 12:24:21 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com, Nishanth Menon <nm@ti.com>
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] machine: Add j721s2 evm configuration
Message-ID: <20220124172421.GT26229@denix.org>
References: <20220124151413.3861-1-reatmon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220124151413.3861-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 09:14:13AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  conf/machine/j721s2-evm-k3r5.conf      | 11 +++++++++++
>  conf/machine/j721s2-evm.conf           | 22 ++++++++++++++++++++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 23 +++++++++++++++++++++--
>  recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
>  4 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 conf/machine/j721s2-evm-k3r5.conf
>  create mode 100644 conf/machine/j721s2-evm.conf
> 
> diff --git a/conf/machine/j721s2-evm-k3r5.conf b/conf/machine/j721s2-evm-k3r5.conf
> new file mode 100644
> index 00000000..508e96e5
> --- /dev/null
> +++ b/conf/machine/j721s2-evm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "j721s2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +
> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> new file mode 100644
> index 00000000..82fd33da
> --- /dev/null
> +++ b/conf/machine/j721s2-evm.conf
> @@ -0,0 +1,22 @@
> +#@TYPE: Machine
> +#@NAME: J721S2 EVM
> +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM
> +
> +require conf/machine/include/j7.inc
> +
> +SERIAL_CONSOLES = "115200;ttyS10"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"


> +TFA_K3_USART = "0x8"
> +OPTEE_K3_USART = "0x8"

Are these new variables? Where are they coming from?


> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-j721s2-common-proc-board.dtb \
> +"
> +
> +UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> +
> +# J721S2 supports multi-certificate images, use the same
> +IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
> +
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 13ae1f6b..d70d664c 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -3,11 +3,12 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
>  DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
> +DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  # Loaded by R5F core
>  COMPATIBLE_MACHINE = "k3r5"
> @@ -23,10 +24,11 @@ SYSFW_CONFIG ?= "unknown"
>  
>  SYSFW_PREFIX = "ti-sci-firmware"
>  SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
> -SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
> +SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
>  SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
> +SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
>  
>  SYSFW_SUFFIX ?= "unknown"
>  
> @@ -63,6 +65,7 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
>  
>  EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  
> @@ -127,6 +130,21 @@ do_deploy_j7200-hs-evm-k3r5() {
>          install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
> +do_install_j721s2-evm-k3r5() {
> +	install -d ${D}/boot
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +do_deploy_j721s2-evm-k3r5() {
> +	install -d ${DEPLOYDIR}
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> +	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> +}
> +
>  do_install_am64xx-evm-k3r5() {
>  	install -d ${D}/boot
>  	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> @@ -156,4 +174,5 @@ do_deploy_am64xx-hs-evm-k3r5() {
>          ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
>          install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
> +
>  addtask deploy before do_build after do_compile
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index f9cbb074..aceabe86 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -66,6 +66,7 @@ SPL_UART_BINARY_k3r5 = ""
>  SPL_UART_BINARY_lego-ev3 = ""
>  SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
> +SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
>  SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
>  
> @@ -403,6 +404,11 @@ do_deploy_append_j7200-hs-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
>  
> +do_deploy_append_j721s2-evm-k3r5 () {
> +	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> +	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +}
> +
>  do_deploy_append_am64xx-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> -- 
> 2.17.1
> 
