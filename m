Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FDCC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 23:37:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4691.1707435444469025429
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 15:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Iq0GYSi3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418NbMWh108639;
	Thu, 8 Feb 2024 17:37:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707435442;
	bh=2T2DTrj4V9Q8mHuQDMK4k+GZco9oLD7flOQWiABoDGs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Iq0GYSi31apxvpy2NBMD2fXTjsuEKE5Z/ujje+3Tb33cU6Cs2fJQIduzwU2am78tx
	 KFLoVPzqSJ1CwN45f2Kie5A9QcAde6NLNoVF1zBvpn/Fdr71laXU3ZO7nkpZc1vVuh
	 reRgP7SaPXj0RgI/UcYQm2b6GyxJUoagnD7CqZSo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418NbMcg071051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 17:37:22 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 17:37:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 17:37:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418NbMa9038936;
	Thu, 8 Feb 2024 17:37:22 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] ti-img-rogue-*: switch branches to new lts
Date: Thu, 8 Feb 2024 17:37:21 -0600
Message-ID: <20240208233722.2565237-2-rs@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208233722.2565237-1-rs@ti.com>
References: <20240208233722.2565237-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 23:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17461

From: Randolph Sapp <rs@ti.com>

Switch the branches to the new LTS names. These are still experimental,
hence the isolation from kirkstone. The upstream branch is now carrying
the equivalent to the kbuild patch so we're dropping it here.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb     | 6 ++----
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb      | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 0e894534..02ec9fe9 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -16,15 +16,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/kirkstone/k6.1/${PV}"
+BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
-SRC_URI:append = " file://0001-build-kbuild-Makefile.template-use-SECONDARY.patch"
-
 S = "${WORKDIR}/git"
 
-SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
+SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index 288eb52b..a0a9a295 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 PR = "r3"
 
-BRANCH = "linuxws/kirkstone/k6.1/${PV}"
+BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
-- 
2.43.0


