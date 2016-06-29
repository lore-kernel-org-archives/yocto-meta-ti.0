Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31F86E00D3C; Wed, 29 Jun 2016 12:05:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 79 seconds by postgrey-1.32 at yocto-www;
	Wed, 29 Jun 2016 12:05:03 PDT
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D552DE00D35
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 12:05:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TJ3iGL024491
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:03:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TJ3hci020940
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:03:44 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 29 Jun 2016 14:03:43 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Sobota, Justin" <jsobota@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [master/krogoth][PATCH v3] common-csl-ip: Move to
	new	make infrastructure & Bump version
Thread-Index: AQHR0jgfbDiadKirOkevqkrOsknR1aAAzWRQ
Date: Wed, 29 Jun 2016 19:03:43 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142C2A48@DFLE09.ent.ti.com>
References: <1467226638-14891-1-git-send-email-jsobota@ti.com>
In-Reply-To: <1467226638-14891-1-git-send-email-jsobota@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [master/krogoth][PATCH v3] common-csl-ip: Move to new	make infrastructure & Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 19:05:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jacob Stiffler <j-stiffler@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Sobota, Justin
> Sent: Wednesday, June 29, 2016 2:57 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [master/krogoth][PATCH v3] common-csl-ip: Move to new
> make infrastructure & Bump version
>=20
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   28 +++++++++-----=
------
>  recipes-bsp/common-csl-ip/common-csl-ip.inc        |    6 ++---
>  2 files changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 43ea2ed..877b230 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -1,5 +1,5 @@
>  require common-csl-ip.inc
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> @@ -7,20 +7,16 @@ inherit ti-pdk
>=20
>  DEPENDS_remove =3D "${PN}"
>=20
> -XDCARGS_ti33x =3D "am335x"
> -XDCARGS_ti43x =3D "am437x"
> -XDCARGS_omap-a15 =3D "am571x am572x"
> -XDCARGS_k2hk-evm =3D "k2h k2k"
> -XDCARGS_k2l-evm =3D "k2l"
> -XDCARGS_k2e-evm =3D "k2e"
> -XDCARGS_k2g-evm =3D "k2g"
> +# Build with make instead of XDC
> +XDCMAKE =3D "0"
>=20
> -do_configure_append() {
> -    # Create empty makefile
> -    # If libraries are supported for this device, then this will be over=
written
> -    cat > ${BUILD_DIR}/makefile << __EOF__
> -# Nothing to do
> -all:
> +LIMSOCS_ti33x =3D "am335x"
> +LIMSOCS_ti43x =3D "am437x"
> +LIMSOCS_omap-a15 =3D "am571x am572x"
> +LIMSOCS_k2hk-evm =3D "k2h k2k"
> +LIMSOCS_k2l-evm =3D "k2l"
> +LIMSOCS_k2e-evm =3D "k2e"
> +LIMSOCS_k2g-evm =3D "k2g"
>=20
> -__EOF__
> -}
> +export PDK_CSL_ROOT_PATH =3D"${WORKDIR}/build"
> +export DEST_ROOT=3D"${S}"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-
> bsp/common-csl-ip/common-csl-ip.inc
> index 70d963b..77dfd1b 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3D5857833e20836213677fac33f9aded21"
>=20
>  COMPATIBLE_MACHINE =3D "keystone|dra7xx"
>=20
> -PV =3D "3.3.0.2C"
> +PV =3D "3.3.0.3C"
>  INC_PR =3D "r0"
>=20
>  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL =3D"git"
>  CSL_GIT_BRANCH =3D "master"
>  CSL_GIT_DESTSUFFIX =3D "git"
>=20
> -# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02C
> -CSL_SRCREV =3D "dc8aac00e86cd434865d750666ac551f2e238263"
> +# Below commit ID corresponds to "DEV.CSL_PROCESSOR-
> SDK.03.03.00.03C"
> +CSL_SRCREV =3D "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
>=20
>  BRANCH=3D"${CSL_GIT_BRANCH}"
>  SRC_URI =3D
> "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BRANCH};destsu
> ffix=3D${CSL_GIT_DESTSUFFIX}"
> --
> 1.7.10.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

