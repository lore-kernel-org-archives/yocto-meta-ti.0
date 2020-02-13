Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2104.1581622794587184912
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 11:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=mKr2yZ/K;
 spf=permerror, err=parse error for token &{10 18 app.sgizmo.com}: SPF record not found (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09A06E015F8; Thu, 13 Feb 2020 11:39:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6858E00804
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 11:39:52 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DJdp7m105014
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 13:39:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581622791;
	bh=kF8MBoQpyszCKM6eWnOF2y8bsn01QNwlRWwvBz9L3HE=;
	h=From:To:CC:Subject:Date;
	b=mKr2yZ/KR6IDos8GGm3dXrhZonLW4qnyq7mxrwmvf0BRf07c/WyMVT34fdC1nGyB8
	 RzItRfqrRYRsRFKgKoEmco/RV6WGFNCeU+CvfVJiugK75LE3OSAqS+vLEJbbXm0brD
	 Zjb53qrHfN/TjB9ZfTM8rYG4ghui4DGO/bvLnSo4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DJdpT5118759
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 13:39:51 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 13:39:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 13:39:51 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DJdo2s002584;
	Thu, 13 Feb 2020 13:39:50 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01DJdo301547;
	Thu, 13 Feb 2020 13:39:51 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH] ti-gc320-driver: Update srcrev to pick rtlinux build fix
Date: Thu, 13 Feb 2020 13:40:05 -0600
Message-ID: <20200213194005.16079-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update srcrev to pick the fix for rt linux build issue.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/rec=
ipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index dc0557f8..d536b1c6 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D78d9818a5=
1b9a8e9bb89dea418bac297"
=20
 inherit module
=20
-MACHINE_KERNEL_PR_append =3D "f"
+MACHINE_KERNEL_PR_append =3D "g"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 # Need to branch out with ${PV} var
 BRANCH =3D "ti-${PV}-k5.4"
=20
-SRCREV =3D "0335b28d85add258b37160cd0907f13f5b5369fe"
+SRCREV =3D "bd1c9751af7c693bdf1a0e6b8b96226305d45a8c"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
=20
--=20
2.25.0

