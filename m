Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C56E0E00B85; Wed, 21 May 2014 13:16:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58428E00B6F
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 13:16:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LKGmGG003069
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 15:16:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LKGlIb024149
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 15:16:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 21 May 2014 15:16:47 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-ti] [PATCH 3/9] ti-ipc: Consolidate IPC recipes with
	include file
Thread-Index: AQHPc5f7YLLwvH4bbEeG3CuzxMeAxJtLyPiA//+xNUA=
Date: Wed, 21 May 2014 20:16:47 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057FAD59B@DLEE11.ent.ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
	<1400527188-16951-4-git-send-email-Chase.Maupin@ti.com>
	<20140519192417.GC21819@edge> <20140521195217.GJ21819@edge>
In-Reply-To: <20140521195217.GJ21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH 3/9] ti-ipc: Consolidate IPC recipes with include file
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
X-List-Received-Date: Wed, 21 May 2014 20:16:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Currently we are integrating in MCSDK 3.1.x: IPC version 3_22_00_04+.
In theory, I think we should be able to converge on one IPC release in the =
future.
But practically due to release timelines,  there may be 2 different version=
 used by MCSDK and GLSDK.
I guess whatever goes in meta-ti can be the latest.
With regards,
Sam



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, May 21, 2014 3:52 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org; Hingolikar, Mrinmayee; Nelson, Sam
> Subject: Re: [meta-ti] [PATCH 3/9] ti-ipc: Consolidate IPC recipes with i=
nclude
> file
>=20
> Sam, Mrinmayee,
>=20
> Ping.
>=20
>=20
> On Mon, May 19, 2014 at 03:24:17PM -0400, Denys Dmytriyenko wrote:
> > Sam, Mrinmayee,
> >
> > As Chase and I discussed this, can we use the same version of IPC for b=
oth
> > MCSDK and GLSDK? What is the latest version you both support?
> >
> > --
> > Denys
> >
> >
> > On Mon, May 19, 2014 at 02:19:42PM -0500, Chase Maupin wrote:
> > > * Update the 3.00.00 and 3.21.00.07 versions of ti-ipc to use
> > >   a common ti-ipc.inc file which combines the configuration and
> > >   installation steps for both to be common.
> > > * Modify the tiiipclad-daemon.sh script to have a replacement
> > >   variable so that it can be used for more than a single device.
> > > * Move the tiipclad-daemon script to the ti-ipc directory with
> > >   the rest of the files used by this recipe.
> > > * Fix the permissions for the tiipclad-daemon script
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > >  recipes-ti/ipc/ti-ipc.inc                          |   58 ++++++++++=
++++++++++
> > >  .../ipc/{files =3D> ti-ipc}/tiipclad-daemon.sh       |    2 +-
> > >  recipes-ti/ipc/ti-ipc_3.00.00.bb                   |   51 +---------=
-------
> > >  recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |   31 +---------=
-
> > >  4 files changed, 64 insertions(+), 78 deletions(-)
> > >  create mode 100644 recipes-ti/ipc/ti-ipc.inc
> > >  rename recipes-ti/ipc/{files =3D> ti-ipc}/tiipclad-daemon.sh (92%)
> > >  mode change 100755 =3D> 100644
> > >
> > > diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> > > new file mode 100644
> > > index 0000000..ee9feff
> > > --- /dev/null
> > > +++ b/recipes-ti/ipc/ti-ipc.inc
> > > @@ -0,0 +1,58 @@
> > > +DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (fo=
r
> Uni- and Multi- Processor Configurations)"
> > > +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> > > +
> > > +LICENSE =3D "BSD"
> > > +LIC_FILES_CHKSUM =3D "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3Df2518e421e230f06fe6d449718d02e
> dc"
> > > +
> > > +DEPENDS +=3D "virtual/kernel"
> > > +
> > > +PR =3D "r1"
> > > +
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > +
> > > +PLATFORM =3D "UNKNOWN"
> > > +PLATFORM_omap5-evm =3D "OMAP54XX"
> > > +PLATFORM_dra7xx-evm =3D "DRA7XX"
> > > +PLATFORM_keystone =3D "TCI6638"
> > > +
> > > +DAEMON =3D "UNKNOWN"
> > > +DAEMON_omap5-evm =3D "lad_omap54xx_smp"
> > > +DAEMON_dra7xx-evm =3D "lad_dra7xx"
> > > +DAEMON_keystone =3D "lad_tci6638"
> > > +
> > > +inherit autotools pkgconfig update-rc.d
> > > +
> > > +SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit \
> > > +           file://0002-ipc-Added-installation-prefix-feature-to-
> products.ma.patch \
> > > +           file://tiipclad-daemon.sh \
> > > +           "
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +INITSCRIPT_NAME =3D "tiipclad-daemon.sh"
> > > +INITSCRIPT_PARAMS =3D "defaults 10"
> > > +
> > > +EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> TOOLCHAIN_INSTALL_DIR=3D${TOOLCHAIN_PATH}
> TOOLCHAIN_LONGNAME=3D${TOOLCHAIN_SYS} PLATFORM=3D${PLATFORM}
> PREFIX=3D${prefix}"
> > > +
> > > +do_configure() {
> > > +    oe_runmake -f ${S}/ipc-linux.mak config
> > > +}
> > > +
> > > +do_install_append() {
> > > +    install -d ${D}${sysconfdir}/init.d/
> > > +
> > > +    # Modify the tiipclad-daemon.sh script to point to the right
> > > +    # lad daemon executable.
> > > +    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-
> daemon.sh
> > > +    install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh
> ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> > > +}
> > > +
> > > +PACKAGES =3D+ "${PN}-test"
> > > +RDEPENDS_${PN}-test +=3D "${PN}"
> > > +
> > > +FILES_${PN}-test =3D " \
> > > +    ${bindir}/NameServerApp \
> > > +    ${bindir}/MessageQApp \
> > > +    ${bindir}/MessageQMulti \
> > > +    ${bindir}/ping_rpmsg"
> > > +
> > > diff --git a/recipes-ti/ipc/files/tiipclad-daemon.sh b/recipes-ti/ipc=
/ti-
> ipc/tiipclad-daemon.sh
> > > old mode 100755
> > > new mode 100644
> > > similarity index 92%
> > > rename from recipes-ti/ipc/files/tiipclad-daemon.sh
> > > rename to recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
> > > index 54b3888..97f870e
> > > --- a/recipes-ti/ipc/files/tiipclad-daemon.sh
> > > +++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
> > > @@ -1,6 +1,6 @@
> > >  #! /bin/sh
> > >
> > > -tiipclad_daemon=3D/usr/bin/lad_tci6638
> > > +tiipclad_daemon=3D/usr/bin/__LAD_DAEMON__
> > >  tiipclad_params=3Dlad.txt
> > >
> > >  test -x "$tiipclad_daemon" || exit 0
> > > diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-
> ipc_3.00.00.bb
> > > index c07b7f9..a6922c0 100644
> > > --- a/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > > +++ b/recipes-ti/ipc/ti-ipc_3.00.00.bb
> > > @@ -1,52 +1,7 @@
> > > -DESCRIPTION=3D"This support the communication between processors \
> > > -in a multi-processor environment and communication to peripherals. \
> > > -This communication includes message passing, streams, and linked lis=
ts.
> \
> > > -These modules work transparently in both uni-processor and multi-
> processor \
> > > -configurations."
> > > +require ti-ipc.inc
> > >
> > > -HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> > > +# For this version of IPC the PLATFORM value is lowercase
> > > +PLATFORM_keystone =3D "tci6638"
> > >
> > > -LICENSE =3D "BSD"
> > > -LIC_FILES_CHKSUM =3D
> "file://products.mak;beginline=3D2;endline=3D30;md5=3D195feadf798bb4165bc=
b1
> a23ffd50dbb"
> > > -SECTION =3D "console"
> > > -COMPATIBLE_MACHINE =3D "keystone"
> > > -TARGET_PLATFORM =3D "tci6638"
> > > -
> > > -PR =3D "r0"
> > > -
> > > -BRANCH ?=3D "master"
> > >  # The following commit corresponds to 3.00.04.29
> > >  SRCREV =3D "12794ea33870b782bffe1fe4398e86e93fb64396"
> > > -
> > > -SRC_URI =3D " \
> > > -    git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D${BRANCH=
} \
> > > -    file://tiipclad-daemon.sh"
> > > -
> > > -S =3D "${WORKDIR}/git"
> > > -
> > > -export PLATFORM =3D "${TARGET_PLATFORM}"
> > > -
> > > -export PARALLEL_MAKE =3D ""
> > > -
> > > -PACKAGES =3D+ "${PN}-test"
> > > -
> > > -FILES_${PN}-test =3D " \
> > > -    ${bindir}/NameServerApp \
> > > -    ${bindir}/MessageQApp \
> > > -    ${bindir}/MessageQMulti \
> > > -    ${bindir}/ping_rpmsg"
> > > -
> > > -DEPENDS +=3D "virtual/kernel"
> > > -
> > > -EXTRA_OECONF +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}"
> > > -inherit autotools
> > > -
> > > -INITSCRIPT_NAME =3D "tiipclad-daemon.sh"
> > > -INITSCRIPT_PARAMS =3D "defaults 10"
> > > -
> > > -inherit update-rc.d
> > > -
> > > -do_install_append() {
> > > -	install -d ${D}${sysconfdir}/init.d/
> > > -	install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh
> ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> > > -}
> > > diff --git a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb b/recipes-ti/ipc/ti-
> ipc_3.21.00.07.bb
> > > index 8131754..17cdab0 100644
> > > --- a/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > > +++ b/recipes-ti/ipc/ti-ipc_3.21.00.07.bb
> > > @@ -1,31 +1,4 @@
> > > -DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (fo=
r
> Uni- and Multi- Processor Configurations)"
> > > -HOMEPAGE =3D "https://git.ti.com/ipc/pages/Home"
> > > -LICENSE =3D "BSD"
> > > -LIC_FILES_CHKSUM =3D "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3Df2518e421e230f06fe6d449718d02e
> dc"
> > > -
> > > -DEPENDS +=3D "virtual/kernel"
> > > -
> > > -PR =3D "r1"
> > > -
> > > -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > -
> > > -PLATFORM_omap5-evm =3D "OMAP54XX"
> > > -PLATFORM_dra7xx-evm =3D "DRA7XX"
> > > -
> > > -inherit autotools pkgconfig
> > > -
> > > -SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit \
> > > -           file://0002-ipc-Added-installation-prefix-feature-to-
> products.ma.patch \
> > > -           "
> > > +require ti-ipc.inc
> > >
> > > +# This commit corresponds to 3.21.00.07
> > >  SRCREV =3D "c18fece0c9f0dc76361dc1ee11b7ee2417479847"
> > > -
> > > -S =3D "${WORKDIR}/git"
> > > -
> > > -FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
> > > -
> > > -EXTRA_OEMAKE +=3D "KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> TOOLCHAIN_INSTALL_DIR=3D${TOOLCHAIN_PATH}
> TOOLCHAIN_LONGNAME=3D${TOOLCHAIN_SYS} PLATFORM=3D${PLATFORM}
> PREFIX=3D${prefix}"
> > > -
> > > -do_configure() {
> > > -	oe_runmake -f ${S}/ipc-linux.mak config
> > > -}
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

