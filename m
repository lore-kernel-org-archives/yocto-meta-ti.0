Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.3599.1618261134587657420
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 13:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=DAH4xAim;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8560738C0830
	for <meta-ti@yoctoproject.org>; Mon, 12 Apr 2021 20:58:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13CKwqpD107730;
	Mon, 12 Apr 2021 15:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618261132;
	bh=HJNRKRkE6koPmDKIV0PuF00AxrOpzoYPpLyesuHQSwc=;
	h=From:To:CC:Subject:Date;
	b=DAH4xAimwMVXU+xl0qu2vQDkG8DHXqf1eSsG5ZF2ipD9Uia4Hyefko+j7Qj0Ga4m4
	 qPBf5BlBdOVj+MkfrWZpav+6j9Q4PoOijiyPDUPNW2cHhVs6IGrdx1KVSOP3iiotfU
	 2q3jPt9ICKr7amsYEKwknQaINBliaNyfjLs9LiEU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13CKwq7e077334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 15:58:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 15:58:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 15:58:51 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13CKwqH6044814;
	Mon, 12 Apr 2021 15:58:52 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13CKwpY0086703;
	Mon, 12 Apr 2021 15:58:51 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 1/2] ti-img-rogue-driver: update srcrev to pick 5.10 branch
Date: Mon, 12 Apr 2021 15:58:48 -0500
Message-ID: <20210412205849.7689-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728=
.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
index db3901d2..ff3cbb89 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
@@ -7,7 +7,7 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-MACHINE_KERNEL_PR_append =3D "a"
+MACHINE_KERNEL_PR_append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -17,13 +17,13 @@ DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "1.13-5776728/linux-k5.4"
+BRANCH =3D "1.13-5776728/linux-k5.10"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "ea77784e89f919bd3343a421862bf90cb65cc26c"
+SRCREV =3D "35a25875ae8738f82c7cabc6b077ef992b0cca84"
=20
 PVR_SOC =3D "j721e_linux"
 PVR_BVNC =3D "22.104.208.318"
--=20
2.31.1

