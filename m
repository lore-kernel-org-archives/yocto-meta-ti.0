Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9216FC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:42:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13345.1710258166616426382
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o2dPK42L;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgjbc027260;
	Tue, 12 Mar 2024 10:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710258165;
	bh=PVQbsHjdB71TqhAdEv/pHvNctJGZMIkbrya1jjwLqe0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o2dPK42LZRN2yZ4M4FQ2DUgz9FXOroWNurBQUi8hoP+vQ54F6UhBnOFzspv0YLAmC
	 MqlmTmZt7S7xQ5iy0K6P6JyowTwt9LKMFV9IVEex/hga6lYag230HNqdiBEAOWNAVE
	 mPFJGDi+w5QFZAJH1wV95EtDrILuWLQiLatfU5o0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFgj58055531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:42:45 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:42:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:42:44 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgixI010046;
	Tue, 12 Mar 2024 10:42:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 3/5] pruhsr-fw: Combine PRU-HSR firmwares into single package
Date: Tue, 12 Mar 2024 10:42:41 -0500
Message-ID: <20240312154243.17627-3-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17514

The firmware for different machines and versions are named differently so
there is no need to have machine specific packages for each of these
firmwares. Move all the PRU-HSR firmwares into single package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm.conf      |  2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  2 +-
 .../pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb      | 24 -------------------
 .../pruhsr-fw/pruhsr-fw_2.17.25.bb            | 24 ++++++++++++-------
 4 files changed, 18 insertions(+), 34 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index 3d8e11b4..7df93db7 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -6,4 +6,4 @@ require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index fb71d271..de65829c 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -21,4 +21,4 @@ TFA_BOARD = "lite"
 
 OPTEEMACHINE = "k3-am64x"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw-am65x-sr2"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
deleted file mode 100644
index bc731094..00000000
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "PRU HSR firmware for AM65xx SR2.0"
-
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
-PR = "${INC_PR}.0"
-
-COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
-
-TARGET = " \
-    am65x-sr2-pru0-pruhsr-fw.elf \
-    am65x-sr2-pru1-pruhsr-fw.elf \
-    am65x-sr2-rtu0-pruhsr-fw.elf \
-    am65x-sr2-rtu1-pruhsr-fw.elf \
-    am65x-sr2-txpru0-pruhsr-fw.elf \
-    am65x-sr2-txpru1-pruhsr-fw.elf \
-"
-
-do_install() {
-	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
-	done
-}
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index fe99cb3e..3b06de9c 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -1,18 +1,26 @@
-SUMMARY = "PRU HSR firmware for AM335x/AM437x/AM57xx"
+SUMMARY = "PRU HSR firmware"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PE = "1"
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am65xx|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TARGET = ""
-TARGET:ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
-TARGET:ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
-TARGET:am57xx = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
+TARGET = " \
+    am335x-pru0-pruhsr-fw.elf \
+    am335x-pru1-pruhsr-fw.elf \
+    am437x-pru0-pruhsr-fw.elf \
+    am437x-pru1-pruhsr-fw.elf \
+    am57xx-pru0-pruhsr-fw.elf \
+    am57xx-pru1-pruhsr-fw.elf \
+    am65x-sr2-pru0-pruhsr-fw.elf \
+    am65x-sr2-pru1-pruhsr-fw.elf \
+    am65x-sr2-rtu0-pruhsr-fw.elf \
+    am65x-sr2-rtu1-pruhsr-fw.elf \
+    am65x-sr2-txpru0-pruhsr-fw.elf \
+    am65x-sr2-txpru1-pruhsr-fw.elf \
+"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
-- 
2.39.2


