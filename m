Return-Path: <anandb@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAF0AE013B0
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:43:27 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61DhPwW023663
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:43:26 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61DhMNp001984
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:43:24 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 21:43:22 +0800
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHOdl95BJFUhL/0ZUOFIMbdWirZcplP1T0g
Date: Mon, 1 Jul 2013 13:43:21 +0000
Message-ID: <05CF4794C98B244ABDC620C1090376223EA6DE38@DBDE04.ent.ti.com>
References: <20130701123155.GA16127@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E828F48@DLEE08.ent.ti.com>
	<51D184C8.5070500@ti.com>
In-Reply-To: <51D184C8.5070500@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Mon, 01 Jul 2013 13:43:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

There is no Graphics SDK for OMAP5 as of today. For the current release, on=
ly the DDK UM binaries will be provided as a tarball.

Regards,
Anand

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Heroor, Siddharth
Sent: Monday, July 01, 2013 7:02 PM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace librar=
ies for graphics acceleration

On 7/1/2013 6:57 PM, Dmytriyenko, Denys wrote:
> Any chance to unify on a recipe name?

Not sure I follow, but do you mean between the OMAP3 Graphics SDK and the O=
MAP5 libgles DDK?

>=20
>=20
> Denys
>=20
>=20
> -----Original Message-----
> *From:* Hingolikar, Mrinmayee [mrinmayee@ti.com]
> *Received:* Monday, 01 Jul 2013, 8:32
> *To:* meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> *Subject:* [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace=20
> libraries for graphics acceleration
>=20
> * These libraries are not distributable in source and hence
>   are available only as binary. They implement OpenGLES 1.x and
>   OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
>   class of devices.
>=20
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24
> ++++++++++++++++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)  create mode 100644=20
> recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>=20
> diff --git=20
> a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> new file mode 100644
> index 0000000..d3a847d
> --- /dev/null
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "Userspace libraries for sgx"
> +HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> +LICENSE =3D "TI"
> +DEPENDS =3D ""
> +
> +SRC_URI =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/=
OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-${PV}.tar.gz;protocol=3Dht=
tp"
> +
> +LIC_FILES_CHKSUM =3D
> "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=3Dd280df8e94bb2e7b92=
51c8526078eeb8"
> +
> +PR =3D "r1"
> +
> +SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +PACKAGES =3D+ "${PN}-${PV}"
> +
> +FILES_${PN} =3D  "${bindir}/*"
> +FILES_${PN} +=3D " ${libdir}/*"
> +FILES_${PN} +=3D  "${includedir}/*"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

