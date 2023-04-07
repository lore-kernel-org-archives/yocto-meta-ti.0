Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3D1C77B70
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 00:59:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.174711.1680829181107360693
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 17:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o7z9GKDz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3370xaK6068458;
	Thu, 6 Apr 2023 19:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680829176;
	bh=0/sbvxsVjgrdVgoR6c2k5zDOWI023va7U1e6f2GDRqk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o7z9GKDz//F1+/wA7iflonW/iUnMWHB7Rnw/wZX3z7gjtptYrgWnDRW3weh1pg/W+
	 0a3gxjZ0+0QrT5iTTEm/lqByz/p0QwTUfwXvQ9FpYNnfPgGtz7eLLM/nK2d4SQFFlC
	 0mnJI1Q4H2aSrD4C2tL+2TjR7ja34hFJxF7KY0fs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3370xaAe119242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 19:59:36 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 19:59:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 19:59:36 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3370xax6019574;
	Thu, 6 Apr 2023 19:59:36 -0500
From: Randolph Sapp <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH][kirkstone 3/3] graphics: upgrade rogue graphics to 23.1.6404501
Date: Thu, 6 Apr 2023 19:59:32 -0500
Message-ID: <20230407005932.322037-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230407005932.322037-1-rs@ti.com>
References: <20230407005932.322037-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 00:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16318

Update the rogue graphics recipes to point at the new 23.1.6404501
release. This adds support for:
	- kernel 6.1
	- vulkan
	- opencl (more testing needed)
	- zink (more testing needed)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ..._1.18.6276027.bb => ti-img-rogue-driver_23.1.6404501.bb} | 4 ++--
 ..._1.18.6276027.bb => ti-img-rogue-umlibs_23.1.6404501.bb} | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18.6276027.bb => ti-img-rogue-driver_23.1.6404501.bb} (92%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.18.6276027.bb => ti-img-rogue-umlibs_23.1.6404501.bb} (86%)

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
similarity index 86%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
index 94d14ded..38d0556b 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -10,9 +10,9 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
 PR = "r2"
 
-BRANCH = "linuxws/kirkstone/k5.10/${PV}"
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "51e598919641d51156a631efa5447124a3c0f543"
+BRANCH = "linuxws/kirkstone/k6.1/${PV}"
+SRC_URI = "git://git@bitbucket.itg.ti.com/graphics/8xe-ddk-rogue_umlibs.git;protocol=ssh;branch=${BRANCH}"
+SRCREV = "49958a8e820a321d22ac3c635bd21d4a3118c006"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.40.0


