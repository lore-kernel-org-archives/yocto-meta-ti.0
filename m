Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA81C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 02:00:10 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.35785.1736820009547483369
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 18:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vJm0tHYA;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50E208pl3780810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 20:00:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736820008;
	bh=VztDdCgUPFx+qOBCsb+HtKjurgtk08wnPQjTrq/robM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vJm0tHYAG60EUKEUCzwcnIyONGMgPvY2x6DA4ZNJRh7G5lOlyT///zKHOlbAz0JKU
	 hILJFF0HrgVyTw4tBuhaZoB2/M3fkOT55SpnaGNeE/DwQ1DU0FJuRs5P4skdjI8CcF
	 XXtj4eQo3+k9Hyi1zhYk3EAQBsU95SWzpDVk5j8g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50E208pE021708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 20:00:08 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 20:00:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 20:00:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50E2059G124892;
	Mon, 13 Jan 2025 20:00:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <a-christidis@ti.com>,
        <detheridge@ti.com>
Subject: [meta-ti][master][PATCH 1/4] ti-img-rogue-*: version 24.1.6554834 -> 24.2.6643903
Date: Mon, 13 Jan 2025 19:59:42 -0600
Message-ID: <20250114015945.3554905-2-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114015945.3554905-1-rs@ti.com>
References: <20250114015945.3554905-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jan 2025 02:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18196

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
index 9007872f..eef940d6 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -13,13 +13,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+BRANCH = "linuxws/scarthgap/k6.12/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "707bb373902babf9ced5fd2f99139209ca0f605a"
+SRCREV = "51a23d9fba59a9aa9179793dfa6ee649fdd44015"
 
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


