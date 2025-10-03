Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0D7CCA470
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 03:23:17 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5847.1759461792216702543
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 20:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eiuGrmIp;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5933NAic2958968;
	Thu, 2 Oct 2025 22:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759461790; i=@ti.com;
	bh=5wmzHSBelEFHd/fqnbz6/e/QwApci3AoAd35upRMWIE=;
	h=From:To:Subject:Date;
	b=eiuGrmIpemxiGErncM/1MtMNH3rJ2McqGyEnlaRX5x3gMj/6x/FXHsk64acg5d8l+
	 QHaRAAVLvAQ2MIvAwmLZeQzkkhZR7cuG3NIFXSaqXbucmgVvOF2404rRs16D75Xw82
	 HGRplh+lxcOJSnXPZSZkBuoTrhK5pHf/gbOZDcjo=
Received: from DFLE211.ent.ti.com (dfle211.ent.ti.com [10.64.6.69])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5933NAVn888822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 22:23:10 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 22:23:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 22:23:10 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5933NA382790309;
	Thu, 2 Oct 2025 22:23:10 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id EE5C62A43; Thu,  2 Oct 2025 22:23:09 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
Date: Thu, 2 Oct 2025 22:23:09 -0500
Message-ID: <20251003032309.860778-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Oct 2025 03:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19102

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=c779c758475cb98e95d3c05744e0dcbca5fc9991..89f0c688f7d4c2a1b957b00429b71f29f2562f63
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=3a3f87d0bf70131af74a85336c2785d933732825..9d15ddf0f6fa1f2c5cebeb70e993523821e5086c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index be42b27a..ae5ba0cc 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "c779c758475cb98e95d3c05744e0dcbca5fc9991"
+SRCREV_uboot = "89f0c688f7d4c2a1b957b00429b71f29f2562f63"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 295b97c5..77e83030 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "3a3f87d0bf70131af74a85336c2785d933732825"
+SRCREV ?= "9d15ddf0f6fa1f2c5cebeb70e993523821e5086c"
 PV = "6.12.43+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


