Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5350CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:19:09 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.43868.1757589169178288413
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 04:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rUQCOaAq;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: s-joshi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BAw2dt788247
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 05:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757588282;
	bh=9MNVb05EZvzNLzRQdcrymcj6qwzjcUMEq42+eHHxJyI=;
	h=From:To:CC:Subject:Date;
	b=rUQCOaAqqXFxSVr81Vn+s6un0qT47GNXUPpzMxwJVcv3tyhIBMbcjeAJ01CiQA6bF
	 r8L3Q+2cA/dfMOiLfyx9i+F567TiYfwJScc3h0KxSDeIz6RFHuPlq5HfsAzsNYKvTg
	 HD96HLK21d/O2Xm+gbWUPOSSu1ND431eyeBHwEN8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BAw2aE1889515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 05:58:02 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:58:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:58:01 -0500
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.173])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BAw0fd2018211;
	Thu, 11 Sep 2025 05:58:01 -0500
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-joshi@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
Date: Thu, 11 Sep 2025 16:27:36 +0530
Message-ID: <20250911105736.450595-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 12:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18992

Update optee_client, optee_examples, optee_os and optee_test to the
newer 4.7.0 tag from the previous 4.6.0 one.

Further: meta-arm applies 0003-optee-enable-clang-support patch to
optee_os. However, in a recent upstream commit [0], the line to which
the patch applies was removed. Therefore the patch is no longer
required. As a result, tell optee_os.bbappend file to remove it.

[0] https://github.com/OP-TEE/optee_os/commit/3d5c2dd8b59ae888434b3f86842828131f115d90

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 4 ++--
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend       | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend        | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 86c92863..289ca5b5 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.6.0+git"
-SRCREV = "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
+PV = "4.7.0+git"
+SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 6c120be2..91dd5e60 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.6.0+git"
-SRCREV = "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
+PV = "4.7.0+git"
+SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 980f7a4b..407436a9 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
 OPTEE_TI_OVERRIDES = ""
 OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
 
+SRC_URI:remove = " \
+    file://0003-optee-enable-clang-support.patch \
+"
+
 require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index d9705a0b..7b5b3912 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.6.0+git"
-SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
+PV = "4.7.0+git"
+SRCREV = "86846f4fdf14f25b50fd64a87888ca9fe85a9e2b"
 
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 0cee127f..50f87199 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
 OPTEE_TI_OVERRIDES = ""
 OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
 
+SRC_URI:remove = " \
+    file://0003-optee-enable-clang-support.patch \
+"
+
 require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 35e780b3..d2593cb8 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
-PV = "4.6.0+git"
-SRCREV = "a9e9495f4d57b97022008ad11198195e7e044c5d"
+PV = "4.7.0+git"
+SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
 
 SRC_URI:remove = " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
-- 
2.40.0


