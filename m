Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.34405.1611176346954454438
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 12:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=r5GtMuxW;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0923338C0717
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 20:59:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10KKx5gZ050515
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 14:59:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611176345;
	bh=+oAPTQAeIzyO1+6KMeItN1OHMO9pWDSiA5oID8H14M0=;
	h=From:To:CC:Subject:Date;
	b=r5GtMuxWWW+0PDTgUMWAGVJudu1RF2tIgMC4o+GHqlXQ/Omoy5shjiPOzMDGGueI6
	 Yldhex9j0bAR3VnPKD13fStWqcGrZqt29mhCQrcRrKwUUGJSE7pbvjuWsJ0iOoD+az
	 AnMqDCKdVL7uDaarn9eQgUy3dk2wTNTFkgb6/OYc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10KKx4OJ044339
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2021 14:59:05 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 Jan 2021 14:59:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 Jan 2021 14:59:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10KKx4BE021886;
	Wed, 20 Jan 2021 14:59:04 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] ti-sci-fw: Update image gen and sysfw to v2020.12a
Date: Wed, 20 Jan 2021 14:58:58 -0600
Message-ID: <20210120205858.12725-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the image gen and linux-firmware commit SHAs so that
am65x, j7200 and j721e also picks v2020.12a sysfw and the applicable
DM update on j7200 and j721e based on 07.02.00.10 tag

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/=
ti-sci-fw.inc
index 7b989dd2a17e..876d6b0d56b0 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY =3D "TI SCI firmware (SYSFW)"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
-PV =3D "2020.12"
+PV =3D "2020.12a"
=20
-SRCREV =3D "183b487f02ce48b47df02cfe7ea9579b4c1e280b"
+SRCREV =3D "b66ee9ae020c31d7138f0af38518823bb4f5791e"
 BRANCH ?=3D "ti-linux-firmware"
-SRCREV_imggen =3D "0388c32f31bc4dd57b72a3b5faf3ca7ff4209c79"
+SRCREV_imggen =3D "8412cbddc19c75a2ab2711ae169c3818dc65e4ba"
 SRCREV_FORMAT =3D "imggen"
=20
 SRC_URI =3D " \
--=20
2.29.2

