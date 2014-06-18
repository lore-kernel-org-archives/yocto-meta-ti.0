Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C987DE0073D; Wed, 18 Jun 2014 12:28:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D402E003DA
	for <meta-ti@yoctoproject.org>; Wed, 18 Jun 2014 12:28:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5IJSETh026908;
	Wed, 18 Jun 2014 14:28:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5IJSDug021894;
	Wed, 18 Jun 2014 14:28:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 18 Jun 2014 14:28:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arago Project git <git@arago-project.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Maupin,	Chase : u-boot: Add mainline u-boot version
	2014.07-rc3
Thread-Index: AQHPibPd4aSkiK7QAEOynIWYPKMkgZt3QmQg
Date: Wed, 18 Jun 2014 19:28:13 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D3DE3@DFLE08.ent.ti.com>
References: <20140616223845.9FDB052A66@arago-project.org>
In-Reply-To: <20140616223845.9FDB052A66@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Maupin, Chase : u-boot: Add mainline u-boot version 2014.07-rc3
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
X-List-Received-Date: Wed, 18 Jun 2014 19:28:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can we pull this into dora also?

I know meta-arago is currently migrating to daisy but in the mean time with=
out this patch in dora it is causing errors.=20
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Arago Project git
> Sent: Monday, June 16, 2014 5:39 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Maupin, Chase : u-boot: Add mainline u-boot version
> 2014.07-rc3
>=20
> Module: meta-ti
> Branch: daisy
> Commit: ca565599c2e5906bbe5325ee2e204e2344ecef72
> URL:    http://arago-project.org/git/meta-
> ti.git?a=3Dcommit;h=3Dca565599c2e5906bbe5325ee2e204e2344ecef72
>=20
> Author: Maupin, Chase <chase.maupin@ti.com>
> Date:   Sat Jun 14 03:55:54 2014 +0000
>=20
> u-boot: Add mainline u-boot version 2014.07-rc3
>=20
> * The latest mainline u-boot works well for most TI devices and
>   we want to enable more people to use and test it.  Adding
>   version 2014.07-rc3 will allow more people to build and use this
>   u-boot version
> * Add a dependency on dtc-native since the latest mainline of u-boot
>   now requires this and not every build host will have the right
>   version.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  recipes-bsp/u-boot/u-boot_2014.07.bb |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-
> boot_2014.07.bb
> new file mode 100644
> index 0000000..b326aa1
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> @@ -0,0 +1,27 @@
> +require u-boot-ti.inc
> +
> +# DEPEND on dtc-native for mainline u-boot because the mainline u-boot
> +depends # on some of the latest syntax constructs for an appended in
> +dtb used for # items like secure boot/image signing.
> +DEPENDS +=3D "dtc-native"
> +
> +DESCRIPTION =3D "Mainline u-boot bootloader"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +LIC_FILES_CHKSUM =3D
> "file://Licenses/README;md5=3D025bf9f768cbcb1a165dbe1a110babfb"
> +
> +# This is still an RC so set the PV accordingly to allow proper version
> +# ordering when the RC is dropped.
> +PV =3D "2014.04+2014.07-rc3"
> +PR =3D "r0"
> +
> +SRC_URI =3D "git://git.denx.de/u-boot.git;protocol=3Dgit;branch=3D${BRAN=
CH}"
> +
> +BRANCH ?=3D "master"
> +
> +# Corresponds to tag v2014.07-rc3
> +SRCREV =3D "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> +
> +SPL_BINARY =3D "MLO"
> +SPL_UART_BINARY =3D "u-boot-spl.bin"
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

