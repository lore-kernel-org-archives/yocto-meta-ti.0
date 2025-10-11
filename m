Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99326CCD183
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 04:23:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.5204.1760156617004749822
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 21:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YKpnZp4K;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B4NZ9A457911;
	Fri, 10 Oct 2025 23:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760156615; i=@ti.com;
	bh=1ZVJNBmocgqvzpSmlEo9owW2ON4MRWRsnGldjXZ3S7c=;
	h=From:To:Subject:Date;
	b=YKpnZp4KtEEhq6yUOv1VME+vgaZeiQSt8lN/aaoFL0LNvM8UttV2EfOwsO1u/N5pu
	 oqeLEg2WtRJ66CQpJh1zW7dyaaYg2af60HGvgXVGdjSGujaM1lQVMkm1TE0jZYOg+u
	 hnuo3xotXGZpLai0uZ7gxRH/WKVEuFeVwd39L+rE=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B4NZt31538076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 23:23:35 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 23:23:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 23:23:35 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B4NZZU2662730;
	Fri, 10 Oct 2025 23:23:35 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id 58CD912B24F; Fri, 10 Oct 2025 23:23:35 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.10
Date: Fri, 10 Oct 2025 23:23:35 -0500
Message-ID: <20251011042335.2017985-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 11 Oct 2025 04:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19114

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index bb51dca4..d2b34cd2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2025.07"
+PV = "2025.10"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
-SRCREV_uboot = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
+SRCREV_uboot = "e50b1e8715011def8aff1588081a2649a2c6cd47"
-- 
2.43.5


