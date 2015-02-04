Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12CFCE0082D; Wed,  4 Feb 2015 08:43:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 953B7E00753
	for <meta-ti@yoctoproject.org>; Wed,  4 Feb 2015 08:42:58 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t14Ggvck018961
	for <meta-ti@yoctoproject.org>; Wed, 4 Feb 2015 10:42:57 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14Ggun5031348
	for <meta-ti@yoctoproject.org>; Wed, 4 Feb 2015 10:42:56 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 4 Feb 2015 10:42:56 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
Thread-Index: AQHQQJEOPxCn4R07mkGjvZbg9dXZiJzgq3QQ
Date: Wed, 4 Feb 2015 16:42:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F6FA5@DFLE08.ent.ti.com>
References: <1423064446-7202-1-git-send-email-j-stiffler@ti.com>
	<1423064446-7202-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1423064446-7202-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
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
X-List-Received-Date: Wed, 04 Feb 2015 16:43:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In general we delete old recipes and add new recipes as two separate patche=
s. So I would recommend creating your new recipe in one patch and then dele=
ting the old recipes in another patch.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> Sent: Wednesday, February 04, 2015 9:41 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
>=20
> * Remove older versions.
> * Add support for native and nativesdk versions.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x.inc       |   24 ---------
>  recipes-ti/devtools/ti-cgt6x_6.1.20.bb |   11 ----
>  recipes-ti/devtools/ti-cgt6x_7.2.7.bb  |   13 -----
>  recipes-ti/devtools/ti-cgt6x_8.0.0.bb  |   86
> ++++++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+), 48 deletions(-)  delete mode 100644
> recipes-ti/devtools/ti-cgt6x.inc  delete mode 100644 recipes-ti/devtools/=
ti-
> cgt6x_6.1.20.bb
>  delete mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb
>  create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb
>=20
> diff --git a/recipes-ti/devtools/ti-cgt6x.inc b/recipes-ti/devtools/ti-cg=
t6x.inc
> deleted file mode 100644
> index 1d00a55..0000000
> --- a/recipes-ti/devtools/ti-cgt6x.inc
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D "TI DSP Code Generation Tools"
> -HOMEPAGE =3D "https://www-
> a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -SECTION =3D "devel"
> -LICENSE =3D "TI"
> -
> -require ../includes/ti-paths.inc
> -require ../includes/ti-staging.inc
> -require ../includes/ti-eula-unpack.inc
> -
> -PR =3D "r4"
> -
> -S =3D "${WORKDIR}/cgt6x_${PV}"
> -
> -SRC_URI =3D
> "http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x=
86
> .bin;name=3Dcgt6xbin"
> -
> -BINFILE=3D"ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin"
> -TI_BIN_UNPK_CMDS=3D"Y:qY:workdir: : "
> -TI_BIN_UNPK_WDEXT=3D"/cgt6x_${PV}"
> -
> -do_install() {
> -    install -d ${D}${CODEGEN_INSTALL_DIR_RECIPE}
> -    cp -pPrf ${S}/* ${D}${CODEGEN_INSTALL_DIR_RECIPE}
> -}
> -
> diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb b/recipes-ti/devtools=
/ti-
> cgt6x_6.1.20.bb
> deleted file mode 100644
> index 1d6609c..0000000
> --- a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require ti-cgt6x.inc
> -
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D62f46f1125a152a2e213b414db7ac600"
> -
> -PE =3D "1"
> -PV =3D "6_1_20"
> -PVwithdots =3D "6.1.20"
> -
> -SRC_URI[cgt6xbin.md5sum] =3D "39485ea8211960de0a958ab27106ab9b"
> -SRC_URI[cgt6xbin.sha256sum] =3D
> "a020142011c8160e24f6386f7696ecfbfe02dab2a6c83af74ce6b67eb1da990
> 0"
> -
> diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/=
ti-
> cgt6x_7.2.7.bb
> deleted file mode 100644
> index a226600..0000000
> --- a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require ti-cgt6x.inc
> -
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D62f46f1125a152a2e213b414db7ac600"
> -
> -PE =3D "1"
> -PV =3D "7_2_7"
> -PVwithdots =3D "7.2.7"
> -
> -SRC_URI[cgt6xbin.md5sum] =3D "71a0768a541fdebd9c35d44301019d1d"
> -SRC_URI[cgt6xbin.sha256sum] =3D
> "211477f0142d603975544abe3c45cc3b77a3b38038158676c6081280637873
> 8b"
> -
> -
> -INSANE_SKIP_${PN} =3D "installed-vs-shipped"
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/=
ti-
> cgt6x_8.0.0.bb
> new file mode 100644
> index 0000000..28689af
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> @@ -0,0 +1,86 @@
> +DESCRIPTION =3D "TI DSP Code Generation Tools"
> +HOMEPAGE =3D "https://www-
> a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE =3D "TI TSPA with portions under Thai Open Source Software Cente=
r
> & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 and MIT and BSD-2-
> Clause and Public Domain and other similar"
> +
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-
> c6000_${PV}/LICENSE.txt;md5=3Db6311962635a4f15630e36ec2d875eca"
> +LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-
> c6x/LICENSE.txt;md5=3Db6311962635a4f15630e36ec2d875eca"
> +
> +require ../includes/ti-unpack.inc
> +
> +BINFILE =3D "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME =3D "cgt6x_x86_installer"
> +TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
> +TI_BIN_UNPK_CMDS =3D ""
> +
> +BINFILE_class-target =3D
> "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME_class-target =3D "cgt6x_arm_installer"
> +
> +SRC_URI =3D "http://software-
> dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};
> name=3D${BINFILE_NAME}"
> +
> +SRC_URI[cgt6x_x86_installer.md5sum] =3D
> "ff83845672090bf0a669bba7b0cadf56"
> +SRC_URI[cgt6x_x86_installer.sha256sum] =3D
> "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709
> "
> +
> +SRC_URI[cgt6x_arm_installer.md5sum] =3D
> "13961e5a1da4c310ea8c8707ab981fff"
> +SRC_URI[cgt6x_arm_installer.sha256sum] =3D
> "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb
> "
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> +        install -m 755 ${binfile} ${D}${bindir}
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/include
> +    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> +        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
> +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> +    done
> +
> +    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> +    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> +        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> +    done
> +
> +    install -d ${D}${datadir}/man/man1
> +    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
> +        install -m 644 ${manfile} ${D}${datadir}/man/man1
> +    done
> +
> +    install -d ${D}${datadir}/doc/ti/cgt-c6x
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> +    done
> +
> +}
> +
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D} }
> +
> +FILES_${PN} +=3D "${datadir}/ti/*"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

