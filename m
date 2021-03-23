Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.941.1616540839654817454
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 16:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Y6EmczxO;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6C52638C0570
	for <meta-ti@yoctoproject.org>; Tue, 23 Mar 2021 23:07:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NN7H2e077550;
	Tue, 23 Mar 2021 18:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616540837;
	bh=QdaR35D798I41hDFgHCokiKomWj0aPS4nmhkmCzHCRg=;
	h=From:To:CC:Subject:Date;
	b=Y6EmczxOLi1R6Pe0trL8dX8+jruYQHaEMO/GIaAktImkuAoLJDV1EDewyZUrboCMV
	 7JytoLMCtbmMJiSfz74E8d6p9QPNWmCw76vwIbc5gMSL+RoXg/ozVqZ2+YdM8AIAfC
	 q8aNrGCgRswm93cp9RkBkWpB6qC57DvUmVvM96Mg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NN7HSS090837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 18:07:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 18:07:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 18:07:17 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NN7H4g040760;
	Tue, 23 Mar 2021 18:07:17 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12NN7GZi117958;
	Tue, 23 Mar 2021 18:07:16 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] ti-img-rogue-umlibs: Update to pick rpath fixes
Date: Tue, 23 Mar 2021 18:07:09 -0500
Message-ID: <20210323230709.9607-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update srcrev to pick the rpath warning fixes.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index d8fae3dd..dafb9dd8 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
@@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j7"
=20
-PR =3D "r1"
+PR =3D "r2"
=20
 BRANCH =3D "linuxws/dunfell/k5.4/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
=20
-SRCREV =3D "3c4cabc8df10a066569e5f959cbbd4c0ce9961cd"
+SRCREV =3D "5ef38353c38d921a65ea6df75c7b6ce710b66034"
=20
 PVR_SOC ?=3D "j721e_linux"
 PVR_BUILD ?=3D "release"
--=20
2.31.0

