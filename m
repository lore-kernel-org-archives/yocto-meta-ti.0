Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.817.1616002675807905211
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 10:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=MXuloa6I;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0BA1838C065B
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 17:37:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12HHbsvc100263
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 12:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616002674;
	bh=arXI+xrxG27u0ThuGgKPS2DPIOj1z3EtuTHeWE0omK0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MXuloa6ItMtmIh5bvXNbScRjBtVJ97aZmntnVvJHsIGusDEybwr/PolI83QvQkCon
	 J5XRdyx/kokiUIuibg+1BfLpbmCsiImP7CXmTO8odcBcCDAxdY3jnaWzAMh9DtuUvm
	 P6F01+dYGHCh5xQqwvRv6oU6t4VElaebjtV2uktE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12HHbs3W126545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Mar 2021 12:37:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 12:37:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 12:37:54 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12HHbso0022256;
	Wed, 17 Mar 2021 12:37:54 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12HHbrw8086483;
	Wed, 17 Mar 2021 12:37:54 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2 2/2] ti-img-rogue-umlibs: Update artifacts to 1.13.5776728
Date: Wed, 17 Mar 2021 12:37:52 -0500
Message-ID: <20210317173752.17327-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210317173752.17327-1-g-tammana@ti.com>
References: <20210317173752.17327-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update GLES binary artifacts to latest version 1.13.5776728.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2: update to srcrev to fix broken symlinks

 ..._1.10.5371573.bb =3D> ti-img-rogue-umlibs_1.13.5776728.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.10.5371573.bb =3D=
> ti-img-rogue-umlibs_1.13.5776728.bb} (95%)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb=
 b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
similarity index 95%
rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index f9d5ed9c..d8fae3dd 100644
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
+SRCREV =3D "3c4cabc8df10a066569e5f959cbbd4c0ce9961cd"
=20
 PVR_SOC ?=3D "j721e_linux"
 PVR_BUILD ?=3D "release"
--=20
2.31.0

