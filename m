Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A92FE0147E
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 04:35:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JBZgLs017772;
	Tue, 19 Mar 2013 06:35:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JBZg9K006057;
	Tue, 19 Mar 2013 06:35:42 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.1.323.3;
	Tue, 19 Mar 2013 06:35:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Tue, 19 Mar 2013 06:35:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 08/19] u-boot-beagleboard: modify beagleboard
	specific version to use new namespace feature
Thread-Index: AQHOJDERwKk28TPUUE6kr9DosGLObpis4saQ
Date: Tue, 19 Mar 2013 11:35:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159484547@DLEE11.ent.ti.com>
References: <1363649547-4693-1-git-send-email-denis@denix.org>
	<1363649547-4693-9-git-send-email-denis@denix.org>
In-Reply-To: <1363649547-4693-9-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 08/19] u-boot-beagleboard: modify beagleboard specific version to use new namespace feature
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
X-List-Received-Date: Tue, 19 Mar 2013 11:35:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 18, 2013 6:32 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 08/19] u-boot-beagleboard: modify
> beagleboard specific version to use new namespace feature
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../{u-boot_2011.09.bb =3D> u-boot-beagleboard_2011.09.bb}      |
> 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>  rename recipes-bsp/u-boot/{u-boot_2011.09.bb =3D> u-boot-
> beagleboard_2011.09.bb} (89%)

I'm wondering if this whole recipe couldn't go and be replaced with the u-b=
oot-ti-staging recipe.

>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-
> bsp/u-boot/u-boot-beagleboard_2011.09.bb
> similarity index 89%
> rename from recipes-bsp/u-boot/u-boot_2011.09.bb
> rename to recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
> index edacb6c..519df16 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb
> @@ -1,11 +1,8 @@
> -require u-boot.inc
> +require u-boot-ti.inc
>=20
>  PR =3D "r7"
>=20
> -# SPL build
> -UBOOT_BINARY =3D "u-boot.img"
> -UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> -UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
> +SPL_BINARY =3D "MLO"
>=20
>  # No patches for other machines yet
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
> @@ -37,7 +34,3 @@ SRC_URI =3D "git://git.denx.de/u-
> boot.git;protocol=3Dgit \
>            "
>=20
>  SRCREV =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
> -
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
> -
> -S =3D "${WORKDIR}/git"
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

