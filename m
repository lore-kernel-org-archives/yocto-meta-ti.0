Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.596.1580495202887716397
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 10:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cGfWwebB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VIQfMn090268
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 12:26:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580495201;
	bh=oB0f2GNOI2XiKRWSf8MlXKCKrYscOv04q3u9M8ZVXlU=;
	h=From:To:CC:Subject:Date;
	b=cGfWwebBt6daRRojz/2WJTDb4Inv8yLh8yLjdD49b/DQwK/t9uxI31e49iUeW+iV/
	 fwcsHo3mRqdJR8uYas8Bdj/D4loSeBKSEPWC7jCpqQpr+SNEzAD6/xk9ftbS7nvFzq
	 b2y0J9NLjuZ322zOsUK7EZgvy1M9wnmGpm7ksHbo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VIQf46050080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 12:26:41 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 12:26:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 12:26:41 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VIQeqY069650;
	Fri, 31 Jan 2020 12:26:41 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH] cpsw9g-eth-fw: update to 6.2 to work with latest SYSFW 2019.12 APIs
Date: Fri, 31 Jan 2020 18:06:20 +0000
Message-ID: <20200131180620.6808-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index ab34e667..cbd71f2d 100644
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "R5 PSDK CPSW9G Ethernet Switch Firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
 
-PV = "1.0+git${SRCPV}"
+PV = "6.2+git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "792c06d9a0f2b9d4b150bce4651bdaae2413b28d"
+SRCREV = "4da71504488450f34d65459c1de949da1f984471"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.17.1

