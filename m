Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DA1CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:24:12 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10513.1755599037483470914
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 03:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TaVAcXB6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JANuNW2874529;
	Tue, 19 Aug 2025 05:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755599036;
	bh=eQmC5ptPHGyPlTZO6q1CkKmyX0oXLXkOJLAzQzF0IGU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TaVAcXB6H0i3q63HHFeBcy7zd4RBmfOM17sbXemFlzsyxz/YdMoWj1yfxME6nMLWz
	 pUMKHlCeAS4/lfCVRzFoCH/m+N0OUfYnf2AcATQWUlRwg/ICLK4LpdO/2NYO0mg9D5
	 4nYcbQ1/xcPORz97UNhs/TFBW0iRtpojCo7BCuNM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JANu66337124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:23:56 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:23:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:23:55 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JANpHJ2850983;
	Tue, 19 Aug 2025 05:23:54 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v3 1/3] ti-ipc-examples-linux: Add a recipe to build messageq app_host
Date: Tue, 19 Aug 2025 15:53:48 +0530
Message-ID: <20250819102350.2915102-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819102350.2915102-1-b-padhi@ti.com>
References: <20250819102350.2915102-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 10:24:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18937

Add a recipe to build the Application Host (for A15 core) to demonstrate
IPC with remote processors through messageq firmware. Also package this
in the /usr/bin directory for testing IPC. This recipe only builds the
app_host, and the firmwares are available in ti-linux-firmware
repository.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../ipc/ti-ipc-examples-linux_git.bb          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
new file mode 100644
index 00000000..0b6c01fe
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "TI Inter Processor Communication (IPC) MessageQ Application for Linux Host"
+
+require recipes-ti/ipc/ti-ipc-common.inc
+require ti-ipc-rtos.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
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


