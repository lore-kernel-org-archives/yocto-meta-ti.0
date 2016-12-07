Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D0DFE00CE0; Tue,  6 Dec 2016 16:47:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46081E00CD5
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2016 16:47:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6C6C152ACC; Wed,  7 Dec 2016 00:47:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161207004718.6C6C152ACC@arago-project.org>
Date: Wed,  7 Dec 2016 00:47:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Add recipe to build ipc-examples
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
X-List-Received-Date: Wed, 07 Dec 2016 00:47:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c8ac370ef68a26efe182185268efef3219d49508
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c8ac370ef68a26efe182185268efef3219d49508

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Nov 30 03:35:15 2016 +0000

ti-ipc: Add recipe to build ipc-examples

Builds both linux and RTOS IPC examples
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-examples_git.bb |   86 +++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

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


