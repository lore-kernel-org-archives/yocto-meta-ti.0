Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.116847.1597946484400060987
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D2FFD40B2D;
	Thu, 20 Aug 2020 18:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xC1WutoWhs2Y; Thu, 20 Aug 2020 18:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B70AE40C28;
	Thu, 20 Aug 2020 18:01:22 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6CF74174469;
	Thu, 20 Aug 2020 14:01:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH v2 3/3] ti-rtos-firmware: add recipe for RTOS FW binary integration
Date: Thu, 20 Aug 2020 14:01:16 -0400
Message-Id: <1597946476-11345-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597946476-11345-1-git-send-email-denis@denix.org>
References: <1597946476-11345-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - make use of file prefix and suffix more generic for nightlies

 recipes-ti/ti-rtos-bin/files/empty         |  1 +
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 76 ++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-ti/ti-rtos-bin/files/empty
 create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb

diff --git a/recipes-ti/ti-rtos-bin/files/empty b/recipes-ti/ti-rtos-bin/files/empty
new file mode 100644
index 0000000..c6cac69
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/files/empty
@@ -0,0 +1 @@
+empty
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
new file mode 100644
index 0000000..9bfbe74
--- /dev/null
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -0,0 +1,76 @@
+SUMMARY = "TI RTOS prebuilt binary firmware images"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-ti/licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit deploy
+
+# First, let's try including metadata.inc that could be fetched and deployed
+# by ti-rtos-metadata earlier and provide new set of CORESDK_RTOS_* variables
+include ${DEPLOY_DIR_IMAGE}/metadata.inc
+
+# Set some defaults for when metadata.inc is not available
+DEFAULT_RTOS_FAMILY = "jacinto"
+DEFAULT_RTOS_VERSION = "07_01_00_02"
+DEFAULT_RTOS_VERSION_DOT = "07.01.00.02"
+
+DEFAULT_RTOS_SOC = "undefined"
+DEFAULT_RTOS_SOC_j7 = "j721e"
+DEFAULT_RTOS_SOC_j7200-evm = "j7200"
+DEFAULT_RTOS_SOC_am65xx = "am65xx"
+
+DEFAULT_RTOS_WEBLINK = "undefined"
+DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
+DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
+
+DEFAULT_FIRMWARE_FILE = "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
+
+DEFAULT_FIRMWARE_URL = "file://empty"
+DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
+
+DEFAULT_FIRMWARE_SHA256SUM = "unknown"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "e1e2eb0086a28468f1bb4b796571dcf1bfa23aedbb092bd02227e777a078afe3"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "218e51739c53e306cc61bbb705b3d8eeae3afb63869f2aa82a4c804f7847bd63"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "37188564fbb8420ba9dadb74ecf05b3aac2bf39a0e72c18c23272a141e69ace7"
+
+# Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
+CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
+CORESDK_RTOS_VERSION ?= "${DEFAULT_RTOS_VERSION}"
+CORESDK_RTOS_VERSION_DOT ?= "${DEFAULT_RTOS_VERSION_DOT}"
+CORESDK_RTOS_SOC ?= "${DEFAULT_RTOS_SOC}"
+CORESDK_RTOS_WEBLINK ?= "${DEFAULT_RTOS_WEBLINK}"
+CORESDK_RTOS_FIRMWARE_URL ?= "${DEFAULT_FIRMWARE_URL}"
+CORESDK_RTOS_FIRMWARE_SHA256SUM ?= "${DEFAULT_FIRMWARE_SHA256SUM}"
+CORESDK_RTOS_FILE_PREFIX ?= ""
+CORESDK_RTOS_FILE_SUFFIX ?= ""
+
+# Common code below
+S = "${WORKDIR}/lib/"
+
+PV = "${CORESDK_RTOS_VERSION_DOT}"
+
+SRC_URI = "${CORESDK_RTOS_FIRMWARE_URL}${CORESDK_RTOS_FILE_SUFFIX}"
+SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
+
+FILES_${PN} += "${base_libdir}"
+
+do_install() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+	install -d ${D}${base_libdir}
+	cp ${CP_ARGS} ${S} ${D}
+}
+
+FILES_${PN} = "${base_libdir}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_${PN} += "arch"
+
+do_compile[noexec] = "1"
+do_configure[noexec] = "1"
-- 
2.7.4

