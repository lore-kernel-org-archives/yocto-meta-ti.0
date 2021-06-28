Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12330.1624891705201087577
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 07:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J0mLrmjY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15SEmOxm062703
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 09:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624891704;
	bh=28VRVY41XrDwtxSdXwRp5qBSa5vjubOiZmxZo+vXZjQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J0mLrmjYtGK/9W4dJ/HiBy0J3QOber7DT6fECCcMms2XNS1G30s51NqWpA+cmxFv8
	 /wroXT+EjdakLiFSoXCwcr4kL1OIjk6lDL3tYp5qioo0esFhmBnoPql8u9RcpK16wp
	 wz/FwmBSfjWOFBzK+fn+8SCO0nv5x0o/c+lCiiVA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15SEmOF8027325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 09:48:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 09:48:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 09:48:24 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15SEmJep098110;
	Mon, 28 Jun 2021 09:48:22 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 2/2] prueth-fw: Update prueth dual emac firmware to 5.6.15
Date: Mon, 28 Jun 2021 20:18:05 +0530
Message-ID: <20210628144805.16996-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628144805.16996-1-vigneshr@ti.com>
References: <20210628144805.16996-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Lokesh Vutla <lokeshvutla@ti.com>

Update the Prueth Dual Emac firmware to 5.6.15 version

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../prueth-fw/{prueth-fw_5.5.13.bb => prueth-fw_5.6.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.5.13.bb => prueth-fw_5.6.15.bb} (94%)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
similarity index 94%
rename from recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb
rename to recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 9526abd4..c392673e 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.5.13.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
+SRCREV = "11fecaf08eeed27f2a834c9911edb8a5fb2a23b1"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.32.0

