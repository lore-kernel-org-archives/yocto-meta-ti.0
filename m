Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8D5C25B79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:53:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5379.1716368018885088415
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 01:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yminUrDe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44M8rbhP045262;
	Wed, 22 May 2024 03:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716368017;
	bh=++RinBCIrU4fQ9/qHWBP7P1tBDK1I0cyqulv/C7yqEw=;
	h=From:Date:Subject:To:CC;
	b=yminUrDeo32x3Xne3/DJQkzC2a8Xryz9h0F5+hxBHLaQ6pfZTBZasBhtkPzVcj472
	 pLEorWXSQPkiGsgHs6dXw8TQNL+mIrW2T3ijDLibjnSdTcilgCXOmngY9x+7ZD2Xk3
	 c9oiLCFySNOwF9FMRxtgV4AagH0eQA7FB/+npWxU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44M8rbke089508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 03:53:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 03:53:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 03:53:37 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44M8raGD073938;
	Wed, 22 May 2024 03:53:36 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 22 May 2024 14:23:27 +0530
Subject: [PATCH v2] optee: Update to upstream 4.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-sg-optee-4-2-update-v2-1-122f3c4c0cf5@ti.com>
X-B4-Tracking: v=1; b=H4sIAIayTWYC/32OQQ6DIBREr2JY9zeCYk1X3qNxgfCVvygQoMbGe
 PeiB+jyTeZlZmcJI2Fiz2pnEVdK5F0BcauYtsotCGQKM1GLtpaCQ1rAh4wILQj4BKMyAu/lbKT
 RDTc1K+akEsIUldP2dJNWMdtFBXC45bMQIs60XbOvsbCllH38Xi9Wfqb/B1cOHGTbNH0nxaNTY
 sh01/7NxuM4fofwo+rUAAAA
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716368015; l=2928;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=mo/CDUEYC7oqTlaF4C9hkTPL2H54Uv+1J/KMuKAuwIw=;
 b=lMI04gjCrsz2/LSaJW0TKfa0dXxXzOPbkNoVocTS2bduezIr170vA1wd+5XjpYg9bepZfF4Sd
 ar8LGM7RPl4Ap2BtFU7IQq/T1u8qpjZwG9fxqjKMk2cJZIuYxEwRIIV
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 08:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17668

Update all of the optee components to the upstream 4.2.0 version.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Changes in v2:
- Subject tag change and removed SRCPV
- Link to v1: https://lore.kernel.org/r/20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | 5 ++---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 16fbd6c5..22a363f4 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.1.0+git"
-SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
+PV = "4.2.0+git"
+SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 23cd7580..2d7a95bd 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git"
+PV = "4.2.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 9db67567..cdb58689 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.1.0+git"
-SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
+PV = "4.2.0+git"
+SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
 
 # Fixes for pointing to 4.0.0 before upstream meta-arm
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 16b2dfc3..4993ab19 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,6 +1,5 @@
-PV = "4.1.0+git"
-SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
+PV = "4.2.0+git"
+SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
 
 # Fixes for pointing to 4.0.0 before upstream meta-arm
 SRC_URI:remove = "file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch"
-

---
base-commit: de73fc7fe4e81196d4e4ee9054bb805c967bb73e
change-id: 20240521-sg-optee-4-2-update-185fd5dc31d0

Best regards,
-- 
Kamlesh Gurudasani <kamlesh@ti.com>


