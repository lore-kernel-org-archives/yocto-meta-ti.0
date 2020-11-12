Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7066.1605199217878486311
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 08:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=B8YBdFpQ;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2CD6138C1108
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 16:40:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACGeG2o001143
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 10:40:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605199216;
	bh=DUM8Vz5UELxq0IEvKeZdAywyAiBevV9UcpqAVWtxKUs=;
	h=From:To:CC:Subject:Date;
	b=B8YBdFpQ4Ec7Rf0J2wIgJ+hizVeSgEeJsgfVMFffdv4o0aL79QHWNAZnLK9P2UH/J
	 54Sq7fidMKf53HU+/GsAltdh7ydZgR09UG1s5b0u4MxSQRCQiccfvL9Zw6uHzWw0Fi
	 Qg7xn5vXemUiTJ4iaR0p4lVoYVAadOLpMUaPM8AU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACGeG8o024690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 10:40:16 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 10:40:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 10:40:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACGeGr3047191;
	Thu, 12 Nov 2020 10:40:16 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH] ti-sci-fw: Update SHA to pick up 07.01.00.38 ti-dm firmware with 2020.08b sysfw
Date: Thu, 12 Nov 2020 10:40:10 -0600
Message-ID: <20201112164010.31452-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/=
ti-sci-fw.inc
index 24de33d67008..fe391e5fc40b 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668b=
df95621259288c4a46d76"
=20
 PV =3D "2020.08b"
=20
-SRCREV =3D "f5685b5980d93709e20466ffa19145ffd83b4ca4"
+SRCREV =3D "c26c279257c13a0ff5002b09113fcff0e1d18853"
 BRANCH ?=3D "ti-linux-firmware"
 SRCREV_imggen =3D "7b4fe13d642d69a559724349aede4817891008a7"
 SRCREV_FORMAT =3D "imggen"
--=20
2.29.2

