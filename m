Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1489.1610046654665337702
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 11:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Eq+iQNwZ;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 680D238C0627
	for <meta-ti@yoctoproject.org>; Thu,  7 Jan 2021 19:10:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JAr0R127125
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:10:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610046653;
	bh=UV1SkUBHZ+KYq74ZqlnA1Z2Ndnmj+5QDsI3l+RDeWk0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Eq+iQNwZCz/40jYSN9qxTas9zCxf9QFV+cjCK7de5wfC5R+cP6MJwp+E+JfloE5AY
	 XJw0tqVVTYEQwsBTaAlajyY0VbisDrC3aoSvxQ0AIWSvvSPleztNAbLckBXLQmKqlr
	 UtCv4N8L5EjG7UCnakKZzFfxyyPjEv//fjBup1lI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JArFh064232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Jan 2021 13:10:53 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 13:10:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 13:10:53 -0600
Received: from [10.250.33.36] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JAr1k050187;
	Thu, 7 Jan 2021 13:10:53 -0600
Subject: Re: [meta-ti] [dunfell/master] [PATCH] am64xx: Add combined boot build support
To: <dmurphy@ti.com>, <meta-ti@yoctoproject.org>
References: <20210107132425.23218-1-dmurphy@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <8e260a85-d0dd-1572-1ec4-d7128cd295d2@ti.com>
Date: Thu, 7 Jan 2021 13:10:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107132425.23218-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/7/21 7:24 AM, Dan Murphy via lists.yoctoproject.org wrote:
> Add combined boot flow support for the AM64XX device.
> 
> From: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  conf/machine/am64xx-evm-k3r5.conf      |  4 +++-
>  conf/machine/am64xx-evm.conf           |  4 ++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ++++++++++++++++
>  recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
>  4 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
> index b788e634699d..dfeaeb570a55 100644
> --- a/conf/machine/am64xx-evm-k3r5.conf
> +++ b/conf/machine/am64xx-evm-k3r5.conf
> @@ -7,6 +7,8 @@ require conf/machine/include/k3r5.inc
>  SYSFW_SOC = "am64x"
>  SYSFW_CONFIG = "evm"
>  SYSFW_SUFFIX = "gp"
> -SYSFW_SYMLINK = "sysfw.itb"
>  
>  UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> +UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index c6ba2a8735f3..9336d4ae4c54 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -4,4 +4,8 @@
>  
>  require conf/machine/include/am64xx.inc
>  
> +IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> +
>  UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"

I see J7200 has two additional lines w.r.t trusted-firmware-a:do_deploy, do we
not need those lines for AM64xx or are they in error even on J7200?

> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 310c7d544030..4d4a9a349c70 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -2,6 +2,7 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>  
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
>  DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
> +DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
>  PR = "r1"
> @@ -52,6 +53,7 @@ EXTRA_OEMAKE_HS = " \
>  EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
>  
>  EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  
>  do_compile() {
>  	cd ${WORKDIR}/imggen/
> @@ -98,4 +100,18 @@ do_deploy_j7200-evm-k3r5() {
>  	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
>  }
>  
> +do_install_am64xx-evm-k3r5() {
> +	install -d ${D}/boot
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +do_deploy_am64xx-evm-k3r5() {
> +	install -d ${DEPLOYDIR}
> +	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> +}
> +
>  addtask deploy before do_build after do_compile
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index b7fd246aca6c..7ce3d7019431 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -41,6 +41,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
>  
>  PACKAGECONFIG_append_aarch64 = " atf optee"
>  PACKAGECONFIG_append_j7 = " dm"
> +PACKAGECONFIG_append_am64xx = " dm"

This looks wrong, AM64xx doesn't have Split SYSFW architecture, and there is no
DM firmware.

>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
> @@ -65,6 +66,7 @@ SPL_UART_BINARY_keystone = ""
>  SPL_UART_BINARY_k3r5 = ""
>  SPL_UART_BINARY_lego-ev3 = ""
>  SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
> +SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
>  
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> @@ -395,4 +397,8 @@ do_deploy_append_j7200-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
>  
> +do_deploy_append_am64xx-evm-k3r5 () {
> +	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> +	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +}

nit, please add a blank line after this blob.

regards
Suman

>  TOOLCHAIN = "gcc"
> 
> 
> 
> 
> 

