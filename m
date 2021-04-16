Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.4939.1618549564494319717
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jh69Hf/d;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G563o7095372;
	Fri, 16 Apr 2021 00:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549563;
	bh=9ztQCE32jr70EWt5almRmyTEtst5CDpMSZo9z98aFv4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jh69Hf/dfmqpUin1jcRCfjuobGJMyWvAINgXq9g+FHB1ccBBqVHpErElry92SScMa
	 WPq3+iyradwrfukHXZ1TZc7uqcW1sBY+RT7S7fczwVLPVD0/u1TUpyMsHKByqCV/Dx
	 SNTydCJL7xFkNuGuku5GcLEfWOc0UAoNenABVHiM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G562uP077255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:03 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G561LX063515;
	Fri, 16 Apr 2021 00:06:02 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 1/6] conf: j7-evm: Remove unavailable dtb/o from 5.10 kernel
Date: Fri, 16 Apr 2021 00:05:55 -0500
Message-ID: <20210416050600.16593-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

The following dtb/o are not currently available in
ti-linux-5.10.y branch.

Removing for now, and shall be added back once they are
available in 5.10 kernel.

-    ti/k3-j721e-proc-board-tps65917.dtb
-    ti/k3-j721e-common-proc-board-infotainment.dtbo
-    ti/k3-j721e-pcie-backplane.dtbo
-    ti/k3-j721e-common-proc-board-jailhouse.dtbo

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7-evm.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ee23207b..1b99baeb 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,10 +11,6 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
-    ti/k3-j721e-proc-board-tps65917.dtb \
-    ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-pcie-backplane.dtbo \
-    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1

