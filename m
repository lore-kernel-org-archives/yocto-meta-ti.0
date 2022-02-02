Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2298.1643826805991948815
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Tb8hTEaH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IXNbL092174;
	Wed, 2 Feb 2022 12:33:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826803;
	bh=CE6MBVZMEaaSFDqhW3ot8rFB93Lh/SOqkR59raB32pA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Tb8hTEaHdFj7Uwf+xzxOkQ/KGeeO4D4Rl6JEQ50XArXNQ95TilXgi2dK9Z8yHplmK
	 BE5eO2Oy2Tf4jhSpXbEv9fWHL25OUtYQyHyk+ZU0yGuAchnSuFFuTMFCBH+KSPlc5U
	 M+Ue2nV57jZxCSTKJ2iMtBvSB6H+usF4iRgIVw3U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IXNLW028226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:33:23 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:33:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:33:23 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IXNuD091524;
	Wed, 2 Feb 2022 12:33:23 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKRX-0007ef-FH; Wed, 02 Feb 2022 12:33:23 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 04/12] recipes-bsp/ti-rtos: Use target_c7x_0 instead of just c7x
Date: Wed, 2 Feb 2022 12:33:14 -0600
Message-ID: <20220202183322.29360-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202183322.29360-1-reatmon@ti.com>
References: <20220202183322.29360-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Lets enumerate the C7x target instead of defaulting as a since C7x.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb | 4 ++--
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb            | 4 ++--
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index 79e5bdb9..5dc43b11 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -113,7 +113,7 @@ TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
 TARGET_C66_0_j7 = "j7-c66_0-fw"
 TARGET_C66_1_j7 = "j7-c66_1-fw"
-TARGET_C7X_j7 = "j7-c71_0-fw"
+TARGET_C7X_0_j7 = "j7-c71_0-fw"
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -126,7 +126,7 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAI
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 
 # Create the firmware alternatives
 
diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
index 1be28365..93a8a3a1 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -103,7 +103,7 @@ TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
 TARGET_C66_0_j7 = "j7-c66_0-fw"
 TARGET_C66_1_j7 = "j7-c66_1-fw"
-TARGET_C7X_j7 = "j7-c71_0-fw"
+TARGET_C7X_0_j7 = "j7-c71_0-fw"
 
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -116,7 +116,7 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAI
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 
 # Create the firmware alternatives
 
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 6d24f7fe..e72c6fcb 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -196,7 +196,7 @@ TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
 TARGET_C66_0_j7 = "j7-c66_0-fw"
 TARGET_C66_1_j7 = "j7-c66_1-fw"
-TARGET_C7X_j7 = "j7-c71_0-fw"
+TARGET_C7X_0_j7 = "j7-c71_0-fw"
 
 TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
@@ -225,7 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAI
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X_0}"
 
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
-- 
2.17.1

