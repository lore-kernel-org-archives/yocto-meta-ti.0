Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C240C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:57:00 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.178855.1698253010484298755
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aN+EX8ec;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGunGw028606;
	Wed, 25 Oct 2023 11:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698253009;
	bh=/bo6ew7z2/jNRb4Q05l04QTGGJyFew7py4yUFvSXcy4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aN+EX8ectf4ImUpHDiZ6YlX6H735XpFYWAXXJyI9DxxIdTn6u+jhqGdg0lgaq2Dem
	 6aWD3x5V5ZBmarnF+JR5Q9jdfjzfPce9JATI940w2Yz5iByWTHWastVnGo0zbV0bTA
	 hzijRMcTalQ3MqlYmlcSPB60Loz9BaMOFUDk7xT0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGunFJ016914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:49 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVET008415;
	Wed, 25 Oct 2023 11:56:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 6/8] ti-linux-fw: Add several more firmware helper lines to this common include
Date: Wed, 25 Oct 2023 11:56:28 -0500
Message-ID: <20231025165630.2274889-6-afd@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17193

These are all useful for firmware recipes but some recipes did not have
them. For firmware including ti-linux-fw.inc let's add these all to
one spot and remove them from any recipe that did already have these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb     |  4 ----
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb           |  2 --
 .../recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb   |  2 --
 .../recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb      |  2 --
 .../pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb           |  2 --
 .../recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb     |  2 --
 .../recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb     |  2 --
 .../recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb |  2 --
 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb |  2 --
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb       | 12 ------------
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb     | 12 ------------
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc        | 14 ++++++++++++++
 .../recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     | 12 ------------
 13 files changed, 14 insertions(+), 56 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index a9ee7a8e..3feca08c 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -30,7 +30,3 @@ do_install() {
 	install -d ${D}${nonarch_base_libdir}/firmware/cnm
 	install -m 0644 ${S}/cnm/${SOURCE_WAVE521C} ${D}${nonarch_base_libdir}/firmware/cnm/${TARGET_WAVE521C}
 }
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 8fe1f838..2c0736ed 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -24,5 +24,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index 4f648075..8b15ab7f 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -22,5 +22,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
index 99b9e11c..463f3faa 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw_5.6.15.bb
@@ -19,5 +19,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
index a1fe13d3..ea39d73d 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
@@ -24,5 +24,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
index 2cba6350..fe99cb3e 100644
--- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_2.17.25.bb
@@ -20,5 +20,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
index 807cf941..842621f6 100644
--- a/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
+++ b/meta-ti-bsp/recipes-bsp/pruprp-fw/pruprp-fw_2.17.25.bb
@@ -20,5 +20,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index b89e8203..63c2d311 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -24,5 +24,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
index d612cdf0..755f93b9 100644
--- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
+++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw_3.2.9.bb
@@ -19,5 +19,3 @@ do_install() {
 		install -m 0644 ${S}/ti-pruss/$f ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
 	done
 }
-
-INSANE_SKIP:${PN} = "arch"
diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index 06c57365..46876ba5 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -99,16 +99,4 @@ ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw] = "${INSTALL_DM_FW_DIR}/${DM_FIRMWARE}"
 
 ALTERNATIVE_PRIORITY = "10"
 
-# This is used to prevent the build system to_strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-# This is used to prevent the build system to split the debug info in a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-INSANE_SKIP:${PN} += "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
-
 addtask deploy after do_install
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 4bf7f8f1..b844eb38 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -99,15 +99,3 @@ ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}
 ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
 
 ALTERNATIVE_PRIORITY = "5"
-
-# This is used to prevent the build system to_strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-# This is used to prevent the build system to split the debug info in a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-INSANE_SKIP:${PN} += "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f5132c56..6e64a9cc 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -30,3 +30,17 @@ CLEANBROKEN = "1"
 
 # Make sure that lib/firmware, and all its contents are part of the package
 FILES:${PN} = "${nonarch_base_libdir}/firmware"
+
+# This is used to prevent the build system from stripping the firmwares
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
+# This is used to prevent the build system from splitting out the firmware debug info into a separate file
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+# Disable arch checking as firmware is likely to be a different arch from the Yocto build
+INSANE_SKIP:${PN} += "arch"
+
+# Firmware in Linux Firmware has no configure nor build steps
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 056576de..bde206f0 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -347,15 +347,3 @@ ALTERNATIVE_TARGET[j784s4-c71_3-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}"
 ALTERNATIVE_TARGET[j784s4-c71_3-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_4_FW}.signed"
 
 ALTERNATIVE_PRIORITY = "10"
-
-# This is used to prevent the build system to_strip the executables
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-# This is used to prevent the build system to split the debug info in a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-INSANE_SKIP:${PN} += "arch"
-
-# we don't want to configure and build the source code
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
-- 
2.39.2


