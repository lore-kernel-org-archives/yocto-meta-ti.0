Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13719.1644002104816919747
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 11:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cHYAiHSO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 214JEpcU002535;
	Fri, 4 Feb 2022 13:14:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644002091;
	bh=crD8sitvzs6cFAgh+R0uFyjz3sMJL0pYfRWxeUouMqE=;
	h=From:To:CC:Subject:Date;
	b=cHYAiHSOjm0kkZeRKl03NTlWqg075GMwXESdRFDBMup7iCELMotsOXGdc4yMiqIbE
	 98eq64TFhTD7D8MNbmhSz0WMR3wiklG1m6lpJfHEzG2m2zUdrvAMxhJacghyOp4Rm5
	 0DJDE/w5r8s49bQsd4j4mp5DKOj7cHCxUkKmOal0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 214JEp3r071259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Feb 2022 13:14:51 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Feb 2022 13:14:51 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Feb 2022 13:14:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 214JEpoa040538;
	Fri, 4 Feb 2022 13:14:51 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Denys Dmytriyenko <denis@denix.org>
CC: Roger Quadros <rogerq@kernel.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell/master PATCH] u-boot-ti: Support binman image generation
Date: Fri, 4 Feb 2022 13:14:51 -0600
Message-ID: <20220204191451.1642-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Roger Quadros <rogerq@kernel.org>

We are now using binman to generate the images for
K3 AM64 in u-boot.

tools/binman/binman needs python3-setuptools so add it to
DEPENDS.

Reported-by: Praneeth Bajjuri <praneeth@ti.com>
Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index aceabe86..7ed6c5b4 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -31,7 +31,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 PV_append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
+DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
-- 
2.17.1

