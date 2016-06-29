Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4E8BE00C56; Wed, 29 Jun 2016 08:02:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64306E008A4
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:02:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TF1LUl019265
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 10:01:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TF2TtO031904
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 10:02:30 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Wed, 29 Jun 2016 10:02:30 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [master/krogoth][PATCH v2] common-csl-ip: Bump
	version common-csl-ip-rtos: Move to new makefile support provided in
	ti-pdk.bbclass
Thread-Index: AQHR0g4QNO0mIZ6pzkeGHB6UrYR/g6AAifcQ
Date: Wed, 29 Jun 2016 15:02:29 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AF92D00@DFLE12.ent.ti.com>
References: <1467134594-1359-1-git-send-email-jsobota@ti.com>
	<20160629135640.GC24597@edge>
In-Reply-To: <20160629135640.GC24597@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/krogoth][PATCH v2] common-csl-ip: Bump version common-csl-ip-rtos: Move to new makefile support provided in ti-pdk.bbclass
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
X-List-Received-Date: Wed, 29 Jun 2016 15:02:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,=20

There was a CSL version change 3.3.0.3B to 3.3.0.3C which spurred the patch=
.  I'll submit a v3 patch reducing the subject length.

Justin

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, June 29, 2016 9:57 AM
To: Sobota, Justin
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [master/krogoth][PATCH v2] common-csl-ip: Bump versi=
on common-csl-ip-rtos: Move to new makefile support provided in ti-pdk.bbcl=
ass

Was this a v2 patch? What were the changes since v1? The subject line is st=
ill wrong.


On Tue, Jun 28, 2016 at 01:23:14PM -0400, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  .../common-csl-ip/common-csl-ip-rtos_git.bb        |   28 +++++++++-----=
------
>  recipes-bsp/common-csl-ip/common-csl-ip.inc        |    6 ++---
>  2 files changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipe=
s-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 43ea2ed..877b230 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -1,5 +1,5 @@
>  require common-csl-ip.inc
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> @@ -7,20 +7,16 @@ inherit ti-pdk
> =20
>  DEPENDS_remove =3D "${PN}"
> =20
> -XDCARGS_ti33x =3D "am335x"
> -XDCARGS_ti43x =3D "am437x"
> -XDCARGS_omap-a15 =3D "am571x am572x"
> -XDCARGS_k2hk-evm =3D "k2h k2k"
> -XDCARGS_k2l-evm =3D "k2l"
> -XDCARGS_k2e-evm =3D "k2e"
> -XDCARGS_k2g-evm =3D "k2g"
> +# Build with make instead of XDC
> +XDCMAKE =3D "0"
> =20
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
> =20
> -__EOF__
> -}
> +export PDK_CSL_ROOT_PATH =3D"${WORKDIR}/build"
> +export DEST_ROOT=3D"${S}"
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/co=
mmon-csl-ip/common-csl-ip.inc
> index 70d963b..77dfd1b 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D5857833e20=
836213677fac33f9aded21"
> =20
>  COMPATIBLE_MACHINE =3D "keystone|dra7xx"
> =20
> -PV =3D "3.3.0.2C"
> +PV =3D "3.3.0.3C"
>  INC_PR =3D "r0"
> =20
>  CSL_GIT_URI =3D "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL =3D"git"
>  CSL_GIT_BRANCH =3D "master"
>  CSL_GIT_DESTSUFFIX =3D "git"
> =20
> -# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02C
> -CSL_SRCREV =3D "dc8aac00e86cd434865d750666ac551f2e238263"
> +# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03C"
> +CSL_SRCREV =3D "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
> =20
>  BRANCH=3D"${CSL_GIT_BRANCH}"
>  SRC_URI =3D "${CSL_GIT_URI};protocol=3D${CSL_GIT_PROTOCOL};branch=3D${BR=
ANCH};destsuffix=3D${CSL_GIT_DESTSUFFIX}"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

