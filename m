Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC57FE00BC2; Tue, 17 May 2016 14:33:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 326B7E00B18
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 14:32:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4HLWwUB009780
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 16:32:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4HLWwt3027522
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 16:32:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 17 May 2016 16:32:59 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] ti-ipc-rtos: Update to include examples and
	documentation with the package
Thread-Index: AQHRq68HgKTodyw5oEOij8z7X0kXi5+3jt8AgAAEXgCABeiJkIAAXFwA///XMvA=
Date: Tue, 17 May 2016 21:32:57 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490583BC692@DLEE11.ent.ti.com>
References: <1462989639-23037-1-git-send-email-sam.nelson@ti.com>
	<20160513185652.GB16188@edge>
	<4B26FB5A64EBA14C87266869E037F95814287F9F@DFLE09.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F490583BC4F5@DLEE11.ent.ti.com>
	<20160517185637.GW16188@edge>
In-Reply-To: <20160517185637.GW16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-ipc-rtos: Update to include examples and documentation with the package
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
X-List-Received-Date: Tue, 17 May 2016 21:33:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, May 17, 2016 2:57 PM
> To: Nelson, Sam
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] ti-ipc-rtos: Update to include examples an=
d
> documentation with the package
>=20
> On Tue, May 17, 2016 at 02:39:45PM -0400, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Stiffler, Jacob
> > > Sent: Friday, May 13, 2016 3:13 PM
> > > To: Dmytriyenko, Denys; Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: RE: [meta-ti] [PATCH] ti-ipc-rtos: Update to include
> > > examples and documentation with the package
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> > > > Sent: Friday, May 13, 2016 2:57 PM
> > > > To: Nelson, Sam
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] [PATCH] ti-ipc-rtos: Update to include
> > > > examples and documentation with the package
> > > >
> > > > Sam,
> > > >
> > > > Is this v2? You didn't specify changes since v1, so I would have
> > > > to dig out the previous submission and check that past comments
> > > > were
> > > addressed.
> > > >
> > > > Jake,
> > > >
> > > > Do you have any comments here?
> > > >
> > > >
> > > > On Wed, May 11, 2016 at 02:00:39PM -0400, Sam Nelson wrote:
> > > > > Updated to new version 3.42.01.03 Added procedures and source
> > > > > urls for adding examples and
> > > > documentation
> > > > > into src package.
> > > > > Added dependency on doxygen for document creation Added big
> > > > > endian
> > > > > c66 targets Updated uniform formatting
> > > > >
> > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > ---
> > > > >  recipes-ti/ipc/ti-ipc-rtos_git.bb | 119
> > > > ++++++++++++++++++++++++++++++++------
> > > > >  recipes-ti/ipc/ti-ipc.inc         |   6 +-
> > > > >  2 files changed, 104 insertions(+), 21 deletions(-)
> > > > >
> > > > > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > b/recipes-ti/ipc/ti-ipc-
> > > > rtos_git.bb
> > > > > index 4c0fc74..8fb448f 100644
> > > > > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > @@ -2,9 +2,44 @@ require recipes-ti/includes/ti-paths.inc
> > > > > require recipes-ti/includes/ti-staging.inc
> > > > >  require ti-ipc.inc
> > > > >
> > > > > -PR =3D "${INC_PR}.4"
> > > > > +TI_IPC_EXAMPLES_GIT_URI =3D "git://git.ti.com/ipc/ipc-examples.g=
it"
> > > > > +TI_IPC_EXAMPLES_DEST_SUFFIX =3D "git/ipc-examples"
> > > > > +TI_IPC_EXAMPLES_GIT_PROTOCOL =3D "git"
> > > > > +TI_IPC_EXAMPLES_GIT_BRANCH =3D "master"
> > > > > +TI_IPC_EXAMPLES_NAME =3D "ipc-examples"
> > > > >
> > > > > -DEPENDS =3D "ti-xdctools ti-sysbios"
> > > > > +SRC_URI +=3D "${TI_IPC_EXAMPLES_GIT_URI};\
> > > > > +destsuffix=3D${TI_IPC_EXAMPLES_DEST_SUFFIX};\
> > > > > +protocol=3D${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
> > > > > +branch=3D${TI_IPC_EXAMPLES_GIT_BRANCH};\
> > > > > +name=3D${TI_IPC_EXAMPLES_NAME}"
> > > > > +
> > > > > +TI_IPC_METADATA_GIT_URI =3D "git://git.ti.com/ipc/ipc-metadata.g=
it"
> > > > > +TI_IPC_METADATA_DEST_SUFFIX =3D "git/ipc-metadata"
> > > > > +TI_IPC_METADATA_GIT_PROTOCOL =3D "git"
> > > > > +TI_IPC_METADATA_GIT_BRANCH =3D "master"
> > > > > +TI_IPC_METADATA_NAME =3D "ipc-metadata"
> > > > > +
> > > > > +SRC_URI +=3D "${TI_IPC_METADATA_GIT_URI};\
> > > > > +destsuffix=3D${TI_IPC_METADATA_DEST_SUFFIX};\
> > > > > +protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
> > > > > +branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
> > > > > +name=3D${TI_IPC_METADATA_NAME}"
> > > > > +
> > > > > +# Corresponds to tag: 3.42.01.03 SRCREV_ipc-examples =3D
> > > "bd4f28bd46467553e6610629ff13b4b5b3ba3af0"
> > > > > +
> > > > > +# Corresponds to tag: 3.42.01.03 SRCREV_ipc-metadata =3D
> > > "4d01fe4a7c41d2ce76a62b4325e66753d59b298c"
> > > > > +
> > > > > +SRCREV_FORMAT =3D "ipc-metadata_ipc-examples"
> > >
> > > I'm not sure about this SRCREV_FORMAT. Should it also contain the
> > > main ipc git SRCREV? And is this needed if SRCPV is not in the PV?
> >
> > Look like there is some confusion here. I am also not clear if this is =
needed if
> SRCREV is not used in PV.

