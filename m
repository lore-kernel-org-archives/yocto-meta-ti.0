Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4E24E00283
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 07:27:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA7FRDAC002803;
	Thu, 7 Nov 2013 09:27:13 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA7FRDOb032205;
	Thu, 7 Nov 2013 09:27:13 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 7 Nov 2013 09:27:13 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Khem Raj <raj.khem@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] omap3-sgx-modules: Enable is only for
	relevant	machines
Thread-Index: AQHO23VepOzMMeWZx0+yO505AlG1S5oZ401g
Date: Thu, 7 Nov 2013 15:27:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5981BF@DFLE08.ent.ti.com>
References: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] omap3-sgx-modules: Enable is only for relevant	machines
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
X-List-Received-Date: Thu, 07 Nov 2013 15:27:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Should we mimic these changes to the other versions of this recipe? Althoug=
h, DEFAULT_PREFERENCE is set to -1 for all the other recipes it will make s=
ure we avoid this issue again in the future.


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Khem Raj
> Sent: Wednesday, November 06, 2013 10:53 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] omap3-sgx-modules: Enable is only for relevant
> machines
>=20
> When layers is parsed in multi-bsp layer distros and a non-omap/non-arm
> machine is used this causes parse failures
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> index 31c7d4e..79b73cb 100644
> --- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> +++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> @@ -10,6 +10,13 @@ BINFILE :=3D "Graphics_SDK_setuplinux_${SGXPV}.bin"
>=20
>  inherit module
>=20
> +COMPATIBLE_HOST_omap3 =3D ".*"
> +COMPATIBLE_HOST_omap4 =3D ".*"
> +COMPATIBLE_HOST_ti814x =3D ".*"
> +COMPATIBLE_HOST_ti816x =3D ".*"
> +COMPATIBLE_HOST_ti33x =3D ".*"
> +COMPATIBLE_HOST ?=3D "(none)"
> +
>  MACHINE_KERNEL_PR_append =3D "b"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

