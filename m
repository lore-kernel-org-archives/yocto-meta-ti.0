Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FA7C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 21:32:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7197.1711143137912326227
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 22 Mar 2024 14:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cewV3RCv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42MLWGQS077523;
	Fri, 22 Mar 2024 16:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711143136;
	bh=mWllKE6DSGtqdrBz2bf9CoQfqlfvDSI8wpyrojEV8Xc=;
	h=From:To:CC:Subject:Date;
	b=cewV3RCv3lVaovX2q0zwvufh7kZrnfZJ7nR5tAiaPi8aFAlN1dza7YdtJuHOwFm/g
	 qJ6H+gP8okk8nCoxWWFOCIpav/LSBcyiOmlZdccmnZfdyg8c8JIJFDkaI9YVUoiUP8
	 i5AbpMH6WTwadAYEH0O5KKl1XVJLm12TksMy0p0Y=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42MLWG8m043296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Mar 2024 16:32:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Mar 2024 16:32:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Mar 2024 16:32:15 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42MLWFN7060803;
	Fri, 22 Mar 2024 16:32:15 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] meta-ti-bsp: Add Zephyr RTOS example firmware
Date: Fri, 22 Mar 2024 16:32:14 -0500
Message-ID: <20240322213214.78886-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Mar 2024 21:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17549

Like the current TI-RTOS/MCU+ firmware, this is a prebuilt example
firmware for TI K3 remote cores. It is an alternative to the echo test
demo currently provided by "ti-rtos-firmware" recipe. In addition to
supporting rpmsg_client_sample just as the current firmware does, it
also provides:

 * A serial console with shell on the MCU UART port
 * A console over RPMSG at /dev/ttyRPMSG0
 * Example usage of the MCU GPIO/I2C/SPI from this shell
 * And many other Zephyr default enabled features..

It does all this using the Zephyr RTOS, a scalable real-time operating
system, optimized for resource constrained devices, and built with
security in mind. Zephyr is a Linux Foundation project. For more
info see here[0][1].

Zephyr firmware like this can also be built as part of the Yocto build
using meta-zephyr. Although this is a prebuilt currently, we intend
to build this from source to reduce meta-ti's dependence on firmware
blobs.

This currently works with the AM62 M4F. Support for additional SoCs
and cores is in progress.

[0] https://www.zephyrproject.org/
[1] https://docs.zephyrproject.org/latest/introduction/index.html

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../zephyr-fw/zephyr-openamp-rsc-table-fw.bb  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb

diff --git a/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
new file mode 100644
index 00000000..4efc99ac
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/zephyr-fw/zephyr-openamp-rsc-table-fw.bb
@@ -0,0 +1,83 @@
+SUMMARY = "Precompiled Zephyr OpenAMP example firmware for TI K3 devices"
+
+# Name of this demo's firmware
+FW_NAME = "zephyr_openamp_rsc_table.elf"
+
+# List of cores for which this demo has a build
+FW_CORES        = ""
+FW_CORES:am62xx = "mcu-m4f0_0"
+
+# Note: Everything below is common to all our Zephyr firmwares and can be
+#       factored out to a common include file once we have more than one demo
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "git://github.com/glneo/zephyr-firmware.git;protocol=https;branch=main"
+SRCREV = "146d4f9b3930722d73685d600958f0b10ea97de2"
+PV = "3.6.0"
+#PR = "r1"
+
+S = "${WORKDIR}/git"
+
+FW_PLAT = ""
+FW_PLAT:am62xx = "am62"
+
+FW_INSTALL_DIR = "${nonarch_base_libdir}/firmware/zephyr/${FW_PLAT}"
+
+do_install() {
+    for FW_CORE in ${FW_CORES}
+    do
+        install -d ${D}${FW_INSTALL_DIR}/${FW_CORE}
+        install -m 0644 ${S}/${FW_PLAT}/${FW_CORE}/${FW_NAME} ${D}${FW_INSTALL_DIR}/${FW_CORE}
+    done
+}
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
+# This is a prebuilt with no external dependencies
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Disable arch checking as firmware is likely to be a different arch from the Yocto build
+INSANE_SKIP:${PN} += "arch"
+
+# Zephyr-Firmware has no configure, compile, nor clean steps
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+CLEANBROKEN = "1"
+
+inherit update-alternatives
+
+python fw_generate_alternatives() {
+    for fw_core_name in d.getVar('FW_CORES').split():
+        fw_plat = d.getVar('FW_PLAT')
+        fw_pkg_name = d.getVar('PN')
+        fw_core_name_full = (fw_plat + "-" + fw_core_name + "-fw")
+
+        # Create the firmware alternatives
+        d.appendVar('ALTERNATIVE:%s' % fw_pkg_name, (fw_core_name_full + " "))
+
+        # Set up firmware alternatives link names
+        fw_alt_link = ("${nonarch_base_libdir}/firmware/" + fw_core_name_full)
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', fw_core_name_full, fw_alt_link)
+
+        # Set up firmware alternatives link targets
+        fw_alt_target_rename = "${FW_INSTALL_DIR}/" + fw_core_name + "/${FW_NAME}"
+        d.setVarFlag('ALTERNATIVE_TARGET_%s' % fw_pkg_name, fw_core_name_full, fw_alt_target_rename)
+}
+
+do_package[prefuncs] += "fw_generate_alternatives"
+
+ALTERNATIVE_PRIORITY = "20"
-- 
2.39.2


