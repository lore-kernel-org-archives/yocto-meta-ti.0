Return-Path: <m-karicheri2@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71098E0144E
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 15:07:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47M7BSi023223
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:07:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47M7Bil018082
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:07:11 -0500
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 7 May 2013 17:07:10 -0500
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Hernandez, Carlos" <ceh@ti.com>
Thread-Topic: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to add
	gph support
Thread-Index: AQHOS2k9CQkOGrahU0yP1Wpq5JMXdZj6lzmA//+tzGA=
Date: Tue, 7 May 2013 22:07:10 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
In-Reply-To: <20130507215205.GF12982@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Tue, 07 May 2013 22:07:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Tuesday, May 07, 2013 5:52 PM
>> To: Karicheri, Muralidharan
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to =
add gph
>> support
>>=20
>> On Tue, May 07, 2013 at 05:24:18PM -0400, Murali Karicheri wrote:
>> > This patch add support for
>> >  1) switch between release and nightly builds
>> >  2) support for building gph images
>> >
>> > Also fixed the COMPATIBLE_MACHINE to keystone-evm
>> >
>> > Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> > ---
>> >  recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |   79
>> +++++++++++++++++++++++--
>> >  1 file changed, 74 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
>> > b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
>> > index 788d813..bfe5111 100644
>> > --- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
>> > +++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
>> > @@ -1,16 +1,85 @@
>> >  require u-boot-ti.inc
>> >
>> >  DESCRIPTION =3D "u-boot bootloader for Multi-Core BU devices"
>> > +LICENSE =3D "GPLv2+"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb"
>>=20
>> These 2 lines are not needed - check u-boot-ti.inc file that sets licens=
ing already.
>>=20

Ok. Will remove after checking

>>=20
>> > -COMPATIBLE_MACHINE =3D "keystone"
>> > +COMPATIBLE_MACHINE =3D "keystone-evm"
>>=20
>> This is also not needed - you are changing recipe compatibility from a b=
roader
>> Keystone SOC to a more strict Keystone EVM. Right now it is pretty much =
the
>> same, but in the future there maybe more machines in a Keystone SOC fami=
ly.
>>=20

What is the dependency pulled in for keystone? generic tuning for a15 and s=
imilar. What defines "keystone" here so that I better understand the big pi=
cture?

>>=20
>> > -PR =3D "r2+gitr${SRCPV}"
>> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>=20
>> Not needed for PACKAGE_ARCH - set in u-boot-ti.inc
>>=20

Ok will check.

>>=20
>> > -SRC_URI =3D "git://arago-project.org/git/projects/u-boot-
>> keystone.git;protocol=3Dgit;branch=3D${BRANCH}"
>> > +PR =3D "r3+gitr${SRCPV}"
>> > +
>> > +# for nightly switch the two below
>> > +#SRC_URI =3D "git://arago-project.org/git/projects/u-boot-
>> keystone.git;protocol=3Dgit;branch=3D${BRANCH}"
>> > +SRC_URI =3D "git://gtgit01.gt.design.ti.com/git/projects/u-boot-
>> keystone.git;protocol=3Dgit;branch=3D${BRANCH}"
>>=20
>> See below about pointing SRC_URI to an internal git server.
>>=20
>>=20
>> >  BRANCH =3D "master"
>> >
>> > -# DEV.MCSDK-03.00.00.07
>> > -SRCREV =3D "82f40e857d853165310d0753e79235aefb65d7ba"
>>=20
>> Please use the format above - it avoid unnecessary breakages when
>> git-ls-remote is not working...

Adding a commit id means every time we push something to master, I need to =
go and change this. This is not practical. Better point to the tip for gett=
ing the latest for nightly. What am I missing?

>>=20
>>=20
>> > +# for nightly switch the two below
>> > +#SRCREV =3D "DEV.MCSDK-2013-01.10"
>> > +SRCREV =3D "${AUTOREV}"
>>=20
>> Same as before - please no AUTOREVs in meta-ti.
>>=20
>> If you need to track daily/nightly progress from an internal git server,
>> please use a .bbappend in meta-arago, while keeping meta-ti pointing to =
a
>> piblic git server and using a specific commit ID. Let me know if you nee=
d
>> existing examples - we just released Core TI-SDK 2013.04.00 which used t=
o
>> track the latest linux-ti-staging kernel by setting AUTOREV in meta-arag=
o.
>>=20

I don't know. Please give me an example or help me figure this out.

>>=20
>> > +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX}
>> CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
>>=20
>> No need for this line - set in u-boot.inc
>>=20
>>=20
Ok.

>> > +S =3D "${WORKDIR}/git"
>>=20
>> This one is also already set.
>>=20

Ok.

>>=20
>> >  UBOOT_SUFFIX =3D "bin"
>> > +
>> > +UBOOT_MAKE_TARGET =3D "u-boot-spi.gph"
>> > +# SPI NOR Flash binaries
>> > +UBOOT_SPI_SPL_BINARY =3D "u-boot-spl.bin"
>> > +UBOOT_SPI_BINARY =3D "u-boot.img"
>> > +UBOOT_SPI_GPH_BINARY =3D "u-boot-spi.gph"
>> > +# SPI NOR Flash deployed images
>> > +UBOOT_SPI_SPL_IMAGE =3D "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
>> > +UBOOT_SPI_SPL_SYMLINK =3D "u-boot-spl-${MACHINE}.bin"
>> > +UBOOT_SPI_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
>> > +UBOOT_SPI_SYMLINK =3D "u-boot-${MACHINE}.img"
>> > +UBOOT_SPI_GPH_IMAGE =3D "u-boot-spi-${MACHINE}-${PV}-${PR}.gph"
>> > +UBOOT_SPI_GPH_SYMLINK =3D "u-boot-spi-${MACHINE}.gph"
>> > +
>> > +do_configure () {
>> > +	oe_runmake ${UBOOT_MACHINE}
>> > +}
>> > +
>> > +do_compile () {
>> > +	unset LDFLAGS
>> > +	unset CFLAGS
>> > +	unset CPPFLAGS
>> > +	oe_runmake ${UBOOT_MAKE_TARGET}
>> > +}
>> > +
>> > +do_install () {
>> > +	install -d ${D}/boot
>> > +	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>> > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY}
>> ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
>> > +	install ${S}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
>> > +	install ${S}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE=
}
>> > +	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
>> > +	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
>> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
>> > +}
>> > +
>> > +do_deploy () {
>> > +	install -d ${DEPLOY_DIR_IMAGE}
>> > +	install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
>> > +	install ${S}/spl/${UBOOT_SPI_SPL_BINARY}
>> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_SPL_IMAGE}
>> > +	install ${S}/${UBOOT_SPI_BINARY}
>> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_IMAGE}
>> > +	install ${S}/${UBOOT_SPI_GPH_BINARY}
>> ${DEPLOY_DIR_IMAGE}/${UBOOT_SPI_GPH_IMAGE}
>> > +
>> > +	cd ${DEPLOY_DIR_IMAGE}
>> > +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> > +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>> > +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
>> > +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
>> > +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
>> > +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
>> > +}
>>=20
>> As we just spoke - let's try to generalize this format and combine it wi=
th
>> other similar requirements, like SPL-UART etc. There was a thread back i=
n
>> February about this...

This is where I have disagreement. Let us restart the discussion. Who are t=
he stake holders? Discuss it in this thread rather than using an old thread=
. I have copied here Carlos. I don't have bandwidth to spend too much time =
on this. Let us discuss it and identify what is required to be done.

Murali
>>=20
>> --
>> Denys

