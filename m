Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542DEC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:05:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2859.1750748701892001916
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SBLFpYOF;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: danishanwar@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O751WQ1716876
	for <meta-ti@lists.yoctoproject.org>; Tue, 24 Jun 2025 02:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750748701;
	bh=ZQ/T3cuTkrjy/UP1MNsTUt3vgqUc3D9WW5iDvDMAKSo=;
	h=From:To:CC:Subject:Date;
	b=SBLFpYOFlw3ik5xdnzbQN7Y79AgtALaXd2rCN8dt1+/yOFmlTKC0rWTUk5Eq6OYcR
	 lhZTIcWfMKQADnvvYIj1tma56Tq8ouyA6L6/mKzWXI+ioFTUSK/OABecPK5w19Svne
	 Zq7GBssvx59+cEYgAJ2yx0kmv4fMeIVoYBdvTujQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O751hS1494207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 24 Jun 2025 02:05:01 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 02:05:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 02:05:00 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O750sQ1070692;
	Tue, 24 Jun 2025 02:05:00 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 55O74x7v025927;
	Tue, 24 Jun 2025 02:05:00 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <h-mittal1@ti.com>, <c-shilwant@ti.com>, <reatmon@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: [meta-ti][scarthgap][PATCH] pru*-fw: Add AM64x pru firmwares
Date: Tue, 24 Jun 2025 12:34:57 +0530
Message-ID: <20250624070457.2905644-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18669

Add support for packaging AM64x PRU firmwares separately

Previously, AM64x platforms used the same PRU firmware binaries as
AM65x (the "am65x-sr2-*" files). This patch updates the recipes to
package dedicated AM64x PRU firmware binaries, ensuring that AM64x
devices use the correct firmware files.

The following changes are made:
- Add AM64x-specific firmware binaries to the TARGET lists in the
  prueth-fw, pruhsr-fw, pruprp-fw, and prusw-fw recipes.
- Update COMPATIBLE_MACHINE in pruprp-fw to include "am64xx".
- Add new PRU PRP firmware binaries for AM64x, as AM64x now supports
  PRP mode.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
The corresponding AM64x firmware binaries are merged to
ti-linux-firmware-next [1] 

[1] https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=29d948b63a48ec4ff7883d2e246dfb7b6c8153aa

 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb  | 6 ++++++
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb | 6 ++++++
 meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb | 8 +++++++-
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb     | 6 ++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index b85355e4..d3654ac5 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -23,6 +23,12 @@ TARGET = " \
     am65x-sr2-rtu1-prueth-fw.elf \
     am65x-sr2-txpru0-prueth-fw.elf \
     am65x-sr2-txpru1-prueth-fw.elf \
+    am64x-sr2-pru0-prueth-fw.elf \
+    am64x-sr2-pru1-prueth-fw.elf \
+    am64x-sr2-rtu0-prueth-fw.elf \
+    am64x-sr2-rtu1-prueth-fw.elf \
+    am64x-sr2-txpru0-prueth-fw.elf \
+    am64x-sr2-txpru1-prueth-fw.elf \
 "
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 3b06de9c..aa94f287 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -20,6 +20,12 @@ TARGET = " \
     am65x-sr2-rtu1-pruhsr-fw.elf \
     am65x-sr2-txpru0-pruhsr-fw.elf \
     am65x-sr2-txpru1-pruhsr-fw.elf \
+    am64x-sr2-pru0-pruhsr-fw.elf \
+    am64x-sr2-pru1-pruhsr-fw.elf \
+    am64x-sr2-rtu0-pruhsr-fw.elf \
+    am64x-sr2-rtu1-pruhsr-fw.elf \
+    am64x-sr2-txpru0-pruhsr-fw.elf \
+    am64x-sr2-txpru1-pruhsr-fw.elf \
 "
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 9d5136c2..4e1dd0e3 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -5,7 +5,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PE = "1"
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx|am64xx"
 
 TARGET = " \
 	am335x-pru0-pruprp-fw.elf \
@@ -14,6 +14,12 @@ TARGET = " \
 	am437x-pru1-pruprp-fw.elf \
 	am57xx-pru0-pruprp-fw.elf \
 	am57xx-pru1-pruprp-fw.elf \
+	am64x-sr2-pru0-pruprp-fw.elf \
+	am64x-sr2-pru1-pruprp-fw.elf \
+	am64x-sr2-rtu0-pruprp-fw.elf \
+	am64x-sr2-rtu1-pruprp-fw.elf \
+	am64x-sr2-txpru0-pruprp-fw.elf \
+	am64x-sr2-txpru1-pruprp-fw.elf \
 "
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index be407363..750183ba 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -19,6 +19,12 @@ TARGET = " \
 	am65x-sr2-rtu1-prusw-fw.elf \
 	am65x-sr2-txpru0-prusw-fw.elf \
 	am65x-sr2-txpru1-prusw-fw.elf \
+	am64x-sr2-pru0-prusw-fw.elf \
+	am64x-sr2-pru1-prusw-fw.elf \
+	am64x-sr2-rtu0-prusw-fw.elf \
+	am64x-sr2-rtu1-prusw-fw.elf \
+	am64x-sr2-txpru0-prusw-fw.elf \
+	am64x-sr2-txpru1-prusw-fw.elf \
 "
 
 do_install() {

base-commit: dfe56e84bb72aab43a19600199542f639ce28fd6
-- 
2.34.1


