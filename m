Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C42CE014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 12:15:43 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SJFf0H011546;
	Thu, 28 Mar 2013 14:15:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SJFfds011741;
	Thu, 28 Mar 2013 14:15:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 28 Mar 2013 14:15:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCHv2] linux-ti-staging: rename to have version in name,
	update to latest
Thread-Index: AQHOK+iBH+OFKnoBm0yKV2upWAvS+pi7eWaA
Date: Thu, 28 Mar 2013 19:15:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594AD577@DLEE11.ent.ti.com>
References: <1364498075-1118-1-git-send-email-denis@denix.org>
In-Reply-To: <1364498075-1118-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2] linux-ti-staging: rename to have version in name, update to latest
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
X-List-Received-Date: Thu, 28 Mar 2013 19:15:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, March 28, 2013 2:15 PM
> To: meta-ti@yoctoproject.org
> Cc: Dmytriyenko, Denys; Maupin, Chase
> Subject: [PATCHv2] linux-ti-staging: rename to have version in
> name, update to latest
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Update to the latest kernel sources.  This also requires
> changing
>   the dtb file names since the omap5 devices have changed to use
>   uevm instead of panda and sevm instead of evm.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> v2 - merge Chase's changes to dtb files
>=20
>  .../linux/{linux-ti-staging_git.bb =3D> linux-ti-staging_3.8.bb}
> | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-kernel/linux/{linux-ti-staging_git.bb =3D> linux-
> ti-staging_3.8.bb} (91%)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> similarity index 91%
> rename from recipes-kernel/linux/linux-ti-staging_git.bb
> rename to recipes-kernel/linux/linux-ti-staging_3.8.bb
> index 081a0e6..3353792 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -32,7 +32,7 @@ DEPENDS_ti33x +=3D "am33x-cm3"
>  # for the specific beaglebone machine.
>  KERNEL_DEVICETREE_ti33x =3D "arch/arm/boot/dts/am335x-evm.dts
> arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-
> bone.dts"
>  KERNEL_DEVICETREE_beaglebone =3D "arch/arm/boot/dts/am335x-
> bone.dts"
> -KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-evm.dts
> arch/arm/boot/dts/omap5-panda.dts"
> +KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
> arch/arm/boot/dts/omap5-uevm.dts"
>=20
>  COMPATIBLE_MACHINE =3D "ti33x|omap-a15"
>=20
> @@ -40,11 +40,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.8.y"
>=20
> -SRCREV =3D "a91f8e121dbe0b5fb84000d9ae14fac8880c44a7"
> +SRCREV =3D "a0a13c3cf6ff2ca9bf1b1c9163ba04c3c71811bd"
>  PV =3D "3.8.4"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.8.1.5


