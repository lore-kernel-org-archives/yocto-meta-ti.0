Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC14C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 16:56:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.13985.1744217808681606386
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 09:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GsdKRMyU;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539GulH4882068
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 11:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744217807; i=@ti.com;
	bh=PB1Wrf5f9Mdw6ekknZa1BXO0BUCCXACcI/WWozuQPmQ=;
	h=From:To:Subject:Date;
	b=GsdKRMyU+yhldlQLNOAtCAY6dwAaHwhE7RHddRTyDWRdAATVuRTQrVY3ddsdaGFB+
	 qPiYGCJNc8gr/20P3WvRZt/Xo1V8Zolfvq7b4UM2qlz2hya1z6aZahn6OWgvWqO1Lj
	 G6dqRsvGCOhELnPuJ9lLxaDMXL6UqQQfA5EgYbi8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539GulVg109848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 11:56:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 11:56:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 11:56:46 -0500
Received: from fllvdckhpci004.itg.ti.com (fllvdckhpci004.itg.ti.com [10.64.72.21])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539GukvQ093433;
	Wed, 9 Apr 2025 11:56:46 -0500
Received: by fllvdckhpci004.itg.ti.com (Postfix, from userid 60899)
	id 451432740; Wed,  9 Apr 2025 11:56:46 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202504090937
Date: Wed, 9 Apr 2025 11:56:46 -0500
Message-ID: <20250409165646.1425354-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Apr 2025 16:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18453

Updated the value(s) for:
  atf: SRCREV_tfa
  u-boot-ti-staging_2025.01: SRCREV
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=e7eeb7586fab6cd9e91d49d5b5ad68287d9bc8b6..cd91d73601810374d16a1f17505ab2e72e31f75d
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1ac80adecb8ebffa654be744e5e5f7343b0abf78..c85877d40f8e70e1e201eca2ae1648781f238a37

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 6d83eaa9..9541d605 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,7 +1,7 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
 PV = "2.12+git"
-SRCREV_tfa = "1fa9adf3de19ab6d6fe195173bd37379592d68f7"
+SRCREV_tfa = "b11beb2b6bd30b75c4bfb0e9925c0e72f16ca53f"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH = "ti-master"
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index c955d43a..10cdbcc1 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "e7eeb7586fab6cd9e91d49d5b5ad68287d9bc8b6"
+SRCREV = "cd91d73601810374d16a1f17505ab2e72e31f75d"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index b25284ea..3f5ccba0 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1ac80adecb8ebffa654be744e5e5f7343b0abf78"
+SRCREV ?= "c85877d40f8e70e1e201eca2ae1648781f238a37"
 PV = "6.12.17+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-- 
2.43.5


