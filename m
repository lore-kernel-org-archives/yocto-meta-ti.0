Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.9122.1604589618406444776
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Nov 2020 07:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GIe1UO9Q;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6006E38C08BB
	for <meta-ti@yoctoproject.org>; Thu,  5 Nov 2020 07:20:17 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FKGGu002738
	for <meta-ti@yoctoproject.org>; Thu, 5 Nov 2020 09:20:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604589616;
	bh=3RBboikdaygn8vs7S+anVL0FT28ktEnbJP3x4fE2I1s=;
	h=From:To:CC:Subject:Date;
	b=GIe1UO9Q9awawT/uiXbe1w80pw7JmWosWoXT3NhiIa4x9duCKicJwcKVoU1p6P5kF
	 NA6o/BPorujt9D+4N5YBUhYhc1fRnUMr6kiaU9AXJpqjh16s+dTQjzto3iV+kOJ0wC
	 fbZeUMfqC198LuJKZLLo7SHD4cOxxWodqf26V+OM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5FKGVY111778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Nov 2020 09:20:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 09:20:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 09:20:15 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FKFbM114709;
	Thu, 5 Nov 2020 09:20:15 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0A5FKFWP112921;
	Thu, 5 Nov 2020 09:20:15 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Dan Murphy <dmurphy@ti.com>,
        Denys Dmytriyenko
	<denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: update srcrev to pick rpath fixes
Date: Thu, 5 Nov 2020 09:20:11 -0600
Message-ID: <20201105152011.10814-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the srcrev to pick the latest artifacts that fix some of the
redundant rpath warnings seen with Yocto.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index edb4b753..f9d5ed9c 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -10,12 +10,13 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j7"
=20
-PR =3D "r8"
+PR =3D "r9"
=20
 BRANCH =3D "linuxws/zeus/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
-SRCREV =3D "6b4d8e538566bbaf6b9c4a24dbecd740d58c1871"
+
+SRCREV =3D "8d3d1891186ed3f397bb90f4f8c518c6c9970479"
=20
 PVR_SOC ?=3D "j721e_linux"
 PVR_BUILD ?=3D "release"
--=20
2.17.1