Denys, Can you clarify on whether the SRCREV_FORMAT is really needed or not=
?

> >
> > >
> > > > > +
> > > > > +S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
> > > > > +S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
> > > > > +
> > > > > +PR =3D "${INC_PR}.0"
> > > > > +
> > > > > +DEPENDS =3D "ti-xdctools ti-sysbios doxygen-native"
> > > > >  DEPENDS_append_keystone =3D " ti-cgt6x-native \
> > > > >                              gcc-arm-none-eabi-native \  "
> > > > > @@ -12,6 +47,8 @@ DEPENDS_append_omap-a15 =3D " ti-cgt6x-native \
> > > > >                              ti-ccsv6-native \
> > > > >                              gcc-arm-none-eabi-native \  "
> > > > > +DEPENDS_append_c66x =3D " ti-cgt6x-native \ "
> > >
> > > These c66x machines have not yet been accepted into meta-ti.
> >
> > Ok. I will remove this for now.
> >
> > >
> > > > >
> > > > >  PACKAGES =3D+ "${PN}-fw"
> > > > >  FILES_${PN}-fw =3D "${base_libdir}/firmware/*"
> > > > > @@ -26,6 +63,7 @@ IPC_TARGETS =3D ""
> > > > >  IPC_TARGETS_omap-a15 =3D "\
> > > > >      gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
> > > > >      ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-c6x"
> > > > > \
> > > > > +
> > > > ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti=
/
> > > > cgt-
> > > > c6x" \
> > > > >      ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
> > > > >      ti.targets.arm.elf.M4F=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \  "
> > > > > @@ -33,18 +71,66 @@ IPC_TARGETS_omap-a15 =3D "\
> > > IPC_TARGETS_keystone
> > > > > =3D " \
> > > > >      gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
> > > > >      ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-c6x"
> > > > > \
> > > > > +
> > > > ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti=
/
> > > > cgt-
> > > > c6x" \
> > > > > +"
> > > > > +
> > > > > +IPC_TARGETS_c66x =3D " \
> > > > > +    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-c6x"
> > > > > +\
> > > > > +
> > > > ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti=
/
> > > > cgt-
> > > > c6x" \
> > > > >  "
> > > > >
> > > > >  EXTRA_OEMAKE =3D "\
> > > > >      PLATFORM=3D${PLATFORM} \
> > > > >      XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
> > > > >      BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
> > > > > -    ${IPC_TARGETS} -f ipc-bios.mak\
> > > > > +    ${IPC_TARGETS} \
> > > > >  "
> > > > >
> > > > > +RELEASE_TYPE =3D "GA"
> > > > > +RELEASE_SUFFIX =3D ""
> > > > > +
> > > > > +SRCIPK_SRC_DIR =3D "${D}${IPC_INSTALL_DIR_RECIPE}"
> > > > > +SRCIPK_INSTALL_DIR =3D "ipc_${@'${PV}'.replace('.',
> > > > '_')}${RELEASE_SUFFIX}"
> > >
> > > This already specified in meta-arago's arago-source-ipk.conf?
> >
> > I don't see anything related ti-ipc-rtos, in the master branch meta-ara=
go:
> arago-source-ipk.conf.
> > Am I missing something?
>=20
> Yes, no SRCIPK stuff in meta-ti allowed.
>=20

