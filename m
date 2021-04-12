Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.3643.1618261138492249692
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 13:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=xxiVmBp5;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 44D1638C0830
	for <meta-ti@yoctoproject.org>; Mon, 12 Apr 2021 20:58:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13CKwvD1067757;
	Mon, 12 Apr 2021 15:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618261137;
	bh=9AVNyEnMU7hgSL22+5u7hVYkaDT/0OjnGSidJD2NNCI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xxiVmBp5daVjYlOH7v3aKRcJPC3MLFBHHGntnSg1xMQaBgh7hX60l3pq4uEMXhorV
	 0Qx7u66J0BVg7PgohKk1Savu4u6IstBXvAFRxfO/q4ZNtX2b2vAqWL0H/RZr5sjIst
	 +7/W8IBEDtDjSeIBpf9xRzB2d3yEDJ/7ekPi4osY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13CKwv4r076553
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 15:58:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 15:58:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 15:58:57 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13CKwvoM044881;
	Mon, 12 Apr 2021 15:58:57 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 13CKwpY1086703;
	Mon, 12 Apr 2021 15:58:57 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        <denys@konsulko.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 2/2] ti-img-rogue-umlibs: update branch to pick 5.10
Date: Mon, 12 Apr 2021 15:58:49 -0500
Message-ID: <20210412205849.7689-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412205849.7689-1-g-tammana@ti.com>
References: <20210412205849.7689-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the branch name to pick 5.10 development branch. The srcrev
remains the same at this point.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index dafb9dd8..5194015e 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
@@ -10,9 +10,9 @@ REQUIRED_MACHINE_FEATURES =3D "gpu"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "j7"
=20
-PR =3D "r2"
+PR =3D "r3"
=20
-BRANCH =3D "linuxws/dunfell/k5.4/${PV}"
+BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
=20
--=20
2.31.1

