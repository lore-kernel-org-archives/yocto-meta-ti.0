Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1412.1602612016730772039
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 11:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nuGS29PP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DI0FlQ076466
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 13:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602612015;
	bh=30hLkzU6xdAd04+RK0ulT4eUrbz4NR6L/8TctXIQLZM=;
	h=From:To:CC:Subject:Date;
	b=nuGS29PPt5B3gyaRR6Rqk/hh6gt3D2M/FPstqUBfZdN2/RxOJfxSdrWV1wi/lsXLV
	 WXhc2uP+Vo35H+b2SB1J1TF5R5LPuXVF1WOIyy/lpIxkxSAbedYHnXikrxI0z7XVJW
	 hoVTcraBt8l9C7k5toCAf4PstVR3g/TSzkNtxePY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DI0FC7036856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 13:00:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 13:00:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 13:00:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DI0FeZ110009;
	Tue, 13 Oct 2020 13:00:15 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: Update kernel to 5.4.70
Date: Tue, 13 Oct 2020 13:00:14 -0500
Message-ID: <20201013180014.27373-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index c02e3b50c2aa..5127d372fc18 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "ed5007e8489c355b5baeddeae5cf53f7882acee7"
-PV = "5.4.69+git${SRCPV}"
+SRCREV = "a5dca123aec8168af717956d3b1896a33989313c"
+PV = "5.4.70+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 2b4557d9b601..9df51c5b17ea 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,8 +60,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "f85baf8e2e6374594eb76d4c14ada9d62a2fa98b"
-PV = "5.4.69+git${SRCPV}"
+SRCREV = "cbeb88bfa96152c2b974a18ad14e84fa9f466f2f"
+PV = "5.4.70+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.28.0.585.ge1cfff676549

