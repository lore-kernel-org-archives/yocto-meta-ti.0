Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.24290.1594150703930980381
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 12:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pDWlYtH3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-karicheri2@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067JcMkd017170
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 14:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594150702;
	bh=Whu2tLv43HIVMSA9pS7H5ttiRwlJwBLcnt3B301cR7w=;
	h=From:To:Subject:Date;
	b=pDWlYtH3vzAsC4emv0ZzRG+mQQCxt2Ij4KYvd8fAYKpa+12KzDEVBAgiqYb6n0EtP
	 wlP+uklmOK6kNZDFUuxiLjIv9ATVtk/xMOvd3PfHKy3qvZ8kXuaLpSYKhFx5TiNj34
	 budtWGCeB0rU1xkm5ZpsvLc5oHb+4TbNthkmUut4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067JcMt9130920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 14:38:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 14:38:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 14:38:22 -0500
Received: from uda0868495.fios-router.home (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067JcMEl046225;
	Tue, 7 Jul 2020 14:38:22 -0500
From: "Murali" <m-karicheri2@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
Subject: [meta-ti PATCH] linux-ti-staging: Package PRU HSR, PRP firmware for AM3/AM4/AM57xx
Date: Tue, 7 Jul 2020 15:38:22 -0400
Message-ID: <20200707193822.26563-1-m-karicheri2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

AM3/4/5 PREUTH driver now supports HSR/PRP offload driver. So include
these firmwares for the required SoCs.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index bfcc7f5b9a92..806fc41f2b43 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -44,10 +44,10 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2e = " netcp-pa-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2l = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_k2g = " prueth-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
-- 
2.17.1

