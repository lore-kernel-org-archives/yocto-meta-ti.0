Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A73C8E004F5; Wed,  3 Sep 2014 09:18:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 445CFE0049D
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 09:18:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83GIO1N007509;
	Wed, 3 Sep 2014 11:18:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83GINlZ013436;
	Wed, 3 Sep 2014 11:18:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 11:18:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: update to the latest rev
	and	add wlan config
Thread-Index: AQHPx5Hp7bThD5RA8Uen+W/V+iowxJvvljOw
Date: Wed, 3 Sep 2014 16:18:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7271D7@DFLE08.ent.ti.com>
References: <1409760694-25824-1-git-send-email-denis@denix.org>
In-Reply-To: <1409760694-25824-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: update to the latest rev and	add wlan config
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
X-List-Received-Date: Wed, 03 Sep 2014 16:18:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, September 03, 2014 11:12 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] linux-ti-staging: update to the latest rev and=
 add
> wlan config
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
> index 46c3ded..2a458b7 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> @@ -44,17 +44,17 @@ S =3D "${WORKDIR}/git"
>=20
>  BRANCH =3D "ti-linux-3.14.y"
>=20
> -SRCREV =3D "367e55fbd8b6a7fb853f44a4f854eaadbbfd68c2"
> +SRCREV =3D "0627fb95826dbcaac164f051d7d0a694e59d709a"
>  PV =3D "3.14.17"
>=20
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> rebuild -MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>  PR =3D "${MACHINE_KERNEL_PR}"
>=20
>  KERNEL_CONFIG_DIR =3D "${S}/ti_config_fragments"
>  KERNEL_CONFIG_FRAGMENTS =3D
> "${KERNEL_CONFIG_DIR}/audio_display.cfg
> ${KERNEL_CONFIG_DIR}/baseport.cfg \
>                             ${KERNEL_CONFIG_DIR}/connectivity.cfg
> ${KERNEL_CONFIG_DIR}/ipc.cfg \
> -                           ${KERNEL_CONFIG_DIR}/power.cfg"
> +                           ${KERNEL_CONFIG_DIR}/power.cfg
> ${KERNEL_CONFIG_DIR}/wlan.cfg"
>=20
>  KERNEL_CONFIG_FRAGMENTS_append_ti33x =3D " ${WORKDIR}/non-
> smp.cfg"
>  KERNEL_CONFIG_FRAGMENTS_append_ti43x =3D " ${WORKDIR}/non-
> smp.cfg"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

