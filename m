Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF19C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 23:41:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.1384.1665099680314970410
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 16:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KNIwkh9h;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 296NfJ0Z044554
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Oct 2022 18:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665099679;
	bh=oyQZh5O0EfQHZ6I4OZKYv+GV1JKTknO1TmrXFY2Rc1U=;
	h=From:To:CC:Subject:Date;
	b=KNIwkh9hWjxUcM6SF7xHUK3RrGsaYfbXEfISIl/kkyJjFEOJgPNgowxM94bx1bs9u
	 jzscellP6RPvwzPl8Muyh72SPboPb0tQrOtOpQF5Cpn4W7+st9gNBKkLZlvuOI1tN5
	 /HEttNymRwjf1vTg5zn6Y8olxqbhDCNRHxE84Onc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 296NfJSs015053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Oct 2022 18:41:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 6 Oct
 2022 18:41:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 6 Oct 2022 18:41:18 -0500
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 296NfI5F029536;
	Thu, 6 Oct 2022 18:41:18 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH] ti-img-rogue-*: Bump the graphics recipes
Date: Thu, 6 Oct 2022 18:41:08 -0500
Message-ID: <20221006234108.1696865-1-rs@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Oct 2022 23:41:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15115

Bump the graphics recipes source revision and remove the old BVNC
switch. The BVNC is now baked into the platform Makefile that is
selected with PVR_BUILD_DIR / TARGET_PRODUCT.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-driver_1.15.6133109.bb                | 10 ++--------
 .../libgles/ti-img-rogue-umlibs_1.15.6133109.bb        |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 1127c5d1..4f6dc4d4 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "ea2ac3fda4ac442b639bc3a0b73e9c4feac2081a"
+SRCREV = "a353b9524399d927af8e824f92902065947b2fbe"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
@@ -34,16 +34,10 @@ TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_j784s4-evm = "j784s4_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
-TARGET_BVNC_j7-evm = "22.104.208.318"
-TARGET_BVNC_j7-hs-evm = "22.104.208.318"
-TARGET_BVNC_j721s2-evm = "36.53.104.796"
-TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
-TARGET_BVNC_j784s4-evm = "36.53.104.796"
-TARGET_BVNC_am62xx = "33.15.11.3"
 PVR_BUILD = "release"
 PVR_WS = "wayland"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${TARGET_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
 
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index b6bb4324..de979be0 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -15,7 +15,7 @@ PR = "r2"
 BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "4207c0ea429ec751b1ff5f831a84ceeb76ad578d"
+SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.25.1


