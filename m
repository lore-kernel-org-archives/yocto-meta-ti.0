Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0D91E00C7D; Mon, 24 Oct 2016 19:29:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC4D0E009DF
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2016 19:29:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 07B2352ABE; Tue, 25 Oct 2016 02:29:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025022933.07B2352ABE@arago-project.org>
Date: Tue, 25 Oct 2016 02:29:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : multiprocmgr: add systemd service
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
X-List-Received-Date: Tue, 25 Oct 2016 02:29:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 1b06fd0938ebfc45d18c86b09de23129f1505db4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1b06fd0938ebfc45d18c86b09de23129f1505db4

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Oct 10 20:55:36 2016 +0000

multiprocmgr: add systemd service

* The multiprocmgr's mpmsrv daemon requires a set of kernel modules to
  be loaded prior to initialization.
* Add a systemd service so that these dependencies may be specified.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../multiprocmgr/mpmsrv-daemon.service             |   14 ++++++++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb        |   19 +++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service b/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
new file mode 100644
index 0000000..40eb465
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr/mpmsrv-daemon.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=TI Multiproc Manager
+
+[Service]
+ExecStartPre=/sbin/modprobe keystone_remoteproc
+ExecStartPre=/sbin/modprobe keystone_dsp_mem
+ExecStartPre=/sbin/modprobe uio_module_drv
+
+Type=forking
+PIDFile=/var/run/mpm/pid
+ExecStart=/usr/bin/mpmsrv
+
+[Install]
+WantedBy=basic.target
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 38d4ceb..2960ee3 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,7 +3,9 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-PR = "${INC_PR}.0"
+SRC_URI_append = " file://mpmsrv-daemon.service"
+
+PR = "${INC_PR}.1"
 
 DEPENDS = "mpm-transport libdaemon virtual/kernel"
 RDEPENDS_${PN} = "syslog-ng"
@@ -15,15 +17,24 @@ CC += "-I${STAGING_KERNEL_DIR}/include"
 INITSCRIPT_NAME = "mpmsrv-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-inherit update-rc.d
+SYSTEMD_SERVICE_${PN} = "mpmsrv-daemon.service"
+
+inherit update-rc.d systemd
 
 do_install() {
 	install -d ${D}${bindir}/
 	install -c -m 755 ${S}/bin/mpmsrv ${D}${bindir}/mpmsrv
 	install -c -m 755 ${S}/bin/mpmcl ${D}${bindir}/mpmcl
 
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}
+	if [ ${systemd_enabled} -eq 1 ]
+	then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/mpmsrv-daemon.service ${D}${systemd_system_unitdir}
+	else
+		install -d ${D}${sysconfdir}/init.d/
+		install -c -m 755 ${S}/scripts/mpmsrv-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+	fi
 	install -d ${D}${sysconfdir}/mpm/
 	install -c -m 755 ${S}/scripts/crash_callback.sh ${D}${sysconfdir}/mpm/crash_callback.sh
 


