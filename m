Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C0C3A59F
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.9006.1649178284352487893
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 10:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N+hNkMcq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235H4fl5119452;
	Tue, 5 Apr 2022 12:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649178281;
	bh=79YClkyuSJHO2moZO+H7fPm3HyoYFmV0e1U0FkafbUg=;
	h=From:To:Subject:Date;
	b=N+hNkMcqJJVdGGlbeDjUPjGbP0FugBgihSNgtoQLmgOrY/MzrulmjjDh9dXXjScse
	 JvEYMYgCy+BIta43z6Q1uwzZFT/PtjHENa2xESmISLQoB3SkGOA3XWNY+JDZwKDMKM
	 6/7Mteetn/uxFKVFCj4+kQ8H30KEIcn4q5ThHokU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235H4f3R103241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Apr 2022 12:04:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 12:04:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 12:04:41 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235H4fYc091399;
	Tue, 5 Apr 2022 12:04:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nbmbg-0006wB-VA; Tue, 05 Apr 2022 12:04:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] Rename the am62xx-evm platform to am62xx-sk
Date: Tue, 5 Apr 2022 12:04:40 -0500
Message-ID: <20220405170440.26628-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14593

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 10 +++++-----
 recipes-bsp/u-boot/u-boot-ti.inc       |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 099473b4..8ff822bf 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -6,7 +6,7 @@ DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_am62xx-sk-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
@@ -30,7 +30,7 @@ SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_am62xx-sk-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
 
@@ -65,7 +65,7 @@ EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-s
 EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am62xx-sk-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -173,14 +173,14 @@ do_deploy_am64xx-hs-evm-k3r5() {
         install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
-do_install_am62xx-evm-k3r5() {
+do_install_am62xx-sk-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
 }
 
-do_deploy_am62xx-evm-k3r5() {
+do_deploy_am62xx-sk-k3r5() {
 	install -d ${DEPLOYDIR}
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 231b7647..c9a11045 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -70,7 +70,7 @@ SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_am62xx-sk-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -421,7 +421,7 @@ do_deploy_append_am64xx-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
-do_deploy_append_am62xx-evm-k3r5 () {
+do_deploy_append_am62xx-sk-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
-- 
2.17.1


