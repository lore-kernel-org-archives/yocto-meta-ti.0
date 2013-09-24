Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8618EE0152F
	for <meta-ti@yoctoproject.org>; Mon, 23 Sep 2013 20:36:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O3amn3008966;
	Mon, 23 Sep 2013 22:36:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O3amYg010462;
	Mon, 23 Sep 2013 22:36:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 23 Sep 2013 22:36:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-ti] [PATCH 4/4] ti33x, ti43x, omap-a15: switch
	KERNEL_IMAGETYPE to zImage by default
Thread-Index: AQHOuM213RcAyZqKrUOSsIsh27dC5pnUPPwO
Date: Tue, 24 Sep 2013 03:36:47 +0000
Message-ID: <78C276BE-E2AF-46CF-9931-4247D6182123@ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>,
	<1379989631-8098-4-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Rini,
	Tom" <trini@ti.com>
Subject: Re: [PATCH 4/4] ti33x, ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Tue, 24 Sep 2013 03:36:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What is the benefit of this switch?

Although outdated a lot of posts talking about uImage vs zImage seems to fa=
vor uImage due to additional functionality that it provides.

> On Sep 23, 2013, at 9:28 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * To be used with latest u-boot, that prefers zImage over uImage
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Tom Rini <trini@ti.com>
> ---
> conf/machine/include/omap-a15.inc | 2 +-
> conf/machine/include/ti33x.inc    | 2 +-
> conf/machine/include/ti43x.inc    | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/oma=
p-a15.inc
> index 623f2df..aba122a 100644
> --- a/conf/machine/include/omap-a15.inc
> +++ b/conf/machine/include/omap-a15.inc
> @@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging=
"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>=20
> -KERNEL_IMAGETYPE =3D "uImage"
> +KERNEL_IMAGETYPE =3D "zImage"
>=20
> UBOOT_ARCH =3D "arm"
> UBOOT_ENTRYPOINT =3D "0x80008000"
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.=
inc
> index 12b80c6..7f02042 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging=
"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>=20
> -KERNEL_IMAGETYPE =3D "uImage"
> +KERNEL_IMAGETYPE =3D "zImage"
>=20
> UBOOT_ARCH =3D "arm"
> UBOOT_MACHINE =3D "am335x_evm_config"
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.=
inc
> index 62da105..adb66e3 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging=
"
> PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
> PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
>=20
> -KERNEL_IMAGETYPE =3D "uImage"
> +KERNEL_IMAGETYPE =3D "zImage"
>=20
> UBOOT_ARCH =3D "arm"
> UBOOT_MACHINE =3D "am43xx_evm_config"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

