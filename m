Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41F8BE005B4
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2014 11:14:37 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0N00LXI43UCMA0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 07 Feb 2014 13:14:33 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4819A200AC; Fri,
	07 Feb 2014 14:14:17 -0500 (EST)
Date: Fri, 07 Feb 2014 14:14:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>, meta-ti@yoctoproject.org
Message-id: <20140207191417.GK22890@denix.org>
References: <1390880491-24176-1-git-send-email-sam.nelson@ti.com>
	<20140128035020.GB6814@edge>
MIME-version: 1.0
In-reply-to: <20140128035020.GB6814@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 07 Feb 2014 19:14:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping on the below - it's still pending resolution. Please let me know if you 
need further clarification or any help.


On Mon, Jan 27, 2014 at 10:50:20PM -0500, Denys Dmytriyenko wrote:
> On Mon, Jan 27, 2014 at 10:41:31PM -0500, Sam Nelson wrote:
> > - Update license and checksum
> > - Update source URL
> > - Added SPI Nor binaries and deployed images
> > - Update script to configure, compile, install, deploy
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   75 +++++++++++++++++++++++--
> >  1 file changed, 71 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> > index 788d813..d225cea 100644
> > --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> > +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> > @@ -1,16 +1,83 @@
> >  require u-boot-ti.inc
> >  
> >  DESCRIPTION = "u-boot bootloader for Multi-Core BU devices"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> >  
> >  COMPATIBLE_MACHINE = "keystone"
> >  
> > -PR = "r2+gitr${SRCPV}"
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > -SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> > +PR = "r3+gitr${SRCPV}"
> > +
> > +# for nightly switch the two below
> > +SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"
> >  
> >  BRANCH = "master"
> >  
> > -# DEV.MCSDK-03.00.00.07
> > -SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
> > +#Tag "K2_UBOOT_2013-01_13.12"
> > +SRCREV = "e4b19a8d418e35bf2bd63eba485afd5d9e436188"
> > +
> > +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> > +
> > +S = "${WORKDIR}/git"
> >  
> >  UBOOT_SUFFIX = "bin"
> > +
> > +UBOOT_MAKE_TARGET = "u-boot-spi.gph"
> > +# SPI NOR Flash binaries
> > +UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
> > +UBOOT_SPI_BINARY = "u-boot.img"
> > +UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
> > +# SPI NOR Flash deployed images
> > +UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> > +UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
> > +UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
> > +UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
> > +UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
> > +UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
> > +
> > +do_configure () {
> > +	oe_runmake ${UBOOT_MACHINE}
> > +}
> > +
> > +do_compile () {
> > +	unset LDFLAGS
> > +	unset CFLAGS
> > +	unset CPPFLAGS
> > +	oe_runmake ${UBOOT_MAKE_TARGET}
> > +}
> > +
> > +do_install () {
> > +	install -d ${D}/boot
> > +	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> > +	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
> > +	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> > +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> > +	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> > +}
> > +
> > +do_deploy () {
> > +	install -d ${DEPLOY_DIR_IMAGE}
> > +	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
> > +	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
> > +	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
> > +
> > +	cd ${DEPLOY_DIR_IMAGE}
> > +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> > +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> > +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> > +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> > +}
> 
> Most of the above logic is already provided by the standard u-boot.inc - it 
> shouldn't be hard to extend it to support your special formats instead of 
> re-implementing everything from scratch...
> 
> -- 
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

