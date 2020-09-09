Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12666.1599655625657233013
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 05:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mIZ0iWGX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089Cl5E5036765
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599655625;
	bh=CZEU+nkLd54RXgki1Lm3h/nJD8B6tCMJw6lyt825qp0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mIZ0iWGXcXl7GFBxWovcmGQFzpMVxO4cRacP4DVYr5ftPqWYpcBelCJym6lTuNymm
	 mMrMQT3p5ZryO2tKaTDpDqmgvAwxV2lzTHUhxqc2hnGXDD5sUc0mGcfJCtAwP/ILx3
	 FfrMwK51Ck2CT0fJyul/mZk/7Ty7aSnXjwEZvizk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089Cl43D008320
	for <meta-ti@lists.yoctoproject.org>; Wed, 9 Sep 2020 07:47:04 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 07:47:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 07:47:03 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089CktQl038779;
	Wed, 9 Sep 2020 07:47:01 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 3/3] prueth-prp: Update the firmware to 2.16.24 version
Date: Wed, 9 Sep 2020 18:16:55 +0530
Message-ID: <20200909124655.12671-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200909124655.12671-1-lokeshvutla@ti.com>
References: <20200909124655.12671-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the prueth prp firmware to 2.16.24 version.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../pruprp-fw/{pruprp-fw_2.15.23.bb => pruprp-fw_2.16.24.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_2.15.23.bb => pruprp-fw_2.16.24.bb} (94%)

diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb
similarity index 94%
rename from recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
rename to recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb
index da381eb0..56d8a576 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
+SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.23.0

