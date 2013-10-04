Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C40EAE016B3
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 06:06:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94D6CFB007636;
	Fri, 4 Oct 2013 08:06:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94D6CI2022854;
	Fri, 4 Oct 2013 08:06:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 4 Oct 2013 08:06:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-kernel: update with more merges,
	get devtree files in to rootfs
Thread-Index: AQHOwMhyy4d+ca4s7UCvCWbfq2k3VpnkgDUg
Date: Fri, 4 Oct 2013 13:06:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C56AC82@DFLE08.ent.ti.com>
References: <1380867024-28771-1-git-send-email-denis@denix.org>
In-Reply-To: <1380867024-28771-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-kernel: update with more merges, get devtree files in to rootfs
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
X-List-Received-Date: Fri, 04 Oct 2013 13:06:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, October 04, 2013 1:10 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] linux-ti-kernel: update with more merges, get
> devtree files in to rootfs
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Set up the run-time dependency on the package with devicetree files to be
> installed in /boot directory of the rootfs. The new U-boot prefers to loa=
d them
> from /boot directory of the rootfs instead of the separate boot partition=
.
> While it's U-boot preference and specific to the version of U-boot, setti=
ng here
> dependency on kernel-devicetree should match existing on on kernel-image.
[Franklin] Wording on this sentence needs to be reworked a little bit.
> Also, there are some specific requirements for naming DTB files in /boot
> directory (like no extra prefixes), but that should be addressed separate=
ly.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 8267afa..80ebde8 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -8,6 +8,9 @@ inherit kernel
>  require recipes-kernel/linux/linux-dtb.inc
>  require recipes-kernel/linux/setup-defconfig.inc
>=20
> +# Pull in the devicetree files into the rootfs RDEPENDS_kernel-base +=3D
> +"kernel-devicetree"
> +
>  # Add a run-time dependency for the PM firmware to be installed  # on th=
e
> target file system.
>  RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3 am33x-cm3-initscript"
> @@ -28,11 +31,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.12.y"
>=20
> -SRCREV =3D "f7579525de9f1d6086c407a6980f4f1c1c574256"
> +SRCREV =3D "e34b95baedccea12af9c0e81be77ed0a18ddae82"
>  PV =3D "3.11+3.12-rc3"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

