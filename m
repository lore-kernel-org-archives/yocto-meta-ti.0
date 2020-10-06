Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9662.1601972595457854785
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 01:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Dmi/akLg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0968NEB1052796
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 03:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601972594;
	bh=4AE/U5CUuVy3cn5OEZkiVd/kSWucpPIJF1M3iukbxjU=;
	h=From:To:CC:Subject:Date;
	b=Dmi/akLggk0kCWEVIdROiKvJ2fH8+Tg03ROLEWrv0omfRss1WwaFLU0nSCtaRruHo
	 5FW2Vb/x49p9aGxt+/2GVFt56MWoFffnnp+u4eJnGQHZOo5ybPSlNdQ29lOaiYJWO5
	 RBAjZv18tH/TwX0AJRNR0egkfDZcX1NfOW4jmaos=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0968NEZV092221
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 03:23:14 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 03:23:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 03:23:13 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0968NBiA024150;
	Tue, 6 Oct 2020 03:23:12 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>,
        <dmurphy@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [dunfell/master PATCH] prueth-fw-am65x-sr2: update AM65 SR2.0 PRU ethernet firmware
Date: Tue, 6 Oct 2020 11:23:10 +0300
Message-ID: <20201006082310.5161-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.07.02

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 6e17c4aa..12fe2c6c 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2.2.0.1+2.2.0.2-rc1"
+PV = "2.2.7.2"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
+SRCREV = "c911bcec682ef053a15f9c7d5867a0dd2da2632b"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

