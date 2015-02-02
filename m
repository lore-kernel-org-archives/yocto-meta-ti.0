Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51B22E008CC; Mon,  2 Feb 2015 14:34:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE568E008A6
	for <meta-ti@yoctoproject.org>; Mon,  2 Feb 2015 14:34:21 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t12MYIbu000996;
	Mon, 2 Feb 2015 16:34:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t12MYHF4017140;
	Mon, 2 Feb 2015 16:34:17 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 2 Feb 2015 16:34:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] u-boot-ti-staging: update with am57x/x15
	and	config fixes
Thread-Index: AQHQPzEwW5EhpqbLmUukrwduu+99XJzd8mog
Date: Mon, 2 Feb 2015 22:34:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F4553@DFLE08.ent.ti.com>
References: <1422913308-8965-1-git-send-email-denis@denix.org>
	<1422913308-8965-2-git-send-email-denis@denix.org>
In-Reply-To: <1422913308-8965-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] u-boot-ti-staging: update with am57x/x15 and	config fixes
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
> Subject: [meta-ti] [PATCH 2/2] u-boot-ti-staging: update with am57x/x15
> and config fixes
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-
> bsp/u-boot/u-boot-ti-staging_2014.07.bb
> index 2845750..dd9326a 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> @@ -8,13 +8,13 @@ DESCRIPTION =3D "u-boot bootloader for TI devices"
>  LIC_FILES_CHKSUM =3D
> "file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
>=20
>  PV =3D "2014.07"
> -PR =3D "r6+gitr${SRCPV}"
> +PR =3D "r7+gitr${SRCPV}"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
>  BRANCH ?=3D "ti-u-boot-2014.07"
>=20
> -SRCREV =3D "705aec706adf37b63fd4b09660c638150e606fdb"
> +SRCREV =3D "7e537bfdd261bf8bf444f3ac4d1be3db4ee124e8"
>=20
>  SPL_BINARY =3D "MLO"
>  SPL_UART_BINARY =3D "u-boot-spl.bin"
> --
> 2.2.0
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

