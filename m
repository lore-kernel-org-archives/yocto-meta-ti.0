Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1291.1643926871853597453
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 14:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wBBu/XwK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: hnagalla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 213MLABe080467
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Feb 2022 16:21:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643926870;
	bh=7yz/857NFAUXoK/yYGIMif9T4b/Kp7As/yhVUwv7ulA=;
	h=From:To:CC:Subject:Date;
	b=wBBu/XwKBjA9OzGGY1JslY4InD2+9s54clUgCyV0++dJ7trRdHNfQHpglw5lOiDWL
	 7DHEhu+GkcJwLdMMxSADqLHLSuJXNnCNS+6zjiueXLYp2MfIChtxHt6gWF7kwGWP1N
	 XvZVgE2dCCLOvwBarAOJecZROVTjfj5cYPegq4eQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 213MLAIM112430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Feb 2022 16:21:10 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Feb 2022 16:21:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Feb 2022 16:21:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 213ML9p2033882;
	Thu, 3 Feb 2022 16:21:09 -0600
From: "Hari Nagalla" <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <yogeshs@ti.com>, <hnagalla@ti.com>
Subject: [meta-ti] [dunfell-next/master PATCH] ipc: ti-rpmsg-char: Update library to 0.4.0
Date: Thu, 3 Feb 2022 16:21:07 -0600
Message-ID: <20220203222107.2950-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the ti-rpmsg-char library to 0.4.0 version that enables the
support for j721s2 SoC family remote processors.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
index eaf0028d..dc98fbb5 100644
--- a/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.3.1 release
-SRCREV = "0824546f61bda7715519841d9b9f0fb030ddfaf2"
+# Initial 0.4.0 release
+SRCREV = "92b464f1e7477f77e44ae18d87b3d369576d662e"
 
-PV = "0.3.1+git${SRCPV}"
+PV = "0.4.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

