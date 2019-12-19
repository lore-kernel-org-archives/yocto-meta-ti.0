Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1750.1576784177118011953
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 11:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VrvcWz4b;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-stiffler@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJJaG8d000868
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2019 13:36:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576784176;
	bh=pf6catVt1ijpla5ith6AUQz2O3NDP89/IvP1/1QWkNs=;
	h=From:To:CC:Subject:Date;
	b=VrvcWz4bIg3fqOVk5H/Ny+nBxwTui1UsbjRT/i4mPAHhqjx2sLTu+bkK17NBd9qHM
	 hoSCDcKCsDWWT1GIpiPe/BNxLL90Eu+vaJ8gMc3Y7lnu19bxOEfltgpRJ05O0CYxf6
	 P7vJpQosZupAAetAtALzWRs5jzPSStJIQrCDfwhA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJJaGNK048748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2019 13:36:16 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 13:36:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 13:36:16 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJJaEii009110;
	Thu, 19 Dec 2019 13:36:15 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud][PATCH] ti-pdk-fetch: bump SRCREV for minor fix
Date: Thu, 19 Dec 2019 14:17:10 -0500
Message-ID: <1576783030-8805-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

* dualemac: fix to drop PTP sync msgs from unknown master

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index e544f90..117e54f 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "db6617355928f9aed72bd3158ed86eea2fa81f35"
+TI_PDK_SRCREV ?= "2357d1436f1b2c3b5f1d0c9c94e045d33b63f3fe"
 
-TI_PDK_VERSION ?= "2019.12.1"
+TI_PDK_VERSION ?= "2019.12.2"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.7.4

