Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EA7AE010C0; Fri, 13 Jul 2018 12:14:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61B13E0080A
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:14:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJEZoq015896
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531509276;
	bh=hIa6Bb/rvjAqAKzTngk4OBL31Fgcc/KpHWgprQbs9qQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=NMkB3U4ABzemehLzJE4N5R/SPIBgK/QAYEhOL7ugpMZ0BfHclm1PyvYtjeuaHKqm7
	P42/ougI8yWLdO1AsIGU6fPZWXphMXXZaK92xh21Qgyfds+GuoroEPB7TJCMjzxXGv
	aOqjNoQTrFkuEDQ+XqfVbOGtMG+vwCfyDoZaW8B4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJEZp0003441
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:14:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:14:35 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 14:14:35 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v3 2/3] ti-sgx-ddk-um: add k3 (AM654x) support
Thread-Index: AQHUGt2CYXZcTOaDEUqrOpF+gCC/86SNhaQA
Date: Fri, 13 Jul 2018 19:14:35 +0000
Message-ID: <68ba386c3ff54d9aba95856443b1c898@ti.com>
References: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
	<1531509016-6395-3-git-send-email-e-ruei1@ti.com>
	<20180713191216.GL25410@beryl>
In-Reply-To: <20180713191216.GL25410@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 2/3] ti-sgx-ddk-um: add k3 (AM654x) support
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
X-List-Received-Date: Fri, 13 Jul 2018 19:14:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it finally.
V4 is coming.

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, July 13, 2018 3:12 PM
To: Ruei, Eric
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v3 2/3] ti-sgx-ddk-um: add k3 (AM654x) suppor=
t

On Fri, Jul 13, 2018 at 03:10:15PM -0400, Eric Ruei wrote:
> - add COMPATIBLE_MACHINE to distinguish AM3/4/5 with K3 (AM654x)
> - add k3 support based on SGX DDK 1.17
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb      |  1 +
>  ...ddk-um_1.14.3699939.bb =3D> ti-sgx-ddk-um_1.17.4948957.bb} | 13 +++++=
--------
>  2 files changed, 6 insertions(+), 8 deletions(-)
>  copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb =3D> ti-sgx=
-ddk-um_1.17.4948957.bb} (87%)
>=20
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index d17411e..ef33d3a 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-u=
m-linux"
>  LICENSE =3D "TI-TSPA"
>  LIC_FILES_CHKSUM =3D "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3D550702a031857e0426ef7d6f6cf2d9f4"
> =20
> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  BRANCH =3D "ti-img-sgx/rocko/${PV}"
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> similarity index 87%
> copy from recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> copy to recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index d17411e..8ac772d 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -1,14 +1,16 @@
>  DESCRIPTION =3D "Userspace libraries for PowerVR SGX chipset on TI SoCs"
>  HOMEPAGE =3D "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>  LICENSE =3D "TI-TSPA"
> -LIC_FILES_CHKSUM =3D "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3D550702a031857e0426ef7d6f6cf2d9f4"
> +LIC_FILES_CHKSUM =3D "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3Db17390502bc89535c86cfbbae961a2a8"
> +
> +COMPATIBLE_MACHINE =3D "k3"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  BRANCH =3D "ti-img-sgx/rocko/${PV}"
> =20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "358fe42d34a7570896e5d1639869da564ddd0484"
> +SRCREV =3D "a564d20ec1b6aed55b3e60aa9ff35f3809eca110"
> =20
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -17,14 +19,9 @@ python __anonymous() {
>          return
>      pkgn =3D d.getVar("PN")
>      pkgv =3D d.getVar("PV")
> -    if "callconvention-hard" not in tunes:
> -        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv)=
)
> -        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for =
now" % (pkgn, pkgv))

Please remove the anonymous function entirely - it's useless now.


>  }
> =20
> -TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
> -TARGET_PRODUCT_ti33x =3D "ti335x"
> -TARGET_PRODUCT_ti43x =3D "ti437x"
> +TARGET_PRODUCT_k3 =3D "ti654x"
> =20
>  INITSCRIPT_NAME =3D "rc.pvr"
>  INITSCRIPT_PARAMS =3D "defaults 8"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

