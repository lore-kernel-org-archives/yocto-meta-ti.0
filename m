Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96F86E0074B; Tue, 28 Feb 2017 00:54:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 147C3E0050B
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2017 00:54:43 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1S8sh48013732
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2017 02:54:43 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1S8sgVr017870
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2017 02:54:42 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1S8scwt015605
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2017 14:24:40 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Tue, 28 Feb 2017 14:24:38 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [[ krogoth/morty PATCH] 1/1] ti-sgx-ddk-um: add
	support for GBM pixmap surface
Thread-Index: AQHSkQIMB5eavCw3SEyX27mmwmKCmqF8zYSAgAFQ3/A=
Date: Tue, 28 Feb 2017 08:54:37 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03E0D4D@DBDE04.ent.ti.com>
References: <1488204107-21688-1-git-send-email-anandb@ti.com>
	<20170227181817.GA11106@edge>
In-Reply-To: <20170227181817.GA11106@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.115]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [[ krogoth/morty PATCH] 1/1] ti-sgx-ddk-um: add support for GBM pixmap surface
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
X-List-Received-Date: Tue, 28 Feb 2017 08:54:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

ACK. Will take care of it for future patches.

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, February 27, 2017 11:48 PM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [[ krogoth/morty PATCH] 1/1] ti-sgx-ddk-um: add supp=
ort for GBM pixmap surface

Anand,

Thanks for the patch.

> [[ krogoth/morty PATCH] 1/1] ti-sgx-ddk-um: add support for GBM pixmap=20
> surface

Can you please not do nested brackets here? Patchwork doesn't handle them p=
roperly...

--
Denys


On Mon, Feb 27, 2017 at 07:31:47PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index f90d689..3a9a2b2 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  BRANCH =3D "ti-img-sgx/${PV}"
> =20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "e8fda0a1865e206c058776b15336a53edc5e5999"
> +SRCREV =3D "d184140aa5c17e13e1bf21151f1a7bc068bdf8bf"
> =20
>  # There's only hardfp version available
>  python __anonymous() {
> @@ -31,7 +31,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> =20
>  inherit update-rc.d
> =20
> -PR =3D "r22"
> +PR =3D "r23"
>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-d=
dk-um-linux"
> =20
>  DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

