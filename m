Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EB45E006F7
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 19:50:21 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S3oLjZ005419
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 21:50:21 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S3oLEo012637
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 21:50:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 21:50:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S3oKiS009541;
	Mon, 27 Jan 2014 21:50:20 -0600
Date: Mon, 27 Jan 2014 22:50:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140128035020.GB6814@edge>
References: <1390880491-24176-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390880491-24176-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-keystone: Update keystone u-boot to latest version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jan 2014 03:50:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2014 at 10:41:31PM -0500, Sam Nelson wrote:
> - Update license and checksum
> - Update source URL
> - Added SPI Nor binaries and deployed images
> - Update script to configure, compile, install, deploy
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   75 +++++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> index 788d813..d225cea 100644
> --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> @@ -1,16 +1,83 @@
>  require u-boot-ti.inc
>  
>  DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>  
>  COMPATIBLE_MACHINE = "keystone"
>  
> -PR = "r2+gitr${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> +PR = "r3+gitr${SRCPV}"
> +
> +# for nightly switch the two below
> +SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
>  
> -# DEV.MCSDK-03.00.00.07
> -SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
> +#Tag "K2_UBOOT_2013-01_13.12"
> +SRCREV = "e4b19a8d418e35bf2bd63eba485afd5d9e436188"
> +
> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> +
> +S = "${WORKDIR}/git"
>  
>  UBOOT_SUFFIX = "bin"
> +
> +UBOOT_MAKE_TARGET = "u-boot-spi.gph"
> +# SPI NOR Flash binaries
> +UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
> +UBOOT_SPI_BINARY = "u-boot.img"
> +UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
> +# SPI NOR Flash deployed images
> +UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> +UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
> +UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
> +UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
> +UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
> +UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
> +
> +do_configure () {
> +	oe_runmake ${UBOOT_MACHINE}
> +}
> +
> +do_compile () {
> +	unset LDFLAGS
> +	unset CFLAGS
> +	unset CPPFLAGS
> +	oe_runmake ${UBOOT_MAKE_TARGET}
> +}
> +
> +do_install () {
> +	install -d ${D}/boot
> +	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> +	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
> +	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> +	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> +}
> +
> +do_deploy () {
> +	install -d ${DEPLOY_DIR_IMAGE}
> +	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
> +	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
> +	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
> +
> +	cd ${DEPLOY_DIR_IMAGE}
> +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> +}

Most of the above logic is already provided by the standard u-boot.inc - it 
shouldn't be hard to extend it to support your special formats instead of 
re-implementing everything from scratch...

-- 
Denys

