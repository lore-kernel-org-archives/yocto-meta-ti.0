Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6.1645825287870873743
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 13:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E648F40AE9;
	Fri, 25 Feb 2022 21:41:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWSGpFvN283b; Fri, 25 Feb 2022 21:41:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF01140A46;
	Fri, 25 Feb 2022 21:41:25 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8DA9D174763;
	Fri, 25 Feb 2022 16:41:25 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] meta-ti: correct and do not skip "installed-vs-shipped" QA check
Date: Fri, 25 Feb 2022 21:41:25 +0000
Message-Id: <20220225214125.940996-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Skipping "installed-vs-shipped" QA check is now considered bad practice
due to possible SDK issues and is being flagged by yocto-check-layer [1]
script and could affect "Yocto Project Compatible" status for the layer.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3De8baa7553=
5fc888f1d768b23a0140475e832c910

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb  | 5 ++++-
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc           | 2 +-
 meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb | 2 --
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb b/meta=
-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
index 1cda366d..8b16830f 100644
--- a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
+++ b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
@@ -22,9 +22,12 @@ do_compile () {
 do_install() {
 	cd ${S}
 	oe_runmake DESTDIR=3D${D} libdir=3D${libdir} includedir=3D${includedir}=
 install
+	rm -rf ${D}${libdir}/boot.*
+	rm -rf ${D}${libdir}/gnu.targets.*
+	rm -rf ${D}${libdir}/syscalls.*
 }
=20
 COMPATIBLE_HOST ?=3D "null"
 COMPATIBLE_HOST:ti-soc =3D "(.*)"
=20
-INSANE_SKIP:${PN} +=3D "textrel installed-vs-shipped"
+INSANE_SKIP:${PN} +=3D "textrel"
diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extra=
s/recipes-ti/vlib/vlib-c66x.inc
index 460964b3..6b5e186c 100644
--- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
+++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
@@ -29,4 +29,4 @@ FILES:${PN}-dev +=3D "${VLIB_C66_INSTALL_DIR_RECIPE}"
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INSANE_SKIP:${PN}-dev =3D "installed-vs-shipped arch"
+INSANE_SKIP:${PN}-dev =3D "arch"
diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/met=
a-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
index 9fc4cee1..ee9826e6 100644
--- a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
+++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
@@ -7,5 +7,3 @@ LIC_FILES_CHKSUM =3D "file://xdais_6_26_01_03_manifest.ht=
ml;md5=3Da5a675d49db2f658bb
=20
 SRC_URI[xdaistarball.md5sum] =3D "9b2bea3408254e737ec0d819a031adf6"
 SRC_URI[xdaistarball.sha256sum] =3D "d7bcbd8bcfe6fdfc5f402e4b125ced6c806=
dc30bc5296e98d5d43b0b5a237a0d"
-
-INSANE_SKIP:${PN} =3D "installed-vs-shipped"
--=20
2.25.1

