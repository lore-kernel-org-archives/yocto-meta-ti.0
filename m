Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2814.1618463468320659779
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 22:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yEDrmkzi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B6tm026601;
	Thu, 15 Apr 2021 00:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618463466;
	bh=K09S5j4Iwel/421c/d09pkz1zmZS5/71swV60tEAA2M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yEDrmkziVD2MeJb6J3Kzz3liuhCk+CyZnE4bIFNFcC2KNewf9VR4kHGmgWv3gwfRX
	 qZj0CfMd/Z6RMxaaoaxA1K4FtYTeZc02OMM4jOLbfSBCeTKanAYsJHpIX3yUbiHrqJ
	 KMCR+pOVIhc087j7W0XpvuWTSRxp8pwW2ifUeKcQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13F5B67Q116487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 00:11:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 00:11:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:11:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13F5B6Bf116183;
	Thu, 15 Apr 2021 00:11:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/6] Revert "conf: j7-evm: Add jailhouse dtbo"
Date: Thu, 15 Apr 2021 00:11:00 -0500
Message-ID: <20210415051105.1626-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415051105.1626-1-praneeth@ti.com>
References: <20210415051105.1626-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit 47cca9560d3464a67ed725ab573e8b976a3367c4.

Reverting for now, as the support for this overlay is not yet
present on ti-linux-5.10.y

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7-evm.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ee23207b..2620ec11 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -14,7 +14,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-pcie-backplane.dtbo \
-    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1

