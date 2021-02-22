Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.1201.1614019999078065312
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Feb 2021 10:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=CoD14y0x;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id DD7D838C07D7
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 18:53:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11MIrIQ8043526
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:53:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614019998;
	bh=0kcZNG3wKeEyBJk41hpxe0hW6f+kNEHIgPHWY0d5Sgc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CoD14y0xfzOV0gAP04c16Oag6IOmkpulUez995eDb++TasPOli91mO8amVwMZLUhU
	 JOjQenWzhsjZmhJOTrmjlQzT+xcxTG0Qjlh/DMwgOYdWD9OwYGZ/WyR4GfNvrrldm4
	 LcFHCnR8MwHXfCgT2oGJQ/jAm2oBBXd6W8SxR0bY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11MIrIXf005069
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:53:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 12:53:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Feb 2021 12:53:17 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11MIrHKb023109;
	Mon, 22 Feb 2021 12:53:17 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 11MIrFWD123878;
	Mon, 22 Feb 2021 12:53:17 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][master/dunfell][PATCH 2/2] ti-img-rogue-umlibs: Update artifacts to 1.13.5776728
Date: Mon, 22 Feb 2021 12:53:12 -0600
Message-ID: <20210222185312.22981-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210222185312.22981-1-g-tammana@ti.com>
References: <20210222185312.22981-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update GLES binary artifacts to latest version 1.13.5776728.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ..._1.10.5371573.bb =3D> ti-img-rogue-umlibs_1.13.5776728.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.10.5371573.bb =3D=
> ti-img-rogue-umlibs_1.13.5776728.bb} (95%)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
similarity index 95%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index f9d5ed9c..f76977ba 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
@@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j7"
=20
-PR =3D "r9"
+PR =3D "r1"
=20
-BRANCH =3D "linuxws/zeus/k5.4/${PV}"
+BRANCH =3D "linuxws/dunfell/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
=20
-SRCREV =3D "8d3d1891186ed3f397bb90f4f8c518c6c9970479"
+SRCREV =3D "2bdcab52eecbbef4c70e3b58c5f3854660abb8d4"
=20
 PVR_SOC ?=3D "j721e_linux"
 PVR_BUILD ?=3D "release"
--=20
2.29.0

