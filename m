Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D62FCF885C
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 21:29:02 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.806.1728077335651120909
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CBVPgdKw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 494LSrJR010672;
	Fri, 4 Oct 2024 16:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728077333;
	bh=OluUDAY4TNU0Fn3zcRLksDaFOMT533ZfSReWTJPErfI=;
	h=From:To:Subject:Date;
	b=CBVPgdKwQwqje0dOt/BiOosh93H4qG8gvjbJegYUlGumVixlg6WRP/NS2hmxG+XJU
	 5sdMjRZVdSBC9/Zm6rfYyx813YPJ4EH6XM//Wup0Cm48LONwFwY6FshrwxlhrC3hi6
	 Q2UWF8Ybo3ku+bvW9lbJl/9YdTZLPO5vacPbk5QA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 494LSriA003475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Oct 2024 16:28:53 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Oct 2024 16:28:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Oct 2024 16:28:53 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 494LSrT2125790;
	Fri, 4 Oct 2024 16:28:53 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1swpr3-0000gR-6V; Fri, 04 Oct 2024 16:28:53 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] optee: Update to v4.3.0
Date: Fri, 4 Oct 2024 16:28:53 -0500
Message-ID: <20241004212853.2570-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Oct 2024 21:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17983

Update all of the components to the upstream 4.3.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc |  4 ++--
 .../optee/optee-examples-ti-version.inc                |  2 +-
 .../recipes-security/optee/optee-os-ti-version.inc     | 10 ++++++++--
 .../recipes-security/optee/optee-test-ti-version.inc   | 10 ++++++++--
 4 files changed, 19 insertions(+), 7 deletions(-)

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
index 790f5f5f..2fa4d8cc 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,8 @@
-PV = "4.2.0+git"
-SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
+PV = "4.3.0+git"
+SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
+
+SRC_URI:remove = " \
+    file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
+    file://0001-arm64.h-fix-compile-error-with-Clang.patch \
+    file://0002-libutils-zlib-fix-Clang-warnings.patch \
+"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index fdfa420c..2ae40bf1 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,2 +1,8 @@
-PV = "4.2.0+git"
-SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
+
+PV = "4.3.0+git"
+SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
+
+SRC_URI:remove = " \
+    file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
+"
-- 
2.17.1


