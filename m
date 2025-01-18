Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50C8C02188
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 01:00:49 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2938.1737162048391820350
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 17:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jDbc4gOq;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10g4Y279887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Jan 2025 19:00:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737162042;
	bh=S6XhnHM1Wc2RApNVwZnqDwRbiJvkqjgnDOmZQNd0qLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jDbc4gOqYyqFEcluENE8p0d9jGxt3u+HkcBkLc061pYEgz6hNOVSLxFzEdmduU1xX
	 ocnGqd+5KiNRz3qmGUOcj3J72DfbgQRGAi+Yfp1Aj0yGQ269MSENzmNs6wlVio+vcc
	 WqYR5EJx0jYnd79OHClkNAaOXg6H28mJ3lKCSMlk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10gOH076052;
	Fri, 17 Jan 2025 19:00:42 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 19:00:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 19:00:42 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10gEU117516;
	Fri, 17 Jan 2025 19:00:42 -0600
From: <rs@ti.com>
To: <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCHv2 1/4] ti-img-rogue-*: version 24.1.6554834 -> 24.2.6643903
Date: Fri, 17 Jan 2025 19:00:29 -0600
Message-ID: <20250118010032.4092491-2-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118010032.4092491-1-rs@ti.com>
References: <20250118010032.4092491-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 Jan 2025 01:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18205

From: Randolph Sapp <rs@ti.com>

Bump the package version for DDK 24.2, this includes a few fixups from
IMG and support for a newer version of mesa.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 ...er_24.1.6554834.bb => ti-img-rogue-driver_24.2.6643903.bb} | 4 ++--
 ...bs_24.1.6554834.bb => ti-img-rogue-umlibs_24.2.6643903.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.1.6554834.bb => ti-img-rogue-driver_24.2.6643903.bb} (93%)
 rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.1.6554834.bb => ti-img-rogue-umlibs_24.2.6643903.bb} (98%)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
similarity index 93%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
index 9007872f..d3860dd8 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -13,13 +13,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "707bb373902babf9ced5fd2f99139209ca0f605a"
+SRCREV = "023eb5afde7e069bff1e5e37620b84a66b447936"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
similarity index 98%
rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
index 720a3cff..0de66b72 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
@@ -12,9 +12,9 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
 PR = "r3"
 
-BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "ba93a3e38c683ccb03a7cf8f2e7dffe2f9cbcf1c"
+SRCREV = "d578666fc6ecd09f7d6c3431747f1d93d128fe28"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.47.1


