Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B84DBE015E1
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 05:46:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OCksGf015213;
	Tue, 24 Sep 2013 07:46:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OCksOa021100;
	Tue, 24 Sep 2013 07:46:54 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 07:46:54 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE
	from recipes, let machine config set it
Thread-Index: AQHOuM29vOGDmgXwS0mi8rOrIj4k4pnU1T9A
Date: Tue, 24 Sep 2013 12:46:54 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55C1D9@DFLE08.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it
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
X-List-Received-Date: Tue, 24 Sep 2013 12:46:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since the uImage -> zImage change is being pushed by U-boot I am assuming t=
his has more to do with the newer U-boot versions. Since a lot of these ker=
nels will not work on a newer u-boot I wouldn't make this change on any <3.=
8 kernel recipes.

I don't understand the reason for this switch so I could be wrong.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 23, 2013 9:27 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from
> recipes, let machine config set it
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-am335x-psp_3.2.bb      | 2 --
>  recipes-kernel/linux/linux-davinci_git.bb         | 1 -
>  recipes-kernel/linux/linux-mainline_3.2.bb        | 1 -
>  recipes-kernel/linux/linux-omap-psp_2.6.32.bb     | 1 -
>  recipes-kernel/linux/linux-omap_2.6.37.bb         | 1 -
>  recipes-kernel/linux/linux-omap_2.6.39.bb         | 1 -
>  recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 -
>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb        | 1 -
>  recipes-kernel/linux/linux-ti-staging_3.8.bb      | 1 -
>  recipes-kernel/linux/linux-ti-staging_git.bb      | 1 -
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb       | 1 -
>  recipes-kernel/linux/linux_3.0.bb                 | 1 -
>  recipes-kernel/linux/linux_3.1.bb                 | 1 -
>  recipes-kernel/linux/linux_3.3.7.bb               | 2 --
>  14 files changed, 16 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-
> kernel/linux/linux-am335x-psp_3.2.bb
> index eaf788f..b5783eb 100644
> --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> @@ -12,8 +12,6 @@ require setup-defconfig.inc  # Stage the power
> management firmware before building the kernel  DEPENDS +=3D "am33x-cm3"
>=20
> -KERNEL_IMAGETYPE =3D "uImage"
> -
>  # The main PR is now using MACHINE_KERNEL_PR, for ti33x see
> conf/machine/include/ti33x.inc  MACHINE_KERNEL_PR_append =3D
> "h+gitr${SRCPV}"
>=20
> diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/l=
inux/linux-
> davinci_git.bb
> index e4b85d6..03eeb46 100644
> --- a/recipes-kernel/linux/linux-davinci_git.bb
> +++ b/recipes-kernel/linux/linux-davinci_git.bb
> @@ -1,7 +1,6 @@
>  require multi-kernel.inc
>=20
>  DESCRIPTION =3D "Linux kernel for DaVinci processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "hawkboard"
>=20
> diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-
> kernel/linux/linux-mainline_3.2.bb
> index 7eafdfa..7b4a2a2 100644
> --- a/recipes-kernel/linux/linux-mainline_3.2.bb
> +++ b/recipes-kernel/linux/linux-mainline_3.2.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>=20
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-
> kernel/linux/linux-omap-psp_2.6.32.bb
> index 61fc24f..9f7c472 100644
> --- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> +++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> @@ -3,7 +3,6 @@ require multi-kernel.inc  MULTI_CONFIG_BASE_SUFFIX =3D ""
>=20
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "am3517-crane|beagleboard|omap3evm|am3517-
> evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
>=20
> diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-
> kernel/linux/linux-omap_2.6.37.bb
> index 62076fb..0a14cc8 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
> @@ -1,7 +1,6 @@
>  require multi-kernel.inc
>=20
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "(beagleboard|overo|omap3evm|omap3-
> touchbook)"
>=20
> diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-
> kernel/linux/linux-omap_2.6.39.bb
> index ae90ad2..430fa09 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.39.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>=20
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-
> kernel/linux/linux-omapl138-psp_2.6.37.bb
> index e4a5451..a138fb6 100644
> --- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
> @@ -1,7 +1,6 @@
>  SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for OMAPL1 machines from PSP, based on lin=
ux-
> davinci kernel"
>  LICENSE =3D "GPLv2"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  require multi-kernel.inc
>  require tipspkernel.inc
> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
> kernel/linux/linux-ti-glsdk_3.8.bb
> index 5fd17f8..09204a6 100644
> --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices supported by the GLSDK prod=
uct"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  inherit kernel
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-
> kernel/linux/linux-ti-staging_3.8.bb
> index fd7b671..f0659f2 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  inherit kernel
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 694a164..d3d11d2 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  inherit kernel
>=20
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-
> kernel/linux/linux-ti33x-psp_3.2.bb
> index 4200d03..a9f7ac2 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -1,7 +1,6 @@
>  SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI33x EVM from PSP, based on am335x-
> kernel"
>  LICENSE =3D "GPLv2"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  require multi-kernel.inc
>  require tipspkernel.inc
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/lin=
ux_3.0.bb
> index 522a87d..3aae2ca 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>=20
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/lin=
ux_3.1.bb
> index d6ed98c..110d26c 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -3,7 +3,6 @@ require linux.inc
>  COMPATIBLE_MACHINE =3D "beagleboard"
>=20
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>=20
>  DEFAULT_PREFERENCE =3D "-99"
>=20
> diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-
> kernel/linux/linux_3.3.7.bb
> index e38b6c2..aca5c53 100644
> --- a/recipes-kernel/linux/linux_3.3.7.bb
> +++ b/recipes-kernel/linux/linux_3.3.7.bb
> @@ -11,8 +11,6 @@ COMPATIBLE_MACHINE =3D "beagleboard"
>  inherit kernel
>  require setup-defconfig.inc
>=20
> -KERNEL_IMAGETYPE =3D "uImage"
> -
>  # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see  #
> conf/machine/include/omap3.inc  MACHINE_KERNEL_PR_append =3D
> "b+gitr${SRCREV}"
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

