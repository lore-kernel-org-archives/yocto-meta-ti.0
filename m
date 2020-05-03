Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.18244.1588483574700166713
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 02 May 2020 22:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GnG4+V+x;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0435QD6o086730
	for <meta-ti@lists.yoctoproject.org>; Sun, 3 May 2020 00:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588483573;
	bh=kk3s5RimHUl3vmlnzm+o7cCPqal47Tp8zShnOtOsQaE=;
	h=From:To:CC:Subject:Date;
	b=GnG4+V+x5KRinSkBm8yCmyzewuDgmrTaoyesTv6filtyx0hZCnVbOxqDbCqvPjRze
	 /X8VChv2jlKTYyzc5KnLgz87SpZyvQESXXQUiHQ3TXu7VVKjkQqRfz2L0BRQE/VG2L
	 zI08ePxI/JEXjTSIr7Xo+EHrpG1bHq5zFNEOSNzM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0435QD2Z053982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 3 May 2020 00:26:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 00:26:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 3 May 2020 00:26:13 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0435QBgo093079;
	Sun, 3 May 2020 00:26:12 -0500
From: vigneshr@ti.com
To: <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [PATCH] linux-ti-staging: Package PRU switch firmware for AM57xx
Date: Sun, 3 May 2020 10:56:03 +0530
Message-ID: <20200503052603.2662-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

AM57xx PRUETH driver now support switch mode and needs prusw-fw to
support switch mode. Therefore include PRU switch firmware for AM57xx builds.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 020ac7e62adb..5035786fc537 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -44,8 +44,8 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
-- 
2.26.2

