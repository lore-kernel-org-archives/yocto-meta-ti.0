Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB0B3E009BB; Thu, 20 Oct 2016 08:27:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4313BE007DA
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 08:27:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9KFRICN012209
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:27:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9KFRIR8004084
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:27:18 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 20 Oct 2016 10:27:18 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [master/krogoth][PATCH 3/5] ti-cgt6x: Upgrade to version 8.1.1
Thread-Index: AQHSJLGYYvV/eGKjjk6A3HGkMJLe86Cxg3AQ
Date: Thu, 20 Oct 2016 15:27:18 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AFE700F@DFLE12.ent.ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
	<1476294829-27885-3-git-send-email-jsobota@ti.com>
In-Reply-To: <1476294829-27885-3-git-send-email-jsobota@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/krogoth][PATCH 3/5] ti-cgt6x: Upgrade to version 8.1.1
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
X-List-Received-Date: Thu, 20 Oct 2016 15:27:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

An issue was found after upgrading to this component.  This patch should no=
t be applied.

Justin

-----Original Message-----
From: Sobota, Justin=20
Sent: Wednesday, October 12, 2016 1:54 PM
To: meta-ti@yoctoproject.org
Cc: Sobota, Justin
Subject: [master/krogoth][PATCH 3/5] ti-cgt6x: Upgrade to version 8.1.1

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/devtools/{ti-cgt6x_8.1.0.bb =3D> ti-cgt6x_8.1.1.bb} |   10 ++++=
+-----
 1 file changed, 5 insertions(+), 5 deletions(-)  rename recipes-ti/devtool=
s/{ti-cgt6x_8.1.0.bb =3D> ti-cgt6x_8.1.1.bb} (90%)

diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti=
-cgt6x_8.1.1.bb
similarity index 90%
rename from recipes-ti/devtools/ti-cgt6x_8.1.0.bb
rename to recipes-ti/devtools/ti-cgt6x_8.1.1.bb
index 79b562a..bc40762 100644
--- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
+++ b/recipes-ti/devtools/ti-cgt6x_8.1.1.bb
@@ -5,7 +5,7 @@ LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) &=
 BSD-3-Clause & BSL-1.0  LIC_FILES_CHKSUM =3D "file://ti-cgt-c6000_${PV}/C6=
000_8.1.x_CodeGenerationTools_Manifest.htm;md5=3D458bf5fa55a865372515aeba0d=
fa9b72"
 LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-c6x/C6000_8=
.1.x_CodeGenerationTools_Manifest.htm;md5=3D458bf5fa55a865372515aeba0dfa9b7=
2"
=20
-PE =3D "1"
+PE =3D "0"
=20
 require recipes-ti/includes/ti-unpack.inc
=20
@@ -37,11 +37,11 @@ BINFILE_NAME_class-target =3D "cgt6x_arm_installer"
=20
 SRC_URI =3D "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${P=
V}/${BINFILE};name=3D${BINFILE_NAME}"
=20
-SRC_URI[cgt6x_x86_installer.md5sum] =3D "43d9a9a6307c7ba0933050e4ba1b0e56"
-SRC_URI[cgt6x_x86_installer.sha256sum] =3D "0ce82e2d338b8aab3c3d1eb52217d0=
25bd07952ac40c8f5a9319652d0c8882ad"
+SRC_URI[cgt6x_x86_installer.md5sum] =3D "ef39176c85615eba27c5334cc18e9065"
+SRC_URI[cgt6x_x86_installer.sha256sum] =3D "28dc93aaf4f29b86c212492d8e414d=
f4dd2a7d0b48053b5c557d681aa9ae21b6"
=20
-SRC_URI[cgt6x_arm_installer.md5sum] =3D "52433a9ffdc6fbbb539a3c8e3e1c9ec0"
-SRC_URI[cgt6x_arm_installer.sha256sum] =3D "286a96e3082086c37129cbbc6c3665=
c76028b68975d02fc30375a6aaba00532a"
+SRC_URI[cgt6x_arm_installer.md5sum] =3D "536f15652c4222d67c17fc6caa7ae807"
+SRC_URI[cgt6x_arm_installer.sha256sum] =3D "dd33743b61daeef0a22ede2086af7e=
60d0ea9f45c1b667caf2d1ae8d260a099a"
=20
 do_install() {
     install -d ${D}${bindir}
--
1.7.10.4


