Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BD56E009A5; Tue,  7 Feb 2017 21:18:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E1D4E008D0
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2017 21:18:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v185Il9r009401
	for <meta-ti@yoctoproject.org>; Tue, 7 Feb 2017 23:18:47 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v185IknG025006
	for <meta-ti@yoctoproject.org>; Tue, 7 Feb 2017 23:18:46 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v185IhJ3013764
	for <meta-ti@yoctoproject.org>; Wed, 8 Feb 2017 10:48:44 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0294.000; Wed, 8 Feb 2017 10:48:43 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [for-morty 1/1] ti-sgx-ddk-km: move to K4.9, enable
	parallel builds
Thread-Index: AQHSgU3TWZ6Pp/DZsk6WDTSFLfJ2A6Fdcs8AgAEgF2A=
Date: Wed, 8 Feb 2017 05:18:42 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03BCD1C@DBDE04.ent.ti.com>
References: <1486477433-191487-1-git-send-email-anandb@ti.com>
	<20170207173709.GP25590@edge>
In-Reply-To: <20170207173709.GP25590@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.115]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for-morty 1/1] ti-sgx-ddk-km: move to K4.9, enable parallel builds
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
X-List-Received-Date: Wed, 08 Feb 2017 05:18:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

I have posted a v2 of the patch after rebasing.

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, February 7, 2017 11:07 PM
To: Balagopalakrishnan, Anand
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [for-morty 1/1] ti-sgx-ddk-km: move to K4.9, enable =
parallel builds

Anand,

Could you please rebase on top of this:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=3Dmorty&id=3D16=
f6a2713d0e6ef4dcdbb7769b89979bdf751c11

--=20
Denys


On Tue, Feb 07, 2017 at 07:53:53PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/=
recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> index ca5916e..984cab9 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> @@ -7,7 +7,7 @@ inherit module
> =20
>  COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
> =20
> -MACHINE_KERNEL_PR_append =3D "k"
> +MACHINE_KERNEL_PR_append =3D "l"
>  PR =3D "${MACHINE_KERNEL_PR}"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -20,19 +20,17 @@ RPROVIDES_${PN} =3D "omapdrm-pvr"
>  RREPLACES_${PN} =3D "omapdrm-pvr"
>  RCONFLICTS_${PN} =3D "omapdrm-pvr"
> =20
> -BRANCH =3D "ti-img-sgx/${PV}/k4.4"
> +BRANCH =3D "ti-img-sgx/${PV}/k4.9"
> =20
>  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=
=3Dgit;branch=3D${BRANCH}"
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "8d5305b03dce13f3a9a89328c69c762dcd3109a4"
> +SRCREV =3D "0086977380d3320d70a3abc78b95fa0641427073"
> =20
>  TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
>  TARGET_PRODUCT_ti33x =3D "ti335x"
>  TARGET_PRODUCT_ti43x =3D "ti437x"
> =20
> -PARALLEL_MAKE =3D ""
> -
>  EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" TARGET_PRODUCT=3D=
${TARGET_PRODUCT}'
> =20
>  do_compile_prepend() {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

