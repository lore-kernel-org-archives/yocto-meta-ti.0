Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5427.1589597117169868439
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2020 19:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3810640C20;
	Sat, 16 May 2020 02:45:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeAy7bBUPGH9; Sat, 16 May 2020 02:45:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 14EAD40A9E;
	Sat, 16 May 2020 02:45:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 55E0D1730D6;
	Fri, 15 May 2020 22:45:14 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-sci-fw: introduce recipe to package sources for MAINMACHINE
Date: Fri, 15 May 2020 22:45:12 -0400
Message-Id: <1589597112-44311-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

ti-sci-fw builds multiple config variants via multiconfig and the number
is expected to grow. Provide a recipe to package a single set of sources
for MAINMACHINE.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb | 45 +++++++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb        | 17 +--------
 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc       | 16 ++++++++
 3 files changed, 62 insertions(+), 16 deletions(-)
 create mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb
 create mode 100644 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb
new file mode 100644
index 0000000..becf893
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb
@@ -0,0 +1,45 @@
+# ti-sci-fw builds and packages multiple config variants via multiconfig
+# Let's take a page from gcc-source as a common recipe for all gcc stages,
+# but also to provide a single package for MAINMACHINE of all multiconfigs
+
+require recipes-bsp/ti-sci-fw/ti-sci-fw_${PV}.inc
+
+SUMMARY += "- sources"
+
+COMPATIBLE_MACHINE = "k3"
+
+EXCLUDE_FROM_WORLD = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = ""
+
+PACKAGES = "${PN}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+SRCIPK_SRC_DIR = "${WORKDIR}/imggen"
+SRCIPK_INSTALL_DIR = "board-support/k3-image-gen-${PV}"
+FILES_${PN} = "${SRCIPK_INSTALL_DIR}"
+
+do_install() {
+    # Copy sources for packaging
+    mkdir -p ${D}/${SRCIPK_INSTALL_DIR}
+    if [ -e ${SRCIPK_SRC_DIR} ]; then
+        if [ "${SRCIPK_SRC_DIR}" = "${WORKDIR}" ]; then
+            excludes='--exclude ./temp --exclude ${D}'
+        fi
+        tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C ${D}/${SRCIPK_INSTALL_DIR} -xpf -
+    fi
+
+    # Fix up patches/ directory to contain actual patches instead of symlinks
+    if [ -e ${D}/${SRCIPK_INSTALL_DIR}/patches ]
+    then
+        mv ${D}/${SRCIPK_INSTALL_DIR}/patches ${D}/${SRCIPK_INSTALL_DIR}/patches-links
+        cp -rL ${D}/${SRCIPK_INSTALL_DIR}/patches-links ${D}/${SRCIPK_INSTALL_DIR}/patches
+        rm -rf ${D}/${SRCIPK_INSTALL_DIR}/patches-links
+    fi
+}
+
+# Do not perform any QA checks on source package
+INSANE_SKIP_${PN} += "${ALL_QA}"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
index add4ee9..b558826 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
@@ -1,7 +1,4 @@
-SUMMARY = "TI SCI firmware (SYSFW)"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+require recipes-bsp/ti-sci-fw/ti-sci-fw_${PV}.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 
@@ -17,18 +14,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
-BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "a7d3909ed8ae23a7c90f7ef821713a8b0c3c061d"
-SRCREV_FORMAT = "imggen"
-
-SRC_URI = " \
-	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
-"
-
-S = "${WORKDIR}/git"
-
 SYSFW_SOC ?= "unknown"
 SYSFW_CONFIG ?= "unknown"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc
new file mode 100644
index 0000000..429d077
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc
@@ -0,0 +1,16 @@
+SUMMARY = "TI SCI firmware (SYSFW)"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
+BRANCH ?= "ti-linux-firmware"
+SRCREV_imggen = "a7d3909ed8ae23a7c90f7ef821713a8b0c3c061d"
+SRCREV_FORMAT = "imggen"
+
+SRC_URI = " \
+	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+"
+
+S = "${WORKDIR}/git"
-- 
2.7.4

