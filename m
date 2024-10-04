Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E694CF8856
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 19:08:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2800.1728068907925280439
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 12:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=noWGzkXm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 494J8P3e116109;
	Fri, 4 Oct 2024 14:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728068905;
	bh=5joFogGhc1d6ZmbmP7FGruyOiR7etTQANYVIfOuN/uM=;
	h=From:To:Subject:Date;
	b=noWGzkXmgPTec4C2HS+KJw5nwud0lKqNqrXVx27C3JQppsdjLVMqgbeHIbb6+GSrw
	 e5fdqxNQ9BWyRy9+/7FhHlVgwlh30xDvyQZbrMXAxVCig0ynzcyLy8HZemzcqa3gda
	 UGKgpGTAWM5cCeKfs0hbNHxb5GARw4rNvR/2lNDw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 494J8PKA011113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Oct 2024 14:08:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Oct 2024 14:08:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Oct 2024 14:08:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 494J8Pm7057206;
	Fri, 4 Oct 2024 14:08:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1swnf7-0006XQ-Du; Fri, 04 Oct 2024 14:08:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee: Update to v4.3.0
Date: Fri, 4 Oct 2024 14:08:25 -0500
Message-ID: <20241004190825.24897-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Oct 2024 19:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17982

Update all of the components to the upstream 4.3.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 22a363f4..5f06fa03 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.2.0+git"
-SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
+PV = "4.3.0+git"
+SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 2d7a95bd..4d9897a7 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.2.0+git"
+PV = "4.3.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 790f5f5f..a79e5702 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.2.0+git"
-SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
+PV = "4.3.0+git"
+SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index fdfa420c..0b902d69 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.2.0+git"
-SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
+PV = "4.3.0+git"
+SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
-- 
2.17.1


