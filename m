Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AB2C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 18:57:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.13476.1653418645069409067
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 May 2022 11:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED71240CBF;
	Tue, 24 May 2022 18:57:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuD2tJNgBEoC; Tue, 24 May 2022 18:57:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B506440CBD;
	Tue, 24 May 2022 18:57:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E6941174951; Tue, 24 May 2022 14:57:19 -0400 (EDT)
Date: Tue, 24 May 2022 14:57:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [master PATCH] all: Stop using git://git.ti.com
Message-ID: <20220524185719.GO9834@denix.org>
References: <20220524181314.7038-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524181314.7038-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 May 2022 18:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14754

NAK, this is incorrect.


On Tue, May 24, 2022 at 01:13:14PM -0500, Nishanth Menon wrote:
> Stop using un-encrypted git:// protocol to access TI repositories.
> 
> This is inline with the same arguments as made by github in [1]
> 
> This patch was generated via the following script:
> git grep "git://git.ti.com" .|cut -d ':' -f1|sort -u|xargs sed -i -e "s/git:\/\/git.ti.com/https:\/\/git.ti.com\/git/g"
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Applies on: master                 2124e7ecd88d dsptop: fix host contamination warning
> 
>  meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb       | 2 +-
>  meta-ti-bsp/recipes-bsp/cmem/cmem.inc                         | 2 +-
>  meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb    | 2 +-
>  .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 2 +-
>  .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 2 +-
>  .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 2 +-
>  .../recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb | 2 +-
>  .../recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb | 2 +-
>  meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
>  .../trusted-firmware-a/trusted-firmware-a_%.bbappend          | 2 +-
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                  | 2 +-
>  meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc     | 2 +-
>  meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb            | 2 +-
>  meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
>  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb        | 2 +-
>  .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb               | 2 +-
>  .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb    | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb     | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb     | 2 +-
>  meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb      | 2 +-
>  meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc                         | 2 +-
>  meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc                  | 2 +-
>  meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb        | 2 +-
>  meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                 | 2 +-
>  meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb         | 2 +-
>  meta-ti-extras/recipes-bsp/dsptop/dsptop.inc                  | 2 +-
>  meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb           | 2 +-
>  meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb                | 2 +-
>  meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb  | 2 +-
>  meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb      | 2 +-
>  .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb              | 2 +-
>  .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb      | 2 +-
>  meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb    | 2 +-
>  meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc             | 2 +-
>  meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb             | 2 +-
>  meta-ti-extras/recipes-ti/dsplib/dsplib.inc                   | 2 +-
>  meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc                 | 4 ++--
>  meta-ti-extras/recipes-ti/mathlib/mathlib.inc                 | 2 +-
>  meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb      | 4 ++--
>  meta-ti-extras/recipes-ti/swtools/swtools_git.bb              | 2 +-
>  .../recipes-ti/uio-test-pruss/uio-test-pruss_git.bb           | 2 +-
>  41 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index 004866773da0..023e8ed76d34 100644
> --- a/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -9,7 +9,7 @@ PR = "r0"
>  SRCREV = "fb484c5e54f2e31cf0a338d2927a06a2870bcc2c"
>  BRANCH ?= "ti-v4.1.y"
>  
> -SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> index 99717f87653e..921b83bfb0e6 100644
> --- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> +++ b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
> @@ -9,7 +9,7 @@ SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
>  
>  PV = "4.20.00.01+git${SRCPV}"
>  
> -SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/ipc/ludev.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  COMPATIBLE_HOST ?= "null"
> diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 371086c1653a..db7b54b1c8db 100755
> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -13,7 +13,7 @@ PROTOCOL = "git"
>  BRANCH = "master"
>  SRCREV = "91f1628507bf7f8716f0bc7cafe88ad7f14c94f5"
>  
> -SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> index f7771caf0502..24d3fb908248 100644
> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> @@ -15,7 +15,7 @@ BRANCH = "ti-${PV}-k5.10"
>  
>  SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git/src"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> index 2f4a73546bea..9162527b15eb 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> @@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
>  BRANCH = "linuxws/dunfell/k5.10/${PV}"
>  
>  SRC_URI = " \
> -    git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
> +    https://git.ti.com/git/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
>      file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
>      file://0001-rgxinit.c-cast-boolean-value-to-IMG_BOOL.patch \
>  "
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 2ec2ffef56b6..7bb0b53f625e 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -20,7 +20,7 @@ PROVIDES = "virtual/gpudriver"
>  
>  BRANCH = "ti-img-sgx/${PV}/k5.10"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> index 718fdbe12246..dc5199fd7963 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> @@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> index 4dc81c54c6a1..05c0a12eecb0 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> @@ -15,6 +15,6 @@ EXTRA_OEMAKE = "CC="${CC}""
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 47e76347d6a0..a5089d435b56 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -30,8 +30,8 @@ SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> -	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
> -	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
> +	https://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
> +	https://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
>  "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 45d564512176..83d8f0f07c3e 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,7 +1,7 @@
>  PV:k3 = "2.6"
>  LIC_FILES_CHKSUM:k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  BRANCH:k3 = "ti-atf"
> -SRC_URI:k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> +SRC_URI:k3 = "https://git.ti.com/git/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
>  SRCREV_tfa:k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
>  COMPATIBLE_MACHINE:k3 = "k3"
>  TFA_BUILD_TARGET:k3 = "all"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index dddf628443e0..0a7fcc6e607f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -16,7 +16,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  
>  BRANCH ?= "master"
> -UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
> +UBOOT_GIT_URI = "https://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>  UBOOT_GIT_PROTOCOL = "git"
>  SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> index 5b9ac50e8e30..38197f29b777 100644
> --- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -7,7 +7,7 @@ UIO_MODULE_DRV_SRCREV = "78c535afe8f8cc0b715500a63eab0bc3606c0579"
>  
>  PV = "2.3.1.0+git${SRCPV}"
>  
> -UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
> +UIO_MODULE_DRV_GIT_URI = "https://git.ti.com/git/keystone-linux/uio-module-drv.git"
>  UIO_MODULE_DRV_GIT_PROTOCOL = "git"
>  SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
> index 5ca6b62e7b67..2a54b07b05a1 100644
> --- a/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/vpe-tests/vpe-tests_git.bb
> @@ -14,7 +14,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> index 3f542da4aa96..59a069103a71 100644
> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> @@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "k3"
>  BRANCH ?= "master"
>  SRCREV = "966a5695b73bc53039ca60d196b77de0640088d4"
>  
> -SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index ab72c1093738..f200e1131aaf 100644
> --- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -13,7 +13,7 @@ CLEANBROKEN = "1"
>  
>  BRANCH = "ti-${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
>  
>  RRECOMMENDS:${PN} = "ti-gc320-driver"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> index 115344b1e7a6..16949934e97f 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> @@ -14,7 +14,7 @@ PR = "r1"
>  
>  BRANCH = "linuxws/dunfell/k5.10/${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
>  SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
>  
>  TARGET_PRODUCT:j721e = "j721e_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index d0edf1fe8e77..8619d19efe4e 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -14,7 +14,7 @@ PR = "r37"
>  
>  BRANCH = "ti-img-sgx/dunfell/${PV}"
>  
> -SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
>  
>  TARGET_PRODUCT:omap-a15 = "jacinto6evm"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> index af823b98bea5..603552650386 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
> @@ -32,7 +32,7 @@ KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += " \
>      ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
> -    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
> +    https://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
>      file://defconfig \
>  "
>  
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index a0581cb4ace3..c4a57bbc0a0c 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -32,7 +32,7 @@ PV = "5.10.109+git${SRCPV}"
>  MACHINE_KERNEL_PR:append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 9b2d1be1de90..f17f3dd5ec3e 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -28,7 +28,7 @@ PV = "5.4.106+git${SRCPV}"
>  MACHINE_KERNEL_PR:append = "a"
>  PR = "${MACHINE_KERNEL_PR}"
>  
> -KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI = "https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> index 3f6b7bce2d3e..b0f9accee529 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
> @@ -4,7 +4,7 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>  
> -TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
> +TI_IPC_GIT_URI = "https://git.ti.com/git/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
>  TI_IPC_GIT_BRANCH = "master"
>  
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> index 10349b58c51d..827317d09165 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=7198
>  
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
> +SRC_URI = "https://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>  
>  # Initial 0.4.1 release
>  SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index 67b1d2a9e31d..3d805f93edcd 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -16,7 +16,7 @@ PLAT_SFX:am65xx = "/am65xx"
>  PLAT_SFX:am64xx = "/am64x"
>  
>  # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
> -TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
> +TI_RTOS_METADATA_URI ?= "https://git.ti.com/git/processor-sdk/coresdk_rtos_releases.git"
>  TI_RTOS_METADATA_PROTOCOL ?= "git"
>  TI_RTOS_METADATA_SRCREV ?= "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
>  TI_RTOS_METADATA_BRANCH ?= "master"
> diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> index 28edf614a431..6baef8a17ea7 100644
> --- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
> @@ -8,7 +8,7 @@ CLEANBROKEN = "1"
>  
>  SRCREV = "0ee619b598d023fffc77679f099bc2a4815510e4"
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/ti-bt/service-packs.git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> index d9d4ef7ed2c5..1ef4c86b24f1 100644
> --- a/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> @@ -8,7 +8,7 @@ inherit features_check
>  
>  REQUIRED_MACHINE_FEATURES = "dsp"
>  
> -SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> +SRC_URI = "https://git.ti.com/git/glsdk/dspdce.git;protocol=git"
>  
>  SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
>  
> diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
> index 31f775e27bc3..e24e904618fb 100644
> --- a/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
> +++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop.inc
> @@ -3,6 +3,6 @@ SRCREV = "816485e68430bbec643eac9498bfa5303eb2c2e1"
>  PV = "1.4.0"
>  INC_PR = "r2"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
> diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index e2302d580d2a..842401d15762 100644
> --- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -11,7 +11,7 @@ REQUIRED_MACHINE_FEATURES = "mmip"
>  
>  RDEPENDS:${PN} = "libdce"
>  
> -SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
> +SRC_URI = "https://git.ti.com/git/ivimm/ipumm.git;protocol=git"
>  
>  SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
>  
> diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> index cb2f8cc25bd7..272435719ba8 100644
> --- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> +++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f
>  inherit update-alternatives
>  
>  BRANCH = "master"
> -SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "ae1decf0b494b2904e6157e1379691ffc468f0cf"
>  
>  PV = "6.1.0"
> diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> index 09968993c557..a51cfe497962 100644
> --- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> +++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> @@ -3,7 +3,7 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
>  
>  SRC_URI = " \
> -	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
> +	https://git.ti.com/git/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
>  	file://0001-Add-Makefile-to-install-firmware-files.patch \
>  "
>  
> diff --git a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> index e5912e810b6c..5034e26f180a 100644
> --- a/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> +++ b/meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
> @@ -8,7 +8,7 @@ INITSCRIPT_PARAMS = "defaults 03"
>  inherit update-rc.d
>  
>  SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
> -SRC_URI = "git://git.ti.com/ti-bt/uim.git;branch=master;protocol=https"
> +SRC_URI = "https://git.ti.com/git/ti-bt/uim.git;branch=master;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> index 1b9710afc427..524b836476a1 100644
> --- a/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> +++ b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
> @@ -7,7 +7,7 @@ RDEPENDS:${PN} = "wl18xx-fw"
>  
>  #Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=master \
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=master \
>             file://0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch \  
>            "
>  
> diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> index e553ff49afc7..0072b79923ad 100644
> --- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> +++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c
>  # Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
>  BRANCH = "sitara-scripts"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH} \
>  file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
>  "
>  
> diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> index a6f62239f293..0643211aec7f 100644
> --- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> +++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
>  
>  # Tag: R8.7_SP3 (8.7.3)
>  SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
> -SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git;branch=master"
> +SRC_URI = "https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git;branch=master"
>  
>  S = "${WORKDIR}/git/wlconf"
>  
> diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
> index eeb18fb15dd3..f9608903c372 100644
> --- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
> +++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x.inc
> @@ -4,6 +4,6 @@ SRCREV = "dd0c82fb5763a6b32dc6d68e561efb66ab8283d7"
>  PV = "1.1.0"
>  INC_PR = "r7"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
> diff --git a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
> index ece07183f62e..7fc21f9371af 100644
> --- a/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
> +++ b/meta-ti-extras/recipes-ti/ctoolslib/libaet_git.bb
> @@ -7,7 +7,7 @@ PV = "4.19.0.0"
>  
>  LIC_FILES_CHKSUM = "file://../ctoolslib_manifest.html;md5=b7dd369a2e07ef9a71795ee5a9bd01bd"
>  
> -SRC_URI = "git://git.ti.com/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
> +SRC_URI = "https://git.ti.com/git/sdo-emu/ctoolslib.git;protocol=git;branch=opencl_aetlib_build"
>  SRCREV = "de7954abab0f0caa8a2c7b53095c30226d901a31"
>  
>  DEPENDS = "ti-cgt6x-native"
> diff --git a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> index 85d79ae31cad..d018c72e3ee1 100644
> --- a/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> +++ b/meta-ti-extras/recipes-ti/dsplib/dsplib.inc
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  DSPLIB_GIT_BRANCH = "master"
>  DSPLIB_GIT_PROTOCOL = "git"
> -DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
> +DSPLIB_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/dsplib.git"
>  DSPLIB_SRCREV = "0390b171042c602e07669fd28a371cc319b90161"
>  
>  SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> index 56667ad1fb3f..45cc9fea3352 100644
> --- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -1,6 +1,6 @@
>  require recipes-ti/includes/ti-paths.inc
>  
> -TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
> +TI_IPC_EXAMPLES_GIT_URI = "https://git.ti.com/git/ipc/ipc-examples.git"
>  TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
>  TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
>  TI_IPC_EXAMPLES_GIT_BRANCH = "master"
> @@ -12,7 +12,7 @@ protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
>  branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
>  name=${TI_IPC_EXAMPLES_NAME}"
>  
> -TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
> +TI_IPC_METADATA_GIT_URI = "https://git.ti.com/git/ipc/ipc-metadata.git"
>  TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
>  TI_IPC_METADATA_GIT_PROTOCOL = "git"
>  TI_IPC_METADATA_GIT_BRANCH = "master"
> diff --git a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> index fe75c09943da..086c32a81ccb 100644
> --- a/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> +++ b/meta-ti-extras/recipes-ti/mathlib/mathlib.inc
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  MATHLIB_GIT_BRANCH = "master"
>  MATHLIB_GIT_PROTOCOL = "git"
> -MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
> +MATHLIB_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/mathlib.git"
>  MATHLIB_SRCREV = "eadcc9547faf69789661b004bb0b5ef53bb69951"
>  
>  SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
> diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> index 7c4a3409d3cc..850d5e04925b 100644
> --- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> +++ b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "TI OpenMP RTOS"
> -HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
> +HOMEPAGE = "https://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>  LICENSE = "BSD-3-Clause"
>  
>  require recipes-ti/includes/ti-paths.inc
> @@ -12,7 +12,7 @@ REQUIRED_DISTRO_FEATURES = "openmp"
>  PV = "2_06_03_00"
>  PR = "r0"
>  
> -OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
> +OPENMP_RTOS_GIT_URI = "https://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>  OPENMP_RTOS_GIT_PROTOCOL = "git"
>  OPENMP_RTOS_GIT_BRANCH = "master"
>  
> diff --git a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
> index a4cb10530d60..37bcc86d1e66 100644
> --- a/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
> +++ b/meta-ti-extras/recipes-ti/swtools/swtools_git.bb
> @@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
>  
>  SWTOOLS_GIT_BRANCH = "master"
>  SWTOOLS_GIT_PROTOCOL = "git"
> -SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
> +SWTOOLS_GIT_URI = "https://git.ti.com/git/ep-processor-libraries/swtools.git"
>  SWTOOLS_SRCREV = "7d1c85e686b1466cd2d535fc9cac5baf1aae24a4"
>  
>  SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
> diff --git a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> index 59576daa2ed9..cebdb84584e2 100644
> --- a/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> +++ b/meta-ti-extras/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> @@ -10,7 +10,7 @@ DEPENDS = "ti-cgt-pru-native"
>  BRANCH = "master"
>  LIC_FILES_CHKSUM = "file://Makefile;startline=1;endline=31;md5=0ee4f2c42eb6b04e37859bb55a18b144"
>  
> -UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
> +UIO_TEST_PRUSS_GIT_URI = "https://git.ti.com/git/processor-sdk/uio-test-pruss.git"
>  UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
>  SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
>  
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

