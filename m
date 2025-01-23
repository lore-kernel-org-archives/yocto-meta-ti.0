Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FF1C0218C
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 01:08:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1257.1737594510578554755
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 17:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TWzUEy6k;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50N18TV5289159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 19:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737594509;
	bh=S6XhnHM1Wc2RApNVwZnqDwRbiJvkqjgnDOmZQNd0qLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TWzUEy6kIjacV8tWSUZe6rp8ljmddu2tzexC0QVFsIxqlDi/pz7ybQfPMU7RI66Ji
	 LsypXUXdxlZ1mTbH9OJnj2usHa7SYdhke9hr95/dQOfhkbTh/Ib+DOvQ+n9FqsZ79P
	 SLOcduo2932gE9QiIZyFymio/qfP8ij9oA5XaCAw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N18Trg092652;
	Wed, 22 Jan 2025 19:08:29 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 19:08:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 19:08:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N18RU9079409;
	Wed, 22 Jan 2025 19:08:29 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master][PATCHv3 1/4] ti-img-rogue-*: version 24.1.6554834 -> 24.2.6643903
Date: Wed, 22 Jan 2025 19:08:16 -0600
Message-ID: <20250123010819.2798518-2-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123010819.2798518-1-rs@ti.com>
References: <20250123010819.2798518-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2025 01:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18229

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


