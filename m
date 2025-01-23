Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14111C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 19:17:13 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.19616.1737659825102137068
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 11:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P0G8YORr;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NJH3R3431753
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 13:17:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737659823; i=@ti.com;
	bh=TKRKftQru/cXpsCBBwFhk92bT8LZn/dZvnDW88LKRqQ=;
	h=From:To:Subject:Date;
	b=P0G8YORrK9m/SaF+C7eob1WsTzf/p0V6remOLLwK/MtqXbo2HapizwHfCsOmPhlIQ
	 9KM5zlosfbh+pYbH/JGAKQgIQS/aaVvRs0bjXZsvuCn6+wAko5vb3jBXswYwsSNtS6
	 64gCPcVrjj4AjuFiE9zUU4WJae9wI58IDcghgkbg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NJH34W063492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 13:17:03 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 13:17:02 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 13:17:02 -0600
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NJH2YH080899;
	Thu, 23 Jan 2025 13:17:02 -0600
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id CD3B39E451; Thu, 23 Jan 2025 13:17:02 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.01
Date: Thu, 23 Jan 2025 13:17:02 -0600
Message-ID: <20250123191702.1362121-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2025 19:17:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18234

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index db89fd08..c58511f3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,10 +2,10 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2024.10"
+PV = "2025.01"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 
-SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
+SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
-- 
2.43.5


