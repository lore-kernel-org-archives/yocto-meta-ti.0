Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9576DC4167D
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2623.1650320428740310923
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 15:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZSR+SmGH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23IMKRSv110512;
	Mon, 18 Apr 2022 17:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650320427;
	bh=cI78Fox/frJM4c8uFm9hk+48puxqX5qZ/Q/tyYd/6Bs=;
	h=From:To:Subject:Date;
	b=ZSR+SmGHNPO2EDw5+PrgkhLNARmm1K0JyE2570MnxUfMyrLw3PfPbXgVW7IDfRuo6
	 VNK3Tl8R0dybB/QqEiTLEjIY1WQ5q9u+yeGs1jd3kUWSeUeUG0qTp0RKefd4ff3BuO
	 8unDbwpJt0CQQUY4ANY/e9SMAi1L0kH+qSnlOjzI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23IMKRGE039516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Apr 2022 17:20:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 17:20:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 17:20:26 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23IMKQnf004466;
	Mon, 18 Apr 2022 17:20:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ngZjO-0001AV-L1; Mon, 18 Apr 2022 17:20:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] ti-graphics: Add j7-hs-evm as a
 compatible machine.
Date: Mon, 18 Apr 2022 17:20:26 -0500
Message-ID: <20220418222026.3201-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14603

The recent change to explicitly list the compatible machines is missing the j7-hs-evm.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index fbff6c51..6d2d68cd 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
 
 DEPENDS = "virtual/kernel"
 
@@ -29,9 +29,11 @@ S = "${WORKDIR}/git"
 SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
+TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 TARGET_BVNC_j7-evm = "22.104.208.318"
+TARGET_BVNC_j7-hs-evm = "22.104.208.318"
 TARGET_BVNC_j721s2-evm = "36.53.104.796"
 TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index e00dce99..0f3f9192 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
 
 PR = "r1"
 
@@ -18,6 +18,7 @@ SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
 SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
+TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
 PVR_BUILD ?= "release"
-- 
2.17.1


