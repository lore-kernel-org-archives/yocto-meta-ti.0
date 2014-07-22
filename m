Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8303E006ED; Tue, 22 Jul 2014 07:54:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B99DDE00558
	for <meta-ti@yoctoproject.org>; Tue, 22 Jul 2014 07:54:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MEsdmv012954;
	Tue, 22 Jul 2014 09:54:39 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MEsdbD028059;
	Tue, 22 Jul 2014 09:54:39 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 22 Jul 2014 09:54:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
Thread-Index: AQHPpTu78DJiWU/dUkSW+eib0Zhp1pusLmLg
Date: Tue, 22 Jul 2014 14:54:38 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E78E6@DFLE08.ent.ti.com>
References: <1405985363-21671-1-git-send-email-denis@denix.org>
In-Reply-To: <1405985363-21671-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot: update to 2014.07 release version
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
X-List-Received-Date: Tue, 22 Jul 2014 14:54:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, July 21, 2014 6:29 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] u-boot: update to 2014.07 release version
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot_2014.07.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-
> boot_2014.07.bb
> index 9da6f7d..593c445 100644
> --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> @@ -13,15 +13,14 @@ LIC_FILES_CHKSUM =3D
> "file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
>=20
>  # This is still an RC so set the PV accordingly to allow proper version =
 #
> ordering when the RC is dropped.
[Franklin] This comment can also be deleted.
> -PV =3D "2014.04+2014.07-rc3"
> -PR =3D "r0"
[Franklin] If you're going to create a v2 anyway then it would be nice to l=
eave the PR=20
> +PV =3D "2014.07"
>=20
>  SRC_URI =3D "git://git.denx.de/u-boot.git;protocol=3Dgit;branch=3D${BRAN=
CH}"
>=20
>  BRANCH ?=3D "master"
>=20
> -# Corresponds to tag v2014.07-rc3
> -SRCREV =3D "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> +# Corresponds to tag v2014.07
> +SRCREV =3D "524123a70761110c5cf3ccc5f52f6d4da071b959"
>=20
>  SPL_BINARY =3D "MLO"
>  SPL_UART_BINARY =3D "u-boot-spl.bin"
> --
> 2.0.2
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

