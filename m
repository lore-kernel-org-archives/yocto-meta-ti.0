Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3568.1626423424173008258
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 01:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YVDz3YzU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16G8H3mv018683
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Jul 2021 03:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626423423;
	bh=yylWDKsvecJE1hpquJedKmKybZ2IGSwFQ1bTWrj3ae0=;
	h=From:To:CC:Subject:Date;
	b=YVDz3YzUkOlaek57UQOnSojRvUCpo98SXecz/P7RAdx0zWkPhO34tzFqtLS1VUFXS
	 XYItJZZjqbxV0Zp7YijJck79oiB3BShJ0P3L0bUrUqJKFp3fa5ifElNpnxG+11Xh1J
	 sUAJ0iAUSDBHuIvQqd43zoEz0tp3ro2d6Raa2L6A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16G8H2OL061695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Jul 2021 03:17:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 03:17:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 03:17:02 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16G8GxaU101524;
	Fri, 16 Jul 2021 03:17:01 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [meta-ti PATCH] prueth-fw-am65x-sr2: Update firmware to 02.02.09.03
Date: Fri, 16 Jul 2021 13:46:57 +0530
Message-ID: <20210716081657.11493-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Vignesh Raghavedra <vigneshr@ti.com>

Update AM65x SR2.0 prueth firmware to 02.02.09.03 that adds support for
100M HD mode.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 9ab40536..67e8cd07 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "02.02.09.02"
+PV = "02.02.09.03"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "c0bbbc44fee68f2a3eba1ca98c340e34e759624d"
+SRCREV = "f3d2c7cafc906adc9a2f4543aa2fee556483545d"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.32.0

