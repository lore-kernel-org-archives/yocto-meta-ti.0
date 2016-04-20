Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6732AE00EF2; Wed, 20 Apr 2016 13:21:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99657E00E80
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 13:19:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KKJksW003088
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 15:19:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KKJkcS020870
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 15:19:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 15:19:45 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3KKJixE001456;	Wed, 20 Apr 2016 15:19:46 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Apr 2016 16:19:43 -0400
Message-ID: <1461183583-1601-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1461183583-1601-1-git-send-email-jsobota@ti.com>
References: <1461183583-1601-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/fido][PATCH V2 2/2] ipc-transport-rtos: Add RTOS packages for IPC transports
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
X-List-Received-Date: Wed, 20 Apr 2016 20:21:28 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb |   23 +++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb   |   25 +++++++++++++++++++++++
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb   |   24 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 recipes-ti/ipc/ipc-transport-common-rtos_git.bb
 create mode 100644 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
 create mode 100644 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb

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
-- 
1.7.10.4


