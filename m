Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.842.1644017272469619207
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 15:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d4ATbzh8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 214NRost125328;
	Fri, 4 Feb 2022 17:27:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644017270;
	bh=6UuscJC5pqyjme2q1tL7yiqNji8fo596smTglWz0BQk=;
	h=From:To:Subject:Date;
	b=d4ATbzh8/MNW0LtYYz8pAC7jQ2rk3PHJZouV/41Z+woXWHHC2ifRpS3hUpDwNFhWr
	 bS07y3FaHz67kYRigQ4og5He6LpYH8x6Soqg5EAqmAkkD82OXhl0WeraRYEi+r03Gw
	 XstB+xCIaxUq7RCJrDRf7JPhITFfClbOf1CI2QYg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 214NRokf027472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Feb 2022 17:27:50 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Feb 2022 17:27:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Feb 2022 17:27:50 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 214NRoU2037134;
	Fri, 4 Feb 2022 17:27:50 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nG7zZ-0002uj-QZ; Fri, 04 Feb 2022 17:27:49 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] cnm-wave-fw: lock the compatiable machine to j721s2-evm
Date: Fri, 4 Feb 2022 17:27:49 -0600
Message-ID: <20220204232749.11161-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The original recipe listed the compatible platforms to
all of j7, but at this time it is limited to j721s2-evm.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 3dd0f4f4..28f3440e 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -13,7 +13,7 @@ PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j721s2-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 2a6302af..522d9674 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -44,4 +44,4 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cnm-wave-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
-- 
2.17.1

