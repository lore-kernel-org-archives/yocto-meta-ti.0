Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1226.1608230973356662197
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=lDaw12rl;
 spf=fail (domain: ti.com, ip: <nil>, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8DD9E38C1142
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInXEw033486
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230973;
	bh=/u0/VdppXNfpZA0u2N21lEVHNNKJ8HJLZwmXOQ/xCBo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lDaw12rlntvhypiQ2VjqpLjB3efWd4Lt9dl1SQDRhqh0k3agJCUB8tbb028V48NOt
	 xq4uYQWCcj47T3ft42ciLsoPl5GGaRCvew/PGtN8zMxvUwf70PVDogKF/kyIm6G2XB
	 IV7lXCejEqyl16qznZnvd0XP9Z8WS8BselubZDHo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInX03107379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:33 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInWgi051987;
	Thu, 17 Dec 2020 12:49:32 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 10/10] prueth-fw-am65x-sr2: Updating firmware to 02.02.08.02
Date: Thu, 17 Dec 2020 12:49:29 -0600
Message-ID: <20201217184929.18031-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-b=
sp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index c66bee80d79c..57cf37a26933 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
-PV =3D "02.02.07.02"
+PV =3D "02.02.08.02"
=20
 CLEANBROKEN =3D "1"
=20
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE =3D "am65xx-evm"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-SRCREV =3D "c911bcec682ef053a15f9c7d5867a0dd2da2632b"
+SRCREV =3D "31e626d84a3f8a5dc7175b79440972ce90a23de0"
 BRANCH ?=3D "ti-linux-firmware"
=20
 SRC_URI =3D "git://git.ti.com/processor-firmware/ti-linux-firmware.git;p=
rotocol=3Dgit;branch=3D${BRANCH}"
--=20
2.29.2

