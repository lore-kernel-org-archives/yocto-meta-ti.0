Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1285.1608230972801772429
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UBJCEobB;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9CC4E38C12A4
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInWql059869
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230972;
	bh=L+wzOZQWWtROD/zrZjIUZOjLAT0LEvknJBWKC71lF+w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UBJCEobBOAnh81lqIGMhREVweUV+gsVh1cj+TjWOQJoZpp8UlqlnkBmE5+Fv/ERwL
	 8ifBRoIl829ZsUxmTl5Mybu7BW0684ZOUqF9MgRGpCP1YI7aXtpxNbz1ZBszzrqiaO
	 LHI90z1IFu/9dcHYTrpJNAgpAMuNJI0sGabm5890=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInWwm107357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInVV3051961;
	Thu, 17 Dec 2020 12:49:31 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 06/10] ti-uboot-staging: Update to the latest commit
Date: Thu, 17 Dec 2020 12:49:25 -0600
Message-ID: <20201217184929.18031-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
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
index 15dd32da66f2..8d4611a3013d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
=20
-PR =3D "r25"
+PR =3D "r26"
=20
 BRANCH =3D "ti-u-boot-2020.01"
=20
-SRCREV =3D "10dad9df6a0eb00f45bed48c9df0c9effb4fbae5"
+SRCREV =3D "c32cf0dd6bc60911927548ad20973c71fce95661"
--=20
2.29.2

