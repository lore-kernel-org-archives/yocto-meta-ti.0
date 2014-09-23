Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85109E0084F; Tue, 23 Sep 2014 11:07:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53719E00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:07:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI7Nv6010227
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:07:23 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI7NHL018412
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:07:23 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 13:07:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [for master 5/6] omap5-sgx-ddk-um-linux: Updated
	SRCREV	to include bugfixes
Thread-Index: AQHP10gsGxKtF8RVy0WhJuuvHUnhV5wPA98Q
Date: Tue, 23 Sep 2014 18:07:22 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B941@DFLE08.ent.ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-6-git-send-email-a0393906@ti.com>
In-Reply-To: <1411488036-32089-6-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for master 5/6] omap5-sgx-ddk-um-linux: Updated SRCREV	to include bugfixes
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
X-List-Received-Date: Tue, 23 Sep 2014 18:07:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of R, Karthik
> Sent: Tuesday, September 23, 2014 11:01 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [for master 5/6] omap5-sgx-ddk-um-linux: Updated
> SRCREV to include bugfixes
>=20
> * This version is compatible with version Kernel 3.12
>=20
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> index b875328..37ea088 100644
> --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> @@ -4,9 +4,9 @@ LICENSE =3D "TI-TSPA"
>  LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
> Manifest.doc;md5=3D360d293df455e4f2d363bb4014a49603"
>=20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> linux.git;protocol=3Dgit"
> -SRCREV =3D "994922a5655c63b05343a9238cb30e6ef61744be"
> +SRCREV =3D "0af11b676900de5a3e5550728fe18acd88c29848"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
>=20
>  RREPLACES_${PN} =3D "libegl libgles1 libgles2"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

