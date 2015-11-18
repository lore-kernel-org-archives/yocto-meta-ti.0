Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27F21E00B5A; Wed, 18 Nov 2015 07:09:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DECDEE00B3F
	for <meta-ti@yoctoproject.org>; Wed, 18 Nov 2015 07:08:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAIF8tmO022308
	for <meta-ti@yoctoproject.org>; Wed, 18 Nov 2015 09:08:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAIF8tHU029626
	for <meta-ti@yoctoproject.org>; Wed, 18 Nov 2015 09:08:55 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 18 Nov 2015 09:08:56 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v4] ipc: ti-ipc, ti-ipc-rtos: Update to new
	version of IPC 3.41.0.3_eng
Thread-Index: AQHRIYQx3C6yTKASDUaBSHJDZmtItp6iIz4AgAALIQD//7R7oA==
Date: Wed, 18 Nov 2015 15:08:56 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905826FAEA@DLEE11.ent.ti.com>
References: <1447797979-10356-1-git-send-email-sam.nelson@ti.com>
	<564C7600.8050209@ti.com> <564C7F56.7080901@ti.com>
In-Reply-To: <564C7F56.7080901@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v4] ipc: ti-ipc, ti-ipc-rtos: Update to new version of IPC 3.41.0.3_eng
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
X-List-Received-Date: Wed, 18 Nov 2015 15:09:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, November 18, 2015 8:39 AM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v4] ipc: ti-ipc, ti-ipc-rtos: Update to new=
 version
