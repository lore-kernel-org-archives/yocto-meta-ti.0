Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2484EC64EC4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2565.1676489640712238373
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NfwqY6Cc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXxL7084068;
	Wed, 15 Feb 2023 13:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676489639;
	bh=Ehnp5dotHTuw3Pcic2JmkN3Pw8h2NH2ToJI9gc/0/YI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NfwqY6Cch4ffA0n19ievt6RU4lNUNDglfc+bxim8mR5zohu8hahaDwy7mXr1N7L3f
	 9SAvjxb2OnaUpUVgsYsipu1KrU739DoFs59Qn8B+BMHm20NTWHeVYdmXkID68lPS2A
	 BnCXh4H6wc3N4CvhbSEH7g/v3Dxr14R2u50twqV8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FJXxce096572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Feb 2023 13:33:59 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 13:33:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 13:33:59 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FJXt6o014221;
	Wed, 15 Feb 2023 13:33:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 11/15] ti-rtos-firmware: Do not break the source directory by renaming files
Date: Wed, 15 Feb 2023 13:33:51 -0600
Message-ID: <20230215193355.9676-12-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215193355.9676-1-afd@ti.com>
References: <20230215193355.9676-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15866

If we rename files in the source directory the next time we need to rebuild
the original files will be gone and build will fail. Use symlinks instead.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 4744be84..56071a8c 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -121,18 +121,18 @@ do_install:prepend:j721s2-hs-evm() {
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                mv am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
-                mv am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
-                mv am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
-                mv am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
-                mv am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
+                ln -s am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
+                ln -s am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
+                ln -s am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
+                ln -s am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
+                ln -s am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
         )
 }
 
 # Update the am62xx ipc binaries to be consistent with other platforms
 do_install:prepend:am62xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                mv am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
+                ln -s am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
         )
 }
 
-- 
2.39.1


