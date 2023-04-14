Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812AFC77B73
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:59:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.15936.1681491558217052587
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 09:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a0Xlegxg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EGxHnd101096
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681491557;
	bh=B+IhhnV9eB7N8Lj26J18AxUYMGf/Q8Q1FdpGzwFSpsU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a0XlegxgvIjgVzRk102xb3i5OhOzFNNEyHX47c64ksrDNcOotYHJuV3iKh2E3EVqs
	 xihDjWZJlCDW9pTYYqUtINKsMoQodLqwN4PgeRclZsZ/c6gDGUVSlrCtJqYF+79ce2
	 mLMgn+Uhbfvq6c1URyRo2t2YnePtZHG3roqaWMD0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EGxHGx121171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:59:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 11:59:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 11:59:17 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EGxHhG086732;
	Fri, 14 Apr 2023 11:59:17 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH v3][kirkstone 3/3] graphics: upgrade rogue graphics to 23.1.6404501
Date: Fri, 14 Apr 2023 11:58:59 -0500
Message-ID: <20230414165859.1675824-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414165859.1675824-1-rs@ti.com>
References: <20230414165859.1675824-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 16:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16398

Update the rogue graphics recipes to point at the new 23.1.6404501
release. This adds support for:
	- kernel 6.1
	- vulkan
	- opencl (more testing needed)
	- zink (more testing needed)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...er_1.18.6276027.bb => ti-img-rogue-driver_23.1.6404501.bb} | 4 ++--
 ...bs_1.18.6276027.bb => ti-img-rogue-umlibs_23.1.6404501.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18.6276027.bb => ti-img-rogue-driver_23.1.6404501.bb} (92%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.18.6276027.bb => ti-img-rogue-umlibs_23.1.6404501.bb} (93%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
similarity index 92%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index 96fb7484..f8489e80 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -16,13 +16,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/kirkstone/k5.10/${PV}"
+BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "d575e4f64c95a3534e10e85da15bd303febf133f"
+SRCREV = "b69b689252a1158bff205603288ad12b9482770b"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
similarity index 93%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
index 94d14ded..3ad0cce6 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -10,9 +10,9 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
 PR = "r2"
 
-BRANCH = "linuxws/kirkstone/k5.10/${PV}"
+BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "51e598919641d51156a631efa5447124a3c0f543"
+SRCREV = "49958a8e820a321d22ac3c635bd21d4a3118c006"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.40.0


