Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286E4C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.20083.1707503751062740109
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 10:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C0/YCmNA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419IZnea096464;
	Fri, 9 Feb 2024 12:35:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707503749;
	bh=PgrI4og4HYyavSVTq0SKNReM0TJ18Zx2dyiywg4reu0=;
	h=From:To:CC:Subject:Date;
	b=C0/YCmNA6eWSSvd/MwwZ57dUseP5L65i+wra0BTBayJHRYfFrUhoQblICidP53I0R
	 a3ZoP0J8SFJlz5EzsQyfNE4jJj7xGBRiGrlsBCIqeEHrJL7V6qbL3UL4lw9X0W6k5G
	 Lf4HVQA+l08Qv0hj//kXY59Ve4zx7eCqc3LrJgOU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419IZncK084383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 12:35:49 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 12:35:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 12:35:49 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419IZnnJ095002;
	Fri, 9 Feb 2024 12:35:49 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCHv2] ti-img-rogue-*: switch branches to new lts
Date: Fri, 9 Feb 2024 12:35:49 -0600
Message-ID: <20240209183549.2895749-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Feb 2024 18:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17465

From: Randolph Sapp <rs@ti.com>

Switch the branches to the new LTS names. These are still experimental,
hence the isolation from kirkstone.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 4 ++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index bc59816a..02ec9fe9 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -16,13 +16,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/kirkstone/k6.1/${PV}"
+BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
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


