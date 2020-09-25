Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2725.1601020283000483777
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 00:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oq/fQQUU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08P7pMuM079089
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601020282;
	bh=bY43SRdtoy32UpSocSC1KUCCuuwUXSzfMlWAPkkYcIE=;
	h=From:To:CC:Subject:Date;
	b=oq/fQQUUp7zkvtcEamc+iUS8MWKi+wg1O4FKEY5KW790QMmroe3yyChKBynwHlOjg
	 C78E7Rjxsnr0kRbSG4pAcumnfR902OSo681pD7f7Ro1+xXCub2yPPayLYGUAYS1EHz
	 D9xc9J3YmYkavOibG1QOdfNipX1/9OF3Hyo0VNFk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P7pMwo066567
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2020 02:51:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 25
 Sep 2020 02:51:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 25 Sep 2020 02:51:21 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08P7pKOx083146;
	Fri, 25 Sep 2020 02:51:20 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <dmurphy@ti.com>,
        Roger Quadros
	<rogerq@ti.com>
Subject: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
Date: Fri, 25 Sep 2020 10:51:18 +0300
Message-ID: <20200925075118.4861-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
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

