Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.11297.1636693781431862407
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 21:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lBN21Z+y;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AC59d1q014516;
	Thu, 11 Nov 2021 23:09:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636693779;
	bh=xGKLYOS+TwhrGBMbfK8WQb8D92BhL6V1gB+H5UFuSz4=;
	h=From:To:Subject:Date;
	b=lBN21Z+yPmsqc/cUR30/lVmp5OKs/l+JhusLSEhpln07ZYUcTSEwVKbfg/UVGpIeH
	 aPkijwZm3h5pn1MvZPqjknsjZzjifn+0G4wtl+6H6qkEbwIaDAA/auXeNw7Lbu/GDX
	 GLBo5niUuz61N6rsn904d8eIK7jIKhr0QE/aDBMU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AC59dWk130141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Nov 2021 23:09:39 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 11
 Nov 2021 23:09:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 11 Nov 2021 23:09:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AC59dGc002432;
	Thu, 11 Nov 2021 23:09:39 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] u-boot-ti-staging: Bump u-boot version for 08.01.00.003
Date: Fri, 12 Nov 2021 05:09:37 +0000
Message-ID: <20211112050939.35983-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

u-boot bump for 08.01.00.003 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 6765572a..b5aa3fb7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r13"
+PR = "r14"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "377e0f7041d1863bf9b3d23e90fb4b0c0a2cd6bf"
+SRCREV = "6c804a1af10bda322c86ce1c5dbb29f0fbb56c79"
-- 
2.17.1

