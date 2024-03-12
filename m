Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1106BC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:42:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13346.1710258166814283654
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yvgSwa3z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgjol042824;
	Tue, 12 Mar 2024 10:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710258165;
	bh=C3pEnhvmSV+nfapCaRMxLc2vN1o32WsMcvVsYUypsoQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yvgSwa3zGj9LJxmKaqdd6PKUBU8LQxtnCXudWYueW0qxjQKkFuNVOrrI/lTnB+Qfx
	 B3+r5kZPKpi49TJSmbJ+kVIwm3c5NfSvg26faYLxV0NzqVrHJ4SF5s9fETNd2HUEUS
	 /IpGbXrTplKfNP6mfHG1aDHGOJ8DocJiSXPtWPEo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFgjt0055527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:42:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:42:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:42:45 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgixH010046;
	Tue, 12 Mar 2024 10:42:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/5] prueth-fw: Combine PRU-ETH firmwares into single package
Date: Tue, 12 Mar 2024 10:42:40 -0500
Message-ID: <20240312154243.17627-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312154243.17627-1-afd@ti.com>
References: <20240312154243.17627-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 15:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17515

The firmware for different machines and versions are named differently so
there is no need to have machine specific packages for each of these
firmwares. Move all the PRU-ETH firmwares into single package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +-
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      | 24 ----------------
 .../prueth-fw/prueth-fw-am65x_git.bb          | 22 ---------------
 .../recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb | 28 +++++++++++++------
 6 files changed, 23 insertions(+), 57 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
 delete mode 100644 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index f6eb6f0c..3d8e11b4 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -6,4 +6,4 @@ require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 85652eef..fb71d271 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -21,4 +21,4 @@ TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 7c9d5fb1..80a7744a 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -26,4 +26,4 @@ TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-am65x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw-am65x"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
deleted file mode 100644
index 4b6ef75d..00000000
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
-
-TARGET = " \
-    am65x-sr2-pru0-prueth-fw.elf \
-    am65x-sr2-pru1-prueth-fw.elf \
-    am65x-sr2-rtu0-prueth-fw.elf \
-    am65x-sr2-rtu1-prueth-fw.elf \
-    am65x-sr2-txpru0-prueth-fw.elf \
-    am65x-sr2-txpru1-prueth-fw.elf \
-"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
-	done
-}
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
deleted file mode 100644
index 20b2bfb9..00000000
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${PRUETH_FW_AM65X_VERSION}"
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "am65xx"
-
-TARGET = " \
-    am65x-pru0-prueth-fw.elf \
-    am65x-pru1-prueth-fw.elf \
-    am65x-rtu0-prueth-fw.elf \
-    am65x-rtu1-prueth-fw.elf \
-"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
-	done
-}
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 463f3faa..b85355e4 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -1,17 +1,29 @@
-SUMMARY = "PRU Ethernet firmware for AM57xx, AM437x and AM335x"
+SUMMARY = "PRU Ethernet firmware"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TARGET = ""
-TARGET:ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
-TARGET:ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
-TARGET:am57xx = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+TARGET = " \
+    am335x-pru0-prueth-fw.elf \
+    am335x-pru1-prueth-fw.elf \
+    am437x-pru0-prueth-fw.elf \
+    am437x-pru1-prueth-fw.elf \
+    am57xx-pru0-prueth-fw.elf \
+    am57xx-pru1-prueth-fw.elf \
+    am65x-pru0-prueth-fw.elf \
+    am65x-pru1-prueth-fw.elf \
+    am65x-rtu0-prueth-fw.elf \
+    am65x-rtu1-prueth-fw.elf \
+    am65x-sr2-pru0-prueth-fw.elf \
+    am65x-sr2-pru1-prueth-fw.elf \
+    am65x-sr2-rtu0-prueth-fw.elf \
+    am65x-sr2-rtu1-prueth-fw.elf \
+    am65x-sr2-txpru0-prueth-fw.elf \
+    am65x-sr2-txpru1-prueth-fw.elf \
+"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-- 
2.39.2


