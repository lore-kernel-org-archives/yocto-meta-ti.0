Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEB7C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 19:00:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2113.1672772413450243386
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 11:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CJ9tPfjd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303J0CL7023905;
	Tue, 3 Jan 2023 13:00:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672772412;
	bh=EEeavfTghdnUx5lfzTwBlRJO6dbpohSdE74/iSDNUus=;
	h=From:To:CC:Subject:Date;
	b=CJ9tPfjddAzliFPd/ATKhkxXq97OIBGIXuT06Liv7hNm93rdc8xpfWmu1ZFHimH4/
	 F17LlDXzEGWlwqwerSS2H/8C+lfCr5QDjrFY3hwNIWZRZJVYQLirEGcgaS9/okdk90
	 qsL9abZRxFZQR4VgWRZmUqbPL/4UCd2JW4KKOdSo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303J0C4A105539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 13:00:12 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 13:00:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 13:00:11 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303J0BFC032213;
	Tue, 3 Jan 2023 13:00:11 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Add am57xx.inc allowing use of SoC name over full EVM name
Date: Tue, 3 Jan 2023 13:00:11 -0600
Message-ID: <20230103190011.10208-1-afd@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Jan 2023 19:00:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15513

In many spots we have to use the full EVM name for each EVM using the
AM57x SoC leading to missed features on some EVMs. Add the am57xx name
so we can generically add for AM57x.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf               | 2 +-
 meta-ti-bsp/conf/machine/beagle-x15.conf               | 2 +-
 meta-ti-bsp/conf/machine/include/am57xx.inc            | 5 +++++
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb  | 5 ++---
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb | 5 ++---
 meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb | 6 ++----
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb     | 5 ++---
 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc   | 3 +--
 meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc           | 2 +-
 9 files changed, 17 insertions(+), 18 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/am57xx.inc

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index e320477b..9fbff7c6 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: AM57xx EVM
 #@DESCRIPTION: Machine configuration for the TI AM57xx EVM
 
-require conf/machine/include/dra7xx.inc
+require conf/machine/include/am57xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index beb0d892..00b8c410 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -2,7 +2,7 @@
 #@NAME: BeagleBoard X15
 #@DESCRIPTION: Machine configuration for the BeagleBoard X15
 
-require conf/machine/include/dra7xx.inc
+require conf/machine/include/am57xx.inc
 
 KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
 
diff --git a/meta-ti-bsp/conf/machine/include/am57xx.inc b/meta-ti-bsp/conf/machine/include/am57xx.inc
new file mode 100644
index 00000000..6c52883b
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am57xx.inc
@@ -0,0 +1,5 @@
+require conf/machine/include/omap-a15.inc
+SOC_FAMILY:append = ":dra7xx"
+SOC_FAMILY:append = ":am57xx"
+
+MACHINE_FEATURES += "pci"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 9ccce938..4f298a2c 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,8 +15,7 @@ S = "${WORKDIR}/git"
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-prueth-fw.elf am335x-pru1-prueth-fw.elf"
 TARGET:ti43x = "am437x-pru0-prueth-fw.elf am437x-pru1-prueth-fw.elf"
-TARGET:am57xx-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
-TARGET:am57xx-hs-evm = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+TARGET:am57xx = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 4ffd13aa..69ccb31a 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,8 +16,7 @@ S = "${WORKDIR}/git"
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-pruhsr-fw.elf am335x-pru1-pruhsr-fw.elf"
 TARGET:ti43x = "am437x-pru0-pruhsr-fw.elf am437x-pru1-pruhsr-fw.elf"
-TARGET:am57xx-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
-TARGET:am57xx-hs-evm = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
+TARGET:am57xx = "am57xx-pru0-pruhsr-fw.elf am57xx-pru1-pruhsr-fw.elf"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 23c422dd..f774db58 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,9 +16,7 @@ S = "${WORKDIR}/git"
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-pruprp-fw.elf am335x-pru1-pruprp-fw.elf"
 TARGET:ti43x = "am437x-pru0-pruprp-fw.elf am437x-pru1-pruprp-fw.elf"
-TARGET:am57xx-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
-TARGET:am57xx-hs-evm = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
-
+TARGET:am57xx = "am57xx-pru0-pruprp-fw.elf am57xx-pru1-pruprp-fw.elf"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 8d784768..5b38a048 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -15,8 +15,7 @@ S = "${WORKDIR}/git"
 TARGET = ""
 TARGET:ti33x = "am335x-pru0-prusw-fw.elf am335x-pru1-prusw-fw.elf"
 TARGET:ti43x = "am437x-pru0-prusw-fw.elf am437x-pru1-prusw-fw.elf"
-TARGET:am57xx-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
-TARGET:am57xx-hs-evm = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
+TARGET:am57xx = "am57xx-pru0-prusw-fw.elf am57xx-pru1-prusw-fw.elf"
 
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-pruss
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 54e6fdc6..808a4766 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -12,8 +12,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " vpdma-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx = " goodix-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx-hs-evm = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx = " prueth-fw prusw-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx = " prueth-fw-am65x"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
index 4962a3ec..ec1e71be 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc-common.inc
@@ -9,4 +9,4 @@ PLATFORM = "UNKNOWN"
 PLATFORM:dra7xx = "DRA7XX"
 PLATFORM:omapl138 = "OMAPL138"
 
-ALT_PLATFORM:am57xx-evm = "AM572X AM571X"
+ALT_PLATFORM:am57xx = "AM572X AM571X"
-- 
2.38.1


