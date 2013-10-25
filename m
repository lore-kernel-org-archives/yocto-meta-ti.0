Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59085E01773
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 11:38:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PIc77s010181
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 13:38:07 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PIc72s009292
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 13:38:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 25 Oct 2013 13:38:06 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: Update for AM437x GP EVM DTB
Thread-Index: AQHO0aP+WfeIW0tRV061UVemVnj3NpoFv05w
Date: Fri, 25 Oct 2013 18:38:05 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5879EE@DFLE08.ent.ti.com>
References: <1382723702-16472-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1382723702-16472-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: Update for AM437x GP EVM DTB
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
X-List-Received-Date: Fri, 25 Oct 2013 18:38:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Friday, October 25, 2013 12:55 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] linux-ti-staging: Update for AM437x GP EVM DTB
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/include/ti43x.inc               |    2 +-
>  recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.=
inc
> index dc3baf6..12f569e 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -16,7 +16,7 @@ XSERVER =3D "xserver-xorg \  GUI_MACHINE_CLASS =3D
> "bigscreen"
>=20
>  # Increase this everytime you change something in the kernel -
> MACHINE_KERNEL_PR =3D "r0"
> +MACHINE_KERNEL_PR =3D "r1"
>=20
>  # Default providers, may need to override for specific machines
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 57628df..ec86506 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -18,7 +18,7 @@ RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3
> am33x-cm3-initscript"
>  # Default is to package all dtb files for ti33x devices unless building =
 # for the
> specific beaglebone machine.
>  KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-
> bone.dtb am335x-boneblack.dtb"
> -KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb"
> +KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
>  KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

