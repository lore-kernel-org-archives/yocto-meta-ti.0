Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43F69E009CE; Fri, 28 Apr 2017 12:29:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64E18E009A5
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 12:29:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SJT3fw012240
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 14:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493407743;
	bh=BC4muje75YxSU9+bHKda1OWWqwFOOxeaEKkT9L/iHLc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bCCUyUgwn02P27domsBmdbG2LqVhR4LqPgI/GlJO5gqOxdIClAm7aX3WtrkWc7Y3q
	F19QbnAFuKmd8iSQliYCeveA6OoPD0d+Xtwe+YGyC6r/NET3HEgFw7UgHNDiDnYGrA
	IYD8YuL+nbLr0SI2qCWzPbbiWUWjT+xtLYzZnWKc=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SJT257003657
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 14:29:03 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 28 Apr 2017 14:29:02 -0500
From: "Sobota, Justin" <jsobota@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] edma3lld: remove outdated v1 recipe
Thread-Index: AQHSwEy56KJCAgZKvUWlIltomzvJ6qHbKq9g
Date: Fri, 28 Apr 2017 19:29:01 +0000
Message-ID: <311ECDE3E284F649854AED0B108A0CE14C092D60@DFLE12.ent.ti.com>
References: <1493403863-126827-1-git-send-email-denys@ti.com>
In-Reply-To: <1493403863-126827-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [PATCH] edma3lld: remove outdated v1 recipe
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
X-List-Received-Date: Fri, 28 Apr 2017 19:29:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, April 28, 2017 2:24 PM
To: meta-ti@yoctoproject.org
Cc: Dmytriyenko, Denys; Nelson, Sam; Sobota, Justin
Subject: [PATCH] edma3lld: remove outdated v1 recipe

Current v2 version is in recipes-bsp

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Sam Nelson <sam.nelson@ti.com>
Cc: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/edma3lld/ti-edma3lld.inc            | 23 ----------------------=
-
 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb | 10 ----------
 2 files changed, 33 deletions(-)
 delete mode 100644 recipes-ti/edma3lld/ti-edma3lld.inc
 delete mode 100644 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb

diff --git a/recipes-ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-e=
dma3lld.inc
deleted file mode 100644
index fb131b6..0000000
--- a/recipes-ti/edma3lld/ti-edma3lld.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "TI EDMA3 Low Level Driver (LLD)"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma=
3lldsite}/edma3_lld"
-SECTION =3D "devel"
-LICENSE =3D "TI"
-LIC_FILES_CHKSUM =3D "file://packages/ti/sdo/edma3/drv/edma3_drv.h;md5=3Dc=
1aa300aaf369a0a03e7922c1b0bbf8e"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-TI_BIN_UNPK_WDEXT=3D"/edma3_lld_${PV}"
-S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3=
lldsite}/edma3_lld/edma3-lld-bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}=
.bin;name=3Dedma3lldbin"
-
-BINFILE=3D"EDMA3_LLD_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS=3D"Y:workdir"
-
-do_install() {
-    install -d ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${EDMA3_LLD_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb b/recipes-ti/ed=
ma3lld/ti-edma3lld_01.11.01.04.bb
deleted file mode 100644
index 549e020..0000000
--- a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ti-edma3lld.inc
-
-PV =3D "01_11_01_04"
-
-SRC_URI_edma3lldsite =3D "sdo_tii/psp"
-
-SRC_URI[edma3lldbin.md5sum] =3D "b3c41cb946e2e4b94348fc6bcbe30b16"
-SRC_URI[edma3lldbin.sha256sum] =3D "617db3eadff33a88e3d42818c204f379906da3=
b312bc120092408043e7e2aaeb"
-
-INSANE_SKIP_${PN} =3D "installed-vs-shipped"
--=20
2.7.4


