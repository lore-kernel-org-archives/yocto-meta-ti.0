Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.938.1582317305671963352
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 12:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GD5dSxm/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: angelabaker@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LKZ5IL034674
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:35:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582317305;
	bh=Q7A4bHTa1+KUGsNIJm9Lh76yx1yD98V6AqUMk4s1ags=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GD5dSxm/huy/RVTP54nSZ0hzWr+cgdTzFCsWoIwV3fsMxt++r89NPd8uOXKDiM+Jf
	 RfrSckQf7+nvCQndPx2dqUgK1A+ThZ7nP//qqX2tXSjMOxOL65XMhNI3mKMDat69WO
	 GlB48+18wc/dkWYyXv+HUeTYS9KQ/OekDNuWYWtc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LKZ4Xl006208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:35:05 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 14:35:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 14:35:04 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LKZ4bL079768;
	Fri, 21 Feb 2020 14:35:04 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01LKZ4p07004;
	Fri, 21 Feb 2020 14:35:04 -0600 (CST)
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][zeus][PATCH 2/3] common-csl-ip: bump SRCREV to align with PDK
Date: Fri, 21 Feb 2020 14:34:01 -0600
Message-ID: <1582317242-4035-2-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582317242-4035-1-git-send-email-angelabaker@ti.com>
References: <1582317242-4035-1-git-send-email-angelabaker@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index e728dba..a680298 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -14,7 +14,7 @@ CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
 # Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.16B"
-CSL_SRCREV = "8a2d724e8ef850c32a7ba8e12f729ce611171469"
+CSL_SRCREV = "8894e988f23f103f699411fa0aab4b4702d6c289"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
1.9.1