I see. I will remove from here and send update to meta-arago.

>=20
> > > > > +
> > > > >  do_compile() {
> > > > > -  oe_runmake clean
> > > > > -  oe_runmake all
> > > > > +  oe_runmake -f ipc-bios.mak clean  oe_runmake -f ipc-bios.mak
> > > > > + release
> > > > > +
> > > > > +  cd ${S_ipc-metadata}
> > > > > +  oe_runmake .all-files IPC_INSTALL_DIR=3D"${S}" \
> > > > > +    BUILD_HOST_OS=3D"linux" \
> > > > > +    RELEASE_TYPE=3D"${RELEASE_TYPE}"
> > > > > +
> > > > > +  cd ${S_ipc-examples}/src
> > > > > +  oe_runmake .examples \
> > > > > +    IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
> > > > > +
> > > > > +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> > > > > +    oe_runmake extract HOSTOS=3D"bios" IPC_INSTALL_DIR=3D"${S}"
> > > > > +    oe_runmake extract HOSTOS=3D"linux" IPC_INSTALL_DIR=3D"${S}"
> > > > > +
> > > > > +    if [ ! -z ${ALT_PLATFORM} ]; then
> > > > > +      oe_runmake extract PLATFORM=3D${ALT_PLATFORM}
> HOSTOS=3D"bios"
> > > > IPC_INSTALL_DIR=3D"${S}"
> > > > > +      oe_runmake extract PLATFORM=3D${ALT_PLATFORM}
> HOSTOS=3D"linux"
> > > > IPC_INSTALL_DIR=3D"${S}"
> > > > > +    fi
> > > > > +  fi
> > > > > +
> > > > > +  IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'=
`
> > > > > + # Copy docs and other meta files  install -d
> > > > > + ${D}${IPC_INSTALL_DIR_RECIPE}  cp -pPrf
> > > > > + ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d
> > > > ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > +
> > > > > +  # Copy example folders corresponding to the platforms  if [
> > > > > + "${PLATFORM}" !=3D "UNKNOWN" ]; then
> > > > > +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}/examples
> > > > > +    cp -pPf ${S_ipc-examples}/src/examples/*.*
> > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > +    cp -pPf ${S_ipc-examples}/src/examples/makefile
> > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > +    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}*
> > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > +    if [ ! -z ${ALT_PLATFORM} ]; then
> > > > > +      cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}*
> > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > +    fi
> > > > > +    find ${D}${IPC_INSTALL_DIR_RECIPE}/examples/ -name "*zip"
> > > > > + -type f |
> > > > xargs -I {} rm {}
> > > > > +  fi
> > >
> > > Why do all of this installation in the do_compile stage? Should it
> > > be in do_install?
> > >
> >
> > This is rtos package and everything is that is created is part of the s=
ource
> package.
> > Only what goes into file system is in the do_install step.
> >
> > > > >  }
> > > > >
> > > > >  do_compile_append() {
> > > > > @@ -52,25 +138,22 @@ do_compile_append() {  }
> > > > >
> > > > >  do_install() {
> > > > > -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > -
> > > > > -    install -d ${D}${base_libdir}/firmware/ipc
> > > > > -    cp -pPrf ${S}/packages/ti/ipc/tests/bin/*
> > > > ${D}${base_libdir}/firmware/ipc
> > > > > +  install -d ${D}${base_libdir}/firmware/ipc  cp -pPrf
> > > > > + ${S}/packages/ti/ipc/tests/bin/*
> > > > ${D}${base_libdir}/firmware/ipc
> > > > >  }
> > > > >
> > > > >  ALTERNATIVE_PRIORITY =3D "5"
> > > > >
> > > > >  pkg_postinst_${PN}-fw_omap-a15 () {
> > > > > -	update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 d=
ra7-
> > > > dsp1-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > -	update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 d=
ra7-
> > > > dsp2-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > -	update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 d=
ra7-
> > > > ipu1-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > -	update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 d=
ra7-
> > > > ipu2-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > +  update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66
> > > > > + dra7-
> > > > dsp1-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > +  update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66
> > > > > + dra7-
> > > > dsp2-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > +  update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4
> > > > > + dra7-
> > > > ipu1-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > ${ALTERNATIVE_PRIORITY}
> > > > > +  update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4
> > > > > + dra7-
> > > > ipu2-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > ${ALTERNATIVE_PRIORITY}
> > > > >  }
> > > > >
> > > > >  pkg_postrm_${PN}-fw_omap-a15 () {
> > > > > -	update-alternatives --remove dra7-dsp1-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > -	update-alternatives --remove dra7-dsp2-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > -	update-alternatives --remove dra7-ipu1-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > -	update-alternatives --remove dra7-ipu2-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > > +  update-alternatives --remove dra7-dsp1-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > +  update-alternatives --remove dra7-dsp2-fw.xe66
> > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > +  update-alternatives --remove dra7-ipu1-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > +  update-alternatives --remove dra7-ipu2-fw.xem4
> > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > >  }
> > > > > diff --git a/recipes-ti/ipc/ti-ipc.inc
> > > > > b/recipes-ti/ipc/ti-ipc.inc index 69127aa..9c5dfed 100644
> > > > > --- a/recipes-ti/ipc/ti-ipc.inc
> > > > > +++ b/recipes-ti/ipc/ti-ipc.inc
> > > > > @@ -8,15 +8,15 @@ TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev=
.git"
> > > > >  TI_IPC_GIT_PROTOCOL =3D "git"
> > > > >  TI_IPC_GIT_BRANCH =3D "3.42"
> > > > >
> > > > > -#Corresponds to 3.42.00.02
> > > > > -TI_IPC_SRCREV =3D "a520969994378fb2629d7dfc25f306c3a711b5bc"
> > > > > +#Corresponds to 3.42.01.03
> > > > > +TI_IPC_SRCREV =3D "dc6c5082f478225b7fbce4216173e6c5b36100b4"
> > > > >
> > > > >  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
> > > > >  SRC_URI =3D
> > > >
> > >
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH}"
> > > > >  SRCREV =3D "${TI_IPC_SRCREV}"
> > > > >
> > > > >  S =3D "${WORKDIR}/git"
> > > > > -PV =3D "3.42.00.02"
> > > > > +PV =3D "3.42.01.03"
> > > > >  INC_PR =3D "r0"
> > > > >
> > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