> of IPC 3.41.0.3_eng
>=20
>=20
>=20
> On 11/18/2015 7:58 AM, Jacob Stiffler wrote:
> >
> >
> > On 11/17/2015 5:06 PM, Sam Nelson wrote:
> >> - Update to new version of IPC 3.41.0.3_eng
> >> - Add recipe to build ti-ipc-rtos from git repo
> >> - Remove K2G hack
> >>
> >> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >>
> >> ---
> >> Changes from the previous version of the patch
> >> - Removed redundant platform definitions
> >> ---
> >> ---
> >>   recipes-ti/ipc/ti-ipc-rtos.inc           | 19 ------------
> >>   recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |  9 ------
> >>   recipes-ti/ipc/ti-ipc-rtos_git.bb        | 51
> >> ++++++++++++++++++++++++++++++++
> >>   recipes-ti/ipc/ti-ipc.inc                | 26 ++++++++++++++++
> >>   recipes-ti/ipc/ti-ipc_git.bb             | 27 +++--------------
> >>   5 files changed, 81 insertions(+), 51 deletions(-)
> >>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
> >
> > Other layers use this file. Do we want to keep it, or should those
> > layers make a copy of it?
> >
> >>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> >>   create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bb
> >>   create mode 100644 recipes-ti/ipc/ti-ipc.inc
> >>
> >> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc
> >> b/recipes-ti/ipc/ti-ipc-rtos.inc deleted file mode 100644 index
> >> d14c756..0000000
> >> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> >> +++ /dev/null
> >> @@ -1,19 +0,0 @@
> >> -DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (for
> >> Uni- and Multi- Processor Configurations)"
> >> -HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> >> -
> >> -LICENSE =3D "BSD"
> >> -
> >> -require recipes-ti/includes/ti-paths.inc -require
> >> recipes-ti/includes/ti-staging.inc
> >> -
> >> -SRC_URI =3D
> >> "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc
> _${PV}.zip;name=3Dipczip"
> >> -
> >> -S =3D "${WORKDIR}/ipc_${PV}"
> >> -
> >> -do_install() {
> >> -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> >> -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> >> -}
> >> -
> >> -ALLOW_EMPTY_${PN} =3D "1"
> >> -FILES_${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
> >> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> >> b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> >> deleted file mode 100644
> >> index 7c93695..0000000
> >> --- a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
> >> +++ /dev/null
> >> @@ -1,9 +0,0 @@
> >> -require ti-ipc-rtos.inc
> >> -
> >> -PV =3D "3_40_01_08"
> >> -PR =3D "r0"
> >> -
> >> -LIC_FILES_CHKSUM =3D
> >> "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9b710fd7c95e545b91cec792=
5
> 5"
> >> -
> >> -SRC_URI[ipczip.md5sum] =3D "738e1d54da9fab94899ad162f1ad78de"
> >> -SRC_URI[ipczip.sha256sum] =3D
> >>
> "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf
> "
> >> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> >> b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> >> new file mode 100644
> >> index 0000000..aaea3f7
> >> --- /dev/null
> >> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> >> @@ -0,0 +1,51 @@
> >> +require recipes-ti/includes/ti-paths.inc require
> >> +recipes-ti/includes/ti-staging.inc
> >> +require ti-ipc.inc
> >> +
> >> +DEPENDS +=3D "ti-cgt6x-native ti-xdctools ti-sysbios"
> >> +
> >> +PACKAGES =3D+ "${PN}-fw"
> >> +FILES_${PN}-fw =3D "${libdir}/firmware/*"
> >> +FILES_${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
> >> +
> >> +INSANE_SKIP_${PN}-fw +=3D "arch"
> >> +INSANE_SKIP_${PN}-dev +=3D "arch"
> >> +
> >> +ALLOW_EMPTY_${PN} =3D "1"
> >> +
> >> +IPC_TARGETS =3D ""
> >> +IPC_TARGETS_omap-a15 =3D "\
> >> +    gnu.targets.arm.A15F=3D"${A15_TOOLCHAIN_INSTALL_DIR}" \
> >> +ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> >> +    ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
> >> +    ti.targets.arm.elf.M4F=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \ "
> >> +
> >
> > If you are building for the baremetal A15 and M4, you need to add
> > gcc-arm-none-eabi-native and ti-ccsv6-native to the dependencies.
> >
> >> +IPC_TARGETS_keystone =3D " \
> >> +    gnu.targets.arm.A15F=3D"${A15_TOOLCHAIN_INSTALL_DIR}" \
> >> +ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \ "
> >> +
> >> +EXTRA_OEMAKE =3D "\
> >> +    PLATFORM=3D${PLATFORM} \
> >> +    XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
> >> +    BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
> >> +    ${IPC_TARGETS} \
> >> +"
> >> +
> >> +do_compile() {
> >> +  oe_runmake -f ipc-bios.mak clean
> >> +  oe_runmake -f ipc-bios.mak all
>=20
> I just checked with how we were doing this internally, and we were only
> building the libs. Do we also want to make the tests also?
Yes. Tests are needed as well for testing. Is there an issue?
>=20
> >> +}
> >> +
> >> +do_compile_append() {
> >> +  sourceipk_do_create_srcipk
> >> +}
> >> +
> >> +do_install() {
> >> +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> >> +    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> >> +
> >> +    install -d ${D}${libdir}/firmware
> >> +    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {}
> >> ${D}${libdir}/firmware/
> >> +}
> >> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> >> new file mode 100644 index 0000000..325fbc4
> >> --- /dev/null
> >> +++ b/recipes-ti/ipc/ti-ipc.inc
> >> @@ -0,0 +1,26 @@
> >> +DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (for
> >> Uni- and Multi- Processor Configurations)"
> >> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> >> +
> >> +LICENSE =3D "BSD"
> >> +LIC_FILES_CHKSUM =3D
> >> "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9b710fd7c95e545b91cec792=
5
> 5"
> >> +
> >> +BRANCH =3D "ipc-next"
> >> +
> >> +SRC_URI =3D
> >> "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D${BRANCH}"
> >> +
> >> +#Corresponds to 3.41.00.03_eng
> >> +SRCREV =3D "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +PV =3D "3.41.00.03"
> >> +PR =3D "r1"
> >
> > Can you use "INC_PR"?
> >
> >> +
> >> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> +
> >> +PLATFORM =3D "UNKNOWN"
> >> +PLATFORM_omap5-evm =3D "OMAP54XX"
> >> +PLATFORM_dra7xx =3D "DRA7XX"
> >> +PLATFORM_k2hk-evm =3D "TCI6638"
> >> +PLATFORM_k2l-evm =3D "TCI6630"
> >> +PLATFORM_k2e-evm =3D "66AK2E"
> >> +PLATFORM_k2g-evm =3D "66AK2G"
> >> diff --git a/recipes-ti/ipc/ti-ipc_git.bb
> >> b/recipes-ti/ipc/ti-ipc_git.bb index a6b6a90..070247b 100644
> >> --- a/recipes-ti/ipc/ti-ipc_git.bb
> >> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> >> @@ -1,32 +1,13 @@
> >>   DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (fo=
r
> >> Uni- and Multi- Processor Configurations)"
> >> HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
> >>   -LICENSE =3D "BSD"
> >> -LIC_FILES_CHKSUM =3D
> >> "file://${S}/ipc-
> linux.mak;beginline=3D1;endline=3D30;md5=3D7b327f9b710fd7c95e545b91cec792=
5
> 5"
> >> +require ti-ipc.inc
> >>     DEPENDS +=3D "virtual/kernel"
> >>   -PV =3D "3.41.00.02"
> >> -
> >> -BRANCH =3D "ipc-next"
> >> -SRC_URI =3D
> >> "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D${BRANCH} \
> >> -           file://tiipclad-daemon.sh \
> >> -           file://0001-Add-kernel-build-dir.patch \
> >> +SRC_URI +=3D "file://tiipclad-daemon.sh \
> >> +            file://0001-Add-kernel-build-dir.patch \
> >>              "
> >> -# Commit corresponds to 3.41.00.02-eng -SRCREV =3D
> >> "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
> >> -
> >> -S =3D "${WORKDIR}/git"
> >> -
> >> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> -
> >> -PLATFORM =3D "UNKNOWN"
> >> -PLATFORM_omap5-evm =3D "OMAP54XX"
> >> -PLATFORM_dra7xx =3D "DRA7XX"
> >> -PLATFORM_k2hk-evm =3D "TCI6638"
> >> -PLATFORM_k2l-evm =3D "TCI6630"
> >> -PLATFORM_k2e-evm =3D "66AK2E"
> >> -PLATFORM_k2g-evm =3D "66AK2E"
> >>     DAEMON =3D "UNKNOWN"
> >>   DAEMON_omap5-evm =3D "lad_omap54xx_smp"
> >> @@ -34,7 +15,7 @@ DAEMON_dra7xx =3D "lad_dra7xx"
> >>   DAEMON_k2hk-evm =3D "lad_tci6638"
> >>   DAEMON_k2l-evm =3D "lad_tci6630"
> >>   DAEMON_k2e-evm =3D "lad_66ak2e"
> >> -DAEMON_k2g-evm =3D "lad_66ak2e"
> >> +DAEMON_k2g-evm =3D "lad_66ak2g"
> >>     inherit autotools-brokensep pkgconfig update-rc.d
> >


