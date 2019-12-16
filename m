Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.13164.1576532922193178239
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 13:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GFTruKW2;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 139BCE011FF; Mon, 16 Dec 2019 13:48:42 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20B60E010DB
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 13:48:39 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGLmdce047272
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 15:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576532919;
	bh=2MnApzv36YlBGBYYeF4bjYYn/dc3nLQVTu9j9blOC74=;
	h=From:To:CC:Subject:Date;
	b=GFTruKW2kPrPXOXU+xN/BZMk5+HJ49w2/sXtkZ8aC4G94f3K4mDiuxZrEk2pvzmcY
	 aFyWEzlg8mLVFR70JWbnswg98ht9nZeHwwPUUu9QA0mJzDYDMjzFm376dKBxI1CYow
	 3nn9A3k9vM3LHnQ31+xcMuygIkAlMPSIgjmXX05E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGLmdGe062598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 15:48:39 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 15:48:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 15:48:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGLmcQt068158;
	Mon, 16 Dec 2019 15:48:38 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] u-boot-ti-staging: update to ti2019.06-rc1
Date: Mon, 16 Dec 2019 15:46:12 -0600
Message-ID: <20191216214613.7286-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bs=
p/u-boot/u-boot-ti-staging_2019.01.bb
index 915a9043..8d4609af 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
=20
-PR =3D "r30"
+PR =3D "r31"
=20
 BRANCH =3D "ti-u-boot-2019.01"
=20
-SRCREV =3D "bded2ef6f8afa87d06fda18f50ef6488d47a920e"
+SRCREV =3D "bd3dc907f7964fa2d6a24cf9660665e32029a3c1"
--=20
2.23.0

