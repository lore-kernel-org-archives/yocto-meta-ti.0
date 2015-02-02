Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C609AE008E5; Mon,  2 Feb 2015 14:34:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C023E0086F
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 14:34:27 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12MYPc8030542;
	Mon, 2 Feb 2015 16:34:25 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12MYOfi017237;
	Mon, 2 Feb 2015 16:34:24 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 2 Feb 2015 16:34:23 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] linux-ti-staging: update to 3.14.31,
	plus latest feature merges
Thread-Index: AQHQPzE6Yqdvnjsur0m5AUbrLOxzvpzd8ndw
Date: Mon, 2 Feb 2015 22:34:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F455A@DFLE08.ent.ti.com>
References: <1422913308-8965-1-git-send-email-denis@denix.org>
In-Reply-To: <1422913308-8965-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] linux-ti-staging: update to 3.14.31, plus latest feature merges
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
X-List-Received-Date: Mon, 02 Feb 2015 22:34:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, February 02, 2015 3:42 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH 1/2] linux-ti-staging: update to 3.14.31, plus =
latest
> feature merges
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_3.14.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> index c8cbc93..48219d5 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -45,8 +45,8 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.14.y"
>=20
> -SRCREV =3D "91c355090bd822468527b5c05ec15c1944a17c64"
> -PV =3D "3.14.29"
> +SRCREV =3D "476152084592bce5316990f7e0008052c0b70aad"
> +PV =3D "3.14.31"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild  MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> --
> 2.2.0
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

