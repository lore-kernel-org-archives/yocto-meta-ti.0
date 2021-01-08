Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.2590.1610124147945982469
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Jan 2021 08:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eIuuRpa4;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 57BE338C05C4
	for <meta-ti@yoctoproject.org>; Fri,  8 Jan 2021 16:42:27 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 108GgQZ4075355
	for <meta-ti@yoctoproject.org>; Fri, 8 Jan 2021 10:42:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610124146;
	bh=6B75SE7reWsHkDppBHXscPre20pLQ0pbb6Q5MUc7nnw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=eIuuRpa4MeE61ndkxNbYGqE5s/nRimV1iFyveb9WcbxeXiCSNf7s/cbi44A7+Ml/r
	 XUwj1ExzHtUNAcL3No7CyCwz8zDizMu+K3SepF1coQ26KPLfF9XYqqG68LoLxE6Hml
	 OExKD9LVV4kne+tm1tSrnEjTj3WvS3Tw5DFrRPHU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 108GgQ3h042255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 8 Jan 2021 10:42:26 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 10:42:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 Jan 2021 10:42:26 -0600
Received: from [10.250.66.86] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 108GgPjb097786;
	Fri, 8 Jan 2021 10:42:25 -0600
Subject: Re: [meta-ti] [dunfell/master] [PATCH v3] am64xx: Add combined boot build support
To: <dmurphy@ti.com>, <meta-ti@yoctoproject.org>
References: <20210107192625.24167-1-dmurphy@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <3341fc3d-bb7f-bcad-7d09-f244c37f18a2@ti.com>
Date: Fri, 8 Jan 2021 10:42:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107192625.24167-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/7/21 1:26 PM, Dan Murphy via lists.yoctoproject.org wrote:
> Add combined boot flow support for the AM64XX device.

The patch you merged [1] doesn't exactly match this. The one you pushed
still has the following line set in u-boot-ti.inc

PACKAGECONFIG_append_am64xx = " dm"

regards
Suman

[1]
http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=89402b1230533444fa1f96138d98a6e037996ed2

> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  conf/machine/am64xx-evm-k3r5.conf      |  4 +++-
>  conf/machine/am64xx-evm.conf           |  8 ++++++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc    |  6 +++---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 16 ++++++++++++++++
>  recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
>  5 files changed, 36 insertions(+), 4 deletions(-)
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
> index c6ba2a8735f3..eda310a32b14 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -4,4 +4,12 @@
>  
>  require conf/machine/include/am64xx.inc
>  
> +IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
> +
>  UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> +
> +do_image_wic[depends] += "trusted-firmware-a:do_deploy"
> +do_image_tar[depends] += "trusted-firmware-a:do_deploy"
> +
> +do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 174d9539e152..ae22b7a59fca 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -4,11 +4,11 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2020.08b"
> -PV_am64xx-evm-k3r5 = "2020.23"
> +PV_am64xx-evm-k3r5 = "2020.12"
>  
> -SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
> +SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
> +SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
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
> index b7fd246aca6c..dc8d6b060529 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -65,6 +65,7 @@ SPL_UART_BINARY_keystone = ""
>  SPL_UART_BINARY_k3r5 = ""
>  SPL_UART_BINARY_lego-ev3 = ""
>  SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
> +SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
>  
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> @@ -395,4 +396,9 @@ do_deploy_append_j7200-evm-k3r5 () {
>  	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>  }
>  
> +do_deploy_append_am64xx-evm-k3r5 () {
> +	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> +	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> +}
> +
>  TOOLCHAIN = "gcc"
> 
> 
> 
> 
> 

