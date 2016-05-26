Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7C03E00DB8; Thu, 26 May 2016 07:30:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E3FCE00B6F
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 07:30:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4QEUFDn031543
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 09:30:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4QEUFfb012512
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 09:30:15 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 26 May 2016 09:30:15 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH v4] ti-ipc-rtos: Update to include examples and
	documentation with the package
Thread-Index: AQHRsfNBOJe1/aZGkUecQbJxJ54rZ5/LUkmg
Date: Thu, 26 May 2016 14:30:14 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490583E3EB1@DLEE11.ent.ti.com>
References: <1463678649-33720-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1463678649-33720-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH v4] ti-ipc-rtos: Update to include examples and documentation with the package
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
X-List-Received-Date: Thu, 26 May 2016 14:30:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Thursday, May 19, 2016 1:24 PM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [PATCH v4] ti-ipc-rtos: Update to include examples and
> documentation with the package
>=20
> Updated to new version 3.42.01.03
> Added procedures and source urls for adding examples and documentation
> into src package.
> Added dependency on doxygen for document creation Added big endian c66
> targets Updated uniform formatting
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Changes from previous version of patch
> Introduced IPC_PACKAGE_DIR to gather src package Allowed empty test
> binaries for some platforms may not have test binaries.
>=20
> ---
> ---
>  recipes-ti/ipc/ti-ipc-rtos_git.bb | 112 ++++++++++++++++++++++++++++++++=
---
> ---
>  recipes-ti/ipc/ti-ipc.inc         |   8 +--
>  2 files changed, 99 insertions(+), 21 deletions(-)
>=20
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rt=
os_git.bb
> index 4c0fc74..497fa95 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -2,9 +2,42 @@ require recipes-ti/includes/ti-paths.inc  require recipe=
s-
> ti/includes/ti-staging.inc
>  require ti-ipc.inc
>=20
> -PR =3D "${INC_PR}.4"
> +TI_IPC_EXAMPLES_GIT_URI =3D "git://git.ti.com/ipc/ipc-examples.git"
> +TI_IPC_EXAMPLES_DEST_SUFFIX =3D "git/ipc-examples"
> +TI_IPC_EXAMPLES_GIT_PROTOCOL =3D "git"
> +TI_IPC_EXAMPLES_GIT_BRANCH =3D "master"
> +TI_IPC_EXAMPLES_NAME =3D "ipc-examples"
>=20
> -DEPENDS =3D "ti-xdctools ti-sysbios"
> +SRC_URI +=3D "${TI_IPC_EXAMPLES_GIT_URI};\
> +destsuffix=3D${TI_IPC_EXAMPLES_DEST_SUFFIX};\
> +protocol=3D${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
> +branch=3D${TI_IPC_EXAMPLES_GIT_BRANCH};\
> +name=3D${TI_IPC_EXAMPLES_NAME}"
> +
> +TI_IPC_METADATA_GIT_URI =3D "git://git.ti.com/ipc/ipc-metadata.git"
> +TI_IPC_METADATA_DEST_SUFFIX =3D "git/ipc-metadata"
> +TI_IPC_METADATA_GIT_PROTOCOL =3D "git"
> +TI_IPC_METADATA_GIT_BRANCH =3D "master"
> +TI_IPC_METADATA_NAME =3D "ipc-metadata"
> +
> +SRC_URI +=3D "${TI_IPC_METADATA_GIT_URI};\
> +destsuffix=3D${TI_IPC_METADATA_DEST_SUFFIX};\
> +protocol=3D${TI_IPC_METADATA_GIT_PROTOCOL};\
> +branch=3D${TI_IPC_METADATA_GIT_BRANCH};\
> +name=3D${TI_IPC_METADATA_NAME}"
> +
> +# Corresponds to tag: 3.42.01.03
> +SRCREV_ipc-examples =3D "bd4f28bd46467553e6610629ff13b4b5b3ba3af0"
> +
> +# Corresponds to tag: 3.42.01.03
> +SRCREV_ipc-metadata =3D "4d01fe4a7c41d2ce76a62b4325e66753d59b298c"
> +
> +S_ipc-examples =3D "${WORKDIR}/git/ipc-examples"
> +S_ipc-metadata =3D "${WORKDIR}/git/ipc-metadata"
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEPENDS =3D "ti-xdctools ti-sysbios doxygen-native"
>  DEPENDS_append_keystone =3D " ti-cgt6x-native \
>                              gcc-arm-none-eabi-native \  "
> @@ -26,6 +59,7 @@ IPC_TARGETS =3D ""
>  IPC_TARGETS_omap-a15 =3D "\
>      gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
>      ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +
> + ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-
> + c6x" \
>      ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
>      ti.targets.arm.elf.M4F=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \  "
> @@ -33,18 +67,60 @@ IPC_TARGETS_omap-a15 =3D "\  IPC_TARGETS_keystone
> =3D " \
>      gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
>      ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> +
> + ti.targets.elf.C66_big_endian=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt=
-
> + c6x" \
>  "
>=20
>  EXTRA_OEMAKE =3D "\
>      PLATFORM=3D${PLATFORM} \
>      XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
>      BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
> -    ${IPC_TARGETS} -f ipc-bios.mak\
> +    ${IPC_TARGETS} \
>  "
>=20
> +RELEASE_TYPE =3D "GA"
> +RELEASE_SUFFIX =3D ""
> +
> +IPC_PACKAGE_DIR =3D "${S}/ipc-package"
> +
>  do_compile() {
> -  oe_runmake clean
> -  oe_runmake all
> +  oe_runmake -f ipc-bios.mak clean
> +  oe_runmake -f ipc-bios.mak release
> +
> +  cd ${S_ipc-metadata}
> +  oe_runmake .all-files IPC_INSTALL_DIR=3D"${S}" \
> +    BUILD_HOST_OS=3D"linux" \
> +    RELEASE_TYPE=3D"${RELEASE_TYPE}"
> +
> +  cd ${S_ipc-examples}/src
> +  oe_runmake .examples \
> +    IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
> +
> +  if [  "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    oe_runmake extract HOSTOS=3D"bios" IPC_INSTALL_DIR=3D"${S}"
> +    oe_runmake extract HOSTOS=3D"linux" IPC_INSTALL_DIR=3D"${S}"
> +
> +    if [ ! -z ${ALT_PLATFORM} ]; then
> +      oe_runmake extract PLATFORM=3D${ALT_PLATFORM} HOSTOS=3D"bios"
> IPC_INSTALL_DIR=3D"${S}"
> +      oe_runmake extract PLATFORM=3D${ALT_PLATFORM} HOSTOS=3D"linux"
> IPC_INSTALL_DIR=3D"${S}"
> +    fi
> +  fi
> +
> +  IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
> + install -d ${IPC_PACKAGE_DIR}  # Copy docs and other meta files  cp
> + -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d
> + ${IPC_PACKAGE_DIR}
> +
> +  # Copy example folders corresponding to the platforms  if [
> + "${PLATFORM}" !=3D "UNKNOWN" ]; then
> +    install -d ${IPC_PACKAGE_DIR}/examples
> +    cp -pPf ${S_ipc-examples}/src/examples/*.*
> ${IPC_PACKAGE_DIR}/examples/
> +    cp -pPf ${S_ipc-examples}/src/examples/makefile
> ${IPC_PACKAGE_DIR}/examples/
> +    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}*
> ${IPC_PACKAGE_DIR}/examples/
> +    if [ ! -z ${ALT_PLATFORM} ]; then
> +      cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}*
> ${IPC_PACKAGE_DIR}/examples/
> +    fi
> +    find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I
> + {} rm {}  fi
>  }
>=20
>  do_compile_append() {
> @@ -52,25 +128,27 @@ do_compile_append() {  }
>=20
>  do_install() {
> -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> +  IPC_VERSION=3D`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`  # Cop=
y
> + docs and other meta files  install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> + cp -pPrf  ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
>=20
> -    install -d ${D}${base_libdir}/firmware/ipc
> -    cp -pPrf ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmwar=
e/ipc
> +  install -d ${D}${base_libdir}/firmware/ipc  cp -pPrf
> + ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc ||
> + true
>  }
>=20
>  ALTERNATIVE_PRIORITY =3D "5"
>=20
>  pkg_postinst_${PN}-fw_omap-a15 () {
> -	update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-
> dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> ${ALTERNATIVE_PRIORITY}
> -	update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-
> dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> ${ALTERNATIVE_PRIORITY}
> -	update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-
> ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> ${ALTERNATIVE_PRIORITY}
> -	update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-
> ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> ${ALTERNATIVE_PRIORITY}
> +  update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66
> + dra7-dsp1-fw.xe66
> + ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> + ${ALTERNATIVE_PRIORITY}  update-alternatives --install
> + /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66
> + ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> + ${ALTERNATIVE_PRIORITY}  update-alternatives --install
> + /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4
> + ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> + ${ALTERNATIVE_PRIORITY}  update-alternatives --install
> + /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4
> + ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> + ${ALTERNATIVE_PRIORITY}
>  }
>=20
>  pkg_postrm_${PN}-fw_omap-a15 () {
> -	update-alternatives --remove dra7-dsp1-fw.xe66
> ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> -	update-alternatives --remove dra7-dsp2-fw.xe66
> ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> -	update-alternatives --remove dra7-ipu1-fw.xem4
> ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> -	update-alternatives --remove dra7-ipu2-fw.xem4
> ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> +  update-alternatives --remove dra7-dsp1-fw.xe66
> + ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> +  update-alternatives --remove dra7-dsp2-fw.xe66
> + ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> +  update-alternatives --remove dra7-ipu1-fw.xem4
> + ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> +  update-alternatives --remove dra7-ipu2-fw.xem4
> + ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
>  }
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc index
> 69127aa..27b360d 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,15 +8,15 @@ TI_IPC_GIT_URI =3D "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL =3D "git"
>  TI_IPC_GIT_BRANCH =3D "3.42"
>=20
> -#Corresponds to 3.42.00.02
> -TI_IPC_SRCREV =3D "a520969994378fb2629d7dfc25f306c3a711b5bc"
> +#Corresponds to 3.42.01.03
> +TI_IPC_SRCREV =3D "dc6c5082f478225b7fbce4216173e6c5b36100b4"
>=20
>  BRANCH =3D "${TI_IPC_GIT_BRANCH}"
> -SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH}"
> +SRC_URI =3D
> "${TI_IPC_GIT_URI};protocol=3D${TI_IPC_GIT_PROTOCOL};branch=3D${BRANCH};n
> ame=3Dipcdev"
>  SRCREV =3D "${TI_IPC_SRCREV}"
>=20
>  S =3D "${WORKDIR}/git"
> -PV =3D "3.42.00.02"
> +PV =3D "3.42.01.03"
>  INC_PR =3D "r0"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 1.9.1


