Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17241.1600955085930313479
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 06:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NQ00L36k;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08ODij53126064
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2020 08:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600955085;
	bh=bY43SRdtoy32UpSocSC1KUCCuuwUXSzfMlWAPkkYcIE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NQ00L36k+2L91ChzK2pDr6YIqDVJFJJMrnJ8RekduHq7LXYYq5s6Nsi6doPFfUaMI
	 UKb0tXYBXfSrTQzUbTT85WlI9pBZ12UfRdGZk/VEK+6pUtiFlUs96l53MZDYLbEqeo
	 6XWmwLd08ca90oGjM/R7CJFyc68K8lPhoTyFzgso=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ODijNf007856
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2020 08:44:45 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 08:44:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 08:44:45 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ODif8w021738;
	Thu, 24 Sep 2020 08:44:43 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <dmurphy@ti.com>,
        Roger Quadros
	<rogerq@ti.com>
Subject: [meti-ti][dunfell][PATCH] prueth-fw-am65x-sr2: update AM65 SR2.0 PRU ethernet firmware
Date: Thu, 24 Sep 2020 16:44:40 +0300
Message-ID: <20200924134440.18133-2-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924134440.18133-1-rogerq@ti.com>
References: <20200924134440.18133-1-rogerq@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.04.02

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 6e17c4aa..734ca9c1 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
+SRCREV = "80a55e27024ad52433509e056e70e0e767a56038"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

