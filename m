Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.816.1616002675807788128
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 10:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=uXfp0/6h;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CF4B538C0602
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 17:37:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12HHbrDd100259
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 12:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616002673;
	bh=5pNtOk2tfJ5Spr2UwQuo5kgCTOnXWvE00/rNci7Brqc=;
	h=From:To:CC:Subject:Date;
	b=uXfp0/6hOz7L+iTkn01jd7IXlDgfdou43wy0KlVI4RZXO1ZXjSivc8LluE1aVM49Z
	 v4AXFFhifHzxFZBz65Jyi+LLM2lb8ZlNw99VaJzXaKwR9scFFaZt7uMfTqVp+7CkMq
	 vnCHPxnbynMYltke4gannqe5RqZhG7LA9XZnAI6o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12HHbrSf126542
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 12:37:53 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 12:37:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 12:37:53 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12HHbr1g032045;
	Wed, 17 Mar 2021 12:37:53 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12HHbrw7086483;
	Wed, 17 Mar 2021 12:37:53 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2 1/2] ti-img-rogue-driver: Update driver to 1.13.5776728
Date: Wed, 17 Mar 2021 12:37:51 -0500
Message-ID: <20210317173752.17327-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the Rogue kernel driver sources to version 1.13.5776728.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2: - no change here - v2 as part of patchset update

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
2.31.0

