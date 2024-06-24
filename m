Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEEBC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 18:17:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.149073.1719253046606477087
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 11:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p78JlY4n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHOhO014766;
	Mon, 24 Jun 2024 13:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719253044;
	bh=ZpkNmyqL6ihWOunxkAayCTnDW7pwtTJsFQ6dTdWP6Fc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p78JlY4n+GmcjE+oHOrmvsPRgEqesBPjKrDFLWRaAdsn9cRLBEFHfPdCFSIkE4UNs
	 6q20P5L/2TabEOpYQd47pzPZ84fH1LefIyMCpfOZM5GgFt2/zeUT7mFg25HDG9vbY2
	 qK/Mmh08W5XHQguKkEZZR0bToQzx07hjnrmH3eKM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OIHNop111096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 13:17:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 13:17:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 13:17:23 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHLrG025548;
	Mon, 24 Jun 2024 13:17:23 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 1/2] ti-img-rogue-*_23.3: gcc 14 compat and branch sel
Date: Mon, 24 Jun 2024 13:17:13 -0500
Message-ID: <20240624181714.1293865-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624181714.1293865-1-rs@ti.com>
References: <20240624181714.1293865-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 18:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17802

From: Randolph Sapp <rs@ti.com>

Bump this recipe to add a change to help with GCC 14 compatibility in
the check-cc script used to check compiler flags before use.

Reset this back to the proper branches for kernel 6.1 since this recipe
is only being used in 6.6 bsp providers.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 4 ++--
 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 34c22cb2..607c86b2 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -13,13 +13,13 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 DEPENDS = "virtual/kernel"
 
-BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
+SRCREV = "174eb331a61e89184342fa57a935226f4e952bc9"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
index a0a9a295..288eb52b 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
 
 PR = "r3"
 
-BRANCH = "linuxws/scarthgap/k6.6/${PV}"
+BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
-- 
2.45.1


