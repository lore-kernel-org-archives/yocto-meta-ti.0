Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C26C001DF
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 15:26:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.50601.1690212384069105193
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 08:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F3KLl8Ed;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36OFQMCL126232;
	Mon, 24 Jul 2023 10:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690212382;
	bh=4ddSTFwBpUjNHUDCQ3aJHXyjvPdkf+uTOTbqZslBhxQ=;
	h=From:To:Subject:Date;
	b=F3KLl8EdENVuWjn6u4i3YSEKDXMhIPDxsP07RzAQYkrc3MDRxONVgZQO0Nr/V8YpX
	 H3fwOhxU2M5KqMIu6NE6l3AJpEiDp3zssJqCDzvVEBH6oqspl0qQ1XsfjlmCTpDgIJ
	 a9UJzGNwj6ImN/4VyHK7UOLtdPo0aZLYLMw8tlMg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36OFQMZO041847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jul 2023 10:26:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jul 2023 10:26:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jul 2023 10:26:22 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36OFQMS9114231;
	Mon, 24 Jul 2023 10:26:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qNxS1-0006lk-Tn; Mon, 24 Jul 2023 10:26:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-rtos-firmware: Add missing links and reformat file for consistency
Date: Mon, 24 Jul 2023 10:26:21 -0500
Message-ID: <20230724152621.25980-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jul 2023 15:26:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16858

Add in missing *-sec links pointing to signed files especially for
j784s4.  Reformat file a little to make the groupings easier to
manage in the future when looking to see if -sec links are missing.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 353 ++++++++++--------
 1 file changed, 194 insertions(+), 159 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 7958c0e6..c560e7b4 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -53,14 +53,14 @@ C7X_3_FW   = "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW   = "ipc_echo_test_c7x_4_release_strip.xe71"
 
 IPC_FW_LIST = ""
-IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
-IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
-IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
-IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
 IPC_FW_LIST:am65xx =  "${MCU_1_0_FW} ${MCU_1_1_FW}"
 IPC_FW_LIST:am64xx =  "${MCU_1_0_FW} ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW}"
 IPC_FW_LIST:am62xx =  "                            ${MCU_2_0_FW}"
 IPC_FW_LIST:am62axx = "                            ${MCU_2_0_FW}                                                                                               ${C7X_1_FW}"
