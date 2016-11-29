Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6A77E00503; Tue, 29 Nov 2016 13:35:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67860E0049F
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2016 13:35:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uATLZGdu006470
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2016 15:35:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uATLZG09004398
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2016 15:35:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 15:35:15 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uATLZFpY024522;	Tue, 29 Nov 2016 15:35:15 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 29 Nov 2016 16:35:15 -0500
Message-ID: <1480455315-33552-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Add recipe to build ipc-examples
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2016 21:35:20 -0000
Content-Type: text/plain

Builds both linux and RTOS IPC examples
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-examples_git.bb | 86 +++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-ipc-examples_git.bb

diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
new file mode 100644
index 0000000..019bffa
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -0,0 +1,86 @@
+DESCRIPTION = "TI Inter Process Communication (IPC) examples"
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+require ti-ipc-common.inc
+require ti-ipc-rtos.inc
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed568a6005c8f02"
+
+DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+
+INSANE_SKIP_${PN} += "arch"
+
+ALLOW_EMPTY_${PN} = "1"
+
+IPC_INSTALL_DIR="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
+
+do_compile() {
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  if [ ! -z ${ALT_PLATFORM} ]; then
+    oe_runmake .examples "PLATFORM=${ALT_PLATFORM}" \
+      IPCTOOLS="${S_ipc-metadata}/src/etc"
+	echo test
+  fi
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="bios" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \ 
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    fi
+    oe_runmake -C examples all HOSTOS="bios" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" 
+    oe_runmake -C examples all HOSTOS="linux" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" 
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples all HOSTOS="bios" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${ALT_PLATFORM}" 
+      oe_runmake -C examples all HOSTOS="linux" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        PLATFORM="${ALT_PLATFORM}" 
+      echo testing
+    fi
+  fi
+}
+
+do_install() {
+  cd ${S_ipc-examples}/src
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+
+  install -d ${D}/ipc_${IPC_VERSION}/examples
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+    oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+      HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples"
+
+    if [ ! -z ${ALT_PLATFORM} ]; then
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \ 
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        PLATFORM="${ALT_PLATFORM}"
+      oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        PLATFORM="${ALT_PLATFORM}"
+
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
+        HOSTOS="linux" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples" \
+        PLATFORM="${ALT_PLATFORM}"
+    fi
+  fi
+}
+
+FILES_${PN} += "ipc_*"
-- 
1.9.1


