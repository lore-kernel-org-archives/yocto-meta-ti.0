Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11F66E00293
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 10:37:09 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AHb7uh023391;
	Wed, 10 Oct 2012 12:37:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AHb706022981;
	Wed, 10 Oct 2012 12:37:07 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 12:37:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>
Thread-Topic: [meta-ti] Franklin S. Cooper Jr :
	u-boot_2011.09-psp04.06.00.08:	Add PSP v04.06.00. 08 of u-boot
Thread-Index: AQHNpw2VDviiFBf9kEe7LM863wBN95eyzaGq
Date: Wed, 10 Oct 2012 17:37:07 +0000
Message-ID: <C3F40184-D594-41BB-944B-AC62FF7EEDC8@ti.com>
References: <20121010173454.99D2D52980@arago-project.org>
In-Reply-To: <20121010173454.99D2D52980@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Franklin S. Cooper Jr : u-boot_2011.09-psp04.06.00.08:	Add PSP v04.06.00. 08 of u-boot
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
X-List-Received-Date: Wed, 10 Oct 2012 17:37:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please pull into Denzil=20

On Oct 10, 2012, at 12:35 PM, "Arago Project git" <git@arago-project.org> w=
rote:

> Module: meta-ti
> Branch: master
> Commit: 80ebdb06c319c5fa9881923e4a158eb048487b66
> URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D80ebdb06c=
319c5fa9881923e4a158eb048487b66
>=20
> Author: Franklin S. Cooper Jr <fcooper@ti.com>
> Date:   Fri Oct  5 00:07:28 2012 -0500
>=20
> u-boot_2011.09-psp04.06.00.08: Add PSP v04.06.00.08 of u-boot
>=20
> * Add the PSP release version 04.06.00.08 of u-boot.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
> .../u-boot/u-boot_2011.09-psp04.06.00.08.bb        |   29 +++++++++++++++=
+++++
> 1 files changed, 29 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb b/recipe=
s-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> new file mode 100644
> index 0000000..1bd4b9e
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb
> @@ -0,0 +1,29 @@
> +# Use the version of u-boot.inc in oe-core not the meta-ti version
> +require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +
> +DESCRIPTION =3D "u-boot bootloader for ARM MPU devices"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb"
> +
> +COMPATIBLE_MACHINE =3D "ti33x|omap3"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +PR =3D "r0+gitr${SRCPV}"
> +
> +SRC_URI =3D "git://arago-project.org/git/projects/u-boot-am33x.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> +
> +BRANCH =3D "AM335XPSP_04.06.00.08"
> +
> +# Lock to the commit corresponding to TAG:
> +# v2011.09_AM335xPSP_04.06.00.08
> +SRCREV =3D "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
> +
> +S =3D "${WORKDIR}/git"
> +
> +UBOOT_SUFFIX =3D "img"
> +
> +# Set the name of the SPL that will built so that it is also packaged wi=
th u-boot.
> +SPL_BINARY =3D "MLO"
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

