Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F150C636D6
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6584.1675813363387265483
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R2pv44pi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317NgfKg058477;
	Tue, 7 Feb 2023 17:42:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813361;
	bh=WwK6BeQDY4pYUg0iaU/kt2znDeXPs3N7ZDFOpL60Xxw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R2pv44piHj/3wRTJfYlW3q4W679RsIWmYjKo4r9G1gUSIVkc5r3sVeINiTcQ6z+4z
	 AuH8IAAguLGX6qlrxHbi0mlkx3KiOo9eLQ7EaxpW+wgoiI3LTbEWH2fPJoftteFKlZ
	 SLXq1WTyK8ILq1CEqVxd4gwf80L1ifc/iQgonJU0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317NgfgS032424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:41 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:41 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTf050846;
	Tue, 7 Feb 2023 17:42:40 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/8] ti-rtos-firmware: Do not break the source directory by renaming files
Date: Tue, 7 Feb 2023 17:42:35 -0600
Message-ID: <20230207234239.30720-4-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207234239.30720-1-afd@ti.com>
References: <20230207234239.30720-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 23:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15745

If we rename files in the source directory the next time we need to rebuild
the original files will be gone and build will fail. Use symlinks instead.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index c09f67b5..3c372b32 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -125,18 +125,18 @@ do_install:prepend:j721s2-hs-evm() {
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


