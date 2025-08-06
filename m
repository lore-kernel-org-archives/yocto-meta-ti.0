Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFE8C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:04:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.30543.1754499889185300353
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QWweKp3y;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576H4mXN169160;
	Wed, 6 Aug 2025 12:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754499888;
	bh=j1OzyolG547hh0QnLRfVlvkP9msZrVissUj6CHKg1a0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QWweKp3yT65DfA3Xwrrla+/PidMpIs/AJU4N8xMvlfPjT3qjz1DA2dLZu7OqRAx9F
	 oa3khy8Vw4lS5aF8QowAxd/t5DO54K99cwchJAWrRYnoAsZ1NUxzaMAc58jkIo4o5n
	 5ey8jkBZbeuDDYQr0FlRJziRsp3bRzAArNh5l4xk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576H4m2f3715317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:04:48 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:04:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:04:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576H4gP53869168;
	Wed, 6 Aug 2025 12:04:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2 1/5] ti-ipc-examples-linux: Add a recipe to build messageq app_host
Date: Wed, 6 Aug 2025 22:34:38 +0530
Message-ID: <20250806170442.243461-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806170442.243461-1-b-padhi@ti.com>
References: <20250806170442.243461-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18897

Add a recipe to build the Application Host (for A15 core) to demonstrate
IPC with remote processors through messageq firmware. Also package this
in the /usr/bin directory for testing IPC. This recipe only builds the
app_host, and the firmwares are available in ti-linux-firmware
repository.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../ipc/ti-ipc-examples-linux_git.bb          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
new file mode 100644
index 00000000..3a64409e
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "TI Inter Processor Communication (IPC) MessageQ Application for
+Linux Host"
+
+require recipes-ti/ipc/ti-ipc-common.inc
+require ti-ipc-rtos.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
+
+INSANE_SKIP:${PN} += "arch"
+
+IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+INHIBIT_PACKAGE_STRIP = "1"
+
+DEPENDS = "ti-ipc ti-ipc-rtos ti-xdctools-native zip-native"
+
+EX02_PATH = "examples/DRA7XX_linux_elf/ex02_messageq/host"
+
+do_compile() {
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  for alt_platform in ${ALT_PLATFORM}; do
+    oe_runmake .examples "PLATFORM=${alt_platform}" \
+      IPCTOOLS="${S_ipc-metadata}/src/etc"
+  done
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    fi
+    oe_runmake -C ${EX02_PATH} all HOSTOS="linux" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C ${EX02_PATH} all HOSTOS="linux" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+do_install() {
+  cd ${S_ipc-examples}/src
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for linux examples
+    install -d ${D}${bindir}/ipc/examples/ex02_messageq
+    oe_runmake -C ${EX02_PATH} install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples/ex02_messageq"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C ${EX02_PATH} install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples/ex02_messageq" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+FILES:${PN} += "${bindir}/*"
-- 
2.34.1


