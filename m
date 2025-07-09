Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D196C83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:07:07 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.6663.1752091622835257856
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 13:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jQ4biOA4;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569K717r915150;
	Wed, 9 Jul 2025 15:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752091621; i=@ti.com;
	bh=yZoUEKYZHAxjQROp9iZ30DIXHyjKjPYyzyt8L73GcPU=;
	h=From:To:Subject:Date;
	b=jQ4biOA4fHfj5L2HE9I8e04pVyHRYZyJqrOVltbgayi3Nwubxm/gX3fh9YQzHvfyH
	 BP8Z6gE7AbpzR3Ef3UBfXsvY//72kVMBVJT8suEtDcxkhm5dqtcj5zcS11Bt2ZDaRH
	 +Aky2fQ8M2sZbQpWFQ88YpsGTys2KOsC17NotWcU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569K71Wx2769204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 15:07:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 15:07:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 15:07:01 -0500
Received: from fllvdckhpci035.itg.ti.com (fllvdckhpci035.itg.ti.com [10.64.72.49])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569K70vK344239;
	Wed, 9 Jul 2025 15:07:00 -0500
Received: by fllvdckhpci035.itg.ti.com (Postfix, from userid 60899)
	id B6D1112B24D; Wed,  9 Jul 2025 15:07:00 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2025.07
Date: Wed, 9 Jul 2025 15:07:00 -0500
Message-ID: <20250709200700.3763504-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Jul 2025 20:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18768

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index ba7a6e8d..d27ca9e5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2025.04"
+PV = "2025.07"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
-SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
-- 
2.43.5


