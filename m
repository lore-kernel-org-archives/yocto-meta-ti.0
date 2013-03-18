Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11703E01410
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:43:54 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IIhrB6009442;
	Mon, 18 Mar 2013 13:43:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IIhr42023572;
	Mon, 18 Mar 2013 13:43:53 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 18 Mar 2013 13:43:53 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/3] linux-ti-staging: update to the latest
	merge	of 3.8.3
Thread-Index: AQHOJAhAmGG0Ace0K0uy8os1koeiKZiryLww
Date: Mon, 18 Mar 2013 18:43:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159481C2B@DLEE11.ent.ti.com>
References: <1363632040-22025-1-git-send-email-denis@denix.org>
In-Reply-To: <1363632040-22025-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] linux-ti-staging: update to the latest merge	of 3.8.3
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
X-List-Received-Date: Mon, 18 Mar 2013 18:43:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 18, 2013 1:41 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/3] linux-ti-staging: update to the
> latest merge of 3.8.3

Acked-by: Chase Maupin <chase.maupin@ti.com>

Although, we may still need to do version specific (non _git) versions of t=
he recipes when there is an official release.

>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> b/recipes-kernel/linux/linux-ti-staging_git.bb
> index dfef76d..605fbc1 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -39,11 +39,11 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.8.y"
>=20
> -SRCREV =3D "e69f39916783a559c499e264359edea315ef44fd"
> -PV =3D "3.8.2"
> +SRCREV =3D "ed93a28fb0b1dc28cc252ee87f6fce3e07bf23fe"
> +PV =3D "3.8.3"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
> cause a rebuild
> -MACHINE_KERNEL_PR_append =3D "d+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://gitorious.ti.com/ti-linux-kernel/ti-linux-
> kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>             file://defconfig \
> --
> 1.8.1.5
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

