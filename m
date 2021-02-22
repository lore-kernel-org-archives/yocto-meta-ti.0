Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1180.1614019997197828053
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Feb 2021 10:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=B+P48KU9;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8F14A38C07D7
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 18:53:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11MIrFhS072444
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:53:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614019995;
	bh=zEy0UP+RO4VlkUmFO641IMRfL9Si4BNUgWKKHieqjFA=;
	h=From:To:CC:Subject:Date;
	b=B+P48KU94pK9NYvALckzU7QTKiUztcAlHHy0at1WDjkc+iiPYG0dp1PDT5T9Sjh99
	 eGAh5k/gjsocT7gN9C3IxmXqIbDl5vhfuBdoBWTJANxbPlU4nLxmXrwBrysFU0IJbt
	 fB2xydrR8TpraNnbFqfYcKzNaIvYZliXEF67xJNA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11MIrFev019525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:53:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 12:53:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Feb 2021 12:53:15 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11MIrFva039207;
	Mon, 22 Feb 2021 12:53:15 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 11MIrFWC123878;
	Mon, 22 Feb 2021 12:53:15 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][master/dunfell][PATCH 1/2] ti-img-rogue-driver: Update driver to 1.13.5776728
Date: Mon, 22 Feb 2021 12:53:11 -0600
Message-ID: <20210222185312.22981-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the Rogue kernel driver sources to version 1.13.5776728.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ....10.5371573.bb =3D> ti-img-rogue-driver_1.13.5776728.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.10.5371573.bb =
=3D> ti-img-rogue-driver_1.13.5776728.bb} (83%)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573=
.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
similarity index 83%
rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.=
bb
rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index e0632a18..db3901d2 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -1,13 +1,13 @@
 DESCRIPTION =3D  "Kernel drivers for the PowerVR Rogue GPU found in the =
TI SoCs"
 HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE =3D "MIT | GPLv2"
-LIC_FILES_CHKSUM =3D "file://README;beginline=3D15;endline=3D20;md5=3D04=
03c7dea01a2b8232261e805325fac2"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D04=
03c7dea01a2b8232261e805325fac2"
=20
 inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-MACHINE_KERNEL_PR_append =3D "g"
+MACHINE_KERNEL_PR_append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -17,13 +17,13 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "linuxws/zeus/k5.4/${PV}"
+BRANCH =3D "1.13-5776728/linux-k5.4"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "f58bea1084c5004f129943a53b94ee1446e9c3a7"
+SRCREV =3D "ea77784e89f919bd3343a421862bf90cb65cc26c"
=20
 PVR_SOC =3D "j721e_linux"
 PVR_BVNC =3D "22.104.208.318"
--=20
2.29.0

