Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AD7FE015E3
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 05:51:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OCpSBp006302;
	Tue, 24 Sep 2013 07:51:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OCpSiH027099;
	Tue, 24 Sep 2013 07:51:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 07:51:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/4] linux-ti-staging: make 3.12-rc the
	default for supported platforms, drop omap5-sevm.dtb
Thread-Index: AQHOuM299q7H5yUsd0uumeoPtizdW5nU19sA
Date: Tue, 24 Sep 2013 12:51:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55C22D@DFLE08.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-3-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-3-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] linux-ti-staging: make 3.12-rc the default for supported platforms, drop omap5-sevm.dtb
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
X-List-Received-Date: Tue, 24 Sep 2013 12:51:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 23, 2013 9:27 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 3/4] linux-ti-staging: make 3.12-rc the default=
 for
> supported platforms, drop omap5-sevm.dtb
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * DTB for OMAP5 sEVM was removed upstream, drop it from the recipe
> * Don't mask the default preference to be picked up normally by supported
> machines
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index d3d11d2..e903215 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -17,15 +17,13 @@ RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-
> cm3-initscript"
>  KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-
> bone.dtb"
>  KERNEL_DEVICETREE_am437x-evm =3D "am43x-epos-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb"
> -KERNEL_DEVICETREE_omap5-evm =3D "omap5-sevm.dtb omap5-uevm.dtb"
> +KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
>  KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>=20
>  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>=20
>  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
>=20
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.12.y"
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

