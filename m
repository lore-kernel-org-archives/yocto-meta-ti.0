Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D23C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 06:43:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3655.1716360234603693046
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 May 2024 23:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FUeOBXs0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: kamlesh@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44M6hrwD018891;
	Wed, 22 May 2024 01:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716360233;
	bh=pkDAb3la/FxeWnL9Ov90bmV6mjonGA89zg2o6Cjv7uo=;
	h=From:Date:Subject:To:CC;
	b=FUeOBXs0No1OPBd7uZP68Esj7c1u9gGSLJEXUNQz0vubNtxOAQA1GLfg9J5RCDc5C
	 x3ePMJEuFIDE7ZVxxIahS9kNr5We9u0yKDSGVNE8TXcUoh8l1zFmq7uHkj66HL5bYO
	 mBgeaTYoA/f+M4MMB4v7OWTvrCQHxoJ3BOr7VnoA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44M6hrqd005916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 01:43:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 01:43:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 01:43:53 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44M6hqHd124043;
	Wed, 22 May 2024 01:43:52 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
Date: Wed, 22 May 2024 12:13:25 +0530
Subject: [PATCH [Scarthgap/Master]] optee: Update to upstream 4.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com>
X-B4-Tracking: v=1; b=H4sIAAyUTWYC/zWNQQrDIBBFrxJm3aHRRii9Q1ddhiwmOlE3RhxbA
 iF3ryl0+Xj/8XcQLpEFHt0OhT9R4poaqEsHNlDyjNE1Bt3roTdaoXhcc2XGATW+s6PKqO5mccb
 Zm3I9tHImYZwLJRvOViyVGjxlTLzVc5ALL3H73Y4wvv7++iSpXCaYjuMLpDUGP5oAAAA=
To: <vigneshr@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Kamlesh Gurudasani <kamlesh@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716360231; l=2804;
 i=kamlesh@ti.com; s=20230614; h=from:subject:message-id;
 bh=rP7cPIZQ9RPA98u+BnS2WFS/o0XdKWscUAUUCCmtqpo=;
 b=erutqBtsix6a6pW49y1xE0sDaa8nkk0o30phgxMvEnfGX7TQ9lc4YZx95Fv8nVtayQ/I/Y6hl
 BPPxXRP0w4mBOGJ140bJweLxoaeurpTEF7QPZz+L+Ul8lyoPuZuNM9J
X-Developer-Key: i=kamlesh@ti.com; a=ed25519;
 pk=db9XKPVWDGJVqj2jDqgnPQd6uQf3GZ3oaQa4bq1odGo=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 06:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17665

Update all of the optee components to the upstream 4.2.0 version.

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | 5 ++---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 16fbd6c5..31d59be8 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.1.0+git"
-SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
+PV = "4.2.0+git${SRCPV}"
+SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 23cd7580..03e93c3c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git"
+PV = "4.2.0+git${SRCPV}"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 9db67567..bfafff3c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.1.0+git"
-SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
+PV = "4.2.0+git${SRCPV}"
+SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
 
 # Fixes for pointing to 4.0.0 before upstream meta-arm
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 16b2dfc3..a7d048f6 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,6 +1,5 @@
-PV = "4.1.0+git"
-SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
+PV = "4.2.0+git${SRCPV}"
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


