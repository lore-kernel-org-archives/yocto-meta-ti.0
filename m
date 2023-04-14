Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50059C77B72
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:19:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14981.1681489157041985124
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 09:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y/fHps41;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EGJGoE095626
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681489156;
	bh=B+IhhnV9eB7N8Lj26J18AxUYMGf/Q8Q1FdpGzwFSpsU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Y/fHps41AOQfPBzIqbukybTV/5tICMfra0O+N8jzDkznCPoIyOPboG81HK8N2twsW
	 l0wlP5GsKGtrBfx6HOaZQ+xTcx/ZZfrtmMbJM5U/t0+hux2L1PGHhW5g3cvA92Ib+n
	 d/ZlYQAk9B0nM5mIcCjWhp6BSh9R5bOK+1qdkHA0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EGJG6V020256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:19:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 11:19:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 11:19:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EGJFYN048253;
	Fri, 14 Apr 2023 11:19:15 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH v2] graphics: upgrade rogue graphics to 23.1.6404501
Date: Fri, 14 Apr 2023 11:19:13 -0500
Message-ID: <20230414161913.1674131-4-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414161913.1674131-1-rs@ti.com>
References: <20230414161913.1674131-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 16:19:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16395

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


