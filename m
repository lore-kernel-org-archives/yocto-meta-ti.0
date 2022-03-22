Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479AFC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 22:03:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1776.1647986612608056207
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 15:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF16340C3E;
	Tue, 22 Mar 2022 22:03:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8_Q2KXI5Ycd; Tue, 22 Mar 2022 22:03:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8D6E40B13;
	Tue, 22 Mar 2022 22:03:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 735C6174837; Tue, 22 Mar 2022 18:03:29 -0400 (EDT)
Date: Tue, 22 Mar 2022 18:03:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: detheridge@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH] ti-graphics: gpu enable and move all
 platforms to ddk 1.15
Message-ID: <20220322220329.GS23554@denix.org>
References: <20220322202930.18399-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322202930.18399-1-detheridge@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 22:03:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14544

On Tue, Mar 22, 2022 at 03:29:30PM -0500, Etheridge, Darren via lists.yoctoproject.org wrote:
> Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> 
> Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
> 
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>  conf/machine/am62xx-evm.conf                  |  2 +
>  conf/machine/j721s2-evm.conf                  |  2 +
>  .../ti-img-rogue-driver_1.13.5776728.bb       | 40 -----------------
>  .../ti-img-rogue-driver_1.15.6133109.bb       | 44 +++++++++++++++++++

Please lower the similarity threshold to produce a diff of this recipe for 
review, instead of separate remove/add.


>  ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 13 +++---
>  5 files changed, 55 insertions(+), 46 deletions(-)
>  delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
>  create mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
>  rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.5776728.bb => ti-img-rogue-umlibs_1.15.6133109.bb} (84%)
> 
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> index 600abb58..086e40e4 100644
> --- a/conf/machine/am62xx-evm.conf
> +++ b/conf/machine/am62xx-evm.conf
> @@ -4,6 +4,8 @@
>  
>  require conf/machine/include/am62xx.inc
>  
> +MACHINE_FEATURES += "gpu"
> +
>  KERNEL_DEVICETREE = " \
>      ti/k3-am625-sk.dtb \
>      ti/k3-am625-sk-lpmdemo.dtb \
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 82fd33da..e5ed0b73 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -4,6 +4,8 @@
>  
>  require conf/machine/include/j7.inc
>  
> +MACHINE_FEATURES += "gpu"
> +
>  SERIAL_CONSOLES = "115200;ttyS10"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  TFA_K3_USART = "0x8"
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> deleted file mode 100644
> index a05de0f2..00000000
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
> -HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> -LICENSE = "MIT | GPLv2"
> -LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
> -
> -inherit module features_check
> -
> -REQUIRED_MACHINE_FEATURES = "gpu"
> -
> -MACHINE_KERNEL_PR_append = "b"
> -PR = "${MACHINE_KERNEL_PR}"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7"
> -
> -DEPENDS = "virtual/kernel"
> -
> -PROVIDES = "virtual/gpudriver"
> -
> -BRANCH = "1.13-5776728/linux-k5.10"
> -
> -SRC_URI = " \
> -    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> -    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
> -
> -PVR_SOC = "j721e_linux"
> -PVR_BVNC = "22.104.208.318"
> -PVR_BUILD = "release"
> -PVR_WS = "wayland"
> -
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
> -
> -do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> -}
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> new file mode 100644
> index 00000000..fbff6c51
> --- /dev/null
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
> +HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> +LICENSE = "MIT | GPLv2"
> +LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
> +
> +inherit module features_check
> +
> +REQUIRED_MACHINE_FEATURES = "gpu"
> +
> +MACHINE_KERNEL_PR_append = "a"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> +
> +DEPENDS = "virtual/kernel"
> +
> +PROVIDES = "virtual/gpudriver"
> +
> +BRANCH = "linuxws/dunfell/k5.10/${PV}"
> +
> +SRC_URI = " \
> +    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> +    file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
> +
> +TARGET_PRODUCT_j7-evm = "j721e_linux"
> +TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> +TARGET_PRODUCT_am62xx = "am62_linux"
> +TARGET_BVNC_j7-evm = "22.104.208.318"
> +TARGET_BVNC_j721s2-evm = "36.53.104.796"
> +TARGET_BVNC_am62xx = "33.15.11.3"
> +PVR_BUILD = "release"
> +PVR_WS = "wayland"
> +
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +
> +do_install() {
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +}
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> similarity index 84%
> rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index 5194015e..e00dce99 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -8,17 +8,18 @@ inherit features_check
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7"
> +COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
>  
> -PR = "r3"
> +PR = "r1"
>  
>  BRANCH = "linuxws/dunfell/k5.10/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> +SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
>  
> -SRCREV = "5ef38353c38d921a65ea6df75c7b6ce710b66034"
> -
> -PVR_SOC ?= "j721e_linux"
> +TARGET_PRODUCT_j7-evm = "j721e_linux"
> +TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> +TARGET_PRODUCT_am62xx = "am62_linux"
>  PVR_BUILD ?= "release"
>  PVR_WS = "wayland"
>  
> @@ -50,7 +51,7 @@ RRECOMMENDS_${PN} += "ti-img-rogue-driver"
>  S = "${WORKDIR}/git"
>  
>  do_install () {
> -    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${PVR_SOC} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
> +    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
>      chown -R root:root ${D}
>  }
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

