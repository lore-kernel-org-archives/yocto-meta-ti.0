Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.4859.1609918074805753762
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jan 2021 23:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wK2Qui7W;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1067RsOe017260
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609918074;
	bh=D6klRnbm3PHKNuWAQeM+mhTfWOEZ8JN1q1nJ4gdI9Dw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wK2Qui7Wi+MUZ2thQseBYEEhG4FCwdIzlaPfW4Z+I0kTHSl5/Izk7SJaPABc7f2hN
	 mVDoGEBPzDoB+jIoBygAKV8fDmULaAOaBeOWX5inJg18H30Pq0io1TdfYHZKhCabgx
	 z3F4kEfNIqCZGmMW0Kra9TDermizSVQMIWoTmVqs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1067Rs2E086250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Jan 2021 01:27:54 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 Jan
 2021 01:27:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 Jan 2021 01:27:53 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1067Rho1037873;
	Wed, 6 Jan 2021 01:27:52 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master] [PATCH 4/4] pruprp-fw: Update prp firmware to 2.17.25
Date: Wed, 6 Jan 2021 12:57:43 +0530
Message-ID: <20210106072743.23873-5-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106072743.23873-1-lokeshvutla@ti.com>
References: <20210106072743.23873-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update prueth prp firmware to 2.17.25

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../pruprp-fw/{pruprp-fw_2.16.24.bb => pruprp-fw_2.17.25.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_2.16.24.bb => pruprp-fw_2.17.25.bb} (94%)

diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
similarity index 94%
rename from recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb
rename to recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 56d8a576..e71bc00a 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_2.16.24.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "48e2c46ff62d796345b6587be58f88f0e608addc"
+SRCREV = "0038ff0ecda8dae83c65d454c85776c6a4ef8e63"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.30.0

