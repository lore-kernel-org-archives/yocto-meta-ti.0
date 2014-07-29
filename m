Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F33FBE007B5; Tue, 29 Jul 2014 16:35:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AAF5E003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 16:35:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6TNZVGD004552;
	Tue, 29 Jul 2014 18:35:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6TNZVcD025950;
	Tue, 29 Jul 2014 18:35:31 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 29 Jul 2014 18:35:31 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] u-boot-ti-staging: add TI staging version of
	u-boot 2014.07
Thread-Index: AQHPq34H/MtTpksCp0SUTf0PJJIn3pu3tF7w
Date: Tue, 29 Jul 2014 23:35:30 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6EDABC@DFLE08.ent.ti.com>
References: <1406673559-12578-1-git-send-email-denis@denix.org>
In-Reply-To: <1406673559-12578-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot-ti-staging: add TI staging version of	u-boot 2014.07
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
X-List-Received-Date: Tue, 29 Jul 2014 23:35:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Do we need the DEPENDS +=3D "dtc-native" that was added to the mainline 201=
4.07 u-boot recipe?

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, July 29, 2014 5:39 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] u-boot-ti-staging: add TI staging version of u=
-boot
> 2014.07
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Mainline version of 2014.07 will be pushed to mainline OE-Core soon.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
>=20
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bs=
p/u-
> boot/u-boot-ti-staging_2014.07.bb
> new file mode 100644
> index 0000000..3baab66
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> @@ -0,0 +1,18 @@
> +require u-boot-ti.inc
> +
> +DESCRIPTION =3D "u-boot bootloader for TI devices"
> +
> +LIC_FILES_CHKSUM =3D
> "file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
> +
> +PV =3D "2014.07"
> +PR =3D "r0+gitr${SRCPV}"
> +
> +SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
> boot.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +BRANCH ?=3D "ti-u-boot-2014.07"
> +
> +# Corresponds to tag ti2014.07
> +SRCREV =3D "053adddee4c97315059e08d4b3f5ebd264ed295f"
> +
> +SPL_BINARY =3D "MLO"
> +SPL_UART_BINARY =3D "u-boot-spl.bin"
> --
> 2.0.2
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

