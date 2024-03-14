Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B848C54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:29:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15887.1710430147184528790
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GAUh9pm/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT6vG019469
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710430146;
	bh=LR4Vz0Feh67s4xDCtWvDCWw55HgHHovghygCU6B2d+8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GAUh9pm/ebtdKp+gpXyvkAIug8dX5aGF+pIInrGxmnHrGmuTe1TUzRZrDIDUF+NR/
	 eZMRtHqM+9gYD/fb06hXg1J1IFAWQuZZuZPeauQV6chd2bmqAwpco2ND7mPZm31SU0
	 yK3Fjl/zsypYYZcu45o5kpyyMntvVVMoGczYDeFY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EFT6uA121954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 10:29:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 10:29:06 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT2O6081019;
	Thu, 14 Mar 2024 10:29:04 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <n-francis@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/2] conf: machine: j721e: Add support for HSSE2.0 and HSFS1.1
Date: Thu, 14 Mar 2024 20:58:54 +0530
Message-ID: <20240314152855.499510-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314152855.499510-1-a-limaye@ti.com>
References: <20240314152855.499510-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17528

Latest ti-u-boot will be supporting HSSE2.0 and HSFS1.1 versions of the
j721e soc through the binman dts nodes. Add support in yocto to package
the created binaries in the wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j721e.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 92235527..6040feb0 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -12,14 +12,22 @@ IMAGE_BOOT_FILES += "sysfw.itb"
 IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
 
-# Since default on J721e is for GP, add a version for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
+# Since default on J721e is for GP, add a version for SR1.1 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-fs-evm.itb"
 
-# Since default on J721e is for GP, add a version for HS-SE
+# Since default on J721e is for GP, add a version for SR1.1 HS-SE
 IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
 IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"
 
+# Since default on J721e is for GP, add a version for SR2.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
+
+# Since default on J721e is for GP, add a version for SR2.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-evm.bin"
+IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-evm.itb"
+
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
-- 
2.34.1


