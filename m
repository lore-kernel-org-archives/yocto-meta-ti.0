Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1321.1600363156204950780
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 10:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UIsFMq0N;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5EF2838C149D
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2020 10:19:15 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HHJEug060722
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2020 12:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600363154;
	bh=NHPT+TGXmZELyIlUfpCh7s85Ghlf1c7OTjceEv2t/Y8=;
	h=From:To:CC:Subject:Date;
	b=UIsFMq0NIs6R6M5PHjOL7QY5qBzuPbW242OqjMDGy7Kk61vHjTkrKt+bw5pHHLwW3
	 v6tc4mgObG4wXH2elrOv6rIveVa/NzNo0TaqAfPpoBN3oWmKAjfu3UERHvL35gD+FN
	 4sf3xGCiT1cQ0wKdcNu78+yiQzSOBSSzlwA+OaGg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HHJDvI086808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2020 12:19:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 12:19:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 12:19:13 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HHJDH1038411;
	Thu, 17 Sep 2020 12:19:13 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.45])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 08HHJDLI130761;
	Thu, 17 Sep 2020 12:19:13 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-sgx-ddk-um: Update SRCRERV to pick latest artifacts
Date: Thu, 17 Sep 2020 12:19:10 -0500
Message-ID: <20200917171910.12511-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update SRCREV to pick the latest artifacts. The GL headers are excluded
in the artifacts instead of it in the recipe.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/rec=
ipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 6639ec5c..47e9820b 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,12 +10,12 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
=20
-PR =3D "r35"
+PR =3D "r36"
=20
 BRANCH =3D "ti-img-sgx/zeus/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protoc=
ol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "ce7b96b88d31da27af5b3a2a890aba180a014fc4"
+SRCREV =3D "7519eda203308c4356e68fd6af67a0900ed09cb4"
=20
 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
@@ -57,8 +57,6 @@ do_install () {
     oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}
     ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
=20
-    rm -rf ${D}${includedir}/GL
-
     chown -R root:root ${D}
 }
=20
--=20
2.28.0

