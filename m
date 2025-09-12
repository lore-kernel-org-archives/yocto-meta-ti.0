Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F55CAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 12:24:45 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.15432.1757679879874122542
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 05:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vRo2dPKN;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: s-joshi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CCOdqd602019
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 07:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757679879;
	bh=mLvlWIqVlG1MxJa4d7O9Yu1HtpVf+JglYQa87C41iC4=;
	h=From:To:CC:Subject:Date;
	b=vRo2dPKN9o9yUwCrkjl34e70kAHeh+i5dFHtZAAFict1YJJ208FpuhN1Ge/GS0gaR
	 Rp4ATyO2v+OzSbpVIgqFtMX27lg8vDMjC7LxQhq6utleqqvxVx1XRaJ6h8BelIKKbK
	 Vp15u90X32q86dRdHGPBwDIQCdvwrCiHqCF9PNCc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CCOdkl1969726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 07:24:39 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 07:24:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 07:24:39 -0500
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.173])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CCObQl3589765;
	Fri, 12 Sep 2025 07:24:38 -0500
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-joshi@ti.com>, <kamlesh@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3] optee: Update to 4.7.0 tag
Date: Fri, 12 Sep 2025 17:54:06 +0530
Message-ID: <20250912122406.523659-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 12:24:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19001

Update optee_client, optee_examples, optee_os and optee_test to the
newer 4.7.0 tag from the previous 4.6.0 one.

Further: meta-arm applies 0003-optee-enable-clang-support patch to
optee_os. However, in a recent upstream commit [0], the line to which
the patch applies was removed. Therefore the patch is no longer
required. As a result, tell optee_os.bbappend file to remove it.

[0] https://github.com/OP-TEE/optee_os/commit/3d5c2dd8b59ae888434b3f86842828131f115d90

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
changes from v2:
- Updated SRCREV, so that the TRNG commit is included.
---
 .../recipes-security/optee/optee-client-ti-version.inc       | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc     | 4 ++--
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend      | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc   | 5 ++---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend       | 4 ++++
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc | 4 ++--
 6 files changed, 16 insertions(+), 9 deletions(-)

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
index d9705a0b..0f040e6e 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,6 +1,5 @@
-PV = "4.6.0+git"
-SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
-
+PV = "4.7.0+git"
+SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
     file://0001-arm64.h-fix-compile-error-with-Clang.patch \
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


