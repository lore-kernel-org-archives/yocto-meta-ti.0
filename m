Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B905EE01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 13:10:08 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IKA7Qr011958;
	Mon, 18 Mar 2013 15:10:07 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IKA7LU022628;
	Mon, 18 Mar 2013 15:10:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 18 Mar 2013 15:10:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2 2/3] ti33x: switch default preference to
	ti-staging tree
Thread-Index: AQHOJArR4giNk+xqqk2YgXe4ZWboJpir4QCg
Date: Mon, 18 Mar 2013 20:10:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159482306@DLEE11.ent.ti.com>
References: <1363633146-22749-1-git-send-email-denis@denix.org>
In-Reply-To: <1363633146-22749-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2 2/3] ti33x: switch default preference to	ti-staging tree
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
X-List-Received-Date: Mon, 18 Mar 2013 20:10:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 18, 2013 1:59 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCHv2 2/3] ti33x: switch default preference
> to ti-staging tree
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> SDKs or other users of meta-ti can still use one of the older 3.2
> recipes for
> stability or featureset, by setting PREFERRED_PROVIDER in distro
> or local config.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - make unified change in SOC include file
>=20
>  conf/machine/am335x-evm.conf   | 2 --
>  conf/machine/beaglebone.conf   | 2 --
>  conf/machine/include/ti33x.inc | 2 +-
>  3 files changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-
> evm.conf
> index 91f7e54..21e79a2 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/am335x-evm.conf
> @@ -13,8 +13,6 @@ IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
>  SERIAL_CONSOLE =3D "115200 ttyO0"
>=20
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti33x-psp"
> -
>  # UBI information.  Note that this is board and kernel specific.
> Changes
>  # in your kernel port may require changes in these variables.
> For more
>  # details about this board please see
> diff --git a/conf/machine/beaglebone.conf
> b/conf/machine/beaglebone.conf
> index f4112f5..8a83a1a 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -7,8 +7,6 @@ require conf/machine/include/ti33x.inc
>  # Only has DVI connector for external screen
>  GUI_MACHINE_CLASS =3D "bigscreen"
>=20
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti33x-psp"
> -
>  IMAGE_FSTYPES +=3D "tar.gz"
>=20
>  SERIAL_CONSOLE =3D "115200 ttyO0"
> diff --git a/conf/machine/include/ti33x.inc
> b/conf/machine/include/ti33x.inc
> index f00c797..62afe16 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -19,7 +19,7 @@ GUI_MACHINE_CLASS =3D "bigscreen"
>  MACHINE_KERNEL_PR =3D "r18"
>=20
>  # Default providers, may need to override for specific machines
> -PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti33x-psp"
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-staging"
>  PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>=20
>  KERNEL_IMAGETYPE =3D "uImage"
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