+IPC_FW_LIST:j721e =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                             ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"
+IPC_FW_LIST:j7200 =   "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW}"
+IPC_FW_LIST:j721s2 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW}                                                     ${C7X_1_FW} ${C7X_2_FW}"
+IPC_FW_LIST:j784s4 =  "              ${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW}                         ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"
 
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
@@ -105,225 +105,260 @@ do_install() {
 
 # Set up names for the firmwares
 ALTERNATIVE:${PN}:am65xx = "\
-                    am65x-mcu-r5f0_0-fw \
-                    am65x-mcu-r5f0_1-fw \
+                    am65x-mcu-r5f0_0-fw   am65x-mcu-r5f0_0-fw-sec \
+                    am65x-mcu-r5f0_1-fw   am65x-mcu-r5f0_1-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:am64xx = "\
-                    am64-main-r5f0_0-fw \
-                    am64-main-r5f0_1-fw \
-                    am64-main-r5f1_0-fw \
-                    am64-main-r5f1_1-fw \
-                    am64-mcu-m4f0_0-fw \
+                    am64-main-r5f0_0-fw   am64-main-r5f0_0-fw-sec \
+                    am64-main-r5f0_1-fw   am64-main-r5f0_1-fw-sec \
+                    am64-main-r5f1_0-fw   am64-main-r5f1_0-fw-sec \
+                    am64-main-r5f1_1-fw   am64-main-r5f1_1-fw-sec \
+                    am64-mcu-m4f0_0-fw    am64-mcu-m4f0_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:am62xx = "\
-                    am62-mcu-m4f0_0-fw \
-                    am62-main-r5f0_0-fw \
+                    am62-mcu-m4f0_0-fw    am62-mcu-m4f0_0-fw-sec \
+                    am62-main-r5f0_0-fw   am62-main-r5f0_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:am62axx = "\
-                    am62a-mcu-r5f0_0-fw \
-                    am62a-c71_0-fw \
+                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
+                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j721e = "\
-                    j7-mcu-r5f0_0-fw \
-                    j7-mcu-r5f0_1-fw \
-                    j7-main-r5f0_0-fw \
-                    j7-main-r5f0_1-fw \
-                    j7-main-r5f1_0-fw \
-                    j7-main-r5f1_1-fw \
-                    j7-c66_0-fw \
-                    j7-c66_1-fw \
-                    j7-c71_0-fw\
-                    j7-main-r5f0_0-fw-sec \
-                    j7-main-r5f0_1-fw-sec \
-                    j7-main-r5f1_0-fw-sec \
-                    j7-main-r5f1_1-fw-sec \
-                    j7-c66_0-fw-sec \
-                    j7-c66_1-fw-sec \
-                    j7-c71_0-fw-sec \
+                    j7-mcu-r5f0_0-fw    j7-mcu-r5f0_0-fw-sec \
+                    j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
+                    j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
+                    j7-main-r5f0_1-fw   j7-main-r5f0_1-fw-sec \
+                    j7-main-r5f1_0-fw   j7-main-r5f1_0-fw-sec \
+                    j7-main-r5f1_1-fw   j7-main-r5f1_1-fw-sec \
+                    j7-c66_0-fw         j7-c66_0-fw-sec \
+                    j7-c66_1-fw         j7-c66_1-fw-sec \
+                    j7-c71_0-fw         j7-c71_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j7200 = "\
-                    j7200-mcu-r5f0_0-fw \
-                    j7200-mcu-r5f0_1-fw \
-                    j7200-main-r5f0_0-fw \
-                    j7200-main-r5f0_1-fw \
-                    j7200-main-r5f0_0-fw-sec \
-                    j7200-main-r5f0_1-fw-sec \
+                    j7200-mcu-r5f0_0-fw    j7200-mcu-r5f0_0-fw-sec \
+                    j7200-mcu-r5f0_1-fw    j7200-mcu-r5f0_1-fw-sec \
+                    j7200-main-r5f0_0-fw   j7200-main-r5f0_0-fw-sec \
+                    j7200-main-r5f0_1-fw   j7200-main-r5f0_1-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j721s2 = "\
-                    j721s2-mcu-r5f0_0-fw \
-                    j721s2-mcu-r5f0_1-fw \
-                    j721s2-main-r5f0_0-fw \
-                    j721s2-main-r5f0_1-fw \
-                    j721s2-main-r5f1_0-fw \
-                    j721s2-main-r5f1_1-fw \
-                    j721s2-c71_0-fw \
-                    j721s2-c71_1-fw \
-                    j721s2-main-r5f0_0-fw-sec \
-                    j721s2-main-r5f0_1-fw-sec \
-                    j721s2-main-r5f1_0-fw-sec \
-                    j721s2-main-r5f1_1-fw-sec \
-                    j721s2-c71_0-fw-sec \
-                    j721s2-c71_1-fw-sec \
+                    j721s2-mcu-r5f0_0-fw    j721s2-mcu-r5f0_0-fw-sec \
+                    j721s2-mcu-r5f0_1-fw    j721s2-mcu-r5f0_1-fw-sec \
+                    j721s2-main-r5f0_0-fw   j721s2-main-r5f0_0-fw-sec \
+                    j721s2-main-r5f0_1-fw   j721s2-main-r5f0_1-fw-sec \
+                    j721s2-main-r5f1_0-fw   j721s2-main-r5f1_0-fw-sec \
+                    j721s2-main-r5f1_1-fw   j721s2-main-r5f1_1-fw-sec \
+                    j721s2-c71_0-fw         j721s2-c71_0-fw-sec \
+                    j721s2-c71_1-fw         j721s2-c71_1-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j784s4 = "\
-                    j784s4-mcu-r5f0_0-fw \
-                    j784s4-mcu-r5f0_1-fw \
-                    j784s4-main-r5f0_0-fw \
-                    j784s4-main-r5f0_1-fw \
-                    j784s4-main-r5f1_0-fw \
-                    j784s4-main-r5f1_1-fw \
-                    j784s4-main-r5f2_0-fw \
-                    j784s4-main-r5f2_1-fw \
-                    j784s4-c71_0-fw \
-                    j784s4-c71_1-fw \
-                    j784s4-c71_2-fw \
-                    j784s4-c71_3-fw \
+                    j784s4-mcu-r5f0_0-fw    j784s4-mcu-r5f0_0-fw-sec \
+                    j784s4-mcu-r5f0_1-fw    j784s4-mcu-r5f0_1-fw-sec \
+                    j784s4-main-r5f0_0-fw   j784s4-main-r5f0_0-fw-sec \
+                    j784s4-main-r5f0_1-fw   j784s4-main-r5f0_1-fw-sec \
+                    j784s4-main-r5f1_0-fw   j784s4-main-r5f1_0-fw-sec \
+                    j784s4-main-r5f1_1-fw   j784s4-main-r5f1_1-fw-sec \
+                    j784s4-main-r5f2_0-fw   j784s4-main-r5f2_0-fw-sec \
+                    j784s4-main-r5f2_1-fw   j784s4-main-r5f2_1-fw-sec \
+                    j784s4-c71_0-fw         j784s4-c71_0-fw-sec \
+                    j784s4-c71_1-fw         j784s4-c71_1-fw-sec \
+                    j784s4-c71_2-fw         j784s4-c71_2-fw-sec \
+                    j784s4-c71_3-fw         j784s4-c71_3-fw-sec \
                     "
 
 # Set up link names for the firmwares
 
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_1-fw"
-
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_0-fw"
-ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw"
-ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw"
-
-ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
-
-ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[am62a-c71_0-fw] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
-
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw"
-ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw"
-ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw"
-ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
-ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
-
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/am65x-mcu-r5f0_1-fw-sec"
+
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am64-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/am64-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/am64-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw]     = "${nonarch_base_libdir}/firmware/am64-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw]     = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/am64-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw]     = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am64-mcu-m4f0_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62-mcu-m4f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62-main-r5f0_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
+ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
+
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw]     = "${nonarch_base_libdir}/firmware/j7-c66_0-fw"
 ALTERNATIVE_LINK_NAME[j7-c66_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw]     = "${nonarch_base_libdir}/firmware/j7-c66_1-fw"
 ALTERNATIVE_LINK_NAME[j7-c66_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c66_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw]     = "${nonarch_base_libdir}/firmware/j7-c71_0-fw"
 ALTERNATIVE_LINK_NAME[j7-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7-c71_0-fw-sec"
 
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
-
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-mcu-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_1-fw-sec"
 
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw"
-ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw"
-ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
-ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
-
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j721s2-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-mcu-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw]     = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw]     = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw"
 ALTERNATIVE_LINK_NAME[j721s2-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw]     = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw"
 ALTERNATIVE_LINK_NAME[j721s2-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw]     = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw"
 ALTERNATIVE_LINK_NAME[j721s2-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j721s2-c71_1-fw-sec"
 
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_1-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_2-fw"
-ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f1_1-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f1_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f2_1-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f2_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-c71_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-c71_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw]     = "${nonarch_base_libdir}/firmware/j784s4-c71_1-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_1-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-c71_1-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw]     = "${nonarch_base_libdir}/firmware/j784s4-c71_2-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_2-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-c71_2-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw]     = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw"
+ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-c71_3-fw-sec"
 
 # Create the firmware alternatives
 
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
-ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-
-ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
-
-ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-
-ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[am62a-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
-
-ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j7-c66_0-fw] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}"
-ALTERNATIVE_TARGET[j7-c66_1-fw] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}"
-ALTERNATIVE_TARGET[j7-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
-
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}.signed"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_0_FW}.signed"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+
+ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
 ALTERNATIVE_TARGET[j7-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}"
 ALTERNATIVE_TARGET[j7-c66_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_1_FW}.signed"
+ALTERNATIVE_TARGET[j7-c66_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}"
 ALTERNATIVE_TARGET[j7-c66_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C66_2_FW}.signed"
+ALTERNATIVE_TARGET[j7-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 ALTERNATIVE_TARGET[j7-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
 
-ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
-
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
 
-ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j721s2-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
-ALTERNATIVE_TARGET[j721s2-c71_1-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
-
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j721s2-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
 ALTERNATIVE_TARGET[j721s2-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 ALTERNATIVE_TARGET[j721s2-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j721s2-c71_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
 ALTERNATIVE_TARGET[j721s2-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
 
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}"
-ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw] = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_0-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_1-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_2-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}"
-ALTERNATIVE_TARGET[j784s4-c71_3-fw] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
+ALTERNATIVE_TARGET[j784s4-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_1_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_0_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f1_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_3_1_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_4_0_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f2_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_4_1_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_2_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_2-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_3_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}"
+ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}.signed"
 
 ALTERNATIVE_PRIORITY = "10"
 
-- 
2.17.1


