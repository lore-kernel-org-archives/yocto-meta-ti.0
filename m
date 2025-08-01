Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CCEC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:00:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.89968.1754060445815505843
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LveUPzwp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571F0hiu3707483;
	Fri, 1 Aug 2025 10:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754060443;
	bh=7dyeNgGBu5Gd7nwIgtltTbjEvLNG/ag8/2cpRKobDp0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LveUPzwpiNpz98tBmBvWdFr36inTuQ5+nN2qkmBUKDxVIdFzpTLWkd94UR+1Usul6
	 8rUi9Fp/GftUTYVp6GJ4gBIWOu2W5aGraH2OEvmnSq7p1lX/d8Nw2OQjgXpfNxGtZM
	 foB9Z1YWPc13Q93+r+bqUV2fGIENxjIUhujztpFM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571F0grY621669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 10:00:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 10:00:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 10:00:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571F0bWR256132;
	Fri, 1 Aug 2025 10:00:40 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 1/5] Revert "ti-ipc-examples: Remove DSP/BIOS IPC examples"
Date: Fri, 1 Aug 2025 20:30:33 +0530
Message-ID: <20250801150037.2650736-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150037.2650736-1-b-padhi@ti.com>
References: <20250801150037.2650736-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18879

This reverts commit 9c8eec8733ec65f8692277982085bf3f2a7a83fa.

The DSP/BIOS IPC firmware examples are helpful to test ping-pong IPC
functionalities. Add them back.
---
 ...Mgr-sys_errlist-has-been-deprecated-.patch | 40 +++++++++++++++
 .../ipc/ti-ipc-examples-linux_git.bb          | 49 +++++++++++++++++++
 .../recipes-ti/ipc/ti-ipc-examples.inc        | 31 ++++++++++++
 .../recipes-ti/ipc/ti-ipc-examples_git.bb     | 44 +++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
new file mode 100644
index 00000000..ea514695
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
@@ -0,0 +1,40 @@
+From cca4fd812959a0cd241dd3bbebfd461ece94c9b8 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denis@denix.org>
+Date: Mon, 29 Mar 2021 19:42:00 -0400
+Subject: [PATCH] examples/ClusterMgr: sys_errlist[] has been deprecated in
+ glibc
+
+Use strerror() instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+---
+ src/examples/templates/ex46_graph/manager/ClusterMgr.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/examples/templates/ex46_graph/manager/ClusterMgr.c b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
+index 19216c9..a1fa679 100644
+--- a/src/examples/templates/ex46_graph/manager/ClusterMgr.c
++++ b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
+@@ -714,7 +714,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
+     pid = fork();
+ 
+     if (pid == -1) {
+-        LOG "CM_system: fork error: %s\n", sys_errlist[errno] LOGF
++        LOG "CM_system: fork error: %s\n", strerror(errno) LOGF
+         status = -1;
+         goto leave;
+     }
+@@ -739,7 +739,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
+     else {
+         /* overlay a new executable */
+         execvp(argv[0], argv);
+-        LOG "CM_system: execvp error: %s\n", sys_errlist[errno] LOGF
++        LOG "CM_system: execvp error: %s\n", strerror(errno) LOGF
+         status = -1;
+     }
+ 
+-- 
+2.7.4
+
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
new file mode 100644
index 00000000..81706592
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
+require ti-ipc-examples.inc
+
+SRC_URI += "file://0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch;patchdir=../git/ipc-examples"
+
+DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
+
+do_compile:append() {
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    fi
+    oe_runmake -C examples all HOSTOS="linux" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples all HOSTOS="linux" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+do_install:append() {
+  cd ${S_ipc-examples}/src
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for linux examples
+    install -d ${D}${bindir}/ipc/examples
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+FILES:${PN} += "${bindir}/*"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
new file mode 100644
index 00000000..09352505
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
@@ -0,0 +1,31 @@
+HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
+require recipes-ti/ipc/ti-ipc-common.inc
+require ti-ipc-rtos.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
+
+INSANE_SKIP:${PN} += "arch"
+
+ALLOW_EMPTY:${PN} = "1"
+
+IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+
+do_compile() {
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  for alt_platform in ${ALT_PLATFORM}; do
+    oe_runmake .examples "PLATFORM=${alt_platform}" \
+      IPCTOOLS="${S_ipc-metadata}/src/etc"
+  done
+}
+
+do_install() {
+  cd ${S_ipc-examples}/src
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
new file mode 100644
index 00000000..bcc8674e
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running linux"
+require ti-ipc-examples.inc
+
+DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
+
+do_compile:append() {
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake extract PLATFORM="${alt_platform}" HOSTOS="bios" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    done
+    oe_runmake -C examples all HOSTOS="bios" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake -C examples all HOSTOS="bios" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${alt_platform}"
+    done
+  fi
+}
+
+do_install:append() {
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for bios examples
+    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
+    oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
+
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
+      oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
+    done
+  fi
+}
+
+FILES:${PN} += "ipc_*"
-- 
2.34.1


