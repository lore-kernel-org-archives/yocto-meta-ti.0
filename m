Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F4BC54E60
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:42:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13347.1710258167124090840
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 08:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TYDx9EEI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgjsk027255;
	Tue, 12 Mar 2024 10:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710258165;
	bh=OBi785YamFYsikMymFu2u5rJJWe6K7HrEu7Tr8XWNQ4=;
	h=From:To:CC:Subject:Date;
	b=TYDx9EEIpVituoMd8MhaQvvsgASLO+h49nrtES6Nnd3p3YlgKUiZ9ueAOKXZbF5xJ
	 WVGlChr4m80BpSryAnXVATBz9Fn3e6YtLV2EtDq9R5+KGlMXBWNpYbuqnAuYmkjDtX
	 SAj2vWQ6Icdz5USToU5cEbaLlz1b+qPmYUuuf/kY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CFgjUl062539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 10:42:45 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 10:42:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 10:42:44 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CFgixG010046;
	Tue, 12 Mar 2024 10:42:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/5] recipes-bsp: Do not use MACHINE_ARCH when package is not machine specific
Date: Tue, 12 Mar 2024 10:42:39 -0500
Message-ID: <20240312154243.17627-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 15:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17516

Most firmware does not run on the host and is therefor not architecture
specific, at least as far as the package manager is concerned. Although
the firmware might not be useful on some machines, the package itself
is not machine specific. Remove PACKAGE_ARCH.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 --
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 2 --
 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     | 1 -
 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb             | 2 --
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 2 --
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 2 --
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb   | 2 --
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 2 --
 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 2 --
 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb              | 1 -
 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           | 1 -
 11 files changed, 19 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index d88bca6e..ed1c7817 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = "mhdp8546.bin"
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index d1b99979..1a2e911c 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -12,8 +12,6 @@ PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|am62axx|am62pxx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET_WAVE521C = "wave521c_codec_fw.bin"
 
 SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 61b1b986..95ba1e2d 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -4,7 +4,6 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
 
 PV = "6.2+git"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-alternatives
 
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index e58f2d58..ee3a94dc 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
 TARGET = "goodix_9271_cfg.bin"
 
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 2c0736ed..4b6ef75d 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = " \
     am65x-sr2-pru0-prueth-fw.elf \
     am65x-sr2-pru1-prueth-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index 8b15ab7f..20b2bfb9 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "am65xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = " \
     am65x-pru0-prueth-fw.elf \
     am65x-pru1-prueth-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
index ea39d73d..bc731094 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
@@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = " \
     am65x-sr2-pru0-pruhsr-fw.elf \
     am65x-sr2-pru1-pruhsr-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index 63c2d311..6e296e7c 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = " \
     am65x-sr2-pru0-prusw-fw.elf \
     am65x-sr2-pru1-prusw-fw.elf \
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index d295a1c1..74729c16 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -9,8 +9,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE = "j721e"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 TARGET = "pvdec_full_bin.fw"
 
 do_install() {
diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 7d16ae39..4ec09a70 100644
--- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -3,7 +3,6 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
 
 COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r1"
 
diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
index 2452d111..8af49577 100644
--- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
+++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
@@ -4,7 +4,6 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
 
 COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
 SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
-- 
2.39.2


