Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.12799.1599655619883619486
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 05:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GEmtE7Aa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: lokeshvutla@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089CkwK7109406
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599655618;
	bh=ZGtPr5DeU1pY8w1U9K9xRlvJ4fvvqpSMF5eqFPi9JCU=;
	h=From:To:CC:Subject:Date;
	b=GEmtE7AaDeKZo5l6J8lRC9JkpvcXyhxZKwzmt4ygMgHakw/LfklVc/lwMXHy1ysjJ
	 HyatIhFe9EQ+xjNEK72cW98OJL5Uo0KfDPLdGEkQgrRoFq6EI5GcIsi0IWziC8cMZ6
	 GltnT13CUVVfbrkeLf4qGgkrltKNL2wgtzxVhl+g=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089Ckwce007815
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:46:58 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 07:46:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 07:46:58 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089CktQj038779;
	Wed, 9 Sep 2020 07:46:56 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/3] prueth-fw: Update the firmware to 5.2.8 version
Date: Wed, 9 Sep 2020 18:16:53 +0530
Message-ID: <20200909124655.12671-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the prueth firmware to 5.2.8 version.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../prueth-fw/{prueth-fw_5.2.7.bb => prueth-fw_5.2.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prueth-fw/{prueth-fw_5.2.7.bb => prueth-fw_5.2.8.bb} (94%)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb b/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
similarity index 94%
rename from recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
rename to recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
index 2840b2f1..04a32dad 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_5.2.7.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_5.2.8.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
+SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.23.0

