Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D705E00496
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:18:38 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BKIbW4032144
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:18:37 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BKIb7Y013002
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:18:37 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 11 Mar 2013 15:18:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot recipe
Thread-Index: AQHOHpV1VP10eDCmx0q8NbGSRyNIAJig7d1A
Date: Mon, 11 Mar 2013 20:18:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159454A48@DLEE12.ent.ti.com>
References: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot recipe
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
X-List-Received-Date: Mon, 11 Mar 2013 20:18:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, March 11, 2013 3:17 PM
> To: meta-ti@yoctoproject.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/3] u-boot-ti-staging: Add TI staging U-Boot
> recipe
>=20

Denys,

I know you are working on something here too.  I just wanted to give you an=
 idea of what I was using for comparison.

> * Pull the TI staging U-Boot tree for use with ti33x devices and
>   the omap-a15 devices.
> * Used the PN u-boot-ti-staging to make it easy to set a
>   PREFERRED_PROVIDER in the machine configuration to point to
>   this recipe instead of the default u-boot recipe since TI
> devices
>   should point to the TI staging trees by default.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ...> u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} |   12
> ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
>  copy recipes-bsp/u-boot/{u-boot_2011.09-psp04.06.00.08.bb =3D> u-
> boot-ti-staging_2013.01.01-ti2013.2Q.00.bb} (61%)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-ti2013.2Q.00.bb
> similarity index 61%
> copy from recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> copy to recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-
> ti2013.2Q.00.bb
> index 1bd4b9e..67e1988 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01-
> ti2013.2Q.00.bb
> @@ -1,11 +1,11 @@
>  # Use the version of u-boot.inc in oe-core not the meta-ti
> version
>  require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>=20
> -DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
> +DESCRIPTION =3D "u-boot bootloader for TI devices"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
>=20
> -COMPATIBLE_MACHINE =3D "ti33x|omap3"
> +COMPATIBLE_MACHINE =3D "ti33x|omap3|omap-a15"
>=20
>  DEFAULT_PREFERENCE =3D "-1"
>=20
> @@ -13,13 +13,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  PR =3D "r0+gitr${SRCPV}"
>=20
> -SRC_URI =3D "git://arago-project.org/git/projects/u-boot-
> am33x.git;protocol=3Dgit;branch=3D${BRANCH}"
> +SRC_URI =3D "git://gitorious.ti.com/ti-u-boot/ti-u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> -BRANCH =3D "AM335XPSP_04.06.00.08"
> +BRANCH =3D "ti-u-boot-2013.01.01"
>=20
>  # Lock to the commit corresponding to TAG:
> -# v2011.09_AM335xPSP_04.06.00.08
> -SRCREV =3D "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> +# TBD
> +SRCREV =3D "c44c35e24b1532272118c58c57f658f21b72a4dd"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 1.7.0.4


