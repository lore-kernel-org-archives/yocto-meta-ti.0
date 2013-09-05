Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07701E0154F
	for <meta-ti@yoctoproject.org>; Wed,  4 Sep 2013 22:14:56 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r855EsVP018511
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2013 00:14:55 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r855Eqom011638
	for <meta-ti@yoctoproject.org>; Thu, 5 Sep 2013 00:14:53 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 5 Sep 2013 13:14:52 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCHv3] libgles: Added prebuilt userspace libraries for
	graphics acceleration
Thread-Index: AQHOnmPlaQN+5orR/kKK6WzlP0oCpJm2sNcw
Date: Thu, 5 Sep 2013 05:14:52 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5451C2A@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCHv3] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Thu, 05 Sep 2013 05:14:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


* These libraries are not distributable in source and hence
  are available only as binary. They implement OpenGLES 1.x and
  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
  class of devices.

v2:

Addressed Chases's comments:
* Updated the PR
* Added shasum for the tarball
* Removed redundant FILES section

v3:
*Replaced shasum by sha256sum

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.1=
0.bb

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/=
recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..15d5be0
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Userspace libraries for sgx"
+HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE =3D "TI"
+
+SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcont=
ent/gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-${PV}.tar.gz;pr=
otocol=3Dhttp"
+
+LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=
=3Dd280df8e94bb2e7b9251c8526078eeb8"
+
+PR =3D "r0"=20
+
+SRC_URI[md5sum] =3D "3cfb875de031098a4c1eeeaf4e442367"
+SRC_URI[sha256sum] =3D "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c7=
62fbc72f22489a"
+
+S =3D "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=3D${D}
+}
+
+FILES_${PN} +=3D " ${libdir}/gbm/"
--=20
1.7.9.5


