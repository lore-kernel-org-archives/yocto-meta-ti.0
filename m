Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78D1C54E68
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:42:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.13348.1710258167274872050
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XNtYTpEO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgjxa081941;
	Tue, 12 Mar 2024 10:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710258165;
	bh=O/T15Paob7sGbmu0R3Tzu6APIHDNgup2cD8cXyKjFhc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XNtYTpEObE8+PaQuFhrwDxbuom13krQV7y8PAHyWdY0SgwmCBvjkSy+cXQgBvbFD+
	 RwhZ50ubxvBFNVNSsu5KvjURUcs+fHznwmXqvWlmg0ALhlj0kXJVOMGuua174LE/TQ
	 NZpwTNmLVLPuAu9sOi4bnnuKjdR7aiwdkt2Z6sf8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFgjgk114042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:42:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:42:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:42:45 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgixJ010046;
	Tue, 12 Mar 2024 10:42:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 4/5] prusw-fw: Combine PRU-Switch firmwares into single package
Date: Tue, 12 Mar 2024 10:42:42 -0500
Message-ID: <20240312154243.17627-4-afd@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 15:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17518

The firmware for different machines and versions are named differently so
there is no need to have machine specific packages for each of these
firmwares. Move all the PRU-Switch firmwares into single package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  2 +-
 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 24 -------------------
 .../recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb    | 24 ++++++++++++-------
 4 files changed, 18 insertions(+), 34 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index 7df93db7..60eed90f 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -6,4 +6,4 @@ require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index de65829c..cfade2fa 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -21,4 +21,4 @@ TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
deleted file mode 100644
index 6e296e7c..00000000
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "PRU Ethernet Switch firmware for AM65xx SR2.0"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
-
-TARGET = " \
-    am65x-sr2-pru0-prusw-fw.elf \
-    am65x-sr2-pru1-prusw-fw.elf \
-    am65x-sr2-rtu0-prusw-fw.elf \
-    am65x-sr2-rtu1-prusw-fw.elf \
-    am65x-sr2-txpru0-prusw-fw.elf \
-    am65x-sr2-txpru1-prusw-fw.elf \
-"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
-	done
-}
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 755f93b9..be407363 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -1,17 +1,25 @@
-SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
+SUMMARY = "PRU Switch firmware"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TARGET = ""
-TARGET:ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
-TARGET:ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
-TARGET:am57xx = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
+TARGET = " \
+	am335x-pru0-prusw-fw.elf \
+	am335x-pru1-prusw-fw.elf \
+	am437x-pru0-prusw-fw.elf \
+	am437x-pru1-prusw-fw.elf \
+	am57xx-pru0-prusw-fw.elf \
+	am57xx-pru1-prusw-fw.elf \
+	am65x-sr2-pru0-prusw-fw.elf \
+	am65x-sr2-pru1-prusw-fw.elf \
+	am65x-sr2-rtu0-prusw-fw.elf \
+	am65x-sr2-rtu1-prusw-fw.elf \
+	am65x-sr2-txpru0-prusw-fw.elf \
+	am65x-sr2-txpru1-prusw-fw.elf \
+"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-- 
2.39.2


