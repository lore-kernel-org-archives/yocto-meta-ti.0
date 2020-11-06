Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.13086.1604675886016258217
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 07:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=omNAlCIy;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B9ABB38C08A6
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2020 07:18:05 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6FI5rM008375
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 09:18:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604675885;
	bh=VuSQfgshko5r920KY/QujbbrbwtuSwnTuJTvotxtVCc=;
	h=From:To:CC:Subject:Date;
	b=omNAlCIymrml3/HpaYzymS7hY/+QemkWSJ7taUny93IjPew0KsmTHeDh/KMvHr9Na
	 pe9uouJAQqPJeV9x2EGgSK//nXU/YmoeqI+VsnQWgJFtEhaF+QJoMbsg0siHmekAD/
	 nJ6yqta1PHutHJ+Riy3WzlGJ8qLXEvhloQ+T8v0c=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6FI4ft029208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2020 09:18:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 09:18:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 09:18:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6FI3mL104452;
	Fri, 6 Nov 2020 09:18:04 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH] u-boot-ti-staging: Update to latest commit SHA
Date: Fri, 6 Nov 2020 09:18:02 -0600
Message-ID: <20201106151802.30413-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2020.01.bb
index 4a1837e3afd4..991ba0ca4482 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
=20
-PR =3D "r21"
+PR =3D "r22"
=20
 BRANCH =3D "ti-u-boot-2020.01"
=20
-SRCREV =3D "7c8ae131b5623ff14c1b1ad6702801e39ef9b722"
+SRCREV =3D "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
--=20
2.29.2

