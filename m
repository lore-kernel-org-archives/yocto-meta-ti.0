Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF638C77B6F
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.389.1681324965450975737
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gcttm/yg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIgi5E011807;
	Wed, 12 Apr 2023 13:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324964;
	bh=3Woj22SRCiK/9p2yqhDJFLhXN4XH2Ds/6flH7FYMREo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Gcttm/ygA1uh0H0x4K+P0oFOz73OJVmNQRgRSGjwx9d4KFQM1ZLD2H58dEa43ygJ1
	 PucmHfL9UOKwV2A5A9YvthlNndXp0QTBhZ0hsVYwv1RlnHlnUKqzQ2tfOmUNt1/MWO
	 d59g/aktPCrt9hKf8M5C2q5P2YlluiJ1w03vDVgA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIgiu0036807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:44 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZY023440;
	Wed, 12 Apr 2023 13:42:43 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 4/6] ti-sgx-ddk-km: Use PVR_BUILD and PVR_WS to match Rogue
Date: Wed, 12 Apr 2023 13:42:40 -0500
Message-ID: <20230412184242.29743-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16379

Use these to select build type and window system support to match how
the Rouge driver does the same. No functional change.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb      | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index dcceed69..bf4fa98a 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -28,19 +28,21 @@ TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
 TARGET_PRODUCT:am65xx = "ti654x"
+PVR_BUILD = "release"
+PVR_WS = "nulldrmws"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
 
 do_compile:prepend() {
     cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
-do_install:k3() {
-    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
+do_install:am65xx() {
+    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
 }
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-um"
-- 
2.39.2


