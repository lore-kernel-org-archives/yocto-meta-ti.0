Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A40AE00804; Mon,  4 Aug 2014 06:56:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E419E007F6
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 06:56:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74DuSbt014677;
	Mon, 4 Aug 2014 08:56:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74DuSrF021428;
	Mon, 4 Aug 2014 08:56:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 4 Aug 2014 08:56:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] linux-ti-staging 3.14: update to latest
	3.14.15 plus connectivity changes
Thread-Index: AQHPr2RsM29mpDTqL0m3jSOSPDb0WZvAePlA
Date: Mon, 4 Aug 2014 13:56:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F1BDF@DFLE08.ent.ti.com>
References: <1407028266-10077-1-git-send-email-denis@denix.org>
	<1407028266-10077-2-git-send-email-denis@denix.org>
In-Reply-To: <1407028266-10077-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] linux-ti-staging 3.14: update to latest 3.14.15 plus connectivity changes
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
X-List-Received-Date: Mon, 04 Aug 2014 13:56:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Saturday, August 02, 2014 8:11 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 2/2] linux-ti-staging 3.14: update to latest 3.=
14.15
> plus connectivity changes
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.14.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> index c223c88..7abaeac 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -43,11 +43,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.14.y"
>=20
> -SRCREV =3D "b0fa4f08d72c8723219b5174b5749151b5acaee0"
> -PV =3D "3.14.14"
> +SRCREV =3D "aa595e6598fc5a722ee653881334d0d8a16477bc"
> +PV =3D "3.14.15"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
> --
> 2.0.2
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

