Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1565.1601923140255154704
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aKFlFKZd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IcxGe065366;
	Mon, 5 Oct 2020 13:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601923139;
	bh=UvZalYHwibW9AtmxzBdmRcqyobhs76lmnpmkFIulGoU=;
	h=From:To:CC:Subject:Date;
	b=aKFlFKZd5z5kchbmGOfDC0wk0ahypSx/7Rz2hjL9UyK+rjlDS38lFZK0z3boey/Xi
	 ihyvPuRuh7Ri9OVuMteUVwKgtItL5VD56GfzGoxhNFXkr/p3/H/2ZWF2o3+vexBlMY
	 2Sbbw4QJBhefSP6uyy66m1X++lYqwbhbpew8vef4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095Icxtn026247
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Oct 2020 13:38:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:38:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:38:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095IcwuV104056;
	Mon, 5 Oct 2020 13:38:59 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Dan Murphy via Lists.Yoctoproject.Org"
	<dmurphy=ti.com@lists.yoctoproject.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2] prueth-fw-am65x-sr2: Updating firmware to 02.02.07.02
Date: Mon, 5 Oct 2020 13:38:53 -0500
Message-ID: <20201005183853.17882-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "Dan Murphy via Lists.Yoctoproject.Org" <dmurphy=ti.com@lists.yoctoproject.org>

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 6e17c4aa5c7c..c66bee80d79c 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2.2.0.1+2.2.0.2-rc1"
+PV = "02.02.07.02"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
+SRCREV = "c911bcec682ef053a15f9c7d5867a0dd2da2632b"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.28.0.585.ge1cfff676549

