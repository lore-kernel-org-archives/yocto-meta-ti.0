Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.12107.1624891703414183035
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 07:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jJpPx2Ls;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15SEmMq9013010
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 09:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624891702;
	bh=l4Mj1uVcDtbEevcuevzxws5JhNtj9u2ZM9ZOIMNuFMA=;
	h=From:To:CC:Subject:Date;
	b=jJpPx2LsP1tcdDn/b0VpCrLY782sI3p5n4v5Z441aCqN0oideMdRBoJfmAZwMth76
	 HUQC2BkvUhvyvMv47MKM+uSxt5swcOqT1SSzJlTGPsmpCnsQGgkazTNOYI6v4T4v0R
	 B+aU1c1kzdd5p6tqpOzqQKvaCeb69XDDjQQVcGms=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15SEmM46089452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Jun 2021 09:48:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 09:48:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 09:48:22 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15SEmJeo098110;
	Mon, 28 Jun 2021 09:48:20 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/2] prusw-fw: Update switch firmwares to 3.2.9 version
Date: Mon, 28 Jun 2021 20:18:04 +0530
Message-ID: <20210628144805.16996-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Lokesh Vutla <lokeshvutla@ti.com>

Update prueth switch firmwares to 3.2.9 version

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.2.7.bb => prusw-fw_3.2.9.bb} (94%)

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
similarity index 94%
rename from recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
rename to recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 17de58c2..3f5ef7e7 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.2.7.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
+SRCREV = "dccfb2328354be2933a5a179b528ec8a18b92d3a"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.32.0

