Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.8858.1584018688537531087
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Mar 2020 06:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=semCNovV;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: g-tammana@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B538E017DE; Thu, 12 Mar 2020 06:11:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9556E017DC
	for <meta-ti@yoctoproject.org>; Thu, 12 Mar 2020 06:11:25 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02CDBPOe054315
	for <meta-ti@yoctoproject.org>; Thu, 12 Mar 2020 08:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584018685;
	bh=osjEP5yds99SMhUVhP3HI5+fP8jgBX4izyBbX8/9WU4=;
	h=From:To:CC:Subject:Date;
	b=semCNovVtj4ZryXBldmxI76XO9W5nq+L7hn82OHFJIcjkqXOlW9seKtHv2LXiy/Ar
	 JgemCacyJ0XYoYlV60kI4/dWCMvqqq2M6Snby/tMGzZaYFOOLBY7/bbvXVkMpbrUMX
	 Fy25zddb95XgcvLtVAsWydfWQ79p0eq4vrW1WsSY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02CDBPuj110022
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Mar 2020 08:11:25 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 08:11:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 08:11:24 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02CDBPpE034291;
	Thu, 12 Mar 2020 08:11:25 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.77.97])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 02CDBOTY074772;
	Thu, 12 Mar 2020 08:11:25 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][zeus/master][PATCH] ti-gc320-driver: Update srcrev to pick dma api fixes
Date: Thu, 12 Mar 2020 08:11:38 -0500
Message-ID: <20200312131138.5046-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update srcrev to pick the fixes for dma api crashes.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/rec=
ipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index d536b1c6..792e5730 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D78d9818a5=
1b9a8e9bb89dea418bac297"
=20
 inherit module
=20
-MACHINE_KERNEL_PR_append =3D "g"
+MACHINE_KERNEL_PR_append =3D "h"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 # Need to branch out with ${PV} var
 BRANCH =3D "ti-${PV}-k5.4"
=20
-SRCREV =3D "bd1c9751af7c693bdf1a0e6b8b96226305d45a8c"
+SRCREV =3D "2a4fbe8353fa56011a613aeeaf69e274cd07a825"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
=20
--=20
2.25.1

