Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.751.1585870061000047472
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 16:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ruO8bmg0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sam.nelson@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032NRe54094259
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585870060;
	bh=t2tbD7N+C4mafa/0kkPPe6Dnaq1SW6JsevcuVz5/csE=;
	h=From:To:CC:Subject:Date;
	b=ruO8bmg0GiszvQXtgIHqJeFjBIX9/IPEL8O0hFjchZAid6tafNRF9PR35mPQJivq/
	 HVmNFnJh4xO3O/6CV8CowHkHEQ1gchwPkkjgzzavL+XfFEEmA4Ga/NgtHQaiqvcD1I
	 4uDPgCtXNc0m1Cyxx8Dps7oUzHlo7SKDAF6xhCF0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 032NReei052480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 18:27:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 18:27:39 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032NRdMR100706;
	Thu, 2 Apr 2020 18:27:39 -0500
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud][PATCH 1/3] common-csl-ip: bump SRCREV to latest version
Date: Thu, 2 Apr 2020 19:27:34 -0400
Message-ID: <1585870056-13775-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index e728dba..f963d6e 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
-PV = "03.03.00.16B"
+PV = "03.03.00.17"
 INC_PR = "r0"
 PE = "1"
 
@@ -14,7 +14,7 @@ CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
 # Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.16B"
-CSL_SRCREV = "8a2d724e8ef850c32a7ba8e12f729ce611171469"
+CSL_SRCREV = "6ce8be997938d8ad73ccbf5de5932ba921bfdfb0"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
1.9.1

