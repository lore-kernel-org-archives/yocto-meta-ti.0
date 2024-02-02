Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1542C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 03:45:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15555.1706845532290959718
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 19:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RJOcV1yQ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.142, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4123jUDV081119;
	Thu, 1 Feb 2024 21:45:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706845530; i=@ti.com;
	bh=T3gNmO6ocbl6ZDvtV7e0dWQ+Aby5LpVl4JjkKHT/UWI=;
	h=From:To:Subject:Date;
	b=RJOcV1yQuQRtOVZ+DSTcf9ZKMWFQOQWWjYx+1vsBf1VzWnwsANQy6lW+NCOmExtE0
	 RfQb9uLBZZH+t2nnAloROoUhxmjTHM9/PIuwvPZHZ4CJ4EfcYJwKv1+E+wl9nsMIyj
	 qSt9EyqzBpSUCRxrswvf1Qencwjs8WRyQMUanchM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4123jUOX012240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 21:45:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 21:45:30 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 21:45:30 -0600
Received: from fllvdckhpci039.itg.ti.com (fllvdckhpci039.itg.ti.com [10.248.132.250])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4123jUa4118782;
	Thu, 1 Feb 2024 21:45:30 -0600
Received: by fllvdckhpci039.itg.ti.com (Postfix, from userid 60899)
	id 25CAD1134DBD; Thu,  1 Feb 2024 21:45:30 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH] CI/CD Auto-Merger: cicd.kirkstone.202402011419
Date: Thu, 1 Feb 2024 21:45:30 -0600
Message-ID: <1706845530-88005-1-git-send-email-lcpdbld@list.ti.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Feb 2024 03:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17436

Updated the value(s) for:
  u-boot-ti-staging_2023.04: SRCREV
  linux-ti-staging_6.1: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 00617ea..2f111f3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2023.04"
 
-SRCREV = "8e29cc8dec2dda343e4751d917e14a2962d081d5"
+SRCREV = "40cc7d7e0382cece400e74b4972e998ffa03c74d"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index e2ccfc0..3cce5b8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV ?= "78d2216bc679e98b7edb07ffabddb6d0337b5fcb"
+SRCREV ?= "f98180658f0879f350e9dc17855dd452134fdbcb"
 PV = "6.1.69+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.8.3.1


