Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1AFCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:40:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.53713.1758552017823735802
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F+wAuLwU;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEeHFa1273763;
	Mon, 22 Sep 2025 09:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552017;
	bh=/jhQGfUHXk3s9xW5w4KQVdg6CdnPUgf+KsvTllZDLY0=;
	h=From:To:Subject:Date;
	b=F+wAuLwUQzBqvuw5X624WJTNUhjYcfEEKeBQ6cI0VbLYryy4gO73qmSsSpPJo8lYs
	 DrcBLfX+hgLEPV2kQUGvgzq8qL56pkouZ4QYNBeFdF086j8fFpIUmMefyPtssZbvtA
	 7BIF89nKsIqJlLq3Bu5Y6aEMs+af8JNQZvkDqaqc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEeHIn372491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:40:17 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:40:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:40:16 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEeGau2677818;
	Mon, 22 Sep 2025 09:40:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v0hiC-00015L-I5; Mon, 22 Sep 2025 09:40:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Moved to named git repo
Date: Mon, 22 Sep 2025 09:40:16 -0500
Message-ID: <20250922144016.4131-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19050

An upcoming patch series will optionally add in a second repository that
will optionally be needed as part of the builds.  To facilitate that, we
need to name the uboot checkout so that the SRCREV can be tracked correctly
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc                | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                | 4 +++-
 5 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index b1802e27..ed95f483 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -5,6 +5,6 @@ COMPATIBLE_MACHINE:tie-jailhouse = "am62xx|am62pxx|am62lxx"
 
 BRANCH:tie-jailhouse:bsp-ti-6_12 = "ti-u-boot-2025.01-jailhouse"
 
-SRCREV:tie-jailhouse:bsp-ti-6_12 = "e718bbcec3ebf663c021839753034a224be4cc53"
+SRCREV_uboot:tie-jailhouse:bsp-ti-6_12 = "e718bbcec3ebf663c021839753034a224be4cc53"
 
 UBOOT_GIT_URI:tie-jailhouse = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index d27ca9e5..bb51dca4 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -6,4 +6,4 @@ PV = "2025.07"
 
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 
-SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
+SRCREV_uboot = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index e0371bfa..83179aee 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -8,4 +8,4 @@ BRANCH = "ti-u-boot-2024.04"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
 
-SRCREV = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
+SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index ab19988d..c1c0640d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "f3f8c664b3001e40cbdf46687732b2c37e1b6b33"
+SRCREV_uboot = "f3f8c664b3001e40cbdf46687732b2c37e1b6b33"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 669db413..27b0855b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,7 +25,9 @@ BRANCH ?= "master"
 UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
 UBOOT_GIT_PROTOCOL ?= "https"
 UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
-SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH}"
+SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
+
+SRCREV_FORMAT = "uboot"
 
 PV:append = "+git"
 
-- 
2.17.1


