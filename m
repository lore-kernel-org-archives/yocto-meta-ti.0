Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C8FC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 18:33:20 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.30930.1706121190195942034
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 10:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OxahofP4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40OIX9h7089281;
	Wed, 24 Jan 2024 12:33:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706121189;
	bh=RKbIfHrA88C/z9Y12WnxjLpHcj7KL6w36wwucPxU87g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OxahofP4tDTU75cZTteZhhbEt33pZxLIO9yVHVxnG0rpYpq3lSXjlsMYJM9fS29hk
	 sm8wtsC1MH/7FKhOadNgOopZov/gXz6Gc1cY71KS9MuA889MAeoLZiSr6rwP4ipox/
	 Aa3IV0aHYNDncwVk90D/pbFozXQGcjkNw6MlpYXg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40OIX91U010413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jan 2024 12:33:09 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Jan 2024 12:33:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Jan 2024 12:33:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40OIX8ge008468;
	Wed, 24 Jan 2024 12:33:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rSi3g-0000qN-Jw; Wed, 24 Jan 2024 12:33:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti*: Move mainline to 2024.01 and move logo code
Date: Wed, 24 Jan 2024 12:33:08 -0600
Message-ID: <20240124183308.3201-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124183308.3201-1-reatmon@ti.com>
References: <20240124183308.3201-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jan 2024 18:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17414

Now that 2024.01 is official, the logo that am62xx-evm installs is
available in all versions of the repo that we point to.  Move all of
that code out of the .bb files and into the u-boot-ti.inc file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-mainline_git.bb       |  4 ++--
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb    | 10 ----------
 .../recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb    | 10 ----------
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc           | 10 ++++++++++
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 692cf84a..f497054c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,7 +2,7 @@ require u-boot-ti.inc
 
 PR = "r0"
 
-PV = "2023.10"
+PV = "2024.01"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -13,4 +13,4 @@ PV = "2023.10"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "4459ed60cb1e0562bc5b40405e2b4b9bbf766d57"
+SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 143bcea8..e95c9c76 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -7,13 +7,3 @@ PR = "r0"
 BRANCH = "ti-u-boot-2023.04"
 
 SRCREV = "a97ca328b3df6abf79c5cc01878290e03131bbba"
-
-do_install:append:am62xx() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
-}
-
-do_deploy:append:am62xx() {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
-}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
index 58900bee..d2a6ccb5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.01.bb
@@ -9,13 +9,3 @@ PR = "r0"
 BRANCH = "ti-u-boot-2024.01"
 
 SRCREV = "2f0282922b2c458eea7f85c500a948a587437b63"
-
-do_install:append:am62xx() {
-	install -d ${D}/boot
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
-}
-
-do_deploy:append:am62xx() {
-	install -d ${DEPLOYDIR}
-	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
-}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 3a5d8a7d..9b26596c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -331,4 +331,14 @@ do_deploy:append () {
 	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
 
+do_install:append:am62xx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
+}
+
+do_deploy:append:am62xx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
+}
+
 TOOLCHAIN = "gcc"
-- 
2.17.1


