Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.4323.1643857725161084913
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 19:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U6PfBzYi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21338hZN088742;
	Wed, 2 Feb 2022 21:08:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643857723;
	bh=kYTajKps1kEXEzbI0yCkmtgDD+FyH0Qde83PCtFoSIQ=;
	h=From:To:Subject:Date;
	b=U6PfBzYiMMyTYwqoDf0xT1ny17YpL8S3Dhstv/EQOGnWnBbxWKatdkWyQoL4ZIRow
	 U3dckeERK10EBJO9mLGaye/9Xa2jw4fKcsA7BLuj4a+7B2gzpK3u2rce/O6g5xWveb
	 QZq7ct3h4bp99oy2gvP9watVxLvPNKgVZGsSyzWU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21338h1X035493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 21:08:43 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 21:08:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 21:08:42 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21338gMZ106434;
	Wed, 2 Feb 2022 21:08:42 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFSUE-0005TH-I1; Wed, 02 Feb 2022 21:08:42 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] cnm-wave-fw: lock the compatiable machine to j721s2
Date: Wed, 2 Feb 2022 21:08:42 -0600
Message-ID: <20220203030842.20992-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The orignal recipe listed the compatible platforms to
all of j7, but at this time it is limited to j721s2.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 3dd0f4f4..0f09dbb6 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j721s2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 2a6302af..adcf967a 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -44,4 +44,4 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cnm-wave-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2 = " cnm-wave-fw"
-- 
2.17.1

