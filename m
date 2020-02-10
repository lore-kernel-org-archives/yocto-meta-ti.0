Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2013.1581375811945118506
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 15:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=XZxNl3Ii;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71E0CE0171C; Mon, 10 Feb 2020 15:03:31 -0800 (PST)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0E5FE0085D
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 15:03:30 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AN3UGD010965
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 17:03:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581375810;
	bh=FPMtvrnrRIfgCaLQB1VvVnehts6ArsiPuvZ1/pwpRTE=;
	h=From:To:CC:Subject:Date;
	b=XZxNl3IiwmUlGhWW51KTU4L3Iye/kVKrU4McUpGH0cz8CXo+rb+qveT6y1mb5y8Hh
	 DtLq6290kADtz/8cT6BPbZKZ/MkBpI5px4HlN2/58q/0WEoNGGo1+q45vybBKWAi1e
	 CXaO5bIjb0Lz+BVXXcGul1vi+ZH/ymBtJ0mOKsSg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AN3UHe098959
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 17:03:30 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 17:03:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 17:03:30 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AN3T9u050427;
	Mon, 10 Feb 2020 17:03:30 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01AN3T317103;
	Mon, 10 Feb 2020 17:03:29 -0600 (CST)
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus][PATCH] ti-gc320-driver: Update branch for k5.4
Date: Mon, 10 Feb 2020 17:03:40 -0600
Message-ID: <20200210230340.15338-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update branch and srcrev for k5.4 support.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/rec=
ipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 5f005e57..dc0557f8 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D78d9818a5=
1b9a8e9bb89dea418bac297"
=20
 inherit module
=20
-MACHINE_KERNEL_PR_append =3D "e"
+MACHINE_KERNEL_PR_append =3D "f"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 # Need to branch out with ${PV} var
-BRANCH =3D "ti-${PV}-k4.19"
+BRANCH =3D "ti-${PV}-k5.4"
=20
-SRCREV =3D "9b59e596b4adefabbb686ce8845edef8114558fd"
+SRCREV =3D "0335b28d85add258b37160cd0907f13f5b5369fe"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
=20
--=20
2.25.0

