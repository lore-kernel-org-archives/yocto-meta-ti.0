Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C58C25B70
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:56:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.49013.1698252994792017247
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PnP5HkwM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuWWi047974;
	Wed, 25 Oct 2023 11:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698252992;
	bh=SZ22nUvuDcTd4BTG3foZjoWw9aaNgeq0N1orgFbbtGk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PnP5HkwMGSUCQohLEHAmabRBPnSk1jmNP63wdQqeQgebm5IEKVKTt38zbhdj8YHBb
	 OcYtUvOnaxjh9hlLCHg+0YJODKFgEqQMHZ0EoviS+qiz5wgbJvCmlIIDR0edR0RoDU
	 8qz/TcpW4EX+Eu83+H33o2l7tDVvy9IDFfBgTSPQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGuWUa016769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:32 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVEP008415;
	Wed, 25 Oct 2023 11:56:32 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/8] ti-linux-fw: Make CLEANBROKEN and FILES part of common include
Date: Wed, 25 Oct 2023 11:56:24 -0500
Message-ID: <20231025165630.2274889-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165630.2274889-1-afd@ti.com>
References: <20231025165630.2274889-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17187

These are common for all recipes that include ti-linux-fw.inc, add
it to this include file and remove from each recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb       | 4 ----
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb       | 5 -----
 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb           | 4 ----
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ----
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb     | 4 ----
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb        | 5 -----
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb | 4 ----
 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb       | 4 ----
 meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb       | 4 ----
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb   | 4 ----
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb           | 5 -----
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb                 | 5 -----
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb               | 5 -----
 .../recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb       | 4 ----
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 5 +++++
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb           | 4 ----
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb       | 5 -----
 17 files changed, 5 insertions(+), 70 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 5ae0cb7c..4263e40f 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
 PV = "${CADENCE_MHDP_FW_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -21,5 +19,3 @@ do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cadence
 	install -m 0644 ${S}/cadence/${TARGET} ${D}${nonarch_base_libdir}/firmware/cadence/${TARGET}
 }
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index a667d335..b1bc20b9 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
 PV = "${CNM_WAVE521_FW_VERSION}"
 PR = "${INC_PR}.1"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -34,9 +32,6 @@ do_install() {
 	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${nonarch_base_libdir}/firmware/cnm/${TARGET_WAVE521C}
 }
 
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 # we don't want to configure and build the source code
 do_compile[noexec] = "1"
 do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
index 00a6e51b..5cd6e131 100644
--- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684da
 PV = "${GOODIX_FW_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "dra7xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -22,5 +20,3 @@ do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware
 	install -m 0644 ${S}/ti-evm/${ORIGIN} ${D}${nonarch_base_libdir}/firmware/${TARGET}
 }
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 28c02698..5d95beab 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,6 +27,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index c656ceab..f0d4d16d 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${PRUETH_FW_AM65X_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "am65xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -27,6 +25,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 4f298a2c..c7db85fc 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -4,8 +4,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -24,7 +22,4 @@ do_install() {
 	done
 }
 
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
index c31af832..12f7b729 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,6 +27,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 69ccb31a..47c272a8 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PE = "1"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -25,6 +23,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index f774db58..fc8e423e 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PE = "1"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -25,6 +23,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index e0cf2cb5..208f8764 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -5,8 +5,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,6 +27,4 @@ do_install() {
 	done
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index 5b38a048..68649cf2 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -4,8 +4,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -24,7 +22,4 @@ do_install() {
 	done
 }
 
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 49638ee9..06c57365 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -17,8 +17,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${TI_DM_FW_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 # Secure Build
 inherit ti-secdev
 
@@ -101,9 +99,6 @@ ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 
 ALTERNATIVE_PRIORITY = "10"
 
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${nonarch_base_libdir}/firmware"
-
 # This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index e1d442d3..4bf7f8f1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -17,8 +17,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${CORESDK_RTOS_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 # Secure Build
 inherit ti-secdev
 
@@ -102,9 +100,6 @@ ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}
 
 ALTERNATIVE_PRIORITY = "5"
 
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${nonarch_base_libdir}/firmware"
-
 # This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
index bd103198..7fb8f8f5 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -7,8 +7,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${IMG_DEC_FW_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 COMPATIBLE_MACHINE = "j721e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,5 +18,3 @@ do_install() {
         install -d ${D}${nonarch_base_libdir}/firmware
         install -m 0644 ${S}/ti-img/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}
 }
-
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 149fcc07..f5132c56 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,3 +25,8 @@ BRANCH ?= "ti-linux-firmware"
 SRC_URI = "git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
+
+CLEANBROKEN = "1"
+
+# Make sure that lib/firmware, and all its contents are part of the package
+FILES:${PN} = "${nonarch_base_libdir}/firmware"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 2ad93a5d..0eb03b92 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -14,8 +14,6 @@ LD[unexport] = "1"
 PV = "${TI_SYSFW_VERSION}"
 PR = "${INC_PR}.0"
 
-CLEANBROKEN = "1"
-
 do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
@@ -23,8 +21,6 @@ do_install() {
 	install -m 644 ${S}/ti-sysfw/ti-fs-stub-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 }
 
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
 do_deploy(){
 }
 
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 751b10d6..056576de 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -28,8 +28,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 PV = "${CORESDK_RTOS_VERSION}"
 PR = "${INC_PR}.1"
 
-CLEANBROKEN = "1"
-
 # Secure Build
 inherit ti-secdev
 
@@ -350,9 +348,6 @@ ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}.sig
 
 ALTERNATIVE_PRIORITY = "10"
 
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${nonarch_base_libdir}/firmware"
-
 # This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
-- 
2.39.2


