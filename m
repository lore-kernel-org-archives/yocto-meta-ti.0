Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E86C64EC7
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6625.1675813361890647837
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yNdDYbXP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317Nge8N008723;
	Tue, 7 Feb 2023 17:42:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813360;
	bh=eG7qvk7rbG5iWc4YkVZdTrnaLUwswxEYV/Y64XhFaaI=;
	h=From:To:CC:Subject:Date;
	b=yNdDYbXPK0uM+LqQK+LJyhorRFjm0/SkKbypAVfY7dl1ZwiLhfcg+mJARCYDjxf+H
	 K7DNSNnJ79rMAtQvbqeg9pM8kiygIFEmmscg+HGkM/qFvIhbZFDocVCm8jbYNrM9QP
	 Fndqa8CvWWGVSXhXBRCPhtuChLaG571UO8zxzHh0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317Nge2J032417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:40 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:39 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTc050846;
	Tue, 7 Feb 2023 17:42:39 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/8] ti-rtos-firmware: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
Date: Tue, 7 Feb 2023 17:42:32 -0600
Message-ID: <20230207234239.30720-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 23:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15743

Use ti-k3-secdev native package to provide secure-binary-image.sh script
when it is not passed on as an environment variable. This fixes and issue
with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
when building for HS-FS platforms.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 9a6da088..6c59b8ab 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -31,9 +31,11 @@ CLEANBROKEN = "1"
 PR = "${INC_PR}.0"
 
 # Secure Build
+include recipes-ti/includes/ti-paths.inc
 DEPENDS += "openssl-native"
-
-TI_SECURE_DEV_PKG ?= ""
+DEPENDS:append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+export TI_SECURE_DEV_PKG
 
 RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
 RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
@@ -49,7 +51,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 # J721e HS support
 do_install:prepend:j721e-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -80,7 +81,6 @@ do_install:prepend:j721e-hs-evm() {
 
 # J7200 HS support
 do_install:prepend:j7200-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -101,7 +101,6 @@ do_install:prepend:j7200-hs-evm() {
 
 # J721s2 HS support
 do_install:prepend:j721s2-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
-- 
2.39.1


