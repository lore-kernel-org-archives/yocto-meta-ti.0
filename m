Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1673.1602010782498297094
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 11:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KLpaPImg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096IxfRs027316
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 13:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602010781;
	bh=FTtA2HZu8pEAi8+Y49B4RENo7w2EqOLHL9vwPgsNhyI=;
	h=From:To:CC:Subject:Date;
	b=KLpaPImgjWjfbdy/s6U80vvN5zKB/j3zSMyoi12X1NrFu8mbjmRx+Tq4c4q9+hX42
	 qcRGNej9lfCjpwR3n/5kQfqeTE7/Bn5bDdyJkWqi6JcwUgJxPXZ+smdnaBeul1+ELl
	 MzSveXUnBU+1vivA+9RZ0onPm/aXnBQzGSYQpfmY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096IxfuC081139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 13:59:41 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 13:59:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 13:59:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096Ixest003182;
	Tue, 6 Oct 2020 13:59:40 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] linux-ti-staging: Update to the tag 07.01.000.03
Date: Tue, 6 Oct 2020 13:59:34 -0500
Message-ID: <20201006185935.15462-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 869addc88aca..2b355142c348 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "fe1ab63ac9248a6fecb8572a0ad5dc51a79ac280"
+SRCREV = "6fc4965c280479c216a6c875f482502f1a8d4c14"
 PV = "5.4.66+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index bfba3d50b68e..84f1f3dde4f7 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,7 +60,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "eb0f4e6c05153446b62028ac84452101b8280253"
+SRCREV = "8129d7ff57cba2203914f87fe0a93d9a7a390257"
 PV = "5.4.66+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

