Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.30513.1613967581418181488
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Feb 2021 20:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Rp4Jjm2t;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11M4JeLj006203
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613967580;
	bh=1UZRxabOc4zdabPQ8Q8AqNIPvy5T8kXyIs58jyZutp4=;
	h=From:To:CC:Subject:Date;
	b=Rp4Jjm2tfHVCyFjhx5JEpCsxa+N27QnZBxP0Sc5cBH35/2bbXXmv1u9R4KUbqN7R4
	 WknfdXYyrNkF/fChFBS76LlEJawvvJo9Ttu9qN9Rdmr1PjoxQ1taU3KYcCk7Xgzh7n
	 HkyrcEnMWmfZVUevC/Or2hm2mqaT3IZE7Lsu9HQ8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11M4JeRC007461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 21
 Feb 2021 22:19:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 21 Feb 2021 22:19:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11M4JdFf077325;
	Sun, 21 Feb 2021 22:19:39 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/3] ti-sci-fw: Update image gen to latest
Date: Sun, 21 Feb 2021 22:19:37 -0600
Message-ID: <20210222041939.14903-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update image get to latest

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 876d6b0d..cfe0fe66 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -7,7 +7,7 @@ PV = "2020.12a"
 
 SRCREV = "b66ee9ae020c31d7138f0af38518823bb4f5791e"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "8412cbddc19c75a2ab2711ae169c3818dc65e4ba"
+SRCREV_imggen = "d882ca2bfcef8a9f07eefe0edc231711f0df036f"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

