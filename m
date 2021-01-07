Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1550.1610046724470812520
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 11:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lm7RAXLN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JC3BT077123
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 13:12:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610046723;
	bh=nKTCVmnEJZHF9l/C/ZRzaSAMNQr7HxnTXt1DhVfYoVA=;
	h=From:To:CC:Subject:Date;
	b=lm7RAXLN9yWRIi4RNGEKH8Dk6LlWMjwSL8b6R7LyVaWfG1GXU4ta2WjBNMQ9k/exC
	 Dyfs9NGLmVeIP9p2c9xPmaHpKQ2LwoqeOzJnOvGb5MS2r56ez5B613S+zkeUAPfmtA
	 ip0UmR4/QAqYxIBHduQvot5nPzvs0gRG+gJzijSc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JC3mZ081532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 13:12:03 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 13:12:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 13:12:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JC3s8025748;
	Thu, 7 Jan 2021 13:12:03 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
Date: Thu, 7 Jan 2021 13:11:57 -0600
Message-ID: <20210107191157.22228-1-dmurphy@ti.com>
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
index a90585df7285..cc39bc784eaf 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "904b5cf29732392f897f575bbed8e1ba2686812f"
+SRCREV = "cfa321c18ddfc08dc4f4417c93fe607dadd9cdee"
 PV = "5.4.84+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 93b9b0871bbd..8d37dd48c911 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "771b7406ad06127f88d8f0d62341d4a40f73fbce"
+SRCREV = "7c35f0b11b13cfbc7af25c772c77bc24eef40204"
 PV = "5.4.84+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

