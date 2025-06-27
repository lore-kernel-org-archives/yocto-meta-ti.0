Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390B6C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 10:28:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10328.1751020128852920639
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 03:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ieWjk8RG;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-chawdhry@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RASmQb2389049
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 05:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751020128;
	bh=EQlwl7h6croW9YIeYjmSV94qk0/CjRmSr1/VbXD5vmo=;
	h=From:To:CC:Subject:Date;
	b=ieWjk8RG5KC/v+7c5ndXm3i78TXhFpW4cJ3Cp732DMe5aaScb+/Hihnj4Oc7h6L/f
	 rxIdwXZOvd4ChuU0OtM8oviVQGlJiOJxHlV9HCX7BOJNFbUANComCk7ty57OcWg/WR
	 62pPuAFfbCVvJw/B9TY49U+39IiUgr3PkZnM+3kE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RASmWS3150671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 05:28:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 05:28:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 05:28:47 -0500
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.227.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RASiWF2916639;
	Fri, 27 Jun 2025 05:28:45 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] meta-ti-bsp: recipes-security: optee: Update OP-TEE components to 4.6.0
Date: Fri, 27 Jun 2025 15:58:39 +0530
Message-ID: <20250627102839.966496-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 10:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18701

Updates optee_os, optee_test, optee_client, optee_examples to 4.6.0

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 2c8977dd17ec..86c928632142 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.4.0+git"
-SRCREV = "d221676a58b305bddbf97db00395205b3038de8e"
+PV = "4.6.0+git"
+SRCREV = "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 8c21bc75d496..6c120be2a26b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.4.0+git"
-SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
+PV = "4.6.0+git"
+SRCREV = "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 89f7f818932f..d9705a0b2e80 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.5.0+git"
-SRCREV = "ef1ebdc23034a804a72da2207f1a825ce96a1464"
+PV = "4.6.0+git"
+SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
 
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index f815cb8de786..35e780b373fe 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
-PV = "4.4.0+git"
-SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
+PV = "4.6.0+git"
+SRCREV = "a9e9495f4d57b97022008ad11198195e7e044c5d"
 
 SRC_URI:remove = " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
-- 
2.34.1


