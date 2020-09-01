Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2588.1598984228649253535
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 11:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oELISPQp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081IH64a101356
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598984226;
	bh=2br+pgLPElCq8qmeOngEl3N7vB8QObU80Luo+grXXV0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oELISPQpqCdCW1ddgnVhN8WYEFtCaQvtUJdIU+3WKIh6QzdzfD1aCEgzGiXaL1MeO
	 eoK/nctRp1KKipbhfS/rqYiA0Gx/daLe8ra8LiJcgc4xNzDoO6FhggJj+EQNSc+pwk
	 8irJeA1IKi3HmEFoV5+PgU4G1BOsgQgQNpfAnns8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 081IH5Cj072081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 13:17:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 13:17:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081IH5oN095896;
	Tue, 1 Sep 2020 13:17:05 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/3] linux-ti-staging: Update to the tag 07.01.000.01 and rt kernel moves to 5.4.61
Date: Tue, 1 Sep 2020 13:16:25 -0500
Message-ID: <20200901181626.23308-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901181626.23308-1-dmurphy@ti.com>
References: <20200901181626.23308-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 4a914864f493..9c050d41bcb4 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "880e291bb8727a258e8f86a43ebebbdf946fe0c3"
-PV = "5.4.58+git${SRCPV}"
+SRCREV = "fdb06e15aaf440ec4a982e39a4925df082cb1997"
+PV = "5.4.61+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 2a35bf1d4650..97d11675bea2 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,7 +60,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "da26e63e96f403b7415fdf7e0b45eeaba63ddbe0"
+SRCREV = "d1b11ffdf0223db4c96202837af17234f118e69e"
 PV = "5.4.58+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.28.0

