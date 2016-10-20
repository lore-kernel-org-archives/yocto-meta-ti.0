Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFB30E007DA; Thu, 20 Oct 2016 08:27:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BCC6E0034A
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 08:27:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9KFR0R1012173
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:27:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9KFR0DY007129
	for <meta-ti@yoctoproject.org>; Thu, 20 Oct 2016 10:27:00 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 20 Oct 2016 10:27:00 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [master/krogoth][PATCH 4/5] ti-ccsv6-native: Upgrade to
	version 6.2.0.00050
Thread-Index: AQHSJLGYo4fIDS8jW0yuuh2ktaqDvaCxg1rw
Date: Thu, 20 Oct 2016 15:26:59 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE13AFE6FFE@DFLE12.ent.ti.com>
References: <1476294829-27885-1-git-send-email-jsobota@ti.com>
	<1476294829-27885-4-git-send-email-jsobota@ti.com>
In-Reply-To: <1476294829-27885-4-git-send-email-jsobota@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/krogoth][PATCH 4/5] ti-ccsv6-native: Upgrade to version 6.2.0.00050
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
X-List-Received-Date: Thu, 20 Oct 2016 15:27:11 -0000
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
Subject: [master/krogoth][PATCH 4/5] ti-ccsv6-native: Upgrade to version 6.=
2.0.00050

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 ...ive_6.1.3.00034.bb =3D> ti-ccsv6-native_6.2.0.00050.bb} |   14 +++++++-=
------
 1 file changed, 7 insertions(+), 7 deletions(-)  rename recipes-ti/devtool=
s/{ti-ccsv6-native_6.1.3.00034.bb =3D> ti-ccsv6-native_6.2.0.00050.bb} (72%=
)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb b/recipes-t=
i/devtools/ti-ccsv6-native_6.2.0.00050.bb
similarity index 72%
rename from recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
rename to recipes-ti/devtools/ti-ccsv6-native_6.2.0.00050.bb
index 334c7df..4e5192c 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.2.0.00050.bb
@@ -10,25 +10,25 @@ require recipes-ti/includes/ti-unpack.inc  require reci=
pes-ti/includes/ti-staging.inc
 require recipes-ti/includes/ti-paths.inc
=20
-TI_CGT_ARM_VERSION =3D "15.12.1.LTS"
+TI_CGT_ARM_VERSION =3D "15.12.3.LTS"
=20
-SRC_URI =3D "http://install.source.dir.local/CCS${PV}_linux.tar.gz;name=3D=
ccsv6"
+SRC_URI =3D "http://install.source.dir.local/CCS${PV}_linux-x64.tar.gz;nam=
e=3Dccsv6"
=20
-S =3D "${WORKDIR}/CCS${PV}_linux"
+S =3D "${WORKDIR}/CCS${PV}_linux-x64"
=20
-BINFILE =3D "CCS${PV}_linux/ccs_setup_${PV}.bin"
+BINFILE =3D "CCS${PV}_linux-x64/ccs_setup_linux64_${PV}.bin"
 TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
 TI_BIN_UNPK_CMDS =3D ""
=20
-SRC_URI[ccsv6.md5sum] =3D "ceaa5023c1a4b51bc637d3de1a15786b"
-SRC_URI[ccsv6.sha256sum] =3D "fb3205a21942da09684c871371513707c841c4fd8d88=
a62f6a7865b0a86cc492"
+SRC_URI[ccsv6.md5sum] =3D "652185ae9ef7c60a92d5fc42e4869bf2"
+SRC_URI[ccsv6.sha256sum] =3D "cb31dad800f2740bf5a0ce8c7e1d172666c70d71e186=
09c8951db1e37b2cf48e"
=20
 do_install() {
     install -d ${D}${CCSV6_INSTALL_DIR_RECIPE}
     cp -r ${WORKDIR}/ccsv6/. ${D}${CCSV6_INSTALL_DIR_RECIPE}
=20
     install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
-    cp -r ${WORKDIR}/ccsv6/tools/compiler/ti-cgt-arm_${TI_CGT_ARM_VERSION}=
/. \
+    cp -r ${WORKDIR}/ccsv6/tools/compiler/arm_${TI_CGT_ARM_VERSION}/. \
           ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
 }
=20
--
1.7.10.4


