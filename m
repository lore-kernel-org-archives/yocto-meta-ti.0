Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8728DE00764
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 15:41:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1BNfohX000341
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 17:41:50 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1BNfo1W025430
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 17:41:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Feb 2014 17:41:50 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1BNfoFD023250;	Tue, 11 Feb 2014 17:41:50 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 11 Feb 2014 18:41:49 -0500
Message-ID: <1392162109-31241-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Add recipe for ti-ipc version 3.0.x
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
X-List-Received-Date: Tue, 11 Feb 2014 23:41:54 -0000
Content-Type: text/plain

- Supports communication between processors in TI keystone architecture

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/files/tiipclad-daemon.sh |   24 ++++++++++++++++
 recipes-ti/ipc/ti-ipc_3.00.00.bb        |   48 +++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100755 recipes-ti/ipc/files/tiipclad-daemon.sh
 create mode 100644 recipes-ti/ipc/ti-ipc_3.00.00.bb

diff --git a/recipes-ti/ipc/files/tiipclad-daemon.sh b/recipes-ti/ipc/files/tiipclad-daemon.sh
new file mode 100755
index 0000000..54b3888
--- /dev/null
+++ b/recipes-ti/ipc/files/tiipclad-daemon.sh
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+tiipclad_daemon=/usr/bin/lad_tci6638
+tiipclad_params=lad.txt
+
+test -x "$tiipclad_daemon" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting tiipclad daemon"
+    start-stop-daemon --start --quiet --exec $tiipclad_daemon $tiipclad_params
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping tiipclad daemon"
+    start-stop-daemon --stop --quiet --pidfile /var/run/tiipclad.pid
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/tiipclad-daemon.sh {start|stop}"
+    exit 1
+esac
+
+exit 0
diff --git a/recipes-ti/ipc/ti-ipc_3.00.00.bb b/recipes-ti/ipc/ti-ipc_3.00.00.bb
new file mode 100644
index 0000000..3278fe9
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_3.00.00.bb
@@ -0,0 +1,48 @@
+DESCRIPTION="This support the communication between processors \
+			in a multi-processor environment and communication to peripherals. \
+            This communication includes message passing, streams, and linked lists. \
+            These modules work transparently in both uni-processor and multi-processor \
+            configurations."
+
+HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://products.mak;beginline=2;endline=30;md5=195feadf798bb4165bcb1a23ffd50dbb"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+TARGET_PLATFORM = "tci6638"
+
+PR = "r0"
+
+BRANCH ?= "master"
+# The following commit corresponds to 3.00.04.29
+SRCREV = "12794ea33870b782bffe1fe4398e86e93fb64396"
+
+SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} file://tiipclad-daemon.sh"
+
+S = "${WORKDIR}/git"
+
+export PLATFORM = "${TARGET_PLATFORM}"
+
+export PARALLEL_MAKE = "-j 1"
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/NameServerApp \
+					${bindir}/MessageQApp \
+					${bindir}/MessageQMulti \
+					${bindir}/ping_rpmsg"
+DEPENDS += "virtual/kernel"
+
+EXTRA_OECONF += "KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR}"
+inherit autotools
+
+INITSCRIPT_NAME = "tiipclad-daemon.sh"
+INITSCRIPT_PARAMS = "defaults 10"
+
+inherit update-rc.d
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
-- 
1.7.9.5


