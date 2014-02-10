Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DF54E00764
	for <meta-ti@yoctoproject.org>; Sun,  9 Feb 2014 19:44:22 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1A3iMj3023406
	for <meta-ti@yoctoproject.org>; Sun, 9 Feb 2014 21:44:22 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1A3iMYR020838
	for <meta-ti@yoctoproject.org>; Sun, 9 Feb 2014 21:44:22 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Sun, 9 Feb 2014 21:44:21 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] u-boot-keystone: Update keystone u-boot to
	latest version
Thread-Index: AQHPG9rZfFFjb+dhT0ayohHFh4Zsp5qZ5QAAgBC5doCAA0Pc4A==
Date: Mon, 10 Feb 2014 03:44:21 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F3F63@DLEE11.ent.ti.com>
References: <1390880491-24176-1-git-send-email-sam.nelson@ti.com>
	<20140128035020.GB6814@edge> <20140207191417.GK22890@denix.org>
In-Reply-To: <20140207191417.GK22890@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 10 Feb 2014 03:44:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I can eliminate do_compile & do_configure functions and also  see some of t=
he statements repeated in do_install function  can be removed.
But in  do-deploy  the directory to which the images are copied are differe=
nt from=20
u-boot.inc.
( U-boot.inc copies to DEPLOY_DIR whereas u-boot-keystone recipe copies to =
DEPLOY_DIR_IMAGE directory).=20
So not much can be modified here.  I will send updated patch.
With regards,
Sam


> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, February 07, 2014 2:14 PM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] u-boot-keystone: Update keystone u-boot to
> latest version
>=20
> Ping on the below - it's still pending resolution. Please let me know if =
you
> need further clarification or any help.
>=20
>=20
> On Mon, Jan 27, 2014 at 10:50:20PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Jan 27, 2014 at 10:41:31PM -0500, Sam Nelson wrote:
> > > - Update license and checksum
> > > - Update source URL
> > > - Added SPI Nor binaries and deployed images
> > > - Update script to configure, compile, install, deploy
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   75
> +++++++++++++++++++++++--
> > >  1 file changed, 71 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-
> bsp/u-boot/u-boot-keystone_2013.01.bb
> > > index 788d813..d225cea 100644
> > > --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> > > +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
> > > @@ -1,16 +1,83 @@
> > >  require u-boot-ti.inc
> > >
> > >  DESCRIPTION =3D "u-boot bootloader for Multi-Core BU devices"
> > > +LICENSE =3D "GPLv2+"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
> > >
> > >  COMPATIBLE_MACHINE =3D "keystone"
> > >
> > > -PR =3D "r2+gitr${SRCPV}"
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >
> > > -SRC_URI =3D "git://arago-project.org/git/projects/u-boot-
> keystone.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > +PR =3D "r3+gitr${SRCPV}"
> > > +
> > > +# for nightly switch the two below
> > > +SRC_URI =3D "git://git.ti.com/keystone-linux/u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH}"
> > >
> > >  BRANCH =3D "master"
> > >
> > > -# DEV.MCSDK-03.00.00.07
> > > -SRCREV =3D "82f40e857d853165310d0753e79235aefb65d7ba"
> > > +#Tag "K2_UBOOT_2013-01_13.12"
> > > +SRCREV =3D "e4b19a8d418e35bf2bd63eba485afd5d9e436188"
> > > +
> > > +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX}
> CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
> > > +
> > > +S =3D "${WORKDIR}/git"
> > >
> > >  UBOOT_SUFFIX =3D "bin"
> > > +
> > > +UBOOT_MAKE_TARGET =3D "u-boot-spi.gph"
> > > +# SPI NOR Flash binaries
> > > +UBOOT_SPI_SPL_BINARY =3D "u-boot-spl.bin"
> > > +UBOOT_SPI_BINARY =3D "u-boot.img"
> > > +UBOOT_SPI_GPH_BINARY =3D "u-boot-spi.gph"
> > > +# SPI NOR Flash deployed images
> > > +UBOOT_SPI_SPL_IMAGE =3D "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> > > +UBOOT_SPI_SPL_SYMLINK =3D "u-boot-spl-${MACHINE}.bin"
> > > +UBOOT_SPI_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> > > +UBOOT_SPI_SYMLINK =3D "u-boot-${MACHINE}.img"
> > > +UBOOT_SPI_GPH_IMAGE =3D "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
> > > +UBOOT_SPI_GPH_SYMLINK =3D "u-boot-spi-${MACHINE}.gph"
> > > +
> > > +do_configure () {
> > > +	oe_runmake ${UBOOT_MACHINE}
> > > +}
> > > +
> > > +do_compile () {
> > > +	unset LDFLAGS
> > > +	unset CFLAGS
> > > +	unset CPPFLAGS
> > > +	oe_runmake ${UBOOT_MAKE_TARGET}
> > > +}
> > > +
> > > +do_install () {
> > > +	install -d ${D}/boot
> > > +	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> > > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY}
> ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> > > +	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
> > > +	install ${S}/${UBOOT_SPI_GPH_BINARY}
> ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> > > +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> > > +	ln -sf ${UBOOT_SPI_SPL_IMAGE}
> ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> > > +	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
> > > +	ln -sf ${UBOOT_SPI_GPH_IMAGE}
> ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> > > +}
> > > +
> > > +do_deploy () {
> > > +	install -d ${DEPLOY_DIR_IMAGE}
> > > +	install ${S}/${UBOOT_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> > > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
> > > +	install ${S}/${UBOOT_SPI_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
> > > +	install ${S}/${UBOOT_SPI_GPH_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
> > > +
> > > +	cd ${DEPLOY_DIR_IMAGE}
> > > +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> > > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> > > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> > > +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> > > +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> > > +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> > > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> > > +}
> >
> > Most of the above logic is already provided by the standard u-boot.inc =
- it
> > shouldn't be hard to extend it to support your special formats instead =
of
> > re-implementing everything from scratch...
> >
> > --
> > Denys
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

