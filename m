Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C430C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:07:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5533.1716368838661628078
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 02:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xoW9NiG3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: kamlesh@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44M97H2D047812;
	Wed, 22 May 2024 04:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716368837;
	bh=YRcd/5zoFBRjGg/6KIs/IBA49VL4qnROIOTyCSLS4mY=;
	h=From:Date:Subject:To:CC;
	b=xoW9NiG3D3AWbwww3NxWoPb+CCH3Antd1qI06yahadmDj6f5XNgMIvdsKuAWPxWre
	 V/DW2chflNVpEGHUGTdMe+/1KH1iCYyAy95knNqxC/iebAncMnSoOqde38Gt4seJVp
	 BAdKhD5ROAGuFJqTT2OPmBJ115psnnC4z1UrF9N8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44M97HYC096147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 04:07:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 04:07:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 04:07:16 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44M97GDQ098828;
	Wed, 22 May 2024 04:07:16 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 22 May 2024 14:37:14 +0530
Subject: [PATCH [meta-ti][Scarthgap/Master] v3] optee: Update to upstream
 4.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-sg-optee-4-2-update-v3-1-0295914196f9@ti.com>
X-B4-Tracking: v=1; b=H4sIAMG1TWYC/42OsY7CMBBEfwW5ZiFex4Co+AGqK6MUi71JXJBE9
 l6UE8q/n4kEJaIc6c2beajEMXBS581DRZ5CCkOfg9lulOuobxmCz1lhgWVhUUNqYRiFGUpA+B0
 9CYM+2cZb74z2hcrNGyWGW6Tedc9uchSla2mEnmd5AmPkJszrbKWqOwuBhLr6eYH7KyXhWKs6w
 11IMsS/9eKk18rHN5MGDbY05nSweDwQXiTs3HBfZRN+IcAs0IiNcaUrXGPfgmVZ/gFEb9BVMgE
 AAA==
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716368835; l=3140;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=J4IJ7NEmb1TO0WN41887+lHp5KGpc54soKpE3u6POLI=;
 b=W49MEPoOLdW74gsYXDWMPwYKjZIbmx+eTP40MUFZLyh7PZfKy85SZm4tJUd1bM+d2SHuzhwYu
 FS8UX2m8uAtARaMZ348NTEV0pMmyLLCgGoUGNVqfocJ5nuF6XHZUKq7
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 09:07:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17669

Update all of the optee components to the upstream 4.2.0 version.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
Current tag prefix is limitation with b4, let me know if it doesn't work.

Changes in v3:
- Subject tag change
- Link to v2: https://lore.kernel.org/r/20240521-sg-optee-4-2-update-v2-1-122f3c4c0cf5@ti.com

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


