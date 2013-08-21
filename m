Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39D33E00747
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 04:48:12 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LBmA0c017771
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 06:48:11 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LBm7Sq032170
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 06:48:09 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Wed, 21 Aug 2013 19:48:07 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOd9y4IikHeESs8Em2xraap0+6U5mf2NIg
Date: Wed, 21 Aug 2013 11:48:07 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
References: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>
In-Reply-To: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Wed, 21 Aug 2013 11:48:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping for comments!

> -----Original Message-----
> From: Hingolikar, Mrinmayee
> Sent: Wednesday, July 03, 2013 4:32 PM
> To: meta-ti@yoctoproject.org
> Cc: Hingolikar, Mrinmayee; Heroor, Siddharth
> Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
>=20
> * The OMAP5 Audio Backend requires a 'firmware' to enable
>   sound. This recipe installs a prebuilt firmware. This
>   part is a hack, as in the current form, the firmware
>   cannot be cross-compiled. There is a plan to fix this
>   and hopefully, this recipe is short-lived. Once the code
>   is fixed, we should have new recipes that build the firmware
>   and clean up this recipe.
>=20
> v2:
> * Merged contents from abefw.inc and removed abefw.inc based
>   on review.
>=20
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644
> recipes-bsp/abefw/abefw_1.0.14.bb
>=20
> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
> bsp/abefw/abefw_1.0.14.bb
> new file mode 100644
> index 0000000..8db71e4
> --- /dev/null
> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Firmware for OMAP5 ABE"
> +HOMEPAGE =3D "http://git.ti.com"
> +LICENSE =3D "BSD/GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec5"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "omap5-evm"
> +
> +SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
> +
> +do_install() {
> +        mkdir -p ${D}/lib/firmware
> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
> +
> +FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
> --
> 1.7.0.4


