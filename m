Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1181CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:58:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.41815.1760356684736815809
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 04:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wn2hHkD8;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DBw4AN814402
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 06:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356684;
	bh=wFqHYtTrX4cwc5vcmIZqst0o002xnzSBoeEV0uf7KY8=;
	h=From:To:CC:Subject:Date;
	b=wn2hHkD88UqnzUiqU1c218T2oFStu1XN6z1xTFTuZ7ZDYRReqTJa7uwK4ZRGiK4+L
	 1KXxrNTYlZmZgNlogvILvoN3Wp1DUjB672y45JI2aqmz1Z3aik9aqwxLb3aO/ipE69
	 0qpRaLURAuF58AUQJQ/dFXj9NpTJFUC+TyZYSR3I=
Received: from DFLE214.ent.ti.com (dfle214.ent.ti.com [10.64.6.72])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DBw4Qg163363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 06:58:04 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 06:58:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 06:58:04 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DBw2mg2003178;
	Mon, 13 Oct 2025 06:58:03 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [master/scarthgap][PATCH] ti-dm-fw: Update DM for am62dxx
Date: Mon, 13 Oct 2025 17:27:34 +0530
Message-ID: <20251013115734.1403394-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Oct 2025 11:58:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19116

am62dxx previously reused am62axx DM, but now that a dedicated DM is
available, migrate to device-specific DM.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/2c09bb5e3c22b70b8afd823abc2704c9

 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb | 6 ++++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 03016993..2d9ad499 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -29,7 +29,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
-PLAT_SFX:am62dxx = "am62axx"
+PLAT_SFX:am62dxx = "am62dxx"
 PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
@@ -87,7 +87,7 @@ do_deploy() {
 ALTERNATIVE:${PN}:am62xx  = "am62-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62pxx  = "am62p-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:am62axx = "am62a-main-r5f0_0-fw"
-ALTERNATIVE:${PN}:am62dxx = "am62a-main-r5f0_0-fw"
+ALTERNATIVE:${PN}:am62dxx = "am62d-main-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721e   = "j7-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j7200   = "j7200-mcu-r5f0_0-fw"
 ALTERNATIVE:${PN}:j721s2  = "j721s2-mcu-r5f0_0-fw"
@@ -99,6 +99,7 @@ ALTERNATIVE:${PN}:j742s2  = "j742s2-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62p-main-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/am62p-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[am62a-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62d-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62d-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]  = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
@@ -110,6 +111,7 @@ ALTERNATIVE_LINK_NAME[j742s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62p-main-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[am62a-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
+ALTERNATIVE_TARGET[am62d-main-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw]     = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw]  = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 ALTERNATIVE_TARGET[j721s2-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index eeb3f428..4e956cbb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -63,7 +63,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
-PLAT_SFX:am62dxx = "am62axx"
+PLAT_SFX:am62dxx = "am62dxx"
 PLAT_SFX:am62lxx = "am62lxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
-- 
2.34.1


