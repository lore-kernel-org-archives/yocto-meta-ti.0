Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DECA5E013B0
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:45:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Djfl8026824
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:45:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61DjfRo009432
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:45:41 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Jul 2013 08:45:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 08:45:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHOdlb+VN38vg+9cUKmslMBsIDRiZlP1M2g
Date: Mon, 1 Jul 2013 13:45:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962B52B@DLEE11.ent.ti.com>
References: <20130701123155.GA16127@ti.com>
In-Reply-To: <20130701123155.GA16127@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 01 Jul 2013 13:45:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Monday, July 01, 2013 7:32 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
>libraries for graphics acceleration
>
>* These libraries are not distributable in source and hence
>  are available only as binary. They implement OpenGLES 1.x and
>  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
>  class of devices.
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24
>++++++++++++++++++++
> 1 files changed, 24 insertions(+), 0 deletions(-)
> create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>
>diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>new file mode 100644
>index 0000000..d3a847d
>--- /dev/null
>+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>@@ -0,0 +1,24 @@
>+DESCRIPTION =3D "Userspace libraries for sgx"
>+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>+LICENSE =3D "TI"
>+DEPENDS =3D ""

Why do you want to blank out the default DEPENDS?

>+
>+SRC_URI =3D
>"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
>gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-
>${PV}.tar.gz;protocol=3Dhttp"
>+
>+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"

Is the manifest truly your license file as well?

>+
>+PR =3D "r1"

Why not start at r0?

>+
>+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"

Don't you need a sha256sum too?

>+
>+S =3D "${WORKDIR}/${PN}-${PV}"
>+
>+do_install () {
>+    oe_runmake install DESTDIR=3D${D}
>+}
>+
>+PACKAGES =3D+ "${PN}-${PV}"

Why do you want to make a version specific package?  Why not just leave the=
 default PN?  You also don't define any files to be part of that package.

>+
>+FILES_${PN} =3D  "${bindir}/*"
>+FILES_${PN} +=3D " ${libdir}/*"
>+FILES_${PN} +=3D  "${includedir}/*"

Shouldn't many of these directories already be in the base FILES set?  Why =
re-set them?

>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

