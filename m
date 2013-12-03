Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCB92E006BC
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2013 18:06:13 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB326BdA012143;
	Mon, 2 Dec 2013 20:06:11 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB326Bjp022349;
	Mon, 2 Dec 2013 20:06:11 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 2 Dec 2013 20:06:10 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libgles-omap3, omap3-sgx-modules: swap
	around DEFAULT_PREFERENCE setting
Thread-Index: AQHO76OpIw9P8aHymkCBzTm7O/XaJ5pBuSdw
Date: Tue, 3 Dec 2013 02:06:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5CB44E@DFLE08.ent.ti.com>
References: <1386018886-10029-1-git-send-email-denis@denix.org>
In-Reply-To: <1386018886-10029-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3, omap3-sgx-modules: swap around DEFAULT_PREFERENCE setting
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
X-List-Received-Date: Tue, 03 Dec 2013 02:06:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, December 02, 2013 3:15 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] libgles-omap3, omap3-sgx-modules: swap around
> DEFAULT_PREFERENCE setting
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> This way the default for am335x and am437x will be the new 5.00.00.01
> Graphics SDK release, that matches the default 3.12 kernel.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb | 2 --
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb     | 2 ++
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb     | 2 --
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb     | 2 --
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb     | 2 --
>  recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb            | 2 ++
>  recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb            | 2 --
>  recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb            | 2 --
>  recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb            | 2 --
>  recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb            | 2 --
>  10 files changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> x11_4.09.00.01.bb
> index 14f1860..f033eff 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
> @@ -13,8 +13,6 @@ inherit module
>  MACHINE_KERNEL_PR_append =3D "d"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  # Select the corresponding hardfp/softfp filename and checksums based on
> tune flags  BINFILE_SOFTFP =3D
> "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>  MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index 31c7d4e..bd476f0 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -13,6 +13,8 @@ inherit module
>  MACHINE_KERNEL_PR_append =3D "b"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> +DEFAULT_PREFERENCE_omap3 =3D "99"
> +
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/export=
s
> /Graphics_SDK_setuplinux_${SGXPV}.bin \
>            "
>  SRC_URI[md5sum] =3D "0e651eaa92bb91760f0b40a17697a7dc"
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
> index 4885946..e9f7190 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
> @@ -14,8 +14,6 @@ inherit module
>  MACHINE_KERNEL_PR_append =3D "a"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/export=
s
> /${BINFILE}"
>=20
>  SRC_URI[md5sum] =3D "dd0d994a48ecc4293f272a1fddddf159"
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
> index 793de14..d5737cd 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
> @@ -14,8 +14,6 @@ inherit module
>  MACHINE_KERNEL_PR_append =3D "a"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/export=
s
> /${BINFILE}"
>=20
>  SRC_URI[md5sum] =3D "0efa3a38266e6f41f8cc4fad0187f0d6"
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
> index 4a5def2..e18ce0c 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
> @@ -13,8 +13,6 @@ inherit module
>  MACHINE_KERNEL_PR_append =3D "a"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  BINFILE_HARDFP =3D
> "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
>  MD5SUM_HARDFP =3D "ae6125d7f8a313ea5c02afded893052d"
>  SHA256SUM_HARDFP =3D
> "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385
> e0"
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recip=
es-
> graphics/libgles/libgles-omap3_4.05.00.03.bb
> index 7795e2e..33836fb 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
> @@ -5,6 +5,8 @@ BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
>=20
>  require libgles-omap3.inc
>=20
> +DEFAULT_PREFERENCE_omap3 =3D "99"
> +
>  # download required binary distribution from:
>  # http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FD=
S.
> html
>  # see libgles-omap3.inc for detailed installation instructions diff --gi=
t a/recipes-
> graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes-graphics/libgles/l=
ibgles-
> omap3_4.08.00.01.bb
> index a24da0e..990b425 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
> @@ -2,8 +2,6 @@ require libgles-omap3.inc
>=20
>  LICENSE =3D "TSPA"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>  BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>  BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb b/recip=
es-
> graphics/libgles/libgles-omap3_4.08.00.02.bb
> index e57ba42..59ef358 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
> @@ -2,8 +2,6 @@ require libgles-omap3.inc
>=20
>  LICENSE =3D "TSPA"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>  BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>  BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recip=
es-
> graphics/libgles/libgles-omap3_4.09.00.01.bb
> index d094b5c..fec84fd 100644
> --- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
> @@ -4,8 +4,6 @@ LICENSE =3D "TSPA"
>=20
>  PR =3D "${INC_PR}.2"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
>  BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>  BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recip=
es-
> graphics/libgles/libgles-omap3_5.00.00.01.bb
> index 7af67eb..e48ec63 100644
> --- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
> +++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
> @@ -4,8 +4,6 @@ LICENSE =3D "TSPA"
>=20
>  PR =3D "${INC_PR}.1"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
>  BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
>  BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

