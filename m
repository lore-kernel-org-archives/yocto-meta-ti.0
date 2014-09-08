Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BFFEE007A0; Mon,  8 Sep 2014 14:40:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2020DE0056A
	for <meta-ti@yoctoproject.org>; Mon,  8 Sep 2014 14:40:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88Ledxw017172;
	Mon, 8 Sep 2014 16:40:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LeduH007584;
	Mon, 8 Sep 2014 16:40:39 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 16:40:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] am33x-cm3: add voltage scaling binaries
Thread-Index: AQHPy6r3+TdMCS7nn0GdYM8hkDo4sJv3w7Nw
Date: Mon, 8 Sep 2014 21:40:38 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72C4FA@DFLE08.ent.ti.com>
References: <1410211303-28836-1-git-send-email-denis@denix.org>
In-Reply-To: <1410211303-28836-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] am33x-cm3: add voltage scaling binaries
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
X-List-Received-Date: Mon, 08 Sep 2014 21:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 08, 2014 4:22 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] am33x-cm3: add voltage scaling binaries
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-
> bsp/am33x-cm3/am33x-cm3_git.bb
> index 7731992..e5728ab 100644
> --- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> +++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> @@ -4,10 +4,10 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://License.txt;md5=3D7bdc54a749ab7a7dea999d25d99a41b8"
>=20
>  PV =3D "1.8.7"
> -PR =3D "r0"
> +PR =3D "r1"
>  PE =3D "1"
>=20
> -SRCREV =3D "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
> +SRCREV =3D "fffeab4236d4129ab046bb7081a8ac244134ad89"
>  BRANCH ?=3D "next"
>=20
>  SRC_URI =3D "git://git.ti.com/ti-cm3-pm-firmware/amx3-
> cm3.git;protocol=3Dgit;branch=3D${BRANCH}"
> @@ -23,6 +23,7 @@ do_compile() {
>  do_install() {
>  	install -d ${D}${base_libdir}/firmware
>  	install -m 0644 bin/am335x-pm-firmware.elf
> ${D}${base_libdir}/firmware/
> +	install -m 0644 bin/*-scale-data.bin ${D}${base_libdir}/firmware/
>  }
>=20
>  FILES_${PN} +=3D "${base_libdir}/firmware"
> --
> 2.0.4
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

