Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E2EEE016E2
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 06:47:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ODlbMP015346
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 08:47:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ODlbnr026042
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 08:47:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Thu, 24 Oct 2013 08:47:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv4] libgles: Added prebuilt userspace
	libraries for graphics acceleration
Thread-Index: AQHO0HyQnCy+LiK79Eu68m0ggUPRtpoD3ifg
Date: Thu, 24 Oct 2013 13:47:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597D7160@DLEE11.ent.ti.com>
References: <20131024054708.GA8184@ti.com>
In-Reply-To: <20131024054708.GA8184@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv4] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Thu, 24 Oct 2013 13:47:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Thursday, October 24, 2013 12:47 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv4] libgles: Added prebuilt userspace
>libraries for graphics acceleration
>
> These libraries are not distributable in source and hence
> are available only as binary. They implement OpenGLES 1.x and
> OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
> class of devices.
>
>v2:
>
>Addressed Chases's comments:
> * Updated the PR
> * Added shasum for the tarball
> * Removed redundant FILES section
>
>v3:
> * Replaced shasum by sha256sum
>
>v4:
> * Corrected license information to "TSPA"
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20
>++++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>
>diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.10.bb
>new file mode 100644
>index 0000000..5e21bd5
>--- /dev/null
>+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
>@@ -0,0 +1,20 @@
>+DESCRIPTION =3D "Userspace libraries for sgx"
>+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>+LICENSE =3D "TSPA"
>+
>+SRC_URI =3D
>"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
>gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=3Dhttp"
>+
>+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>Manifest.doc;md5=3Dd280df8e94bb2e7b9251c8526078eeb8"
>+
>+PR =3D "r0"
>+
>+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
>+SRC_URI[sha256sum] =3D
>"20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
>+
>+S =3D "${WORKDIR}/${PN}-${PV}"
>+
>+do_install () {
>+    oe_runmake install DESTDIR=3D${D}
>+}
>+
>+FILES_${PN} +=3D "${libdir}/gbm/"
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

