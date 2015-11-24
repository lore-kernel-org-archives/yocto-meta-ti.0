Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9616EE00B45; Tue, 24 Nov 2015 09:58:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 571C0E005BB
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 09:58:02 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAOHw26C030719
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 11:58:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAOHw2TZ025029
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 11:58:02 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 24 Nov 2015 11:58:02 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2] dsplib-c66x: add version 3.4.0.0
Thread-Index: AQHRJgviskD3KzUCI06g9Sqty70SrJ6rdrTA
Date: Tue, 24 Nov 2015 17:58:01 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B0237A@DFLE08.ent.ti.com>
References: <1448296062-21944-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1448296062-21944-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] dsplib-c66x: add version 3.4.0.0
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
X-List-Received-Date: Tue, 24 Nov 2015 17:58:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping. The new video analytics demo for Processor SDK depends on this dsplib=
 package.

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Monday, November 23, 2015 11:28 AM
> To: meta-ti@yoctoproject.org
> Cc: Gou, Hongmei
> Subject: [meta-ti] [PATCH v2] dsplib-c66x: add version 3.4.0.0
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v2 change: add definition for ${S}
>=20
>  recipes-ti/dsplib/dsplib-c66x.inc        | 31
> +++++++++++++++++++++++++++++++
>  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 +++++++++
>  recipes-ti/includes/ti-paths.inc         |  2 ++
>  3 files changed, 42 insertions(+)
>  create mode 100644 recipes-ti/dsplib/dsplib-c66x.inc  create mode 100644
> recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
>=20
> diff --git a/recipes-ti/dsplib/dsplib-c66x.inc b/recipes-ti/dsplib/dsplib=
-c66x.inc
> new file mode 100644
> index 0000000..9b378d4
> --- /dev/null
> +++ b/recipes-ti/dsplib/dsplib-c66x.inc
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "DSPLIB contains optimized general-purpose signal-
> processing routines for TI DSPs"
> +HOMEPAGE =3D "http://www.ti.com/tool/sprc265"
> +SECTION =3D "devel"
> +LICENSE =3D "BSD-3-Clause"
> +
> +require ../includes/ti-paths.inc
> +require ../includes/ti-staging.inc
> +require ../includes/ti-unpack.inc
> +
> +COMPATIBLE_MACHINE =3D "omap-a15|keystone|c66x"
> +
> +SRC_URI =3D "http://software-
> dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};nam
> e=3Ddsplib"
> +
> +S =3D "${WORKDIR}/dsplib-c66x-${PV}"
> +
> +BINFILE =3D "dsplib_c66x_${PV}_Linux.bin"
> +TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
> +TI_BIN_UNPK_CMDS =3D ""
> +
> +do_install() {
> +    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +FILES_${PN}-dev +=3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev =3D "arch"
> +
> +CREATE_SRCIPK =3D "1"
> +SRCIPK_INSTALL_DIR =3D "dsplib_c66x_${PV}"
> diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb b/recipes-ti/dsplib=
/dsplib-
> c66x_3.4.0.0.bb
> new file mode 100644
> index 0000000..f1273f3
> --- /dev/null
> +++ b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> @@ -0,0 +1,9 @@
> +require dsplib-c66x.inc
> +
> +PV =3D "3_4_0_0"
> +PR =3D "r1"
> +
> +LIC_FILES_CHKSUM =3D
> "file://packages/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md5=3D1773=
3f9e110
> 0f8a628512f47c4bf676a"
> +
> +SRC_URI[dsplib.md5sum] =3D "66785604729c153dcad5282097dee8bf"
> +SRC_URI[dsplib.sha256sum] =3D
> "e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
> index ad4ff78..37feb93 100644
> --- a/recipes-ti/includes/ti-paths.inc
> +++ b/recipes-ti/includes/ti-paths.inc
> @@ -49,6 +49,7 @@ export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =3D
> "${installdir}/ti-cgt-arm"
>  export CCSV6_INSTALL_DIR_RECIPE           =3D "${installdir}/ccsv6"
>  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =3D "${installdir}/gcc-arm-
> none-eabi"
>  export TI_CGT_PRU_INSTALL_DIR_RECIPE      =3D "${installdir}/cgt-pru"
> +export DSPLIB_C66_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-dsplib-c=
66x-
> tree"
>=20
>=20
>  # This is where the tools will end up in sysroot
> @@ -89,6 +90,7 @@ export M4_TOOLCHAIN_INSTALL_DIR    =3D
> "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTAL
>  export CCSV6_INSTALL_DIR           =3D
> "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
>  export GCC_ARM_NONE_TOOLCHAIN      =3D
> "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
>  export TI_CGT_PRU_INSTALL_DIR      =3D
> "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> +export DSPLIB_C66_INSTALL_DIR      =3D
> "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
>=20
>  DSPSUFFIX_omapl137 =3D "x674"
>  DSPSUFFIX_omapl138 =3D "x674"
> --
> 1.9.1


