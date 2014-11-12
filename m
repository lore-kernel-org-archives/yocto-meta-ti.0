Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCCD9E008CC; Wed, 12 Nov 2014 07:23:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37DE0E00872
	for <meta-ti@yoctoproject.org>; Wed, 12 Nov 2014 07:23:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sACFNEW5019157
	for <meta-ti@yoctoproject.org>; Wed, 12 Nov 2014 09:23:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sACFNEVV002049
	for <meta-ti@yoctoproject.org>; Wed, 12 Nov 2014 09:23:14 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 12 Nov 2014 09:23:14 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH v2] hyplnk-lld: Add new recipe for Hyperlink lld
Thread-Index: AQHP+UY9KAFT8dPmMECRiJJaC+cTp5xdJpKw
Date: Wed, 12 Nov 2014 15:23:14 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905809AA1E@DLEE11.ent.ti.com>
References: <1415225824-26713-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1415225824-26713-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] hyplnk-lld: Add new recipe for Hyperlink lld
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
X-List-Received-Date: Wed, 12 Nov 2014 15:23:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Wednesday, November 05, 2014 5:17 PM
> To: meta-ti@yoctoproject.org
> Cc: Nelson, Sam
> Subject: [PATCH v2] hyplnk-lld: Add new recipe for Hyperlink lld
>=20
> - Provides low level driver for Hyperlink module
> - Test recipe is used to build tests and examples using
>   the hyperlink library.
> - Supports k2h, k2k & k2e
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
> Changes from previous patch
> - Formatting changes
> - Removed {} for non shell variables
> - Make lines organised into multiple lines
> - Added consistent use of {S} instead of PWD
> ---
> ---
>  recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb |   32
> +++++++++++++++++++++++++
>  recipes-bsp/hyplnk-lld/hyplnk-lld.inc         |   24 +++++++++++++++++++
>  recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      |   22 +++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
>  create mode 100644 recipes-bsp/hyplnk-lld/hyplnk-lld.inc
>  create mode 100755 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
>=20
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-
> bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> new file mode 100755
> index 0000000..8212c97
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
> @@ -0,0 +1,32 @@
> +include hyplnk-lld.inc
> +
> +DEPENDS =3D "common-csl-ip hyplnk-lld"
> +
> +CHOICELIST =3D " yes \
> +               no  \
> +"
> +
> +do_compile () {
> +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> +		HYPLNK_SRC_DIR=3D"${S}"
> +	for device in ${DEVICELIST}
> +	do
> +		for choice in ${CHOICELIST}
> +		do
> +			make -f makefile_armv7 tests examples \
> +				PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> +				DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}" \
> +				USEDYNAMIC_LIB=3D"$choice"
> +		done
> +	done
> +}
> +
> +do_install () {
> +    for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 installbin \
> +			PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"
> DEVICE=3D"$device" \
> +			HYPLNK_SRC_DIR=3D"${S}" \
> +			INSTALL_BIN_BASE_DIR=3D"${D}/${bindir}"
> +	done
> +}
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-
> lld/hyplnk-lld.inc
> new file mode 100644
> index 0000000..4c8bb32
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "TI Hyperlink Low Level Driver"
> +LICENSE =3D "BSD-3-Clause"
> +
> +COMPATIBLE_MACHINE =3D "keystone"
> +
> +LLDNAME=3D"hyplnk"
> +
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=3D623325cc19e
> 613a4e770fbb749922592"
> +
> +BRANCH=3D"master"
> +SRC_URI =3D "git://git.ti.com/keystone-rtos/hyplnk-
> lld.git;destsuffix=3Dgit/ti/drv/${LLDNAME};protocol=3Dgit;branch=3D${BRAN=
CH}"
> +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.01
> +SRCREV =3D "6910da379501984ecf27f8d23ba6fc6310fe387e"
> +
> +PV =3D "2.1.0"
> +PR =3D "r0"
> +
> +DEVICELIST =3D " k2h \
> +               k2k \
> +               k2e \
> +"
> +
> +BASEDIR =3D "${WORKDIR}/git"
> +S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
> diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hypln=
k-
> lld/hyplnk-lld_git.bb
> new file mode 100755
> index 0000000..a582f98
> --- /dev/null
> +++ b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
> @@ -0,0 +1,22 @@
> +include hyplnk-lld.inc
> +
> +DEPENDS =3D "common-csl-ip"
> +
> +CHOICELIST =3D " yes \
> +               no  \
> +"
> +do_compile () {
> +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> +		HYPLNK_SRC_DIR=3D"${S}"
> +	for device in ${DEVICELIST}
> +	do
> +		make -f makefile_armv7 lib
> PDK_INSTALL_PATH=3D"${STAGING_INCDIR}"\
> +			DEVICE=3D"$device" HYPLNK_SRC_DIR=3D"${S}"
> +	done
> +}
> +
> +do_install () {
> +	make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D"${STAGING_INCDIR}" \
> +		INSTALL_INC_BASE_DIR=3D"${D}/${includedir}" \
> +		INSTALL_LIB_BASE_DIR=3D"${D}${libdir}"
> HYPLNK_SRC_DIR=3D"${S}"
> +}
> --
> 1.7.9.5


