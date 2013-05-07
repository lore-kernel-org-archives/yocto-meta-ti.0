Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98C95E01466
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:52:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47Lq6Gc026197
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:52:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47Lq6ZT032734
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:52:06 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:52:05 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47Lq5Te002751;
	Tue, 7 May 2013 16:52:05 -0500
Date: Tue, 7 May 2013 17:52:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <20130507215205.GF12982@edge>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Tue, 07 May 2013 21:52:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 05:24:18PM -0400, Murali Karicheri wrote:
> This patch add support for
>  1) switch between release and nightly builds
>  2) support for building gph images
> 
> Also fixed the COMPATIBLE_MACHINE to keystone-evm
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   79 +++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> index 788d813..bfe5111 100644
> --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> @@ -1,16 +1,85 @@
>  require u-boot-ti.inc
>  
>  DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"

These 2 lines are not needed - check u-boot-ti.inc file that sets licensing 
already.


> -COMPATIBLE_MACHINE = "keystone"
> +COMPATIBLE_MACHINE = "keystone-evm"

This is also not needed - you are changing recipe compatibility from a broader 
Keystone SOC to a more strict Keystone EVM. Right now it is pretty much the 
same, but in the future there maybe more machines in a Keystone SOC family.


> -PR = "r2+gitr${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

Not needed for PACKAGE_ARCH - set in u-boot-ti.inc


> -SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> +PR = "r3+gitr${SRCPV}"
> +
> +# for nightly switch the two below
> +#SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"

See below about pointing SRC_URI to an internal git server.


>  BRANCH = "master"
>  
> -# DEV.MCSDK-03.00.00.07
> -SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"

Please use the format above - it avoid unnecessary breakages when 
git-ls-remote is not working...


> +# for nightly switch the two below
> +#SRCREV = "DEV.MCSDK-2013-01.10"
> +SRCREV = "${AUTOREV}"

Same as before - please no AUTOREVs in meta-ti.

If you need to track daily/nightly progress from an internal git server, 
please use a .bbappend in meta-arago, while keeping meta-ti pointing to a 
piblic git server and using a specific commit ID. Let me know if you need 
existing examples - we just released Core TI-SDK 2013.04.00 which used to 
track the latest linux-ti-staging kernel by setting AUTOREV in meta-arago.


> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'

No need for this line - set in u-boot.inc


> +S = "${WORKDIR}/git"

This one is also already set.


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

As we just spoke - let's try to generalize this format and combine it with 
other similar requirements, like SPL-UART etc. There was a thread back in 
February about this...

-- 
Denys

