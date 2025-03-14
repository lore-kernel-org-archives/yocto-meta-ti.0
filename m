Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEA5C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 22:33:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.6160.1741991611088636407
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 15:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gYj6OSWU;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52EMXS6o2260734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 17:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741991608;
	bh=O0PhDC0u5mF3jav2StmmFkFMbRUMpolCmwv0v+OIynM=;
	h=From:To:CC:Subject:Date;
	b=gYj6OSWUbQp0ozvOaGtXjyBVNuOtpiSugYPZg2DYkMSSQpSddQiEy1I0b5o48iE3Q
	 VJkyaylIuFStQ/VUN5yiOqZh7Qs8QKGCBJTMgtl2oXD1O7MUNpnkbxTDq0+CTMGhT5
	 bQFGykcZq2ZpoYqH/QK+NAbL1uHbQMoFyhQ4iVZU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52EMXSH4018271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 17:33:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 17:33:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 17:33:27 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52EMXRZ1034310;
	Fri, 14 Mar 2025 17:33:27 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>, <vishalm@ti.com>,
        <a-christidis@ti.com>, <k-willis@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] ti-img-rogue-driver: fix os amp interactions
Date: Fri, 14 Mar 2025 17:33:18 -0500
Message-ID: <20250314223318.3650031-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Mar 2025 22:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18385

From: Randolph Sapp <rs@ti.com>

Fix OS APM interactions when uninitialized. Because this driver uses
lazy initialization, if the GPU is never given a task it will not be
initialized. Even if the device is not fully initialized it is still
registered with the DRM subsystem and capable of receiving OS APM
signals.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
index d3860dd8..96ca8ff5 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "023eb5afde7e069bff1e5e37620b84a66b447936"
+SRCREV = "3bcbba9708fe6a882cd0f4820469d026fff7aee5"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.48.1


