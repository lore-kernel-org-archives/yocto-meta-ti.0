Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6A4D64085
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 20:29:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2947.1731097731337278419
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 12:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CFWul4aQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8KSnPe008103;
	Fri, 8 Nov 2024 14:28:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731097729;
	bh=pM3EipXPtBAYn9N2ZWpGTyXJDp5u9UhhNXjirTp+bVQ=;
	h=From:To:CC:Subject:Date;
	b=CFWul4aQ73l9wQUv9yGtfbDZJOYVwuaX4/MMat9Ec5MNGjYNFK5N0CAGwOWyYsRuj
	 1Ml4tAVXm4JNmy12RWPnqgm5AhXCqIYUmKQpi6gDJaDZqh45YtltVaYlyf/YdA7OOJ
	 susCCy/ScEY6x2XfkKh+MzN45VkyJrHCooeJwthI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8KSnJO006895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 14:28:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 14:28:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 14:28:49 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8KSnCS041388;
	Fri, 8 Nov 2024 14:28:49 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] ti-ipc-examples: Remove DSP/BIOS IPC examples
Date: Fri, 8 Nov 2024 14:28:48 -0600
Message-ID: <20241108202848.56141-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Nov 2024 20:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18064

This IPC example is no longer supported nor recommended for new designs.
The documentation is no not available either (was on Processors Wiki).
Remove this example.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...Mgr-sys_errlist-has-been-deprecated-.patch | 40 ---------------
 .../ipc/ti-ipc-examples-linux_git.bb          | 49 -------------------
 .../recipes-ti/ipc/ti-ipc-examples.inc        | 31 ------------
 .../recipes-ti/ipc/ti-ipc-examples_git.bb     | 44 -----------------
 4 files changed, 164 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
 delete mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
 delete mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
 delete mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
deleted file mode 100644
index ea514695..00000000
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cca4fd812959a0cd241dd3bbebfd461ece94c9b8 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denis@denix.org>
-Date: Mon, 29 Mar 2021 19:42:00 -0400
-Subject: [PATCH] examples/ClusterMgr: sys_errlist[] has been deprecated in
- glibc
-
-Use strerror() instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- src/examples/templates/ex46_graph/manager/ClusterMgr.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/examples/templates/ex46_graph/manager/ClusterMgr.c b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
-index 19216c9..a1fa679 100644
---- a/src/examples/templates/ex46_graph/manager/ClusterMgr.c
-+++ b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
-@@ -714,7 +714,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
-     pid = fork();
- 
-     if (pid == -1) {
--        LOG "CM_system: fork error: %s\n", sys_errlist[errno] LOGF
-+        LOG "CM_system: fork error: %s\n", strerror(errno) LOGF
-         status = -1;
-         goto leave;
-     }
-@@ -739,7 +739,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
-     else {
-         /* overlay a new executable */
-         execvp(argv[0], argv);
--        LOG "CM_system: execvp error: %s\n", sys_errlist[errno] LOGF
-+        LOG "CM_system: execvp error: %s\n", strerror(errno) LOGF
-         status = -1;
-     }
- 
--- 
-2.7.4
-
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
deleted file mode 100644
index 81706592..00000000
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
-require ti-ipc-examples.inc
-
-SRC_URI += "file://0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch;patchdir=../git/ipc-examples"
-
-DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
-
-do_compile:append() {
-
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
-    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \
-         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    fi
-    oe_runmake -C examples all HOSTOS="linux" \
-      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake -C examples all HOSTOS="linux" \
-        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        PLATFORM="${ALT_PLATFORM}"
-    fi
-  fi
-}
-
-do_install:append() {
-  cd ${S_ipc-examples}/src
-
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
-    # Install directory for linux examples
-    install -d ${D}${bindir}/ipc/examples
-    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples"
-
-    if [ ! -z ${ALT_PLATFORM} ]; then
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
-        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples" \
-        PLATFORM="${ALT_PLATFORM}"
-    fi
-  fi
-}
-
-FILES:${PN} += "${bindir}/*"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
deleted file mode 100644
index 09352505..00000000
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:IPC"
-require recipes-ti/ipc/ti-ipc-common.inc
-require ti-ipc-rtos.inc
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
-
-INSANE_SKIP:${PN} += "arch"
-
-ALLOW_EMPTY:${PN} = "1"
-
-IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
-
-do_compile() {
-
-  cd ${S_ipc-examples}/src
-  oe_runmake .examples \
-    IPCTOOLS="${S_ipc-metadata}/src/etc"
-
-  for alt_platform in ${ALT_PLATFORM}; do
-    oe_runmake .examples "PLATFORM=${alt_platform}" \
-      IPCTOOLS="${S_ipc-metadata}/src/etc"
-  done
-}
-
-do_install() {
-  cd ${S_ipc-examples}/src
-  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
-}
-
-INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
deleted file mode 100644
index bcc8674e..00000000
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running linux"
-require ti-ipc-examples.inc
-
-DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
-
-do_compile:append() {
-
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
-    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-
-    for alt_platform in ${ALT_PLATFORM}; do
-      oe_runmake extract PLATFORM="${alt_platform}" HOSTOS="bios" \
-         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    done
-    oe_runmake -C examples all HOSTOS="bios" \
-      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
-    for alt_platform in ${ALT_PLATFORM}; do
-      oe_runmake -C examples all HOSTOS="bios" \
-        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${alt_platform}"
-    done
-  fi
-}
-
-do_install:append() {
-  if [  "${PLATFORM}" != "UNKNOWN" ]; then
-    # Install directory for bios examples
-    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
-    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
-    oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
-
-    for alt_platform in ${ALT_PLATFORM}; do
-      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
-        PLATFORM="${alt_platform}"
-      oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
-        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
-        PLATFORM="${alt_platform}"
-    done
-  fi
-}
-
-FILES:${PN} += "ipc_*"
-- 
2.39.2


