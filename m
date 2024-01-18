Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CADDC47258
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 00:20:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3847.1705537219390400523
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jan 2024 16:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sMQL0fQm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40I0KHLN117757;
	Wed, 17 Jan 2024 18:20:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705537217;
	bh=K/eE49GZKtYZZyB2MuCT62YaDnBeEg8zyTjUfcNMCgc=;
	h=From:To:CC:Subject:Date;
	b=sMQL0fQmEek02TbyDc9D0nn3IQdw0gTR9ovXtM++Mpb79G3ltsQRJPvZ2+0Efwx42
	 gtEyuaxV4f18FcIVMohjyiraWJI0wrtFGT1A5h6kuFrZ0uhUTn0qX236PFZthSEtka
	 9qsbRwInw/lGfKkIXxJ6/H9Y0oURm19kX/aeLbMo=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40I0KHjM002503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jan 2024 18:20:17 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jan 2024 18:20:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jan 2024 18:20:17 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40I0KHiT019918;
	Wed, 17 Jan 2024 18:20:17 -0600
From: <rs@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] ti-img-rogue-*: stability update
Date: Wed, 17 Jan 2024 18:19:56 -0600
Message-ID: <20240118001956.978968-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jan 2024 00:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17404

From: Randolph Sapp <rs@ti.com>

Bump SRCREV to include the following changes in UM and KM:

	- Rebuild all releases with external memory wrap disabled due to
	  some incompatibility with certain Qt use cases.
	- Add a watchdog change that prevents an occasional false
	  timeout when servicing long DM processes.
	- Rely on snooping to perform certain cache operations and
	  results in decreased overhead for device -> cpu
	  communications.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb         | 2 +-
 .../powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index 3b5d51ec..f86f4f21 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "64d1cac11363888b7a071b62d71b563568d483f1"
+SRCREV = "2595524729c5acbabcbdee2185de64e7fcd6b36a"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
index 58cd6c37..1dcfc039 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.2.6460340.bb
@@ -12,7 +12,7 @@ PR = "r2"
 
 BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "7c853b0c75b7c5c4fa30ded608588850d429f306"
+SRCREV = "c2671c6eaf85ec6a1183c023bbb4d6e9e288fc10"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.43.0


