Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0DE5E00348
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 11:20:41 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU00665DQ09CU6@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 13:20:25 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D492620092; Tue,
	26 Feb 2013 14:20:23 -0500 (EST)
Date: Tue, 26 Feb 2013 14:20:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Message-id: <20130226192023.GL6725@denix.org>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com>
MIME-version: 1.0
In-reply-to: <512D0217.7090100@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, trini@ti.com, ceh@ti.com
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 19:20:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 26, 2013 at 01:42:31PM -0500, Murali Karicheri wrote:
> Denys,
> 
> I understand that this recipe is  not complete as u-boot_2013.01.bb
> may be shared by other machines and this change is not applicable.
> Do I need to add this to some other file? Please advise.
> 
> Meanwhile for the release this should work as this is going into
> mcsdk meta-ti repo. But to push this to meta-ti, the above change is
> needed and hence need your input.

Murali,

I know Carlos has been working on adding SPL support to u-boot already:

http://arago-project.org/pipermail/meta-arago/2013-February/000937.html

Can you sync up with him and come up with a unified solution for both SPL and 
GPH images that works for everybody and I'd be happy to push it to meta-ti.

Also, I'd like to hear Tom's opinion on this, as current U-Boot maintainer - 
if there is a better approach to this exists or planned in mainline.

Thanks.

-- 
Denys


> On 2/26/2013 1:38 PM, Murali Karicheri wrote:
> >On Keystone EVM, u-boot build needs to create following additional
> >binaries and images
> >  - u-boot-spl.bin
> >	- This for first stage boot from SPI NOR flash
> >  - u-boot.img
> >	- This is the second stage u-boot image in uImage format.
> >  - u-boot-spi.gph
> >	- This combines the above two images into one image so that
> >	  it is easy to program on the device.
> >
> >Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >---
> >  SRC_URI and SRCREV will be replaced before pushing this recipe to repo.
> >  recipes-bsp/u-boot/u-boot_2013.01.bb |   64 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 62 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-bsp/u-boot/u-boot_2013.01.bb b/recipes-bsp/u-boot/u-boot_2013.01.bb
> >index b9e6daf..07e8d6e 100644
> >--- a/recipes-bsp/u-boot/u-boot_2013.01.bb
> >+++ b/recipes-bsp/u-boot/u-boot_2013.01.bb
> >@@ -10,14 +10,74 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  PR = "r2+gitr${SRCPV}"
> >-SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> >+#SRC_URI = "git://arago-project.org/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> >+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/u-boot-keystone.git;protocol=git;branch=${BRANCH}"
> >  BRANCH = "master"
> >-SRCREV = "DEV.MCSDK-03.00.00.07"
> >+#SRCREV = "DEV.MCSDK-03.00.00.08"
> >+SRCREV = "327e9f591d6530650609915c7c35c874bfc25550"
> >  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> >  S = "${WORKDIR}/git"
> >  UBOOT_SUFFIX = "bin"
> >+
> >+UBOOT_MAKE_TARGET = "u-boot-spi.gph"
> >+# SPI NOR Flash binaries
> >+UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
> >+UBOOT_SPI_BINARY = "u-boot.img"
> >+UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
> >+# SPI NOR Flash deployed images
> >+UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> >+UBOOT_SPI_SPL_SYMLINK = "u-boot-spl-${MACHINE}.bin"
> >+UBOOT_SPI_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
> >+UBOOT_SPI_SYMLINK = "u-boot-${MACHINE}.img"
> >+UBOOT_SPI_GPH_IMAGE = "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
> >+UBOOT_SPI_GPH_SYMLINK = "u-boot-spi-${MACHINE}.gph"
> >+
> >+do_configure () {
> >+	oe_runmake ${UBOOT_MACHINE}
> >+}
> >+
> >+do_compile () {
> >+	unset LDFLAGS
> >+	unset CFLAGS
> >+	unset CPPFLAGS
> >+	oe_runmake ${UBOOT_MAKE_TARGET}
> >+}
> >+
> >+do_install () {
> >+	install -d ${D}/boot
> >+	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> >+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> >+	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
> >+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> >+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> >+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> >+	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
> >+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> >+}
> >+
> >+do_deploy () {
> >+	install -d ${DEPLOY_DIR_IMAGE}
> >+	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> >+	install ${S}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
> >+	install ${S}/${UBOOT_SPI_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
> >+	install ${S}/${UBOOT_SPI_GPH_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
> >+
> >+	cd ${DEPLOY_DIR_IMAGE}
> >+	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> >+	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> >+	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> >+	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> >+	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> >+	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> >+	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> >+}
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

