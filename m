Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C5CBE00782; Thu, 15 Jan 2015 10:42:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AF0AE004D6
	for <meta-ti@yoctoproject.org>; Thu, 15 Jan 2015 10:42:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0FIgsxJ016439
	for <meta-ti@yoctoproject.org>; Thu, 15 Jan 2015 12:42:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0FIgsqb014319
	for <meta-ti@yoctoproject.org>; Thu, 15 Jan 2015 12:42:54 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 15 Jan 2015 12:42:54 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] hplib: Add recipe for TI high performance library
Thread-Index: AQHQLIKH8fQX1mbSkUqnDGHh/iJac5zBjRVQ
Date: Thu, 15 Jan 2015 18:42:52 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490580F9440@DLEE11.ent.ti.com>
References: <1420859229-28228-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1420859229-28228-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] hplib: Add recipe for TI high performance library
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
X-List-Received-Date: Thu, 15 Jan 2015 18:42:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Friday, January 09, 2015 10:07 PM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [PATCH] hplib: Add recipe for TI high performance library
>=20
> - Provides high performance library, kernel module, user space libraries
>   and test binaries
> - Supports devices k2h, k2k, k2l & k2e
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/hplib/hplib-mod_git.bb  |   20 ++++++++++++++++++++
>  recipes-bsp/hplib/hplib-test_git.bb |   30
> ++++++++++++++++++++++++++++++
>  recipes-bsp/hplib/hplib.inc         |   10 ++++++++++
>  recipes-bsp/hplib/hplib_git.bb      |   30 +++++++++++++++++++++++++++++=
+
>  4 files changed, 90 insertions(+)
>  create mode 100644 recipes-bsp/hplib/hplib-mod_git.bb
>  create mode 100644 recipes-bsp/hplib/hplib-test_git.bb
>  create mode 100644 recipes-bsp/hplib/hplib.inc
>  create mode 100644 recipes-bsp/hplib/hplib_git.bb
>=20
> diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib=
-
> mod_git.bb
> new file mode 100644
> index 0000000..acef1ce
> --- /dev/null
> +++ b/recipes-bsp/hplib/hplib-mod_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "TI High Performance Library kernel module"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/runtime/hplib/module/COPYING.txt;md5=3Dc1c4d34
> 53cddc5b7f0ce84a277e66779"
> +
> +DEPENDS =3D "hplib"
> +
> +include hplib.inc
> +
> +# This package builds a kernel module, use kernel PR as base and append =
a
> local
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +S =3D"${WORKDIR}/git/ti/runtime/hplib/module"
> +EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR}
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> +
> +inherit module
> +
> +do_install () {
> +	oe_runmake install INSTALL_MOD_PATH=3D"${D}"
> +}
> diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hpli=
b-
> test_git.bb
> new file mode 100644
> index 0000000..574fa2a
> --- /dev/null
> +++ b/recipes-bsp/hplib/hplib-test_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "TI High performance library test binaries"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=3Db7982a377c
> 680ad71ca2fbb735982462"
> +
> +DEPENDS =3D "common-csl-ip qmss-lld sa-lld pktlib hplib"
> +
> +include hplib.inc
> +
> +CHOICELIST =3D "yes no"
> +
> +S =3D "${WORKDIR}/git/ti/runtime/hplib"
> +
> +EXTRA_OEMAKE +=3D '-f makefile_armv7
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}'
> +
> +do_compile () {
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			oe_runmake tests HPLIB_SRC_DIR=3D${S}
> USEDYNAMIC_LIB=3D$choice DEVICE=3D"$device"
> +		done
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		oe_runmake installbin
> INSTALL_INC_BASE_DIR=3D${D}${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"$device"
> +	done
> +}
> diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
> new file mode 100644
> index 0000000..99254d1
> --- /dev/null
> +++ b/recipes-bsp/hplib/hplib.inc
> @@ -0,0 +1,10 @@
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +DEVICELIST =3D "k2h k2k k2l k2e"
> +
> +BRANCH =3D "master"
> +SRC_URI =3D "git://git.ti.com/keystone-
> rtos/hplib.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +# Below Commit ID corresponds to "DEV.HPLIB.01.01.00.04"
> +SRCREV =3D "89d847bb8155f5727867d82f96978f89ea0a7d13"
> +PV =3D "01.01.00.04"
> diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git=
.bb
> new file mode 100644
> index 0000000..fbb3004
> --- /dev/null
> +++ b/recipes-bsp/hplib/hplib_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "TI High performance libraries"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=3Db7982a377c
> 680ad71ca2fbb735982462"
> +
> +DEPENDS =3D "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
> +
> +include hplib.inc
> +
> +CHOICELIST =3D "yes no"
> +
> +S =3D "${WORKDIR}/git/ti/runtime/hplib"
> +
> +EXTRA_OEMAKE +=3D "-f makefile_armv7
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> +
> +do_compile () {
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			oe_runmake lib HPLIB_SRC_DIR=3D${S}
> USEDYNAMIC_LIB=3D$choice DEVICE=3D"$device"
> +		done
> +	done
> +}
> +
> +do_install () {
> +	for device in ${DEVICELIST}
> +	do
> +		oe_runmake install
> INSTALL_INC_BASE_DIR=3D${D}${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}${libdir} INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> DEVICE=3D"$device"
> +	done
> +}
> --
> 1.7.9.5


