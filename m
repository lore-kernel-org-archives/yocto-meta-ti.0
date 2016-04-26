Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 461E0E00D3B; Tue, 26 Apr 2016 11:56:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E52AEE00D19
	for <meta-ti@yoctoproject.org>; Tue, 26 Apr 2016 11:56:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E816529BF; Tue, 26 Apr 2016 18:56:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160426185600.0E816529BF@arago-project.org>
Date: Tue, 26 Apr 2016 18:56:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ipc-transport-rtos: Add RTOS packages for IPC transports
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
X-List-Received-Date: Tue, 26 Apr 2016 18:56:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: bc7adf6d7ac984050672adccb8b99e20b141394e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bc7adf6d7ac984050672adccb8b99e20b141394e

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Apr 21 02:19:43 2016 +0000

ipc-transport-rtos: Add RTOS packages for IPC transports

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ipc-transport-common-rtos_git.bb |   23 +++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb   |   25 +++++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb   |   24 ++++++++++++++++++++++
 3 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-common-rtos_git.bb b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
new file mode 100644
index 0000000..199e84c
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-common-rtos_git.bb
@@ -0,0 +1,23 @@
+require recipes-ti/includes/ti-paths.inc
+require ipc-transport.inc
+
+PR = "${INC_PR}.1"
+
+LIC_FILES_CHKSUM = "file://common_src/bench_common.h;beginline=1;endline=31;md5=a6ddfb26d2097041d513e3881f40e4e8"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+
+IPC_TRANSPORT_COMMON_DESTSUFFIX = "git/c66/example"
+
+S = "${WORKDIR}/${IPC_TRANSPORT_COMMON_DESTSUFFIX}"
+
+do_compile() {
+    :
+}
+
+do_install () {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example
+    cp -r ${S} ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/ti/transport/ipc/c66/example/*"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
new file mode 100644
index 0000000..0631a92
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -0,0 +1,25 @@
+inherit ti-pdk
+require ipc-transport.inc
+
+PR = "${INC_PR}.4"
+
+LIC_FILES_CHKSUM = "file://TransportQmss.xdc;beginline=1;endline=35;md5=ad783760d74a4cc5b8d4ad3d8a1f28a2"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
+
+DEPENDS_append = " qmss-lld-rtos \
+                   cppi-lld-rtos \
+                   ti-ipc-rtos \
+                   ipc-transport-common-rtos \
+"
+
+IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
+
+S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2l-evm = "k2l"
+
+export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
+XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
new file mode 100644
index 0000000..6ea3fb9
--- /dev/null
+++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
@@ -0,0 +1,24 @@
+inherit ti-pdk
+require ipc-transport.inc
+
+PR = "${INC_PR}.2"
+
+LIC_FILES_CHKSUM = "file://TransportSrio.xdc;beginline=1;endline=35;md5=4d466471e4b933a0cc353a46bb546fe7"
+
+COMPATIBLE_MACHINE = "k2hk-evm"
+
+DEPENDS_append = " qmss-lld-rtos \
+                   cppi-lld-rtos \
+                   srio-lld-rtos \
+                   ti-ipc-rtos \
+                   ipc-transport-common-rtos \
+"
+
+IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
+
+S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+
+export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
+XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"


