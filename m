Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12646.1599655622211515282
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 05:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uKXpD49q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089Cl1Jc020014
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599655621;
	bh=dRk/dvVadhAUVMRiZjtl5SdJhLdqyV0fwA/z1KeyQrU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uKXpD49qYhKKgNM3o7mr4Hy3sM4AHrIuQGwhnl0D2B+D+8bcykzIrV7YzhrorouNw
	 YM/vIA3IxXSUFBadXch16qrCnVmgDZw9ZCEcXFVOmSNnL6fLU2azK/FWMyaMR/kOrP
	 qf9P4jxY1tWnZ4IQN2ESYzEfk7FusN968a4/0DFI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 089Cl1Xp077025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:47:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 07:47:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 07:47:01 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089CktQk038779;
	Wed, 9 Sep 2020 07:46:59 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 2/3] prueth-hsr: Update the firmware to 2.16.24 version
Date: Wed, 9 Sep 2020 18:16:54 +0530
Message-ID: <20200909124655.12671-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200909124655.12671-1-lokeshvutla@ti.com>
References: <20200909124655.12671-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the prueth hsr firmware to 2.16.24 version.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../pruhsr-fw/{pruhsr-fw_2.15.23.bb => pruhsr-fw_2.16.24.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_2.15.23.bb => pruhsr-fw_2.16.24.bb} (94%)

diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.16.24.bb
similarity index 94%
rename from recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
rename to recipes-bsp/pruhsr-fw/pruhsr-fw_2.16.24.bb
index 1434363f..9fea3530 100644
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.16.24.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
+SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.23.0

