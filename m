Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6A24E007E6; Mon,  4 Aug 2014 06:56:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86C45E0079E
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 06:56:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74DuDW3004290;
	Mon, 4 Aug 2014 08:56:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74DuD3i024248;
	Mon, 4 Aug 2014 08:56:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Mon, 4 Aug 2014 08:56:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] linux-ti-staging 3.12: update to latest
	3.12.26
Thread-Index: AQHPr2RGJstTiBkAi0atF4rYT62/75vAeOlQ
Date: Mon, 4 Aug 2014 13:56:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F1BD1@DFLE08.ent.ti.com>
References: <1407028266-10077-1-git-send-email-denis@denix.org>
In-Reply-To: <1407028266-10077-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux-ti-staging 3.12: update to latest	3.12.26
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
X-List-Received-Date: Mon, 04 Aug 2014 13:56:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Saturday, August 02, 2014 8:11 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2] linux-ti-staging 3.12: update to latest 3.=
12.26
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.12.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-
> kernel/linux/linux-ti-staging_3.12.bb
> index e288a6d..427bd97 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
> @@ -39,8 +39,8 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.12.y"
>=20
> -SRCREV =3D "ffe21d87399ec09620878613a9ebfbc6c1d7c548"
> -PV =3D "3.12.20"
> +SRCREV =3D "5c62fd05f12d008a136d5620d12a76d50429af3c"
> +PV =3D "3.12.26"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild  MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> --
> 2.0.2
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

