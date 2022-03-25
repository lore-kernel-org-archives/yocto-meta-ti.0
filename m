Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6579C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 20:10:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.571.1648239011238137100
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 13:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D6E640C46;
	Fri, 25 Mar 2022 20:10:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqjoaZ8_hsy5; Fri, 25 Mar 2022 20:10:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F2EAA40B05;
	Fri, 25 Mar 2022 20:10:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C238B1748B6; Fri, 25 Mar 2022 16:10:07 -0400 (EDT)
Date: Fri, 25 Mar 2022 16:10:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Darren Etheridge <detheridge@ti.com>
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move
 all platforms to ddk 1.15
Message-ID: <20220325201007.GG23554@denix.org>
References: <20220323193707.28162-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323193707.28162-1-detheridge@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 20:10:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14554

On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote:
> Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> 
> Migrate Imagination DDK 1.13 to DDK 1.15 for J721e

Overall looks good, please see inline below.


> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
> 
> No changes in the content of the patch, however I regenerated it with the 
> similarity threshold reduced as requested by Denys.
> 
>  conf/machine/am62xx-evm.conf                  |  2 ++
>  conf/machine/j721s2-evm.conf                  |  2 ++
>  ...bb => ti-img-rogue-driver_1.15.6133109.bb} | 20 +++++++++++--------
>  ...bb => ti-img-rogue-umlibs_1.15.6133109.bb} | 13 ++++++------
>  4 files changed, 23 insertions(+), 14 deletions(-)
>  rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.13.5776728.bb => ti-img-rogue-driver_1.15.6133109.bb} (48%)
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
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> similarity index 48%
> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index a05de0f2..fbff6c51 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -7,17 +7,17 @@ inherit module features_check
>  
>  REQUIRED_MACHINE_FEATURES = "gpu"
>  
> -MACHINE_KERNEL_PR_append = "b"
> +MACHINE_KERNEL_PR_append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE = "j7"
> +COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
>  
>  DEPENDS = "virtual/kernel"
>  
>  PROVIDES = "virtual/gpudriver"
>  
> -BRANCH = "1.13-5776728/linux-k5.10"
> +BRANCH = "linuxws/dunfell/k5.10/${PV}"
>  
>  SRC_URI = " \
>      git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> @@ -26,15 +26,19 @@ SRC_URI = " \
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "35a25875ae8738f82c7cabc6b077ef992b0cca84"
> +SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
>  
> -PVR_SOC = "j721e_linux"

I was actually thinking of keeping PVR_SOC variable and moving it to 
corresponding machine configs.


> -PVR_BVNC = "22.104.208.318"
> +TARGET_PRODUCT_j7-evm = "j721e_linux"
> +TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> +TARGET_PRODUCT_am62xx = "am62_linux"

E.g. instead of these 3 overrides in the recipe, those 3 machines will be 
setting their respective PVR_SOC variables, which is more descriptive than 
TARGET_PRODUCT.

Similar to how machine configs already set KERNEL_DEVICETREE, UBOOT_MACHINE, 
TFA_PLATFORM or OPTEEMACHINE.

I know SGX been using TARGET_PRODUCT historically, but outside of the recipe 
it won't make much sense.

But it may be too disruptive for Dunfell at this point. I can do such change 
in master when porting this patch over on top of Andrew's changes.


> +TARGET_BVNC_j7-evm = "22.104.208.318"
> +TARGET_BVNC_j721s2-evm = "36.53.104.796"
> +TARGET_BVNC_am62xx = "33.15.11.3"
>  PVR_BUILD = "release"
>  PVR_WS = "wayland"
>  
> -EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
>  
>  do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>  }
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

Same here.


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

