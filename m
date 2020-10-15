Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10409.1602762955115206560
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 04:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fSyVP4oS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09FBtsFc082478
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2020 06:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602762954;
	bh=YWi3uOGAcXb+rP2PFO+3rgksr7C0CgDLLqkYdFbz830=;
	h=From:To:CC:Subject:Date;
	b=fSyVP4oSRj2xkkKRkPK+dxXJNTYXDyRD4+5QqLocZl0DienxknDpCAyxmIKyOouap
	 3X3msIcjJKC6UW9snK50j3GbZjA77nxe5a2TRV6FzCAfYsrzNKYFRrJRxfGy5qZxSZ
	 muuRpNPwy1VFRP18NYOE6tk4qZUHEZmC5Corv1yc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09FBtsux013175
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2020 06:55:54 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 15
 Oct 2020 06:55:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 15 Oct 2020 06:55:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09FBtrQU099581;
	Thu, 15 Oct 2020 06:55:53 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] prusw-fw: Update the firmware to 3.1.6 version
Date: Thu, 15 Oct 2020 06:55:48 -0500
Message-ID: <20201015115548.21626-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} (93%)

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
similarity index 93%
rename from recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
rename to recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
index b8897e4bb25b..684e77460021 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PR = "r0"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
+SRCREV = "f95d048c0a007a5acac706edea4a3ffbfa8ca933"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.28.0.585.ge1cfff676549

