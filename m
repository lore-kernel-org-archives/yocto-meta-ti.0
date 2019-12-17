Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.634.1576599011695235974
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 08:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KNC7o2dY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-stiffler@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHGAAUf003939
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576599010;
	bh=59xrypICoew23P54Y2DCMYqFHDqX3q8Z0dkpYGM2fWA=;
	h=From:To:CC:Subject:Date;
	b=KNC7o2dYQeB1KvtuWAvlJNh145ql7YnT82DA/U1bcezagXWNSAjO5zDJj8EKxs/QD
	 2yEdkve5jdPRy25sbZqarw0epXe+hvempUlV3wfsiN+Id2nLeFb7r4iVzw1NHXTE8P
	 6smk/d6LdaDOhG18g9+3IFb0LEaQ2zMVRpueGqZU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHGAAnf022450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 10:10:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 10:10:09 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHGA8pG104114;
	Tue, 17 Dec 2019 10:10:09 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud/ti2019.05][PATCH 1/3] common-csl-ip: bump SRCREV for Processor SDK 6.2
Date: Tue, 17 Dec 2019 10:51:02 -0500
Message-ID: <1576597865-9349-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index da351bb..e728dba 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -14,7 +14,7 @@ CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
 # Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.16B"
-CSL_SRCREV = "f2003620af8e9e6296d3d87028519895394a1913"
+CSL_SRCREV = "8a2d724e8ef850c32a7ba8e12f729ce611171469"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
2.7.4

