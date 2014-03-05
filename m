Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B495BE00A21
	for <meta-ti@yoctoproject.org>; Tue,  4 Mar 2014 20:55:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C59B6529A1; Wed,  5 Mar 2014 04:55:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140305045512.C59B6529A1@arago-project.org>
Date: Wed,  5 Mar 2014 04:55:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Add recipe for ti-ipc version 3.0.x
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
X-List-Received-Date: Wed, 05 Mar 2014 04:55:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d2c9c3b981fc900b0e78fb98ff45d0fa7661910e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d2c9c3b981fc900b0e78fb98ff45d0fa7661910e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 12 05:41:49 2014 +0000

ti-ipc: Add recipe for ti-ipc version 3.0.x

- Supports communication between processors in TI keystone architecture

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/files/tiipclad-daemon.sh |   24 ++++++++++++++
 recipes-ti/ipc/ti-ipc_3.00.00.bb        |   52 +++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)

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
index 0000000..c07b7f9
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc_3.00.00.bb
@@ -0,0 +1,52 @@
+DESCRIPTION="This support the communication between processors \
+in a multi-processor environment and communication to peripherals. \
+This communication includes message passing, streams, and linked lists. \
+These modules work transparently in both uni-processor and multi-processor \
+configurations."
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
+SRC_URI = " \
+    git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
+    file://tiipclad-daemon.sh"
+
+S = "${WORKDIR}/git"
+
+export PLATFORM = "${TARGET_PLATFORM}"
+
+export PARALLEL_MAKE = ""
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = " \
+    ${bindir}/NameServerApp \
+    ${bindir}/MessageQApp \
+    ${bindir}/MessageQMulti \
+    ${bindir}/ping_rpmsg"
+
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


