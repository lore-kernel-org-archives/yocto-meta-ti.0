Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4276E007DC; Tue, 29 Jul 2014 16:59:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55F92E003FA
	for <meta-ti@yoctoproject.org>; Tue, 29 Jul 2014 16:59:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6TNxdSu012535;
	Tue, 29 Jul 2014 18:59:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6TNxdZc008868;
	Tue, 29 Jul 2014 18:59:39 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 29 Jul 2014 18:59:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2] u-boot-ti-staging: add TI staging version
	of	u-boot 2014.07
Thread-Index: AQHPq4ht2A/fK3Rt7kav6TehZj3eS5u3uydQ
Date: Tue, 29 Jul 2014 23:59:38 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6EDB0F@DFLE08.ent.ti.com>
References: <1406678016-10376-1-git-send-email-denis@denix.org>
In-Reply-To: <1406678016-10376-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] u-boot-ti-staging: add TI staging version of	u-boot 2014.07
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
X-List-Received-Date: Tue, 29 Jul 2014 23:59:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, July 29, 2014 6:54 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH v2] u-boot-ti-staging: add TI staging version o=
f u-
> boot 2014.07
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Mainline version of 2014.07 will be pushed to mainline OE-Core soon.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - add DEPENDS on dtc-native
>=20
>  recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb | 21
> +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
>=20
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb b/recipes-bs=
p/u-
> boot/u-boot-ti-staging_2014.07.bb
> new file mode 100644
> index 0000000..d9c3787
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2014.07.bb
> @@ -0,0 +1,21 @@
> +require u-boot-ti.inc
> +
> +# u-boot needs devtree compiler to parse dts files DEPENDS +=3D
> +"dtc-native"
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

