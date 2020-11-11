Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12403.1605124939344266676
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 12:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=nXNpKtC/;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4F1F738C056B
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 20:02:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABK2Hkp090696
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 14:02:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605124937;
	bh=iVcmvuBz1fdm6fGIop528bmyuo3NW5qC+f2BRP+veTI=;
	h=From:To:CC:Subject:Date;
	b=nXNpKtC/tOGTp2Rdks/CrUmUdpnsbignzgx2aaKhTdSyHzs/v6yycNt7gPpwLX+Qu
	 FGQrfrbVkqKSY7efl8ixasn2FDH8bFfUhelHfpexvqtVyML6kMm75OccqA+3kbEA4v
	 8g8dVYSyAtjJHMw1jXzqgBquK2kcRdd9QbUAR+Ls=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABK2HTt116869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2020 14:02:17 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 14:02:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 14:02:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABK2Ge7049998;
	Wed, 11 Nov 2020 14:02:17 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [meta-ti] [dunfell/master] PATCH 1/2] ti-sci-fw: Update linux-firmware SHA to pick up latest ti-dm firmware
Date: Wed, 11 Nov 2020 14:02:10 -0600
Message-ID: <20201111200211.23047-1-dmurphy@ti.com>
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
index 24de33d67008..8cfeee9ac4d7 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668b=
df95621259288c4a46d76"
=20
 PV =3D "2020.08b"
=20
-SRCREV =3D "f5685b5980d93709e20466ffa19145ffd83b4ca4"
+SRCREV =3D "1db89d57aa5d19c112f08abbd5aaa2111e96c773"
 BRANCH ?=3D "ti-linux-firmware"
 SRCREV_imggen =3D "7b4fe13d642d69a559724349aede4817891008a7"
 SRCREV_FORMAT =3D "imggen"
--=20
2.29.2

