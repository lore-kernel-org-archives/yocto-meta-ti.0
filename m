Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C134EC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 20:24:41 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.450.1751055879782286386
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 13:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fyT6LIPZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RKOccu2829285;
	Fri, 27 Jun 2025 15:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751055878;
	bh=9/vWPFBB72uNZoO6zNkZcRd7dhEPpzj7r+c7gZMkid0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fyT6LIPZEYFQlj1PQ/uuijnhovjPLaE9x7MlP6zUagNVMQWR+/SR4Xvo1/b0cVHi6
	 Fgy8kXMB92mclJ2rT3W9uFQaEmi9+97z9DBsVeEYpq2rTPn0U2jc4scMwXykJ5ZmJB
	 c+h1qYFShu3XE9iItpFN4B3X5azuJX7MmSaYryPU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RKOcKV695303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 15:24:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 15:24:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 15:24:38 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RKOboY3659840;
	Fri, 27 Jun 2025 15:24:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 3/3] meta-ti-bsp: Factor out a firmware common options helper
Date: Fri, 27 Jun 2025 15:24:36 -0500
Message-ID: <20250627202436.582570-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627202436.582570-1-afd@ti.com>
References: <20250627202436.582570-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 20:24:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18715

Firmware-only packages tend to set all the same long list of options,
factor these out into a helper include and include that in firmware-
only package.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb        | 10 +-------
 .../ti-linux-fw/firmware-common.inc           | 22 +++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   | 24 +------------------
 .../zephyr-fw/zephyr-openamp-rsc-table-fw.bb  | 21 +---------------
 4 files changed, 25 insertions(+), 52 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-linux-fw/firmware-common.inc

diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 95ba1e2d..5762ee8a 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -18,8 +18,7 @@ S = "${WORKDIR}/git"
 CPSW9G_FW_DIR = "${S}/ethfw"
 CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server_pdk_mem_map_strip.xer5f"
 
-# make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} += "${nonarch_base_libdir}/firmware"
+require recipes-bsp/ti-linux-fw/firmware-common.inc
 
 do_install() {
   install -d ${D}${nonarch_base_libdir}/firmware
@@ -32,10 +31,3 @@ ALTERNATIVE:${PN} = "j7-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/${CPSW9G_FW_FILENAME}"
 ALTERNATIVE_PRIORITY = "17"
-
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP:${PN} += "arch"
-
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/firmware-common.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/firmware-common.inc
new file mode 100644
index 00000000..fb9861b8
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/firmware-common.inc
@@ -0,0 +1,22 @@
+# Clean is broken for most firmware-only repos
+CLEANBROKEN = "1"
+
+# Make sure that lib/firmware, and all its contents are part of the package
+FILES:${PN} = "${nonarch_base_libdir}/firmware"
+
+# This is used to prevent the build system from stripping the firmwares
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
+# This is used to prevent the build system from splitting out the firmware debug info into a separate file
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+# Firmware here are prebuilt with no external dependencies
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Disable arch checking as firmware is likely to be a different arch from the Yocto build
+INSANE_SKIP:${PN} += "arch"
+
+# Firmware has no configure nor build steps
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b1db1dfd..f216efa4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -1,5 +1,3 @@
-SUMMARY = "Common include for TI Linux firmware"
-
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
@@ -32,24 +30,4 @@ SRC_URI = "${TI_LINUX_FW_GIT_URI};protocol=${TI_LINUX_FW_GIT_PROTOCOL};${TI_LINU
 
 S = "${WORKDIR}/git"
 
-CLEANBROKEN = "1"
-
-# Make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
-# This is used to prevent the build system from stripping the firmwares
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
-# This is used to prevent the build system from splitting out the firmware debug info into a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-# Firmware here are prebuilt with no external dependencies
-INHIBIT_DEFAULT_DEPS = "1"
-
-# Disable arch checking as firmware is likely to be a different arch from the Yocto build
-INSANE_SKIP:${PN} += "arch"
-
-# Firmware in Linux Firmware has no configure nor build steps
-do_compile[noexec] = "1"
-do_configure[noexec] = "1"
+require recipes-bsp/ti-linux-fw/firmware-common.inc
diff --git a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
index 3aa69700..c5293a3f 100644
--- a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
@@ -39,26 +39,7 @@ do_install() {
     done
 }
 
-# Make sure that lib/firmware, and all its contents are part of the package
-FILES:${PN} = "${nonarch_base_libdir}/firmware"
-
-# This is used to prevent the build system from stripping the firmwares
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
-# This is used to prevent the build system from splitting out the firmware debug info into a separate file
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-# This is a prebuilt with no external dependencies
-INHIBIT_DEFAULT_DEPS = "1"
-
-# Disable arch checking as firmware is likely to be a different arch from the Yocto build
-INSANE_SKIP:${PN} += "arch"
-
-# Zephyr-Firmware has no configure, compile, nor clean steps
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-CLEANBROKEN = "1"
+require recipes-bsp/ti-linux-fw/firmware-common.inc
 
 inherit update-alternatives
 
-- 
2.39.2


