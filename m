Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78A48E015FD
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 14:19:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KLJYH1003539;
	Fri, 20 Sep 2013 16:19:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KLJYo8010550;
	Fri, 20 Sep 2013 16:19:34 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 20 Sep 2013 16:19:34 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with
	platform-base and PMIC merged
Thread-Index: AQHOtkPwgaVMUFeAJUONItYoVSdF75nPIVRQ
Date: Fri, 20 Sep 2013 21:19:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>
References: <1379710561-16000-1-git-send-email-denis@denix.org>
In-Reply-To: <1379710561-16000-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Murphy, Dan" <dmurphy@ti.com>
Subject: Re: [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Fri, 20 Sep 2013 21:19:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 20, 2013 3:56 PM
> To: meta-ti@yoctoproject.org
> Cc: Murphy, Dan
> Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with platfo=
rm-base
> and PMIC merged
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Dan Murphy <DMurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 7d84cc4..694a164 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -31,11 +31,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.12.y"
>=20
> -SRCREV =3D "b36f4be3de1b123d8601de062e7dbfc904f305fb"
> -PV =3D "3.10+3.11-rc6"
> +SRCREV =3D "351da8b4c2ff277b2d816a2108ada357a63fadbe"
> +PV =3D "3.11+3.12-rc1"
[Franklin] What does the 3.11+ mean?
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

