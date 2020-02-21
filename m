Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.970.1582317290253726896
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 12:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bt7pDhgX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: angelabaker@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LKYn00034595
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:34:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582317289;
	bh=SoKk+DNB4e9wfPEs4E/HQRPRsoOh574PIEh+BOMSvPw=;
	h=From:To:CC:Subject:Date;
	b=bt7pDhgXwj9gDiVTckw+ZNuh/GDkuwafShxgfhZg+6B5LhumBeUzfHcX6N2qkRt/z
	 dj7yL36TZuIl0GiL3pnHUF8XV9AgnOpOF14Vc0NKgbFf50I0shkXL3SE0m66EqJFTh
	 FvN4kVoc8i//vPCA1JadK9Iz9yw7zcudCWQw4pyQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LKYnvd005656
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2020 14:34:49 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 14:34:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 14:34:49 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LKYmKT103743;
	Fri, 21 Feb 2020 14:34:49 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01LKYmp06989;
	Fri, 21 Feb 2020 14:34:48 -0600 (CST)
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][zeus][PATCH 1/3] ti-pdk-fetch: SRCREV udpate to 2020.2.20
Date: Fri, 21 Feb 2020 14:34:00 -0600
Message-ID: <1582317242-4035-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 2eaa5bd..bb57434 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "85ec43f6ba2eea2fc65d85c69e98124eb86cb898"
+TI_PDK_SRCREV ?= "4d15e4d2654c48f48b91d7aa52828d66ece2cc12"
 
-TI_PDK_VERSION ?= "2020.2.17"
+TI_PDK_VERSION ?= "2020.2.20"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
1.9.1

